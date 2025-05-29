from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from rest_framework import viewsets
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomViewSet, CustomGenericViewSet
from mars_framework.response.base import CommonResponse


@extend_schema(tags=["管理后台-system-租户"])
class TenantViewSet(viewsets.GenericViewSet):
    """未实现"""

    @extend_schema(summary="使用域名，获得租户信息")
    @action(
        methods=["get"],
        detail=False,
        url_path="get-by-website",
        authentication_classes=[],
        permission_classes=[AllowAny],
    )
    def get_tenant_by_website(self, request, *args, **kwargs):
        """登录界面，根据用户的域名，获得租户信息"""
        # TODO 未实现
        return CommonResponse.success()
