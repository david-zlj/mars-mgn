from django_filters import rest_framework as filters
from .models import SystemDictData


class DictDataFilter(filters.FilterSet):
    label = filters.CharFilter(
        field_name="label", lookup_expr="exact", label="字典标签"
    )
    # TODO 命名方式是否会自动转换
    dict_type = filters.CharFilter(
        field_name="dict_type", lookup_expr="icontains", label="字典类型（模糊查询）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="展示状态"
    )

    class Meta:
        model = SystemDictData
        fields = ["label", "dict_type", "status"]
