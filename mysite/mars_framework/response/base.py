from rest_framework.response import Response
from rest_framework import status


class CommonResponse:
    """通用响应工具类"""

    @staticmethod
    def success(code=0, data=True, msg="", status_code=status.HTTP_200_OK):
        """业务成功响应"""
        return Response(
            {
                "code": code,  # 业务状态码为 0 表示成功
                "data": data,
                "msg": msg,
            },
            status=status_code,  # HTTP 状态码默认为200
        )

    @staticmethod
    def error(code=500, data=None, msg="Error", status_code=status.HTTP_200_OK):
        """业务错误响应，配合业务状态码使用"""
        return Response(
            {
                "code": code,
                "data": data,
                "msg": msg,
            },
            status=status_code,
        )
