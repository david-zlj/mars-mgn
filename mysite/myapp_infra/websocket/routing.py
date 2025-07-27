"""WebSocket 路由配置"""

from django.urls import re_path, path
from .consumers import InfraConsumer

websocket_urlpatterns = [
    # 调用as_asgi()类方法来获取一个 ASGI 应用程序
    re_path(r"^infra/ws/?$", InfraConsumer.as_asgi()),
]
