#!/usr/bin/env bash
django-admin.py makemessages -l en -e html,htm,py

django-admin.py makemessages -l zh_CN -e html,htm,py

msgattrib --clear-fuzzy -o ./locale/zh_CN/LC_MESSAGES/django.po ./locale/zh_CN/LC_MESSAGES/django.po
