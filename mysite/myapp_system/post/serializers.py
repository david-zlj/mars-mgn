from rest_framework import serializers

from .models import SystemPost


class PostSerializer(serializers.ModelSerializer):
    """岗位序列化器"""

    class Meta:
        model = SystemPost
        fields = ["id", "code", "name", "sort", "status", "remark", "create_time"]
        read_only_fields = ["id", "create_time"]


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
