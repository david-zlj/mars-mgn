"""WebSocket 路由配置"""

from django.urls import re_path, path
from . import consumers

websocket_urlpatterns = [
    re_path(r"^infra/ws/?$", consumers.InfraConsumer.as_asgi()),
]
