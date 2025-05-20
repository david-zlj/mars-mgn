import uuid
import time
import logging

from ..tasks import operation_log_task

logger = logging.getLogger(__name__)


class OperateLogMiddleware:
    """
    操作日志中间件
    在中间件不同的生命期间，分别获取相应参数
    """

    def __init__(self, get_response):
        self.get_response = get_response
        self.log_data = {}
        # 排除不需要记录的URL，填写URL后两部分即可
        self.exclude_urls = [
            "simple-list",
            "notify-message/get-unread-count",
            "auth/login",
            "auth/logout",
            "auth/get-permission-info",
            "captcha/get",
            "tenant/get-by-website",
        ]

    def _get_client_ip(self, request):
        """获取客户端IP"""
        x_forwarded_for = request.META.get("HTTP_X_FORWARDED_FOR")
        return (
            x_forwarded_for.split(",")[0]
            if x_forwarded_for
            else request.META.get("REMOTE_ADDR")
        )

    def __call__(self, request):
        try:
            #  排除不需要记录的URL
            if any(url in request.path for url in self.exclude_urls):
                response = self.get_response(request)
                return response
            self.start_time = time.time()
            self.log_data.update(
                {
                    "trace_id": request.META.get("HTTP_X_TRACE_ID", str(uuid.uuid4())),
                    "request_method": request.method,
                    "request_url": request.get_full_path(),
                    "user_ip": self._get_client_ip(request),
                    "user_agent": request.META.get("HTTP_USER_AGENT", "")[:512],
                    "action": None,  # TODO
                }
            )
        except Exception as e:
            logger.error(f"操作日志记录失败: {str(e)}")

        # 以上代码，在视图函数之前执行
        response = self.get_response(request)
        # 以下代码，在视图函数之后执行

        try:
            self.log_data.update(
                {
                    "user_id": (
                        request.user.id if request.user.is_authenticated else None
                    ),
                    "success": (
                        response.data.get("code") == 0
                        if hasattr(response, "data")
                        else None
                    ),
                    "status_code": (
                        response.status_code
                        if hasattr(response, "status_code")
                        else None
                    ),
                    "response": (
                        str(response.data)[:512] if hasattr(response, "data") else None
                    ),
                    "execution_time": int((time.time() - self.start_time) * 1000),
                }
            )
            # 异步写入数据库
            operation_log_task.delay(self.log_data)
        except Exception as e:
            logger.error(f"操作日志记录失败: {str(e)}")

        return response

    def process_view(self, request, view_func, view_args, view_kwargs):
        """在视图执行前解析操作类型和业务ID"""
        try:
            # 排除不需要记录操作日志的URL
            if any(url in request.path for url in self.exclude_urls):
                return
            action_name = (
                view_func.actions.get(request.method.lower())
                if hasattr(view_func, "actions")
                else None
            )
            self.log_data.update(
                {
                    "type": view_func.__name__,  # 视图集名称
                    "sub_type": action_name,  # 获取action名称
                    "biz_id": view_kwargs.get("pk") or view_kwargs.get("id"),  # 资源ID
                }
            )
        except Exception as e:
            logger.error(f"操作日志记录失败: {str(e)}")
