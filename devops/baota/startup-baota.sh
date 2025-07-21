# 启动命令
gunicorn -b 0.0.0.0:8000 --workers 3 -k uvicorn.workers.UvicornWorker mysite.asgi:application

# 项目初始化命令
python manage.py collectstatic --noinput
# 压缩（可选） python manage.py compress --force
python manage.py migrate --no-input
python manage.py loaddata myapp_system.json myapp_infra.json
python manage.py loaddata django_celery_beat.json django_celery_results.json

# 启动Celery
celery -A mysite worker -l INFO
celery -A mysite beat -l INFO -S django_celery_beat.schedulers:DatabaseScheduler
celery -A mysite flower --port=5555


