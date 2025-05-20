from django.db import models

from mars_framework.db.base import BaseModel
from mars_framework.db.enums import UserTypeEnum


class SystemOperateLog(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="日志主键", help_text="日志主键"
    )
    trace_id = models.CharField(
        null=True,
        blank=True,
        max_length=64,
        db_comment="链路追踪编号",
        help_text="链路追踪编号，多用于分布式系统和微服务架构",
    )
    user_id = models.BigIntegerField(
        null=True, blank=True, db_comment="用户编号", help_text="用户编号"
    )
    username = models.CharField(
        max_length=30,
        null=True,
        blank=True,
        db_comment="用户账号",
        help_text="用户账号，冗余",
    )
    nickname = models.CharField(
        max_length=30,
        null=True,
        blank=True,
        db_comment="用户昵称",
        help_text="用户昵称，冗余",
    )
    user_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in UserTypeEnum],
        default=UserTypeEnum.ADMIN.value,
        db_comment="用户类型",
        help_text="用户类型",
    )
    request_method = models.CharField(
        max_length=16,
        blank=True,
        null=True,
        db_comment="请求方法",
        help_text="请求方法",
    )
    request_url = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="请求地址",
        help_text="请求地址",
    )
    user_ip = models.CharField(
        max_length=50, blank=True, null=True, db_comment="用户 IP", help_text="用户 IP"
    )
    user_agent = models.CharField(
        max_length=512,
        blank=True,
        null=True,
        db_comment="浏览器 UA",
        help_text="浏览器 UA",
    )
    type = models.CharField(
        blank=True,
        null=True,
        max_length=50,
        db_comment="操作模块类型",
        help_text="操作模块类型",
    )
    sub_type = models.CharField(
        null=True, blank=True, max_length=50, db_comment="操作名", help_text="操作名"
    )
    biz_id = models.BigIntegerField(
        blank=True,
        null=True,
        db_comment="操作数据模块编号",
        help_text="操作数据模块编号",
    )
    # TODO
    action = models.CharField(
        blank=True,
        null=True,
        max_length=512,
        db_comment="操作内容",
        help_text="操作内容",
    )
    success = models.BooleanField(
        null=True,
        blank=True,
        db_comment="操作结果",
        help_text="操作结果，code=0表示成功",
    )
    status_code = models.IntegerField(
        null=True, blank=True, db_comment="HTTP状态码", help_text="HTTP状态码"
    )
    response = models.CharField(
        blank=True,
        null=True,
        max_length=512,
        db_comment="响应内容",
        help_text="响应内容",
    )

    execution_time = models.IntegerField(
        null=True, blank=True, db_comment="执行时长", help_text="执行时长，单位毫秒"
    )

    class Meta:
        managed = False
        db_table = "system_operate_log"
        db_table_comment = "操作日志记录"
        ordering = ["-id"]
