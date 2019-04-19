#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午9:38
# software: PyCharm
from django.shortcuts import render
from django.http.response import HttpResponse
from django.contrib.auth import authenticate

from rest_framework.response import Response
from rest_framework.views import APIView

from app.models.user.users import MyUser
from app.models.user.profile import Profile

class RegisterView(APIView):
    def get(self, request):
        return render(request, 'ps_user/register.html', context={'title':'注册'})

class RegisterHandleView(APIView):
    # 验证是否已存在
    # TODO 手机验证码
    def check_exitence(self, source, label):
        pass
        if label == 'username':
            username=MyUser.objects.filter(username=source)
            email =MyUser.objects.filter(email=source)
            mobile = Profile.objects.filter(mobile=source)
            if username or email or mobile:
                return True

        elif label == 'email':
            email = MyUser.objects.filter(email=source)
            if email:
                return True

        elif label == 'phone':
            mobile = Profile.objects.filter(mobile=source)
            if mobile:
                return True
        else:
            return False

    def post(self, request, *args, **kwargs):
        data = request.data
        username = data['username']
        email = data['email']
        mobile = data['mobile']
        password = data['password']
        sex = data['sex']
        createtime = data['createtime']

        user = MyUser.get_or_create(
            username=username,
            password=password,
            email=email,
            first_name=mobile,
            last_name=data.get('last_name','')
        )
        user.is_active=True
        user.save()

        profile = Profile()
        profile.user = user
        profile.mobile = mobile
        profile.sex = sex
        profile.save()

        checkuser = authenticate(username=username, password=password)
        if checkuser:
            return HttpResponse(0)
        else:
            return HttpResponse(1)

    def get(self, request, *args, **kwargs):
        source = request.GET
        exit = self.check_exitence(source['source'], source['name'])
        if exit:
            return Response('exited')
        else:
            return Response('not')

