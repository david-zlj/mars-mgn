from pathlib import Path
from datetime import timedelta
from corsheaders.defaults import default_headers

BASE_DIR = Path(__file__).resolve().parent.parent

SECRET_KEY = "django-insecure-lm*vvf-ds3(q20dft_%i4%nrkcl3)tja@*z2(&^sdhrfrty=rw"

DEBUG = True

ALLOWED_HOSTS = ["*"]

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "rest_framework",
    "django_filters",
    "drf_spectacular",  # OpenAPI 接口文档 TODO 生产环境请关闭
    "drf_spectacular_sidecar",  # OpenAPI 界面 TODO 生产环境请关闭
    "django_celery_beat",  # Celery 定时任务扩展
    "django_celery_results",  # # Celery 定时任务扩展
    "channels",  # Channels WebSocket功能
    "corsheaders",  # CORS 跨域支持
    "captcha",  # 验证码
    "myapp_system",
    "myapp_infra",
    # 请将新的自定义应用添加到下面的MY_APPS列表
]
MY_APPS = []  # 请将新的自定义应用添加到这里
INSTALLED_APPS += MY_APPS

MIDDLEWARE = [
    "corsheaders.middleware.CorsMiddleware",  # CORS跨域支持
    "django.middleware.security.SecurityMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.locale.LocaleMiddleware",  # I18N多语言支持，注意放置顺序
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    # "myapp_system.operate_log.services.OperateLogMiddleware",  # 操作日志开关：如果数据库磁盘IO性能一般，建议关闭
]

ROOT_URLCONF = "mysite.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.contrib.messages.context_processors.messages",
            ],
        },
    },
]

WSGI_APPLICATION = "mysite.wsgi.application"

### 数据库配置
# DATABASE_HOST = "mars-mysql"  # Docker部署时填写mars-mysql
DATABASE_HOST = "127.0.0.1"  # 数据库地址
DATABASE_PORT = "3306"  # 数据库端口
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",
        "NAME": "mars-mgn-2",
        "USER": "root",
        "PASSWORD": "123456",
        "HOST": DATABASE_HOST,
        "PORT": DATABASE_PORT,
        "OPTIONS": {"init_command": "SET time_zone='+08:00'"},
    }
}

###  密码验证：默认不使用
AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation.UserAttributeSimilarityValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.MinimumLengthValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.CommonPasswordValidator",
    },
    {
        "NAME": "django.contrib.auth.password_validation.NumericPasswordValidator",
    },
]


LANGUAGE_CODE = "zh-hans"  # 简体中文

TIME_ZONE = "Asia/Shanghai"  # 中国上海时区

USE_TZ = True

### I18N 配置
USE_I18N = True  # 是否启用国际化
LOCALE_PATHS = [BASE_DIR / "locale"]
LANGUAGES = (
    ("zh-hans", "简体中文"),
    ("en", "English"),
)

DEFAULT_AUTO_FIELD = "django.db.models.BigAutoField"

### 静态文件配置
STATIC_ROOT = BASE_DIR / "static"
STATIC_URL = "/static/"

### 媒体文件（用户上传文件）配置
MEDIA_ROOT = BASE_DIR / "media"  # 文件存储的绝对物理路径
MEDIA_URL = "/media/"  # 访问媒体文件的URL前缀
FILE_UPLOAD_MAX_MEMORY_SIZE = 10485760  # 10MB内存缓冲
DATA_UPLOAD_MAX_MEMORY_SIZE = 104857600  # 100MB请求体限制

### 生产环境中，静态文件与媒体文件的访问地址前缀
NGINX_BASE_URL = "http://192.168.0.73"  # 按实际修改

# 自定义用户模型
AUTH_USER_MODEL = "myapp_system.SystemUsers"

### 日志配置
LOG_DIR = BASE_DIR / "logs"
LOG_DIR.mkdir(parents=True, exist_ok=True)  # 自动创建日志目录
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": "{asctime} {levelname} {pathname} {lineno:d} {message}",
            "style": "{",
        },
        "simple": {
            "format": "{asctime} {levelname} {message}",
            "style": "{",
        },
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "formatter": "simple",
            "level": "INFO",
        },
        # 基于大小滚动日志记录器
        "access_file": {
            "class": "logging.handlers.RotatingFileHandler",
            "filename": LOG_DIR / "access.log",
            "maxBytes": 1024 * 1024 * 100,  # 每个日志文件最大 100MB
            "backupCount": 10,  # 保留 10 个备份文件
            "delay": True,  # 延迟打开文件，减少占用冲突
            "formatter": "verbose",
            "level": "INFO",
            "encoding": "utf-8",
        },
        "error_file": {
            "class": "logging.handlers.RotatingFileHandler",
            "filename": LOG_DIR / "error.log",
            "maxBytes": 1024 * 1024 * 100,  # 每个日志文件最大 100MB
            "backupCount": 10,  # 保留 10 个备份文件
            "delay": True,  # 延迟打开文件，减少占用冲突
            "formatter": "verbose",
            "level": "ERROR",  # 只记录错误及以上级别的日志
            "encoding": "utf-8",
        },
    },
    "loggers": {
        "django": {  # Django 内置日志
            "handlers": ["console", "access_file", "error_file"],
            "level": "INFO",
            "propagate": False,
        },
        "": {  # 根记录器，捕获未指定的日志
            "handlers": ["console", "access_file", "error_file"],
            "level": "INFO",
            "propagate": True,
        },
        "uvicorn.error": {
            "handlers": ["console", "access_file", "error_file"],
            "level": "INFO",
            "propagate": False,
        },
        "uvicorn.access": {
            "handlers": ["console", "access_file", "error_file"],
            "level": "INFO",
            "propagate": False,
        },
    },
}

