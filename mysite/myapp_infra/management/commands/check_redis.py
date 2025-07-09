from django.core.management.base import BaseCommand
from django.core.cache import cache
from django.conf import settings
import redis
from urllib.parse import urlparse


class Command(BaseCommand):
    help = "检查Redis连接状态。使用方法：python manage.py check_redis"

    def handle(self, *args, **options):
        try:
            # 测试基本缓存操作
            try:
                cache.set("连接测试", "成功", timeout=2)
                if cache.get("连接测试") == "成功":
                    self.stdout.write(
                        self.style.SUCCESS("✅ Redis：缓存设置和读取成功")
                    )
            except Exception:
                self.stdout.write(self.style.WARNING("⚠️ Redis：无法通过缓存层测试"))

            # 直接连接测试
            try:
                # 获取配置
                cache_config = settings.CACHES.get("default", {})
                if not cache_config:
                    self.stdout.write(self.style.ERROR("❌ Redis：缺少缓存配置"))
                    return

                location = cache_config.get("LOCATION", "")
                if not location:
                    self.stdout.write(self.style.ERROR("❌ Redis：配置中缺少LOCATION"))
                    return

                # 处理可能的多个位置
                if isinstance(location, (list, tuple)):
                    location = location[0]

                # 解析连接参数
                parsed = urlparse(location)
                conn_params = {
                    "host": parsed.hostname or "localhost",
                    "port": parsed.port or 6379,
                    "socket_timeout": 3,
                }

                # 数据库编号
                if parsed.path:
                    try:
                        conn_params["db"] = int(parsed.path.strip("/"))
                    except ValueError:
                        pass

                # 密码处理
                if parsed.password:
                    conn_params["password"] = parsed.password

                # 尝试连接
                r = redis.Redis(**conn_params)
                if r.ping():
                    self.stdout.write(self.style.SUCCESS("✅ Redis：缓存直连成功"))
                else:
                    self.stdout.write(self.style.WARNING("⚠️ Redis：收到异常PING响应"))

            except redis.ConnectionError as e:
                self.stdout.write(
                    self.style.ERROR(f"❌ Redis：Redis连接失败: {str(e)}")
                )
            except Exception as e:
                self.stdout.write(self.style.ERROR(f"❌ Redis：发生异常: {str(e)}"))

        except Exception as e:
            self.stdout.write(self.style.ERROR(f"❌ Redis：命令执行失败: {str(e)}"))
