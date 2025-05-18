from rest_framework import serializers
from .models import SystemMailLog


class MailLogSerializer(serializers.ModelSerializer):
    """邮件日志序列化器"""

    class Meta:
        model = SystemMailLog
        fields = [
            "id",
            "user_id",
            "user_type",
            "to_mail",
            "account_id",
            "from_mail",
            "template_id",
            "template_code",
            "template_nickname",
            "template_title",
            "template_content",
            "template_params",
            "send_status",
            "send_time",
            "send_message_id",
            "send_exception",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class MailLogSaveSerializer(serializers.ModelSerializer):
    """邮件日志创建/修改序列化器"""

    class Meta:
        model = SystemMailLog
        fields = [
            "id",
            "user_id",
            "user_type",
            "to_mail",
            "account_id",
            "from_mail",
            "template_id",
            "template_code",
            "template_nickname",
            "template_title",
            "template_content",
            "template_params",
            "send_status",
            "send_time",
            "send_message_id",
            "send_exception",
        ]
