from ..user.models import SystemUsers


class AuthServices:

    # def is_admin(self, user):
    #     if user.id == 1:  # TODO 目前约定id为1的用户为管理员，是否需要支持多管理员
    #         return True
    #     else:
    #         return False

    # def get_menu_permission(self, user):
    #     menu_permission = set()
    #     # 判断用户是否为管理员，管理员拥有所有权限
    #     if self.is_admin(user):
    #         menu_permission.add("*:*:*")
    #     else:
    #         # 获取用户所有角色
    #         pass

    # def get_role_permission(self, user):
    #     role_permission = set()
    #     if self.is_admin(user):
    #         role_permission.add("*:*:*")
    #     else:
    #         # 获取用户所有角色
    #         pass

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


auth_services = AuthServices()
