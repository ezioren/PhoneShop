# -*- conding: utf-8 -*-
from django.conf.urls import url
from .views.index import BaseView, IndexView
from .views.user.login import LoginView, LoginhandleView
from .views.user.register import RegisterView, RegisterHandleView

view_urls = [
    url(r'^$', BaseView.as_view(), name='base'),
    url(r'^index$', IndexView.as_view(), name='index'),

    # 用户相关
    url(r'^user/register$', RegisterView.as_view(), name='register'),
    url(r'^user/registerhandle$', RegisterHandleView.as_view(), name='registerhandle'),
    url(r'^user/login$', LoginView.as_view(), name='login'),
    url(r'^user/loginhandle$', LoginhandleView.as_view(), name='loginhandle'),
]
