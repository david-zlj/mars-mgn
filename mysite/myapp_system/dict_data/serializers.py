from rest_framework import serializers
from .models import SystemDictData


class DictDataSerializer(serializers.ModelSerializer):
    """字典数据序列化器"""

    class Meta:
        model = SystemDictData
        fields = [
            "id",
            "sort",
            "label",
            "value",
            "dict_type",
            "status",
            "color_type",
            "css_class",
            "remark",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class DictDataSimpleListSerializer(serializers.ModelSerializer):
    """字典数据简单序列化器"""

    class Meta:
        model = SystemDictData
        fields = [
            "id",
            "value",
            "label",
            "dict_type",
            "color_type",
            "css_class",
        ]
