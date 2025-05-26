from django.db import models
from mars_framework.db.base import BaseModel
from mars_framework.db.enums import ConfigTypeEnum


class InfraConfig(BaseModel):
    id = models.BigAutoField(
        primary_key=True, db_comment="参数主键", help_text="参数主键"
    )
    category = models.CharField(
        max_length=50, db_comment="参数分组", help_text="参数分组"
    )
    name = models.CharField(max_length=100, db_comment="参数名称", help_text="参数名称")
    config_key = models.CharField(
        max_length=100, db_comment="参数键名", help_text="参数键名"
    )
    value = models.CharField(
        max_length=500, db_comment="参数键值", help_text="参数键值"
    )
    type = models.SmallIntegerField(
        choices=[(item.value, item.name) for item in ConfigTypeEnum],
        default=ConfigTypeEnum.CUSTOM.value,
        db_comment="参数类型",
        help_text="参数类型",
    )
    visible = models.BooleanField(
        db_comment="是否可见",
        help_text="是否可见，不可见的参数，一般是敏感参数，前端不可获取",
    )
    remark = models.CharField(
        max_length=500, blank=True, null=True, db_comment="备注", help_text="备注"
    )

    class Meta:
        managed = False
        db_table = "infra_config"
        db_table_comment = "参数配置表"
        ordering = ["-id"]
