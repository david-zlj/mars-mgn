from django_filters import rest_framework as filters
from .models import SystemMailTemplate


class MailTemplateFilter(filters.FilterSet):
    """邮件模板过滤器"""

    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="状态"
    )
    code = filters.CharFilter(
        field_name="code", lookup_expr="icontains", label="标识（模糊匹配）"
    )
    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="名称（模糊匹配）"
    )
    accountId = filters.NumberFilter(
        field_name="account_id", lookup_expr="exact", label="账号编号"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="创建时间开始"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="创建时间结束"
    )

    class Meta:
        model = SystemMailTemplate
        fields = [
            "status",
            "code",
            "name",
            "accountId",
            "createTimeBegin",
            "createTimeEnd",
        ]
