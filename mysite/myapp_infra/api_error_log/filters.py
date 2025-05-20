from django_filters import rest_framework as filters
from .models import InfraApiErrorLog


class ApiErrorLogFilter(filters.FilterSet):
    """API 错误日志过滤器"""

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
    exceptionTimeBegin = filters.DateTimeFilter(
        field_name="exception_time", lookup_expr="gte", label="异常发生时间起始"
    )
    exceptionTimeEnd = filters.DateTimeFilter(
        field_name="exception_time", lookup_expr="lte", label="异常发生时间结束"
    )
    processStatus = filters.NumberFilter(
        field_name="process_status", lookup_expr="exact", label="处理状态"
    )

    class Meta:
        model = InfraApiErrorLog
        fields = [
            "userId",
            "userType",
            "applicationName",
            "requestUrl",
            "exceptionTimeBegin",
            "exceptionTimeEnd",
            "processStatus",
        ]
