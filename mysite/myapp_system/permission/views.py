from rest_framework.generics import get_object_or_404
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet, CustomGenericViewSet
from mars_framework.response.base import CommonResponse
from mars_framework.db.enums import RoleTypeEnum
from ..role.models import SystemRole
from ..user.models import SystemUsers
from .serializers import (
    PermissionRoleMenuListSerializer,
    PermissionUserRoleListSerializer,
    PermissionAssignRoleMenuSerializer,
    PermissionAssignRoleDataScopeSerializer,
    PermissionAssignUserRoleSerializer,
)


@extend_schema(tags=["管理后台-system-权限"])
class PermissionViewSet(CustomGenericViewSet):
    queryset = SystemRole.objects.all()
    serializer_class = PermissionRoleMenuListSerializer
    action_serializers = {
        "get_role_menu_list": PermissionRoleMenuListSerializer,
        "list_admin_roles": PermissionUserRoleListSerializer,
        "assign_role_menu": PermissionAssignRoleMenuSerializer,
        "assign_role_data_scope": PermissionAssignRoleDataScopeSerializer,
        "assign_user_role": PermissionAssignUserRoleSerializer,
    }

    @extend_schema(summary="获得角色拥有的菜单编号")
    @action(methods=["get"], detail=False, url_path="list-role-menus")
    def get_role_menu_list(self, request, *args, **kwargs):
        """
        获得角色拥有的菜单编号
        """
        role_id = request.query_params.get("roleId", None)
        instance = get_object_or_404(SystemRole, id=role_id)
        serializer = self.get_serializer(instance)
        return CommonResponse.success(data=serializer.data.get("menus", []))

    @extend_schema(summary="赋予角色菜单")
    @action(methods=["post"], detail=False, url_path="assign-role-menu")
    def assign_role_menu(self, request, *args, **kwargs):
        """
        赋予角色菜单
        """
        role_id = request.data.get("role_id", None)
        instance = get_object_or_404(SystemRole, id=role_id)
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(updater=request.user.id)
        return CommonResponse.success()

    @extend_schema(summary="赋予角色数据权限")
    @action(methods=["post"], detail=False, url_path="assign-role-data-scope")
    def assign_role_data_scope(self, request, *args, **kwargs):
        """
        赋予角色数据权限
        """
        role_id = request.data.get("role_id", None)
        instance = get_object_or_404(SystemRole, id=role_id)
        if instance.type == RoleTypeEnum.SYSTEM.value:
            return CommonResponse.error(code=111901, msg="内置角色不允许修改数据权限")
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(updater=request.user.id)
        return CommonResponse.success()

    @extend_schema(summary="获得管理员拥有的角色编号列表")
    @action(methods=["get"], detail=False, url_path="list-user-roles")
    def list_admin_roles(self, request, *args, **kwargs):
        """
        获得管理员拥有的角色编号列表
        """
        user_id = request.query_params.get("userId", None)
        instance = get_object_or_404(SystemUsers, id=user_id)
        serializer = self.get_serializer(instance)
        return CommonResponse.success(data=serializer.data.get("roles", []))

    @extend_schema(summary="赋予用户角色")
    @action(methods=["post"], detail=False, url_path="assign-user-role")
    def assign_user_role(self, request, *args, **kwargs):
        """
        赋予用户角色
        """
        user_id = request.data.get("user_id", None)
        instance = get_object_or_404(SystemUsers, id=user_id)
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(updater=request.user.id)
        return CommonResponse.success()
