from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.viewsets.mixins import CustomListModelMixin, ExportModelMixin
from mars_framework.permissions.base import HasPermission
from .models import InfraApiAccessLog
from .serializers import ApiAccessLogSerializer, ApiAccessLogExportSerializer
from .filters import ApiAccessLogFilter


@extend_schema(tags=["管理后台-infra-API访问日志"])
class InfraApiAccessLogViewSet(
    CustomGenericViewSet, CustomListModelMixin, ExportModelMixin
):
    queryset = InfraApiAccessLog.objects.all()
    serializer_class = ApiAccessLogSerializer
    filterset_class = ApiAccessLogFilter
    # action_serializers = {
    #     "export": ApiAccessLogExportSerializer,
    # }
    action_permissions = {
        "list": [HasPermission("infra:api-access-log:query")],
        "export": [HasPermission("infra:api-access-log:export")],
    }
    export_name = "API访问日志列表"
    export_fields_labels = {
        "id": "日志主键",
        "trace_id": "链路追踪编号",
        "user_id": "用户编号",
        "user_type": "用户类型",
        "application_name": "应用名",
        "request_method": "请求方法名",
        "request_url": "请求地址",
        "request_params": "请求参数",
        "response_body": "响应结果",
        "user_ip": "用户 IP",
        "user_agent": "浏览器 UA",
        "operate_module": "操作模块",
        "operate_name": "操作名",
        "operate_type": "操作分类",
        "begin_time": "开始请求时间",
        "end_time": "结束请求时间",
        "duration": "执行时长",
        "result_code": "结果码",
        "result_msg": "结果提示",
    }
