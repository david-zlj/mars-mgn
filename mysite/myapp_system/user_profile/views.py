from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import action
from rest_framework.exceptions import ValidationError
from rest_framework.parsers import MultiPartParser
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet
from mars_framework.response.base import CommonResponse
from mars_framework.exceptions.base import handle_drf_validation_error
from ..user.models import SystemUsers
from .serializers import (
    UserProfileDetailSerializer,
    UserProfileSaveSerializer,
    UserProfileUpdatePasswordSerializer,
    UserProfileAvatarSerializer,
)


@extend_schema(tags=["管理后台-system-用户个人中心"])
class UserProfileViewSet(CustomViewSet):
    queryset = SystemUsers.objects.all()

    def get_object(self):
        # 返回当前登录用户
        return self.request.user

    def get_serializer_class(self):
        serializer_classes = {
            "get_user_profile": UserProfileDetailSerializer,
            "update_user_profile": UserProfileSaveSerializer,
            "update_user_profile_password": UserProfileUpdatePasswordSerializer,
            "update_user_avatar": UserProfileAvatarSerializer,
        }
        return serializer_classes.get(self.action, UserProfileDetailSerializer)

    @extend_schema(summary="获得登录用户信息")
    @action(methods=["get"], detail=False, url_path="get")
    def get_user_profile(self, request, *args, **kwargs):
        """
        获得登录用户信息
        """
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="修改用户个人信息")
    @action(methods=["put"], detail=False, url_path="update")
    def update_user_profile(self, request, *args, **kwargs):
        """
        修改用户个人信息
        """
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="修改用户个人密码")
    @action(methods=["put"], detail=False, url_path="update-password")
    def update_user_profile_password(self, request):
        """
        修改用户个人密码
        """
        serializer = self.get_serializer(data=request.data)
        try:
            serializer.is_valid(raise_exception=True)
        except ValidationError as e:
            return handle_drf_validation_error(e)
        user = self.get_object()
        # 校验旧密码
        if not user.check_password(serializer.data.get("oldPassword")):
            return CommonResponse.error(code=111700, msg="旧密码错误")
        # 修改密码
        user.set_password(serializer.validated_data["newPassword"])
        user.save()
        return CommonResponse.success(data=True)

    @extend_schema(summary="上传用户个人头像")
    @action(
        methods=["post", "put"],
        detail=False,
        url_path="update-avatar",
        parser_classes=[MultiPartParser],
    )
    def update_user_avatar(self, request):
        """
        上传用户个人头像 TODO 是否实现PUT方法
        """
        avatar_file = request.FILES.get("avatarFile")
        if not avatar_file:
            return CommonResponse.error(code=111701, msg="没有接收到上传文件")
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data)
        try:
            serializer.is_valid(raise_exception=True)
        except ValidationError as e:
            return handle_drf_validation_error(e)
        serializer.save()
        return CommonResponse.success(data=instance.avatar.url)
