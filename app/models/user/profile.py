#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/19 下午2:01
# software: PyCharm
from django.db import models

class Profile(models.Model):
    user = models.OneToOneField('app.MyUser')

    sex = models.CharField(max_length=5, null=True, blank=True)
    mobile = models.CharField(null=False, max_length=20)
    sendaddress = models.CharField(max_length=50, default=None, null=True)
