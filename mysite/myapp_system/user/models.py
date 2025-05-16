from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

from mars_framework.db.enums import CommonStatusEnum, SexEnum
from mars_framework.db.base import BaseModel
from .services import avatar_upload_rename


class SystemUsersManager(BaseUserManager):
    def create_user(self, username, password, nickname, **extra_fields):
        if not username:
            raise ValueError("请输入用户名")
        user = self.model(username=username, nickname=nickname, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, nickname, **extra_fields):
        user = self.create_user(username, password, nickname, **extra_fields)
        # TODO 是否需要is_admin 字段
        # user.save(using=self._db)
        return user


class SystemUsers(BaseModel, AbstractBaseUser):
    id = models.BigAutoField(primary_key=True, db_comment="用户ID", help_text="用户ID")
    username = models.CharField(
        max_length=30, unique=True, db_comment="用户账号", help_text="用户账号"
    )
    # TODO 是否需要设置default
    password = models.CharField(
        max_length=128, default="", db_comment="密码", help_text="密码"
    )
    nickname = models.CharField(
        max_length=30, db_comment="用户昵称", help_text="用户昵称"
    )
    remark = models.CharField(
        max_length=500, blank=True, null=True, db_comment="备注", help_text="备注"
    )
    dept_id = models.ForeignKey(
        "SystemDept",
        on_delete=models.PROTECT,
        related_name="users",
        db_constraint=False,
        db_column="dept_id",
        blank=True,
        null=True,
        db_comment="部门ID",
        help_text="部门ID",
    )
    post_ids = models.CharField(
        max_length=255,
        blank=True,
        null=True,
        db_comment="岗位编号数组",
        help_text="岗位编号数组",
    )
    email = models.CharField(
        max_length=50,
        blank=True,
        null=True,
        default="",
        db_comment="用户邮箱",
        help_text="用户邮箱",
    )
    mobile = models.CharField(
        max_length=15,
        blank=True,
        null=True,
        default="",
        db_comment="手机号码",
        help_text="手机号码",
    )
    sex = models.SmallIntegerField(
        blank=True,
        null=True,
        default=0,
        choices=[(item.value, item.name) for item in SexEnum],
        db_comment="用户性别",
        help_text="用户性别",
    )
    avatar = models.FileField(
        upload_to=avatar_upload_rename,
        max_length=512,
        blank=True,
        null=True,
        db_comment="头像地址",
        help_text="头像地址",
    )
    status = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in CommonStatusEnum],
        default=0,
        db_comment="帐号状态（0正常 1停用）",
        help_text="帐号状态（0正常 1停用）",
    )
    login_ip = models.CharField(
        max_length=50,
        blank=True,
        null=True,
        default="",
        db_comment="最后登录IP",
        help_text="最后登录IP",
    )
    login_date = models.DateTimeField(
        blank=True, null=True, db_comment="最后登录时间", help_text="最后登录时间"
    )
    tenant_id = models.BigIntegerField(
        default=0, db_comment="租户编号", help_text="租户编号"
    )

    # Django 自定义用户模型默认字段
    last_login = models.DateTimeField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    objects = SystemUsersManager()
    USERNAME_FIELD = "username"
    REQUIRED_FIELDS = ["nickname"]

    # 与岗位多对多关系
    posts = models.ManyToManyField(
        "SystemPost",
        through="SystemUserPost",
        through_fields=("user_id", "post_id"),
        related_name="users",
        help_text="与岗位关联的用户列表",
    )

    # 与角色多对多关系
    roles = models.ManyToManyField(
        "SystemRole",
        through="SystemUserRole",
        through_fields=("user_id", "role_id"),
        related_name="users",
    )

    class Meta:
        managed = True
        db_table = "system_users"
        db_table_comment = "用户信息表"
        ordering = ["-id"]


class SystemUserRole(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="id")
    user_id = models.ForeignKey(
        "SystemUsers",
        on_delete=models.CASCADE,
        db_constraint=False,
        db_column="user_id",
        db_comment="用户ID",
    )
    role_id = models.ForeignKey(
        "SystemRole",
        on_delete=models.CASCADE,
        db_constraint=False,
        db_column="role_id",
        db_comment="角色ID",
    )
    tenant_id = models.BigIntegerField(default=0, db_comment="租户编号")

    class Meta:
        managed = False
        db_table = "system_user_role"
        db_table_comment = "用户和角色关联表"
        ordering = ["-id"]


class SystemUserPost(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="id")
    user_id = models.ForeignKey(
        "SystemUsers",
        on_delete=models.CASCADE,
        db_constraint=False,
        db_column="user_id",
        db_comment="用户ID",
        help_text="用户ID",
    )
    post_id = models.ForeignKey(
        "SystemPost",
        on_delete=models.CASCADE,
        db_constraint=False,
        db_column="post_id",
        db_comment="岗位ID",
        help_text="岗位ID",
    )
    tenant_id = models.BigIntegerField(
        default=0, db_comment="租户编号", help_text="租户编号"
    )

    class Meta:
        managed = False
        db_table = "system_user_post"
        db_table_comment = "用户岗位表"
        ordering = ["-id"]
