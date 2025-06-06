from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import CommonStatusEnum


class SystemDictType(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="字典主键", help_text="字典主键"
    )
    name = models.CharField(max_length=100, db_comment="字典名称", help_text="字典名称")
    type = models.CharField(max_length=100, db_comment="字典类型", help_text="字典类型")
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        db_comment="状态（0正常 1停用）",
        help_text="状态（0正常 1停用）",
    )
    remark = models.CharField(
        max_length=500, blank=True, null=True, db_comment="备注", help_text="备注"
    )

    class Meta:
        managed = True
        db_table = "system_dict_type"
        db_table_comment = "字典类型表"
        ordering = ["-id"]
