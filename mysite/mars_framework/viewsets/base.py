"""
TODO 性能优化
"""

from rest_framework import viewsets
from rest_framework.generics import get_object_or_404

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

### V1 版本视图集（弃用） 


class CustomGenericViewSet1(viewsets.GenericViewSet):

    # 导出excel功能，两者需同时设置，否则会报错
    export_labels = []  # 导出数据时，用于定义excel表头
    export_fields = []  # 导出数据时，用于定义数据字段

    def get_object(self):
        """
        获取对象实例的方法。

        本方法主要用于根据请求中的id参数获取对应的对象实例。为了防止混淆，
        当id参数同时出现在URL和表单中时，将抛出ValueError异常。

        Raises:
            ValueError: 如果id参数同时存在于URL和表单中，则抛出此异常。

        Returns:
            根据id参数获取的对象实例，如果未找到对应id的对象，则返回404错误。
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


### V2 版本视图集


class CustomGenericViewSet(viewsets.GenericViewSet):
    http_method_names = ["get", "post", "put", "delete"]  # 排除 'patch' 方法
    action_serializers = {}  # 可以为每个action指定序列化器
    # 可以为每个action指定权限。注意：key是action名称，value是权限类实例列表，而不是权限类列表。
    action_permissions = {}
    export_name = ""  # 导出文件名
    export_fields_labels = {}  # 导出数据时，指定导出字段
    export_data_map = {}  # 导出数据时，指定数据字段映射
    # TODO 接口白名单

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
