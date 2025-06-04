import ast
from ..user.models import SystemUsers
from ..dept.models import SystemDept


class AuthServices:

    def extract_jwt_info(self, refresh_token):
        """
        从 RefreshToken 中提取用户信息和令牌信息。
        :param refresh_token: RefreshToken 对象
        :return: 包含用户信息和令牌信息的字典
        """
        user_id = refresh_token.payload.get("user_id")
        access_token = str(refresh_token.access_token)
        refresh_token_str = str(refresh_token)
        expires_time = refresh_token.access_token.payload.get("exp")

        return {
            "userId": user_id,
            "accessToken": access_token,
            "refreshToken": refresh_token_str,
            "expiresTime": expires_time,
        }

    def get_user_status_by_id(self, user_id: int):
        """通过用户ID获取用户状态"""
        user = SystemUsers.objects.filter(id=user_id).first()
        if user:
            return user.status

    def get_user_names_by_id(self, user_id: int):
        """通过用户ID获取用户名和昵称"""
        user = SystemUsers.objects.filter(id=user_id).first()
        if user:
            return {
                "username": user.username,
                "nickname": user.nickname,
            }

    def extract_and_deduplicate(self, input_list) -> list:
        """
        提取列表中的数据并去重，返回一个新的列表。
        参数:
            input_list (list): 包含字符串形式的列表数据的输入列表。
        返回:
            list: 去重后的数字列表。
        """
        result_set = set()

        for item in input_list:
            # 跳过空字符串或只包含"[]"的项
            if item == "" or item == "[]":
                continue
            # 使用ast.literal_eval安全地将字符串转换为列表
            numbers = ast.literal_eval(item)
            result_set.update(numbers)

        return list(result_set)

    def get_all_child_depts(self, dept_id, include_self=True) -> list:
        """递归获取部门所有子部门ID"""
        all_depts = SystemDept.objects.all().values("id", "parent_id_id")

        # 构建父子映射
        parent_child_map = {}
        for dept in all_depts:
            parent_id = dept["parent_id_id"]
            if parent_id not in parent_child_map:
                parent_child_map[parent_id] = []
            parent_child_map[parent_id].append(dept["id"])

        #  递归获取子部门
        result = []

        def _get_child_ids(dept_id):
            if dept_id in parent_child_map:
                for child_id in parent_child_map[dept_id]:
                    result.append(child_id)
                    _get_child_ids(child_id)

        _get_child_ids(dept_id)

        return [dept_id] + result if include_self else result


auth_services = AuthServices()
