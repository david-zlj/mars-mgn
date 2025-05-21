from rest_framework import serializers
from .models import SystemLoginLog


class LoginLogSerializer(serializers.ModelSerializer):
    """登录日志序列化器"""

    class Meta:
        model = SystemLoginLog
        fields = [
            "id",
            "log_type",
            "user_id",
            "username",
            "result",
            "user_ip",
            "user_agent",
            "create_time",
        ]
        read_only_fields = [
            "id",
            "log_type",
            "user_id",
            "username",
            "result",
            "user_ip",
            "user_agent",
            "create_time",
        ]
