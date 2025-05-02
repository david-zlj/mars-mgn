FROM python:3.11.12-slim

# 设置时区环境变量，创建时区软链接
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "deb http://mirrors.aliyun.com/debian/ bookworm main non-free non-free-firmware" >/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian-security/ bookworm-security main" >>/etc/apt/sources.list && \
    apt update && apt install -y python3-dev default-libmysqlclient-dev build-essential pkg-config && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com -r requirements.txt

# 收集静态文件（需配置STATIC_ROOT）
# RUN python manage.py collectstatic --noinput
# 使用Gunicorn作为WSGI服务器

EXPOSE 8000

# CMD ["gunicorn", "-b", "0.0.0.0:8000", "mysite.wsgi:application"]
# CMD ["gunicorn", "-b", "0.0.0.0:8000", "-k", "uvicorn.workers.UvicornWorker", "mysite.asgi:application"]

# 复制初始化脚本并设置可执行权限
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
CMD ["./entrypoint.sh"]
