from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny

from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.permissions.base import HasPermission
from .models import SystemDictType
from .serializers import DictTypeSerializer, DictTypeSimpleSerializer
from .filters import DictTypeFilter


@extend_schema(tags=["管理后台-system-字典类型"])
class DictTypeViewSet(CustomModelViewSet):
    queryset = SystemDictType.objects.all()
    serializer_class = DictTypeSerializer
    filterset_class = DictTypeFilter
    action_serializers = {
        "list_simple": DictTypeSimpleSerializer,
        "list_simple_2": DictTypeSimpleSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:dict:create")],
        "destroy": [HasPermission("system:dict:delete")],
        "update": [HasPermission("system:dict:update")],
        "retrieve": [HasPermission("system:dict:query")],
        "list": [HasPermission("system:dict:query")],
        "export": [HasPermission("system:dict:query")],
        "list_simple": [AllowAny()],  # 无需校验权限，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
    export_name = "字典类型"
    export_fields_labels = {
        "id": "字典主键",
        "name": "字典名称",
        "type": "字典类型",
        "status": "状态",
    }
    export_data_map = {"status": {0: "开启", 1: "关闭"}}

    def get_authenticators(self):
        # 仅对指定 action 关闭认证
        path_info = self.request.META.get("PATH_INFO", "")
        if "simple-list" in path_info or "list-all-simple" in path_info:
            return []
        return super().get_authenticators()
