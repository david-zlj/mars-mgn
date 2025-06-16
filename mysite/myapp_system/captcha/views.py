import base64, logging
from rest_framework.permissions import AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema
from captcha.models import CaptchaStore
from captcha.views import captcha_image

from mars_framework.viewsets.base import CustomGenericViewSet
from mars_framework.response.base import CommonResponse
from .serializers import CaptchaSerializer


logger = logging.getLogger(__name__)


@extend_schema(tags=["管理后台-system-验证码"])
class CaptchaViewSet(CustomGenericViewSet):
    serializer_class = CaptchaSerializer
    authentication_classes = []  # 验证码不需要认证
    action_permissions = {"get_captcha": [AllowAny()], "check": [AllowAny()]}

    @extend_schema(summary="获得验证码")
    @action(detail=False, methods=["post"], url_path="get", authentication_classes=[])
    def get_captcha(self, request, *args, **kwargs):
        """生成验证码并返回key和图片地址"""
        try:
            # 生成新验证码
            new_key = CaptchaStore.generate_key()
            image = captcha_image(request, new_key)
            image_base = base64.b64encode(image.content).decode("utf-8")
            # 构造响应数据
            data = {
                "captcha_key": new_key,
                "image_base": f"data:image/png;base64,{image_base}",
            }
            return CommonResponse.success(data=data)
        except Exception as e:
            return CommonResponse.error(code=112100, msg=f"验证码生成失败：{str(e)}")

    @extend_schema(summary="校验验证码")
    @action(detail=False, methods=["post"], url_path="check")
    def check(self, request, *args, **kwargs):
        """校验验证码是否正确"""
        try:
            # 获取请求参数
            captcha_key = request.data.get("captcha_key")
            captcha_value = request.data.get("captcha_value", "").lower().strip()

            if not all([captcha_key, captcha_value]):
                return CommonResponse.error(code=112101, msg="验证码错误")

            # 查询验证码记录
            captcha = CaptchaStore.objects.get(hashkey=captcha_key)

            # 验证成功后删除记录（可选）
            if captcha.response == captcha_value:
                captcha.delete()  # 根据安全策略决定是否立即删除
                return CommonResponse.success()

            return CommonResponse.error(code=112102, msg="验证码错误")

        except CaptchaStore.DoesNotExist:
            return CommonResponse.error(code=112103, msg="验证码已过期")
        except Exception as e:
            logger.error(f"验证码异常：{str(e)}")
            return CommonResponse.error(code=112104, msg="验证码异常")
