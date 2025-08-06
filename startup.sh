#!/bin/bash
# ==============================================================================
# Linux 生产环境启动脚本
# 
# 使用方法
# 1. 初始化环境：bash startup.sh init
# 2. 启动服务：  bash startup.sh run
# ==============================================================================

# ==============================================================================
# 配置项
PROJECT_DIR="mysite" # 项目根目录路径
# ==============================================================================

#  计算最佳Gunicorn Worker数量
CORES=$(nproc)
WORKERS=$((CORES * 2 + 1))
MAX_WORKERS=8
if [ $WORKERS -gt $MAX_WORKERS ]; then
    WORKERS=$MAX_WORKERS
fi

# 退出条件设置（遇到错误退出）
set -euo pipefail

# 初始化环境
init_env() {
    echo "===== 开始初始化环境 ====="

    echo "安装Python依赖..."
    pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple --trusted-host=mirrors.aliyun.com

    # 进入项目目录
    cd "$PROJECT_DIR" || { echo "无法进入项目目录"; exit 1; }

    echo "收集静态文件..."
    python manage.py collectstatic --noinput

    echo "检查数据库连接状态..."
    python manage.py check --database default

    echo "执行数据库迁移..."
    python manage.py migrate --no-input

    echo "初始化数据库数据..."
    python manage.py loaddata myapp_system.json myapp_infra.json
    python manage.py loaddata django_celery_beat.json django_celery_results.json

    echo "检查Redis连接状态..."
    python manage.py check_redis

    echo "===== 初始化环境结束 ====="
}

# 启动服务
run_server() {
    # 进入项目目录
    cd "$PROJECT_DIR" || { echo "无法进入项目目录"; exit 1; }

    # 创建必要的日志目录
    echo "创建日志目录..."
    mkdir -p logs

    echo "启动Celery服务..."
    nohup celery -A mysite worker -l INFO >logs/celery_worker.log 2>&1 &
    nohup celery -A mysite beat -l INFO -S django_celery_beat.schedulers:DatabaseScheduler >logs/celery_beat.log 2>&1 &
    nohup celery -A mysite flower --port=5555 >logs/celery_flower.log 2>&1 &

    echo "启动Django服务..."
    nohup gunicorn -b 0.0.0.0:8000 --workers $WORKERS -k uvicorn.workers.UvicornWorker mysite.asgi:application >logs/startup.log 2>&1 &
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
        init_env
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
