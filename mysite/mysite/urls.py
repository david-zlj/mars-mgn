"""
TODO
- 日志记录
"""
from django.contrib import admin
from django.urls import path, include
from drf_spectacular.views import (
    SpectacularAPIView,
    SpectacularRedocView,
    SpectacularSwaggerView,
)
# from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


### Django 全局异常处理
handler404 = "mars_framework.exceptions.base.custom_404_view"
handler500 = "mars_framework.exceptions.base.custom_500_view"


urlpatterns = [
    path("admin-api/system/", include("myapp_system.urls")),
    path("admin-api/infra/", include("myapp_infra.urls")),
    # path("admin-api/infra/", include("myapp_infra.urls")),
    # Django REST framework 界面
    # path("api-auth", include("rest_framework.urls")),
    # Django admin 界面
    # path("admin/", admin.site.urls),

    ### OpenAPI 文档界面 TODO 生产环境关闭
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
