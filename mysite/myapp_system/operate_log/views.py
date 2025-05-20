from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.viewsets.mixins import CustomListModelMixin, ExportModelMixin
from mars_framework.permissions.base import HasPermission
from .models import SystemOperateLog
from .serializers import OperateLogSerializer
from .filters import OperateLogFilter


@extend_schema(tags=["管理后台-system-操作日志"])
class OperateLogViewSet(CustomGenericViewSet, CustomListModelMixin, ExportModelMixin):
    queryset = SystemOperateLog.objects.all()
    serializer_class = OperateLogSerializer
    filterset_class = OperateLogFilter
    action_permissions = {
        "list": [HasPermission("system:operate-log:query")],
        "export": [HasPermission("system:operate-log:export")],
    }

    export_name = "操作日志列表"
    export_fields_labels = {
        "id": "日志编号",
        "user_id": "用户编号",
        "username": "用户账号",
        "nickname": "用户昵称",
        "request_method": "请求方法",
        "request_url": "请求地址",
        "user_ip": "用户IP",
        # "user_agent": "浏览器 UA",
        "type": "操作模块类型",
        "sub_type": "操作名",
        "biz_id": "操作数据模块编号",
        # "action": "操作内容",
        "success": "操作结果",
        "status_code": "HTTP状态码",
        "response": "响应内容",
        "execution_time": "执行时长（毫秒）",
    }
