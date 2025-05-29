from rest_framework.pagination import PageNumberPagination

from mars_framework.response.base import CommonResponse


class CustomPageNumberPagination(PageNumberPagination):
    page_size = 10
    max_page_size = 100
    page_size_query_param = "pageSize"
    page_query_param = "pageNo"

    def paginate_queryset(self, queryset, request, view=None):
        """
        自定义查询集分页方法。

        本方法首先尝试从请求的URL参数中获取页码（page_no）和页面大小（page_size）。
        如果未能获取到这两个参数中的任何一个，表明用户请求不分页，直接返回整个查询集。
        否则，调用父类的分页方法对查询集进行分页处理。

        参数:
        - queryset: 待分页的查询集。
        - request: 当前请求对象，用于获取分页参数。
        - view: 可选参数，视图对象。

        返回:
        - 如果未指定分页参数，返回None，表示不分页。
        - 否则，返回分页后的查询集。
        """
        page_no = request.query_params.get(self.page_query_param)
        page_size = request.query_params.get(self.page_size_query_param)

        if page_no is None or page_size is None:
            return None
        else:
            return super().paginate_queryset(queryset, request, view)

    def get_paginated_response(self, data):
        """
        返回分页响应数据。

        该方法用于构造一个分页响应，其中不仅包括当前页的数据列表，还包括数据的总数量。
        这对于前端分页显示非常有用，可以让前端知道还有多少数据未显示。

        参数:
        - data: 当前页的数据列表。

        返回:
        - 包含当前页数据列表和数据总数量的响应。
        """
        return CommonResponse.success(
            data={"list": data, "total": self.page.paginator.count}
        )
