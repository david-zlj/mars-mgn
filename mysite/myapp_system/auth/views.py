from django.core.cache import cache
from django.utils import timezone
from django.contrib.auth import authenticate
from django.utils.translation import gettext_lazy as _
from rest_framework import viewsets
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework_simplejwt.tokens import RefreshToken
from drf_spectacular.utils import extend_schema

from mars_framework.response.base import CommonResponse
from mars_framework.db.enums import CommonStatusEnum, LoginResultEnum, LoginLogTypeEnum
from ..user.models import SystemUsers
from .serializers import (
    AuthLoginSerializer,
    AuthRegisterSerializer,
    AuthPermissionInfoSerializer,
)
from .services import extract_jwt_info
from ..tasks import login_log_task


@extend_schema(tags=["管理后台-system-认证"])
class AuthViewSet(viewsets.GenericViewSet):
    # 为了兼容GenericAPIView，需要指定序列化器
    serializer_class = AuthLoginSerializer

    @extend_schema(summary="使用账号密码登录")
    @action(
        methods=["post"],
        detail=False,
        url_path="login",
        authentication_classes=[],
        permission_classes=[AllowAny],
    )
    def login(self, request, *args, **kwargs):
        """使用账号密码登录"""
        serializer = AuthLoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        username = serializer.validated_data.get("username")
        password = serializer.validated_data.get("password")
        # TODO 检查验证码功能是否开启，检查验证码是否正确
        # TODO 检查重试次数是否超过限制
        # 初始化日志记录参数
        log_data = {
            "log_type": LoginLogTypeEnum.LOGIN_USERNAME.value,
            "username": username,
            "user_ip": request.META.get("REMOTE_ADDR"),
            "user_agent": request.META.get("HTTP_USER_AGENT", "")[:512],
        }
        user = authenticate(request, username=username, password=password)
        # 检查用户名与密码是否正确
        if not user:
            # 登录失败，记录登录日志
            log_data["result"] = LoginResultEnum.BAD_CREDENTIALS.value
            login_log_task.delay(log_data)
            return CommonResponse.error(code=111201, msg=_("账号或密码错误"))
        # 检查用户是否已被停用
        if user.status == CommonStatusEnum.DISABLE.value:
            # 用户被停用，记录登录日志
            log_data.update(
                {
                    "user_id": user.id,
                    "result": LoginResultEnum.USER_DISABLED.value,
                }
            )
            login_log_task.delay(log_data)
            return CommonResponse.error(code=111202, msg="用户被停用")
        # 更新用户登录IP和登录时间
        user.login_ip = request.META.get("REMOTE_ADDR")
        user.login_date = timezone.now()
        user.save()
        # 登录成功，记录登录日志
        log_data.update(
            {
                "user_id": user.id,
                "result": LoginResultEnum.SUCCESS.value,
            }
        )
        login_log_task.delay(log_data)
        refresh = RefreshToken.for_user(user)
        return CommonResponse.success(data=extract_jwt_info(refresh))

    @extend_schema(summary="登出系统")
    @action(
        methods=["post"],
        detail=False,
        url_path="logout",
        # authentication_classes=[],  # 不需要认证 TODO 记录日志username失败
        permission_classes=[AllowAny],  # 不需要权限
    )
    def logout(self, request, *args, **kwargs):
        """登出系统"""
        # TODO 是否需要将 token 加入黑名单，防止继续使用
        # 清空用户Redis
        cache.delete(f"system_users_{request.user.id}")
        # 登出成功，记录登出日志
        log_data = {
            "log_type": LoginLogTypeEnum.LOGOUT_SELF.value,
            "user_ip": request.META.get("REMOTE_ADDR"),
            "user_agent": request.META.get("HTTP_USER_AGENT", "")[:512],
            "username": request.user.username,
            "user_id": request.user.id,
            "result": LoginResultEnum.SUCCESS.value,
        }
        login_log_task.delay(log_data)
        return CommonResponse.success(data=True)

    @extend_schema(summary="刷新令牌")
    @action(
        methods=["post"],
        detail=False,
        url_path="refresh-token",
        # authentication_classes=[],  # TODO 记录日志username失败
        permission_classes=[AllowAny],
    )
    def refresh_token(self, request, *args, **kwargs):
        """刷新令牌"""
        refresh_token = request.query_params.get("refreshToken")
        if not refresh_token:
            return CommonResponse.error(code=111206, msg="刷新令牌不能为空")
        refresh = RefreshToken(refresh_token)
        # 记录日志
        log_data = {
            "log_type": LoginLogTypeEnum.REFRESH_TOKEN.value,
            "user_ip": request.META.get("REMOTE_ADDR"),
            "user_agent": request.META.get("HTTP_USER_AGENT", "")[:512],
            "username": request.user.username,
            "user_id": request.user.id,
            "result": LoginResultEnum.SUCCESS.value,
        }
        login_log_task.delay(log_data)
        return CommonResponse.success(data=extract_jwt_info(refresh))

    @extend_schema(summary="获取登录用户的权限信息")
    @action(methods=["get"], detail=False, url_path="get-permission-info")
    def get_permission_info(self, request, *args, **kwargs):
        """获取登录用户的权限信息"""
        user = SystemUsers.objects.prefetch_related("roles", "roles__menus").get(
            id=request.user.id
        )
        serializer = AuthPermissionInfoSerializer(user)
        # 写入Redis缓存
        # TODO 设置为不过期是否合适
        cache.set(f"system_users_{request.user.id}", serializer.data, timeout=None)
        return CommonResponse.success(data=serializer.data)

    @extend_schema(summary="注册用户")
    @action(
        methods=["post"],
        detail=False,
        url_path="register",
        authentication_classes=[],
        permission_classes=[AllowAny],
    )
    def register(self, request, *args, **kwargs):
        """注册用户"""
        serializer = AuthRegisterSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        refresh = RefreshToken.for_user(user)
        # 记录日志
        log_data = {
            "log_type": LoginLogTypeEnum.REGISTER_USERNAME.value,
            "user_ip": request.META.get("REMOTE_ADDR"),
            "user_agent": request.META.get("HTTP_USER_AGENT", "")[:512],
            "username": serializer.validated_data.get("username"),
            "user_id": user.id,
            "result": LoginResultEnum.SUCCESS.value,
        }
        login_log_task.delay(log_data)
        return CommonResponse.success(data=extract_jwt_info(refresh))

    ### 短信登录相关

    # @extend_schema(summary="使用短信验证码登录")
    # @action(methods=["post"], detail=False, url_path="sms-login")
    # def sms_login(self, request, *args, **kwargs):
    #     """使用短信验证码登录"""
    #     serializer = AuthSmsLoginSerializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     return AdminAuthService.sms_login(serializer.validated_data)

    # @extend_schema(summary="发送手机验证码")
    # @action(methods=["post"], detail=False, url_path="send-sms-code")
    # def send_login_sms_code(self, request, *args, **kwargs):
    #     """发送手机验证码"""
    #     serializer = AuthSmsSendSerializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     AdminAuthService.send_sms_code(serializer.validated_data)
    #     return self.success_response(True)

    # @extend_schema(summary="重置密码")
    # @action(methods=["post"], detail=False, url_path="reset-password")
    # def reset_password(self, request, *args, **kwargs):
    #     """重置密码"""
    #     serializer = AuthResetPasswordSerializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     AdminAuthService.reset_password(serializer.validated_data)
    #     return self.success_response(True)

    ### 社交登录相关

    # @extend_schema(summary="社交授权的跳转")
    # @action(methods=["get"], detail=False, url_path="social-auth-redirect")
    # def social_login(self, request, *args, **kwargs):
    #     """社交授权的跳转"""
    #     type = request.GET.get("type")
    #     redirect_uri = request.GET.get("redirectUri")
    #     return self.success_response(
    #         SocialClientService.get_authorize_url(
    #             type, 1, redirect_uri
    #         )  # 假设1为管理员类型
    #     )

    # @extend_schema(summary="社交快捷登录，使用 code 授权码")
    # @action(methods=["post"], detail=False, url_path="social-login")
    # def social_quick_login(self, request, *args, **kwargs):
    #     """社交快捷登录，使用 code 授权码"""
    #     serializer = AuthSocialLoginSerializer(data=request.data)
    #     serializer.is_valid(raise_exception=True)
    #     return AdminAuthService.social_login(serializer.validated_data)
