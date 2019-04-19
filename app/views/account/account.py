#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/15 上午11:29
# software: PyCharm
from app.base import BaseView
from app.utils.decorators import check_login
from app.models.user.users import UserInfo, UserAddressInfo

from django.shortcuts import render, redirect, reverse
from rest_framework.response import Response
from rest_framework.views import APIView

class AccountView(BaseView):

    @check_login
    def get(self, request, *args, **kwargs):
        result = self.check_login(kwargs=kwargs)
        if result[0]:
            name = result[1]
            user = UserInfo.objects.filter(u_name=name)
            eamil = UserAddressInfo.objects.filter(user=user[0].id)

            context={
                'title': '个人中心',
                'is_login': result[0],
                'name': name,
                'user': user[0],
                'email': eamil[0],
            }

            return render(request, 'account/account_msg.html', context=context)
        else:
            return redirect(reverse('login'))

class AccountCartView(BaseView):

    @check_login
    def get(self, request, *args, **kwargs):
        result = self.check_login(kwargs=kwargs)
        if result[0]:
            name = result[1]
            user = UserInfo.objects.filter(u_name=name)
            eamil = UserAddressInfo.objects.filter(user=user[0].id)

            context={
                'title': '个人中心',
                'is_login': result[0],
                'name': name,
                'user': user[0],
                'email': eamil[0],
            }

            return render(request, 'account/account_msg.html', context=context)
        else:
            return redirect(reverse('login'))

class AccountChangeView(BaseView):

    def post(self, request, *args, **kwargs):
        data = request.data
        print(data)
        print(data.get('context'))

        user = UserInfo.objects

        return Response('修改成功')