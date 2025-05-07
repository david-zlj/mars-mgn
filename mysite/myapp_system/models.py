"""
根据Django的要求，导入本APP定义的所有模型
参考资料：https://docs.djangoproject.com/zh-hans/4.2/topics/db/models/#organizing-models-in-a-package
"""

from .user.models import SystemUsers, SystemUserPost, SystemUserRole
from .dept.models import SystemDept
from .post.models import SystemPost
from .menu.models import SystemMenu
from .role.models import SystemRole, SystemRoleMenu
from .dict_data.models import SystemDictData
from .notify_message.models import SystemNotifyMessage
from .notify_template.models import SystemNotifyTemplate
