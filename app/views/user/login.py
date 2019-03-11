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
        target = data['target']
        password = data['password']

        result1 = UserInfo.objects.filter(u_phone=target).first()

        result2 = UserInfo.objects.filter(u_name=target).first()

        result3 = UserAddressInfo.objects.filter(ua_email=target).first()
        result4 = UserInfo.objects.filter(id=result3.user_id).first()

        if result1 and result1 != None:
            print(result1)
            return Response('phone success login')
        elif result2 and result2 != None:
            print(result2)
            return Response('Email success login')
        elif result4 and result4 != None:
            print(result4)
            return Response('success')
        else:
            return Response('fail')
