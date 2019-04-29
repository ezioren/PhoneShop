#-*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/29 下午4:54
# software: PyCharm
import re
import random
from django import template

register = template.Library()

@register.simple_tag
def colorfilter(goods):
    return  re.findall('\'(.*?)\'', goods.goodsdetail.color)[0]

@register.simple_tag
def versionfilter(goods):
    return  re.findall('\'(.*?)\'', goods.goodsdetail.version)[0]

@register.simple_tag
def pricefilter(price):
    discount = random.randint(1,6)
    return  round(float(price)+float(price)*0.1*discount, 2)