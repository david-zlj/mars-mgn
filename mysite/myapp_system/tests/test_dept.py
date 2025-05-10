import pytest
from myapp_system.models import SystemDept


# @pytest.mark.django_db
# def test_dept_model():
#     dept = SystemDept.objects.create(
#         name="部门1",
#         parent_id=None,
#         leader_user_id=None,
#         sort=1,
#         status=1,
#         tenant_id=1,
#     )
#     assert dept.name == "部门1"
#     assert dept.parent_id is None
#     assert dept.sort == 1
#     assert dept.status == 1
#     assert dept.tenant_id == 1
#     assert dept.id is not None
