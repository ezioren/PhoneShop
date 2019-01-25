# -*- coding: utf-8 -*-

from rest_framework import serializers
from app.models.user.users import UserInfo, UserAddressInfo

class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model=UserInfo
        fields='__all__'
        # read_only_fields=('',) #只做输出，不操作

class GoodsSerializer(serializers.ModelSerializer):
    # 获取外键用户名
    company_c_name=serializers.CharField(source='UserInfo.u_name')
    class Meta:
        model=UserAddressInfo
        fields='__all__'

