# -*- coding: utf-8 -*-
from app.utils.decorators import check_login

from django.shortcuts import render, redirect
from rest_framework.views import APIView

# Create your views here.
class BaseView(APIView):
    def get(self, request):
        return redirect('/index')

class IndexView(APIView):
    # queryset = GoodsInfo.objects.all()

    @check_login
    def get(self, request, *args, **kwargs):
        is_login = kwargs['is_login']
        name = None
        if is_login:
            name = kwargs['username']
        return render(request, 'ps_goods/index.html', context={'index':'welcome','title':'优选商城～选你所选', 'is_login':is_login, 'name':name})