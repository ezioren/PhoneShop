# -*- coding: utf-8 -*-

from rest_framework import serializers
from phoneshop.app.models.goods import GoodsInfo, CompanyInfo

class CompanySerializer(serializers.ModelSerializer):
    class Meta:
        model=CompanyInfo
        fields='__all__'
        # read_only_fields=('',) #只做输出，不操作

class GoodsSerializer(serializers.ModelSerializer):
    # 获取外键中公司名
    company_c_name=serializers.CharField(source='companyinfo.c_name')
    class Meta:
        model=GoodsInfo
        fields='__all__'

