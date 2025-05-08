"""
TODO 设置list_simple和list_simple_2不进行认证
"""

from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action

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
    # TODO list_simple放进Redis?

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
        return super().list_simple(request, *args, **kwargs)

    @extend_schema(
        summary="查询列表简要信息",
        description="查询列表简要信息。TODO 接口文档不正确",
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        authentication_classes=[],  # 该接口不需要认证，目前通过覆盖父类方法来实现，待优化 TODO
    )
    def list_simple_2(self, request, *args, **kwargs):
        return super().list_simple_2(request, *args, **kwargs)
