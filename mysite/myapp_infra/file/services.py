from pathlib import Path
from datetime import datetime
from django.core.files.storage import FileSystemStorage, default_storage
from django.db import transaction

from mars_framework.db.enums import FileStorageEnum
from .models import InfraFile


class FileClient:
    """ "文件客户端抽象类"""

    def upload_file(self, uploaded_file, config: dict, file_config_id: int) -> str:
        """上传文件"""
        raise NotImplementedError

    def delete_file(self, file_path: str) -> bool:
        """删除文件"""
        raise NotImplementedError

    def get_file(self, file_path: str) -> str:
        """获得文件"""
        raise NotImplementedError


class LocalFileClient(FileClient):
    """本地磁盘客户端"""

    def upload_file(self, uploaded_file, config, file_config_id):
        """上传文件"""
        # 生成日期目录和唯一文件名，文件名中的空格替换为下划线
        timestamp = timestamp = datetime.now().strftime("%Y%m%d%H%M%S%f")
        file_path = Path(uploaded_file.name)
        safe_filename = f"{file_path.stem}_{timestamp}{file_path.suffix}".replace(
            " ", "_"
        )
        # 构建存储路径（示例：202505/filename_20250523142530123456.jpg）
        date_dir = datetime.now().strftime("%Y%m")
        relative_path = (Path(date_dir) / safe_filename).as_posix()

        # 使用Django存储后端保存文件（自动处理目录创建和文件冲突）
        # TODO 使用云存储时，慎用default_storage
        saved_name = default_storage.save(relative_path, uploaded_file)
        # 返回访问URL（Storage自动处理MEDIA_URL拼接）
        url = default_storage.url(saved_name)

        # 创建数据库记录
        with transaction.atomic():
            infra_file = InfraFile(
                config_id=file_config_id,
                name=safe_filename,
                path=relative_path,
                url=url,
                type=uploaded_file.content_type,
                size=uploaded_file.size,
            )
            infra_file.save()
        return url

    def delete_file(self, file_path: str) -> bool:
        """删除文件"""
        if default_storage.exists(file_path):
            default_storage.delete(file_path)
        return True


class InfraFileService:

    def get_file_client(self, storage: int) -> FileClient:
        """获取文件客户端"""
        file_client_map = {
            FileStorageEnum.LOCAL.value: LocalFileClient(),
        }
        return file_client_map.get(storage)


infra_file_service = InfraFileService()
