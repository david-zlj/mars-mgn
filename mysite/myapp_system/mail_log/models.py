from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import UserTypeEnum, MailSendStatusEnum


class SystemMailLog(BaseModel):
    """邮箱日志，记录每一次邮件的发送"""

    id = models.BigAutoField(primary_key=True, db_comment="编号", help_text="编号")
    # 用户ID，可通过用户ID查询其邮箱，进行邮件发送
    user_id = models.BigIntegerField(
        blank=True, null=True, db_comment="用户编号", help_text="用户编号"
    )
    user_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in UserTypeEnum],
        default=UserTypeEnum.ADMIN.value,
        blank=True,
        null=True,
        db_comment="用户类型",
        help_text="用户类型",
    )
    to_mail = models.CharField(
        max_length=255, db_comment="接收邮箱地址", help_text="接收邮箱地址"
    )
    account_id = models.ForeignKey(
        "SystemMailAccount",
        on_delete=models.SET_NULL,
        db_constraint=False,
        related_name="mail_logs",
        db_column="account_id",
        blank=True,
        null=True,
        db_comment="邮箱账号编号",
        help_text="邮箱账号编号",
    )
    from_mail = models.CharField(
        max_length=255, db_comment="发送邮箱地址", help_text="发送邮箱地址，冗余"
    )
    # template_id = models.BigIntegerField(db_comment="模板编号", help_text="模板编号")
    template_id = models.ForeignKey(
        "SystemMailTemplate",
        on_delete=models.SET_NULL,
        db_constraint=False,
        related_name="mail_logs",
        db_column="template_id",
        blank=True,
        null=True,
        db_comment="模板编号",
        help_text="模板编号",
    )
    template_code = models.CharField(
        max_length=63, db_comment="模板编码", help_text="模板编码，冗余"
    )
    template_nickname = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="模版发送人名称",
        help_text="模版发送人名称，冗余",
    )
    template_title = models.CharField(
        max_length=255, db_comment="邮件标题", help_text="邮件标题"
    )
    template_content = models.CharField(
        max_length=10240, db_comment="邮件内容", help_text="格式化后的内容"
    )
    template_params = models.CharField(
        max_length=255, db_comment="邮件参数", help_text="输入后的参数"
    )
    send_status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in MailSendStatusEnum],
        db_comment="发送状态",
        help_text="发送状态",
    )
    send_time = models.DateTimeField(
        blank=True, null=True, db_comment="发送时间", help_text="发送时间"
    )
    send_message_id = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="发送返回的消息 ID",
        help_text="发送返回的消息 ID",
    )
    send_exception = models.CharField(
        max_length=4096,
        blank=True,
        null=True,
        db_comment="发送异常",
        help_text="发送异常",
    )

    class Meta:
        managed = False
        db_table = "system_mail_log"
        db_table_comment = "邮件日志表"
        ordering = ["-id"]
