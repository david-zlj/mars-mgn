# Generated by Django 4.2.20 on 2025-06-06 03:17

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import myapp_system.user.services


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='SystemUsers',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='用户ID', help_text='用户ID', primary_key=True, serialize=False)),
                ('username', models.CharField(db_comment='用户账号', help_text='用户账号', max_length=30, unique=True)),
                ('password', models.CharField(db_comment='密码', default='', help_text='密码', max_length=128)),
                ('nickname', models.CharField(db_comment='用户昵称', help_text='用户昵称', max_length=30)),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=500, null=True)),
                ('post_ids', models.CharField(blank=True, db_comment='岗位编号数组', help_text='岗位编号数组', max_length=255, null=True)),
                ('email', models.CharField(blank=True, db_comment='用户邮箱', default='', help_text='用户邮箱', max_length=50, null=True)),
                ('mobile', models.CharField(blank=True, db_comment='手机号码', default='', help_text='手机号码', max_length=15, null=True)),
                ('sex', models.SmallIntegerField(blank=True, choices=[(1, 'MALE'), (2, 'FEMALE'), (0, 'UNKNOWN')], db_comment='用户性别', default=0, help_text='用户性别', null=True)),
                ('avatar', models.FileField(blank=True, db_comment='头像地址', help_text='头像地址', max_length=512, null=True, upload_to=myapp_system.user.services.avatar_upload_rename)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='帐号状态（0正常 1停用）', default=0, help_text='帐号状态（0正常 1停用）')),
                ('login_ip', models.CharField(blank=True, db_comment='最后登录IP', default='', help_text='最后登录IP', max_length=50, null=True)),
                ('login_date', models.DateTimeField(blank=True, db_comment='最后登录时间', help_text='最后登录时间', null=True)),
                ('last_login', models.DateTimeField(blank=True, null=True)),
                ('is_active', models.BooleanField(default=True)),
            ],
            options={
                'db_table': 'system_users',
                'db_table_comment': '用户信息表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemDictData',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='字典编码', help_text='字典编码', primary_key=True, serialize=False)),
                ('sort', models.IntegerField(db_comment='字典排序', help_text='字典排序')),
                ('label', models.CharField(db_comment='字典标签', help_text='字典标签', max_length=100)),
                ('value', models.CharField(db_comment='字典键值', help_text='字典键值', max_length=100)),
                ('dict_type', models.CharField(db_comment='字典类型', help_text='字典类型', max_length=100)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='状态（0正常 1停用）', help_text='状态（0正常 1停用）')),
                ('color_type', models.CharField(blank=True, db_comment='颜色类型', help_text='颜色类型', max_length=100, null=True)),
                ('css_class', models.CharField(blank=True, db_comment='css 样式', help_text='css 样式', max_length=100, null=True)),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=500, null=True)),
            ],
            options={
                'db_table': 'system_dict_data',
                'db_table_comment': '字典数据表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemDictType',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='字典主键', help_text='字典主键', primary_key=True, serialize=False)),
                ('name', models.CharField(db_comment='字典名称', help_text='字典名称', max_length=100)),
                ('type', models.CharField(db_comment='字典类型', help_text='字典类型', max_length=100)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='状态（0正常 1停用）', help_text='状态（0正常 1停用）')),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=500, null=True)),
            ],
            options={
                'db_table': 'system_dict_type',
                'db_table_comment': '字典类型表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemLoginLog',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='访问ID', help_text='访问ID', primary_key=True, serialize=False)),
                ('log_type', models.SmallIntegerField(choices=[(100, 'LOGIN_USERNAME'), (101, 'LOGIN_SOCIAL'), (103, 'LOGIN_MOBILE'), (104, 'LOGIN_SMS'), (200, 'LOGOUT_SELF'), (202, 'LOGOUT_DELETE'), (300, 'REGISTER_USERNAME'), (400, 'REFRESH_TOKEN')], db_comment='日志类型', help_text='日志类型')),
                ('user_id', models.BigIntegerField(blank=True, db_comment='用户编号', help_text='用户编号', null=True)),
                ('user_type', models.SmallIntegerField(blank=True, choices=[(1, 'MEMBER'), (2, 'ADMIN')], db_comment='用户类型', default=2, help_text='用户类型', null=True)),
                ('username', models.CharField(db_comment='用户账号', help_text='用户账号', max_length=30)),
                ('result', models.IntegerField(choices=[(0, 'SUCCESS'), (1, 'FAILURE'), (10, 'BAD_CREDENTIALS'), (20, 'USER_DISABLED'), (30, 'CAPTCHA_NOT_FOUND'), (31, 'CAPTCHA_CODE_ERROR')], db_comment='登陆结果', help_text='登陆结果')),
                ('user_ip', models.CharField(db_comment='用户 IP', help_text='用户 IP', max_length=50)),
                ('user_agent', models.CharField(db_comment='浏览器 UA', help_text='浏览器 UA', max_length=512)),
            ],
            options={
                'db_table': 'system_login_log',
                'db_table_comment': '系统访问记录',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemMailAccount',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='主键', help_text='主键', primary_key=True, serialize=False)),
                ('mail', models.CharField(db_comment='邮箱', help_text='邮箱', max_length=255)),
                ('username', models.CharField(db_comment='用户名', help_text='用户名', max_length=255)),
                ('password', models.CharField(db_comment='密码', help_text='密码', max_length=255)),
                ('host', models.CharField(db_comment='SMTP 服务器域名', help_text='SMTP 服务器域名', max_length=255)),
                ('port', models.IntegerField(db_comment='SMTP 服务器端口', help_text='SMTP 服务器端口')),
                ('ssl_enable', models.BooleanField(db_comment='是否开启 SSL', help_text='是否开启 SSL')),
                ('starttls_enable', models.BooleanField(db_comment='是否开启 STARTTLS', help_text='是否开启 STARTTLS')),
            ],
            options={
                'db_table': 'system_mail_account',
                'db_table_comment': '邮箱账号表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemMenu',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='菜单ID', help_text='菜单ID', primary_key=True, serialize=False)),
                ('name', models.CharField(db_comment='菜单名称', help_text='菜单名称', max_length=50)),
                ('permission', models.CharField(blank=True, db_comment='权限标识', help_text='权限标识', max_length=100, null=True)),
                ('type', models.SmallIntegerField(choices=[(1, 'DIR'), (2, 'MENU'), (3, 'BUTTON')], db_comment='菜单类型', help_text='菜单类型')),
                ('sort', models.IntegerField(db_comment='显示顺序', default=0, help_text='显示顺序')),
                ('path', models.CharField(blank=True, db_comment='路由地址', help_text='路由地址', max_length=200, null=True)),
                ('icon', models.CharField(blank=True, db_comment='菜单图标', default='#', help_text='菜单图标', max_length=100, null=True)),
                ('component', models.CharField(blank=True, db_comment='组件路径', help_text='组件路径', max_length=255, null=True)),
                ('component_name', models.CharField(blank=True, db_comment='组件名', help_text='组件名', max_length=255, null=True)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='菜单状态', default=0, help_text='菜单状态')),
                ('visible', models.BooleanField(blank=True, db_comment='菜单是否可见', help_text='菜单是否可见', null=True)),
                ('keep_alive', models.BooleanField(blank=True, db_comment='是否缓存', help_text='是否缓存', null=True)),
                ('always_show', models.BooleanField(blank=True, db_comment='是否始终显示', help_text='是否始终显示', null=True)),
                ('parent_id', models.ForeignKey(blank=True, db_column='parent_id', db_comment='父菜单ID', db_constraint=False, help_text='父菜单ID', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='children', to='myapp_system.systemmenu')),
            ],
            options={
                'db_table': 'system_menu',
                'db_table_comment': '菜单权限表',
                'ordering': ['sort'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemNotifyTemplate',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='主键', help_text='主键', primary_key=True, serialize=False)),
                ('name', models.CharField(db_comment='模板名称', help_text='模板名称', max_length=63)),
                ('code', models.CharField(db_comment='模板编码', error_messages={'unique': '模板编码不能重复'}, help_text='模板编码', max_length=64, unique=True)),
                ('nickname', models.CharField(db_comment='发送人名称', help_text='发送人名称', max_length=255)),
                ('content', models.CharField(db_comment='模板内容', help_text='模板内容', max_length=1024)),
                ('type', models.SmallIntegerField(db_comment='类型', help_text='类型')),
                ('params', models.CharField(blank=True, db_comment='参数数组', help_text='参数数组', max_length=255, null=True)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='状态（0正常 1停用）', help_text='状态（0正常 1停用）')),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=255, null=True)),
            ],
            options={
                'db_table': 'system_notify_template',
                'db_table_comment': '站内信模板表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemOperateLog',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='日志主键', help_text='日志主键', primary_key=True, serialize=False)),
                ('trace_id', models.CharField(blank=True, db_comment='链路追踪编号', help_text='链路追踪编号，多用于分布式系统和微服务架构', max_length=64, null=True)),
                ('user_id', models.BigIntegerField(blank=True, db_comment='用户编号', help_text='用户编号', null=True)),
                ('username', models.CharField(blank=True, db_comment='用户账号', help_text='用户账号，冗余', max_length=30, null=True)),
                ('nickname', models.CharField(blank=True, db_comment='用户昵称', help_text='用户昵称，冗余', max_length=30, null=True)),
                ('user_type', models.SmallIntegerField(choices=[(1, 'MEMBER'), (2, 'ADMIN')], db_comment='用户类型', default=2, help_text='用户类型')),
                ('request_method', models.CharField(blank=True, db_comment='请求方法', help_text='请求方法', max_length=16, null=True)),
                ('request_url', models.CharField(blank=True, db_comment='请求地址', help_text='请求地址', max_length=255, null=True)),
                ('user_ip', models.CharField(blank=True, db_comment='用户 IP', help_text='用户 IP', max_length=50, null=True)),
                ('user_agent', models.CharField(blank=True, db_comment='浏览器 UA', help_text='浏览器 UA', max_length=512, null=True)),
                ('type', models.CharField(blank=True, db_comment='操作模块类型', help_text='操作模块类型', max_length=50, null=True)),
                ('sub_type', models.CharField(blank=True, db_comment='操作名', help_text='操作名', max_length=50, null=True)),
                ('biz_id', models.BigIntegerField(blank=True, db_comment='操作数据模块编号', help_text='操作数据模块编号', null=True)),
                ('action', models.CharField(blank=True, db_comment='操作内容', help_text='操作内容', max_length=512, null=True)),
                ('success', models.BooleanField(blank=True, db_comment='操作结果', help_text='操作结果，code=0表示成功', null=True)),
                ('status_code', models.IntegerField(blank=True, db_comment='HTTP状态码', help_text='HTTP状态码', null=True)),
                ('response', models.CharField(blank=True, db_comment='响应内容', help_text='响应内容', max_length=512, null=True)),
                ('execution_time', models.IntegerField(blank=True, db_comment='执行时长', help_text='执行时长，单位毫秒', null=True)),
            ],
            options={
                'db_table': 'system_operate_log',
                'db_table_comment': '操作日志记录',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemPost',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='岗位ID', help_text='岗位ID', primary_key=True, serialize=False)),
                ('code', models.CharField(db_comment='岗位编码', error_messages={'unique': '岗位编码已存在'}, help_text='岗位编码', max_length=64, unique=True)),
                ('name', models.CharField(db_comment='岗位名称', error_messages={'unique': '岗位名称已存在'}, help_text='岗位名称', max_length=50, unique=True)),
                ('sort', models.IntegerField(db_comment='显示顺序', help_text='显示顺序')),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='部门状态（0正常 1停用）', help_text=' 部门状态（0正常 1停用）')),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=500, null=True)),
            ],
            options={
                'db_table': 'system_post',
                'db_table_comment': '岗位信息表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemRole',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='角色ID', help_text='角色ID', primary_key=True, serialize=False)),
                ('name', models.CharField(db_comment='角色名称', help_text='角色名称', max_length=30)),
                ('code', models.CharField(db_comment='角色权限字符串', help_text='角色权限字符串', max_length=100)),
                ('sort', models.IntegerField(db_comment='显示顺序', help_text='显示顺序')),
                ('data_scope', models.SmallIntegerField(choices=[(1, 'ALL'), (2, 'DEPT_CUSTOM'), (3, 'DEPT_ONLY'), (4, 'DEPT_AND_CHILD'), (5, 'SELF')], db_comment='数据范围', default=5, help_text='数据范围')),
                ('data_scope_dept_ids', models.CharField(blank=True, db_comment='数据范围(指定部门数组)', help_text='数据范围(指定部门数组)', max_length=500, null=True)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='部门状态', help_text=' 部门状态')),
                ('type', models.SmallIntegerField(choices=[(1, 'SYSTEM'), (2, 'CUSTOM')], db_comment='角色类型', default=2, help_text='角色类型')),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=500, null=True)),
            ],
            options={
                'db_table': 'system_role',
                'db_table_comment': '角色信息表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemUserRole',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='id', primary_key=True, serialize=False)),
                ('role_id', models.ForeignKey(db_column='role_id', db_comment='角色ID', db_constraint=False, on_delete=django.db.models.deletion.CASCADE, to='myapp_system.systemrole')),
                ('user_id', models.ForeignKey(db_column='user_id', db_comment='用户ID', db_constraint=False, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'system_user_role',
                'db_table_comment': '用户和角色关联表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemUserPost',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='id', primary_key=True, serialize=False)),
                ('post_id', models.ForeignKey(db_column='post_id', db_comment='岗位ID', db_constraint=False, help_text='岗位ID', on_delete=django.db.models.deletion.CASCADE, to='myapp_system.systempost')),
                ('user_id', models.ForeignKey(db_column='user_id', db_comment='用户ID', db_constraint=False, help_text='用户ID', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'system_user_post',
                'db_table_comment': '用户岗位表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemRoleMenu',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='自增编号', primary_key=True, serialize=False)),
                ('menu_id', models.ForeignKey(db_column='menu_id', db_comment='菜单ID', db_constraint=False, on_delete=django.db.models.deletion.CASCADE, to='myapp_system.systemmenu')),
                ('role_id', models.ForeignKey(db_column='role_id', db_comment='角色ID', db_constraint=False, on_delete=django.db.models.deletion.CASCADE, to='myapp_system.systemrole')),
            ],
            options={
                'db_table': 'system_role_menu',
                'db_table_comment': '角色和菜单关联表',
                'managed': True,
            },
        ),
        migrations.AddField(
            model_name='systemrole',
            name='menus',
            field=models.ManyToManyField(related_name='roles', through='myapp_system.SystemRoleMenu', to='myapp_system.systemmenu'),
        ),
        migrations.CreateModel(
            name='SystemNotifyMessage',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='消息ID', help_text='消息ID', primary_key=True, serialize=False)),
                ('user_type', models.SmallIntegerField(choices=[(1, 'MEMBER'), (2, 'ADMIN')], db_comment='用户类型', help_text='用户类型')),
                ('template_code', models.CharField(db_comment='模板编码', help_text='模板编码', max_length=64)),
                ('template_nickname', models.CharField(db_comment='模板发送人名称', help_text='模板发送人名称，冗余', max_length=63)),
                ('template_content', models.CharField(db_comment='模板内容', help_text='格式化后的内容', max_length=1024)),
                ('template_type', models.IntegerField(db_comment='模板类型', help_text='模板类型，冗余')),
                ('template_params', models.CharField(db_comment='模板参数', help_text='输入后的参数', max_length=255)),
                ('read_status', models.BooleanField(db_comment='是否已读', default=False, help_text='是否已读')),
                ('read_time', models.DateTimeField(blank=True, db_comment='阅读时间', help_text='阅读时间', null=True)),
                ('template_id', models.ForeignKey(blank=True, db_column='template_id', db_comment='模板编号', db_constraint=False, help_text='模板编号', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='notify_messages', to='myapp_system.systemnotifytemplate')),
                ('user_id', models.ForeignKey(db_column='user_id', db_comment='用户ID', db_constraint=False, help_text='用户ID', on_delete=django.db.models.deletion.DO_NOTHING, related_name='notify_messages', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'system_notify_message',
                'db_table_comment': '站内信消息表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemMailTemplate',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='编号', help_text='编号', primary_key=True, serialize=False)),
                ('name', models.CharField(db_comment='模板名称', help_text='模板名称', max_length=63)),
                ('code', models.CharField(db_comment='模板编码', error_messages={'unique': '模板编码已存在'}, help_text='模板编码', max_length=63, unique=True)),
                ('nickname', models.CharField(blank=True, db_comment='发送人名称', help_text='发送人名称', max_length=255, null=True)),
                ('title', models.CharField(blank=True, db_comment='模板标题', help_text='模板标题', max_length=255, null=True)),
                ('content', models.CharField(db_comment='模板内容', help_text='模板内容', max_length=10240)),
                ('params', models.CharField(db_comment='参数数组', help_text='参数数组', max_length=255)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='开启状态', help_text='开启状态')),
                ('remark', models.CharField(blank=True, db_comment='备注', help_text='备注', max_length=255, null=True)),
                ('account_id', models.ForeignKey(db_column='account_id', db_comment='发送的邮箱账号编号', db_constraint=False, error_messages={'protected': '无法删除，该邮箱账号还有邮件模板'}, help_text='发送的邮箱账号编号', on_delete=django.db.models.deletion.PROTECT, related_name='mail_templates', to='myapp_system.systemmailaccount')),
            ],
            options={
                'db_table': 'system_mail_template',
                'db_table_comment': '邮件模版表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemMailLog',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='编号', help_text='编号', primary_key=True, serialize=False)),
                ('user_id', models.BigIntegerField(blank=True, db_comment='用户编号', help_text='用户编号', null=True)),
                ('user_type', models.SmallIntegerField(blank=True, choices=[(1, 'MEMBER'), (2, 'ADMIN')], db_comment='用户类型', default=2, help_text='用户类型', null=True)),
                ('to_mail', models.CharField(db_comment='接收邮箱地址', help_text='接收邮箱地址', max_length=255)),
                ('from_mail', models.CharField(db_comment='发送邮箱地址', help_text='发送邮箱地址，冗余', max_length=255)),
                ('template_code', models.CharField(db_comment='模板编码', help_text='模板编码，冗余', max_length=63)),
                ('template_nickname', models.CharField(blank=True, db_comment='模版发送人名称', help_text='模版发送人名称，冗余', max_length=255, null=True)),
                ('template_title', models.CharField(db_comment='邮件标题', help_text='邮件标题', max_length=255)),
                ('template_content', models.CharField(db_comment='邮件内容', help_text='格式化后的内容', max_length=10240)),
                ('template_params', models.CharField(db_comment='邮件参数', help_text='输入后的参数', max_length=255)),
                ('send_status', models.SmallIntegerField(choices=[(0, 'INIT'), (10, 'SUCCESS'), (20, 'FAILURE'), (30, 'IGNORE')], db_comment='发送状态', help_text='发送状态')),
                ('send_time', models.DateTimeField(blank=True, db_comment='发送时间', help_text='发送时间', null=True)),
                ('send_message_id', models.CharField(blank=True, db_comment='发送返回的消息 ID', help_text='发送返回的消息 ID', max_length=255, null=True)),
                ('send_exception', models.CharField(blank=True, db_comment='发送异常', help_text='发送异常', max_length=4096, null=True)),
                ('account_id', models.ForeignKey(blank=True, db_column='account_id', db_comment='邮箱账号编号', db_constraint=False, help_text='邮箱账号编号', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='mail_logs', to='myapp_system.systemmailaccount')),
                ('template_id', models.ForeignKey(blank=True, db_column='template_id', db_comment='模板编号', db_constraint=False, help_text='模板编号', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='mail_logs', to='myapp_system.systemmailtemplate')),
            ],
            options={
                'db_table': 'system_mail_log',
                'db_table_comment': '邮件日志表',
                'ordering': ['-id'],
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='SystemDept',
            fields=[
                ('creator', models.CharField(blank=True, db_comment='创建者', default='', max_length=64, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True, db_comment='创建时间')),
                ('updater', models.CharField(blank=True, db_comment='更新者', default='', max_length=64, null=True)),
                ('update_time', models.DateTimeField(auto_now=True, db_comment='更新时间')),
                ('id', models.BigAutoField(db_comment='部门id', help_text='部门id', primary_key=True, serialize=False)),
                ('name', models.CharField(db_comment='部门名称', default='', help_text='部门名称', max_length=30)),
                ('sort', models.IntegerField(db_comment='显示顺序', default=0, help_text='显示顺序')),
                ('phone', models.CharField(blank=True, db_comment='联系电话', help_text='联系电话', max_length=11, null=True)),
                ('email', models.CharField(blank=True, db_comment='邮箱', help_text='邮箱', max_length=50, null=True)),
                ('status', models.SmallIntegerField(choices=[(0, 'ENABLE'), (1, 'DISABLE')], db_comment='部门状态（0正常 1停用）', help_text='部门状态（0正常 1停用）')),
                ('leader_user_id', models.ForeignKey(blank=True, db_column='leader_user_id', db_comment='负责人', db_constraint=False, help_text='负责人', null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='depts', to=settings.AUTH_USER_MODEL)),
                ('parent_id', models.ForeignKey(blank=True, db_column='parent_id', db_comment='父部门id', db_constraint=False, help_text='父部门id', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='children', to='myapp_system.systemdept')),
            ],
            options={
                'db_table': 'system_dept',
                'db_table_comment': '部门表',
                'ordering': ['sort'],
                'managed': True,
            },
        ),
        migrations.AddField(
            model_name='systemusers',
            name='dept_id',
            field=models.ForeignKey(blank=True, db_column='dept_id', db_comment='部门ID', db_constraint=False, help_text='部门ID', null=True, on_delete=django.db.models.deletion.PROTECT, related_name='users', to='myapp_system.systemdept'),
        ),
        migrations.AddField(
            model_name='systemusers',
            name='posts',
            field=models.ManyToManyField(help_text='与岗位关联的用户列表', related_name='users', through='myapp_system.SystemUserPost', to='myapp_system.systempost'),
        ),
        migrations.AddField(
            model_name='systemusers',
            name='roles',
            field=models.ManyToManyField(related_name='users', through='myapp_system.SystemUserRole', to='myapp_system.systemrole'),
        ),
    ]
