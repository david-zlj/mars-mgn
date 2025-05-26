from rest_framework import serializers
from .models import InfraConfig


class InfraConfigSerializer(serializers.ModelSerializer):
    """参数配置序列化器"""

    class Meta:
        model = InfraConfig
        fields = [
            "id",
            "category",
            "name",
            "config_key",
            "value",
            "type",
            "visible",
            "remark",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]
