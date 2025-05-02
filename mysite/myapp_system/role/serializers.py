from rest_framework import serializers
from mars_framework.serializers.base import CustomDateTimeField
from .models import SystemRole


class RoleSaveSerializer(serializers.ModelSerializer):
    """岗位创建/修改请求序列化器"""

    # TODO 更新时，会额外带上type remark dataScope dataScopeDeptIds createTime，确定是否需要

    class Meta:
        model = SystemRole
        fields = ["id", "name", "code", "sort", "status", "remark"]


class RoleDetailSerializer(serializers.ModelSerializer):
    """岗位详情序列化器"""

    dataScope = serializers.IntegerField(source="data_scope")
    dataScopeDeptIds = serializers.CharField(source="data_scope_dept_ids")
    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemRole
        fields = [
            "id",
            "name",
            "code",
            "sort",
            "status",
            "remark",
            "dataScope",
            "dataScopeDeptIds",
            "createTime",
        ]


class RoleListSerializer(serializers.ModelSerializer):
    # TODO 是否与RoleDetailSerializer一样
    """岗位列表序列化器"""

    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemRole
        fields = ["id", "name", "code", "sort", "status", "remark", "createTime"]


class RoleSimpleSerializer(serializers.ModelSerializer):
    """岗位简单序列化器"""

    class Meta:
        model = SystemRole
        fields = ["id", "name"]


class RoleExportSerializer(serializers.ModelSerializer):
    """岗位导出序列化器"""

    class Meta:
        model = SystemRole
        fields = ["id", "name", "code", "sort", "status", "data_scope"]
