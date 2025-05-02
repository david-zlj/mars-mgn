from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

# from mars_framework.permissions.base import HasPermission
from mars_framework.viewsets.base import CustomViewSet

from .models import SystemPost
from .serializers import (
    PostSaveSerializer,
    PostDetailSerializer,
    PostListSerializer,
    PostSimpleSerializer,
    PostExportSerializer,
)
from .filters import SystemPostFilter


@extend_schema(tags=["管理后台-system-岗位"])
class PostViewSet(CustomViewSet):
    queryset = SystemPost.objects.all()
    filterset_class = SystemPostFilter
    export_labels = ["岗位序号", "岗位名称", "岗位编码", "岗位排序", "状态"]
    export_fields = ["id", "name", "code", "sort", "status"]

    def get_serializer_class(self):
        serializer_classes = {
            "create_post": PostSaveSerializer,
            "update_post": PostSaveSerializer,
            "get_post": PostDetailSerializer,
            "get_simple_post_list": PostSimpleSerializer,
            "get_simple_post_list_2": PostSimpleSerializer,
            "get_post_page": PostListSerializer,
            "export_post": PostExportSerializer,
        }
        return serializer_classes.get(self.action, PostListSerializer)

    @extend_schema(summary="创建岗位")
    @action(
        methods=["post"],
        detail=False,
        url_path="create",
        # permission_classes=[HasPermission("system:post:create")],
    )
    def create_post(self, request, *args, **kwargs):
        """创建岗位"""
        return self.custom_create(request, *args, **kwargs)

    @extend_schema(summary="更新岗位")
    @action(
        methods=["put"],
        detail=False,
        url_path="update",
        # permission_classes=[HasPermission("system:post:update")],
    )
    def update_post(self, request, *args, **kwargs):
        """更新岗位"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="删除岗位")
    @action(
        methods=["delete"],
        detail=False,
        url_path="delete",
        # permission_classes=[HasPermission("system:post:delete")],
    )
    def delete_post(self, request, *args, **kwargs):
        """删除岗位"""
        return self.custom_destroy(request, *args, **kwargs)

    @extend_schema(summary="获取岗位信息")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        # permission_classes=[HasPermission("system:post:query")],
    )
    def get_post(self, request, *args, **kwargs):
        """获取岗位信息"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="获取岗位全列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_post_list(self, request, *args, **kwargs):
        """只包含被开启的岗位，主要用于前端的下拉选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取岗位全列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_post_list_2(self, request, *args, **kwargs):
        """只包含被开启的岗位，主要用于前端的下拉选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(
        summary="获取岗位分页列表",
        filters=SystemPostFilter,
    )
    @action(
        methods=["get"],
        detail=False,
        url_path="page",
        # permission_classes=[HasPermission("system:post:query")],
    )
    def get_post_page(self, request, *args, **kwargs):
        """获取岗位分页列表"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="导出岗位数据")
    @action(
        methods=["get"],
        detail=False,
        url_path="export",
        # permission_classes=[HasPermission("system:post:export")],
        permission_classes=[AllowAny],
    )
    def export_post(self, request, *args, **kwargs):
        """导出岗位数据"""
        return self.custom_export(request, *args, **kwargs)
