from django_filters import rest_framework as filters
from .models import SystemPost


class SystemPostFilter(filters.FilterSet):
    code = filters.CharFilter(
        field_name="code", lookup_expr="icontains", label="岗位编码（模糊查询）"
    )
    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="岗位名称（模糊查询）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="岗位状态"
    )

    class Meta:
        model = SystemPost
        fields = ["code", "name", "status"]
