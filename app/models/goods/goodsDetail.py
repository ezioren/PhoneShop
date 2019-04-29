#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/23 下午4:49
# software: PyCharm
from django.db import models

class GoodsDetail(models.Model):
    good = models.OneToOneField('Goods', on_delete=models.CASCADE)

    context = models.CharField(max_length=200)  # 简介
    color=models.CharField(max_length=1000) # 颜色
    version=models.CharField(max_length=1000) # 版本
    parttype=models.CharField(max_length=100, default=None, null=True) # 版本
    stock=models.IntegerField(default=1000) # 库存

# 评价
class GoodsContent(models.Model):
    good = models.OneToOneField('Goods', on_delete=models.CASCADE)

    content = models.CharField(max_length=200) # 商品评价
    user_source = models.CharField(max_length=200) # 评价人
    grade = models.CharField(max_length=200) # 分数

# 图片
class GoodsPic(models.Model):
    good = models.OneToOneField('Goods')

    pic0 = models.CharField(null=True, max_length=1000)
    pic1 = models.CharField(null=True, max_length=1000)
    pic2 = models.CharField(null=True, max_length=1000)
    pic3 = models.CharField(null=True, max_length=1000)
    pic4 = models.CharField(null=True, max_length=1000)
