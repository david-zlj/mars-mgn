import json
from rest_framework import serializers
from .models import InfraFileConfig


class InfraFileConfigSerializer(serializers.ModelSerializer):
    """文件配置序列化器"""

    class Meta:
        model = InfraFileConfig
        fields = [
            "id",
            "name",
            "storage",
            "master",
            "config",
            "remark",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]

    def to_representation(self, instance):
        # 将config字符串转换为字典
        data = super().to_representation(instance)
        data["config"] = json.loads(data["config"])
        return data

    def to_internal_value(self, data):
        # 将config字典转换为字符串
        data["config"] = json.dumps(data["config"], ensure_ascii=False)
        return super().to_internal_value(data)
