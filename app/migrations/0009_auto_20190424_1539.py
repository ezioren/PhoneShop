# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2019-04-24 14:38
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0008_auto_20190424_1438'),
    ]

    operations = [
        migrations.AddField(
            model_name='goods',
            name='identifier',
            field=models.CharField(max_length=20),
        ),
    ]
