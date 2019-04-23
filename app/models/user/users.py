#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午10:27
import json

from django.conf import settings
from django.contrib.auth.models import User
from django.db import transaction

class MyUser(User):
    class Meta:
        proxy = True
        default_permissions = ('add', 'change', 'delete', 'view')

    @classmethod
    @transaction.atomic()
    def get_or_create(cls, username, email=None, password=None, *args, **kwargs):

        my_user = MyUser.objects.filter(username=username).first()

        if not my_user:
            my_user = MyUser.objects.create_user(username, email, password, **kwargs)

        return my_user

    @property
    def user_info(self):
        """ 返回用户基本信息, 屏蔽敏感信息 """
        obj = {
            'last_login': self.last_login,
            'is_superuser': self.is_superuser,
            'username': self.username,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'email': self.email,
            'is_staff': self.is_staff,
            'is_active': self.is_active,
            'date_joined': self.date_joined,
        }
        profile = self.profile

        obj.update({
            'mobile': profile.mobile,
            'sendaddress': profile.sendaddress,
            'sex': profile.sex
        })
        obj.pop('password', None)
        obj.pop('user_permissions', None)
        obj['id'] = self.id
        obj['profile_id'] = profile.id
        return obj

