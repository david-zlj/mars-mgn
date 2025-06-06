from django.db import models
from mars_framework.db.base import BaseModel


class SystemMailAccount(BaseModel):
    id = models.BigAutoField(primary_key=True, db_comment="主键", help_text="主键")
    mail = models.CharField(max_length=255, db_comment="邮箱", help_text="邮箱")
    username = models.CharField(max_length=255, db_comment="用户名", help_text="用户名")
    password = models.CharField(max_length=255, db_comment="密码", help_text="密码")
    host = models.CharField(
        max_length=255, db_comment="SMTP 服务器域名", help_text="SMTP 服务器域名"
    )
    port = models.IntegerField(
        db_comment="SMTP 服务器端口", help_text="SMTP 服务器端口"
    )
    ssl_enable = models.BooleanField(
        db_comment="是否开启 SSL", help_text="是否开启 SSL"
    )
    starttls_enable = models.BooleanField(
        db_comment="是否开启 STARTTLS", help_text="是否开启 STARTTLS"
    )

    class Meta:
        managed = True
        db_table = "system_mail_account"
        db_table_comment = "邮箱账号表"
        ordering = ["-id"]
