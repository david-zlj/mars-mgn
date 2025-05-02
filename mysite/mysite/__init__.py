"""
确保 Django 启动时会加载Celery 应用
"""

from .celery import app as celery_app

__all__ = ("celery_app",)
