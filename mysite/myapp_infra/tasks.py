"""
定义 Celery 任务
"""

from time import sleep
from celery import shared_task
from django.utils import timezone


@shared_task
def send_daily_report():
    # 示例：发送日报
    print("Daily report sent at {}".format(timezone.now()))
    sleep(30)
    print("Cleanup Completed")
    return "Report Success"


@shared_task
def cleanup_expired_data():
    # 示例：清理过期数据
    print("Cleanup Expired Data")
    return "Cleanup Completed"
