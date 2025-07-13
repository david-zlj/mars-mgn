from django.conf import settings
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
            if settings.DEBUG:  # 如果是开发环境
                data["url"] = request.build_absolute_uri(data["url"])
            else:  # 如果是生产环境
                data["url"] = f"{settings.NGINX_BASE_URL}{data['url']}"
        return data
