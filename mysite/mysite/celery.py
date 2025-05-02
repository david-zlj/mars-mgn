"""
定义 Celery 实例
"""

import os
from celery import Celery
from django.conf import settings


# 设置默认的 Django 设置模块
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "mysite.settings")
app = Celery("mysite")
# 使用 Django 的设置文件配置 Celery
app.config_from_object("django.conf:settings", namespace="CELERY")


# 自动发现并加载任务
# app.autodiscover_tasks()
app.autodiscover_tasks(["myapp_infra", "myapp_system"] + settings.MY_APPS, force=True)
