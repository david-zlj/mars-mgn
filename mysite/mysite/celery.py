"""定义和配置 Celery 实例"""

import os
from celery import Celery
from django.conf import settings


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings")
# 创建 Celery 实例
app = Celery("mysite")
# 加载配置文件中的 Celery 配置
app.config_from_object("django.conf:settings", namespace="CELERY")
# 自动发现并加载任务
app.autodiscover_tasks(["myapp_infra", "myapp_system"] + settings.MY_APPS, force=True)
