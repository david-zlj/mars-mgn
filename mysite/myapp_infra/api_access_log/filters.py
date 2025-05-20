from django_filters import rest_framework as filters
from .models import InfraApiAccessLog


class ApiAccessLogFilter(filters.FilterSet):
    """API 访问日志过滤器"""

    userId = filters.NumberFilter(
        field_name="user_id", lookup_expr="exact", label="用户编号"
    )
    userType = filters.NumberFilter(
        field_name="user_type", lookup_expr="exact", label="用户类型"
    )
    applicationName = filters.CharFilter(
        field_name="application_name", lookup_expr="icontains", label="应用名"
    )
    requestUrl = filters.CharFilter(
        field_name="request_url", lookup_expr="icontains", label="请求地址"
    )
    beginTimeBegin = filters.DateTimeFilter(
        field_name="begin_time", lookup_expr="gte", label="开始时间起始"
    )
    beginTimeEnd = filters.DateTimeFilter(
        field_name="begin_time", lookup_expr="lte", label="开始时间结束"
    )
    duration = filters.NumberFilter(
        field_name="duration", lookup_expr="gte", label="执行时长（大于等于）"
    )
    resultCode = filters.NumberFilter(
        field_name="result_code", lookup_expr="exact", label="结果码"
    )

    class Meta:
        model = InfraApiAccessLog
        fields = [
            "userId",
            "userType",
            "applicationName",
            "requestUrl",
            "beginTimeBegin",
            "beginTimeEnd",
            "duration",
            "resultCode",
        ]
