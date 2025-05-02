from rest_framework import serializers

from mars_framework.serializers.base import CustomDateTimeField
from .models import SystemDept
from ..user.models import SystemUsers


class DeptSaveSerializer(serializers.ModelSerializer):
    """部门创建/修改请求序列化器"""

    parentId = serializers.PrimaryKeyRelatedField(
        source="parent_id", required=False, queryset=SystemDept.objects.all()
    )
    leaderUserId = serializers.PrimaryKeyRelatedField(
        source="leader_user_id", required=False, queryset=SystemUsers.objects.all()
    )

    class Meta:
        model = SystemDept
        fields = [
            "id",
            "name",
            "parentId",
            "sort",
            "leaderUserId",
            "phone",
            "email",
            "status",
        ]


class DeptDetailSerializer(serializers.ModelSerializer):
    """部门详情序列化器"""

    parentId = serializers.PrimaryKeyRelatedField(
        source="parent_id", required=False, read_only=True
    )
    leaderUserId = serializers.PrimaryKeyRelatedField(
        source="leader_user_id", required=False, read_only=True
    )
    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemDept
        fields = [
            "id",
            "name",
            "parentId",
            "sort",
            "leaderUserId",
            "phone",
            "email",
            "status",
            "createTime",
        ]


class DeptListSerializer(serializers.ModelSerializer):
    """部门列表序列化器"""

    parentId = serializers.PrimaryKeyRelatedField(
        source="parent_id", required=False, read_only=True
    )
    leaderUserId = serializers.PrimaryKeyRelatedField(
        source="leader_user_id", required=False, read_only=True
    )
    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemDept
        fields = [
            "id",
            "name",
            "parentId",
            "sort",
            "leaderUserId",
            "phone",
            "email",
            "status",
            "createTime",
        ]


class DeptSimpleSerializer(serializers.ModelSerializer):
    """部门简单序列化器"""

    parentId = serializers.PrimaryKeyRelatedField(source="parent_id", read_only=True)

    class Meta:
        model = SystemDept
        fields = ["id", "name", "parentId"]
