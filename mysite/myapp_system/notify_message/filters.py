from django_filters import rest_framework as filters
from .models import SystemNotifyMessage


class MyNotifyMessageFilter(filters.FilterSet):
    """我的站内信消息过滤器"""

    readStatus = filters.BooleanFilter(
        field_name="read_status", lookup_expr="exact", label="是否已读"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte"
    )
    createTimeEnd = filters.DateTimeFilter(field_name="create_time", lookup_expr="lte")

    class Meta:
        model = SystemNotifyMessage
        fields = ["readStatus", "createTimeBegin", "createTimeEnd"]


class NotifyMessageFilter(filters.FilterSet):
    """站内信管理-消息记录过滤器"""

    # 用户编号
    userId = filters.NumberFilter(
        field_name="user_id", lookup_expr="exact", label="用户编号"
    )

    # 用户类型
    userType = filters.NumberFilter(
        field_name="user_type", lookup_expr="exact", label="用户类型"
    )

    # 模板编码（模糊查询）
    templateCode = filters.CharFilter(
        field_name="template_code",
        lookup_expr="icontains",
        label="模板编码（模糊查询）",
    )

    # 模板类型
    templateType = filters.NumberFilter(
        field_name="template_type", lookup_expr="exact", label="模板类型"
    )

    # 创建时间范围
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte"
    )
    createTimeEnd = filters.DateTimeFilter(field_name="create_time", lookup_expr="lte")

    class Meta:
        model = SystemNotifyMessage
        fields = [
            "userId",
            "userType",
            "templateCode",
            "templateType",
            "createTimeBegin",
            "createTimeEnd",
        ]
