"""Django 启动时加载Celery实例"""

from .celery import app as celery_app

__all__ = ("celery_app",)
