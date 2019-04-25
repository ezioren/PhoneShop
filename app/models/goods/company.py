#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/23 下午4:50
# software: PyCharm
from django.db import models

# Create your models here.
class Company(models.Model):

    companyname=models.CharField(max_length=20) # 公司
    indexweb=models.CharField(max_length=10000) # 官网
    context=models.CharField(max_length=1000) # 简介

    def save_new(self, *args, **kwargs):
        self.companyname = kwargs['name']
        self.indexweb = kwargs['index']
        self.context = kwargs['context']
        self.save()

        return True

    @property
    def company_info(self):
        """ 返回基本信息, 屏蔽敏感信息 """
        obj = {
            'companyname': self.companyname,
            'indexweb': self.indexweb,
            'context': self.context,
        }
        return obj