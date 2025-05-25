from rest_framework import serializers
from django_celery_beat.models import PeriodicTask
from croniter import croniter


class JobSaveSerializer(serializers.Serializer):
    """任务创建/修改请求序列化器"""

    id = serializers.IntegerField(required=False)
    name = serializers.CharField()
    task = serializers.CharField()
    kwargs = serializers.CharField(required=False, allow_blank=True, allow_null=True)
    cron_expression = serializers.CharField()
    # TODO
    # retry_count = serializers.IntegerField(required=False)
    # retry_interval = serializers.IntegerField(required=False)
    # monitor_timeout = serializers.IntegerField(required=False)

    def validate_cron_expression(self, value):
        if not croniter.is_valid(value):
            raise serializers.ValidationError("CROM表达式不合法，示例：* * * * *")
        return value


class JobSerializer(serializers.ModelSerializer):
    """任务序列化器"""

    status = serializers.SerializerMethodField()
    cron_expression = serializers.SerializerMethodField()

    def get_status(self, obj):
        """根据 enabled 字段的值返回 status"""
        if obj.enabled:
            return 1
        else:
            return 2

    def get_cron_expression(self, obj):
        """获取cronExpression"""
        if obj.crontab:
            crontab = obj.crontab
            cron_expression = f"{crontab.minute} {crontab.hour} {crontab.day_of_month} {crontab.month_of_year} {crontab.day_of_week}"
            return cron_expression
        return None

    class Meta:
        model = PeriodicTask
        fields = [
            "id",
            "name",
            "status",
            "task",
            "kwargs",
            "cron_expression",
        ]
