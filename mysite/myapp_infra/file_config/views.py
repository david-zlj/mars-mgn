from drf_spectacular.utils import extend_schema
from rest_framework.decorators import action

from mars_framework.viewsets.base import CustomModelViewSetNoExportNoSimple
from mars_framework.permissions.base import HasPermission
from mars_framework.response.base import CommonResponse
from mars_framework.db.enums import FileStorageEnum
from .models import InfraFileConfig
from .serializers import InfraFileConfigSerializer
from .filters import InfraFileConfigFilter


@extend_schema(tags=["管理后台-infra-文件配置"])
class InfraFileConfigViewSet(CustomModelViewSetNoExportNoSimple):
    queryset = InfraFileConfig.objects.all()
    serializer_class = InfraFileConfigSerializer
    filterset_class = InfraFileConfigFilter
    action_permissions = {
        "create": [HasPermission("infra:file-config:create")],
        "destroy": [HasPermission("infra:file-config:delete")],
        "update": [HasPermission("infra:file-config:update")],
        "retrieve": [HasPermission("infra:file-config:query")],
        "list": [HasPermission("infra:file-config:query")],
        "update_master": [HasPermission("infra:file-config:update")],
        "do_test_conf": [HasPermission("infra:file-config:query")],
    }

    @extend_schema(summary="更新文件配置为 Master")
    @action(detail=True, methods=["put"], url_path="master")
    def update_master(self, request, *args, **kwargs):
        # 将旧 Master 配置的 master 设置为 False
        InfraFileConfig.objects.filter(master=True).update(master=False)
        # 更新当前配置为 Master
        instance = self.get_object()
        instance.master = True
        instance.save()
        return CommonResponse.success()

    @extend_schema(summary="测试文件配置是否正确")
    @action(detail=True, methods=["get"], url_path="test")
    def do_test_conf(self, request, *args, **kwargs):
        instance = self.get_object()
        if instance.storage != FileStorageEnum.LOCAL.value:
            return CommonResponse.error(code=121201, msg="暂时只支持本地存储")
        else:
            return CommonResponse.error(code=121202, msg="请使用文件列表测试")

    def destroy(self, request, *args, **kwargs):
        if self.get_object().id == 1:
            return CommonResponse.error(code=121201, msg="本地磁盘不允许删除")
        return super().destroy(request, *args, **kwargs)
