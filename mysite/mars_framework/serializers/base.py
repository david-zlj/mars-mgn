"""
TODO
- 时间对不上，时区问题
"""

from rest_framework import serializers
from drf_spectacular.utils import inline_serializer


class CustomDateTimeField(serializers.DateTimeField):
    def to_representation(self, value):
        """将日期时间转换为时间戳"""
        if not value:
            return None
        return int(value.timestamp() * 1000)  # 返回 Unix 时间戳（单位为毫秒）


class CustomPrimaryKeyRelatedField(serializers.PrimaryKeyRelatedField):
    """支持将0转换为None的主键关联字段"""

    def to_internal_value(self, data):
        if data == 0:
            return None  # 将0转换为None
        return super().to_internal_value(data)  # 其他值正常处理


# 定义通用响应结构序列化器：用于接口文档
SuccessResponseSerializer = inline_serializer(
    name="SuccessResponse",
    fields={
        "code": serializers.IntegerField(default=0),
        "data": serializers.BooleanField(),
        "msg": serializers.CharField(default=""),
    },
)

# 定义通用响应结构序列化器：用于接口文档
ErrorResponseSerializer = inline_serializer(
    name="ErrorResponse",
    fields={
        "code": serializers.IntegerField(default=500),
        "data": serializers.JSONField(allow_null=True),
        "msg": serializers.CharField(default="Error"),
    },
)
