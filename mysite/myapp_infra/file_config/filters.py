from django_filters import rest_framework as filters
from .models import InfraFileConfig


class InfraFileConfigFilter(filters.FilterSet):
    """文件配置过滤器"""

    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="配置名"
    )
    storage = filters.NumberFilter(
        field_name="storage", lookup_expr="exact", label="存储器"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="创建时间开始"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="创建时间结束"
    )

    class Meta:
        model = InfraFileConfig
        fields = ["name", "storage", "createTimeBegin", "createTimeEnd"]
