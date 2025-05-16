from django_filters import rest_framework as filters
from .models import SystemNotifyTemplate


class NotifyTemplateFilter(filters.FilterSet):
    """站内信模板过滤器"""

    code = filters.CharFilter(
        field_name="code", lookup_expr="icontains", label="模板编码"
    )
    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="模板名称"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="状态"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte"
    )
    createTimeEnd = filters.DateTimeFilter(field_name="create_time", lookup_expr="lte")

    class Meta:
        model = SystemNotifyTemplate
        fields = ["code", "name", "status", "createTimeBegin", "createTimeEnd"]
