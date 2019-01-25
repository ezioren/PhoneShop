# -*- conding: utf-8 -*-
from django.conf.urls import url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

from app.urls import view_urls

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]

urlpatterns += view_urls

urlpatterns += staticfiles_urlpatterns()