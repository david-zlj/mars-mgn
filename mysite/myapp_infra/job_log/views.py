from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from django_celery_results.models import TaskResult
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet
from .serializers import (
    JobLogDetailSerializer,
    JobLogListSerializer,
    JobLogExportSerializer,
)
from .filters import JobLogFilter


@extend_schema(tags=["管理后台-infra-定时任务日志"])
class JobLogViewSet(CustomViewSet):
    queryset = TaskResult.objects.all()
    filterset_class = JobLogFilter
    export_labels = [
        "日志编号",
        "任务编号",
        "处理器名字",
        "处理器参数",
        "第几次执行", # TODO 目前只显示最后一次执行
        "创建时间",
        # "开始执行时间", # TODO 时区不对
        "结束执行时间",
        "执行时长",
        "任务状态",
        "结果数据",
    ]

    export_fields = [
        "id",
        "jobId",
        "handlerName",
        "handlerParam",
        "executeIndex",
        "createTime",
        # "beginTime",
        "endTime",
        "duration",
        "job_log_status",
        "result",
    ]

    def get_serializer_class(self):
        serializer_classes = {
            "get_job_log": JobLogDetailSerializer,
            "get_job_log_page": JobLogListSerializer,
            "export_job_log_excel": JobLogExportSerializer,
        }
        return serializer_classes.get(self.action, JobLogDetailSerializer)

    @extend_schema(summary="获取定时任务日志信息")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        # permission_classes=[HasPermission("infra:job:query")],
    )
    def get_job_log(self, request, *args, **kwargs):
        """获取定时任务日志信息"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(
        summary="获取定时任务日志分页列表",
        filters=JobLogFilter,
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="page",
        # permission_classes=[HasPermission("infra:job:query")],
    )
    def get_job_log_page(self, request, *args, **kwargs):
        """获取定时任务日志分页列表"""
        # TODO 日期过滤未测试
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="导出定时任务日志 Excel")
    @action(
        methods=["get"],
        detail=False,
        url_path="export-excel",
        # permission_classes=[HasPermission("infra:job:export")],
        permission_classes=[AllowAny],
    )
    def export_job_log_excel(self, request, *args, **kwargs):
        """导出定时任务日志 Excel"""
        return self.custom_export(request, *args, **kwargs)


### 原视图
# from rest_framework.permissions import IsAuthenticated, AllowAny
# from rest_framework.decorators import action
# from drf_spectacular.utils import extend_schema
# from mars_framework.viewsets.base import CustomViewSet
# from .models import InfraJobLog
# from .serializers import (
#     InfraJobLogDetailSerializer,
#     InfraJobLogListSerializer,
#     InfraJobLogExportSerializer,
# )
# from .filters import InfraJobLogFilter


# @extend_schema(tags=["管理后台-infra-定时任务日志"])
# class JobLogViewSet(CustomViewSet):
#     queryset = InfraJobLog.objects.all()
#     filterset_class = InfraJobLogFilter
#     export_labels = [
#         "日志编号",
#         "任务编号",
#         "处理器名字",
#         "处理器参数",
#         "第几次执行",
#         "开始执行时间",
#         "结束执行时间",
#         "执行时长",
#         "任务状态",
#         "结果数据",
#         "创建时间",
#     ]
#     export_fields = [
#         "id",
#         "job_id",
#         "handler_name",
#         "handler_param",
#         "execute_index",
#         "beginTime",
#         "endTime",
#         "duration",
#         "job_log_status",
#         "result",
#         "createTime",
#     ]

#     def get_serializer_class(self):
#         serializer_classes = {
#             # "create_job_log": InfraJobLogSaveSerializer,
#             # "update_job_log": InfraJobLogSaveSerializer,
#             "get_job_log": InfraJobLogDetailSerializer,
#             "get_job_log_page": InfraJobLogListSerializer,
#             "export_job_log_excel": InfraJobLogExportSerializer,
#         }
#         return serializer_classes.get(self.action, InfraJobLogListSerializer)

# @extend_schema(summary="创建定时任务日志")
# @action(
#     methods=["post"],
#     detail=False,
#     url_path="create",
#     # permission_classes=[HasPermission("infra:job:create")],
# )
# def create_job_log(self, request, *args, **kwargs):
#     """创建定时任务日志"""
#     return self.custom_create(request, *args, **kwargs)

# @extend_schema(summary="更新定时任务日志")
# @action(
#     methods=["put"],
#     detail=False,
#     url_path="update",
#     # permission_classes=[HasPermission("infra:job:update")],
# )
# def update_job_log(self, request, *args, **kwargs):
#     """更新定时任务日志"""
#     return self.custom_update(request, *args, **kwargs)

# @extend_schema(summary="删除定时任务日志")
# @action(
#     methods=["delete"],
#     detail=False,
#     url_path="delete",
#     # permission_classes=[HasPermission("infra:job:delete")],
# )
# def delete_job_log(self, request, *args, **kwargs):
#     """删除定时任务日志"""
#     return self.custom_destroy(request, *args, **kwargs)

# @extend_schema(summary="获取定时任务日志信息")
# @action(
#     methods=["get"],
#     detail=False,
#     url_path="get",
#     # permission_classes=[HasPermission("infra:job:query")],
# )
# def get_job_log(self, request, *args, **kwargs):
#     """获取定时任务日志信息"""
#     return self.custom_retrieve(request, *args, **kwargs)

# @extend_schema(
#     summary="获取定时任务日志分页列表",
#     filters=InfraJobLogFilter,
# )
# @action(
#     methods=["get"],
#     detail=False,
#     url_path="page",
#     # permission_classes=[HasPermission("infra:job:query")],
# )
# def get_job_log_page(self, request, *args, **kwargs):
#     """获取定时任务日志分页列表"""
#     # TODO 日期过滤未测试
#     return self.custom_list(request, *args, **kwargs)

# @extend_schema(summary="导出定时任务日志 Excel")
# @action(
#     methods=["get"],
#     detail=False,
#     url_path="export-excel",
#     # permission_classes=[HasPermission("infra:job:export")],
#     permission_classes=[AllowAny],
# )
# def export_job_log_excel(self, request, *args, **kwargs):
#     """导出定时任务日志 Excel"""
#     return self.custom_export(request, *args, **kwargs)
