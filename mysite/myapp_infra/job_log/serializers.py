import json
import logging
from rest_framework import serializers
from django_celery_results.models import TaskResult
from django.core.cache import cache

from mars_framework.db.enums import JobLogStatusEnum

logger = logging.getLogger(__name__)


class JobLogSerializer(serializers.ModelSerializer):
    """定时任务日志序列化器"""

    job_id = serializers.SerializerMethodField()
    status = serializers.SerializerMethodField()

    def get_job_id(self, obj):
        """从缓存中获取任务ID"""
        return cache.get("periodic_task_dict", {}).get(obj.task_name)

    def get_status(self, obj):
        """使用枚举值转换状态字段"""
        try:
            return JobLogStatusEnum[obj.status].value
        except ValueError:
            return None

    class Meta:
        model = TaskResult
        fields = [
            "id",
            "job_id",
            "task_name",
            "task_kwargs",
            "date_created",
            "date_started",
            "date_done",
            "status",
            "result",
        ]

    def to_representation(self, instance):
        ret = super().to_representation(instance)
        try:
            ret["result"] = json.loads(ret["result"])
            return ret
        except Exception as e:
            logger.warning(f"定时任务日志 result 字段转换失败：{str(e)}")
            return ret
