from .models import InfraConfig


class InfraConfigService:
    def get_value_by_key(self, key: str):
        """通过参数键名查询参数值和是否可见"""
        config = InfraConfig.objects.filter(config_key=key).first()
        if not config:
            return None
        return config.value, config.visible


infra_config_service = InfraConfigService()
