import re
import ast

from rest_framework import serializers
from .models import SystemMailTemplate


class MailTemplateSerializer(serializers.ModelSerializer):
    """邮件模板序列化器"""

    params = serializers.SerializerMethodField()

    def get_params(self, obj):
        return ast.literal_eval(obj.params) if obj.params else []

    class Meta:
        model = SystemMailTemplate
        fields = [
            "id",
            "name",
            "code",
            "account_id",
            "nickname",
            "title",
            "content",
            "params",
            "status",
            "remark",
            "create_time",
        ]
        read_only_fields = ["id", "params", "create_time"]

    def create(self, validated_data):
        # 提取content字段{}里面的内容，生成params字段列表
        content = validated_data.get("content", "")
        if content:
            matches = re.findall(r"\{(.*?)\}", content)
            validated_data["params"] = list(set(matches))
        return super().create(validated_data)

    def update(self, instance, validated_data):
        # 提取content字段{}里面的内容，生成params字段列表
        content = validated_data.get("content", "")
        if content:
            matches = re.findall(r"\{(.*?)\}", content)
            validated_data["params"] = list(set(matches))
        return super().update(instance, validated_data)


class MailTemplateSimpleSerializer(serializers.ModelSerializer):
    """邮件模板简单序列化器"""

    class Meta:
        model = SystemMailTemplate
        fields = [
            "id",
            "name",
        ]


class MailSendSerializer(serializers.Serializer):
    """发送邮件请求序列化器"""

    mail = serializers.EmailField(
        required=True,
        help_text="接收邮箱",
        error_messages={"required": "接收邮箱不能为空"},
    )
    template_code = serializers.CharField(
        required=True,
        help_text="模板编码",
        error_messages={"required": "模板编码不能为空"},
    )
    template_params = serializers.DictField(
        child=serializers.JSONField(),
        allow_null=True,
        allow_empty=True,
        required=False,
        help_text="模板参数",
    )
