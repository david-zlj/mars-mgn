from enum import Enum

# 通用性别
SEX_CHOICES = [
    (0, "UNKNOWN"),  # 未知
    (1, "MALE"),  # 男
    (2, "FEMALE"),  # 女
]

# 通用状态
COMMON_STATUS_CHOICES = [
    (0, "ENABLE"),  # 启用
    (1, "DISABLE"),  # 禁用
]


class SexEnum(Enum):
    """性别的枚举值"""

    MALE = 1  # 男
    FEMALE = 2  # 女
    UNKNOWN = 0  # 未知


class CommonStatusEnum(Enum):
    """通用状态枚举"""

    ENABLE = 0  # 开启
    DISABLE = 1  # 关闭


# 菜单类型
MENU_TYPE_CHOICES = [
    (1, "DIR"),  # 目录
    (2, "MENU"),  # 菜单
    (3, "BUTTON"),  # 按钮
]


class MenuTypeEnum(Enum):
    """菜单类型枚举"""

    DIR = 1  # 目录
    MENU = 2  # 菜单
    BUTTON = 3  # 按钮


# 角色类型
ROLE_TYPE_CHOICES = [
    (1, "SYSTEM"),  # 内置角色
    (2, "CUSTOM"),  # 自定义角色
]


class RoleTypeEnum(Enum):
    """角色类型枚举"""

    SYSTEM = 1  # 内置角色
    CUSTOM = 2  # 自定义角色


# 数据范围
DATA_SCOPE_CHOICES = [
    (1, "ALL"),  # 全部数据权限
    (2, "DEPT_CUSTOM"),  # 指定部门数据权限
    (3, "DEPT_ONLY"),  # 部门数据权限
    (4, "DEPT_AND_CHILD"),  # 部门及以下数据权限
    (5, "SELF"),  # 仅本人数据权限
]


class DataScopeEnum(Enum):
    """数据范围枚举"""

    ALL = 1  # 全部数据权限
    DEPT_CUSTOM = 2  # 指定部门数据权限
    DEPT_ONLY = 3  # 部门数据权限
    DEPT_AND_CHILD = 4  # 部门及以下数据权限
    SELF = 5  # 仅本人数据权限


# 任务状态
JOB_STATUS_CHOICES = [
    (0, "INIT"),  # 初始化中
    (1, "NORMAL"),  # 开启
    (2, "STOP"),  # 暂停
]

# 任务状态对应的 Quartz 触发器状态集合
JOB_STATUS_QUARTZ_STATES = {
    0: set(),  # 初始化中，没有对应的 Quartz 触发器状态
    1: {"WAITING", "ACQUIRED", "BLOCKED"},  # 开启
    2: {"PAUSED", "PAUSED_BLOCKED"},  # 暂停
}

# 任务日志状态
JOB_LOG_STATUS_CHOICES = [
    (0, "RUNNING"),  # 运行中
    (1, "SUCCESS"),  # 成功
    (2, "FAILURE"),  # 失败
]


class UserTypeEnum(Enum):
    """全局用户类型枚举"""

    MEMBER = 1  # 会员，面向 c 端，普通用户
    ADMIN = 2  # 管理员，面向 b 端，管理后台
