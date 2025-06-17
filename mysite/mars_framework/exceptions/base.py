import logging
from django.http import JsonResponse
from django.core.exceptions import ValidationError as DjangoValidationError
from django.db.models import ProtectedError
from rest_framework import status
from rest_framework.views import exception_handler
from rest_framework import serializers

from .codes import GLOBAL_ERROR_CODE
from ..response.base import CommonResponse

logger = logging.getLogger(__name__)


def extract_first_error(e_detail):
    """
    从 e.detail 中提取第一个错误信息。
    """
    if isinstance(e_detail, dict):
        # 如果 e.detail 是字典，提取第一个字段的第一个错误信息
        field, errors = next(iter(e_detail.items()))
        return errors[0] if errors else None
    elif isinstance(e_detail, list):
        # 如果 e.detail 是列表，遍历列表找到第一个错误信息
        for item in e_detail:
            if isinstance(item, dict):
                for field, error_list in item.items():
                    if isinstance(error_list, list) and error_list:
                        return error_list[0]
    else:
        # 其他情况，直接返回字符串表示
        return str(e_detail)
    return None


def handle_drf_validation_error(e):
    """
    处理 DRF ValidationError 异常，提取错误信息并返回 CommonResponse 错误响应。
    """
    # 提取第一个错误信息
    first_error = extract_first_error(e.detail)
    error_message = first_error if first_error else "参数错误"

    # 返回错误响应
    return CommonResponse.error(code=400, msg=error_message)


def handle_django_validation_error(validation_error):
    """
    处理 Django ValidationError 异常，提取错误信息并返回 CommonResponse 错误响应。
    """
    # TODO
    # 返回错误响应
    return CommonResponse.error(code=400, msg=str(validation_error))


def custom_exception_handler(exc, context):
    """
    DRF全局异常处理
    1. 记录详细错误日志
    2. 统一异常响应格式
    """
    # 获取请求上下文
    request = context.get("request")
    view = context.get("view")

    # 构建日志元数据
    log_meta = {
        "user": f"{request.user.id if request.user else 'anonymous'}",
        "ip": request.META.get("REMOTE_ADDR") if request else "unknown",
        "path": request.get_full_path() if request else "unknown",
        "method": request.method if request else "unknown",
        "view": view.__class__.__name__ if view else "unknown",
        "exc_type": f"{exc.__class__.__module__}.{exc.__class__.__name__}",
    }

    # 记录原始异常
    logger.error(
        f"用户[{log_meta['user']}]访问[{log_meta['method']} {log_meta['path']}]时，"
        f"在视图[{log_meta['view']}]中发生异常。"
        f"异常类型：[{log_meta['exc_type']}]， 错误详情：[{str(exc)}]",
    )

    response = exception_handler(exc, context)
    # 未被DRF捕获的异常
    if response is None:
        logger.error(f"未被DRF捕获的异常：{str(exc)}")
        if isinstance(exc, ProtectedError):  # 删除关联数据时，ProtectedError异常
            return CommonResponse.error(
                code=101101, msg="该数据已被关联，请先删除关联数据"
            )
        return CommonResponse.error(
            code=status.HTTP_500_INTERNAL_SERVER_ERROR, msg="系统异常"
        )

    # 处理DRF捕获的具体异常，返回友好提示信息 TODO 优化错误提示信息
    if isinstance(exc, serializers.ValidationError):
        return handle_drf_validation_error(exc)
    if isinstance(exc, DjangoValidationError):
        return handle_django_validation_error(exc)

    # 其它DRF异常
    return CommonResponse.error(
        code=response.status_code,
        msg=GLOBAL_ERROR_CODE.get(response.status_code, "系统异常"),
    )


def custom_404_view(request, exception):
    """Django 404 异常处理"""
    return JsonResponse(
        {"code": 404, "data": None, "msg": "请求未找到(Django)"},
        status=status.HTTP_404_NOT_FOUND,
    )


def custom_500_view(request):
    """Django 500 异常处理"""
    return JsonResponse(
        {{"code": 500, "data": None, "msg": "系统异常(Django)"}},
        status=status.HTTP_500_INTERNAL_SERVER_ERROR,
    )
