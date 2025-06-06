from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import UserTypeEnum


class SystemNotifyMessage(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="消息ID", help_text="消息ID")
    user_id = models.ForeignKey(
        "SystemUsers",
        on_delete=models.DO_NOTHING,  # TODO 是否级联删除，是否报错
        db_constraint=False,
        related_name="notify_messages",
        db_column="user_id",
        db_comment="用户ID",
        help_text="用户ID",
    )
    user_type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in UserTypeEnum],
        db_comment="用户类型",
        help_text="用户类型",
    )
    template_id = models.ForeignKey(
        "SystemNotifyTemplate",
        on_delete=models.SET_NULL,  # TODO 是否级联删除
        db_constraint=False,
        related_name="notify_messages",
        db_column="template_id",
        blank=True,
        null=True,
        db_comment="模板编号",
        help_text="模板编号",
    )
    template_code = models.CharField(
        max_length=64, db_comment="模板编码", help_text="模板编码"
    )
    template_nickname = models.CharField(
        max_length=63, db_comment="模板发送人名称", help_text="模板发送人名称，冗余"
    )
    template_content = models.CharField(
        max_length=1024, db_comment="模板内容", help_text="格式化后的内容"
    )
    template_type = models.IntegerField(
        db_comment="模板类型", help_text="模板类型，冗余"
    )
    template_params = models.CharField(
        max_length=255, db_comment="模板参数", help_text="输入后的参数"
    )
    read_status = models.BooleanField(
        default=False,
        db_comment="是否已读",
        help_text="是否已读",
    )
    read_time = models.DateTimeField(
        blank=True, null=True, db_comment="阅读时间", help_text="阅读时间"
    )

    class Meta:
        managed = True
        db_table = "system_notify_message"
        db_table_comment = "站内信消息表"
        ordering = ["-id"]
