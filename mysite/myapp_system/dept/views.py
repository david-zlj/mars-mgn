from django.db.models.deletion import ProtectedError
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet
from mars_framework.response.base import CommonResponse
from mars_framework.permissions.base import has_perm
from .models import SystemDept
from .serializers import (
    DeptSaveSerializer,
    DeptDetailSerializer,
    DeptListSerializer,
    DeptSimpleSerializer,
)
from .filters import SystemDeptFilter


@extend_schema(tags=["管理后台-system-部门"])
class DeptViewSet(CustomViewSet):
    queryset = SystemDept.objects.all()
    filterset_class = SystemDeptFilter

    def get_serializer_class(self):
        serializer_classes = {
            "create_dept": DeptSaveSerializer,
            "update_dept": DeptSaveSerializer,
            "get_dept": DeptDetailSerializer,
            "get_simple_dept_list": DeptSimpleSerializer,
            "get_simple_dept_list_2": DeptSimpleSerializer,
            "get_dept_list": DeptListSerializer,
        }
        return serializer_classes.get(self.action, DeptListSerializer)

    @extend_schema(summary="创建部门")
    @action(
        methods=["post"],
        detail=False,
        url_path="create",
        # permission_classes=[HasPermission("system:dept:create")],
    )
    def create_dept(self, request, *args, **kwargs):
        """创建部门"""
        return self.custom_create(request, *args, **kwargs)

    @extend_schema(summary="更新部门")
    @action(
        methods=["put"],
        detail=False,
        url_path="update",
        # permission_classes=[HasPermission("system:dept:update")],
    )
    def update_dept(self, request, *args, **kwargs):
        """更新部门"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="删除部门")
    @action(
        methods=["delete"],
        detail=False,
        url_path="delete",
        # permission_classes=[HasPermission("system:dept:delete")],
    )
    def delete_dept(self, request, *args, **kwargs):
        """删除部门"""
        # TODO 是否允许级联删除子部门，是否会级联删除部门下的用户
        # 当存在子部门，无法删除
        try:
            return self.custom_destroy(request, *args, **kwargs)
        except ProtectedError as e:
            return CommonResponse.error(code=111301, msg="存在子部门，无法删除")

    @extend_schema(summary="获取部门信息")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        permission_classes=[has_perm("system:dept:query")],
    )
    def get_dept(self, request, *args, **kwargs):
        """获取部门信息"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="获取部门精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_dept_list(self, request, *args, **kwargs):
        """只包含被开启的部门，主要用于前端的下拉选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取部门精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_dept_list_2(self, request, *args, **kwargs):
        """只包含被开启的部门，主要用于前端的下拉选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取部门列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="list",
        # permission_classes=[HasPermission("system:dept:query")],
    )
    def get_dept_list(self, request, *args, **kwargs):
        """获取部门列表"""
        return self.custom_list(request, *args, **kwargs)
