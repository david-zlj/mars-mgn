"""
TODO
- 日志记录
- Django 异常整合到 DRF异常中处理
"""

import logging
from django.http import JsonResponse
from django.core.exceptions import ValidationError as DjangoValidationError
from rest_framework import status
from rest_framework.views import exception_handler
from rest_framework.response import Response
from rest_framework.exceptions import ValidationError as DRFValidationError

from .enums import GLOBAL_ERROR_CODE
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
    3. 特殊处理验证类异常
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
        "exc_type": type(exc).__name__,
    }

    # 记录原始异常 TODO 优化格式
    logger.error(
        f"用户[{log_meta['user']}]，"
        f"访问[{log_meta['method']} {log_meta['path']}]，"
        f"视图[{log_meta['view']}]，"
        f"异常类型[{log_meta['exc_type']}]，"
        f"错误详情[{str(exc)}]",
        # exc_info=True,  # 包含堆栈跟踪（可用于调试）
    )

    # DRF原生异常处理
    response = exception_handler(exc, context)
    # 处理未被DRF捕获的异常
    if response is None:
        status_code = status.HTTP_500_INTERNAL_SERVER_ERROR
        error_msg = str(exc)
        logger.error(f"未处理异常：{error_msg}")
        response = Response(data={"detail": error_msg}, status=status_code)

    # 处理验证类异常（保持原有逻辑）
    if isinstance(exc, DRFValidationError):
        return handle_drf_validation_error(exc)
    if isinstance(exc, DjangoValidationError):
        return handle_django_validation_error(exc)

    # 统一响应格式
    return Response(
        data={
            "code": response.status_code,
            "data": None,
            "msg": GLOBAL_ERROR_CODE.get(response.status_code, "系统异常"),
            # "detail": response.data,  # 保留原始错误详情便于调试（可用于调试）
        },
        status=response.status_code,
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
