from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action

from mars_framework.viewsets.base import CustomModelViewSetNoExport
from mars_framework.permissions.base import HasPermission
from mars_framework.response.base import CommonResponse
from .models import SystemMailTemplate
from .serializers import (
    MailTemplateSerializer,
    MailTemplateSimpleSerializer,
    MailSendSerializer,
)
from .filters import MailTemplateFilter
from .services import mail_send_service


@extend_schema(tags=["管理后台-system-邮件模版"])
class MailTemplateViewSet(CustomModelViewSetNoExport):
    queryset = SystemMailTemplate.objects.all()
    serializer_class = MailTemplateSerializer
    filterset_class = MailTemplateFilter
    action_serializers = {
        "list_simple": MailTemplateSimpleSerializer,
        "list_simple_2": MailTemplateSimpleSerializer,
        "send_mail": MailSendSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:mail-template:create")],
        "destroy": [HasPermission("system:mail-template:delete")],
        "update": [HasPermission("system:mail-template:update")],
        "retrieve": [HasPermission("system:mail-template:query")],
        "list": [HasPermission("system:mail-template:query")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
        "send_mail": [HasPermission("system:mail-template:send-mail")],
    }

    @extend_schema(summary="发送邮件")
    @action(
        detail=False,
        methods=["post"],
        url_path="send-mail",
    )
    def send_mail(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        data = mail_send_service.get_params(serializer.validated_data)
        mail_log_id = mail_send_service.send_single_mail(
            data, creator_id=request.user.id
        )
        return CommonResponse.success(data=mail_log_id)
