from drf_spectacular.utils import extend_schema

from rest_framework.permissions import AllowAny
from mars_framework.viewsets.base import CustomModelViewSetNoExport
from mars_framework.permissions.base import HasPermission
from mars_framework.db.enums import CommonStatusEnum
from mars_framework.response.base import CommonResponse
from .models import SystemMenu
from .serializers import (
    MenuSerializer,
    MenuSimpleSerializer,
)
from .filters import MenuFilter


@extend_schema(tags=["管理后台-system-菜单"])
class MenuViewSet(CustomModelViewSetNoExport):
    queryset = SystemMenu.objects.all()
    serializer_class = MenuSerializer
    filterset_class = MenuFilter
    action_permissions = {
        "create": [HasPermission("system:menu:create")],
        "destroy": [HasPermission("system:menu:delete")],
        "update": [HasPermission("system:menu:update")],
        "retrieve": [HasPermission("system:menu:query")],
        "list": [HasPermission("system:menu:query")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
    action_serializers = {
        "list_simple": MenuSimpleSerializer,
        "list_simple_2": MenuSimpleSerializer,
    }
    action_querysets = {
        # 只包含被开启的菜单，用于【角色分配菜单】功能的选项
        "list_simple": SystemMenu.objects.filter(status=CommonStatusEnum.ENABLE.value),
        "list_simple_2": SystemMenu.objects.filter(
            status=CommonStatusEnum.ENABLE.value
        ),
    }

    def destroy(self, request, *args, **kwargs):
        """删除菜单，存在子菜单，不允许删除"""
        # if self.get_object().children.exists():
        #     return CommonResponse.error(code=111601, msg="存在子菜单，无法删除")
        return super().destroy(request, *args, **kwargs)
