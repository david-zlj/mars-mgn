from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import UserTypeEnum, OperateTypeEnum


class InfraApiAccessLog(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="日志主键", help_text="日志主键"
    )
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
    request_params = models.TextField(
        blank=True, null=True, db_comment="请求参数", help_text="请求参数"
    )
    response_body = models.TextField(
        blank=True, null=True, db_comment="响应结果", help_text="响应结果"
    )
    user_ip = models.CharField(max_length=50, db_comment="用户 IP", help_text="用户 IP")
    user_agent = models.CharField(
        max_length=512, db_comment="浏览器 UA", help_text="浏览器 UA"
    )
    operate_module = models.CharField(
        max_length=50,
        blank=True,
        null=True,
        db_comment="操作模块",
        help_text="操作模块",
    )
    operate_name = models.CharField(
        max_length=50, blank=True, null=True, db_comment="操作名", help_text="操作名"
    )
    operate_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in OperateTypeEnum],
        blank=True,
        null=True,
        db_comment="操作分类",
        help_text="操作分类",
    )
    begin_time = models.DateTimeField(
        db_comment="开始请求时间", help_text="开始请求时间"
    )
    end_time = models.DateTimeField(db_comment="结束请求时间", help_text="结束请求时间")
    duration = models.IntegerField(db_comment="执行时长", help_text="执行时长")
    result_code = models.IntegerField(db_comment="结果码", help_text="结果码")
    result_msg = models.CharField(
        max_length=512,
        blank=True,
        null=True,
        db_comment="结果提示",
        help_text="结果提示",
    )
    # tenant_id = models.BigIntegerField(db_comment="租户编号", help_text="租户编号")

    class Meta:
        managed = False
        db_table = "infra_api_access_log"
        db_table_comment = "API 访问日志表"
        ordering = ["-id"]
