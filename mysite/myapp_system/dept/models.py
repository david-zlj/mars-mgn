from django.db import models

from mars_framework.db.base import BaseModel
from mars_framework.db.enums import COMMON_STATUS_CHOICES


class SystemDept(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="部门id", help_text="部门id")
    name = models.CharField(
        max_length=30, default="", db_comment="部门名称", help_text="部门名称"
    )
    # TODO None表示顶级部门，而不是0
    parent_id = models.ForeignKey(
        "self",
        on_delete=models.PROTECT,  # 删除父时，若有子，则不允许删除
        null=True,
        blank=True,
        db_constraint=False,
        db_column="parent_id",
        db_comment="父部门id",
        help_text="父部门id",
        related_name="children",  # 反向关联名称，用于从父访问子
    )
    sort = models.IntegerField(default=0, db_comment="显示顺序", help_text="显示顺序")
    leader_user_id = models.ForeignKey(
        "SystemUsers",
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_constraint=False,
        db_column="leader_user_id",
        db_comment="负责人",
        help_text="负责人",
        related_name="depts",
    )
    phone = models.CharField(
        max_length=11,
        blank=True,
        null=True,
        db_comment="联系电话",
        help_text="联系电话",
    )
    email = models.CharField(
        max_length=50, blank=True, null=True, db_comment="邮箱", help_text="邮箱"
    )
    status = models.SmallIntegerField(
        choices=COMMON_STATUS_CHOICES,
        db_comment="部门状态（0正常 1停用）",
        help_text="部门状态（0正常 1停用）",
    )
    tenant_id = models.BigIntegerField(
        default=0, db_comment="租户编号", help_text="租户编号"
    )

    class Meta:
        managed = False
        db_table = "system_dept"
        db_table_comment = "部门表"
        ordering = ["sort"]
