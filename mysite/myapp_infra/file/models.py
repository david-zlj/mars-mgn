from django.db import models
from mars_framework.db.base import BaseModel


class InfraFile(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="文件编号", help_text="文件编号"
    )
    config_id = models.BigIntegerField(
        blank=True, null=True, db_comment="配置编号", help_text="配置编号"
    )
    name = models.CharField(
        max_length=256, blank=True, null=True, db_comment="文件名", help_text="文件名"
    )
    path = models.CharField(max_length=512, db_comment="文件路径", help_text="文件路径")
    url = models.CharField(max_length=1024, db_comment="文件 URL", help_text="文件 URL")
    type = models.CharField(
        max_length=128,
        blank=True,
        null=True,
        db_comment="文件类型",
        help_text="文件类型",
    )
    size = models.IntegerField(db_comment="文件大小", help_text="文件大小")

    class Meta:
        managed = False
        db_table = "infra_file"
        db_table_comment = "文件表"
        ordering = ["-id"]
