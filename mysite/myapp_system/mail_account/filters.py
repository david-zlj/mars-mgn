from django_filters import rest_framework as filters
from .models import SystemMailAccount


class MailAccountFilter(filters.FilterSet):
    """邮箱账号过滤器"""

    mail = filters.CharFilter(
        field_name="mail", lookup_expr="icontains", label="邮箱（模糊查询）"
    )
    username = filters.CharFilter(
        field_name="username", lookup_expr="icontains", label="用户名（模糊查询）"
    )

    class Meta:
        model = SystemMailAccount
        fields = ["mail", "username"]
