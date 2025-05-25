"""定义 Celery 任务"""

from time import sleep
from celery import shared_task
from django.utils import timezone


@shared_task
def send_daily_report():
    # 示例：发送日报
    print(f"开始发送日报，现在时间：{timezone.now()}")
    sleep(30)
    print("发送成功")
    return "发送成功"


@shared_task
def cleanup_expired_data():
    # 示例：清理过期数据
    print("清理过期数据")
    sleep(15)
    print("清理完成")
    return "清理完成"
