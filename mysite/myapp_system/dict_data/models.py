from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import CommonStatusEnum


class SystemDictData(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="字典编码", help_text="字典编码"
    )
    sort = models.IntegerField(db_comment="字典排序", help_text="字典排序")
    label = models.CharField(
        max_length=100, db_comment="字典标签", help_text="字典标签"
    )
    value = models.CharField(
        max_length=100, db_comment="字典键值", help_text="字典键值"
    )
    dict_type = models.CharField(
        max_length=100, db_comment="字典类型", help_text="字典类型"
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        db_comment="状态（0正常 1停用）",
        help_text="状态（0正常 1停用）",
    )
    color_type = models.CharField(
        max_length=100,
        blank=True,
        null=True,
        db_comment="颜色类型",
        help_text="颜色类型",
    )
    css_class = models.CharField(
        max_length=100,
        blank=True,
        null=True,
        db_comment="css 样式",
        help_text="css 样式",
    )
    remark = models.CharField(
        max_length=500, blank=True, null=True, db_comment="备注", help_text="备注"
    )

    class Meta:
        managed = False
        db_table = "system_dict_data"
        db_table_comment = "字典数据表"
        ordering = ["-id"]
