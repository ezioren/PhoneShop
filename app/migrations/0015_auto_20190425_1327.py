# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2019-04-25 13:27
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0014_auto_20190425_1142'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='goodspic',
            name='src',
        ),
        migrations.AddField(
            model_name='goodspic',
            name='pic0',
            field=models.CharField(max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='goodspic',
            name='pic1',
            field=models.CharField(max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='goodspic',
            name='pic2',
            field=models.CharField(max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='goodspic',
            name='pic3',
            field=models.CharField(max_length=1000, null=True),
        ),
        migrations.AddField(
            model_name='goodspic',
            name='pic4',
            field=models.CharField(max_length=1000, null=True),
        ),
    ]
