import re
from rest_framework import serializers
from django.conf import settings

from mars_framework.db.enums import CommonStatusEnum, MenuTypeEnum, DataScopeEnum
from ..user.models import SystemUsers
from ..menu.models import SystemMenu
from .services import auth_services


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

    class Meta:
        model = SystemUsers
        fields = [
            "id",
            "nickname",
            "avatar",
            "dept_id",
        ]

    def to_representation(self, instance):
        data = super().to_representation(instance)
        if not settings.DEBUG:
            data["avatar"] = f"{settings.NGINX_BASE_URL}{instance.avatar.url}"
        return data


class MenuMixinSerializer(serializers.ModelSerializer):
    children = serializers.SerializerMethodField()

    def get_children(self, obj):
        """递归序列化子节点"""
        # 检查是否存在动态添加的子节点
        if hasattr(obj, "children_data") and obj.children_data:
            # 递归使用同一个序列化器处理子节点
            return MenuMixinSerializer(
                obj.children_data, many=True, context=self.context
            ).data

        # 没有子节点时返回空列表
        return []

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "parent_id",
            "name",
            "path",
            "component",
            "component_name",
            "icon",
            "visible",
            "keep_alive",
            "always_show",
            "children",
        ]


class AuthPermissionInfoSerializer(serializers.ModelSerializer):
    """获取登录用户的权限信息"""

    menus = serializers.SerializerMethodField()
    user = UserMixinSerializer(source="*")
    roles = serializers.SerializerMethodField()
    permissions = serializers.SerializerMethodField()
    # 数据权限相关
    data_scope = serializers.SerializerMethodField()
    data_scope_dept_ids = serializers.SerializerMethodField()

    def get_data_scope(self, obj) -> list:
        """获取用户的角色对应的数据权限范围"""
        if not obj.roles.exists():
            return [DataScopeEnum.SELF.value]  # 默认为仅本人数据权限
        data_scope = list(
            obj.roles.order_by("data_scope")
            .values_list("data_scope", flat=True)
            .distinct()
        )
        if DataScopeEnum.SELF.value not in data_scope:
            data_scope.append(DataScopeEnum.SELF.value)  # 默认添加本人数据权限
        return data_scope

    def get_data_scope_dept_ids(self, obj) -> list:
        """获取用户的角色对应数据权限部门ID"""
        if not obj.roles.exists():
            return []

        # 如果是全部数据权限，则不用计算部门ID
        data_scope = self.get_data_scope(obj)
        if DataScopeEnum.ALL.value in data_scope:
            return []

        dept_ids = set()
        # 计算指定部门ID
        if DataScopeEnum.DEPT_CUSTOM.value in data_scope:
            dept_custom = list(
                obj.roles.order_by("data_scope_dept_ids")
                .values_list("data_scope_dept_ids", flat=True)
                .distinct()
            )
            dept_custom = auth_services.extract_and_deduplicate(dept_custom)
            dept_ids.update(dept_custom)

        # 计算部门ID
        if DataScopeEnum.DEPT_ONLY.value in data_scope:
            if obj.dept_id:
                dept_ids.add(obj.dept_id_id)

        # 计算部门及以下ID
        if DataScopeEnum.DEPT_AND_CHILD.value in data_scope:
            if obj.dept_id:
                dept_and_child = auth_services.get_all_child_depts(obj.dept_id_id)
                dept_ids.update(dept_and_child)

        return list(dept_ids)

    def get_roles(self, obj) -> list:
        """获取用户的角色对应的权限字符串"""
        if not obj.roles.exists():
            return []
        return list(
            obj.roles.order_by("code").values_list("code", flat=True).distinct()
        )

    def get_permissions(self, obj) -> list:
        """获取用户的角色对应的菜单权限标识"""
        if not obj.roles.exists():
            return []
        permissions = (
            SystemMenu.objects.filter(
                roles__in=obj.roles.all(),  # 关联用户角色
                status=CommonStatusEnum.ENABLE.value,
                permission__isnull=False,  # 排除NULL值
            )
            .exclude(permission="")  #  排除空值
            .order_by(
                "permission"
            )  # 排序。如果不指定，则​​自动包含模型默认排序字段​​（id），导致去重不生效
            .values_list("permission", flat=True)
            .distinct()  #  去重
        )
        return list(permissions)

    def get_menus(self, obj) -> list:
        """ "获取用户的角色对应的菜单"""
        if not obj.roles.exists():
            return []

        # 一次性获取所有相关菜单的id
        menu_ids = (
            SystemMenu.objects.filter(
                roles__in=obj.roles.all(),  # 关联用户角色
                status=CommonStatusEnum.ENABLE.value,
                type__in=[MenuTypeEnum.MENU.value, MenuTypeEnum.DIR.value],
            )
            .values_list("id", flat=True)
            .distinct()
        )

        # 单次查询获取所有菜单
        all_menus = (
            SystemMenu.objects.filter(id__in=menu_ids)
            .select_related("parent_id")
            .order_by("sort")
            .only(
                "id",
                "parent_id",
                "name",
                "path",
                "component",
                "component_name",
                "icon",
                "visible",
                "keep_alive",
                "always_show",
                "sort",
            )
        )

        # 使用字典索引法构建树
        menu_dict = {menu.id: menu for menu in all_menus}
        for menu in all_menus:
            menu.children_data = []  # 初始化子节点

        # 构建父子关系
        # menu.parent_id_id 是指 menu父节点的id
        for menu in all_menus:
            if menu.parent_id and menu.parent_id_id in menu_dict:
                parent = menu_dict[menu.parent_id_id]
                parent.children_data.append(menu)

        # 获取根节点
        root_menus = [menu for menu in all_menus if menu.parent_id is None]
        #  使用序列化器序列化树形结构
        serializer = MenuMixinSerializer(root_menus, many=True)
        return serializer.data

    class Meta:
        model = SystemUsers
        fields = [
            "user",
            "roles",
            "permissions",
            "menus",
            "data_scope",
            "data_scope_dept_ids",
        ]
