from django_filters import rest_framework as filters
from .models import SystemMailLog


class MailLogFilter(filters.FilterSet):
    """邮件日志过滤器"""

    userId = filters.NumberFilter(
        field_name="user_id", lookup_expr="exact", label="用户编号"
    )
    userType = filters.NumberFilter(
        field_name="user_type", lookup_expr="exact", label="用户类型"
    )
    toMail = filters.CharFilter(
        field_name="to_mail", lookup_expr="icontains", label="接收邮箱地址"
    )
    accountId = filters.NumberFilter(
        field_name="account_id", lookup_expr="exact", label="邮箱账号编号"
    )
    templateId = filters.NumberFilter(
        field_name="template_id", lookup_expr="exact", label="模板编号"
    )
    sendStatus = filters.NumberFilter(
        field_name="send_status", lookup_expr="exact", label="发送状态"
    )
    sendTimeBegin = filters.DateTimeFilter(
        field_name="send_time", lookup_expr="gte", label="发送时间开始"
    )
    sendTimeEnd = filters.DateTimeFilter(
        field_name="send_time", lookup_expr="lte", label="发送时间结束"
    )

    class Meta:
        model = SystemMailLog
        fields = [
            "userId",
            "userType",
            "toMail",
            "accountId",
            "templateId",
            "sendStatus",
            "sendTimeBegin",
            "sendTimeEnd",
        ]
