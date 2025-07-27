"""WebScoket 消费者"""

import json
import logging
from django.core.cache import cache
from django.conf import settings
from channels.generic.websocket import AsyncWebsocketConsumer
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.exceptions import TokenError

logger = logging.getLogger(__name__)


class InfraConsumer(AsyncWebsocketConsumer):
    """基础设施-WebSocket 异步消费者"""

    async def connect(self):
        """当客户端发起 WebSocket 连接时调用"""
        query_params = self.scope["query_string"].decode()
        # 从查询参数获取token
        token_param = [
            param.split("=")
            for param in query_params.split("&")
            if param.startswith("token=")
        ]
        if not token_param or len(token_param[0]) != 2:
            logger.error("缺少token参数")
            await self.close(code=4001)  # 自定义错误码
            return

        token = token_param[0][1]
        try:
            # 验证Refresh Token有效性
            refresh = RefreshToken(token)
            user_id = refresh["user_id"]
            self.scope["user"] = {"id": user_id, "token_type": "refresh"}

            # 登录成功后，将用户通道写入缓存
            cache.set(f"user_{user_id}_channel", self.channel_name)
            # 加入默认组
            self.room_group_name = settings.DEFAULT_GROUP_NAME
            await self.channel_layer.group_add(self.room_group_name, self.channel_name)
            # 接受客户端的WebSocket连接请求
            await self.accept()
        except TokenError as e:
            logger.error("无效token")
            await self.close(code=4003)
        except Exception as e:
            logger.error(str(e))
            await self.close(code=4000)

    async def disconnect(self, close_code):
        """当客户端断开 WebSocket 连接时调用"""
        # 获取当前用户
        user = self.scope.get("user")
        if user:
            user_id = user.get("id")
            # 移除用户通道
            cache.delete(f"user_{user_id}_channel")
            # 将用户从组中移除
            room_group_name = getattr(self, "room_group_name", None)
            if room_group_name:
                await self.channel_layer.group_discard(
                    room_group_name, self.channel_name
                )

    async def receive(self, text_data=None, bytes_data=None):
        """当接收到客户端发送的消息时调用"""
        # 心跳检测
        if text_data == "ping":
            await self.send(text_data="pong")
            return

        user = self.scope.get("user")
        if not user:
            logger.warning(f"匿名用户访问拒绝：{text_data}")
            return
        logger.info(f"收到用户 {user.get('id')} 发送消息：{text_data}")

        # 因为消息采用了两次JSON封装，这里进行两次JSON解析
        try:
            outer_payload = json.loads(text_data)  # 外层JSON解释
            message_type = outer_payload.get("type")
            raw_content = outer_payload.get("content", "{}")
            inner_content = json.loads(raw_content)  # 内层JSON解释
        except json.JSONDecodeError:
            logger.error("内容解析失败")
            return

        # 处理业务消息
        if message_type == "demo-message-send":
            message_text = inner_content.get("text", "").strip()
            if not message_text:
                logger.warning("消息内容不能为空")
                return

            # 构建响应字典
            content = {
                "fromUserId": user.get("id"),
                "text": message_text,
                "single": False,  # 默认群发
            }

            # 判断接收对象
            target_user_id = inner_content.get("toUserId")
            if target_user_id not in [None, "", 0]:
                # 单发
                await self._send_single_message(target_user_id, content)
            else:
                # 群发广播
                await self._send_broadcast_message(content)

    def _build_response(self, content):
        """构建标准化的响应消息，进行两次JSON封装"""
        # 第一次封装：添加消息类型
        inner_message = {
            "type": "demo-message-receive",
            "content": json.dumps(content),
        }
        # 第二次封装：整体序列化
        return json.dumps(inner_message)

    async def _send_single_message(self, target_user_id, content):
        """向指定用户发送单条消息"""
        # 获取用户通道
        target_channel = cache.get(f"user_{target_user_id}_channel")
        if not target_channel:
            return False

        # 构建并发送消息
        message = self._build_response(content)
        await self.channel_layer.send(
            target_channel,
            {
                "type": "single.message",
                "payload": message,
            },
        )
        return True

    async def _send_broadcast_message(self, content):
        """向房间内所有用户广播消息"""
        message = self._build_response(content)
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                "type": "broadcast.message",
                "payload": message,
            },
        )

    async def broadcast_message(self, event):
        """处理群发消息"""
        payload = event["payload"]
        await self.send(text_data=payload)

    async def single_message(self, event):
        """处理单发消息"""
        payload = event["payload"]
        await self.send(text_data=payload)
