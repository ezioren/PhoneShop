#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
import hashlib
import json
import re

from app.conts import *
from app.models.user.users import UserInfo, UserAddressInfo

from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView



class LoginView(APIView):
    def _save(self, result, request, pwd, remember):
        _sha256 = hashlib.sha256()
        _sha256.update(pwd.encode('utf-8'))
        _sha256_pwd = _sha256.hexdigest()
        if _sha256_pwd == result[0].u_password:
            request.session['username'] = result[0].u_name
            request.session.set_expiry(30 * 86400 if remember else 0)
            request.session.save()
            return LOGON_SUCCESS
        else:
            return PASSWORD_ERROR

    def get(self, request):
        return render(request, 'ps_user/login.html', context={'title':'登录'})

    def post(self, request, format=None, *args, **kwargs):
        data = request.data
        origin = request.META['HTTP_ORIGIN']
        target = data['target']
        password = data['password']
        remember = data['settime']
        next = data.get('next', None)
        # 密码加密
        _sha256 = hashlib.sha256()
        _sha256.update(password.encode('utf-8'))
        _sha256_pwd = _sha256.hexdigest()
        # phone
        u_phone = UserInfo.objects.filter(u_phone=target)
        # email
        ua_email = UserAddressInfo.objects.filter(ua_email=target)
        u_email = None
        if ua_email:
            u_email = UserInfo.objects.filter(id=ua_email[0].user.id)
        # username
        u_name = UserInfo.objects.filter(u_name=target)
        # 验证用户名
        if u_phone or u_email or u_name:
            # 登录
            code = self._save(u_phone or u_email or u_name, request, password, remember)
            return Response(code)
        else:

            return Response(ACCOUNT_DOES_NO_EXIST)

class LogoutView(APIView):
    def post(self, request):
        origin = request.META['HTTP_ORIGIN']
        request.session.delete('username')

        return Response(origin + '/index')