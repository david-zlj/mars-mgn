from rest_framework import serializers

from mars_framework.serializers.base import (
    CustomDateTimeField,
    CustomPrimaryKeyRelatedField,
)

from .models import SystemMenu


class MenuSaveSerializer(serializers.ModelSerializer):
    """菜单创建/修改请求序列化器"""

    componentName = serializers.CharField(
        source="component_name", required=False, allow_blank=True
    )
    parentId = CustomPrimaryKeyRelatedField(
        source="parent_id",
        queryset=SystemMenu.objects.all(),
        allow_null=True,
        required=False,
    )
    alwaysShow = serializers.BooleanField(source="always_show")
    keepAlive = serializers.BooleanField(source="keep_alive")

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "name",
            "permission",
            "type",
            "sort",
            "parentId",
            "path",
            "icon",
            "component",
            "componentName",
            "status",
            "visible",
            "keepAlive",
            "alwaysShow",
        ]


class MenuDetailSerializer(serializers.ModelSerializer):
    """菜单详情序列化器"""

    componentName = serializers.CharField(
        source="component_name", required=False, allow_blank=True
    )
    parentId = serializers.PrimaryKeyRelatedField(source="parent_id", read_only=True)
    keepAlive = serializers.BooleanField(source="keep_alive")
    alwaysShow = serializers.BooleanField(source="always_show")
    createTime = CustomDateTimeField(source="create_time", read_only=True)

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "name",
            "permission",
            "type",
            "sort",
            "parentId",
            "path",
            "icon",
            "component",
            "componentName",
            "status",
            "visible",
            "keepAlive",
            "alwaysShow",
            "createTime",
        ]


MenuListSerializer = MenuDetailSerializer

# class MenuListSerializer(serializers.ModelSerializer):
#     """菜单列表序列化器"""

#     componentName = serializers.CharField(
#         source="component_name", required=False, allow_blank=True
#     )
#     parentId = serializers.PrimaryKeyRelatedField(source="parent_id", read_only=True)
#     keepAlive = serializers.BooleanField(source="keep_alive")
#     alwaysShow = serializers.BooleanField(source="always_show")
#     createTime = CustomDateTimeField(source="create_time", read_only=True)

#     class Meta:
#         model = SystemMenu
#         fields = [
#             "id",
#             "name",
#             "permission",
#             "type",
#             "sort",
#             "parentId",
#             "path",
#             "icon",
#             "component",
#             "componentName",
#             "status",
#             "visible",
#             "keepAlive",
#             "alwaysShow",
#             "createTime",
#         ]


class MenuSimpleSerializer(serializers.ModelSerializer):
    """菜单简单序列化器"""

    parentId = serializers.PrimaryKeyRelatedField(source="parent_id", read_only=True)

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "name",
            "parentId",
            "type",
        ]
