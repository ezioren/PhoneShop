# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2019-04-26 11:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0017_auto_20190426_1140'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goods',
            name='isDelete',
            field=models.BooleanField(default=False),
        ),
    ]
