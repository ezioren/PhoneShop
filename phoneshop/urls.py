# -*- conding: utf-8 -*-
from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from phoneshop.app import urls

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]

urlpatterns += urls.view_urls

urlpatterns += staticfiles_urlpatterns()