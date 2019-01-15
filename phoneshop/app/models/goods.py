# -*- coding: utf-8 -*-
from django.db import models

# Create your models here.
class CompanyInfo(models.Model):
    c_name=models.CharField(max_length=20) # 公司
    c_isDelete=models.BooleanField(default=False)

    def __str__(self):
        return self.c_name

class GoodsInfo(models.Model):
    g_id=models.CharField(max_length=20)  # 公司缩写#产品编号
    g_name=models.CharField(max_length=30)
    g_pic=models.CharField(max_length=30)  #  产品_色号
    g_jianjie = models.CharField(max_length=200)  # 简介
    g_color=models.CharField(max_length=10) # 颜色代码
    g_colorType=models.CharField(max_length=20) # 颜色类型
    g_version=models.CharField(max_length=30) # 版本
    g_type=models.CharField(max_length=30) # 类型
    g_price=models.DecimalField(max_digits=5, decimal_places=2)
    g_click=models.IntegerField() # 点击量
    g_kucun=models.IntegerField() # 库存
    g_isDelete=models.BooleanField(default=False) # 是否销售
    g_cp=models.ForeignKey(CompanyInfo,on_delete=models.CASCADE)

    def __str__(self):
        return self.g_name

# TODO 商品具体参数
# class GoodsDetailInfo(models.Model):
#     gd_jianjie = models.CharField(max_length=200)  # 简介
#     gd_CPU=models.CharField(max_length=20) # cpu
#     gd_CPUDetail=models.CharField(max_length=100) # cpu介绍
