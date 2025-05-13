from rest_framework import serializers

from .models import SystemDept


class DeptSerializer(serializers.ModelSerializer):
    """部门信息序列化器"""

    class Meta:
        model = SystemDept
        fields = [
            "id",
            "name",
            "parent_id",
            "sort",
            "leader_user_id",
            "phone",
            "email",
            "status",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class DeptSaveSerializer(serializers.ModelSerializer):
    """部门创建/修改请求序列化器"""

    def to_internal_value(self, data):
        """
        如果 parent_id 存在且等于 0，则将其设置为 None 。
        因为前端用传递 0，表示无顶级部门，但数据库中 0 表示有父部门，所以需要特殊处理。
        """

        if data.get("parent_id") == 0:
            data["parent_id"] = None
        return super().to_internal_value(data)

    class Meta:
        model = SystemDept
        fields = [
            "id",
            "name",
            "parent_id",
            "sort",
            "leader_user_id",
            "phone",
            "email",
            "status",
        ]


class DeptSimpleSerializer(serializers.ModelSerializer):
    """部门精简信息序列化器"""

    class Meta:
        model = SystemDept
        fields = [
            "id",
            "name",
            "parent_id",
        ]
