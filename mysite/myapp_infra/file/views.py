import json
from drf_spectacular.utils import extend_schema
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from rest_framework.parsers import MultiPartParser

from mars_framework.viewsets.base import CustomModelViewSetNoExportNoSimple
from mars_framework.permissions.base import HasPermission
from mars_framework.response.base import CommonResponse
from ..file_config.models import InfraFileConfig
from .models import InfraFile
from .serializers import InfraFileSerializer
from .filters import InfraFileFilter
from .services import infra_file_service


@extend_schema(tags=["管理后台-infra-文件列表"])
class InfraFileViewSet(CustomModelViewSetNoExportNoSimple):
    queryset = InfraFile.objects.all()
    serializer_class = InfraFileSerializer
    filterset_class = InfraFileFilter
    action_permissions = {
        "create": [AllowAny()],
        "destroy": [HasPermission("infra:file:delete")],
        "update": [HasPermission("infra:file:update")],
        "retrieve": [HasPermission("infra:file:query")],
        "list": [HasPermission("infra:file:query")],
        "upload_file": [AllowAny()],
        "presigned_url": [AllowAny()],
        "download_file": [AllowAny()],
    }

    @extend_schema(summary="上传文件")
    @action(
        url_path="upload",
        methods=["post"],
        detail=False,
        parser_classes=[MultiPartParser],
    )
    def upload_file(self, request, *args, **kwargs):
        """后端上传文件"""
        # 1. 获取上传的文件
        uploaded_file = request.FILES.get("file")
        if not uploaded_file:
            return CommonResponse.error(code=121301, msg="未接收到文件")

        # 2. 获取关联配置：master=True
        try:
            file_config = InfraFileConfig.objects.get(master=True)
            config = json.loads(file_config.config)
        except InfraFileConfig.DoesNotExist:
            return CommonResponse.error(code=121302, msg="没有找到主文件配置")

        # 3. 获取文件存储服务
        file_client = infra_file_service.get_file_client(file_config.storage)
        if not file_client:
            return CommonResponse.error(code=121303, msg="暂不支持该类型的文件存储服务")
        url = file_client.upload_file(uploaded_file, config, file_config.id)
        if not url:
            return CommonResponse.error(code=121304, msg="文件上传失败")
        return CommonResponse.success(data=url)

    def perform_destroy(self, instance):
        """先删除文件，再删除数据库记录"""
        # 物理删除文件
        file_config = InfraFileConfig.objects.get(id=instance.config_id)
        file_client = infra_file_service.get_file_client(file_config.storage)
        if file_client:
            file_client.delete_file(instance.path)
        # 删除数据库记录
        return super().perform_destroy(instance)

    @extend_schema(summary="获取文件预签名地址", description="模式二：前端上传文件")
    @action(url_path="presigned-url", methods=["get"], detail=False)
    def presigned_url(self, request, *args, **kwargs):
        # TODO
        return CommonResponse.error(code=121305, msg="暂不支持该功能")

    @extend_schema(summary="下载文件")
    @action(url_path="download", methods=["get"], detail=True)
    def download_file(self, request, *args, **kwargs):
        # TODO
        return CommonResponse.error(code=121306, msg="暂不支持该功能")
