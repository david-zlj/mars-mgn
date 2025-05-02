from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import JOB_STATUS_CHOICES


class InfraJob(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="任务编号", help_text="任务编号"
    )
    name = models.CharField(max_length=32, db_comment="任务名称", help_text="任务名称")
    status = models.SmallIntegerField(
        choices=JOB_STATUS_CHOICES,
        default=2,
        db_comment="任务状态",
        help_text="任务状态",
    )
    handler_name = models.CharField(
        max_length=64,
        db_comment="处理器的名字",
        help_text="处理器的名字",
    )
    handler_param = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="处理器的参数",
        help_text="处理器的参数",
    )
    cron_expression = models.CharField(
        max_length=32, db_comment="CRON 表达式", help_text="CRON 表达式"
    )
    retry_count = models.IntegerField(
        default=0, db_comment="重试次数", help_text="重试次数，如果不重试，则设置为 0"
    )
    retry_interval = models.IntegerField(
        default=0,
        db_comment="重试间隔",
        help_text="重试间隔，单位：毫秒。如果没有间隔，则设置为 0",
    )
    monitor_timeout = models.IntegerField(
        default=0,
        db_comment="监控超时时间",
        help_text="监控超时时间，单位：毫秒。为空时，表示不监控。注意，这里的超时的目的，不是进行任务的取消，而是告警任务的执行时间过长",
    )

    class Meta:
        managed = False
        db_table = "infra_job"
        db_table_comment = "定时任务表"
        ordering = ["-id"]


# 信号同步机制：当InfraJob新增/修改时触发
# @receiver(post_save, sender=InfraJob)
# def sync_celery_tasks(sender, instance, **kwargs):
#     schedule, _ = CrontabSchedule.objects.from_schedule(instance.cron_expression)

#     PeriodicTask.objects.update_or_create(
#         name=f"job_{instance.id}",
#         defaults={
#             "crontab": schedule,
#             "task": "core.tasks.execute_job_task",
#             "args": [instance.id],
#             "enabled": instance.status == 1,
#         },
#     )

# from django.db import models


# class InfraJob(models.Model):
#     id = models.BigAutoField(primary_key=True, db_comment="任务编号")
#     name = models.CharField(max_length=32, db_comment="任务名称")
#     status = models.IntegerField(db_comment="任务状态")
#     handler_name = models.CharField(max_length=64, db_comment="处理器的名字")
#     handler_param = models.CharField(
#         max_length=255, blank=True, null=True, db_comment="处理器的参数"
#     )
#     cron_expression = models.CharField(max_length=32, db_comment="CRON 表达式")
#     retry_count = models.IntegerField(db_comment="重试次数")
#     retry_interval = models.IntegerField(db_comment="重试间隔")
#     monitor_timeout = models.IntegerField(db_comment="监控超时时间")
#     creator = models.CharField(
#         max_length=64, blank=True, null=True, db_comment="创建者"
#     )
#     create_time = models.DateTimeField(db_comment="创建时间")
#     updater = models.CharField(
#         max_length=64, blank=True, null=True, db_comment="更新者"
#     )
#     update_time = models.DateTimeField(db_comment="更新时间")
#     deleted = models.IntegerField(blank=True, null=True)

#     class Meta:
#         managed = False
#         db_table = "infra_job"
#         db_table_comment = "定时任务表"
