from django_filters import rest_framework as filters
from .models import SystemLoginLog


class LoginLogFilter(filters.FilterSet):
    """登录日志过滤器"""

    userIp = filters.CharFilter(
        field_name="user_ip", lookup_expr="icontains", label="用户 IP"
    )
    username = filters.CharFilter(
        field_name="username", lookup_expr="icontains", label="用户账号"
    )
    status = filters.BooleanFilter(
        field_name="result", lookup_expr="exact", label="操作状态"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="登录时间开始"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="登录时间结束"
    )

    class Meta:
        model = SystemLoginLog
        fields = ["userIp", "username", "status", "createTimeBegin", "createTimeEnd"]
