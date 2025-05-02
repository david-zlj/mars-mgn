from rest_framework import serializers

from ..role.models import SystemRole
from ..user.models import SystemUsers
from ..menu.models import SystemMenu
from ..dept.models import SystemDept

# from .models import DataScopeEnum  # 假设DataScopeEnum已经定义在models中
# from myapp_system.permission.serializers import PermissionAssignRoleMenuSerializer


class PermissionRoleMenuListSerializer(serializers.ModelSerializer):
    """
    获得角色拥有的菜单编号序列化器
    """

    class Meta:
        model = SystemRole
        fields = ["menus"]


class PermissionUserRoleListSerializer(serializers.ModelSerializer):
    """
    获得用户拥有的角色序列化器
    """

    class Meta:
        model = SystemUsers
        fields = ["roles"]


class PermissionAssignRoleMenuSerializer(serializers.ModelSerializer):
    """
    赋予角色菜单请求序列化器
    """

    roleId = serializers.IntegerField(source="id")
    menuIds = serializers.PrimaryKeyRelatedField(
        queryset=SystemMenu.objects.all(),
        source="menus",
        many=True,
    )

    class Meta:
        model = SystemRole
        fields = ["roleId", "menuIds"]


class PermissionAssignRoleDataScopeSerializer(serializers.ModelSerializer):
    """
    赋予角色数据权限请求序列化器
    """

    roleId = serializers.IntegerField(source="id")
    dataScope = serializers.IntegerField(source="data_scope")
    dataScopeDeptIds = serializers.PrimaryKeyRelatedField(
        queryset=SystemDept.objects.all(),
        source="data_scope_dept_ids",
        many=True,
        required=False,
        allow_empty=True,
        help_text="部门编号列表，只有范围类型为 DEPT_CUSTOM 时，该字段才需要",
    )

    class Meta:
        model = SystemRole
        fields = ["roleId", "dataScope", "dataScopeDeptIds"]

    def to_internal_value(self, data):
        """将输入的ID列表(对象)转换为字符串"""
        internal_data = super().to_internal_value(data)
        depts = internal_data.get("data_scope_dept_ids", [])
        dept_ids = [dept.id for dept in depts]
        internal_data["data_scope_dept_ids"] = str(dept_ids)
        return internal_data


class PermissionAssignUserRoleSerializer(serializers.ModelSerializer):
    """
    赋予用户角色请求序列化器
    """

    userId = serializers.IntegerField(source="id")
    roleIds = serializers.PrimaryKeyRelatedField(
        queryset=SystemRole.objects.all(),
        source="roles",
        many=True,
    )

    class Meta:
        model = SystemUsers
        fields = ["userId", "roleIds"]
