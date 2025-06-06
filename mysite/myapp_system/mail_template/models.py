from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import CommonStatusEnum


class SystemMailTemplate(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="编号", help_text="编号")
    name = models.CharField(max_length=63, db_comment="模板名称", help_text="模板名称")
    code = models.CharField(
        max_length=63,
        unique=True,
        db_comment="模板编码",
        help_text="模板编码",
        error_messages={"unique": "模板编码已存在"},
    )
    account_id = models.ForeignKey(
        "SystemMailAccount",
        on_delete=models.PROTECT,
        db_constraint=False,
        related_name="mail_templates",
        db_column="account_id",
        db_comment="发送的邮箱账号编号",
        help_text="发送的邮箱账号编号",
        error_messages={"protected": "无法删除，该邮箱账号还有邮件模板"},
    )
    nickname = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="发送人名称",
        help_text="发送人名称",
    )
    title = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="模板标题",
        help_text="模板标题",
    )
    content = models.CharField(
        max_length=10240, db_comment="模板内容", help_text="模板内容"
    )
    params = models.CharField(
        max_length=255, db_comment="参数数组", help_text="参数数组"
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        db_comment="开启状态",
        help_text="开启状态",
    )
    remark = models.CharField(
        max_length=255, blank=True, null=True, db_comment="备注", help_text="备注"
    )

    class Meta:
        managed = True
        db_table = "system_mail_template"
        db_table_comment = "邮件模版表"
        ordering = ["-id"]
