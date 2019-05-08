# -*- coding: utf-8 -*-
from django.db import models, transaction

class Goods(models.Model):
    name=models.CharField(max_length=30)
    price=models.CharField(max_length=100, null=False)
    type=models.CharField(max_length=30) # 类型
    click=models.IntegerField(default=0) # 点击量
    isDelete=models.BooleanField(default=False) # 是否销售
    cp=models.ForeignKey('Company',on_delete=models.CASCADE, default=1)

    identifier=models.CharField(max_length=100) #商品编号

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
            'context': goodsdetail.context,
            'color': goodsdetail.color,
            'version': goodsdetail.version,
            'kucun': goodsdetail.stock,
        })
        goodspic = self.goodspic
        obj.update({
            'pic0': goodspic.pic0,
            'pic1': goodspic.pic1,
            'pic2': goodspic.pic2,
            'pic3': goodspic.pic3,
            'pic4': goodspic.pic4,
        })
        # 放回评价
        goodscontent = self.goodscontent
        obj.update({
            'content':goodscontent.content,
            'user_source':goodscontent.user_source,
            'grade':goodscontent.grade,
        })

        return obj