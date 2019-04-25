#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/24 上午10:24
# software: PyCharm
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView

class GoodsInputView(APIView):
    def get(self, request, *args, **kwargs):
        return render(request, 'manage/input.html', context={'title':'商品录入'})

    def post(self, request, *args, **kwargs):
        data=request.data
        print(data)

        return Response('ok')