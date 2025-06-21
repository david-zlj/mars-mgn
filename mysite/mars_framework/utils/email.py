from myapp_system.mail_log.models import SystemMailLog


def update_mail_log(mail_log_id, send_time, send_status, send_exception=None):
    """更新邮件日志"""

    mail_log = SystemMailLog.objects.get(id=mail_log_id)  # 获取邮件日志记录
    mail_log.send_time = send_time
    mail_log.send_status = send_status
    if send_exception:
        mail_log.send_exception = send_exception
    mail_log.save()
