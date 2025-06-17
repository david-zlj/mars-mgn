from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny

from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.permissions.base import HasPermission
from mars_framework.response.base import CommonResponse
from .models import SystemDictType
from ..dict_data.models import SystemDictData
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
        # 确保在 request 对象不存在时（如 schema 生成）不会崩溃
        if self.request is None:
            return super().get_authenticators()
        # 仅对指定 action 关闭认证
        path_info = self.request.META.get("PATH_INFO", "")
        if "simple-list" in path_info or "list-all-simple" in path_info:
            return []
        return super().get_authenticators()

    @extend_schema(summary="删除")
    def destroy(self, request, *args, **kwargs):
        """删除字典类型，该字典类型还有字典数据，无法删除"""
        if SystemDictData.objects.filter(dict_type=self.get_object().type).exists():
            return CommonResponse.error(
                code=112001, msg="该字典类型还有字典数据，无法删除"
            )
        return super().destroy(request, *args, **kwargs)
