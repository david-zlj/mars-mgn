import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from myapp_infra.websocket.routing import websocket_urlpatterns


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "myproject.settings")

application = ProtocolTypeRouter(
    {
        # HTTP请求处理
        "http": get_asgi_application(),
        # WebSocket请求处理
        "websocket": AuthMiddlewareStack(
            URLRouter(websocket_urlpatterns)  # WebSocket 路由配置
        ),
    }
)


### 原生配置
# import os
# from django.core.asgi import get_asgi_application

# os.environ.setdefault("DJANGO_SETTINGS_MODULE", "myproject.settings")
# application = get_asgi_application()
