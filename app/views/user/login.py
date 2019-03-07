#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
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
        target = data('target')
        password = data('password')
        if target and target != None:
            results = UserInfo.objects.filter(u_phone=target)
            print(results[0])
        elif target and target != None:
            results = UserInfo.objects.filter(u_name=target)
            print(results[0])
        elif target and target != None:
            results = UserAddressInfo.objects.filter(ua_email=target)
            print(results[0])
        else:
            return Response('fail')