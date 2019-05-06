# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/5/5 上午10:43
# software: PyCharm
from app.utils.decorators import check_login
from app.base import BaseView
from app.tips import types_db, types_title

from app.models.goods.goods import Goods
from app.models.goods.company import Company

from django.shortcuts import render
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from rest_framework.views import APIView


class GoodslistView(BaseView):

    @check_login
    def get(self, request, type, format=None, *args, **kwargs):
        rs = self.check_login(kwargs=kwargs)

        if rs:
            name = request.user.username
        else:
            name = None

        # reques.data可获取除GET以外的所有类型参数
        page = request.query_params.get('page', 1)
        company = request.query_params.get('company', None)
        price = request.query_params.get('price', None)


        # 找公司名
        companys = Company.objects.filter()
        # 找点击量多的
        hots = Goods.objects.filter(click__gt=0).order_by('-click')[:3]

        # 找限制条件中的商品信息
        cresult = Company.objects.filter(companyname=company)

        # 转化为数据库中的类型
        if type in types_db:
            dbtype = types_db[type]
        # 找到标题
        title = types_title[dbtype]
        # 找到数据库中的相应数据
        if price:
            if company:
                results = Goods.objects.filter(type=dbtype, cp=cresult, price__lte=price).order_by('-click')
            else:
                results = Goods.objects.filter(type=dbtype, price__lte=price).order_by('-click')
        elif company:
            results = Goods.objects.filter(type=dbtype, cp=cresult).order_by('-click')
        else:
            results = Goods.objects.filter(type=dbtype).order_by('-click')
        # 值1：所有的数据
        # 值2：每一页的数据
        # 值3：当最后一页数据少于n条，将数据并入上一页
        paginator = Paginator(results, 12)

        try:
            goods = paginator.page(page)
        except PageNotAnInteger:
            goods = paginator.page(1)
        except EmptyPage:
            goods = paginator.page(paginator.num_pages)

        context = {
            'is_login': rs,
            'name': name,
            "companys": companys,
            "title": title,
            'hots': hots,
            'results': goods,
            'type': type,
            'company': company if company else None,
            'price': price if price else None,
            'paginator': paginator,
        }
        return render(request, 'goods/goodlist.html', context=context)

class GoodsDetailView(BaseView):
    @check_login
    def get(self, request, *args, **kwargs):
        rs = self.check_login(kwargs=kwargs)

        if rs:
            name = request.user.username
        else:
            name = None

        context = {
            'is_login':rs,
            'name':name,
        }

        return render(request, 'goods/goodsdetail.html', context=context)