from rest_framework import serializers
from django_celery_beat.models import PeriodicTask
from django_celery_results.models import TaskResult

from mars_framework.serializers.base import CustomDateTimeField


class JobLogDetailSerializer(serializers.ModelSerializer):
    """定时任务日志详情序列化器"""

    jobId = serializers.SerializerMethodField()
    handlerName = serializers.CharField(source="task_name", read_only=True)
    handlerParam = serializers.CharField(source="task_kwargs", read_only=True)
    executeIndex = serializers.SerializerMethodField()
    beginTime = CustomDateTimeField(
        source="date_started", read_only=True
    )  # TODO 时区问题
    endTime = CustomDateTimeField(source="date_done", read_only=True)
    duration = serializers.SerializerMethodField()
    status = serializers.SerializerMethodField()
    createTime = CustomDateTimeField(source="date_created", read_only=True)

    def get_periodic_task(self, obj):
        """
        缓存查询结果，避免重复查询
        TODO 性能优化
        """
        if not hasattr(obj, "cached_periodic_task"):
            try:
                obj.cached_periodic_task = PeriodicTask.objects.get(task=obj.task_name)
            except PeriodicTask.DoesNotExist:
                obj.cached_periodic_task = None
        return obj.cached_periodic_task

    def get_jobId(self, obj):
        periodic_task = self.get_periodic_task(obj)
        return periodic_task.id if periodic_task else None

    def get_executeIndex(self, obj):
        periodic_task = self.get_periodic_task(obj)
        return periodic_task.total_run_count if periodic_task else None

    def get_duration(self, obj):
        """
        计算执行时长（单位：毫秒）
        从任务提交到结束总时长，单位毫秒
        """
        if obj.date_created and obj.date_done:
            duration = obj.date_done - obj.date_created
            # 将timedelta对象转换为毫秒
            milliseconds = int(duration.total_seconds() * 1000)
            return milliseconds
        return None

    def get_status(self, obj):
        status_mapping = {"STARTED": 0, "SUCCESS": 1, "FAILURE": 2}
        return status_mapping.get(obj.status, None)  # 如果status不在映射中，返回None

    class Meta:
        model = TaskResult
        fields = [
            "id",
            "jobId",
            "handlerName",
            "handlerParam",
            "executeIndex",
            "beginTime",
            "endTime",
            "duration",
            "status",
            "result",
            "createTime",
        ]


# 定时任务日志列表序列化器
JobLogListSerializer = JobLogDetailSerializer


class JobLogExportSerializer(serializers.ModelSerializer):
    """定时任务日志导出序列化器"""

    jobId = serializers.SerializerMethodField()
    handlerName = serializers.CharField(source="task_name", read_only=True)
    handlerParam = serializers.CharField(source="task_kwargs", read_only=True)
    executeIndex = serializers.SerializerMethodField()
    beginTime = serializers.DateTimeField(
        format="%Y-%m-%d %H:%M:%S", source="date_started", read_only=True
    )  # TODO 时区问题
    endTime = serializers.DateTimeField(
        format="%Y-%m-%d %H:%M:%S", source="date_done", read_only=True
    )
    duration = serializers.SerializerMethodField()
    job_log_status = serializers.SerializerMethodField()
    createTime = serializers.DateTimeField(
        format="%Y-%m-%d %H:%M:%S", source="date_created", read_only=True
    )

    def get_periodic_task(self, obj):
        """
        缓存查询结果，避免重复查询
        TODO 性能优化
        """
        if not hasattr(obj, "cached_periodic_task"):
            try:
                obj.cached_periodic_task = PeriodicTask.objects.get(task=obj.task_name)
            except PeriodicTask.DoesNotExist:
                obj.cached_periodic_task = None
        return obj.cached_periodic_task

    def get_jobId(self, obj):
        periodic_task = self.get_periodic_task(obj)
        return periodic_task.id if periodic_task else None

    def get_executeIndex(self, obj):
        periodic_task = self.get_periodic_task(obj)
        return periodic_task.total_run_count if periodic_task else None

    def get_duration(self, obj):
        """
        计算执行时长（单位：毫秒）
        从任务提交到结束总时长，单位毫秒
        """
        if obj.date_created and obj.date_done:
            duration = obj.date_done - obj.date_created
            # 将timedelta对象转换为毫秒
            milliseconds = int(duration.total_seconds() * 1000)
            return milliseconds
        return None

    def get_job_log_status(self, obj):
        status_mapping = {"STARTED": 0, "SUCCESS": 1, "FAILURE": 2}
        return status_mapping.get(obj.status, None)  # 如果status不在映射中，返回None

    class Meta:
        model = TaskResult
        fields = [
            "id",
            "jobId",
            "handlerName",
            "handlerParam",
            "executeIndex",
            "beginTime",
            "endTime",
            "duration",
            "job_log_status",
            "result",
            "createTime",
        ]


