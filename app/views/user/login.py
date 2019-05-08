# -*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
from app.models.user.profile import Profile
from app.models.user.users import MyUser

from django.shortcuts import render, redirect, reverse
from django.contrib.auth import login, logout, authenticate
from django.http.response import HttpResponse
from rest_framework.response import Response
from rest_framework.views import APIView


class LoginView(APIView):
    def get(self, request, *args, **kwargs):
        context = {
            'title': '登录',
            'is_login': False,
            'name': None,
            'carts': 0,
            'cartscount': 0,
        }
        return render(request, 'ps_user/login.html', context=context)

    # TODO 考虑增加next返回机制
    def post(self, request, format=None, *args, **kwargs):
        data = request.data
        username = data['username']
        password = data['password']
        remember = data['settime']

        mobile = Profile.objects.filter(mobile=username).first()
        email = MyUser.objects.filter(email=username).first()
        if mobile:
            user = MyUser.objects.filter(id=mobile.user.id).first()
        elif email:
            user = email
        else:
            user = authenticate(username=username, password=password)  # 使用用户名检测
        if user:
            if user.is_active:
                login(request, user, backend='django.contrib.auth.backends.ModelBackend')
                request.session.set_expiry(1296000 if remember else 0)  # 保存半个月
                return HttpResponse(0)
            else:
                return Response(1)
        else:
            return Response(2)


class LogoutView(APIView):
    def get(self, request):
        logout(request)
        return redirect(reverse('index'))
