from rest_framework.permissions import AllowAny
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.permissions.base import HasPermission
from mars_framework.db.enums import CommonStatusEnum, RoleTypeEnum
from mars_framework.response.base import CommonResponse
from .models import SystemRole
from .serializers import (
    RoleSaveSerializer,
    RoleSerializer,
    RoleSimpleSerializer,
    RoleExportSerializer,
)
from .filters import RoleFilter


@extend_schema(tags=["管理后台-system-角色"])
class RoleViewSet(CustomModelViewSet):
    queryset = SystemRole.objects.all()
    serializer_class = RoleSerializer
    filterset_class = RoleFilter
    action_serializers = {
        "create": RoleSaveSerializer,
        "update": RoleSaveSerializer,
        "list_simple": RoleSimpleSerializer,
        "list_simple_2": RoleSimpleSerializer,
        "export": RoleExportSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:role:create")],
        "destroy": [HasPermission("system:role:delete")],
        "update": [HasPermission("system:role:update")],
        "retrieve": [HasPermission("system:role:query")],
        "list": [HasPermission("system:role:query")],
        "export": [HasPermission("system:role:export")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
    action_querysets = {
        # 只包含被开启的部门，主要用于前端的下拉选项
        "list_simple": SystemRole.objects.filter(status=CommonStatusEnum.ENABLE.value),
        "list_simple_2": SystemRole.objects.filter(
            status=CommonStatusEnum.ENABLE.value
        ),
    }
    export_name = "角色列表"
    export_fields_labels = {
        "id": "角色序号",
        "name": "角色名称",
        "code": "角色标志",
        "sort": "角色顺序",
        "status": "角色状态",
        "data_scope": "数据范围",
    }
    export_data_map = {
        "status": {0: "开启", 1: "关闭"},
        "data_scope": {
            1: "全部数据权限",
            2: "指定部门数据权限",
            3: "本部门数据权限",
            4: "本部门及以下数据权限",
            5: "仅本人数据权限",
        },
    }

    def destroy(self, request, *args, **kwargs):
        """删除角色，内置角色不能删除"""
        if self.get_object().type == RoleTypeEnum.SYSTEM.value:
            return CommonResponse.error(code=111501, msg="内置角色不能删除")
        return super().destroy(request, *args, **kwargs)

    def update(self, request, *args, **kwargs):
        """修改角色，内置角色不能修改"""
        if self.get_object().type == RoleTypeEnum.SYSTEM.value:
            return CommonResponse.error(code=111501, msg="内置角色不能修改")
        return super().update(request, *args, **kwargs)
