import re
import ast
from rest_framework import serializers

from mars_framework.db.enums import UserTypeEnum
from .models import SystemNotifyTemplate
from ..user.models import SystemUsers


class NotifyTemplateSerializer(serializers.ModelSerializer):
    """站内信模板序列化器"""

    params = serializers.SerializerMethodField()

    def get_params(self, obj):
        return ast.literal_eval(obj.params) if obj.params else []

    class Meta:
        model = SystemNotifyTemplate
        fields = [
            "id",
            "name",
            "code",
            "type",
            "nickname",
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


class NotifySendReqSerializer(serializers.Serializer):
    """站内信模板发送请求序列化器"""

    user_id = serializers.PrimaryKeyRelatedField(
        queryset=SystemUsers.objects.all(),
        required=True,
        help_text="用户id",
        error_messages={
            "required": "接收人ID不能为空",
            "does_not_exist": "接收人ID不存在",
        },
    )
    user_type = serializers.ChoiceField(
        choices=[(item.value, item.name) for item in UserTypeEnum],
        required=True,
        help_text="用户类型",
        error_messages={"required": "用户类型不能为空"},
    )
    template_code = serializers.CharField(
        required=True,
        help_text="模板编码",
        error_messages={"required": "模板编码不能为空"},
    )
    template_params = serializers.DictField(
        child=serializers.JSONField(),
        required=False,
        allow_null=True,
        help_text="模板参数",
    )
