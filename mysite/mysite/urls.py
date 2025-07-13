from django.conf import settings
from django.urls import path, include
from django.conf.urls.static import static

from drf_spectacular.views import (
    SpectacularAPIView,
    SpectacularSwaggerView,
)


### Django 全局异常处理
handler404 = "mars_framework.exceptions.base.custom_404_view"
handler500 = "mars_framework.exceptions.base.custom_500_view"


urlpatterns = [
    path("admin-api/system/", include("myapp_system.urls")),
    path("admin-api/infra/", include("myapp_infra.urls")),
]

### 下面配置只有在 DEBUG=True 时才生效
if settings.DEBUG:
    # OpenAPI 接口文档配置，生产环境关闭
    urlpatterns += [
        path("api/schema/", SpectacularAPIView.as_view(), name="schema"),
        path(
            "api/schema/swagger-ui/", SpectacularSwaggerView.as_view(url_name="schema")
        ),
    ]
    # 在开发环境提供静态和媒体文件。生产环境请关闭，并使用Nginx或OpenResty
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
