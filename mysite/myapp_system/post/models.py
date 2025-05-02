from django.db import models

from mars_framework.db.base import BaseModel
from mars_framework.db.enums import COMMON_STATUS_CHOICES


class SystemPost(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="岗位ID", help_text="岗位ID")
    # TODO 是否需要唯一
    code = models.CharField(
        max_length=64,
        db_comment="岗位编码",
        help_text="岗位编码",
    )
    # TODO 是否需要唯一
    name = models.CharField(max_length=50, db_comment="岗位名称", help_text="岗位名称")
    sort = models.IntegerField(db_comment="显示顺序", help_text="显示顺序")
    status = models.SmallIntegerField(
        choices=COMMON_STATUS_CHOICES,
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
    tenant_id = models.BigIntegerField(
        default=0, db_comment="租户编号", help_text="租户编号"
    )

    # 多对多关系
    # users = models.ManyToManyField(
    #     "SystemUsers",
    #     through="SystemUserPost",
    #     through_fields=("post_id", "user_id"),
    #     related_name="posts",
    #     help_text="与岗位关联的用户列表",
    # )

    class Meta:
        managed = False
        db_table = "system_post"
        db_table_comment = "岗位信息表"
        ordering = ["-id"]


# class SystemUserPost(BaseModel):
#     id = models.BigAutoField(primary_key=True, db_comment="id")
#     user_id = models.ForeignKey(
#         "SystemUsers",
#         on_delete=models.CASCADE, 
#         db_constraint=False,
#         db_column="user_id",
#         db_comment="用户ID",
#         help_text="用户ID",
#     )
#     post_id = models.ForeignKey(
#         "SystemPost",
#         on_delete=models.CASCADE, 
#         db_constraint=False,
#         db_column="post_id",
#         db_comment="岗位ID",
#         help_text="岗位ID",
#     )
#     tenant_id = models.BigIntegerField(
#         default=0, db_comment="租户编号", help_text="租户编号"
#     )

#     class Meta:
#         managed = False
#         db_table = "system_user_post"
#         db_table_comment = "用户岗位表"
#         ordering = ["-id"]
