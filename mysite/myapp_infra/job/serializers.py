from rest_framework import serializers
from django_celery_beat.models import PeriodicTask
from mars_framework.serializers.base import CustomDateTimeField


class JobSaveSerializer(serializers.Serializer):
    """任务创建/修改请求序列化器"""

    id = serializers.IntegerField(required=False)
    name = serializers.CharField()
    handlerName = serializers.CharField()
    handlerParam = serializers.CharField(
        required=False, allow_blank=True, allow_null=True
    )  # TODO 前端提示使用关键字参数，例如 {a=1,b=2}
    cronExpression = serializers.CharField()
    # TODO 下面功能待实现，前端提示
    # retryCount = serializers.IntegerField()
    # retryInterval = serializers.IntegerField()
    # monitorTimeout = serializers.IntegerField(required=False)

    def validate_cronExpression(self, value):
        """验证cronExpression"""
        parts = value.split()
        if len(parts) != 5:
            raise serializers.ValidationError("CROM表达式不合法")

        return value


class JobDetailSerializer(serializers.ModelSerializer):
    """任务详情序列化器"""

    status = serializers.SerializerMethodField()
    handlerName = serializers.CharField(source="task")
    handlerParam = serializers.CharField(source="kwargs")
    cronExpression = serializers.SerializerMethodField()
    retryCount = serializers.IntegerField(default=0)  # TODO 待实现，数据库没有该字段
    retryInterval = serializers.IntegerField(default=0)  # TODO 待实现，数据库没有该字段
    monitorTimeout = serializers.IntegerField(
        default=0
    )  # TODO 待实现，数据库没有该字段
    createTime = CustomDateTimeField(
        source="date_changed", read_only=True
    )  # 使用最近修改时间代替

    def get_status(self, obj):
        # 根据 enabled 字段的值返回 status
        if obj.enabled:
            return 1
        else:
            return 2

    def get_cronExpression(self, obj):
        """获取cronExpression"""
        if obj.crontab:
            crontab = obj.crontab
            cron_expression = f"{crontab.minute} {crontab.hour} {crontab.day_of_month} {crontab.month_of_year} {crontab.day_of_week}"
            return cron_expression
        return None

    class Meta:
        model = PeriodicTask
        fields = [
            "id",
            "name",
            "status",
            "handlerName",
            "handlerParam",
            "cronExpression",
            "retryCount",
            "retryInterval",
            "monitorTimeout",
            "createTime",
        ]


# 任务列表序列化器
JobListSerializer = JobDetailSerializer


class JobExportSerializer(serializers.ModelSerializer):
    """任务导出序列化器"""

    job_status = serializers.SerializerMethodField()
    handlerName = serializers.CharField(source="task")
    handlerParam = serializers.CharField(source="kwargs")
    cronExpression = serializers.SerializerMethodField()
    monitorTimeout = serializers.IntegerField(default=0)
    createTime = serializers.DateTimeField(
        format="%Y-%m-%d %H:%M:%S",
        source="date_changed",
        read_only=True,
    )

    def get_job_status(self, obj):
        if obj.enabled:
            return 1
        else:
            return 2

    def get_cronExpression(self, obj):
        """获取cronExpression"""
        if obj.crontab:
            crontab = obj.crontab
            cron_expression = f"{crontab.minute} {crontab.hour} {crontab.day_of_month} {crontab.month_of_year} {crontab.day_of_week}"
            return cron_expression
        return None

    class Meta:
        model = PeriodicTask
        fields = [
            "id",
            "name",
            "job_status",
            "handlerName",
            "handlerParam",
            "cronExpression",
            "monitorTimeout",
            "createTime",
        ]


### 原序列化器
# from rest_framework import serializers
# from mars_framework.serializers.base import CustomDateTimeField
# from .models import InfraJob

# # 任务状态字典
# JOB_STATUS_CHOICES = [
#     (0, "RUNNING"),  # 运行中
#     (1, "SUCCESS"),  # 成功
#     (2, "FAILURE"),  # 失败
# ]


# class JobSaveSerializer(serializers.ModelSerializer):
#     """任务创建/修改请求序列化器"""

#     handlerName = serializers.CharField(source="handler_name")
#     handlerParam = serializers.CharField(
#         source="handler_param", required=False, allow_blank=True
#     )
#     cronExpression = serializers.CharField(source="cron_expression")
#     retryCount = serializers.IntegerField(source="retry_count")
#     retryInterval = serializers.IntegerField(source="retry_interval")
#     monitorTimeout = serializers.IntegerField(
#         source="monitor_timeout", required=False, allow_null=True
#     )

#     class Meta:
#         model = InfraJob
#         fields = [
#             "id",
#             "name",
#             # "status",
#             "handlerName",
#             "handlerParam",
#             "cronExpression",
#             "retryCount",
#             "retryInterval",
#             "monitorTimeout",
#         ]


# class JobStatusUpdateSerializer(serializers.ModelSerializer):
#     """任务状态修改序列化器"""

#     class Meta:
#         model = InfraJob
#         fields = [
#             "id",
#             "status",
#         ]


# class JobDetailSerializer(serializers.ModelSerializer):
#     """任务详情序列化器"""

#     handlerName = serializers.CharField(source="handler_name")
#     handlerParam = serializers.CharField(source="handler_param")
#     cronExpression = serializers.CharField(source="cron_expression")
#     retryCount = serializers.IntegerField(source="retry_count")
#     retryInterval = serializers.IntegerField(source="retry_interval")
#     monitorTimeout = serializers.IntegerField(source="monitor_timeout")
#     createTime = CustomDateTimeField(source="create_time", read_only=True)

#     class Meta:
#         model = InfraJob
#         fields = [
#             "id",
#             "name",
#             "status",
#             "handlerName",
#             "handlerParam",
#             "cronExpression",
#             "retryCount",
#             "retryInterval",
#             "monitorTimeout",
#             "createTime",
#         ]


# # 任务列表序列化器
# JobListSerializer = JobDetailSerializer


# class JobExportSerializer(serializers.ModelSerializer):
#     """任务导出序列化器"""

#     job_status = serializers.IntegerField(source="status")
#     createTime = serializers.DateTimeField(
#         format="%Y-%m-%d %H:%M:%S", source="create_time", read_only=True
#     )

#     class Meta:
#         model = InfraJob
#         fields = [
#             "id",
#             "name",
#             "job_status",
#             "handler_name",
#             "handler_param",
#             "cron_expression",
#             "monitor_timeout",
#             "createTime",
#         ]
