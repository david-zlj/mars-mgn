from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import CommonStatusEnum, MenuTypeEnum


class SystemMenu(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="菜单ID", help_text="菜单ID")
    name = models.CharField(max_length=50, db_comment="菜单名称", help_text="菜单名称")
    permission = models.CharField(
        max_length=100,
        db_comment="权限标识",
        help_text="权限标识",
        null=True,
        blank=True,
    )
    type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in MenuTypeEnum],
        db_comment="菜单类型",
        help_text="菜单类型",
    )
    sort = models.IntegerField(db_comment="显示顺序", help_text="显示顺序", default=0)
    parent_id = models.ForeignKey(
        "self",
        on_delete=models.CASCADE,
        null=True,
        blank=True,
        db_constraint=False,
        db_column="parent_id",
        db_comment="父菜单ID",
        help_text="父菜单ID",
        related_name="children",
    )
    path = models.CharField(
        max_length=200,
        blank=True,
        null=True,
        db_comment="路由地址",
        help_text="路由地址",
    )
    icon = models.CharField(
        max_length=100,
        default="#",
        blank=True,
        null=True,
        db_comment="菜单图标",
        help_text="菜单图标",
    )
    component = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="组件路径",
        help_text="组件路径",
    )
    component_name = models.CharField(
        max_length=255, blank=True, null=True, db_comment="组件名", help_text="组件名"
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        default=0,
        db_comment="菜单状态",
        help_text="菜单状态",
    )
    visible = models.BooleanField(
        blank=True,
        null=True,
        db_comment="菜单是否可见",
        help_text="菜单是否可见",
    )
    keep_alive = models.BooleanField(
        blank=True,
        null=True,
        db_comment="是否缓存",
        help_text="是否缓存",
    )
    always_show = models.BooleanField(
        blank=True,
        null=True,
        db_comment="是否始终显示",
        help_text="是否始终显示",
    )

    class Meta:
        managed = True
        db_table = "system_menu"
        db_table_comment = "菜单权限表"
        ordering = ["sort"]
