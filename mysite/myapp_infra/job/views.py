import json
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema
from celery import current_app
from django_celery_beat.models import PeriodicTask

from mars_framework.viewsets.base import CustomViewSet
from mars_framework.response.base import CommonResponse
from .serializers import (
    JobSaveSerializer,
    JobDetailSerializer,
    JobListSerializer,
    JobExportSerializer,
)
from .filters import PeriodicTaskFilter
from .services import create_crontab_schedule, get_next_cron_times


@extend_schema(tags=["管理后台-infra-定时任务"])
class JobViewSet(CustomViewSet):
    queryset = PeriodicTask.objects.all()
    filterset_class = PeriodicTaskFilter
    export_labels = [
        "任务编号",
        "任务名称",
        "任务状态",
        "处理器名字",
        "处理器参数",
        "CRON表达式",
        "监控超时时间",
        "更新时间",
    ]
    export_fields = [
        "id",
        "name",
        "job_status",
        "handlerName",
        "handlerParam",
        "cronExpression",
        "monitorTimeout",
        "createTime",
    ]

    def get_serializer_class(self):
        serializer_classes = {
            "create_job": JobSaveSerializer,
            "update_job": JobSaveSerializer,
            "get_job": JobDetailSerializer,
            "get_job_page": JobListSerializer,
            "export_job_excel": JobExportSerializer,
        }
        return serializer_classes.get(self.action, JobSaveSerializer)

    @extend_schema(summary="创建定时任务")
    @action(
        methods=["post"],
        detail=False,
        url_path="create",
        # permission_classes=[HasPermission("infra:job:create")],
    )
    def create_job(self, request, *args, **kwargs):
        """创建定时任务"""
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        # 任务CRON表达式
        cron_expression = serializer.validated_data.pop("cronExpression")
        schedule = create_crontab_schedule(cron_expression)
        # 任务参数
        kwargs = serializer.validated_data.get("handlerParam")
        if kwargs:
            kwargs = json.dumps(kwargs)  # TODO 测试
        else:
            kwargs = {}
        task_data = {
            "name": serializer.validated_data.get("name"),
            "task": serializer.validated_data.get("handlerName"),
            "kwargs": kwargs,
            "crontab": schedule,
            "enabled": False,  # 默认禁用
        }
        # 创建
        PeriodicTask.objects.create(**task_data)
        return CommonResponse.success(data=True)

    @extend_schema(summary="更新定时任务")
    @action(
        methods=["put"],
        detail=False,
        url_path="update",
        # permission_classes=[HasPermission("infra:job:update")],
    )
    def update_job(self, request, *args, **kwargs):
        """更新定时任务"""
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        # 任务CRON表达式
        cron_expression = serializer.validated_data.pop("cronExpression")
        schedule = create_crontab_schedule(cron_expression)
        # 任务参数
        kwargs = serializer.validated_data.get("handlerParam")
        if kwargs:
            kwargs = json.dumps(kwargs)  # TODO 测试
        else:
            kwargs = {}
        task_data = {
            "name": serializer.validated_data.get("name"),
            "task": serializer.validated_data.get("handlerName"),
            "kwargs": kwargs,
            "crontab": schedule,
        }
        # 更新
        PeriodicTask.objects.filter(id=instance.id).update(**task_data)
        return CommonResponse.success(data=True)

    @extend_schema(summary="更新定时任务状态")
    @action(
        methods=["put"],
        detail=False,
        url_path="update-status",
        # permission_classes=[HasPermission("infra:job:update")],
    )
    def update_job_status(self, request, *args, **kwargs):
        """更新定时任务状态"""
        status = request.query_params.get("status")
        if status is None or status not in ["1", "2"]:  # 1：开启 2：暂停
            return CommonResponse.error(code=121100, msg="状态值错误")
        instance = self.get_object()
        if status == "1":
            instance.enabled = True
            instance.save()
        elif status == "2":
            instance.enabled = False
            instance.save()
        return CommonResponse.success(data=True)

    @extend_schema(summary="删除定时任务")
    @action(
        methods=["delete"],
        detail=False,
        url_path="delete",
        # permission_classes=[HasPermission("infra:job:delete")],
    )
    def delete_job(self, request, *args, **kwargs):
        """删除定时任务"""
        return self.custom_destroy(request, *args, **kwargs)

    @extend_schema(summary="触发定时任务")
    @action(
        methods=["put"],
        detail=False,
        url_path="trigger",
        # permission_classes=[HasPermission("infra:job:trigger")],
    )
    def trigger_job(self, request, *args, **kwargs):
        """触发定时任务"""
        instance = self.get_object()
        # 获取任务函数并手动触发
        task_name = instance.task  # 任务路径如 "myapp.tasks.mytask"
        task_args = json.loads(instance.args or "[]")
        task_kwargs = json.loads(instance.kwargs or "{}")

        try:
            # 动态加载任务函数
            task = current_app.tasks[task_name]
            task.delay(*task_args, **task_kwargs)
            return CommonResponse.success(data=True)
        except KeyError:
            return CommonResponse.error(
                code=121101,
                msg=f"{task_name} 找不到该任务，或任务未注册。任务名称示例 myapp.tasks.mytask",
            )

    @extend_schema(summary="同步定时任务")
    @action(
        methods=["post"],
        detail=False,
        url_path="sync",
        # permission_classes=[HasPermission("infra:job:create")],
    )
    def sync_job(self, request, *args, **kwargs):
        """
        同步定时任务
        """
        # TODO 本接口的作用？检查celery worker 和 beat 的状态？
        return CommonResponse.success(data=True)

    @extend_schema(summary="获取定时任务详情")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        # permission_classes=[HasPermission("infra:job:query")],
    )
    def get_job(self, request, *args, **kwargs):
        """获取定时任务详情"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="获取定时任务分页列表", filters=PeriodicTaskFilter)
    @action(
        methods=["get"],
        detail=False,
        url_path="page",
        # permission_classes=[HasPermission("infra:job:query")],
    )
    def get_job_page(self, request, *args, **kwargs):
        """获取定时任务分页列表"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="导出定时任务 Excel")
    @action(
        methods=["get"],
        detail=False,
        url_path="export-excel",
        # permission_classes=[HasPermission("infra:job:export")],
        permission_classes=[AllowAny],
    )
    def export_job_excel(self, request, *args, **kwargs):
        """导出定时任务 Excel"""
        return self.custom_export(request, *args, **kwargs)

    @extend_schema(summary="获取定时任务的下 n 次执行时间")
    @action(
        methods=["get"],
        detail=False,
        url_path="get_next_times",
        # permission_classes=[HasPermission("infra:job:query")],
    )
    def get_job_next_times(self, request, *args, **kwargs):
        """获取定时任务的下 n 次执行时间"""
        count = int(request.query_params.get("count", 5))
        task = self.get_object()
        # TODO 是否考虑 last_run_at 目前结果不准确
        # last_run_time = task.last_run_at
        # if last_run_time is None:
        #     last_run_time = timezone.now()
        crontab = task.crontab
        cron_expression = f"{crontab.minute} {crontab.hour} {crontab.day_of_month} {crontab.month_of_year} {crontab.day_of_week}"
        try:
            data = get_next_cron_times(cron_expression, count)
        except Exception as e:
            return CommonResponse.error(code=121102, msg=str(e))
        return CommonResponse.success(data=data)


