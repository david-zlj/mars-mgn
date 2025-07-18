"""字典数据"""

from enum import Enum


class SexEnum(Enum):
    """性别的枚举值"""

    MALE = 1  # 男
    FEMALE = 2  # 女
    UNKNOWN = 0  # 未知


class CommonStatusEnum(Enum):
    """通用状态枚举"""

    ENABLE = 0  # 开启
    DISABLE = 1  # 关闭


class MenuTypeEnum(Enum):
    """菜单类型枚举"""

    DIR = 1  # 目录
    MENU = 2  # 菜单
    BUTTON = 3  # 按钮


class RoleTypeEnum(Enum):
    """角色类型枚举"""

    SYSTEM = 1  # 内置角色
    CUSTOM = 2  # 自定义角色


class DataScopeEnum(Enum):
    """数据范围枚举"""

    ALL = 1  # 全部数据权限
    DEPT_CUSTOM = 2  # 指定部门数据权限
    DEPT_ONLY = 3  # 部门数据权限
    DEPT_AND_CHILD = 4  # 部门及以下数据权限
    SELF = 5  # 仅本人数据权限


class UserTypeEnum(Enum):
    """全局用户类型枚举"""

    MEMBER = 1  # 会员，面向 c 端，普通用户
    ADMIN = 2  # 管理员，面向 b 端，管理后台


class MailSendStatusEnum(Enum):
    """邮件的发送状态枚举"""

    INIT = 0  # 初始化
    SUCCESS = 10  # 发送成功
    FAILURE = 20  # 发送失败
    IGNORE = 30  # 忽略，即不发送


class LoginLogTypeEnum(Enum):
    """登录日志的类型枚举"""

    LOGIN_USERNAME = 100  # 使用账号登录
    LOGIN_SOCIAL = 101  # 使用社交登录
    LOGIN_MOBILE = 103  # 使用手机登录
    LOGIN_SMS = 104  # 使用短信登录
    LOGOUT_SELF = 200  # 自己主动登出
    LOGOUT_DELETE = 202  # 强制退出
    REGISTER_USERNAME = 300  # 用户注册
    REFRESH_TOKEN = 400  # 刷新令牌


class LoginResultEnum(Enum):
    """登录结果的枚举类"""

    SUCCESS = 0  # 成功
    FAILURE = 1  # 失败
    BAD_CREDENTIALS = 10  # 账号或密码不正确
    USER_DISABLED = 20  # 用户被禁用
    CAPTCHA_NOT_FOUND = 30  # 图片验证码不存在
    CAPTCHA_CODE_ERROR = 31  # 图片验证码不正确


class OperateTypeEnum(Enum):
    """操作日志的操作类型枚举"""

    GET = 1  # 查询
    CREATE = 2  # 新增
    UPDATE = 3  # 修改
    DELETE = 4  # 删除
    EXPORT = 5  # 导出
    IMPORT = 6  # 导入
    OTHER = 0  # 其它（无法归类时使用）


class ApiErrorLogProcessStatusEnum(Enum):
    """API 异常数据的处理状态枚举"""

    INIT = 0  # 未处理
    DONE = 1  # 已处理
    IGNORE = 2  # 已忽略


class FileStorageEnum(Enum):
    """文件存储器枚举"""

    DB = 1  # 数据库
    LOCAL = 10  # 本地磁盘
    FTP = 11  # FTP服务器
    SFTP = 12  # SFTP服务器
    S3 = 20  # S3对象存储


class JobStatusEnum(Enum):
    """任务状态的枚举"""

    INIT = 0  # 初始化中
    NORMAL = 1  # 开启
    STOP = 2  # 暂停


class JobLogStatusEnum(Enum):
    """任务日志的状态枚举"""

    STARTED = 0  # 运行中
    SUCCESS = 1  # 成功
    FAILURE = 2  # 失败


class ConfigTypeEnum(Enum):
    """配置类型枚举"""

    SYSTEM = 1  # 系统配置
    CUSTOM = 2  # 自定义配置
