#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
from django.shortcuts import render
from rest_framework.views import APIView


class LoginView(APIView):
    def get(self, request):
        return render(request, 'ps_user/login.html', context={'title':'登录'})