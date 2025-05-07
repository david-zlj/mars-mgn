from django_filters import rest_framework as filters
from .models import SystemNotifyMessage
from django_filters.filters import DateTimeFromToRangeFilter


class NotifyMessageFilter(filters.FilterSet):
    """站内信消息过滤器"""

    # 用户编号
    user_id = filters.NumberFilter(
        field_name="user_id", lookup_expr="exact", label="用户编号"
    )

    # 用户类型
    user_type = filters.NumberFilter(
        field_name="user_type", lookup_expr="exact", label="用户类型"
    )

    # 模板编码（模糊查询）
    template_code = filters.CharFilter(
        field_name="template_code",
        lookup_expr="icontains",
        label="模板编码（模糊查询）",
    )

    # 模板类型
    template_type = filters.NumberFilter(
        field_name="template_type", lookup_expr="exact", label="模板类型"
    )

    # 创建时间范围 TODO
    create_time = DateTimeFromToRangeFilter(
        field_name="create_time", label="创建时间范围"
    )

    class Meta:
        model = SystemNotifyMessage
        fields = [
            "user_id",
            "user_type",
            "template_code",
            "template_type",
            "create_time",
        ]


class MyNotifyMessageFilter(filters.FilterSet):
    """我的站内信消息过滤器"""

    readStatus = filters.BooleanFilter(
        field_name="read_status", lookup_expr="exact", label="是否已读"
    )
    # TODO 
    create_time = DateTimeFromToRangeFilter(
        field_name="create_time", label="创建时间范围"
    )

    class Meta:
        model = SystemNotifyMessage
        fields = ["readStatus", "create_time"]
