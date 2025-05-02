from django_filters import rest_framework as filters
from django_celery_beat.models import PeriodicTask
from django_celery_results.models import TaskResult


class JobLogFilter(filters.FilterSet):
    """定时任务日志过滤器"""

    jobId = filters.NumberFilter(method="filter_jobId")
    handlerName = filters.CharFilter(
        field_name="task_name",
        lookup_expr="icontains",
        label="处理器的名字（模糊查询）",
    )
    beginTime = filters.DateTimeFilter(
        field_name="date_created", lookup_expr="gte", label="开始执行时间（大于等于）"
    )
    endTime = filters.DateTimeFilter(
        field_name="date_done", lookup_expr="lte", label="结束执行时间（小于等于）"
    )
    status = filters.NumberFilter(method="filter_status")

    def filter_jobId(self, queryset, name, value):
        try:
            # 根据 jobId 查询 PeriodicTask 表
            periodic_task = PeriodicTask.objects.get(id=value)
            # 获取 PeriodicTask 的 task 字段值
            task_value = periodic_task.task
            # 在 TaskResult 表中过滤 task_name 等于 task_value 的结果
            return queryset.filter(task_name=task_value)
        except PeriodicTask.DoesNotExist:
            # 如果没有找到对应的 PeriodicTask，返回空查询集
            return queryset.none()

    def filter_status(self, queryset, name, value):
        status_mapping = {0: "STARTED", 1: "SUCCESS", 2: "FAILURE"}
        # 根据传入的 value 获取对应的 status 字符串
        status_value = status_mapping.get(int(value))
        if status_value:
            return queryset.filter(status=status_value)
        return queryset  # 如果 value 不在映射中，返回原始查询集

    class Meta:
        model = TaskResult
        fields = ["handlerName", "beginTime", "endTime", "status"]


# class InfraJobLogFilter(filters.FilterSet):
#     """定时任务日志过滤器"""

#     jobId = filters.NumberFilter(
#         field_name="job_id", lookup_expr="exact", label="任务编号"
#     )
#     handlerName = filters.CharFilter(
#         field_name="handler_name",
#         lookup_expr="icontains",
#         label="处理器的名字（模糊查询）",
#     )
#     beginTime = filters.DateTimeFilter(
#         field_name="begin_time", lookup_expr="gte", label="开始执行时间（大于等于）"
#     )
#     endTime = filters.DateTimeFilter(
#         field_name="end_time", lookup_expr="lte", label="结束执行时间（小于等于）"
#     )
#     status = filters.NumberFilter(
#         field_name="status", lookup_expr="exact", label="任务状态"
#     )

#     class Meta:
#         model = InfraJobLog
#         fields = ["jobId", "handlerName", "beginTime", "endTime", "status"]
