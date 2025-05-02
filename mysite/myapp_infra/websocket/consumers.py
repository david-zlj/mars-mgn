"""
TODO 身份认证
参考资料：https://channels.readthedocs.io/en/latest/topics/authentication.html
"""

import json
from channels.generic.websocket import AsyncWebsocketConsumer


class ChatConsumer(AsyncWebsocketConsumer):
    """异步WebSocket消费者"""

    async def connect(self):
        """
        当客户端尝试连接时调用此方法。
        它负责获取房间名称，构造房间组名称，并将当前通道添加到房间组中。
        """
        # 从URL路由中提取房间名称
        self.room_name = self.scope["url_route"]["kwargs"]["room_name"]
        # 构造房间组名称
        self.room_group_name = f"chat_{self.room_name}"
        # 将当前通道添加到房间组中
        await self.channel_layer.group_add(self.room_group_name, self.channel_name)
        # 接受客户端的WebSocket连接请求
        await self.accept()

    async def disconnect(self, close_code):
        """
        断开连接方法。
        当客户端断开连接时调用此方法。
        它负责将当前通道从房间组中移除。
        """
        await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

    async def receive(self, text_data):
        """
        异步接收消息函数。
        该函数用于接收通过WebSocket发送的文本数据，并将其发送到指定的房间组。
        """
        # 将接收到的文本数据解析为JSON格式，以便获取消息内容
        text_data_json = json.loads(text_data)
        # 从解析的JSON数据中提取消息字段
        message = text_data_json["message"]
        # 使用channel_layer的group_send方法将消息发送到房间组
        # 'chat.message'类型用于指定消息处理函数，'message'键包含实际的消息内容
        await self.channel_layer.group_send(
            self.room_group_name, {"type": "chat.message", "message": message}
        )

    async def chat_message(self, event):
        """
        处理聊天消息事件。
        该方法是一个异步方法，用于处理名为chat_message的事件。它从事件字典中提取消息内容，
        并通过WebSocket发送消息。
        """
        # 从事件中提取消息内容
        message = event["message"]
        # 将消息内容封装到一个字典中，并转换为JSON字符串
        # 使用await关键字调用self.send方法，异步发送消息到WebSocket
        await self.send(text_data=json.dumps({"message": message}))


# import json
# from asgiref.sync import async_to_sync
# from channels.generic.websocket import WebsocketConsumer

# class ChatConsumer(WebsocketConsumer):
#     """同步WebSocket消费者"""

#     def connect(self):
#         self.room_name = self.scope["url_route"]["kwargs"]["room_name"]
#         self.room_group_name = f"chat_{self.room_name}"
#         async_to_sync(self.channel_layer.group_add)(
#             self.room_group_name, self.channel_name
#         )
#         self.accept()

#     def disconnect(self, close_code):
#         async_to_sync(self.channel_layer.group_discard)(
#             self.room_group_name, self.channel_name
#         )

#     # Receive message from WebSocket
#     def receive(self, text_data):
#         text_data_json = json.loads(text_data)
#         message = text_data_json["message"]
#         async_to_sync(self.channel_layer.group_send)(
#             self.room_group_name, {"type": "chat.message", "message": message}
#         )

#     # Receive message from room group
#     def chat_message(self, event):
#         message = event["message"]
#         self.send(text_data=json.dumps({"message": message}))
