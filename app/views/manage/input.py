# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/24 上午10:24
# software: PyCharm
import json

from app.models.goods.goods import Goods
from app.models.goods.company import Company
from app.models.goods.goodsDetail import GoodsDetail, GoodsPic

from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView

# 商品录入
class GoodsInputView(APIView):
    def get(self, request, *args, **kwargs):
        companys=Company.objects.values('companyname')
        context={
            'title': '商品录入',
            'companys': companys,
        }
        return render(request, 'manage/input.html', context=context)

    # TODO 保存图片路径
    def save_pic(self, pics):
        pass

    # 以列表形式保存
    def save_list(self, result, i, data, key):
        if key + '[{number}]'.format(number=i) in data:
            result.append(data[key + '[{number}]'.format(number=i)])
            i=i+1
            return self.save_list(result, i, data=data,key=key)
        else:
            return result

    # 检查公司是否存在数据库
    def check_company(self, company):
        result = Company.objects.filter(companyname=company).first()
        if result != None:
            return result.id
        else:
            return None

    def post(self, request, *args, **kwargs):
        data = request.data

        goods = Goods()
        goods.name = data['name']
        company = self.check_company(data['company'])
        if not company:
            return Response('公司不存在')
        else:
            goods.cp_id = company

        goods.identifier = data['identifier']
        goods.price = data['price']
        if 'parttype' in data:
            goods.type = 'Parts'
        else:
            goods.type=data['type']
        goods.save()

        goodsdetail = GoodsDetail()
        goodsdetail.good=goods
        goodsdetail.context = data['context']
        goodsdetail.color = self.save_list([], 0, data, 'color')
        goodsdetail.version = self.save_list([], 0, data, 'versions')
        goodsdetail.stock = data['stock']
        if 'parttype' in data:
            goodsdetail.parttype = data['parttype']
        goodsdetail.save()

        goodspic = GoodsPic()
        goodspic.good = goods
        goodspic.pic0 = data['pic0'].replace('app/static/', '')
        goodspic.pic1 = data['pic1'].replace('app/static/', '')
        goodspic.pic2 = data['pic2'].replace('app/static/', '')
        goodspic.pic3 = data['pic3'].replace('app/static/', '')
        goodspic.save()

        return Response('ok')

class PartsInputView(APIView):
    def get(self, request, *args, **kwargs):
        context={
            'title': '商品录入',
        }
        return render(request, 'manage/partinput.html', context=context)