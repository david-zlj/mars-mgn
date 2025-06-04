import logging
from django.db.models import Q
from django.core.cache import cache
from rest_framework import viewsets
from rest_framework.generics import get_object_or_404

from ..db.enums import DataScopeEnum
from .mixins import (
    CustomCreateModelMixin1,
    CustomListModelMixin1,
    CustomRetrieveModelMixin1,
    CustomDestroyModelMixin1,
    CustomUpdateModelMixin1,
    CustomExportModelMixin,
)
from .mixins import (
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    ListSimpleModelMixin,
    ExportModelMixin,
)

logger = logging.getLogger(__name__)

###### V1 版本视图集（弃用）


class CustomGenericViewSet1(viewsets.GenericViewSet):

    # 导出excel功能，两者需同时设置，否则会报错
    export_labels = []  # 导出数据时，用于定义excel表头
    export_fields = []  # 导出数据时，用于定义数据字段

    def get_object(self):
        """
        获取对象实例的方法。

        本方法主要用于根据请求中的id参数获取对应的对象实例。为了防止混淆，
        当id参数同时出现在URL和表单中时，将抛出ValueError异常。
        """
        # 检查id参数是否同时存在于URL查询参数和表单数据中
        if "id" in self.request.query_params and "id" in self.request.data:
            # TODO 优化
            raise ValueError("不允许同时从URL和表单传入id参数")

        queryset = self.get_queryset()
        # 如果id参数仅存在于URL查询参数中
        if "id" in self.request.query_params:
            obj = get_object_or_404(queryset, id=self.request.query_params["id"])
            self.check_object_permissions(self.request, obj)
            return obj
        # 如果id参数仅存在于表单数据中
        elif "id" in self.request.data:
            obj = get_object_or_404(queryset, id=self.request.data["id"])
            self.check_object_permissions(self.request, obj)
            return obj

        return super().get_object()


class CustomViewSet(
    CustomGenericViewSet1,
    CustomCreateModelMixin1,
    CustomListModelMixin1,
    CustomRetrieveModelMixin1,
    CustomDestroyModelMixin1,
    CustomUpdateModelMixin1,
    CustomExportModelMixin,
):
    """自定义ViewSet"""

    pass


###### V2 版本视图集


class CustomGenericViewSet(viewsets.GenericViewSet):
    http_method_names = ["get", "post", "put", "delete"]  # 排除 'patch' 方法
    action_serializers = {}  # 可以为每个action指定序列化器
    # 可以为每个action指定权限。注意：key是action名称，value是权限类实例列表，而不是权限类列表。
    action_permissions = {}
    # 可以为每个action指定查询集
    action_querysets = {}
    export_name = ""  # 导出文件名
    export_fields_labels = {}  # 导出数据时，指定导出字段
    export_data_map = {}  # 导出数据时，指定数据字段映射
    # 数据权限过滤设置：如果启用则填入字典，key是dept_column和user_column，value是过滤字段
    # 示例1：data_permissions = {"dept_column": "dept_id", "user_column": "user_id"}
    # 示例2：data_permissions = {"dept_column": "dept_id", "user_column": "id"}
    # 示例3：data_permissions = {"user_column": "creator"}
    data_permissions = {}

    def get_serializer_class(self):
        """
        动态获取序列化器类。
        根据当前的 action 动态加载对应的序列化器类，如果没有定义则使用默认的序列化器。
        """
        return self.action_serializers.get(self.action, super().get_serializer_class())

    def get_permissions(self):
        """
        动态获取权限。
        根据当前的 action 动态加载对应的权限，如果没有定义则使用默认的权限。
        """
        return self.action_permissions.get(self.action, super().get_permissions())

    def get_queryset(self):
        """动态获取查询集，并进行数据权限过滤"""
        # 1.动态获取查询集
        queryset = self.action_querysets.get(self.action, super().get_queryset())
        if not self.data_permissions:  # 没有启用数据权限，返回查询集
            return queryset

        # 2.检查视图集中的设置的 dept_column 和 user_column 是否合法
        dept_column = self.data_permissions.get("dept_column")
        user_column = self.data_permissions.get("user_column")
        model_fields = [field.name for field in queryset.model._meta.get_fields()]
        if dept_column and dept_column not in model_fields:
            logger.error(
                f"数据权限设置错误，请检查 data_permissions 设置。{dept_column} 列不存在模型中。"
            )
            return queryset.none()  # 设置错误，返回空查询集
        if user_column and user_column not in model_fields:
            logger.error(
                f"数据权限设置错误，请检查 data_permissions 设置。{user_column} 列不存在模型中。"
            )
            return queryset.none()  # 设置错误，返回空查询集

        # 3.从缓存中获取用户分配的角色，对应的数据权限
        user_id = self.request.user.id
        user_info = cache.get(f"system_users_{user_id}")
        if not user_info:
            logger.error(f"用户 {user_id} 缓存数据不存在，请重新登录。")
            return queryset.none()  # 返回空查询集，无权限
        data_scope = user_info.get("data_scope", [])
        data_scope_dept_ids = user_info.get("data_scope_dept_ids", [])

        # 4.进行数据权限过滤
        # 4.1全部数据权限
        if DataScopeEnum.ALL.value in data_scope:
            return queryset

        # 4.2组合Q查询条件
        q_objects = Q()
        if user_column and data_scope:  # 基于【用户】过滤数据权限
            if DataScopeEnum.SELF.value in data_scope:  # 用户本人数据权限
                q_objects |= Q(**{f"{user_column}": self.request.user.id})

        if dept_column and data_scope_dept_ids:  # 基于【部门】过滤数据权限
            if (
                DataScopeEnum.DEPT_CUSTOM.value in data_scope
                or DataScopeEnum.DEPT_ONLY.value in data_scope
                or DataScopeEnum.DEPT_AND_CHILD.value in data_scope
            ):  # 指定部门、本部门、本部门及以下的数据权限
                q_objects |= Q(**{f"{dept_column}__in": data_scope_dept_ids})

        return queryset.filter(q_objects) if q_objects else queryset.none()


class CustomModelViewSet(
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    ListSimpleModelMixin,
    ExportModelMixin,
    CustomGenericViewSet,
):
    """自定义ModelViewSet"""

    pass


class CustomModelViewSetNoExport(
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    ListSimpleModelMixin,
    CustomGenericViewSet,
):
    """自定义ModelViewSet，不带导出功能"""

    pass


class CustomModelViewSetNoSimple(
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    ExportModelMixin,
    CustomGenericViewSet,
):
    """自定义ModelViewSet，不带简要信息列表功能"""

    pass


class CustomModelViewSetNoExportNoSimple(
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    CustomGenericViewSet,
):
    """自定义ModelViewSet，不带导出功能，不带简要信息列表功能"""

    pass
