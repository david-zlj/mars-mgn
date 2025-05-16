from django.urls import path
from rest_framework.routers import SimpleRouter

from .auth.views import AuthViewSet
from .user.views import UserViewSet
from .user_profile.views import UserProfileViewSet
from .dept.views import DeptViewSet
from .post.views import PostViewSet
from .role.views import RoleViewSet
from .menu.views import MenuViewSet
from .permission.views import PermissionViewSet
from .dict_data.views import DictDataViewSet
from .dict_type.views import DictTypeViewSet
from .notify_message.views import NotifyMessageViewSet
from .notify_template.views import NotifyTemplateViewSet
from .tenant.views import TenantViewSet
from .captcha.views import CaptchaViewSet


# 创建（不带后缀/）路由器实例
router = SimpleRouter(trailing_slash=False)

# 管理后台 - 认证
router.register(r"auth", AuthViewSet, basename="auth")
# 管理后台 - 用户
router.register(r"user", UserViewSet, basename="user")
# 管理后台 - 用户资料
router.register(r"user/profile", UserProfileViewSet, basename="user_profile")
# 管理后台 - 部门
router.register(r"dept", DeptViewSet, basename="dept")
# 管理后台 - 岗位
router.register(r"post", PostViewSet, basename="post")
# 管理后台 - 角色
router.register(r"role", RoleViewSet, basename="role")
# 管理后台 - 菜单
router.register(r"menu", MenuViewSet, basename="menu")
# 管理后台 - 权限
router.register(r"permission", PermissionViewSet, basename="permission")
# 管理后台 - 字典数据
router.register(r"dict-data", DictDataViewSet, basename="dict_data")
# 管理后台 - 字典类型
router.register(r"dict-type", DictTypeViewSet, basename="dict_type")
# 管理后台 - 消息通知
router.register(r"notify-message", NotifyMessageViewSet, basename="notify_message")
# 管理后台 - 模板消息
router.register(r"notify-template", NotifyTemplateViewSet, basename="notify_template")
# 管理后台 - 租户
router.register(r"tenant", TenantViewSet, basename="tenant")
# 管理后台 - 验证码
router.register(r"captcha", CaptchaViewSet, basename="captcha")


urlpatterns = []
urlpatterns += router.urls
