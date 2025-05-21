from django.urls import path
from rest_framework.routers import SimpleRouter

from .job.views import JobViewSet
from .job_log.views import JobLogViewSet


# 创建（不带后缀/）路由器实例
router = SimpleRouter(trailing_slash=False)

# 管理后台 - 定时任务
router.register(r"job", JobViewSet, basename="job")
# 管理后台 - 定时任务日志
router.register(r"job-log", JobLogViewSet, basename="job_log")

urlpatterns = []
urlpatterns += router.urls
