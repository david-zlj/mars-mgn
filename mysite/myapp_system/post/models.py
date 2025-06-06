from django.db import models

from mars_framework.db.base import BaseModel
from mars_framework.db.enums import CommonStatusEnum


class SystemPost(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="岗位ID", help_text="岗位ID")
    # 需要唯一
    code = models.CharField(
        max_length=64,
        unique=True,
        db_comment="岗位编码",
        help_text="岗位编码",
        error_messages={"unique": "岗位编码已存在"},
    )
    # 需要唯一
    name = models.CharField(
        max_length=50,
        unique=True,
        db_comment="岗位名称",
        help_text="岗位名称",
        error_messages={"unique": "岗位名称已存在"},
    )
    sort = models.IntegerField(
        db_comment="显示顺序",
        help_text="显示顺序",
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        db_comment="部门状态（0正常 1停用）",
        help_text=" 部门状态（0正常 1停用）",
    )
    remark = models.CharField(
        max_length=500,
        blank=True,
        null=True,
        db_comment="备注",
        help_text="备注",
    )

    class Meta:
        managed = True
        db_table = "system_post"
        db_table_comment = "岗位信息表"
        ordering = ["-id"]
