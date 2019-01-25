#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午10:27
# software: PyCharm

from django.db import models

class UserInfo(models.Model):
    u_name=models.CharField(max_length=20)
    u_sex=models.BooleanField(default=0)  # 0表示男生 1表示女生
    u_phone=models.IntegerField(max_length=20)
    u_age=models.IntegerField(max_length=5)

    def __str__(self):
        return self.u_name

class UserAddressInfo(models.Model):
    ua_address=models.CharField(max_length=100)
    ua_user=models.ForeignKey(UserInfo, on_delete=models.CASCADE())

    def __str__(self):
        return self.ua_address