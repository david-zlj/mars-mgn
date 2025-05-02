from django_filters import rest_framework as filters
from django_celery_beat.models import PeriodicTask


class PeriodicTaskFilter(filters.FilterSet):
    """定时任务过滤器"""

    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="任务名称（模糊查询）"
    )
    # status = filters.NumberFilter(
    #     field_name="enabled", lookup_expr="exact", label="任务状态"
    # )
    status = filters.ChoiceFilter(
        choices=[
            (1, "Enabled"),
            (2, "Disabled"),
        ],
        method="filter_status",
        label="任务状态",
    )
    handlerName = filters.CharFilter(
        field_name="task",
        lookup_expr="icontains",
        label="处理器的名字（模糊查询）",
    )

    def filter_status(self, queryset, name, value):
        if value == "1":  # status 为 1，对应 enabled 为 True
            return queryset.filter(enabled=True)
        elif value == "2":  # status 为 2，对应 enabled 为 False
            return queryset.filter(enabled=False)
        return queryset  # 如果值无效，返回原始查询集

    class Meta:
        model = PeriodicTask
        fields = ["name", "handlerName"]


# class InfraJobFilter(filters.FilterSet):
#     """定时任务过滤器"""

#     name = filters.CharFilter(
#         field_name="name", lookup_expr="icontains", label="任务名称（模糊查询）"
#     )
#     status = filters.NumberFilter(
#         field_name="status", lookup_expr="exact", label="任务状态"
#     )
#     handlerName = filters.CharFilter(
#         field_name="handler_name",
#         lookup_expr="icontains",
#         label="处理器的名字（模糊查询）",
#     )

#     class Meta:
#         model = InfraJob
#         fields = ["name", "status", "handlerName"]
