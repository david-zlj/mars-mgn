"""
全局业务状态码
- 注意区分HTTP状态码与业务状态码
- 业务状态码：0表示成功，其它表示异常
"""

"""
业务状态码分配规则
- 范围：100000 - 999999
- 第一段，2 位，表示应用APP。例如：myapp_system, myapp_infra
- 第二段，2 位，表示模块。例如：user, dept
- 第三段，2 位，表示自增数字。
"""

"""
业务状态码具体分配
一、项目框架预留
framework-exception      101100 - 101199

二、myapp_system 应用APP
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
system-captcha           112100 - 112199

三、myapp_infra 应用APP
infra-job               121100 - 121199
infra-file_config       121200 - 121299
infra-file              121300 - 121399
infra-config            121400 - 121499
"""

GLOBAL_ERROR_CODE = {
    # 400-499 客户端错误
    400: "请求参数不正确",
    401: "账号未登录",
    403: "没有该操作权限",
    404: "请求未找到",
    405: "请求方法不正确",
    423: "请求失败，请稍后重试",
    429: "请求过于频繁，请稍后重试",
    # 500-599 服务端错误
    500: "系统异常",
    501: "功能未实现/未开启",
    502: "错误的配置项",
    # 900-999 自定义错误码
    900: "重复请求，请稍后重试",
    901: "演示模式，禁止写操作",
    999: "未知错误",
}
