#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/15 上午11:29
# software: PyCharm
from app.base import BaseView
from app.utils.decorators import check_login
from app.models.user.users import MyUser

from django.shortcuts import render, redirect, reverse
from rest_framework.response import Response
from rest_framework.views import APIView

class AccountView(BaseView):

    @check_login
    def get(self, request, *args, **kwargs):
        result = self.check_login(kwargs=kwargs)

        if result:
            user = MyUser.objects.filter(username=request.user.username)
            context={
                'title': '个人中心',
                'is_login': result,
                'user': user[0],
                'name':request.user
            }

            return render(request, 'account/account_msg.html', context=context)
        else:
            return redirect(reverse('login'))

class AccountCartView(BaseView):

    @check_login
    def get(self, request, *args, **kwargs):
        result = self.check_login(kwargs=kwargs)
        if result:
            user = MyUser.objects.filter(username=request.user.username)

            context={
                'title': '个人中心',
                'is_login': result,
                'user': user[0],
            }

            return render(request, 'account/account_msg.html', context=context)
        else:
            return redirect(reverse('login'))

class AccountChangeView(BaseView):

    def post(self, request, *args, **kwargs):
        data = request.data
        user = MyUser.objects.filter(username=request.user)[0]

        user.username = data['name']
        user.profile.mobile = data['mobile']
        user.email = data['email']
        user.profile.sex = data['sex']
        user.profile.sendaddress = data['sendaddress']
        user.save()
        user.profile.save()

        return Response('修改成功')