# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2019-04-24 17:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0011_auto_20190424_1605'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goodsdetail',
            name='pic',
            field=models.ImageField(upload_to='images/'),
        ),
    ]