### 原序列化器
# from rest_framework import serializers
# from mars_framework.serializers.base import CustomDateTimeField
# from .models import InfraJobLog


# class InfraJobLogSaveSerializer(serializers.ModelSerializer):
#     """定时任务日志创建/修改请求序列化器"""

#     jobId = serializers.IntegerField(source="job_id")
#     handlerName = serializers.CharField(source="handler_name")
#     handlerParam = serializers.CharField(
#         source="handler_param", required=False, allow_blank=True, allow_null=True
#     )
#     executeIndex = serializers.IntegerField(source="execute_index", required=False)
#     beginTime = serializers.DateTimeField(source="begin_time")
#     endTime = serializers.DateTimeField(
#         source="end_time", required=False, allow_null=True
#     )

#     class Meta:
#         model = InfraJobLog
#         fields = [
#             "id",
#             "jobId",
#             "handlerName",
#             "handlerParam",
#             "executeIndex",
#             "beginTime",
#             "endTime",
#             "duration",
#             "status",
#             "result",
#         ]


# class InfraJobLogDetailSerializer(serializers.ModelSerializer):
#     """定时任务日志详情序列化器"""

#     jobId = serializers.IntegerField(source="job_id", read_only=True)
#     handlerName = serializers.CharField(source="handler_name", read_only=True)
#     handlerParam = serializers.CharField(source="handler_param", read_only=True)
#     executeIndex = serializers.IntegerField(source="execute_index", read_only=True)
#     beginTime = CustomDateTimeField(source="begin_time", read_only=True)
#     endTime = CustomDateTimeField(source="end_time", read_only=True)
#     createTime = CustomDateTimeField(source="create_time", read_only=True)

#     class Meta:
#         model = InfraJobLog
#         fields = [
#             "id",
#             "jobId",
#             "handlerName",
#             "handlerParam",
#             "executeIndex",
#             "beginTime",
#             "endTime",
#             "duration",
#             "status",
#             "result",
#             "createTime",
#         ]


# class InfraJobLogListSerializer(serializers.ModelSerializer):
#     """定时任务日志列表序列化器"""

#     jobId = serializers.IntegerField(source="job_id", read_only=True)
#     handlerName = serializers.CharField(source="handler_name", read_only=True)
#     handlerParam = serializers.CharField(source="handler_param", read_only=True)
#     executeIndex = serializers.IntegerField(source="execute_index", read_only=True)
#     beginTime = CustomDateTimeField(source="begin_time", read_only=True)
#     endTime = CustomDateTimeField(source="end_time", read_only=True)
#     createTime = CustomDateTimeField(source="create_time", read_only=True)

#     class Meta:
#         model = InfraJobLog
#         fields = [
#             "id",
#             "jobId",
#             "handlerName",
#             "handlerParam",
#             "executeIndex",
#             "beginTime",
#             "endTime",
#             "duration",
#             "status",
#             "result",
#             "createTime",
#         ]


# class InfraJobLogExportSerializer(serializers.ModelSerializer):
#     """定时任务日志导出序列化器"""

#     beginTime = serializers.DateTimeField(
#         format="%Y-%m-%d %H:%M:%S", source="begin_time", read_only=True
#     )
#     endTime = serializers.DateTimeField(
#         format="%Y-%m-%d %H:%M:%S", source="end_time", read_only=True
#     )
#     createTime = serializers.DateTimeField(
#         format="%Y-%m-%d %H:%M:%S", source="create_time", read_only=True
#     )

#     job_log_status = serializers.IntegerField(source="status", read_only=True)

#     class Meta:
#         model = InfraJobLog
#         fields = [
#             "id",
#             "job_id",
#             "handler_name",
#             "handler_param",
#             "execute_index",
#             "beginTime",
#             "endTime",
#             "duration",
#             "job_log_status",
#             "result",
#             "createTime",
#         ]
