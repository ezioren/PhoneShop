#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from app.tips import types

from app.models.goods.goods import Goods
from app.models.goods.company import Company

from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView

class Goodslist(APIView):
    def get(self, requst ,type, format=None):
        companys = Company.objects.filter()

        if type in types:
            title = types[type]

        hots = Goods.objects.filter(click__gt=0).order_by('click')[:5]
        context = {
            "companys": companys,
            "title": title,
            'hots': hots,
        }
        return render(requst, 'goods/goodlist.html', context=context)