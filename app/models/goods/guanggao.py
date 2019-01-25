#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 下午4:32
# software: PyCharm
# content: 广告模型
from django.db import models

# Create your models here.
class AdvertisementInfo(models.Model):
    adv_name=models.CharField(max_length=20) # 广告名
    adv_pic=models.CharField(max_length=100)
    adv_content=models.CharField(max_length=100) # 广告描述

    def __str__(self):
        return self.adv_name

