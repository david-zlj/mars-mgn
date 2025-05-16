from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import CommonStatusEnum


class SystemNotifyTemplate(BaseModel):
    """站内信模版"""

    id = models.BigAutoField(primary_key=True, db_comment="主键", help_text="主键")
    name = models.CharField(max_length=63, db_comment="模板名称", help_text="模板名称")
    code = models.CharField(
        max_length=64,
        unique=True,
        db_comment="模板编码",
        help_text="模板编码",
        error_messages={"unique": "模板编码不能重复"},
    )
    nickname = models.CharField(
        max_length=255, db_comment="发送人名称", help_text="发送人名称"
    )
    content = models.CharField(
        max_length=1024, db_comment="模板内容", help_text="模板内容"
    )
    type = models.SmallIntegerField(db_comment="类型", help_text="类型")
    params = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="参数数组",
        help_text="参数数组",
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        db_comment="状态（0正常 1停用）",
        help_text="状态（0正常 1停用）",
    )
    remark = models.CharField(
        max_length=255, blank=True, null=True, db_comment="备注", help_text="备注"
    )

    class Meta:
        managed = False
        db_table = "system_notify_template"
        db_table_comment = "站内信模板表"
        ordering = ["-id"]
