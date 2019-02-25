# -*- coding: utf-8 -*-
from django.shortcuts import render, redirect
from rest_framework.views import APIView

# Create your views here.
class BaseView(APIView):
    def get(self, request):
        return redirect('/index')

class IndexView(APIView):
    # queryset = GoodsInfo.objects.all()

    def get(self, request):
        return render(request, 'ps_goods/index.html', context={'index':'welcome','title':'优选商城～选你所选'})