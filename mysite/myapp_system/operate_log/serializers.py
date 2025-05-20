from rest_framework import serializers

from .models import SystemOperateLog


class OperateLogSerializer(serializers.ModelSerializer):
    """操作日志序列化器"""

    class Meta:
        model = SystemOperateLog
        fields = [
            "id",
            "trace_id",
            "user_id",
            "username",
            "nickname",
            "user_type",
            "request_method",
            "request_url",
            "user_ip",
            "user_agent",
            "type",
            "sub_type",
            "biz_id",
            "action",
            "success",
            "status_code",
            "response",
            "execution_time",
            "create_time",
        ]
        read_only_fields = [
            "id",
            "trace_id",
            "user_id",
            "username",
            "nickname",
            "user_type",
            "request_method",
            "request_url",
            "user_ip",
            "user_agent",
            "type",
            "sub_type",
            "biz_id",
            "action",
            "success",
            "status_code",
            "response",
            "execution_time",
            "create_time",
        ]
