from django_filters import rest_framework as filters
from django_celery_beat.models import PeriodicTask
from mars_framework.db.enums import JobStatusEnum


class JobFilter(filters.FilterSet):
    """定时任务过滤器"""

    name = filters.CharFilter(
        field_name="name", lookup_expr="icontains", label="任务名称（模糊查询）"
    )
    status = filters.ChoiceFilter(
        choices=[(item.value, item.name) for item in JobStatusEnum],
        method="filter_status",
        label="任务状态",
    )
    task = filters.CharFilter(
        field_name="task",
        lookup_expr="icontains",
        label="处理器的名字（模糊查询）",
    )

    def filter_status(self, queryset, name, value):
        if value == "1":  # status 为 1，对应 enabled 为 True
            return queryset.filter(enabled=True)
        elif value == "2":  # status 为 2，对应 enabled 为 False
            return queryset.filter(enabled=False)

    class Meta:
        model = PeriodicTask
        fields = ["name", "task"]
