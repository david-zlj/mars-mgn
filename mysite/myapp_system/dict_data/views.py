from drf_spectacular.utils import extend_schema

from mars_framework.viewsets.base import CustomModelViewSet
from mars_framework.permissions.base import has_perm
from .models import SystemDictData
from .serializers import (
    DictDataSerializer,
    DictDataSimpleListSerializer,
)
from .filters import DictDataFilter


@extend_schema(tags=["管理后台-system-字典数据"])
class DictDataViewSet(CustomModelViewSet):
    queryset = SystemDictData.objects.all()
    serializer_class = DictDataSerializer
    filterset_class = DictDataFilter
    action_serializers = {
        "list_simple": DictDataSimpleListSerializer,
        "list_simple_2": DictDataSimpleListSerializer,
    }
    action_permissions = {
        "create": [has_perm("system:dict:create")],
        "destroy": [has_perm("system:dict:delete")],
        "update": [has_perm("system:dict:update")],
        "retrieve": [has_perm("system:dict:query")],
        "list": [has_perm("system:dict:query")],
        "export": [has_perm("system:dict:export")],
    }
