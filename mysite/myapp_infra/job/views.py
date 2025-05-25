import json
from celery import current_app
from django_celery_beat.models import PeriodicTask
from drf_spectacular.utils import extend_schema
from rest_framework.decorators import action
from rest_framework.generics import get_object_or_404

from mars_framework.viewsets.base import CustomModelViewSetNoSimple
from mars_framework.permissions.base import HasPermission
from mars_framework.response.base import CommonResponse
from .serializers import JobSaveSerializer, JobSerializer
from .filters import JobFilter
from .services import infra_job_service


@extend_schema(tags=["管理后台-system-定时任务"])
class JobViewSet(CustomModelViewSetNoSimple):
    queryset = PeriodicTask.objects.all()
    serializer_class = JobSerializer
    filterset_class = JobFilter
    action_serializers = {
        "create": JobSaveSerializer,
        "update": JobSaveSerializer,
    }
    action_permissions = {
        "create": [HasPermission("infra:job:create")],
        "destroy": [HasPermission("infra:job:delete")],  # TODO 是否需要删除对应shedule
        "update": [HasPermission("infra:job:update")],
        "retrieve": [HasPermission("infra:job:query")],
        "list": [HasPermission("infra:job:query")],
        "export": [HasPermission("infra:job:export")],
        "update_status": [HasPermission("infra:job:update")],
        "trigger": [HasPermission("infra:job:trigger")],
        "sync": [HasPermission("infra:job:create")],
        "get_next_times": [HasPermission("infra:job:query")],
    }
    action_querysets = {
        # 排除name=celery.backend_cleanup
        "list": PeriodicTask.objects.exclude(name="celery.backend_cleanup"),
        "export": PeriodicTask.objects.exclude(name="celery.backend_cleanup"),
    }

    export_name = "定时任务列表"
    export_fields_labels = {
        "id": "任务编号",
        "name": "任务名称",
        "task": "处理器名字",
        "kwargs": "处理器参数",
        "cron_expression": "CRON表达式",
        "status": "任务状态",
    }
    export_data_map = {
        "status": {1: "开启", 2: "暂停"},
    }

    def create(self, request, *args, **kwargs):
        """创建定时任务"""
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        # CRON表达式
        cron_expression = serializer.validated_data.pop("cron_expression")
        schedule = infra_job_service.get_or_create_crontab_schedule(cron_expression)
        # 创建任务
        task_data = {
            "name": serializer.validated_data.get("name"),
            "task": serializer.validated_data.get("task"),
            "kwargs": serializer.validated_data.get("kwargs"),
            "crontab": schedule,
            "enabled": False,  # 默认禁用
        }
        PeriodicTask.objects.create(**task_data)
        return CommonResponse.success()

    def update(self, request, *args, **kwargs):
        """更新定时任务"""
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        # 任务CRON表达式
        cron_expression = serializer.validated_data.pop("cron_expression")
        schedule = infra_job_service.get_or_create_crontab_schedule(cron_expression)
        # 更新任务
        task_data = {
            "name": serializer.validated_data.get("name"),
            "task": serializer.validated_data.get("task"),
            "kwargs": serializer.validated_data.get("kwargs"),
            "crontab": schedule,
        }
        PeriodicTask.objects.filter(id=instance.id).update(**task_data)
        return CommonResponse.success()

    @extend_schema(summary="触发定时任务")
    @action(
        methods=["put"],
        detail=True,
        url_path="trigger",
    )
    def trigger(self, request, *args, **kwargs):
        """触发定时任务"""
        instance = self.get_object()
        # 获取任务函数并手动触发
        task_name = instance.task  # 任务路径如 "myapp_infra.tasks.send_daily_report"
        task_kwargs = json.loads(instance.kwargs or "{}")

        try:
            # 动态加载任务函数
            task = current_app.tasks[task_name]
            task.delay(**task_kwargs)
            return CommonResponse.success()
        except KeyError:
            return CommonResponse.error(
                code=121101,
                msg=f"找不到 {task_name}  任务，或该任务未注册",
            )
        except Exception as e:
            return CommonResponse.error(
                code=121102,
                msg=f"触发任务 {task_name} 失败，错误信息：{e}",
            )

    @extend_schema(summary="同步定时任务")
    @action(
        methods=["post"],
        detail=False,
        url_path="sync",
    )
    def sync(self, request, *args, **kwargs):
        """同步定时任务"""
        # TODO 确认本接口的作用
        return CommonResponse.error(code=121103, msg="暂不支持，未来实现")

    @extend_schema(summary="更新定时任务状态")
    @action(
        methods=["put"],
        detail=True,
        url_path="status",
    )
    def update_status(self, request, *args, **kwargs):
        """更新定时任务状态"""
        status = request.query_params.get("status")
        if status is None or status not in ["1", "2"]:  # 1：开启 2：暂停
            return CommonResponse.error(code=121104, msg="任务状态值错误")
        instance = get_object_or_404(PeriodicTask, pk=kwargs.get("pk"))
        instance.enabled = status == "1"
        instance.save()
        return CommonResponse.success()

    @extend_schema(summary="获取定时任务的下 n 次执行时间")
    @action(
        methods=["get"],
        detail=True,
        url_path="next-times",
    )
    def get_next_times(self, request, *args, **kwargs):
        """获取定时任务的下 n 次执行时间"""
        count = int(request.query_params.get("count", 5))
        task = self.get_object()
        # 生成CORN 表达式
        crontab = task.crontab
        cron_expression = f"{crontab.minute} {crontab.hour} {crontab.day_of_month} {crontab.month_of_year} {crontab.day_of_week}"
        try:
            data = infra_job_service.get_next_times(cron_expression, count)
        except Exception as e:
            return CommonResponse.error(code=121102, msg=str(e))
        return CommonResponse.success(data=data)
