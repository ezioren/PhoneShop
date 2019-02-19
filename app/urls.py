# -*- conding: utf-8 -*-
from django.conf.urls import url
from .views.index import IndexView
from .views.user.login import LoginView
from .views.user.register import RegisterView, RegisterHandleView

view_urls = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^user/login$', LoginView.as_view(), name='login'),

    # 用户相关
    url(r'^user/register$', RegisterView.as_view(), name='register'),
    url(r'^user/registerhandle$', RegisterHandleView.as_view(), name='registerhandle'),
]