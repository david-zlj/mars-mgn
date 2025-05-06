from rest_framework.response import Response
from rest_framework import status


class CommonResponse:
    """
    通用响应工具类
    """

    @staticmethod
    def success(code=0, data=True, msg="", status_code=status.HTTP_200_OK):
        """
        成功响应
        """
        return Response(
            {
                "code": code,  # 0 表示成功
                "data": data,
                "msg": msg,
            },
            status=status_code,
        )

    @staticmethod
    def error(code=500, data=None, msg="Error", status_code=status.HTTP_200_OK):
        """
        错误响应，用于发生业务错误
        业务错误码参考 mars_framework.exceptions.enums.py
        """
        return Response(
            {
                "code": code,
                "data": data,
                "msg": msg,
            },
            status=status_code,
        )
