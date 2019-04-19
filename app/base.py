#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/11 下午3:09
# software: PyCharm
from app.utils.decorators import check_login

from django.shortcuts import redirect, reverse
from rest_framework.views import APIView

class BaseView(APIView):

    def check_login(self, *args, **kwargs):
        kwarg = kwargs['kwargs']
        is_login = kwarg['is_login']
        username = kwarg['username']
        if is_login and username:
            return [is_login, username]
        else:
            return [is_login]

