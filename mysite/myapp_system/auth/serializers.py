from rest_framework import serializers
import re
from django.utils.translation import gettext_lazy as _

from mars_framework.db.enums import CommonStatusEnum, MenuTypeEnum
from ..user.models import SystemUsers
from ..menu.models import SystemMenu


class AuthLoginSerializer(serializers.Serializer):
    """用户登录序列化器"""

    username = serializers.CharField(
        min_length=4,
        max_length=16,
        error_messages={
            "required": "登录账号不能为空",
            "min_length": "账号长度至少为4位",
            "max_length": "账号长度不能超过16位",
        },
    )
    password = serializers.CharField(
        min_length=8,
        max_length=16,
        error_messages={
            "required": "密码不能为空",
            "min_length": _("密码长度至少为8位"),
            "max_length": "密码长度不能超过16位",
        },
    )

    def validate_username(self, value):
        if not re.match(r"^[A-Za-z0-9]+$", value):
            raise serializers.ValidationError("账号格式为数字以及字母")
        return value


class AuthRegisterSerializer(serializers.ModelSerializer):
    """用户注册序列化器"""

    username = serializers.RegexField(
        r"^[a-zA-Z0-9]{4,30}$",
        max_length=30,
        min_length=4,
        required=True,
        error_messages={
            "required": "用户账号不能为空",
            "invalid": "用户账号由数字、字母组成，长度为4-30个字符",
            "min_length": "用户账号长度不能少于4个字符",
            "max_length": "用户账号长度不能超过30个字符",
        },
    )
    nickname = serializers.CharField(
        max_length=30,
        required=True,
        error_messages={
            "required": "用户昵称不能为空",
            "max_length": "用户昵称长度不能超过30个字符",
        },
    )
    password = serializers.CharField(
        write_only=True,
        required=True,
        min_length=8,
        max_length=16,
        error_messages={
            "required": "密码不能为空",
            "min_length": "密码长度不能少于8位",
            "max_length": "密码长度不能超过16位",
        },
    )
    confirmPassword = serializers.CharField(
        write_only=True,
        required=True,
        min_length=8,
        max_length=16,
        error_messages={
            "required": "确认密码不能为空",
            "min_length": "密码长度不能少于8位",
            "max_length": "密码长度不能超过16位",
        },
    )

    class Meta:
        model = SystemUsers
        fields = [
            "nickname",
            "username",
            "password",
            "confirmPassword",
        ]

    def validate(self, data):
        if data["password"] != data["confirmPassword"]:
            raise serializers.ValidationError(
                {"confirmPassword": "两次输入的密码不一致"}
            )
        # 检查用户名是否唯一
        if SystemUsers.objects.filter(username=data["username"]).exists():
            raise serializers.ValidationError("该用户名已被占用")
        return data

    def create(self, validated_data):
        validated_data.pop("confirmPassword")
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
