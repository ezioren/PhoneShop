# -*- conding: utf-8 -*-
from django.conf.urls import url
from .views.index import HomeView, IndexView
from .views.user.login import LoginView, LogoutView
from .views.user.register import RegisterView, RegisterHandleView
from .views.account.account import AccountView, AccountChangeView
from .views.manage.input import GoodsInputView, PartsInputView
from .views.goods.goods import GoodslistView, GoodsDetailView, GoodsContentAddView, GoodsAddCartView
from .views.cart.cart import CartView, DeleteCartView
from .views.order.order import OrderView, CreateOrderView


view_urls = [
    url(r'^$', HomeView.as_view(), name='base'),
    # 首页
    url(r'^index$', IndexView.as_view(), name='index'),

    # 登录注册
    url(r'^user/register$', RegisterView.as_view(), name='register'),
    url(r'^user/registerhandle$', RegisterHandleView.as_view(), name='registerhandle'),
    url(r'^user/login$', LoginView.as_view(), name='login'),
    url(r'^user/Logout$', LogoutView.as_view(), name='logout'),

    # 个人中心
    url(r'^account/base.html$', AccountView.as_view(), name='account'),
    url(r'^account/accountchange$', AccountChangeView.as_view(), name='accountchange'),

    # 信息录入
    url(r'^manage/goodsinput.html$', GoodsInputView.as_view(), name='goodsinput'),
    url(r'^manage/partsinput.html$', PartsInputView.as_view(), name='partsinput'),

    # 商品
    url(r'^goods/(?P<type>\w+)/', GoodslistView.as_view(), name='goodslist'),
    url(r'^goodsdetail/(?P<identifier>\S+)\.html', GoodsDetailView.as_view(), name='goodsdetail-search'),
    url(r'^goodsdetail/goodscontentadd', GoodsContentAddView.as_view(), name='goodscontentadd'),
    url(r'^goodsdetail/goodsaddcart', GoodsAddCartView.as_view(), name='goodsaddcart'),

    # 商品
    url(r'^cart\.html', CartView.as_view(), name='cart'),
    url(r'^cart/(?P<cartid>\d+)', DeleteCartView.as_view(), name='cartdel'),

    # 订单
    url(r'^order\.html', OrderView.as_view(), name='order'),
    url(r'^order/createorder', CreateOrderView.as_view(), name='createorder'),
]
