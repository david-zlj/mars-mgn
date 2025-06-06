from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import LoginLogTypeEnum, LoginResultEnum, UserTypeEnum


class SystemLoginLog(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="访问ID", help_text="访问ID")
    log_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in LoginLogTypeEnum],
        db_comment="日志类型",
        help_text="日志类型",
    )
    user_id = models.BigIntegerField(
        null=True, blank=True, db_comment="用户编号", help_text="用户编号"
    )
    user_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in UserTypeEnum],
        default=UserTypeEnum.ADMIN.value,
        null=True,
        blank=True,
        db_comment="用户类型",
        help_text="用户类型",
    )
    username = models.CharField(
        max_length=30,
        db_comment="用户账号",
        help_text="用户账号",
    )
    result = models.IntegerField(
        choices=[(item.value, item.name) for item in LoginResultEnum],
        db_comment="登陆结果",
        help_text="登陆结果",
    )
    user_ip = models.CharField(max_length=50, db_comment="用户 IP", help_text="用户 IP")
    user_agent = models.CharField(
        max_length=512, db_comment="浏览器 UA", help_text="浏览器 UA"
    )

    class Meta:
        managed = True
        db_table = "system_login_log"
        db_table_comment = "系统访问记录"
        ordering = ["-id"]
