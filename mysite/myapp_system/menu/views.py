"""
TODO 注意parent_id字段0与null之间，前端的定义
"""

from django.db.models.deletion import ProtectedError
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet
from mars_framework.response.base import CommonResponse
from mars_framework.permissions.base import has_perm
from .models import SystemMenu
from .serializers import (
    MenuSaveSerializer,
    MenuDetailSerializer,
    MenuListSerializer,
    MenuSimpleSerializer,
)
from .filters import SystemMenuFilter


@extend_schema(tags=["管理后台-system-菜单"])
class MenuViewSet(CustomViewSet):
    queryset = SystemMenu.objects.all()
    filterset_class = SystemMenuFilter

    def get_queryset(self):
        # 根据 action 动态调整查询集
        if self.action in ["get_simple_menu_list", "get_simple_menu_list_2"]:
            # 只包含被开启的菜单，用于角色分配菜单的选项
            return SystemMenu.objects.filter(status=0)
        return super().get_queryset()

    def get_serializer_class(self):
        serializer_classes = {
            "create_menu": MenuSaveSerializer,
            "update_menu": MenuSaveSerializer,
            "get_menu": MenuDetailSerializer,
            "get_menu_list": MenuListSerializer,
            "get_simple_menu_list": MenuSimpleSerializer,
            "get_simple_menu_list_2": MenuSimpleSerializer,
        }
        return serializer_classes.get(self.action, MenuListSerializer)

    @extend_schema(summary="创建菜单")
    @action(
        methods=["post"],
        detail=False,
        url_path="create",
        permission_classes=[has_perm("system:menu:create")],
    )
    def create_menu(self, request, *args, **kwargs):
        """创建菜单"""
        return self.custom_create(request, *args, **kwargs)

    @extend_schema(summary="更新菜单")
    @action(
        methods=["put"],
        detail=False,
        url_path="update",
        permission_classes=[has_perm("system:menu:update")],
    )
    def update_menu(self, request, *args, **kwargs):
        """更新菜单"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="删除菜单")
    @action(
        methods=["delete"],
        detail=False,
        url_path="delete",
        # permission_classes=[HasPermission("system:menu:delete")],
    )
    def delete_menu(self, request, *args, **kwargs):
        """删除菜单"""
        try:
            return self.custom_destroy(request, *args, **kwargs)
        except ProtectedError as e:
            return CommonResponse.error(code=111601, msg="存在子菜单，无法删除")

    @extend_schema(summary="获取菜单信息")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        # permission_classes=[HasPermission("system:menu:query")],
    )
    def get_menu(self, request, *args, **kwargs):
        """获取菜单信息"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="获取菜单列表", filters=SystemMenuFilter)
    @action(
        methods=["get"],
        detail=False,
        url_path="list",
        # permission_classes=[HasPermission("system:menu:query")],
    )
    def get_menu_list(self, request, *args, **kwargs):
        """获取菜单列表"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取菜单精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_menu_list(self, request, *args, **kwargs):
        """只包含被开启的菜单，用于角色分配菜单的选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取菜单精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_menu_list_2(self, request, *args, **kwargs):
        """只包含被开启的菜单，用于角色分配菜单的选项"""
        return self.custom_list(request, *args, **kwargs)
