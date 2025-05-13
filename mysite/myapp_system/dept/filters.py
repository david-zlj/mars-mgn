from django_filters import rest_framework as filters
from .models import SystemDept


class DeptFilter(filters.FilterSet):
    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="部门名称（模糊查询）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="部门状态（精确查询）"
    )

    class Meta:
        model = SystemDept
        fields = ["name", "status"]
