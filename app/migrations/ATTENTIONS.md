### 更改模型类手段 ###

首先创建一个新的migration
python manage.py makemigrations --empty app

然后修改并增加（复制相应的model）
from django.db import migrations, models

operations = [
        migrations.xxField(
            model_name='模型名', 
            name='字段名',
            field=类型,
        ),
    ]

然后python manage.py migrate
