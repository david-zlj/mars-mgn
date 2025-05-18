from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny
from mars_framework.viewsets.base import CustomModelViewSetNoExport
from mars_framework.permissions.base import HasPermission
from .models import SystemMailAccount
from .serializers import MailAccountSerializer, MailAccountSimpleSerializer
from .filters import MailAccountFilter


@extend_schema(tags=["管理后台-system-邮箱账号"])
class MailAccountViewSet(CustomModelViewSetNoExport):
    queryset = SystemMailAccount.objects.all()
    serializer_class = MailAccountSerializer
    filterset_class = MailAccountFilter
    action_serializers = {
        "list_simple": MailAccountSimpleSerializer,
        "list_simple_2": MailAccountSimpleSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:mail-account:create")],
        "destroy": [HasPermission("system:mail-account:delete")],
        "update": [HasPermission("system:mail-account:update")],
        "retrieve": [HasPermission("system:mail-account:query")],
        "list": [HasPermission("system:mail-account:query")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
