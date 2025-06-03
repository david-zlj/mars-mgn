from rest_framework import serializers


# class CustomDateTimeField(serializers.DateTimeField):
#     def to_representation(self, value):
#         """将日期时间转换为时间戳"""
#         if not value:
#             return None
#         return int(value.timestamp() * 1000)  # 返回 Unix 时间戳（单位为毫秒）


# class CustomPrimaryKeyRelatedField(serializers.PrimaryKeyRelatedField):
#     """支持将0转换为None的主键关联字段"""

#     def to_internal_value(self, data):
#         if data == 0:
#             return None  # 将0转换为None
#         return super().to_internal_value(data)  # 其他值正常处理
