from drf_spectacular.utils import extend_schema
from mars_framework.viewsets.mixins import (
    CustomListModelMixin,
    CustomRetrieveModelMixin,
)
from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.permissions.base import HasPermission
from .models import SystemMailLog
from .serializers import MailLogSerializer
from .filters import MailLogFilter


@extend_schema(tags=["管理后台-system-邮件日志"])
class MailLogViewSet(
    CustomGenericViewSet, CustomListModelMixin, CustomRetrieveModelMixin
):
    queryset = SystemMailLog.objects.all()
    serializer_class = MailLogSerializer
    filterset_class = MailLogFilter

    action_permissions = {
        "list": [HasPermission("system:mail-log:query")],
        "retrieve": [HasPermission("system:mail-log:query")],
    }
