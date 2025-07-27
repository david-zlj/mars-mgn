#!/bin/bash

###############################
####### 配置区域 - 可修改 ########
###############################

# 系统配置
export DEBIAN_FRONTEND=noninteractive

# MySQL 配置
MYSQL_ROOT_PASSWORD="123456"
MYSQL_DATABASE="mars-mgn"
MYSQL_USER="mars-mgn"
MYSQL_PASSWORD="123456"
MYSQL_CHARSET="utf8mb4"

# Redis 配置
REDIS_PASSWORD="123456"

###############################
####### 函数定义区域 #############
###############################

# 安装 MySQL
install_mysql() {
    echo "🔁 正在安装 MySQL..."
    # 设置 root 密码的初始值用于安装
    local root_temp_pass="temp_root_pass_$(date +%s)"
    echo "mysql-server mysql-server/root_password password ${root_temp_pass}" | debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password ${root_temp_pass}" | debconf-set-selections
    
    apt update > /dev/null
    apt install -y mysql-server > /dev/null
    
    # 配置 MySQL
    mysql --connect-expired-password -u root -p${root_temp_pass} <<MYSQL_SCRIPT
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '${MYSQL_ROOT_PASSWORD}';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\` CHARACTER SET ${MYSQL_CHARSET} COLLATE ${MYSQL_CHARSET}_unicode_ci;
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED WITH mysql_native_password BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

    # 获取 MySQL 版本信息
    MYSQL_VERSION=$(mysql --version | awk '{print $3}')

    echo "✅ MySQL 安装完成"
    echo "   - 版本: ${MYSQL_VERSION}"
    echo "   - Root 密码: ${MYSQL_ROOT_PASSWORD}"
    echo "   - 数据库: ${MYSQL_DATABASE} (${MYSQL_CHARSET})"
    echo "   - 用户: ${MYSQL_USER} / ${MYSQL_PASSWORD}"
}

# 安装 Redis
install_redis() {
    echo "🔁 正在安装 Redis..."
    apt install -y redis-server > /dev/null
    
    # 配置 Redis 密码
    sed -i "s/# requirepass .*/requirepass ${REDIS_PASSWORD}/" /etc/redis/redis.conf
    
    # 优化持久化设置
    sed -i "s/^# save 60 10000/save 60 10000/" /etc/redis/redis.conf

    # 获取 Redis 版本信息
    REDIS_VERSION=$(redis-server --version | awk '{print $3}' | cut -d'=' -f2)
    
    systemctl restart redis-server > /dev/null
    echo "✅ Redis 安装完成"
    echo "   - 版本: ${REDIS_VERSION}"
    echo "   - 访问密码: ${REDIS_PASSWORD}"
}

# 安装 Python
install_python() {
    echo "🔁 正在安装 Python 3..."
    apt install -y python3 python3-pip python3-venv > /dev/null
    python3 -m pip install -U pip > /dev/null
    echo "✅ Python 3 安装完成"
    echo "   - 版本: $(python3 --version)"
    echo "   - Pip 版本: $(pip3 --version | awk '{print $2}')"
}

# 安装 Nginx
install_nginx() {
    echo "🔁 正在安装 Nginx..."
    apt install -y nginx > /dev/null
    echo "✅ Nginx 安装完成"
    echo "   - 版本: $(nginx -v 2>&1 | awk -F'/' '{print $2}')"
}

# 安装后清理
cleanup() {
    echo "🧹 正在清理临时文件..."
    unset DEBIAN_FRONTEND
    rm -f /root/.mysql_history
    history -c
    echo "✅ 清理完成"
}

# 显示服务状态
show_status() {
    echo -e "\n🟢 服务安装完成！"
    echo "============================================="
    echo "MySQL 状态: $(systemctl is-active mysql)"
    echo "Redis 状态: $(systemctl is-active redis-server)"
    echo "Nginx 状态:  $(systemctl is-active nginx)"
    echo "============================================="
}

###############################
####### 主执行区域 #############
###############################

# 安装各种组件
install_mysql
install_redis
install_python
install_nginx

# 清理安装痕迹
cleanup

# 显示状态信息
show_status

# 安全提醒
echo -e "\n⚠️ 安全提示:"
echo "1. 生产环境中请修改默认密码！"
echo "2. 建议配置防火墙限制MySQL和Redis的访问"