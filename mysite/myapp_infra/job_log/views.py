from drf_spectacular.utils import extend_schema
from django_celery_results.models import TaskResult
from django_celery_beat.models import PeriodicTask
from django.core.cache import cache

from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.viewsets.mixins import (
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    ExportModelMixin,
)
from mars_framework.permissions.base import HasPermission
from .serializers import JobLogSerializer
from .filters import JobLogFilter


@extend_schema(tags=["管理后台-infra-定时任务日志"])
class JobLogViewSet(
    CustomGenericViewSet,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    ExportModelMixin,
):
    queryset = TaskResult.objects.all()
    serializer_class = JobLogSerializer
    filterset_class = JobLogFilter
    action_permissions = {
        "retrieve": [HasPermission("infra:job:query")],
        "list": [HasPermission("infra:job:query")],
        "export": [HasPermission("infra:job:export")],
    }

    export_name = "定时任务日志"
    export_fields_labels = {
        "id": "日志编号",
        "job_id": "任务编号",
        "task_name": "处理器名字",
        "task_kwargs": "处理器参数",
        "date_created": "创建时间",
        "date_done": "结束执行时间",
        "status": "状态",
        "result": "执行结果",
    }
    export_data_map = {"status": {0: "运行中", 1: "成功", 2: "失败"}}

    def get_queryset(self):
        # 避免N+1查询：将PeriodicTask的task和id字段，组成一个字典，写入缓存
        periodic_task_dict = cache.get("periodic_task_dict")
        if not periodic_task_dict:
            periodic_task_dict = {
                item.task: str(item.id)
                for item in PeriodicTask.objects.only("task", "id")
            }
            cache.set("periodic_task_dict", periodic_task_dict, 300)  # 过期时间5分钟
        return super().get_queryset()
