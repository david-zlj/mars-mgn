"""
TODO
- 创建时数据库的creator和updater字段为空，补上自动添加
"""

from datetime import datetime

from ..response.base import CommonResponse
from ..utils.excel import create_excel_workbook, generate_excel_response


class CustomCreateModelMixin:
    """
    增
    """

    def custom_create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        # 数据校验失败时，返回第1个错误信息
        # try:
        #     serializer.is_valid(raise_exception=True)
        # except ValidationError as e:
        #     print(e.detail)
        #     if isinstance(e.detail, dict):
        #         field, errors = next(iter(e.detail.items()))
        #     return CommonResponse.error(code=400, msg=errors[0])
        instance = serializer.save(creator=request.user.id, updater=request.user.id)
        return CommonResponse.success(data=instance.id)


class CustomListModelMixin:
    """
    查   列表
    """

    def custom_list(self, request, create_time_filter=None, *args, **kwargs):
        """
        自定义列表方法，用于处理列表请求并可选地应用自定义时间过滤器

        参数:
        - create_time_filter: 可选的自定义时间过滤器函数，用于根据创建时间过滤查询集

        返回:
        - 返回一个包含序列化数据的响应对象，这些数据是根据请求过滤后的查询集
        """
        # 获取经过过滤的查询集
        queryset = self.filter_queryset(self.get_queryset())

        # 因前端请求的时间格式，与django-filter内置的时间格式不一致，所以需要自定义时间过滤器
        if create_time_filter:
            queryset = create_time_filter(request, queryset)

        # 对查询集进行分页处理
        page = self.paginate_queryset(queryset)
        if page is not None:
            # 如果分页不为空，则对当前页的数据进行序列化并返回分页响应
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        # 如果没有分页，对整个查询集进行序列化并返回成功响应
        serializer = self.get_serializer(queryset, many=True)
        return CommonResponse.success(serializer.data)


class CustomExportModelMixin:
    """
    导出   列表
    依赖 CustomViewSet 实例的下面属性
    - 导出excel的文件名：使用queryset模型的 db_table_comment属性
    - export_labels
    - export_fields
    """

    def custom_export(self, request, *args, **kwargs):
        data = self.get_export_data(request, *args, **kwargs)
        workbook = create_excel_workbook(data, self.export_labels, self.export_fields)
        # 生成文件名
        db_table_comment = self.get_queryset().model._meta.db_table_comment or "export"
        file_name = (
            f'{db_table_comment}_{datetime.now().strftime("%Y%m%d_%H%M%S")}.xlsx'
        )
        # 返回 Excel 文件
        return generate_excel_response(workbook, file_name)

    def get_export_data(self, request, create_time_filter=None, *args, **kwargs):
        # 获取经过分页与过滤后的数据
        queryset = self.filter_queryset(self.get_queryset())
        if create_time_filter:
            queryset = create_time_filter(request, queryset)
        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            data = serializer.data
        else:
            serializer = self.get_serializer(queryset, many=True)
            data = serializer.data
        return data


class CustomRetrieveModelMixin:
    """
    查    详情
    """

    def custom_retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return CommonResponse.success(serializer.data)


class CustomUpdateModelMixin:
    """
    改
    """

    def custom_update(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        # 数据校验失败时，返回第1个错误信息
        # try:
        #     serializer.is_valid(raise_exception=True)
        # except ValidationError as e:
        #     if isinstance(e.detail, dict):
        #         field, errors = next(iter(e.detail.items()))
        #     return CommonResponse.error(code=400, msg=errors[0])
        serializer.save(updater=request.user.id)
        return CommonResponse.success(data=True)


class CustomDestroyModelMixin:
    """
    删
    """

    def custom_destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return CommonResponse.success(data=True)

    def perform_destroy(self, instance):
        instance.delete()
