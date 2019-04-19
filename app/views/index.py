# -*- coding: utf-8 -*-
import settings

from app.base import BaseView
from app.utils.decorators import check_login

from django.shortcuts import render, redirect, reverse
from rest_framework.views import APIView

# Create your views here.
class HomeView(APIView):
    def get(self, request):
        return redirect(reverse('index'))

class IndexView(BaseView):
    # queryset = GoodsInfo.objects.all()

    @check_login
    def get(self, request, *args, **kwargs):
        result = self.check_login(kwargs=kwargs)
        print(request.session.get(settings.SESSION_KEY))
        if result[0]:
            name = result[1]
            context = {
                'index': 'welcome',
                'title': '优选商城～选你所选',
                'is_login': result[0],
                'name': name
            }
        else:
            context = {
                'index': 'welcome',
                'title': '优选商城～选你所选',
                'is_login': result[0],
            }
        return render(request, 'ps_goods/index.html', context=context)