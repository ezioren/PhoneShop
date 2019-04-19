# -*- conding: utf-8 -*-
from django.conf.urls import url
from .views.index import HomeView, IndexView
from .views.user.login import LoginView, LogoutView
from .views.user.register import RegisterView, RegisterHandleView
from .views.account.account import AccountView, AccountChangeView

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
    url(r'^account/accountchange$', AccountChangeView.as_view(), name='Accountchange'),

]
