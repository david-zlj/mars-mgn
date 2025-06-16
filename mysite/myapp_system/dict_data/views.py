from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny

from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.permissions.base import HasPermission
from .models import SystemDictData
from .serializers import (
    DictDataSerializer,
    DictDataSimpleListSerializer,
)
from .filters import DictDataFilter


@extend_schema(tags=["管理后台-system-字典数据"])
class DictDataViewSet(CustomModelViewSet):
    queryset = SystemDictData.objects.all()
    serializer_class = DictDataSerializer
    filterset_class = DictDataFilter
    action_serializers = {
        "list_simple": DictDataSimpleListSerializer,
        "list_simple_2": DictDataSimpleListSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:dict:create")],
        "destroy": [HasPermission("system:dict:delete")],
        "update": [HasPermission("system:dict:update")],
        "retrieve": [HasPermission("system:dict:query")],
        "list": [HasPermission("system:dict:query")],
        "export": [HasPermission("system:dict:export")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
    export_name = "字典数据"
    export_fields_labels = {
        "id": "字典编码",
        "sort": "字典排序",
        "label": "字典标签",
        "value": "字典键值",
        "dict_type": "字典类型",
        "status": "状态",
    }
    export_data_map = {"status": {0: "开启", 1: "关闭"}}

    def get_authenticators(self):
        # 确保在 request 对象不存在时（如 schema 生成）不会崩溃
        if self.request is None:
            return super().get_authenticators()
        # 仅对指定 action 关闭认证
        path_info = self.request.META.get("PATH_INFO", "")
        if "simple-list" in path_info or "list-all-simple" in path_info:
            return []
        return super().get_authenticators()
