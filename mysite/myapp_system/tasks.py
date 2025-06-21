"""定义 Celery 任务"""

from celery import shared_task


@shared_task
def send_single_mail_task(
    title,  # 邮件主题
    content,  # 邮件内容
    nickname,  # 发件人昵称
    from_mail,  # 发件人邮箱
    to_mail,  # 收件人邮箱
    account_id,  # 邮件账户ID
    mail_log_id,  # 邮件日志记录ID
    content_subtype="html",
    attachments=None,  # 附件列表（可选）
):
    """发送邮件任务"""
    # TODO 附件发送测试
    from django.core import mail
    from django.utils import timezone
    from mars_framework.db.enums import MailSendStatusEnum
    from mars_framework.utils.email import update_mail_log
    from .mail_template.services import DynamicEmailBackend
    from .mail_account.models import SystemMailAccount

    # 构建EmailMessage对象
    email = mail.EmailMessage(
        subject=title,
        body=content,
        from_email=f"{nickname} <{from_mail}>",
        to=[to_mail],
        attachments=attachments or [],
    )
    email.content_subtype = content_subtype

    try:
        # 获取邮件账户
        mail_account = SystemMailAccount.objects.get(id=account_id)
        backend = DynamicEmailBackend(mail_account)
        # 使用上下文管理器发送邮件
        with backend.connection as connection:
            connection.send_messages([email])
        # 更新邮件日志状态为成功
        update_mail_log(mail_log_id, timezone.now(), MailSendStatusEnum.SUCCESS.value)
    except SystemMailAccount.DoesNotExist:
        update_mail_log(
            mail_log_id,
            timezone.now(),
            MailSendStatusEnum.FAILURE.value,
            "邮件账户不存在",
        )
    except Exception as e:
        update_mail_log(
            mail_log_id, timezone.now(), MailSendStatusEnum.FAILURE.value, str(e)
        )


@shared_task
def operation_log_task(log_data):
    """记录操作日志"""
    from .operate_log.models import SystemOperateLog
    from .auth.services import auth_services

    user_id = log_data.get("user_id")
    if user_id:
        names = auth_services.get_user_names_by_id(user_id)
        if names:
            log_data.update(
                {
                    "username": names.get("username"),
                    "nickname": names.get("nickname"),
                }
            )
    SystemOperateLog.objects.create(**log_data)


# TODO 定期删除操作日志


@shared_task
def login_log_task(log_data):
    """记录登录日志"""
    from .login_log.models import SystemLoginLog

    SystemLoginLog.objects.create(**log_data)
