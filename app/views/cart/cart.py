# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from app.utils.decorators import check_login
from app.base import BaseView
from app.models.cart.cart import Cart

from django.shortcuts import render, redirect, reverse
from rest_framework.views import APIView
from rest_framework.response import Response

class CartView(BaseView):
    @check_login
    def get(self, request, *args, **kwargs):
        rs = self.check_login(kwargs=kwargs)
        if rs:
            name = request.user.username
            carts = Cart.objects.filter(user=request.user.id)
            cartscount = Cart.objects.filter(user=request.user.id).count()
            context = {
                'is_login': rs,
                'name': name,
                'title': '购物车',
                'carts':carts,
                'cartscount': cartscount,
            }

            return render(request, 'cart/cart.html', context=context)
        else:
            return redirect(reverse('login'))

class DeleteCartView(APIView):
    def get(self, request, cartid, *args, **kwargs):
        print(cartid)
        cart = Cart.objects.filter(id=cartid)
        cart.delete()

        return redirect(reverse('cart'))