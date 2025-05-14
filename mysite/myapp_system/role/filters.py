from django_filters import rest_framework as filters
from .models import SystemRole


class RoleFilter(filters.FilterSet):
    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="角色名称（模糊查询）"
    )
    code = filters.CharFilter(
        field_name="code", lookup_expr="icontains", label="角色标识（模糊查询）"
    )
    status = filters.NumberFilter(
        field_name="status", lookup_expr="exact", label="展示状态"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte"
    )
    createTimeEnd = filters.DateTimeFilter(field_name="create_time", lookup_expr="lte")

    class Meta:
        model = SystemRole
        fields = [
            "name",
            "code",
            "status",
            "createTimeBegin",
            "createTimeEnd",
        ]
