# -*- coding: utf-8 -*-
from django.shortcuts import render
from rest_framework.views import APIView

# Create your views here.
class IndexView(APIView):
    # queryset = GoodsInfo.objects.all()

    def get(self, request):
        return render(request, 'ps_goods/index.html', context={'index':'welcome','title':'优选商城～选你所选'})