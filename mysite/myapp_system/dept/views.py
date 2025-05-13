from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny

from mars_framework.viewsets.base import CustomModelViewSetNoExport
from mars_framework.permissions.base import HasPermission
from mars_framework.db.enums import CommonStatusEnum
from .models import SystemDept
from .serializers import DeptSerializer, DeptSaveSerializer, DeptSimpleSerializer
from .filters import DeptFilter


@extend_schema(tags=["管理后台-system-部门"])
class DeptViewSet(CustomModelViewSetNoExport):
    queryset = SystemDept.objects.all()
    serializer_class = DeptSerializer
    filterset_class = DeptFilter
    action_serializers = {
        "create": DeptSaveSerializer,
        "update": DeptSaveSerializer,
        "list_simple": DeptSimpleSerializer,
        "list_simple_2": DeptSimpleSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:dept:create")],
        "destroy": [HasPermission("system:dept:delete")],
        "update": [HasPermission("system:dept:update")],
        "retrieve": [HasPermission("system:dept:query")],
        "list": [HasPermission("system:dept:query")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
    action_querysets = {
        # 只包含被开启的部门，主要用于前端的下拉选项
        "list_simple": SystemDept.objects.filter(status=CommonStatusEnum.ENABLE.value),
        "list_simple_2": SystemDept.objects.filter(
            status=CommonStatusEnum.ENABLE.value
        ),
    }
