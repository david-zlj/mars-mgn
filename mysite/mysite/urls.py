from django.conf import settings
from django.urls import path, include
from django.conf.urls.static import static

from drf_spectacular.views import (
    SpectacularAPIView,
    SpectacularRedocView,
    SpectacularSwaggerView,
)


### Django 全局异常处理
handler404 = "mars_framework.exceptions.base.custom_404_view"
handler500 = "mars_framework.exceptions.base.custom_500_view"


urlpatterns = [
    path("admin-api/system/", include("myapp_system.urls")),
    path("admin-api/infra/", include("myapp_infra.urls")),
    ### DRF 界面配置
    # path("api-auth", include("rest_framework.urls")),
    ### OpenAPI 接口文档配置 TODO 生产环境关闭
    path("api/schema/", SpectacularAPIView.as_view(), name="schema"),
    path(
        "api/schema/swagger-ui/",
        SpectacularSwaggerView.as_view(url_name="schema"),
        name="swagger-ui",
    ),
    path(
        "api/schema/redoc/",
        SpectacularRedocView.as_view(url_name="schema"),
        name="redoc",
    ),
]

### 开发环境静态文件配置 TODO 注意：生产环境请关闭，并使用Nginx
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
