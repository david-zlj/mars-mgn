import json
from .models import SystemNotifyTemplate
from ..notify_message.serializers import NotifyMessageCreateSerializer


class NotifiySendService:

    def get_content(self, template_content, template_params):
        """
        通过模板和模板参数，生成最终发送内容
        """
        return template_content.format(**template_params)

    def get_params(self, req_params):
        """
        整理并补充发送站内信所需要的参数
        req_params: NotifySendReqSerializer 前端请求参数
        """
        params = {}
        params["user_id"] = req_params.get("user_id").id
        params["user_type"] = req_params.get("user_type")

        template_params = req_params.get("template_params")
        params["template_params"] = json.dumps(template_params, ensure_ascii=False)

        # 通过template_code获取SystemNotifyTemplate对象
        template_code = req_params.get("template_code")
        params["template_code"] = template_code
        template = SystemNotifyTemplate.objects.get(code=template_code)
        params["template_id"] = template.id
        params["template_nickname"] = template.nickname
        params["template_type"] = template.type
        params["template_content"] = (
            self.get_content(template.content, template_params)
            if template_params
            else template.content
        )
        return params

    def send_notify(self, data, creator_id=None):
        """
        发送站内信
        data: NotifyMessageCreateSerializer 数据
        creator_id: int 创建人id
        """
        serializer = NotifyMessageCreateSerializer(data=data)
        serializer.is_valid(raise_exception=True)
        if creator_id:
            serializer.validated_data["creator"] = creator_id
            serializer.validated_data["updater"] = creator_id
        return serializer.save()


notifiy_send_service = NotifiySendService()
