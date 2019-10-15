# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from django.db import models

class Cart(models.Model):

    goods = models.ForeignKey('app.Goods')
    user = models.ForeignKey('MyUser')
    number = models.IntegerField(default=1)
    color = models.CharField(max_length=100, default='')
    version = models.CharField(max_length=100, default='')