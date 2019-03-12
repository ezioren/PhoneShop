#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
import hashlib

from app.conts import *

from app.models.user.users import UserInfo, UserAddressInfo

from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView


class LoginView(APIView):
    def get(self, request):
        return render(request, 'ps_user/login.html', context={'title':'登录'})

class LoginhandleView(APIView):
    def post(self, request, format=None, *args, **kwargs):
        data = request.data
        target = data['target']
        password = data['password']
        settime = data['settime']

        # 密码加密
        _sha256 = hashlib.sha256()
        _sha256.update(password.encode('utf-8'))
        _sha256_pwd = _sha256.hexdigest()

        # phone
        result1 = UserInfo.objects.filter(u_phone=target).first()
        if result1 and result1 != None:
            if _sha256_pwd == result1.u_password :
                return Response(MOBILEPHONE_SUCCESS_LOGIN)
            else:
                return Response(PASSWORD_ERROR)

        # username
        result2 = UserInfo.objects.get(u_name=target)
        print(result2, '2')
        if result2 and result2 != None:
            if _sha256_pwd == result2.u_password :
                return Response(USERNAME_SUCCESS_LOGIN)
            else:
                return Response(PASSWORD_ERROR)

        # email
        result3 = UserAddressInfo.objects.get(ua_email=target)
        print(result3, '3')
        if result3 and result3 != None:
            result4 = UserInfo.objects.get(id=result3.user)
            if result4 and result4 != None:
                if _sha256_pwd == result4.u_password :
                    return Response(EMAIL_SUCCESS_LOGIN)
                else:
                    return Response(PASSWORD_ERROR)

        return Response(LOGON_FAILURE)