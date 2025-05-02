from django.urls import re_path
from . import consumers

# 创建WebSocket路由配置
websocket_urlpatterns = [
    # 调用as_asgi()类方法来获取一个 ASGI 应用程序
    re_path(r"ws/chat/(?P<room_name>\w+)/$", consumers.ChatConsumer.as_asgi()),
]
