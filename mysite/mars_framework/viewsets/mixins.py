from datetime import datetime
from rest_framework import mixins, serializers
from rest_framework.decorators import action
from drf_spectacular.utils import (
    extend_schema,
    OpenApiResponse,
    OpenApiExample,
    inline_serializer,
)

from ..response.base import CommonResponse
from ..utils.excel import create_excel_workbook, generate_excel_response


### V2 版本


class CustomCreateModelMixin(mixins.CreateModelMixin):
    """新增"""

    @extend_schema(
        summary="新增",
        description="新增",
        responses={
            200: OpenApiResponse(
                response=inline_serializer(
                    name="CreateSuccess",
                    fields={
                        "code": serializers.IntegerField(),
                        "data": serializers.IntegerField(),
                        "msg": serializers.CharField(),
                    },
                ),
                examples=[
                    OpenApiExample(
                        "成功示例", value={"code": 0, "data": 123, "msg": ""}
                    )
                ],
            ),
        },
    )
    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        instance = self.perform_create(serializer)
        return CommonResponse.success(data=instance.id)

    def perform_create(self, serializer):
        return serializer.save(
            creator=self.request.user.id, updater=self.request.user.id
        )  # 补充创建者、更新者字段


class CustomDestroyModelMixin(mixins.DestroyModelMixin):
    """删除"""

    @extend_schema(
        summary="删除",
        description="删除",
        responses={
            200: OpenApiResponse(
                description="删除成功",
                response=inline_serializer(
                    name="DestroySuccess",
                    fields={
                        "code": serializers.IntegerField(),
                        "data": serializers.BooleanField(),
                        "msg": serializers.CharField(),
                    },
                ),
                examples=[
                    OpenApiExample(
                        "成功示例", value={"code": 0, "data": True, "msg": ""}
                    )
                ],
            ),
        },
    )
    def destroy(self, request, *args, **kwargs):
        instance = self.get_object()
        self.perform_destroy(instance)
        return CommonResponse.success()


class CustomUpdateModelMixin(mixins.UpdateModelMixin):
    """修改"""

    @extend_schema(
        summary="修改",
        description="修改",
        responses={
            200: OpenApiResponse(
                response=inline_serializer(
                    name="UpdateSuccess",
                    fields={
                        "code": serializers.IntegerField(),
                        "data": serializers.BooleanField(),
                        "msg": serializers.CharField(),
                    },
                ),
                examples=[
                    OpenApiExample(
                        "成功示例", value={"code": 0, "data": True, "msg": ""}
                    )
                ],
            ),
        },
    )
    def update(self, request, *args, **kwargs):
        partial = kwargs.pop("partial", False)
        instance = self.get_object()
        serializer = self.get_serializer(instance, data=request.data, partial=partial)
        serializer.is_valid(raise_exception=True)
        self.perform_update(serializer)

        if getattr(instance, "_prefetched_objects_cache", None):
            # If 'prefetch_related' has been applied to a queryset, we need to
            # forcibly invalidate the prefetch cache on the instance.
            instance._prefetched_objects_cache = {}

        return CommonResponse.success()

    def perform_update(self, serializer):
        serializer.save(updater=self.request.user.id)  # 补充更新者字段


class CustomRetrieveModelMixin(mixins.RetrieveModelMixin):
    """查询详情"""

    @extend_schema(
        summary="查询详情",
        description="查询详情",
    )
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        serializer = self.get_serializer(instance)
        return CommonResponse.success(data=serializer.data)


class BaseList:
    def _list(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return CommonResponse.success(data=serializer.data)


class CustomListModelMixin(BaseList):
    """查询列表"""

    @extend_schema(
        summary="查询列表",
        description="查询列表。（接口文档参数以实际为准）",
    )
    def list(self, request, *args, **kwargs):
        return self._list(request, *args, **kwargs)


class ListSimpleModelMixin(BaseList):
    """查询列表简要信息"""

    @extend_schema(
        summary="查询列表简要信息",
        description="查询列表简要信息。（接口文档参数以实际为准）",
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
    )
    def list_simple(self, request, *args, **kwargs):
        return self._list(request, *args, **kwargs)

    @extend_schema(
        summary="查询列表简要信息",
        description="查询列表简要信息。（接口文档参数以实际为准）",
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
    )
    def list_simple_2(self, request, *args, **kwargs):
        return self._list(request, *args, **kwargs)


class ExportModelMixin:
    """导出数据"""

    @extend_schema(
        summary="导出数据",
        description="导出数据。（接口文档参数以实际为准）",
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="export",
    )
    def export(self, request, *args, **kwargs):
        # 获取数据
        data = self.get_export_data(request, *args, **kwargs)
        # 生成 Excel 工作簿
        workbook = create_excel_workbook(
            data, self.export_fields_labels, self.export_data_map
        )
        # 生成文件名
        if not self.export_name:
            self.export_name = "导出数据"
        file_name = (
            f'{self.export_name}_{datetime.now().strftime("%Y%m%d_%H%M%S")}.xlsx'
        )
        # 返回 Excel 工作簿
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
