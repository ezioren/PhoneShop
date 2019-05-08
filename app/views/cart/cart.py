# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from app.utils.decorators import check_login
from app.base import BaseView

from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response

class CartView(BaseView):
    @check_login
    def get(self, request, *args, **kwargs):
        rs = self.check_login(kwargs=kwargs)
        if rs:
            name = request.user.username
        else:
            name = None

        context = {
            'is_login': rs,
            'name': name,
            'title': '购物车',
        }

        return render(request, 'cart/cart.html', context=context)