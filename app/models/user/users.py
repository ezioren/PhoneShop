#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午10:27
import uuid
from django.db import models

class UserInfo(models.Model):
    u_uuid=models.UUIDField(default=uuid.uuid4, editable=False, auto_created=True)
    u_name=models.CharField(max_length=60,default='')
    u_password=models.CharField(max_length=255)
    u_sex=models.CharField(max_length=10, default='女', choices=(('lady', '女'),('man', '男')))
    u_phone=models.CharField(max_length=20)
    u_createtime=models.CharField(max_length=20)

    def __str__(self):
        return self.u_name

class UserAddressInfo(models.Model):
    ua_getaddress=models.CharField(max_length=100, default='')
    ua_email=models.CharField(max_length=100)
    user=models.ForeignKey(UserInfo, on_delete=models.CASCADE)

    def __str__(self):
        return self.ua_email