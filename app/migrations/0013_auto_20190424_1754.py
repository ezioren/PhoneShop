# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2019-04-24 17:54
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0012_auto_20190424_1742'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsPic',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('src', models.ImageField(upload_to='images/')),
                ('good', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='app.Goods')),
            ],
        ),
        migrations.RemoveField(
            model_name='goodsdetail',
            name='pic',
        ),
    ]