from django_filters import rest_framework as filters
from .models import InfraConfig


class InfraConfigFilter(filters.FilterSet):
    """参数配置过滤器"""

    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="参数名称，模糊匹配"
    )
    configKey = filters.CharFilter(
        field_name="config_key", lookup_expr="icontains", label="参数键名，模糊匹配"
    )
    type = filters.NumberFilter(
        field_name="type",
        lookup_expr="exact",
        label="参数类型，参见 ConfigTypeEnum 枚举",
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="创建时间开始"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="创建时间结束"
    )

    class Meta:
        model = InfraConfig
        fields = ["name", "configKey", "type", "createTimeBegin", "createTimeEnd"]
