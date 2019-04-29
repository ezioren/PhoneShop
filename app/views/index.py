# -*- coding: utf-8 -*-
import re
import settings

from app.base import BaseView
from app.utils.decorators import check_login
from app.utils.transdb import TransDbData
from app.models.goods.goods import Goods
from app.models.goods.goodsDetail import GoodsDetail

from django.shortcuts import render, redirect, reverse
from rest_framework.views import APIView


# Create your views here.
class HomeView(APIView):
    def get(self, request):
        return redirect(reverse('index'))


class IndexView(BaseView):

    @check_login
    def get(self, request, *args, **kwargs):
        result = self.check_login(kwargs=kwargs)

        news = Goods.objects.filter(type='New').order_by('id')[::2]
        costs = Goods.objects.filter(type='Cost').order_by('id')[:8]
        classics = Goods.objects.filter(type='Classic').order_by('id')[:8]
        parts = Goods.objects.filter(type='Parts').order_by('id')[:8]
        part2s = Goods.objects.filter(type='Parts').order_by('id')

        if result:
            name = request.user.username
        else:
            name = None
        context = {
            'index': 'welcome',
            'title': '优选商城～选你所选',
            'is_login': result,
            'name': name,
            'news': news,
            'costs': costs,
            'classics': classics,
            'parts': parts,
            'part2s': part2s,
        }
        return render(request, 'index.html', context=context)
