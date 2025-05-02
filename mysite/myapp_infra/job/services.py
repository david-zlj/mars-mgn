from mysite.celery import app
from django_celery_beat.models import PeriodicTask, CrontabSchedule
import logging
from datetime import datetime
from croniter import croniter

# 配置日志
logger = logging.getLogger(__name__)


def create_crontab_schedule(cron_expression):
    """解析和创建CrontabSchedule"""
    parts = cron_expression.split()
    minute, hour, day_of_month, month, day_of_week = parts
    schedule, _ = CrontabSchedule.objects.get_or_create(
        minute=minute,
        hour=hour,
        day_of_month=day_of_month,
        month_of_year=month,
        day_of_week=day_of_week,
    )
    return schedule


def get_next_cron_times(cron_expression, count=5, base=None):
    """
    根据Cron表达式和次数count，输出接下来count次的执行时间

    :param cron_expression: Cron表达式，例如"*/5 * * * *"
    :param count: 输出的执行时间次数
    :return: 一个包含接下来count次执行时间的列表，时间格式为字符串
    """
    # 获取当前时间
    if base is None:
        base = datetime.now()
    else:
        base = datetime.strptime(base, "%Y-%m-%d %H:%M:%S")
    # 创建croniter对象
    cron = croniter(cron_expression, base)
    # 生成接下来count次的执行时间
    # TODO 转换为时间戳
    times = [
        cron.get_next(datetime).strftime("%Y-%m-%d %H:%M:%S") for _ in range(count)
    ]
    return times


# class JobService:
#     """ """

#     def __init__(self, celery_app, timeout=3.0):
#         self.celery_app = celery_app
#         self.timeout = timeout

#     def get_celery_stats(self):
#         # TODO 大约需要10秒的时间，优化
#         inspect = self.celery_app.control.inspect(timeout=self.timeout)
#         print(inspect.stats())
#         return inspect.stats()  # 需确保Worker已启动

#     def check_handler(self, handler_name):
#         # TODO 检查所有app下的tasks.py文件，是否存在指定的handler
#         """
#         检查 handler是否存在

#         Args:
#         - handler_name: 处理器的名字

#         Returns:
#         - True: 如果处理器存在
#         - False: 如果处理器不存在
#         """
#         return True
#         # try:
#         #     handler = import_module(handler_name)
#         # except ImportError:
#         #     return False
#         # return True

#     def check_celery_status(self):
#         """
#         检查celery状态是否正常
#         """
#         # TODO
#         return True

#     def check_redis_status(self):
#         """
#         检查redis状态是否正常
#         """
#         #  TODO
#         return True


# job_service = JobService(celery_app=app)
