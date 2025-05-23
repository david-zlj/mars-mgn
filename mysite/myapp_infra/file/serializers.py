from rest_framework import serializers
from .models import InfraFile


class InfraFileSerializer(serializers.ModelSerializer):
    """文件序列化器"""

    class Meta:
        model = InfraFile
        fields = [
            "id",
            "config_id",
            "path",
            "name",
            "url",
            "type",
            "size",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        request = self.context.get("request")
        if request:
            # 使用build_absolute_uri()方法自动拼接协议、域名、端口和相对路径
            data["url"] = request.build_absolute_uri(data["url"])
        return data
