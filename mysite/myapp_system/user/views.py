from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.response.base import CommonResponse
from mars_framework.utils.excel import generate_excel_response
from mars_framework.permissions.base import HasPermission
from mars_framework.db.enums import CommonStatusEnum
from .models import SystemUsers
from .serializers import (
    UserSaveSerializer,
    UserSerializer,
    UserSimpleSerializer,
    UserUpdatePasswordSerializer,
    UserStatusUpdateSerializer,
    UserExportSerializer,
    UserImportSerializer,
)
from .filters import UsersFilter
from .services import get_user_import_template_workbook, get_user_import_data


@extend_schema(tags=["管理后台-system-用户"])
class UserViewSet(CustomModelViewSet):
    queryset = SystemUsers.objects.all()
    serializer_class = UserSerializer
    filterset_class = UsersFilter
    action_serializers = {
        "create": UserSaveSerializer,
        "update": UserSaveSerializer,
        "update_status": UserStatusUpdateSerializer,
        "update_password": UserUpdatePasswordSerializer,
        "list_simple": UserSimpleSerializer,
        "list_simple_2": UserSimpleSerializer,
        "export": UserExportSerializer,
        "import_user": UserImportSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:user:create")],
        "destroy": [HasPermission("system:user:delete")],
        "update": [HasPermission("system:user:update")],
        "retrieve": [HasPermission("system:user:query")],
        "list": [HasPermission("system:user:query")],
        "update_password": [HasPermission("system:user:update-password")],
        "update_status": [HasPermission("system:user:update")],
        "export": [HasPermission("system:user:export")],
        "import_user": [HasPermission("system:user:import")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "get_import_template": [AllowAny()],
    }
    action_querysets = {
        # 只包含被开启的部门，主要用于前端的下拉选项
        "list_simple": SystemUsers.objects.filter(status=CommonStatusEnum.ENABLE.value),
        "list_simple_2": SystemUsers.objects.filter(
            status=CommonStatusEnum.ENABLE.value
        ),
    }
    # 开启数据权限
    data_permissions = {"dept_column": "dept_id", "user_column": "id"}
    export_name = "用户数据"
    export_fields_labels = {
        "id": "用户编号",
        "username": "用户账号",
        "nickname": "用户昵称",
        "deptName": "部门名称",
        "email": "用户邮箱",
        "mobile": "手机号码",
        "sex": "用户性别",
        "status": "账号状态",
        "loginIp": "最后登录IP",
        "loginDate": "最后登录时间",
    }
    export_data_map = {
        "sex": {0: "", 1: "男", 2: "女"},
        "status": {0: "开启", 1: "关闭"},
    }

    @extend_schema(summary="重置用户密码")
    @action(
        methods=["put"],
        detail=True,
        url_path="update-password",
    )
    def update_password(self, request, *args, **kwargs):
        """重置用户密码"""
        return super().update(request, *args, **kwargs)

    @extend_schema(summary="修改用户状态")
    @action(
        methods=["put"],
        detail=True,
        url_path="update-status",
    )
    def update_status(self, request, *args, **kwargs):
        """修改用户状态"""
        return super().update(request, *args, **kwargs)

    @extend_schema(summary="获得用户导入模板")
    @action(
        methods=["get"],
        detail=False,
        url_path="get-import-template",
    )
    def get_import_template(self, request, *args, **kwargs):
        """获得用户导入模板"""
        workbook = get_user_import_template_workbook()
        return generate_excel_response(workbook, "用户导入模板.xlsx")

    @extend_schema(summary="用户导入")
    @action(
        methods=["post"],
        detail=False,
        url_path="import",
        parser_classes=[MultiPartParser],
    )
    def import_user(self, request, *args, **kwargs):
        """用户导入"""
        # TODO update_support 支持用户更新
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
        serializer.is_valid(raise_exception=True)
        result = serializer.save()
        return CommonResponse.success(data=len(result))
