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
    """基础设施异步消费者"""

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
        user = self.scope["user"]
        if user:
            user_id = user.get("id")
            # 移除用户通道
            cache.delete(f"user_{user_id}_channel")

    async def receive(self, text_data=None, bytes_data=None):
        """当接收到客户端发送的消息时调用"""
        if text_data == "ping":
            await self.send(text_data="pong")
            return

        # 获取当前用户
        user = self.scope["user"]
        if not user:
            logger.warning(f"匿名用户访问拒绝：{text_data}")
            return
        logger.info(f"收到用户 {user.get('id')} 发送消息：{text_data}")

        # 进行两次JSON解析
        try:
            # 解析外层消息结构
            outer_payload = json.loads(text_data)
            message_type = outer_payload.get("type")
            raw_content = outer_payload.get("content", "{}")
            inner_content = json.loads(raw_content)
        except json.JSONDecodeError:
            logger.error("内容解析失败")
            return

        # 处理业务消息
        if message_type == "demo-message-send":
            message_text = inner_content.get("text", "").strip()
            if not message_text:
                logger.warning("消息内容不能为空")
                return

            # 预构建响应
            content = {
                "fromUserId": user.get("id"),
                "text": message_text,
                "single": False,  # 默认群发
            }

            # 接收对象判断
            target_user_id = inner_content.get("toUserId")
            if target_user_id not in [None, "", 0]:
                # 单发
                content["single"] = True
                response = self._get_response(content)
                await self._send_to_user(target_user_id, response)
            else:
                # 群发广播
                await self.channel_layer.group_send(
                    self.room_group_name,
                    {
                        "type": "broadcast.message",
                        "payload": self._get_response(content),
                    },
                )

    def _get_response(self, content):
        """进行两次JSON封装"""
        response = {
            "type": "demo-message-receive",
            "content": json.dumps(content),
        }
        return json.dumps(response)

    async def _send_to_user(self, target_user_id, message):
        """从缓存获取用户通道，发送给指定用户"""
        if target_channel := cache.get(f"user_{target_user_id}_channel"):
            await self.channel_layer.send(
                target_channel,
                {
                    "type": "single.message",
                    "payload": message,
                },
            )
            return True
        return False

    async def broadcast_message(self, event):
        """处理群发消息"""
        payload = event["payload"]
        await self.send(text_data=payload)

    async def single_message(self, event):
        """处理单发消息"""
        payload = event["payload"]
        await self.send(text_data=payload)
