FROM python:3.11.10-slim

# 设置时区环境变量，创建时区软链接
ENV TZ=Asia/Shanghai
RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN echo "deb http://mirrors.aliyun.com/debian/ bookworm main non-free non-free-firmware" >/etc/apt/sources.list && \
    echo "deb http://mirrors.aliyun.com/debian-security/ bookworm-security main" >>/etc/apt/sources.list && \
    apt update && apt install -y python3-dev default-libmysqlclient-dev build-essential pkg-config && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com -r requirements.txt

EXPOSE 8000

# 入口命令
ENTRYPOINT ["bash", "/app/entrypoint.sh"]
