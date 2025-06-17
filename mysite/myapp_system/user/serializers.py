from django.conf import settings
from rest_framework import serializers
from rest_framework.validators import UniqueValidator

from .models import SystemUsers
from ..dept.models import SystemDept
from ..post.models import SystemPost


class UserSaveSerializer(serializers.ModelSerializer):
    """用户创建/修改请求序列化器"""

    post_ids = serializers.PrimaryKeyRelatedField(
        many=True, queryset=SystemPost.objects.all(), source="posts", required=False
    )

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "username",
            "nickname",
            "remark",
            "dept_id",
            "post_ids",
            "email",
            "mobile",
            "sex",
            # "avatar",
            "password",
        ]
        # 配置基础校验规则
        extra_kwargs = {
            "password": {
                "write_only": True,
                "min_length": settings.PASSWORD_MIN_LENGTH,
                "error_messages": {"min_length": "密码长度至少为8位"},
            },
            "username": {
                "min_length": settings.USERNAME_MIN_LENGTH,
                "max_length": settings.USERNAME_MAX_LENGTH,
                "error_messages": {
                    "min_length": "用户账号长度不能少于4个字符",
                    "max_length": "用户账号长度不能超过30个字符",
                    "unique": "用户账号已经存在",
                },
                "validators": [
                    UniqueValidator(
                        queryset=SystemUsers.objects.all(),
                        message="用户账号已经存在",
                    )
                ],
            },
        }

    def create(self, validated_data):
        # 创建用户时，设置密码
        password = validated_data.pop("password")
        user = super().create(validated_data)
        user.set_password(password)
        user.save()
        return user

    def update(self, instance, validated_data):
        password = validated_data.pop("password", None)
        user = super().update(instance, validated_data)
        # 如果有提供新密码则更新密码
        if password:
            user.set_password(password)
            user.save()
        return user


class UserSerializer(serializers.ModelSerializer):
    """用户详情序列化器"""

    deptId = serializers.PrimaryKeyRelatedField(source="dept_id", read_only=True)
    deptName = serializers.CharField(
        source="dept_id.name", read_only=True, default=None
    )
    postIds = serializers.PrimaryKeyRelatedField(
        many=True, source="posts", read_only=True
    )

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "username",
            "nickname",
            "remark",
            "deptId",
            "deptName",
            "postIds",
            "email",
            "mobile",
            "sex",
            "avatar",
            "status",
            "login_ip",
            "login_date",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


class UserSimpleSerializer(serializers.ModelSerializer):
    """用户简单序列化器"""

    deptId = serializers.PrimaryKeyRelatedField(source="dept_id", read_only=True)
    deptName = serializers.CharField(
        source="dept_id.name", read_only=True, default=None
    )

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "nickname",
            "deptId",
            "deptName",
        ]


class UserStatusUpdateSerializer(serializers.ModelSerializer):
    """用户更新状态请求序列化器"""

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "status",
        ]


class UserUpdatePasswordSerializer(serializers.ModelSerializer):
    """用户更新密码请求序列化器"""

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "password",
        ]
        extra_kwargs = {
            "password": {
                "write_only": True,
                "min_length": settings.PASSWORD_MIN_LENGTH,
                "error_messages": {"min_length": "密码长度至少为8位"},
            },
        }

    def update(self, instance, validated_data):
        # 更新密码
        password = validated_data.get("password")
        instance.set_password(password)
        instance.save()
        return instance


class UserExportSerializer(serializers.ModelSerializer):
    """导出用户"""

    deptName = serializers.CharField(
        source="dept_id.name", read_only=True, default=None
    )
    loginIp = serializers.CharField(source="login_ip", read_only=True)
    loginDate = serializers.DateTimeField(
        format="%Y-%m-%d %H:%M:%S", source="login_date", read_only=True
    )

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "username",
            "nickname",
            "deptName",
            "email",
            "mobile",
            "sex",
            "status",
            "loginIp",
            "loginDate",
        ]


class UserImportSerializer(serializers.ModelSerializer):
    """导入用户"""

    deptId = serializers.PrimaryKeyRelatedField(
        allow_null=True,
        queryset=SystemDept.objects.all(),
        source="dept_id",
        required=False,
        error_messages={
            "does_not_exist": "部门编号 {pk_value} 不存在",
            "incorrect_type": "部门编号类型错误",
        },
    )

    def validate_username(self, value):
        # 手动检查用户名唯一性
        if SystemUsers.objects.filter(username=value).exists():
            raise serializers.ValidationError(f"用户账号 {value} 已经存在")
        return value

    class Meta:
        model = SystemUsers
        fields = [
            "username",
            "nickname",
            "deptId",
            "email",
            "mobile",
            "sex",
            "status",
        ]
        extra_kwargs = {
            "password": {
                "write_only": True,
                "min_length": settings.PASSWORD_MIN_LENGTH,
                "error_messages": {"min_length": "密码长度至少为8位"},
            },
            "username": {
                "min_length": settings.USERNAME_MIN_LENGTH,
                "max_length": settings.USERNAME_MAX_LENGTH,
                "error_messages": {
                    "min_length": "用户账号长度不能少于4个字符",
                    "max_length": "用户账号长度不能超过30个字符",
                },
                "validators": [],  # 取消自动生成的唯一验证器
            },
        }

    def create(self, validated_data):
        user = super().create(validated_data)
        user.set_password(settings.DEFAULT_USER_PASSWORD)
        user.save()
        return user
