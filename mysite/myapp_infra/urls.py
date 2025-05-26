from django.urls import path
from rest_framework.routers import SimpleRouter

from .job.views import JobViewSet
from .job_log.views import JobLogViewSet
from .file_config.views import InfraFileConfigViewSet
from .file.views import InfraFileViewSet
from .config.views import InfraConfigViewSet


# 创建（不带后缀/）路由器实例
router = SimpleRouter(trailing_slash=False)

# 管理后台 - 定时任务
router.register(r"job", JobViewSet, basename="job")
# 管理后台 - 定时任务日志
router.register(r"job-log", JobLogViewSet, basename="job_log")
# 管理后台 - 文件配置
router.register(r"file-config", InfraFileConfigViewSet, basename="file_config")
# 管理后台 - 文件
router.register(r"file", InfraFileViewSet, basename="file")
# 管理后台 - 参数配置
router.register(r"config", InfraConfigViewSet, basename="config")


urlpatterns = []
urlpatterns += router.urls
