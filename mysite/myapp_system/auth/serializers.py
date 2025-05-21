from rest_framework import serializers
import re
from django.conf import settings

from mars_framework.db.enums import CommonStatusEnum, MenuTypeEnum
from ..user.models import SystemUsers
from ..menu.models import SystemMenu


class AuthLoginSerializer(serializers.Serializer):
    """用户登录序列化器"""

    username = serializers.CharField(
        min_length=settings.USERNAME_MIN_LENGTH,
        max_length=settings.USERNAME_MAX_LENGTH,
        error_messages={
            "required": "登录账号不能为空",
            "min_length": f"账号长度至少为{settings.USERNAME_MIN_LENGTH}位",
            "max_length": f"账号长度不能超过{settings.USERNAME_MAX_LENGTH}位",
        },
    )
    password = serializers.CharField(
        min_length=settings.PASSWORD_MIN_LENGTH,
        max_length=settings.PASSWORD_MAX_LENGTH,
        error_messages={
            "required": "密码不能为空",
            "min_length": f"密码长度至少为{settings.PASSWORD_MIN_LENGTH}位",
            "max_length": f"密码长度不能超过{settings.PASSWORD_MAX_LENGTH}位",
        },
    )

    def validate_username(self, value):
        if not re.match(r"^[A-Za-z0-9]+$", value):
            raise serializers.ValidationError("账号格式为数字以及字母")
        return value


class AuthRegisterSerializer(serializers.ModelSerializer):
    """用户注册序列化器"""

    username = serializers.RegexField(
        r"^[a-zA-Z0-9]+$",
        min_length=settings.USERNAME_MIN_LENGTH,
        max_length=settings.USERNAME_MAX_LENGTH,
        required=True,
        error_messages={
            "required": "用户账号不能为空",
            "invalid": "用户账号由数字、字母组成",
            "min_length": f"账号长度至少为{settings.USERNAME_MIN_LENGTH}位",
            "max_length": f"账号长度不能超过{settings.USERNAME_MAX_LENGTH}位",
        },
    )
    nickname = serializers.CharField(
        min_length=settings.NICKNAME_MIN_LENGTH,
        max_length=settings.NICKNAME_MAX_LENGTH,
        required=True,
        error_messages={
            "required": "用户昵称不能为空",
            "min_length": f"用户昵称长度至少为{settings.NICKNAME_MIN_LENGTH}位",
            "max_length": f"用户昵称长度不能超过{settings.NICKNAME_MAX_LENGTH}位",
        },
    )
    password = serializers.CharField(
        write_only=True,
        required=True,
        min_length=settings.PASSWORD_MIN_LENGTH,
        max_length=settings.PASSWORD_MAX_LENGTH,
        error_messages={
            "required": "密码不能为空",
            "min_length": f"密码长度至少为{settings.PASSWORD_MIN_LENGTH}位",
            "max_length": f"密码长度不能超过{settings.PASSWORD_MAX_LENGTH}位",
        },
    )
    confirm_password = serializers.CharField(
        write_only=True,
        required=True,
        min_length=settings.PASSWORD_MIN_LENGTH,
        max_length=settings.PASSWORD_MAX_LENGTH,
        error_messages={
            "required": "确认密码不能为空",
            "min_length": f"密码长度至少为{settings.PASSWORD_MIN_LENGTH}位",
            "max_length": f"密码长度不能超过{settings.PASSWORD_MAX_LENGTH}位",
        },
    )

    class Meta:
        model = SystemUsers
        fields = [
            "nickname",
            "username",
            "password",
            "confirm_password",
        ]

    def validate(self, data):
        if data["password"] != data["confirm_password"]:
            raise serializers.ValidationError(
                {"confirm_password": "两次输入的密码不一致"}
            )
        # 检查用户名是否唯一
        if SystemUsers.objects.filter(username=data["username"]).exists():
            raise serializers.ValidationError("该用户名已被占用")
        return data

    def create(self, validated_data):
        validated_data.pop("confirm_password")
        password = validated_data.pop("password")
        user = super().create(validated_data)
        user.set_password(password)
        user.save()
        return user


class UserMixinSerializer(serializers.ModelSerializer):
    deptId = serializers.PrimaryKeyRelatedField(read_only=True, source="dept_id")

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "nickname",
            "avatar",
            "deptId",
        ]


class MenuMixinSerializer(serializers.ModelSerializer):
    parentId = serializers.PrimaryKeyRelatedField(
        source="parent_id", read_only=True, allow_null=True
    )
    componentName = serializers.CharField(
        source="component_name", required=False, allow_blank=True
    )
    keepAlive = serializers.BooleanField(source="keep_alive")
    alwaysShow = serializers.BooleanField(source="always_show")
    children = serializers.SerializerMethodField()

    def get_children(self, obj):
        """
        递归获取子菜单
        """
        children = obj.children.filter(
            status=CommonStatusEnum.ENABLE.value,
            type__in=[MenuTypeEnum.MENU.value, MenuTypeEnum.DIR.value],
        ).order_by("sort")
        serializer = MenuMixinSerializer(children, many=True)
        return serializer.data

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "parentId",
            "name",
            "path",
            "component",
            "componentName",
            "icon",
            "visible",
            "keepAlive",
            "alwaysShow",
            "children",
        ]


class AuthPermissionInfoSerializer(serializers.ModelSerializer):
    """获取登录用户的权限信息"""

    user = UserMixinSerializer(source="*")
    roles = serializers.SerializerMethodField()
    permissions = serializers.SerializerMethodField()
    menus = serializers.SerializerMethodField()

    def get_roles(self, obj):
        # 获取角色的code
        if not obj.roles.exists():
            return []
        return [role.code for role in obj.roles.all()]  # TODO 是否会重复

    def get_permissions(self, obj):
        # 获取角色的权限
        if not obj.roles.exists():
            return []
        permissions = set()
        for role in obj.roles.all():
            for menu in role.menus.filter(status=CommonStatusEnum.ENABLE.value):
                # 目前一个菜单一个权限字符串
                if menu.permission:
                    permissions.add(menu.permission)
        return list(permissions)

    def get_menus(self, obj):
        #  获取角色的菜单
        if not obj.roles.exists():
            return []
        # TODO 只显示有权限的菜单
        # menus = set()
        # for role in obj.roles.all():
        #     menus_queryset = role.menus.filter(
        #         status=CommonStatusEnum.ENABLE.value,
        #         type__in=[MenuTypeEnum.MENU.value, MenuTypeEnum.DIR.value],
        #     )
        #     menus.update(menus_queryset)

        queryset = SystemMenu.objects.filter(
            status=CommonStatusEnum.ENABLE.value,
            type__in=[MenuTypeEnum.MENU.value, MenuTypeEnum.DIR.value],
            parent_id__isnull=True,
        ).order_by("sort")
        print(queryset)
        serializer = MenuMixinSerializer(queryset, many=True)

        return serializer.data

    class Meta:
        model = SystemUsers
        fields = [
            "user",
            "roles",
            "permissions",
            "menus",
        ]
