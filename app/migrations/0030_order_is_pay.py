# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2019-05-09 04:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0029_auto_20190509_0438'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='is_pay',
            field=models.BooleanField(default=False),
        ),
    ]
