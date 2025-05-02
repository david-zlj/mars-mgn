-- 创建数据库，指定字符集为 utf8mb4
CREATE DATABASE IF NOT EXISTS `mars-mgn` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE `mars-mgn`;

-- 导入指定的 SQL 文件
-- 假设文件也放在 /opt/mysql/init 目录下
SOURCE /docker-entrypoint-initdb.d/mars-mgn.sql;
