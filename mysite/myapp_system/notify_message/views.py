from django.utils import timezone
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import action
from drf_spectacular.utils import extend_schema

from mars_framework.permissions.base import HasPermission
from mars_framework.viewsets.mixins import (
    CustomListModelMixin,
    CustomRetrieveModelMixin,
)
from mars_framework.viewsets.base import CustomViewSet, CustomGenericViewSet
from mars_framework.response.base import CommonResponse
from .models import SystemNotifyMessage
from .serializers import NotifyMessageSerializer
from .filters import NotifyMessageFilter, MyNotifyMessageFilter


@extend_schema(tags=["管理后台-system-我的站内信"])
class NotifyMessageViewSet(
    CustomGenericViewSet, CustomListModelMixin, CustomRetrieveModelMixin
):
    queryset = SystemNotifyMessage.objects.all()
    serializer_class = NotifyMessageSerializer
    filterset_class = NotifyMessageFilter
    action_permissions = {
        "retrieve": [HasPermission("system:notify-message:query")],
        "list": [HasPermission("system:notify-message:query")],
    }

    @extend_schema(summary="获得我的站内信分页", filters=MyNotifyMessageFilter)
    @action(
        methods=["get"],
        detail=False,
        url_path="my-page",
        filterset_class=MyNotifyMessageFilter,
    )
    def get_my_notify_message_page(self, request, *args, **kwargs):
        """获得我的站内信分页"""
        queryset = self.filter_queryset(
            SystemNotifyMessage.objects.filter(user_id=request.user.id)
        )

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return CommonResponse.success(data=serializer.data)

    @extend_schema(summary="标记站内信为已读")
    @action(
        methods=["put"],
        detail=False,
        url_path="update-read",
    )
    def update_notify_message_read(self, request, *args, **kwargs):
        """标记站内信为已读"""
        ids = request.query_params.get("ids")
        if not ids:
            return CommonResponse.error(code=111800, msg="请选择要标记的站内信")
        # 通过 id 批量修改
        SystemNotifyMessage.objects.filter(id__in=ids.split(",")).update(
            read_status=True, read_time=timezone.now()
        )

        return CommonResponse.success()

    @extend_schema(summary="标记所有站内信为已读")
    @action(
        methods=["put"],
        detail=False,
        url_path="update-all-read",
    )
    def update_all_notify_message_read(self, request, *args, **kwargs):
        """标记所有站内信为已读"""
        # 当前用户的未读站内信，批量修改
        SystemNotifyMessage.objects.filter(
            user_id=request.user.id, read_status=False
        ).update(read_status=True, read_time=timezone.now())
        return CommonResponse.success()

    @extend_schema(summary="获取当前用户的最新站内信列表，默认10条")
    @action(
        methods=["get"],
        detail=False,
        url_path="get-unread-list",
    )
    def get_unread_notify_message_list(self, request, *args, **kwargs):
        """获取当前用户的最新站内信列表，默认10条"""
        size = request.query_params.get("size", 10)
        # TODO 是否未读
        queryset = SystemNotifyMessage.objects.filter(
            user_id=request.user.id, read_status=False
        ).order_by("-create_time")
        # 数量是否超过 size
        if queryset.count() > int(size):
            queryset = queryset[: int(size)]
        serializer = self.get_serializer(queryset, many=True)
        return CommonResponse.success(data=serializer.data)

    @extend_schema(summary="获得当前用户的未读站内信数量")
    @action(
        methods=["get"],
        detail=False,
        url_path="get-unread-count",
    )
    def get_unread_notify_message_count(self, request, *args, **kwargs):
        """获得当前用户的未读站内信数量"""
        # 当前用户的未读站内信数量
        count = SystemNotifyMessage.objects.filter(
            user_id=request.user.id, read_status=False
        ).count()
        print(count)
        return CommonResponse.success(data=count)
