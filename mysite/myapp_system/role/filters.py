from django_filters import rest_framework as filters
from .models import SystemRole
from django_filters.filters import DateTimeFromToRangeFilter


class SystemRoleFilter(filters.FilterSet):
    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="角色名称（模糊查询）"
    )
    code = filters.CharFilter(
        field_name="code", lookup_expr="icontains", label="角色标识（模糊查询）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="展示状态"
    )
    # create_time = DateTimeFromToRangeFilter(
    #     field_name="create_time", label="创建时间范围"
    # )

    class Meta:
        model = SystemRole
        fields = ["name", "code", "status"]
