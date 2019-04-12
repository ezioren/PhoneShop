# -*- conding: utf-8 -*-
from django.conf.urls import url
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from rest_framework.routers import DefaultRouter

from app.urls import view_urls

router = DefaultRouter()

urlpatterns = [
    url(r'^admin/', admin.site.urls),
]

# api
urlpatterns += [
    # goods
]

# app.urls
urlpatterns += view_urls

urlpatterns += staticfiles_urlpatterns()