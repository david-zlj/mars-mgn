from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action

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
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
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

    @extend_schema(
        summary="查询列表简要信息",
        description="查询列表简要信息。TODO 接口文档不正确",
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
        authentication_classes=[],  # 该接口不需要认证，目前通过覆盖父类方法来实现，待优化 TODO
    )
    def list_simple(self, request, *args, **kwargs):
        """包括开启 + 禁用的字典类型，主要用于前端的下拉选项"""
        return super().list_simple(request, *args, **kwargs)

    @extend_schema(
        summary="查询列表简要信息",
        description="查询列表简要信息。TODO 接口文档不正确",
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        authentication_classes=[],
    )
    def list_simple_2(self, request, *args, **kwargs):
        """包括开启 + 禁用的字典类型，主要用于前端的下拉选项"""
        return super().list_simple_2(request, *args, **kwargs)
