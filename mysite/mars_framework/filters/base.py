from datetime import datetime
from zoneinfo import ZoneInfo


def parse_custom_datetime(date_str):
    """自定义日期解析函数"""
    if date_str:
        dt = datetime.strptime(date_str, "%Y-%m-%d %H:%M:%S")
        return dt.replace(tzinfo=ZoneInfo("Asia/Shanghai"))
    else:
        return None


def apply_time_range_filter(request, queryset):
    """
    应用时间范围过滤

    前端请求参数：
        createTime[0] = 2023-07-01 00:00:00
        createTime[1] = 2023-07-01 23:59:59
    django-filter的DateTimeFromToRangeFilter接收参数：
        createTime_after= 2024-01-01T00:00:00
        createTime_before=2024-12-31T23:59:59
    两者不一致，所以需要自定义函数进行过滤
    """
    start_time_str = request.query_params.get("createTime[0]")
    end_time_str = request.query_params.get("createTime[1]")

    start_time = parse_custom_datetime(start_time_str)
    end_time = parse_custom_datetime(end_time_str)
    # print(start_time, end_time)

    # TODO 性能优化
    if start_time:
        queryset = queryset.filter(create_time__gte=start_time)
    if end_time:
        queryset = queryset.filter(create_time__lte=end_time)

    return queryset
