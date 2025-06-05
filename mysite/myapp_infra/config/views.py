from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action

from mars_framework.viewsets.base import CustomModelViewSetNoSimple
from mars_framework.permissions.base import HasPermission
from mars_framework.db.enums import ConfigTypeEnum
from mars_framework.response.base import CommonResponse
from .models import InfraConfig
from .serializers import InfraConfigSerializer
from .filters import InfraConfigFilter
from .services import infra_config_service


@extend_schema(tags=["管理后台-system-参数配置"])
class InfraConfigViewSet(CustomModelViewSetNoSimple):
    queryset = InfraConfig.objects.all()
    serializer_class = InfraConfigSerializer
    filterset_class = InfraConfigFilter
    action_permissions = {
        "create": [HasPermission("infra:config:create")],
        "destroy": [HasPermission("infra:config:delete")],
        "update": [HasPermission("infra:config:update")],
        "retrieve": [HasPermission("infra:config:query")],
        "list": [HasPermission("infra:config:query")],
        "export": [HasPermission("infra:config:export")],
        "get_value_by_key": [AllowAny()],
    }
    action_querysets = {
        # 只包含可见的参数配置，主要用于前端的下拉选项
        "list_simple": InfraConfig.objects.filter(visible=True),
        "list_simple_2": InfraConfig.objects.filter(visible=True),
    }

    export_name = "参数配置列表"
    export_fields_labels = {
        "id": "参数配置序号",
        "category": "参数分类",
        "name": "参数名称",
        "config_key": "参数键名",
        "value": "参数键值",
        "type": "参数类型",
        "visible": "是否可见",
        "remark": "备注",
        "create_time": "创建时间",
    }
    export_data_map = {
        "type": {1: "系统内置", 2: "自定义"},
        "visible": {True: "是", False: "否"},
    }

    def destroy(self, request, *args, **kwargs):
        """type为系统内置的参数，不允许删除"""
        if self.get_object().type == ConfigTypeEnum.SYSTEM.value:
            return CommonResponse.error(code=121400, msg="系统内置不允许删除")
        return super().destroy(request, *args, **kwargs)

    @extend_schema(summary="根据参数键名查询参数值")
    @action(methods=["get"], detail=False, url_path="get-value-by-key")
    def get_value_by_key(self, request, *args, **kwargs):
        """不可见的配置，不允许返回给前端"""
        key = request.query_params.get("key")
        if not key:
            return CommonResponse.error(code=121401, msg="参数键名不能为空")

        value, visible = infra_config_service.get_value_by_key(key)
        if not value:
            return CommonResponse.error(code=121402, msg="参数配置不存在")

        if not visible:
            return CommonResponse.error(code=121403, msg="不可见的配置不允许返回给前端")

        return CommonResponse.success(data=value)
