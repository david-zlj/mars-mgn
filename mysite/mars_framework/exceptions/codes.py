"""
全局错误码
- 0-999 系统异常编码保留
- 关于 HTTP 响应状态码 https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Status
- 业务错误码，0表示成功，其它表示异常
"""

GLOBAL_ERROR_CODE = {
    # 400-499 客户端错误
    400: "请求参数不正确",
    401: "账号未登录",
    403: "没有该操作权限",
    404: "请求未找到",
    405: "请求方法不正确",
    423: "请求失败，请稍后重试",  # 并发请求，不允许
    429: "请求过于频繁，请稍后重试",
    # 500-599 服务端错误
    500: "系统异常",
    501: "功能未实现/未开启",
    502: "错误的配置项",
    # 900-999 自定义错误码
    900: "重复请求，请稍后重试",  # 重复请求
    901: "演示模式，禁止写操作",
    999: "未知错误",
}
SERVICE_ERROR_CODE_RANGE = {}

"""
业务错误码分配规则
- 范围：111000 - 999999
- 第一段，2 位，表示系统类型。例如：framework, system
- 第二段，2 位，表示模块。例如：user, auth
- 第三段，2 位，具体错误码，自增
"""

"""
业务错误码具体分配
framework-exception      101100 - 101199

system-user              111100 - 111199
system-auth              111200 - 111299
system-dept              111300 - 111399
system-post              111400 - 111499
system-role              111500 - 111599
system-menu              111600 - 111699
system-user_profile      111700 - 111799
system-notify_message    111800 - 111899
system-permission        111900 - 111999
system-dict_type         112000 - 112099

system-infra_job         121100 - 121199
system-file_config       121200 - 121299
system-file              121300 - 121399
"""
