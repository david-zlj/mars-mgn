"""定义 Celery 任务"""

from celery import shared_task


@shared_task
def send_single_email_task(
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
    from django.core import mail
    from django.utils import timezone
    from mars_framework.db.enums import MailSendStatusEnum
    from .mail_template.services import DynamicEmailBackend, update_mail_log
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
