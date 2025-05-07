from rest_framework import serializers
from .models import SystemNotifyMessage


class NotifyMessageSerializer(serializers.ModelSerializer):
    """站内信消息序列化器"""

    class Meta:
        model = SystemNotifyMessage
        fields = [
            "id",
            "user_id",
            "user_type",
            "template_id",
            "template_code",
            "template_nickname",
            "template_content",
            "template_type",
            "template_params",
            "read_status",
            "read_time",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]
