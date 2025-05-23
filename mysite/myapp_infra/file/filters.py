from django_filters import rest_framework as filters
from .models import InfraFile


class InfraFileFilter(filters.FilterSet):
    """文件过滤器"""

    path = filters.CharFilter(
        field_name="path", lookup_expr="icontains", label="文件路径"
    )
    type = filters.CharFilter(
        field_name="type", lookup_expr="icontains", label="文件类型"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="创建时间开始"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="创建时间结束"
    )

    class Meta:
        model = InfraFile
        fields = ["path", "type", "createTimeBegin", "createTimeEnd"]
