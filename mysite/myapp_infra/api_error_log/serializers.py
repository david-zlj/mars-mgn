from rest_framework import serializers
from .models import InfraApiErrorLog


class ApiErrorLogSerializer(serializers.ModelSerializer):
    """API 错误日志序列化器"""

    class Meta:
        model = InfraApiErrorLog
        fields = [
            "id",
            "trace_id",
            "user_id",
            "user_type",
            "application_name",
            "request_method",
            "request_url",
            "request_params",
            "user_ip",
            "user_agent",
            "exception_time",
            "exception_name",
            "exception_message",
            "exception_root_cause_message",
            "exception_stack_trace",
            "exception_class_name",
            "exception_file_name",
            "exception_method_name",
            "exception_line_number",
            "process_status",
            "process_time",
            "process_user_id",
            "create_time",
        ]
        read_only_fields = [
            "id",
            "create_time",
        ]
