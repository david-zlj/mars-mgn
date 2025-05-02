from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import JOB_LOG_STATUS_CHOICES


class InfraJobLog(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="日志编号", help_text="日志编号"
    )
    job_id = models.BigIntegerField(db_comment="任务编号", help_text="任务编号")
    handler_name = models.CharField(
        max_length=64, db_comment="处理器的名字", help_text="处理器的名字"
    )
    handler_param = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="处理器的参数",
        help_text="处理器的参数",
    )
    execute_index = models.IntegerField(
        default=1,
        db_comment="第几次执行",
        help_text="第几次执行，用于区分是不是重试执行。如果是重试执行，则 index 大于 1",
    )
    begin_time = models.DateTimeField(
        db_comment="开始执行时间", help_text="开始执行时间"
    )
    end_time = models.DateTimeField(
        blank=True, null=True, db_comment="结束执行时间", help_text="结束执行时间"
    )
    duration = models.IntegerField(
        blank=True, null=True, db_comment="执行时长", help_text="执行时长，单位：毫秒"
    )
    status = models.SmallIntegerField(
        choices=JOB_LOG_STATUS_CHOICES, db_comment="任务状态", help_text="任务状态"
    )
    result = models.CharField(
        max_length=4000,
        blank=True,
        null=True,
        db_comment="结果数据",
        help_text="结果数据",
    )

    class Meta:
        managed = False
        db_table = "infra_job_log"
        db_table_comment = "定时任务日志表"
        ordering = ["-id"]


# from django.db import models


# class InfraJobLog(models.Model):
#     id = models.BigAutoField(primary_key=True, db_comment="日志编号")
#     job_id = models.BigIntegerField(db_comment="任务编号")
#     handler_name = models.CharField(max_length=64, db_comment="处理器的名字")
#     handler_param = models.CharField(
#         max_length=255, blank=True, null=True, db_comment="处理器的参数"
#     )
#     execute_index = models.IntegerField(db_comment="第几次执行")
#     begin_time = models.DateTimeField(db_comment="开始执行时间")
#     end_time = models.DateTimeField(blank=True, null=True, db_comment="结束执行时间")
#     duration = models.IntegerField(blank=True, null=True, db_comment="执行时长")
#     status = models.IntegerField(db_comment="任务状态")
#     result = models.CharField(
#         max_length=4000, blank=True, null=True, db_comment="结果数据"
#     )
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
#         db_table = "infra_job_log"
#         db_table_comment = "定时任务日志表"
