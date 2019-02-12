#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
from django.shortcuts import render

from rest_framework.response import Response
from rest_framework.views import APIView

from app.models.user.users import UserAddressInfo, UserInfo

class RegisterView(APIView):
    def get(self, request):
        return render(request, 'ps_user/register.html', context={'title':'注册'})

class RegisterHandleView(APIView):

    # 验证是否已存在
    def check_user_exitence(self, target):
        user=UserInfo.objects.filter(user=target)
        if (user and user != ""):
            pass

    def post(self, request, format=None):
        data = request.data
        print(data['username'])
        return Response('haha', status=200)