from rest_framework import serializers
from django.conf import settings

from ..user.models import SystemUsers
from ..dept.serializers import DeptSimpleSerializer
from ..role.serializers import RoleSimpleSerializer
from ..post.serializers import PostSimpleSerializer


class UserProfileDetailSerializer(serializers.ModelSerializer):
    """获得登录用户信息序列化器"""

    roles = RoleSimpleSerializer(many=True, read_only=True)
    dept = DeptSimpleSerializer(source="dept_id", read_only=True)
    posts = PostSimpleSerializer(many=True, read_only=True)

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "username",
            "nickname",
            "email",
            "mobile",
            "sex",
            "avatar",
            "login_ip",
            "login_date",
            "create_time",
            "roles",
            "dept",
            "posts",
        ]
        read_only_fields = [
            "id",
            "create_time",
        ]


class UserProfileSaveSerializer(serializers.ModelSerializer):
    """用户个人中心修改序列化器"""

    class Meta:
        model = SystemUsers
        fields = [
            "nickname",
            "email",
            "mobile",
            "sex",
        ]


class UserProfileUpdatePasswordSerializer(serializers.Serializer):
    """用户个人密码"""

    old_password = serializers.CharField(
        max_length=settings.PASSWORD_MAX_LENGTH,
        min_length=settings.PASSWORD_MIN_LENGTH,
        error_messages={
            "min_length": f"密码长度至少为{settings.PASSWORD_MIN_LENGTH}位",
            "max_length": f"密码长度不能超过{settings.PASSWORD_MAX_LENGTH}位",
            "blank": "密码不能为空",
            "null": "密码不能为空",
        },
    )
    new_password = serializers.CharField(
        max_length=settings.PASSWORD_MAX_LENGTH,
        min_length=settings.PASSWORD_MIN_LENGTH,
        error_messages={
            "min_length": f"密码长度至少为{settings.PASSWORD_MIN_LENGTH}位",
            "max_length": f"密码长度不能超过{settings.PASSWORD_MAX_LENGTH}位",
            "blank": "密码不能为空",
            "null": "密码不能为空",
        },
    )


class UserProfileAvatarSerializer(serializers.ModelSerializer):
    """上传用户个人头像序列化器"""

    avatarFile = serializers.FileField(
        source="avatar",
        help_text="头像地址",
        max_length=512,
    )

    class Meta:
        model = SystemUsers
        fields = ["avatarFile"]
