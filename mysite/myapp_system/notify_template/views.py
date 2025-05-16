from drf_spectacular.utils import extend_schema
from rest_framework.decorators import action


from mars_framework.viewsets.base import CustomModelViewSetNoExportNoSimple
from mars_framework.permissions.base import HasPermission
from mars_framework.response.base import CommonResponse
from .models import SystemNotifyTemplate
from .serializers import (
    NotifyTemplateSerializer,
    NotifySendReqSerializer,
)
from .filters import NotifyTemplateFilter
from .services import notifiy_send_service


@extend_schema(tags=["管理后台-system-站内信模板"])
class NotifyTemplateViewSet(CustomModelViewSetNoExportNoSimple):
    queryset = SystemNotifyTemplate.objects.all()
    serializer_class = NotifyTemplateSerializer
    filterset_class = NotifyTemplateFilter
    action_serializers = {
        "send_notify": NotifySendReqSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:notify-template:create")],
        "destroy": [HasPermission("system:notify-template:delete")],
        "update": [HasPermission("system:notify-template:update")],
        "retrieve": [HasPermission("system:notify-template:query")],
        "list": [HasPermission("system:notify-template:query")],
        "send_notify": [HasPermission("system:notify-template:send-notify")],
    }

    @extend_schema(summary="发送站内信")
    @action(detail=False, methods=["post"], url_path="send-notify")
    def send_notify(self, request):
        """发送站内信"""
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        params = notifiy_send_service.get_params(serializer.validated_data)
        instance = notifiy_send_service.send_notify(
            data=params, creator_id=request.user.id
        )
        return CommonResponse.success(data=instance.id)
