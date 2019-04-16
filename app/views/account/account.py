#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/15 上午11:29
# software: PyCharm
from app.utils.decorators import check_login

from django.shortcuts import render, redirect, reverse
from rest_framework.response import Response
from rest_framework.views import APIView

class AccountView(APIView):

    @check_login
    def get(self, request, *args, **kwargs):
        is_login = kwargs['is_login']

        if is_login:
            name = kwargs['username']
            return render(request, 'account/base.html', context={'title':'个人中心','is_login':is_login, 'name':name})
        else:
            return redirect(reverse('login'),kwargs={'next':'account'})