# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from django.db import models

class Order(models.Model):
    user = models.ForeignKey('MyUser')
    total = models.CharField(max_length=1000, default='')
    order_date = models.DateTimeField(auto_now = True, blank=True, null=True)
    is_pay = models.BooleanField(default=False)

class Orderinfo(models.Model):
    order = models.ForeignKey('Order')
    goods = models.ForeignKey('Goods')
    number = models.IntegerField(default=1)
    version = models.CharField(max_length=20, default='')
    color = models.CharField(max_length=20, default='')