"""
TODO 简化createTime
"""

from rest_framework import serializers

from mars_framework.serializers.base import CustomDateTimeField
from .models import SystemPost


class PostSaveSerializer(serializers.ModelSerializer):
    """岗位创建/修改请求序列化器"""

    class Meta:
        model = SystemPost
        fields = ["id", "name", "code", "sort", "status", "remark"]


class PostDetailSerializer(serializers.ModelSerializer):
    """岗位详情序列化器"""

    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemPost
        fields = ["id", "code", "name", "sort", "status", "remark", "createTime"]


class PostListSerializer(serializers.ModelSerializer):
    """岗位列表序列化器"""

    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemPost
        fields = ["id", "code", "name", "sort", "status", "remark", "createTime"]


class PostSimpleSerializer(serializers.ModelSerializer):
    """岗位简单序列化器"""

    class Meta:
        model = SystemPost
        fields = ["id", "name"]


class PostExportSerializer(serializers.ModelSerializer):
    """岗位导出序列化器"""

    class Meta:
        model = SystemPost
        fields = ["id", "code", "name", "sort", "status"]
