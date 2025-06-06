from django.db import models


class BaseModel(models.Model):
    creator = models.CharField(
        max_length=64, blank=True, null=True, default="", db_comment="创建者"
    )
    create_time = models.DateTimeField(auto_now_add=True, db_comment="创建时间")
    updater = models.CharField(
        max_length=64, blank=True, null=True, default="", db_comment="更新者"
    )
    update_time = models.DateTimeField(auto_now=True, db_comment="更新时间")

    class Meta:
        abstract = True
