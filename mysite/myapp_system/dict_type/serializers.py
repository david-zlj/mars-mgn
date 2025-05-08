from rest_framework import serializers
from .models import SystemDictType


class DictTypeSerializer(serializers.ModelSerializer):
    """字典类型序列化器"""

    class Meta:
        model = SystemDictType
        fields = [
            "id",
            "name",
            "type",
            "status",
            "remark",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class DictTypeSimpleSerializer(serializers.ModelSerializer):
    """字典类型简单序列化器"""

    class Meta:
        model = SystemDictType
        fields = [
            "id",
            "name",
            "type",
        ]
        read_only_fields = ["id"]