### 原视图
# from rest_framework.permissions import IsAuthenticated, AllowAny
# from rest_framework.decorators import action
# from drf_spectacular.utils import extend_schema

# from mars_framework.viewsets.base import CustomViewSet
# from mars_framework.response.base import CommonResponse
# from .models import InfraJob
# from .serializers import (
#     JobSaveSerializer,
#     JobStatusUpdateSerializer,
#     JobDetailSerializer,
#     JobListSerializer,
#     JobExportSerializer,
# )
# from .filters import InfraJobFilter
# from .services import job_service


# @extend_schema(tags=["管理后台-infra-定时任务"])
# class JobViewSet(CustomViewSet):
#     queryset = InfraJob.objects.all()
#     filterset_class = InfraJobFilter
#     export_labels = [
#         "任务编号",
#         "任务名称",
#         "任务状态",
#         "处理器名字",
#         "处理器参数",
#         "CRON表达式",
#         "监控超时时间",
#         "创建时间",
#     ]
#     export_fields = [
#         "id",
#         "name",
#         "job_status",
#         "handler_name",
#         "handler_param",
#         "cron_expression",
#         "monitor_timeout",
#         "createTime",
#     ]

#     def get_serializer_class(self):
#         serializer_classes = {
#             "create_job": JobSaveSerializer,
#             "update_job": JobSaveSerializer,
#             "update_job_status": JobStatusUpdateSerializer,
#             "get_job": JobDetailSerializer,
#             "get_job_page": JobListSerializer,
#             "export_job_excel": JobExportSerializer,
#         }
#         return serializer_classes.get(self.action, JobListSerializer)

#     @extend_schema(summary="创建定时任务")
#     @action(
#         methods=["post"],
#         detail=False,
#         url_path="create",
#         # permission_classes=[HasPermission("infra:job:create")],
#     )
#     def create_job(self, request, *args, **kwargs):
#         """创建定时任务"""
#         handler_name = request.data.get("handler_name")
#         # TODO 检查处理器是否存在
#         if not job_service.check_handler(handler_name):
#             return CommonResponse.error(code=121100, msg="定时任务的处理器不存在")
#         # TODO 调用服务层创建任务逻辑
#         return self.custom_create(request, *args, **kwargs)

