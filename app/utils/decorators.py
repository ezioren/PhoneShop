#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-3-12 下午4:05
# software: PyCharm
import settings

def check_login(func):
    def wrapper(*args, **kwargs):
        user = args[1].user.is_authenticated
        if user:
            kwargs['is_login']=True
        else:
            kwargs['is_login']=False
        return func(*args, **kwargs)
    return wrapper