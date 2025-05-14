from rest_framework import serializers

from .models import SystemMenu


class MenuSerializer(serializers.ModelSerializer):
    """菜单序列化器"""

    def to_internal_value(self, data):
        """
        如果parent_id为0，则设置为None
        因为前端传递的parent_id为0，表示没有父级菜单，但数据库中parent_id不能为0
        """
        if data.get("parent_id") == 0:
            data["parent_id"] = None
        return super().to_internal_value(data)

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "name",
            "permission",
            "type",
            "sort",
            "parent_id",
            "path",
            "icon",
            "component",
            "component_name",
            "status",
            "visible",
            "keep_alive",
            "always_show",
            "create_time",
        ]
        read_only_fields = ["id", "create_time"]


MenuListSerializer = MenuSerializer


class MenuSimpleSerializer(serializers.ModelSerializer):
    """菜单简单序列化器"""

    class Meta:
        model = SystemMenu
        fields = [
            "id",
            "name",
            "parent_id",
            "type",
        ]