#     @extend_schema(summary="更新定时任务")
#     @action(
#         methods=["put"],
#         detail=False,
#         url_path="update",
#         # permission_classes=[HasPermission("infra:job:update")],
#     )
#     def update_job(self, request, *args, **kwargs):
#         """更新定时任务"""
#         status = request.data.get("status")
#         if status != 1:
#             return CommonResponse.error(
#                 code=121101, msg="只有开启状态的任务，才可以修改"
#             )

#         return self.custom_update(request, *args, **kwargs)

#     @extend_schema(summary="更新定时任务状态")
#     @action(
#         methods=["put"],
#         detail=False,
#         url_path="update-status",
#         # permission_classes=[HasPermission("infra:job:update")],
#     )
#     def update_job_status(self, request, *args, **kwargs):
#         """更新定时任务状态"""
#         status = request.query_params.get("status")
#         instance = self.get_object()
#         serializer = self.get_serializer(instance, data={"status": status})
#         serializer.is_valid(raise_exception=True)
#         # TODO 检查celery状态和redis状态是否正常
#         if not job_service.check_celery_status():
#             return CommonResponse.error(
#                 code=121102, msg="celery状态不正常，请检查celery状态"
#             )
#         if not job_service.check_redis_status():
#             return CommonResponse.error(
#                 code=121103, msg="redis状态不正常，请检查redis状态"
#             )
#         # 调用服务层更新状态逻辑 TODO
#         # job_service.update_job_status(id, status)
#         serializer.save(updater=request.user.id)
#         return CommonResponse.success(data=True)

#     @extend_schema(summary="删除定时任务")
#     @action(
#         methods=["delete"],
#         detail=False,
#         url_path="delete",
#         # permission_classes=[HasPermission("infra:job:delete")],
#     )
#     def delete_job(self, request, *args, **kwargs):
#         """删除定时任务"""
#         # TODO 检查celery状态和redis状态是否正常
#         return self.custom_destroy(request, *args, **kwargs)

#     @extend_schema(summary="触发定时任务")
#     @action(
#         methods=["put"],
#         detail=False,
#         url_path="trigger",
#         # permission_classes=[HasPermission("infra:job:trigger")],
#     )
#     def trigger_job(self, request, *args, **kwargs):
#         """触发定时任务"""
#         id = request.query_params.get("id")
#         # TODO 检查celery状态和redis状态是否正常
#         # 调用服务层触发任务逻辑 TODO
#         # job_service.trigger_job(id)
#         # return self.custom_update(request, *args, **kwargs)
#         return CommonResponse.success(data=True)

#     @extend_schema(summary="同步定时任务")
#     @action(
#         methods=["post"],
#         detail=False,
#         url_path="sync",
#         # permission_classes=[HasPermission("infra:job:create")],
#     )
#     def sync_job(self, request, *args, **kwargs):
#         """
#         同步定时任务
#         - 启动项目后，调用本接口，将 infra_job 表的任务同步到 Celery 中。
#         """
#         job_service.get_celery_stats()
#         # TODO 调用服务层同步任务逻辑
#         # job_service.sync_job()
#         # return self.custom_create(request, *args, **kwargs)
#         return CommonResponse.success(data=True)

#     @extend_schema(summary="获取定时任务详情")
#     @action(
#         methods=["get"],
#         detail=False,
#         url_path="get",
#         # permission_classes=[HasPermission("infra:job:query")],
#     )
#     def get_job(self, request, *args, **kwargs):
#         """获取定时任务详情"""
#         return self.custom_retrieve(request, *args, **kwargs)

#     @extend_schema(summary="获取定时任务分页列表", filters=InfraJobFilter)
#     @action(
#         methods=["get"],
#         detail=False,
#         url_path="page",
#         # permission_classes=[HasPermission("infra:job:query")],
#     )
#     def get_job_page(self, request, *args, **kwargs):
#         """获取定时任务分页列表"""
#         return self.custom_list(request, *args, **kwargs)

#     @extend_schema(summary="导出定时任务 Excel")
#     @action(
#         methods=["get"],
#         detail=False,
#         url_path="export-excel",
#         # permission_classes=[HasPermission("infra:job:export")],
#         permission_classes=[AllowAny],
#     )
#     def export_job_excel(self, request, *args, **kwargs):
#         """导出定时任务 Excel"""
#         return self.custom_export(request, *args, **kwargs)

#     @extend_schema(summary="获取定时任务的下 n 次执行时间")
#     @action(
#         methods=["get"],
#         detail=False,
#         url_path="get_next_times",
#         # permission_classes=[HasPermission("infra:job:query")],
#     )
#     def get_job_next_times(self, request, *args, **kwargs):
#         """获取定时任务的下 n 次执行时间"""
#         id = request.GET.get("id")
#         count = request.GET.get("count", 5)
#         # TODO 调用服务层获取下次执行时间逻辑
#         # next_times = job_service.get_job_next_times(id, count)
#         # return self.custom_retrieve(request, *args, **kwargs)
#         return CommonResponse.success(data=True)
