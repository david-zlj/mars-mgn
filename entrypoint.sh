#!/bin/bash
# ==============================================================================
# 容器启动入口脚本
# 
# 主要功能函数:
# 1. 初始化运行环境（收集静态文件、检查数据库和Redis连接）
# 2. 准备数据库（执行迁移、加载初始数据）
# 3. 启动相关服务（Celery Worker/Beat/Flower和Django应用）
# 
# 注意事项：
# 1. 对生产环境的更新、重启、重新部署等操作，一定要先备份生产数据库，再操作！！！
# 2. 环境初始化和数据库初始化操作，默认只执行一次，防止覆盖生产环境数据
# ==============================================================================

# 退出条件设置（遇到错误退出）
set -euo pipefail

# 项目目录常量定义
PROJECT_DIR="/app/mysite"
ENV_INIT_MARKER="/app/flags/.env_initialized"    # 环境初始化标记文件
DB_INIT_MARKER="/app/flags/.db_initialized"      # 数据库初始化标记文件

### 初始化环境 ###
init_env() {
    echo "进入项目目录: $PROJECT_DIR"
    cd "$PROJECT_DIR" || { echo "无法进入项目目录"; exit 1; }
    
    echo "收集静态文件..."
    python manage.py collectstatic --noinput
    
    echo "检查数据库连接状态..."
    python manage.py check --database default
    
    echo "检查Redis连接状态..."
    python manage.py check_redis

    echo "初始化环境完成，创建标记文件"
    touch "$ENV_INIT_MARKER"
}

### 初始化数据库数据 ###
init_db() {
    echo "进入项目目录: $PROJECT_DIR"
    cd "$PROJECT_DIR" || { echo "无法进入项目目录"; exit 1; }
    
    echo "执行数据库迁移..."
    python manage.py migrate --no-input
    
    echo "初始化数据库数据..."
    python manage.py loaddata myapp_system.json myapp_infra.json
    python manage.py loaddata django_celery_beat.json django_celery_results.json

    echo "初始化数据库数据完成，创建标记文件"
    touch "$DB_INIT_MARKER"
}

### 启动服务 ###
start_up() {
    echo "进入项目目录: $PROJECT_DIR"
    cd "$PROJECT_DIR" || { echo "无法进入项目目录"; exit 1; }
    
    # 创建必要的日志目录
    echo "创建日志目录..."
    mkdir -p logs
    
    echo "启动Celery服务..."
    nohup celery -A mysite worker -l INFO >logs/celery_worker.log 2>&1 &
    nohup celery -A mysite beat -l INFO -S django_celery_beat.schedulers:DatabaseScheduler >logs/celery_beat.log 2>&1 &
    nohup celery -A mysite flower --port=5555 >logs/celery_flower.log 2>&1 &
    
    echo "启动Django服务..."
    gunicorn -b 0.0.0.0:8000 --workers 3 -k uvicorn.workers.UvicornWorker mysite.asgi:application >logs/startup.log 2>&1
}

### 主执行流程 ###
# 初始化环境
if [ ! -f "$ENV_INIT_MARKER" ]; then
    echo "环境未初始化，开始初始化..."
    init_env
fi

# 初始化数据库数据
if [ ! -f "$DB_INIT_MARKER" ]; then
    echo "数据库未初始化，开始初始化..."
    init_db
fi

# 启动服务
start_up
