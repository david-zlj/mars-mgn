"""
TODO 身份认证
"""

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.renderers import TemplateHTMLRenderer
from rest_framework.permissions import AllowAny


class ChatIndexView(APIView):
    permission_classes = [AllowAny]
    renderer_classes = [TemplateHTMLRenderer]
    template_name = "chat/index.html"

    def get(self, request):
        return Response()


class ChatRoomView(APIView):
    permission_classes = [AllowAny]
    renderer_classes = [TemplateHTMLRenderer]
    template_name = "chat/room.html"

    def get(self, request, room_name):
        return Response({"room_name": room_name})
