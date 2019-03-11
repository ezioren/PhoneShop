#!/usr/bin/env bash
django-admin.py makemessages -l en -e html,htm,py,txt --ignore=static/* --ignore=media/* --ignore=docs/* --ignore=bin/* --ignore=app/fixtures/* --ignore=app/migrations/* --ignore=app/static/build/*

django-admin.py makemessages -l ja -e html,htm,py,txt --ignore=static/* --ignore=media/* --ignore=docs/* --ignore=bin/* --ignore=app/fixtures/* --ignore=app/migrations/* --ignore=app/static/build/*

django-admin.py makemessages -l zh_CN -e html,htm,py,txt --ignore=static/* --ignore=media/* --ignore=docs/* --ignore=bin/* --ignore=app/fixtures/* --ignore=app/migrations/* --ignore=app/static/build/*

msgattrib --clear-fuzzy -o ./locale/ja/LC_MESSAGES/django.po ./locale/ja/LC_MESSAGES/django.po
msgattrib --clear-fuzzy -o ./locale/zh_CN/LC_MESSAGES/django.po ./locale/zh_CN/LC_MESSAGES/django.po
