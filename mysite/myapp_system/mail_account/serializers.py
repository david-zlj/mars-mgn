from rest_framework import serializers
from .models import SystemMailAccount


class MailAccountSerializer(serializers.ModelSerializer):
    """邮箱账号序列化器"""

    class Meta:
        model = SystemMailAccount
        fields = [
            "id",
            "mail",
            "username",
            "password",
            "host",
            "port",
            "ssl_enable",
            "starttls_enable",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class MailAccountSimpleSerializer(serializers.ModelSerializer):
    """邮箱账号简单序列化器"""

    class Meta:
        model = SystemMailAccount
        fields = [
            "id",
            "mail",
        ]
