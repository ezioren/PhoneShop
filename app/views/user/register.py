#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
import datetime
import uuid
import hashlib
import json

from django.shortcuts import render

from rest_framework.response import Response
from rest_framework.views import APIView

from app.models.user.users import UserAddressInfo, UserInfo

class RegisterView(APIView):
    def get(self, request):
        return render(request, 'ps_user/register.html', context={'title':'注册'})

class RegisterHandleView(APIView):

    def save_user(self, data):
        try:
            # 密码加密
            _sha256 = hashlib.sha256()
            _sha256.update(data['password'].encode('utf-8'))
            _sha256_pwd = _sha256.hexdigest()

            # 保存用户信息
            userinfo = UserInfo()
            userinfo.u_name = data['username']
            userinfo.u_password = _sha256_pwd
            userinfo.u_phone = data['phonenum']
            userinfo.u_sex = data['sex']
            userinfo.u_uuid = uuid.uuid4()
            userinfo.u_createtime = data['createtime']
            userinfo.save()

            # 保存用户地址信息
            useradsinfo = UserAddressInfo()
            useradsinfo.ua_email = data['email']
            useradsinfo.ua_u_name = UserInfo.objects.get(u_name=data['username'])
            useradsinfo.save()

            return True
        except:
            return False

    # 验证是否已存在
    def check_exitence(self, source, label):
        if (label == "username" and source !=""):
            results=UserInfo.objects.filter(u_name=source)
            if (results):
                result = results[0]
            else:
                return 0
            if (source == str(result.u_name)):
                return 1
            else:
                return 0
        elif (label == "phone" and source !=""):
            results=UserInfo.objects.filter(u_phone=source)
            if (results):
                result = results[0]
            else:
                return 0
            if (source == str(result.u_phone)):
                return 1
            else:
                return 0
        else:
            return 0

    def post(self, request, *args, **kwargs):
        datasource = request.data
        result = self.save_user(datasource)
        if (result):
            return Response("注册完成")
        else:
            return Response("注册失败")

    def get(self, request, *args, **kwargs):
        source = request.GET
        exit = self.check_exitence(source['source'], source['name'])
        if (exit > 0):
            return Response('exited')
        else:
            return Response('not')

