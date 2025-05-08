from django_filters import rest_framework as filters
from .models import SystemDictData


class DictDataFilter(filters.FilterSet):
    """字典数据过滤器"""

    label = filters.CharFilter(
        field_name="label", lookup_expr="exact", label="字典标签"
    )
    dictType = filters.CharFilter(
        field_name="dict_type", lookup_expr="icontains", label="字典类型（模糊查询）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="展示状态"
    )

    class Meta:
        model = SystemDictData
        fields = ["label", "dictType", "status"]
