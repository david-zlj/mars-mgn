import json
from django.core.mail import get_connection
from rest_framework.exceptions import ValidationError

from mars_framework.db.enums import MailSendStatusEnum, UserTypeEnum
from ..user.models import SystemUsers
from ..mail_log.serializers import MailLogSaveSerializer
from ..mail_log.models import SystemMailLog
from .models import SystemMailTemplate
from ..tasks import send_single_email_task


def update_mail_log(mail_log_id, send_time, send_status, send_exception=None):
    """更新邮件日志"""

    # 获取邮件日志记录
    mail_log = SystemMailLog.objects.get(id=mail_log_id)
    mail_log.send_time = send_time
    mail_log.send_status = send_status
    if send_exception:
        mail_log.send_exception = send_exception
    mail_log.save()


class DynamicEmailBackend:
    """​​动态邮件后端配置"""

    def __init__(self, mail_account):
        self.connection = get_connection(
            host=mail_account.host,
            port=mail_account.port,
            username=mail_account.username,
            password=mail_account.password,
            use_tls=mail_account.starttls_enable,
            use_ssl=mail_account.ssl_enable,
            # TODO 是否需要指定timeout
            # timeout=None,
        )


class MailSendService:
    def get_content(self, template_content, template_params):
        """
        通过模板内容与参数生成邮件内容
        """
        return template_content.format(**template_params)

    def get_user_email(self, user_id: int = None, to_mail: str = None) -> str:
        """
        获取邮件接收地址
        如果user_id不为空，优先通过user_id查询用户的邮箱，发送邮件到用户的邮箱
        """

        if user_id:
            try:
                user = SystemUsers.objects.get(id=user_id)
                return user.email
            except SystemUsers.DoesNotExist:
                raise ValidationError("用户ID无效，未找到对应的用户。")
        return to_mail

    def get_params(
        self,
        req_params: dict,
        user_id: int = None,
        user_type: int = UserTypeEnum.ADMIN.value,
    ) -> dict:
        """
        整理并补充发送邮件所需要的参数
        req_params:MailSendSerializer的数据
        """
        params = {
            "user_type": user_type,
            "to_mail": self.get_user_email(user_id, req_params.get("mail")),
        }
        # 如果获取不到接收的邮箱，则返回错误
        if not params["to_mail"]:
            raise ValidationError(
                "邮件接收地址不能为空，请检查用户的邮箱地址是否正确。"
            )
        # 通过模板编码获取模板信息
        template_code = req_params.get("template_code")
        try:
            template = SystemMailTemplate.objects.get(code=template_code)
        except SystemMailTemplate.DoesNotExist:
            raise ValidationError("模板编码无效，未找到对应的模板。")
        # 获取模板参数和发送内容
        template_params = req_params.get("template_params")
        params["template_params"] = json.dumps(template_params, ensure_ascii=False)
        params["template_content"] = (
            self.get_content(template.content, template_params)
            if template_params
            else template.content
        )
        params.update(
            {
                "template_code": template_code,
                "template_id": template.id,
                "template_nickname": template.nickname,
                "template_title": template.title,
                "send_status": MailSendStatusEnum.INIT.value,
                "account_id": template.account_id.id,
                "from_mail": template.account_id.mail,
            }
        )
        return params

    def send_single_mail(self, data: dict, creator_id: int = None, attachments=None):
        """
        生成邮件日志，调用Celery发送邮件任务
        data:MailLogSaveSerializer 反序列化时所需要的数据
        creator_id:创建人ID
        """
        # 验证参数并保存日志记录
        serializer = MailLogSaveSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        if creator_id:
            serializer.validated_data["creator"] = creator_id
            serializer.validated_data["updater"] = creator_id
        mail_log = serializer.save()
        # 发送邮件
        send_single_email_task.delay(
            title=data.get("template_title", ""),
            content=data.get("template_content", ""),
            nickname=data.get("template_nickname", ""),
            from_mail=data.get("from_mail", ""),
            to_mail=data.get("to_mail", ""),
            account_id=data.get("account_id", ""),
            mail_log_id=mail_log.id,
            attachments=attachments,
        )
        return mail_log.id


mail_send_service = MailSendService()
