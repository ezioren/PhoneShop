# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from app.utils.decorators import check_login
from app.base import BaseView
from app.models.user.users import MyUser
from app.models.order.order import Order, Orderinfo
from app.models.cart.cart import Cart

from django.shortcuts import render, redirect, reverse
from rest_framework.views import APIView
from rest_framework.response import Response

class OrderView(BaseView):
    @check_login
    def get(self, request, *args, **kwargs):
        rs = self.check_login(kwargs=kwargs)
        if rs:
            name = request.user.username
            user = MyUser.objects.filter(id=request.user.id).first()
            order = Order.objects.filter(user=request.user.id, is_pay=False).first()
            orderinfos = Orderinfo.objects.filter(order=order)
            orderinfoscount = Orderinfo.objects.filter(order=order).count()
            context = {
                'is_login': rs,
                'name': name,
                'title': '订单',
                'user': user,
                'carts':0,
                'order':order,
                'orderinfos':orderinfos,
                'orderinfoscount':orderinfoscount,
                'cartscount': 0,
            }

            return render(request, 'order/place_order.html', context=context)
        else:
            return redirect(reverse('login'))

    def post(self, request, *args, **kwargs):
        orderid = request.data.get('orderid', None)
        order = Order.objects.filter(id=orderid).first()
        order.is_pay = True
        order.save()

        return Response('ok')

class CreateOrderView(APIView):
    def post(self, request, *args, **kwargs):
        total = request.data.get('total', None)

        carts = Cart.objects.filter(user=request.user.id)
        order = Order()
        order.total = total
        order.user_id = request.user.id
        order.save()

        for cart in carts:
            orderinfo = Orderinfo()
            orderinfo.order = order
            orderinfo.number = cart.number
            orderinfo.goods = cart.goods
            orderinfo.version = cart.version
            orderinfo.color = cart.color
            orderinfo.save()
            cart.delete()

        return Response('下单成功')