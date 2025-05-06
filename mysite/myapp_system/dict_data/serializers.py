from rest_framework import serializers
from mars_framework.serializers.base import CustomDateTimeField
from .models import SystemDictData


class DictDataSerializer(serializers.ModelSerializer):
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


class DictDataDetailSerializer(serializers.ModelSerializer):
    """字典数据详情序列化器"""

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


class DictDataListSerializer(serializers.ModelSerializer):
    """字典数据列表序列化器"""

    dictType = serializers.CharField(source="dict_type", read_only=True)
    colorType = serializers.CharField(source="color_type", read_only=True)
    cssClass = serializers.CharField(source="css_class", read_only=True)
    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemDictData
        fields = [
            "id",
            "sort",
            "label",
            "value",
            "dictType",
            "status",
            "colorType",
            "cssClass",
            "remark",
            "createTime",
        ]


class DictDataExportSerializer(serializers.ModelSerializer):
    """字典数据导出序列化器"""

    dictType = serializers.CharField(source="dict_type")
    colorType = serializers.CharField(source="color_type", allow_null=True)
    cssClass = serializers.CharField(source="css_class", allow_null=True)
    createTime = CustomDateTimeField(source="create_time")

    class Meta:
        model = SystemDictData
        fields = [
            "id",
            "sort",
            "label",
            "value",
            "dictType",
            "status",
            "colorType",
            "cssClass",
            "remark",
            "createTime",
        ]
