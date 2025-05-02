
from django_filters import rest_framework as filters

from .models import SystemUsers


class SystemUsersFilter(filters.FilterSet):
    username = filters.CharFilter(
        field_name="username", lookup_expr="icontains", label="用户名"
    )
    mobile = filters.CharFilter(
        field_name="mobile", lookup_expr="icontains", label="手机号"
    )
    status = filters.NumberFilter(field_name="status", label="状态")
    deptId = filters.NumberFilter(field_name="dept_id", label="部门ID")
    # TODO 角色ID过滤
    # roleId = filters.NumberFilter(field_name="role_id", label="角色ID") 

    class Meta:
        model = SystemUsers
        fields = [
            "username",
            "mobile",
            "status",
            "deptId",
            # "roleId",
        ]


