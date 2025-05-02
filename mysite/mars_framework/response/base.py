from rest_framework.response import Response
from rest_framework import status


class CommonResponse:
    """
    通用响应工具类
    """

    @staticmethod
    def success(data=None, msg=""):
        """
        成功响应
        :param data: 响应数据
        :param msg: 响应消息
        :return: Response 对象
        """
        return Response(
            {
                "code": 0,  # 成功状态码统一为 0
                "data": data,
                "msg": msg,
            },
            status=status.HTTP_200_OK,
        )

    @staticmethod
    def error(code=500, msg="Error", data=None, status_code=status.HTTP_200_OK):
        """
        错误响应
        用于发生业务错误，业务错误码范围定义参考mars_framework.exceptions.enums.py
        :param code: 错误码
        :param msg: 错误消息
        :param status_code: HTTP 状态码
        :return: Response 对象
        """
        return Response(
            {
                "code": code,
                "data": data,
                "msg": msg,
            },
            status=status_code,
        )
