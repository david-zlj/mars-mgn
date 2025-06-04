import logging
from rest_framework import permissions
from django.core.cache import cache

logger = logging.getLogger(__name__)


class HasPermission(permissions.BasePermission):
    """
    自定义权限类，检查用户是否具有指定权限
    """

    def __init__(self, perm_code):
        self.perm_code = perm_code  # 权限标识，如 "system:dept:query"

    def has_permission(self, request, view):
        """
        视图的权限检查逻辑
        """
        # 检查用户是否已登录
        if not bool(request.user and request.user.is_authenticated):
            logger.error(f"用户 {request.user.id} 未登录。")
            return False
        # 从缓存中获取请求用户权限
        user_info = cache.get(f"system_users_{request.user.id}")
        if not user_info:
            logger.error(f"用户 {request.user.id} 缓存数据不存在，请重新登录。")
            return False  # TODO 是否强制退出
        # 检查用户是否具有指定权限
        return self.perm_code in user_info.get("permissions", [])
