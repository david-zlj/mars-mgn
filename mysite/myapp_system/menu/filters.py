from django_filters import rest_framework as filters
from .models import SystemMenu


class SystemMenuFilter(filters.FilterSet):
    name = filters.CharFilter(
        field_name="name",
        lookup_expr="icontains",
        label="菜单名称（模糊匹配）",
        help_text="菜单名称（模糊匹配）",
    )

    status = filters.NumberFilter(
        field_name="status",
        lookup_expr="exact",
        label="展示状态",
        help_text="展示状态，参见 CommonStatusEnum 枚举类",
    )

    class Meta:
        model = SystemMenu
        fields = ["name", "status"]
