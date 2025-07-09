#!/bin/bash

# ====生产环境管理Django项目的脚本=====
#  初始化环境命令：bash startup.sh init
#  启动服务命令：  bash startup.sh run
# ==================================

# ========== 用户配置区域 ==========
PROJECT_DIR="mysite"                                     # 项目根目录路径
VENV_PATH="/opt/venv/yourproject"                        # 虚拟环境路径
GUNICORN_CONFIG="${PROJECT_DIR}/deploy/gunicorn_prod.py" # Gunicorn配置文件
DJANGO_SETTINGS_MODULE="config.settings.production"      # 生产环境设置
USER="django-user"                                       # 运行项目的非特权用户
# =================================

# === 计算最佳Gunicorn Worker数量 ===
CORES=$(nproc)
WORKERS=$((CORES * 2 + 1))
MAX_WORKERS=8
if [ $WORKERS -gt $MAX_WORKERS ]; then
    WORKERS=$MAX_WORKERS
fi
# =================================

# 退出条件设置（遇到错误退出）
set -euo pipefail

# 检查关键目录存在
check_directory() {
    if [ ! -d "$1" ]; then
        echo "错误：目录不存在 $1"
        exit 1
    fi
}
check_directory "${PROJECT_DIR}"

# 初始化环境：安装项目依赖、配置环境变量和执行数据库迁移
init_environment() {
    echo "===== 开始初始化环境 ====="

    # 安装Python依赖
    echo "安装Python依赖..."
    pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

    # 进入项目目录
    cd "${PROJECT_DIR}"

    # 检查数据库连接状态
    echo "检查数据库连接状态..."
    python manage.py check --database default

    # 数据库迁移
    echo "执行数据库迁移..."
    python manage.py migrate --no-input

    # 初始化数据库数据
    echo "初始化数据库数据..."
    python manage.py loaddata myapp_system.json myapp_infra.json
    python manage.py loaddata django_celery_beat.json django_celery_results.json
    echo "Database：初始化数据库数据成功"

    echo "===== 环境初始化完成 ====="
    # 检查Redis连接状态
    echo "检查Redis连接状态..."
    python manage.py check_redis

    echo "下一步：如果上面显示初始化数据库数据成功、Redis状态正常，运行 bash startup.sh run 启动服务。否则，请检查Redis配置。"
}

# 启动服务
run_server() {
    # 进入项目目录
    cd "${PROJECT_DIR}" || exit 1

    # 创建必要的日志目录（确保目录存在）
    mkdir -p mysite/logs

    # 启动Django服务
    echo "启动Django服务..."
    nohup gunicorn -b 0.0.0.0:8000 --workers $WORKERS -k uvicorn.workers.UvicornWorker mysite.asgi:application >mysite/logs/startup.log 2>&1 &

    # 启动Celery服务
    echo "启动Celery服务..."
    nohup celery -A mysite worker -l INFO >mysite/logs/celery_worker.log 2>&1 &
    nohup celery -A mysite beat -l INFO >mysite/logs/celery_beat.log 2>&1 &
    nohup celery -A mysite flower --port=5555 >mysite/logs/celery_flower.log 2>&1 &
}

# 主命令处理器
main() {
    # 检查是否有参数传入
    if [ $# -eq 0 ]; then
        echo "用法: bash $0 [command]"
        echo "可用命令:"
        echo "  init   初始化环境"
        echo "  run    启动服务"
        exit 1
    fi

    case "$1" in
    init)
        init_environment
        ;;
    run)
        run_server
        ;;
    *)
        echo "错误: 无效的命令 '$1'"
        echo "可用命令: init, run"
        exit 1
        ;;
    esac
}

# 执行主函数
main "$@"
