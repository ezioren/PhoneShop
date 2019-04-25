#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/23 下午4:49
# software: PyCharm
from django.db import models

class GoodsDetail(models.Model):
    good = models.OneToOneField('Goods', on_delete=models.CASCADE)

    context = models.CharField(max_length=200)  # 简介
    color=models.CharField(max_length=10) # 颜色
    version=models.CharField(max_length=30) # 版本
    Stock=models.IntegerField(default=1000) # 库存

class GoodsContent(models.Model):
    good = models.OneToOneField('Goods', on_delete=models.CASCADE)

    content = models.CharField(max_length=200) # 商品评价
    user_source = models.CharField(max_length=200) # 评价人
    grade = models.CharField(max_length=200) # 分数

class GoodsPic(models.Model):
    good = models.OneToOneField('Goods')

    name = good.name
    src = models.ImageField(upload_to='images/')