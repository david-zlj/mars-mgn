from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.viewsets.mixins import CustomListModelMixin, ExportModelMixin
from mars_framework.permissions.base import HasPermission
from .models import SystemLoginLog
from .serializers import LoginLogSerializer
from .filters import LoginLogFilter


@extend_schema(tags=["管理后台-system-登录日志"])
class LoginLogViewSet(CustomGenericViewSet, CustomListModelMixin, ExportModelMixin):
    queryset = SystemLoginLog.objects.all()
    serializer_class = LoginLogSerializer
    filterset_class = LoginLogFilter
    action_permissions = {
        "list": [HasPermission("system:login-log:query")],
        "export": [HasPermission("system:login-log:export")],
    }

    export_name = "登录日志列表"
    export_fields_labels = {
        "id": "日志编号",
        "log_type": "操作类型",
        "user_id": "用户ID",
        "username": "用户账号",
        "result": "登录结果",
        "user_ip": "登录地址",
        "user_agent": "浏览器 UA",
        "create_time": "登录时间",
    }
    export_data_map = {
        "log_type": {
            100: "使用账号登录",
            101: "使用社交登录",
            103: "使用手机登录",
            104: "使用短信登录",
            200: "自己主动登出",
            202: "强制退出",
            300: "用户注册",
            400: "刷新令牌",
        },
        "result": {
            0: "成功",
            1: "失败",
            10: "账号或密码不正确",
            20: "用户被禁用",
            30: "图片验证码不存在",
            31: "图片验证码不正确",
        },
    }
