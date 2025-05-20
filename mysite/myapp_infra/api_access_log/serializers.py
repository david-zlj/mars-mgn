from rest_framework import serializers
from .models import InfraApiAccessLog


class ApiAccessLogSerializer(serializers.ModelSerializer):
    """API 访问日志序列化器"""

    class Meta:
        model = InfraApiAccessLog
        fields = [
            "id",
            "trace_id",
            "user_id",
            "user_type",
            "application_name",
            "request_method",
            "request_url",
            "request_params",
            "response_body",
            "user_ip",
            "user_agent",
            "operate_module",
            "operate_name",
            "operate_type",
            "begin_time",
            "end_time",
            "duration",
            "result_code",
            "result_msg",
            "create_time",
        ]
        read_only_fields = [
            "id",
            "create_time",
        ]


class ApiAccessLogExportSerializer(serializers.ModelSerializer):
    """API 访问日志序列化器"""

    class Meta:
        model = InfraApiAccessLog
        fields = [
            "id",
            "trace_id",
            "user_id",
            "user_type",
            "application_name",
            "request_method",
            "request_url",
            "request_params",
            "response_body",
            "user_ip",
            "user_agent",
            "operate_module",
            "operate_name",
            "operate_type",
            "begin_time",
            "end_time",
            "duration",
            "result_code",
            "result_msg",
            "create_time",
        ]
        read_only_fields = [
            "id",
            "create_time",
        ]
