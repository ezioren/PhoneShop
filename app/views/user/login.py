#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
import hashlib
import json
import re
import settings

from app.conts import *
from app.models.user.users import MyUser

from django.shortcuts import render, redirect, reverse
from django.contrib.auth import login, logout, authenticate
from django.http.response import HttpResponse
from rest_framework.response import Response
from rest_framework.views import APIView



class LoginView(APIView):
    def get(self, request, *args, **kwargs):
        return render(request, 'ps_user/login.html', context={'title':'登录'})

    # def _save(self, result, request, pwd, remember):
    #     if pwd == result[0].u_password:
    #         if 'username' not in request.session:
    #             request.session['username'] = result[0].u_name
    #             request.session['is_login'] = True
    #             if remember:
    #                 request.session.set_expiry(1296000) # 保存半个月
    #             else:
    #                 request.session.set_expiry(0) # 浏览器关闭失效
    #         return 0
    #     else:
    #         return 1
    # TODO 考虑增加next返回机制
    def post(self, request, format=None, *args, **kwargs):
        data = request.data
        target = data['target']
        password = data['password']
        remember = data['settime']

        # # 密码加密
        # _sha256 = hashlib.sha256()
        # _sha256.update(password.encode('utf-8'))
        # _sha256_pwd = _sha256.hexdigest()
        # # phone
        # u_phone = UserInfo.objects.filter(u_phone=target)
        # # email
        # ua_email = UserAddressInfo.objects.filter(ua_email=target)
        # u_email = None
        # if ua_email:
        #     u_email = UserInfo.objects.filter(id=ua_email[0].user.id)
        # # username
        # u_name = UserInfo.objects.filter(u_name=target)
        # # 验证用户名
        #
        # if u_phone or u_email or u_name:
        #     code = self._save(u_phone or u_email or u_name, request, _sha256_pwd, remember)
        #     return HttpResponse(code)
        #
        # else:
        #     return Response(2)

class LogoutView(APIView):
    def get(self, request):
        # 删除sess
        del request.session['username']
        request.session['is_login'] = False

        return redirect(reverse('index'))