import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack

# 设置环境变量并初始化Django应用
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "myproject.settings")
django_application = get_asgi_application()


def get_websocket_application():
    """延迟导入WebSocket路由（避免循环导入）"""
    from myapp_infra.websocket.routing import websocket_urlpatterns

    return AuthMiddlewareStack(URLRouter(websocket_urlpatterns))


# 协议路由：区分HTTP和WebSocket请求
application = ProtocolTypeRouter(
    {
        "http": django_application,
        "websocket": get_websocket_application(),
    }
)
