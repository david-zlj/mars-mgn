"""
TODO 性能优化
"""

from rest_framework import viewsets, permissions
from rest_framework.generics import get_object_or_404
from rest_framework.exceptions import ValidationError


from .mixins import (
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    CustomExportModelMixin,
)


class CustomGenericViewSet(viewsets.GenericViewSet):

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
    CustomGenericViewSet,
    CustomCreateModelMixin,
    CustomListModelMixin,
    CustomRetrieveModelMixin,
    CustomDestroyModelMixin,
    CustomUpdateModelMixin,
    CustomExportModelMixin,
):
    """
    自定义ViewSet
    """
