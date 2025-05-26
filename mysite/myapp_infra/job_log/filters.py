from django_filters import rest_framework as filters
from django_celery_beat.models import PeriodicTask
from django_celery_results.models import TaskResult

from mars_framework.db.enums import JobLogStatusEnum


class JobLogFilter(filters.FilterSet):
    """定时任务日志过滤器"""

    jobId = filters.NumberFilter(method="filter_jobId")
    taskName = filters.CharFilter(
        field_name="task_name",
        lookup_expr="icontains",
        label="处理器的名字（模糊查询）",
    )
    dateCreated = filters.DateTimeFilter(
        field_name="date_created", lookup_expr="gte", label="开始执行时间（大于等于）"
    )
    dateDone = filters.DateTimeFilter(
        field_name="date_created", lookup_expr="lte", label="结束执行时间（小于等于）"
    )
    status = filters.NumberFilter(method="filter_status")

    def filter_jobId(self, queryset, name, value):
        try:
            # 根据 jobId 查询 PeriodicTask 表
            periodic_task = PeriodicTask.objects.get(id=value)
            return queryset.filter(task_name=periodic_task.task)
        except PeriodicTask.DoesNotExist:
            # 如果没有找到对应的 PeriodicTask，返回空查询集
            return queryset.none()

    def filter_status(self, queryset, name, value):
        try:
            # 根据传入的 value 获取对应的枚举成员
            status_member = JobLogStatusEnum(int(value))
            return queryset.filter(status=status_member.name)
        except:
            # 如果 value 不是有效的枚举值，返回原始查询集
            return queryset

    class Meta:
        model = TaskResult
        fields = ["task_name", "dateCreated", "dateDone", "status"]
