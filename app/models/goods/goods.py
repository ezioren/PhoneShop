# -*- coding: utf-8 -*-
from django.db import models, transaction

class Goods(models.Model):
    name=models.CharField(max_length=30)
    price=models.DecimalField(max_digits=5, decimal_places=2)
    type=models.CharField(max_length=30) # 类型
    click=models.IntegerField() # 点击量
    isDelete=models.BooleanField(default=True) # 是否销售
    cp=models.ForeignKey('Company',on_delete=models.CASCADE, default=1)

    identifier=models.CharField(max_length=20)

    @classmethod
    @transaction.atomic()
    def save_new(self):
        pass

    @property
    def good_info(self):
        """ 返回商品基本信息, 屏蔽敏感信息 """
        obj = {
            'name': self.name,
            'price': self.price,
            'click': self.click,
            'isDelete': self.isDelete,
            'cp': self.cp,
            'type': self.type,
        }
        # 返回详情
        goodsdetail = self.goodsdetail
        obj.update({
            'pic': goodsdetail.pic,
            'context': goodsdetail.context,
            'color': goodsdetail.color,
            'colorType': goodsdetail.colorType,
            'version': goodsdetail.version,
            'kucun': goodsdetail.kucun,
        })
        # 放回评价
        goodscontent = self.goodscontent
        obj.update({
            'content':goodscontent.content,
            'user_source':goodscontent.user_source,
            'grade':goodscontent.grade,
        })

        return obj