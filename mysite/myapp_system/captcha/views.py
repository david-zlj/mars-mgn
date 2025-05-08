from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.response.base import CommonResponse


@extend_schema(tags=["管理后台-system-验证码"])
class CaptchaViewSet(CustomGenericViewSet):
    authentication_classes = []
    action_permissions = {"get_captcha": [AllowAny()]}

    @extend_schema(summary="获得验证码")
    @action(detail=False, methods=["post"], url_path="get")
    def get_captcha(self, request, *args, **kwargs):
        """获得验证码"""
        # TODO 未实现
        return CommonResponse.success()
