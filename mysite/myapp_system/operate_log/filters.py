from django_filters import rest_framework as filters
from .models import SystemOperateLog


class OperateLogFilter(filters.FilterSet):
    """操作日志过滤器"""

    userId = filters.NumberFilter(
        field_name="user_id", lookup_expr="exact", label="用户编号"
    )
    bizId = filters.NumberFilter(
        field_name="biz_id", lookup_expr="exact", label="操作模块业务编号"
    )
    type = filters.CharFilter(
        field_name="type", lookup_expr="icontains", label="操作模块"
    )
    subType = filters.CharFilter(
        field_name="sub_type", lookup_expr="icontains", label="操作名"
    )
    action = filters.CharFilter(
        field_name="action", lookup_expr="icontains", label="操作明细"
    )
    createTimeBegin = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="gte", label="开始时间"
    )
    createTimeEnd = filters.DateTimeFilter(
        field_name="create_time", lookup_expr="lte", label="结束时间"
    )

    class Meta:
        model = SystemOperateLog
        fields = [
            "userId",
            "bizId",
            "type",
            "subType",
            "action",
            "createTimeBegin",
            "createTimeEnd",
        ]
