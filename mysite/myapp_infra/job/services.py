from django_celery_beat.models import CrontabSchedule
import logging
from datetime import datetime
from croniter import croniter

logger = logging.getLogger(__name__)


class InfraJobService:

    def get_or_create_crontab_schedule(self, cron_expression):
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

    def get_next_times(self, cron_expression, count=5, base=None):
        """根据Cron表达式和次数count，输出接下来count次的执行时间"""
        # 获取当前时间
        if base is None:
            base = datetime.now()
        else:
            base = datetime.strptime(base, "%Y-%m-%d %H:%M:%S")
        # 创建croniter对象
        cron = croniter(cron_expression, base)
        # 生成接下来count次的执行时间
        times = [
            cron.get_next(datetime).strftime("%Y-%m-%d %H:%M:%S") for _ in range(count)
        ]
        return times


infra_job_service = InfraJobService()
