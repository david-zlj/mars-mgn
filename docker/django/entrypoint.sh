#!/bin/bash
# 进入项目目录
cd /app/mysite

# 执行数据库迁移
# python manage.py migrate

# 启动 Django 开发服务器
# python manage.py runserver 0.0.0.0:8000

# 启动 Gunicorn 服务器
gunicorn -b 0.0.0.0:8000 -k uvicorn.workers.UvicornWorker mysite.asgi:application
