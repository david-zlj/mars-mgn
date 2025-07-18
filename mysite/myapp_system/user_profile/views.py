from django.conf import settings
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser, FormParser
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import (
    CustomGenericViewSet,
)
from mars_framework.viewsets.mixins import (
    CustomRetrieveModelMixin,
    CustomUpdateModelMixin,
)
from mars_framework.response.base import CommonResponse
from ..user.models import SystemUsers
from .serializers import (
    UserProfileDetailSerializer,
    UserProfileSaveSerializer,
    UserProfileUpdatePasswordSerializer,
    UserProfileAvatarSerializer,
)


@extend_schema(tags=["管理后台-system-用户个人中心"])
class UserProfileViewSet(
    CustomGenericViewSet, CustomRetrieveModelMixin, CustomUpdateModelMixin
):
    queryset = SystemUsers.objects.all()
    serializer_class = UserProfileDetailSerializer
    action_serializers = {
        "retrieve": UserProfileDetailSerializer,
        "update": UserProfileSaveSerializer,
        "update_user_profile_password": UserProfileUpdatePasswordSerializer,
        "update_user_avatar": UserProfileAvatarSerializer,
    }

    def get_object(self):
        # 强制返回当前登录用户
        return self.request.user

    @extend_schema(summary="修改用户个人密码")
    @action(methods=["put"], detail=False, url_path="update-password")
    def update_user_profile_password(self, request):
        """
        修改用户个人密码
        """
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = self.get_object()
        # 校验旧密码
        if not user.check_password(serializer.data.get("old_password")):
            return CommonResponse.error(code=111700, msg="旧密码错误")
        # 修改密码
        user.set_password(serializer.validated_data["new_password"])
        user.save()
        return CommonResponse.success(data=True)

    @extend_schema(summary="上传用户个人头像")
    @action(
        methods=["post", "put"],
        detail=False,
        url_path="update-avatar",
        parser_classes=[MultiPartParser, FormParser],
    )
    def update_user_avatar(self, request):
        """
        上传用户个人头像
        上传文件字段名: avatarFile
        """
        avatar_file = request.FILES.get("avatarFile")
        instance = self.get_object()
        if not avatar_file:  # 如果没有上传文件，则返回当前头像地址
            return self._build_avatar_response(request, instance)

        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        # 返回完整的头像地址
        return self._build_avatar_response(request, instance)

    def _build_avatar_response(self, request, instance):
        """构建头像响应，包含完整URL"""
        if settings.DEBUG:
            avatar_url = request.build_absolute_uri(instance.avatar.url)
        else:
            avatar_url = f"{settings.NGINX_BASE_URL}{instance.avatar.url}"

        return CommonResponse.success(data=avatar_url)
