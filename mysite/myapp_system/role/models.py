from django.db import models

from mars_framework.db.base import BaseModel
from mars_framework.db.enums import (
    DataScopeEnum,
    CommonStatusEnum,
    RoleTypeEnum,
)


class SystemRole(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="角色ID", help_text="角色ID")
    name = models.CharField(max_length=30, db_comment="角色名称", help_text="角色名称")
    code = models.CharField(
        max_length=100, db_comment="角色权限字符串", help_text="角色权限字符串"
    )
    sort = models.IntegerField(db_comment="显示顺序", help_text="显示顺序")
    data_scope = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in DataScopeEnum],
        default=DataScopeEnum.SELF.value,
        db_comment="数据范围",
        help_text="数据范围",
    )
    data_scope_dept_ids = models.CharField(
        max_length=500,
        blank=True,
        null=True,
        db_comment="数据范围(指定部门数组)",
        help_text="数据范围(指定部门数组)",
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        db_comment="部门状态",
        help_text=" 部门状态",
    )
    type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in RoleTypeEnum],
        default=2,
        db_comment="角色类型",
        help_text="角色类型",
    )
    remark = models.CharField(
        max_length=500, blank=True, null=True, db_comment="备注", help_text="备注"
    )
    tenant_id = models.BigIntegerField(
        default=0, db_comment="租户编号", help_text="租户编号"
    )
    # 与菜单多对多关系
    menus = models.ManyToManyField(
        "SystemMenu",
        through="SystemRoleMenu",
        through_fields=("role_id", "menu_id"),
        related_name="roles",
    )

    class Meta:
        managed = False
        db_table = "system_role"
        db_table_comment = "角色信息表"
        ordering = ["-id"]


class SystemRoleMenu(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="自增编号")
    role_id = models.ForeignKey(
        "SystemRole",
        on_delete=models.CASCADE,
        db_constraint=False,
        db_column="role_id",
        db_comment="角色ID",
    )
    menu_id = models.ForeignKey(
        "SystemMenu",
        on_delete=models.CASCADE,
        db_constraint=False,
        db_column="menu_id",
        db_comment="菜单ID",
    )
    tenant_id = models.BigIntegerField(default=0, db_comment="租户编号")

    class Meta:
        managed = False
        db_table = "system_role_menu"
        db_table_comment = "角色和菜单关联表"
