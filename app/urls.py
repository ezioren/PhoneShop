# -*- conding: utf-8 -*-
from django.conf.urls import url
from .views.index import IndexView
from .views.login import LoginView
from .views.register import RegisterView

view_urls = [
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^login$', LoginView.as_view(), name='login'),
    url(r'^register$', RegisterView.as_view(), name='register'),
]