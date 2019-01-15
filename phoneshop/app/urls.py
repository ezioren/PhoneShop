# -*- conding: utf-8 -*-
from django.conf.urls import url
from .views.index import IndexView

view_urls = [
    url(r'^', IndexView.as_view(), name='index'),
]