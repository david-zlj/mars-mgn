from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import UserTypeEnum, ApiErrorLogProcessStatusEnum


class InfraApiErrorLog(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="编号", help_text="编号")
    trace_id = models.CharField(
        max_length=64, db_comment="链路追踪编号", help_text="链路追踪编号"
    )
    # user_id = models.BigIntegerField(db_comment="用户编号", help_text="用户编号")
    # user_type = models.IntegerField(db_comment="用户类型", help_text="用户类型")
    user_id = models.ForeignKey(
        "SystemUsers",
        on_delete=models.SET_NULL,
        db_column="user_id",
        db_constraint=False,
        related_name="operate_logs",
        blank=True,
        null=True,
        db_comment="用户编号",
        help_text="用户编号",
    )
    user_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in UserTypeEnum],
        default=UserTypeEnum.ADMIN.value,
        db_comment="用户类型",
        help_text="用户类型",
    )
    application_name = models.CharField(
        max_length=50, db_comment="应用名", help_text="应用名"
    )
    request_method = models.CharField(
        max_length=16, db_comment="请求方法名", help_text="请求方法名"
    )
    request_url = models.CharField(
        max_length=255, db_comment="请求地址", help_text="请求地址"
    )
    request_params = models.CharField(
        max_length=8000, db_comment="请求参数", help_text="请求参数"
    )
    user_ip = models.CharField(max_length=50, db_comment="用户 IP", help_text="用户 IP")
    user_agent = models.CharField(
        max_length=512, db_comment="浏览器 UA", help_text="浏览器 UA"
    )
    exception_time = models.DateTimeField(
        db_comment="异常发生时间", help_text="异常发生时间"
    )
    exception_name = models.CharField(
        max_length=128, db_comment="异常名", help_text="异常名"
    )
    exception_message = models.TextField(
        db_comment="异常导致的消息", help_text="异常导致的消息"
    )
    exception_root_cause_message = models.TextField(
        db_comment="异常导致的根消息", help_text="异常导致的根消息"
    )
    exception_stack_trace = models.TextField(
        db_comment="异常的栈轨迹", help_text="异常的栈轨迹"
    )
    exception_class_name = models.CharField(
        max_length=512, db_comment="异常发生的类全名", help_text="异常发生的类全名"
    )
    exception_file_name = models.CharField(
        max_length=512, db_comment="异常发生的类文件", help_text="异常发生的类文件"
    )
    exception_method_name = models.CharField(
        max_length=512, db_comment="异常发生的方法名", help_text="异常发生的方法名"
    )
    exception_line_number = models.IntegerField(
        db_comment="异常发生的方法所在行", help_text="异常发生的方法所在行"
    )
    process_status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in ApiErrorLogProcessStatusEnum],
        db_comment="处理状态",
        help_text="处理状态",
    )
    process_time = models.DateTimeField(
        blank=True, null=True, db_comment="处理时间", help_text="处理时间"
    )
    process_user_id = models.IntegerField(
        blank=True, null=True, db_comment="处理用户编号", help_text="处理用户编号"
    )
    # tenant_id = models.BigIntegerField(db_comment="租户编号", help_text="租户编号")

    class Meta:
        managed = False
        db_table = "infra_api_error_log"
        db_table_comment = "系统异常日志"
        ordering = ["-id"]