### DRF 配置
REST_FRAMEWORK = {
    # 全局渲染器配置
    "DEFAULT_RENDERER_CLASSES": [
        "djangorestframework_camel_case.render.CamelCaseJSONRenderer",
    ],
    # 全局解释器配置
    "DEFAULT_PARSER_CLASSES": [
        "djangorestframework_camel_case.parser.CamelCaseJSONParser",
        # "rest_framework.parsers.JSONParser",
    ],
    # 全局异常处理
    "EXCEPTION_HANDLER": "mars_framework.exceptions.base.custom_exception_handler",
    # JWT 认证配置
    "DEFAULT_AUTHENTICATION_CLASSES": [
        "rest_framework_simplejwt.authentication.JWTAuthentication",
    ],
    # 全局权限配置
    "DEFAULT_PERMISSION_CLASSES": [
        "rest_framework.permissions.IsAuthenticated",
    ],
    # OpenAPI 接口文档 TODO 生产环境主关闭
    "DEFAULT_SCHEMA_CLASS": "drf_spectacular.openapi.AutoSchema",
    # 全局分页配置
    "DEFAULT_PAGINATION_CLASS": "mars_framework.pagination.base.CustomPageNumberPagination",
    "PAGE_SIZE": 10,
    # 全局过滤配置
    "DEFAULT_FILTER_BACKENDS": [
        "django_filters.rest_framework.DjangoFilterBackend",
    ],
}

### Simpel JWT 配置
SIMPLE_JWT = {
    "ACCESS_TOKEN_LIFETIME": timedelta(hours=12),  # Access Token 有效期
    "REFRESH_TOKEN_LIFETIME": timedelta(days=12),  # Refresh Token 有效期
}

### OpenAPI 接口文档配置
# TODO 部分接口请求或响应参数未能正确显示，待优化
SPECTACULAR_SETTINGS = {
    "SWAGGER_UI_DIST": "SIDECAR",
    "SWAGGER_UI_FAVICON_HREF": "SIDECAR",
    "TITLE": "MarsMgn",
    "DESCRIPTION": "火星信息平台接口文档",
    "VERSION": "1.0.0",
    "SERVE_INCLUDE_SCHEMA": False,
}

### Redis 配置
# REDIS_HOST = "mars-redis"  # Docker部署时填写mars-redis
REDIS_HOST = "127.0.0.1"
REDIS_PORT = 6379
REDIS_DB = 3
REDIS_PASSWORD = ""
REDIS_URL = f'redis://:{REDIS_PASSWORD or ""}@{REDIS_HOST}:{REDIS_PORT}'
# 数据默认使用 Pickle 格式，性能优于Json 格式
CACHES = {
    "default": {
        "BACKEND": "django.core.cache.backends.redis.RedisCache",
        "LOCATION": REDIS_URL,
        "OPTIONS": {
            "db": REDIS_DB,
        },
        "KEY_PREFIX": "mars_framework",  # 缓存前缀
        "TIMEOUT": 60 * 60 * 12,  # 缓存过期时间，单位为秒
    }
}

### Celery 配置
CELERY_BROKER_URL = f"{REDIS_URL}/{REDIS_DB}"  # 使用Redis作为消息代理
CELERY_RESULT_BACKEND = "django-db"  # 使用数据库存储结果
CELERY_BEAT_SCHEDULER = (
    "django_celery_beat.schedulers:DatabaseScheduler"  # 使用数据库保存定时任务
)
CELERY_TIMEZONE = "Asia/Shanghai"
CELERY_ENABLE_UTC = True
CELERY_RESULT_EXTENDED = True  # 启用后才会记录 task_name、date_started 等字段
CELERY_TASK_TRACK_STARTED = True  # 记录任务开始时间

### WebSocket功能：ASGI 和 Channels 配置
ASGI_APPLICATION = "mysite.asgi.application"
# 配置channels_redis，用于通道层使用
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels_redis.core.RedisChannelLayer",
        "CONFIG": {
            "hosts": [
                f"redis://:{REDIS_PASSWORD}@{REDIS_HOST}:{REDIS_PORT}/{REDIS_DB}"
            ],
        },
    },
}
DEFAULT_GROUP_NAME = "marsmgn_group"  # 默认组名

### CORS 跨域配置
CORS_ALLOW_CREDENTIALS = True
CORS_ALLOW_ALL_ORIGINS = True  #  允许所有源
CORS_ALLOW_HEADERS = list(default_headers) + [
    # 放行自定义请求头
    "Cache-Control",
    "Pragma",
    "tenant-id",
]

### 验证码配置
CAPTCHA_ENABLE = True  #  是否启用验证码 TODO 二次验证
CAPTCHA_CHALLENGE_FUNCT = "captcha.helpers.math_challenge"  # 验证码生成方式
CAPTCHA_TIMEOUT = 1  # 验证码有效期，单位为分钟

### 个性化配置
REGISTER_ENABLE = True  # 注册功能的开关
DEFAULT_USER_PASSWORD = "admin123"
PASSWORD_MIN_LENGTH = 8  # 密码长度
PASSWORD_MAX_LENGTH = 20
USERNAME_MIN_LENGTH = 4  # 用户名长度
USERNAME_MAX_LENGTH = 30
NICKNAME_MIN_LENGTH = 1  # 用户昵称长度
NICKNAME_MAX_LENGTH = 30
