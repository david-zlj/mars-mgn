from drf_spectacular.utils import extend_schema

from rest_framework.permissions import AllowAny
from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.permissions.base import HasPermission
from mars_framework.db.enums import CommonStatusEnum
from .models import SystemPost
from .serializers import (
    PostSerializer,
    PostSimpleSerializer,
    PostExportSerializer,
)
from .filters import PostFilter


@extend_schema(tags=["管理后台-system-岗位"])
class PostViewSet(CustomModelViewSet):
    queryset = SystemPost.objects.all()
    serializer_class = PostSerializer
    filterset_class = PostFilter
    action_serializers = {
        "list_simple": PostSimpleSerializer,
        "list_simple_2": PostSimpleSerializer,
        "export": PostExportSerializer,
    }
    action_permissions = {
        "create": [HasPermission("system:post:create")],
        "destroy": [HasPermission("system:post:delete")],
        "update": [HasPermission("system:post:update")],
        "retrieve": [HasPermission("system:post:query")],
        "list": [HasPermission("system:post:query")],
        "export": [HasPermission("system:post:export")],
        "list_simple": [AllowAny()],  # 无需添加权限认证，因为前端全局都需要
        "list_simple_2": [AllowAny()],
    }
    action_querysets = {
        # 只包含被开启的岗位，主要用于前端的下拉选项
        "list_simple": SystemPost.objects.filter(status=CommonStatusEnum.ENABLE.value),
        "list_simple_2": SystemPost.objects.filter(
            status=CommonStatusEnum.ENABLE.value
        ),
    }

    export_name = "岗位列表"
    export_fields_labels = {
        "id": "岗位序号",
        "name": "岗位名称",
        "code": "岗位编码",
        "sort": "岗位排序",
        "status": "状态",
    }
    export_data_map = {"status": {0: "开启", 1: "关闭"}}
