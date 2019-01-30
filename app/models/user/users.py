#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午10:27

from django.db import models

class UserInfo(models.Model):
    u_id=models.CharField(max_length=1000)
    u_name=models.CharField(max_length=20)
    u_sex=models.CharField(max_length=10, default='女', choices=(('lady', '女'),('man', '男')))
    u_phone=models.CharField(max_length=20)
    u_age=models.IntegerField()
    u_createtime=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.u_name

class UserAddressInfo(models.Model):
    ua_get_address=models.CharField(max_length=100)
    ua_email=models.CharField(max_length=100)
    ua_user=models.ForeignKey(UserInfo, on_delete=models.CASCADE)

    def __str__(self):
        return self.ua_user