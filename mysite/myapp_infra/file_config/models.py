from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import FileStorageEnum


class InfraFileConfig(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="编号", help_text="编号")
    name = models.CharField(max_length=63, db_comment="配置名", help_text="配置名")
    storage = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in FileStorageEnum],
        db_comment="存储器",
        help_text="存储器",
    )
    remark = models.CharField(
        max_length=255, blank=True, null=True, db_comment="备注", help_text="备注"
    )
    master = models.BooleanField(
        null=True, default=False, db_comment="是否为主配置", help_text="是否为主配置"
    )
    config = models.CharField(
        max_length=4096, db_comment="存储配置", help_text="存储配置"
    )

    class Meta:
        managed = False
        db_table = "infra_file_config"
        db_table_comment = "文件配置表"
        ordering = ["-id"]
