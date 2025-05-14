import ast
from rest_framework import serializers
from .models import SystemRole


class RoleSaveSerializer(serializers.ModelSerializer):
    """角色创建/修改请求序列化器"""

    class Meta:
        model = SystemRole
        fields = ["id", "name", "code", "sort", "status", "remark"]


class RoleSerializer(serializers.ModelSerializer):
    """角色详情序列化器"""

    def to_representation(self, instance):
        representation = super().to_representation(instance)
        # 将字符串字段转换为列表
        dept_ids_str = representation.get("data_scope_dept_ids", "")
        if dept_ids_str:
            representation["data_scope_dept_ids"] = ast.literal_eval(dept_ids_str)
        else:
            representation["data_scope_dept_ids"] = []
        return representation

    class Meta:
        model = SystemRole
        fields = [
            "id",
            "name",
            "code",
            "sort",
            "status",
            "type",
            "remark",
            "data_scope",
            "data_scope_dept_ids",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class RoleSimpleSerializer(serializers.ModelSerializer):
    """角色简单序列化器"""

    class Meta:
        model = SystemRole
        fields = ["id", "name"]


class RoleExportSerializer(serializers.ModelSerializer):
    """角色导出序列化器"""

    class Meta:
        model = SystemRole
        fields = ["id", "name", "code", "sort", "status", "data_scope"]
