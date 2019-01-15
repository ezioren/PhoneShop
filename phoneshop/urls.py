# -*- conding: utf-8 -*-
from django.conf.urls import url, include
from django.contrib import admin

from phoneshop.app import urls
urlpatterns = [
    url(r'^admin/', admin.site.urls),
]

urlpatterns += urls.view_urls
