from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet
from mars_framework.filters.base import apply_time_range_filter
from .models import SystemRole
from .serializers import (
    RoleSaveSerializer,
    RoleDetailSerializer,
    RoleListSerializer,
    RoleSimpleSerializer,
    RoleExportSerializer,
)
from .filters import SystemRoleFilter


@extend_schema(tags=["管理后台-system-角色"])
class RoleViewSet(CustomViewSet):
    queryset = SystemRole.objects.all()
    filterset_class = SystemRoleFilter
    export_labels = [
        "角色序号",
        "角色名称",
        "角色标志",
        "角色排序",
        "角色状态",
        "数据范围",
    ]
    export_fields = ["id", "name", "code", "sort", "status", "data_scope"]

    def get_serializer_class(self):
        serializer_classes = {
            "create_role": RoleSaveSerializer,
            "update_role": RoleSaveSerializer,
            "get_role": RoleDetailSerializer,
            "get_simple_role_list": RoleSimpleSerializer,
            "get_simple_role_list_2": RoleSimpleSerializer,
            "get_role_page": RoleListSerializer,
            "export_role": RoleExportSerializer,
        }
        return serializer_classes.get(self.action, RoleListSerializer)

    @extend_schema(summary="创建角色")
    @action(
        methods=["post"],
        detail=False,
        url_path="create",
        # permission_classes=[HasPermission("system:role:create")],
    )
    def create_role(self, request, *args, **kwargs):
        """创建角色"""
        return self.custom_create(request, *args, **kwargs)

    @extend_schema(summary="更新角色")
    @action(
        methods=["put"],
        detail=False,
        url_path="update",
        # permission_classes=[HasPermission("system:role:update")],
    )
    def update_role(self, request, *args, **kwargs):
        """更新角色"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="删除角色")
    @action(
        methods=["delete"],
        detail=False,
        url_path="delete",
        # permission_classes=[HasPermission("system:role:delete")],
    )
    def delete_role(self, request, *args, **kwargs):
        """删除角色"""
        return self.custom_destroy(request, *args, **kwargs)

    @extend_schema(summary="获取角色信息")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        # permission_classes=[HasPermission("system:role:query")],
    )
    def get_role(self, request, *args, **kwargs):
        """获取角色信息"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="获取角色精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_role_list(self, request, *args, **kwargs):
        """只包含被开启的角色，主要用于前端的下拉选项"""
        # TODO 原"dataScopeDeptIds": null,现"dataScopeDeptIds": "",是否需要修正
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取角色精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_role_list_2(self, request, *args, **kwargs):
        """只包含被开启的角色，主要用于前端的下拉选项"""
        # TODO 原返回了所有信息，是否需要
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(
        summary="获取角色分页列表",
        filters=SystemRoleFilter,
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="page",
        # permission_classes=[HasPermission("system:role:query")],
    )
    def get_role_page(self, request, *args, **kwargs):
        """获取角色分页列表"""
        return self.custom_list(
            request, create_time_filter=apply_time_range_filter, *args, **kwargs
        )

    @extend_schema(summary="导出角色数据")
    @action(
        methods=["get"],
        detail=False,
        url_path="export-excel",
        # permission_classes=[HasPermission("system:role:export")],
        permission_classes=[AllowAny],
    )
    def export_role(self, request, *args, **kwargs):
        """导出角色数据"""
        return self.custom_export(request, *args, **kwargs)
