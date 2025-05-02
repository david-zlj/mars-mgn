# from rest_framework.renderers import JSONRenderer

# from ..exceptions.enums import GLOBAL_ERROR_CODE


# class CustomJSONRenderer(JSONRenderer):

#     def render(self, data, accepted_media_type=None, renderer_context=None):
#         """
#         自定义渲染器以包装响应数据。

#         正常数据（状态码<400）:返回格式{"code": 状态码, "data": 业务数据, "msg": "" }
#         错误数据（状态码>=400）:返回格式{"code": 状态码, "data": None, "msg": 自定义错误信息}

#         :param data: 响应数据，可以是任意数据类型。
#         :param accepted_media_type: 客户端接受的媒体类型，未使用。
#         :param renderer_context: 渲染上下文，包含响应相关信息。
#         :return: 包装后的响应数据。
#         """
#         # 获取原始响应对象
#         response = renderer_context.get("response")

#         print(f"render-response: {type(response)}")
#         print(f"render-status_code: {response.status_code}")
#         print(f"render-data: {data}")

#         code = get_code(response)
#         msg = get_msg(code)
#         data = get_data(code, data)

#         # 调用父类的render方法来渲染包装后的数据
#         wrapped_data = {"code": code, "data": data, "msg": msg}
#         return super().render(wrapped_data, accepted_media_type, renderer_context)


# def get_code(response):
#     """获取响应的状态码"""
#     # return response.status_code if response else 100  # TODO 查看前端定义
#     code = response.status_code if response else 100
#     if code == 200:
#         code = 0  # 用0代替200表示成功
#     return code


# def get_msg(code: int):
#     """根据状态码，找到对应提示信息"""
#     if code < 400:  # 正常数据（状态码<400），msg设置为空
#         return ""
#     else:
#         return GLOBAL_ERROR_CODE.get(code, "系统异常")


# def get_data(code: int, data):
#     """根据状态码，设置 data 的值"""
#     if code >= 400:  # 错误数据（状态码>=400）,data 设置为None
#         data = None
#     else:
#         data = data if data else None
#     return data
