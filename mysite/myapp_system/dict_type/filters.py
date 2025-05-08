from django_filters import rest_framework as filters
from .models import SystemDictType


class DictTypeFilter(filters.FilterSet):
    """
    字典类型过滤器
    """

    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="字典类型名称（模糊匹配）"
    )
    type = filters.CharFilter(
        field_name="type", lookup_expr="icontains", label="字典类型（模糊匹配）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="展示状态"
    )
    # TODO
    createTimeStart = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="创建时间开始"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="创建时间结束"
    )

    class Meta:
        model = SystemDictType
        fields = ["name", "type", "status", "createTimeStart", "createTimeEnd"]
