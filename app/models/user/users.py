#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-1-25 上午10:27
import uuid
from django.db import models

class UserInfo(models.Model):
    u_uuid=models.UUIDField(default=uuid.uuid4, editable=False, auto_created=True)
    u_name=models.CharField(max_length=20, unique=True)
    u_sex=models.CharField(max_length=10, default='女', choices=(('lady', '女'),('man', '男')))
    u_phone=models.CharField(max_length=20)
    u_createtime=models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.u_name

class UserAddressInfo(models.Model):
    ua_getaddress=models.CharField(max_length=100)
    ua_email=models.CharField(max_length=100)
    ua_u_name=models.ForeignKey(UserInfo, on_delete=models.CASCADE, to_field="u_name")

    def __str__(self):
        return self.ua_u_name