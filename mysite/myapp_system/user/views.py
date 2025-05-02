"""
TODO
- 权限
"""

from django.core.exceptions import ValidationError as DjangoValidationError
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from rest_framework.exceptions import ValidationError
from rest_framework.parsers import MultiPartParser
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet
from mars_framework.response.base import CommonResponse
from mars_framework.utils.excel import generate_excel_response
from mars_framework.exceptions.base import handle_drf_validation_error
from mars_framework.filters.base import apply_time_range_filter
from mars_framework.permissions.base import has_perm
from .models import SystemUsers
from .serializers import (
    UserSaveSerializer,
    UserDetailSerializer,
    UserListSerializer,
    UserSimpleSerializer,
    UserUpdatePasswordSerializer,
    UserStatusUpdateSerializer,
    UserExportSerializer,
    UserImportSerializer,
)
from .services import get_user_import_template_workbook, get_user_import_data
from .filters import SystemUsersFilter

# from .permissions import HasSystemPermission


@extend_schema(tags=["管理后台-system-用户"])
class UserViewSet(CustomViewSet):
    queryset = SystemUsers.objects.all()
    filterset_class = SystemUsersFilter
    export_labels = [
        "用户编号",
        "用户名称",
        "用户昵称",
        "部门名称",
        "用户邮箱",
        "手机号码",
        "用户性别",
        "帐号状态",
        "最后登录IP",
        "最后登录时间",
    ]
    export_fields = [
        "id",
        "username",
        "nickname",
        "deptName",
        "email",
        "mobile",
        "sex",
        "status",
        "loginIp",
        "loginDate",
    ]

    def get_serializer_class(self):
        serializer_classes = {
            "create_user": UserSaveSerializer,
            "update_user": UserSaveSerializer,
            "get_user": UserDetailSerializer,
            "get_simple_user_list": UserSimpleSerializer,
            "get_simple_user_list_2": UserSimpleSerializer,
            "get_user_page": UserListSerializer,
            "export_user": UserExportSerializer,
            "update_user_password": UserUpdatePasswordSerializer,
            "update_user_status": UserStatusUpdateSerializer,
            "import_user": UserImportSerializer,
        }
        return serializer_classes.get(self.action, UserListSerializer)

    @extend_schema(summary="新增用户")
    @action(
        methods=["post"],
        detail=False,
        url_path="create",
        # permission_classes=[HasPermission("system:user:create")],
    )
    def create_user(self, request, *args, **kwargs):
        """新增用户"""
        return self.custom_create(request, *args, **kwargs)

    @extend_schema(summary="修改用户")
    @action(
        methods=["put"],
        detail=False,
        url_path="update",
        # permission_classes=[HasPermission("system:user:update")],
    )
    def update_user(self, request, *args, **kwargs):
        """修改用户"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="删除用户")
    @action(
        methods=["delete"],
        detail=False,
        url_path="delete",
        # permission_classes=[HasPermission("system:user:delete")],
    )
    def delete_user(self, request, *args, **kwargs):
        """删除用户"""
        return self.custom_destroy(request, *args, **kwargs)

    @extend_schema(summary="重置用户密码")
    @action(
        methods=["put"],
        detail=False,
        url_path="update-password",
        # permission_classes=[HasPermission("system:user:update-password")],
    )
    def update_user_password(self, request, *args, **kwargs):
        """重置用户密码"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="修改用户状态")
    @action(
        methods=["put"],
        detail=False,
        url_path="update-status",
        # permission_classes=[HasPermission("system:user:update")],
    )
    def update_user_status(self, request, *args, **kwargs):
        """修改用户状态"""
        return self.custom_update(request, *args, **kwargs)

    @extend_schema(summary="获得用户分页列表", filters=SystemUsersFilter)
    @action(
        methods=["get"],
        detail=False,
        url_path="page",
        permission_classes=[has_perm("system:user:query")],
    )
    def get_user_page(self, request, *args, **kwargs):
        """获得用户分页列表"""
        return self.custom_list(
            request, create_time_filter=apply_time_range_filter, *args, **kwargs
        )

    @extend_schema(summary="获取用户精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="list-all-simple",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_user_list(self, request, *args, **kwargs):
        """获取用户精简信息列表，只包含被开启的用户，主要用于前端的下拉选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获取用户精简信息列表")
    @action(
        methods=["get"],
        detail=False,
        url_path="simple-list",
        # permission_classes=[IsAuthenticated],
    )
    def get_simple_user_list_2(self, request, *args, **kwargs):
        """获取用户精简信息列表，只包含被开启的用户，主要用于前端的下拉选项"""
        return self.custom_list(request, *args, **kwargs)

    @extend_schema(summary="获得用户详情")
    @action(
        methods=["get"],
        detail=False,
        url_path="get",
        permission_classes=[has_perm("system:user:query")],
    )
    def get_user(self, request, *args, **kwargs):
        """获得用户详情"""
        return self.custom_retrieve(request, *args, **kwargs)

    @extend_schema(summary="导出用户")
    @action(
        methods=["get"],
        detail=False,
        url_path="export",
        # permission_classes=[HasPermission("system:user:export")],
        permission_classes=[AllowAny],
    )
    def export_user(self, request, *args, **kwargs):
        """导出用户"""
        return self.custom_export(request, *args, **kwargs)

    @extend_schema(summary="获得导入用户模板")
    @action(
        methods=["get"],
        detail=False,
        url_path="get-import-template",
        # permission_classes=[HasPermission("system:user:import")],
        permission_classes=[AllowAny],
    )
    def get_import_template(self, request, *args, **kwargs):
        """获得导入用户模板"""
        workbook = get_user_import_template_workbook()
        return generate_excel_response(workbook, "用户导入模板.xlsx")

    @extend_schema(summary="导入用户")
    @action(
        methods=["post"],
        detail=False,
        url_path="import",
        # permission_classes=[HasPermission("system:user:import")],
        permission_classes=[AllowAny],
        parser_classes=[MultiPartParser],
    )
    def import_user(self, request, *args, **kwargs):
        """导入用户"""
        # TODO update_support 支持用户更新
        # TODO 用户账号已存在时，要能正确提示具体哪个 用户账号已在
        update_support = request.query_params.get("updateSupport", False)

        # 获取上传的文件
        file = request.FILES.get("file")
        if not file:
            return CommonResponse.error(code=111100, msg="没有接收到上传文件")
        # 读取 Excel 文件数据
        try:
            data = get_user_import_data(file)
        except Exception as e:
            return CommonResponse.error(code=111101, msg="文件读取失败")

        serializer = self.get_serializer(data=data, many=True)
        try:
            serializer.is_valid(raise_exception=True)
        except ValidationError as e:
            return handle_drf_validation_error(e)
        serializer.save()
        return CommonResponse.success(data=True)
