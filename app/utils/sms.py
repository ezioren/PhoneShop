# -*- coding: utf-8 -*-
"""
    @ IT Department of Cyagen Biosciences.
"""
import random

from django.conf import settings
from django.core.cache import cache
from yunpian_python_sdk.model import constant as YC
from yunpian_python_sdk.ypclient import YunpianClient


MOBILE_LOGIN_CACHE_KEY = 'mobile:login:{}'
MOBILE_REGISTER_CACHE_KEY = 'mobile:register:{}'


class SmsSender(object):

    def __init__(self):
        api_key = settings.YP_API_KEY if hasattr(settings, 'YP_API_KEY') else YP_API_KEY
        self.sign = '云舟生物'
        self.client = YunpianClient(api_key)

    def _send(self, mobile, msg):
        param = {YC.MOBILE: mobile, YC.TEXT: msg}
        return self.client.sms().single_send(param)

    def mobile_register(self, mobile, timeout=1):
        code = str(random.randint(100000, 999999))
        msg = '【{sign}】正在进行注册操作，您的动态密码是{code}，有效期{min}分钟。'.format(
            sign=self.sign,
            code=code,
            min=timeout
        )
        cache_key = MOBILE_REGISTER_CACHE_KEY.format(mobile)
        cache.set(cache_key, code, timeout * 60)
        return code, self._send(mobile, msg)

    def mobile_login(self, mobile, timeout=1):
        code = str(random.randint(100000, 999999))
        msg = '【{sign}】正在进行登录操作，您的动态密码是{code}，有效期{min}分钟。'.format(
            sign=self.sign,
            code=code,
            min=timeout
        )
        cache_key = MOBILE_LOGIN_CACHE_KEY.format(mobile)
        cache.set(cache_key, code, timeout * 60)
        return code, self._send(mobile, msg)

    def generate_quote(self, mobile, link):
        msg = '【{sign}】尊敬的用户，您刚刚在VB网站生成了一份合同，可点击以下地址下载PDF：{link}'.format(
            sign=self.sign,
            link=link
        )
        return self._send(mobile, msg)

    def generate_order(self, mobile, slug):
        msg = '【{sign}】尊敬的用户，您已提交订单，订单号{slug}，订单正在处理中。'.format(
            sign=self.sign,
            slug=slug
        )
        return self._send(mobile, msg)

    def accept_order(self, mobile, slug, link):
        msg = '【{sign}】尊敬的用户，您的订单已接受，订单号{slug}。点击查看订单状态：{link}'.format(
            sign=self.sign,
            slug=slug,
            link=link
        )
        return self._send(mobile, msg)

    def send_shipment(self, mobile, slug, number):
        msg = '【{sign}】尊敬的用户，您的订单已发货，订单号{slug}。顺丰速运，快递单号{number}'.format(
            sign=self.sign,
            slug=slug,
            number=number
        )
        return self._send(mobile, msg)
