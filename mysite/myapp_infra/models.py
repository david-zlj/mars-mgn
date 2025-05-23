"""
根据Django的要求，导入本APP定义的所有模型
参考资料：https://docs.djangoproject.com/zh-hans/4.2/topics/db/models/#organizing-models-in-a-package
"""

from .job.models import InfraJob
from .job_log.models import InfraJobLog
from .file_config.models import InfraFileConfig
from .file.models import InfraFile
