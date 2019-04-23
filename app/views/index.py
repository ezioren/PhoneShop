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
        if result:
            name = request.user.username
            context = {
                'index': 'welcome',
                'title': '优选商城～选你所选',
                'is_login': result,
                'name': name
            }
        else:
            context = {
                'index': 'welcome',
                'title': '优选商城～选你所选',
                'is_login': result,
            }
        return render(request, 'index.html', context=context)