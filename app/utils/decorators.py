#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-3-12 下午4:05
# software: PyCharm
import settings

def check_login(func):
    def wrapper(*args, **kwargs):
        session = args[1].session.get('is_login')
        kwargs['username'] = None
        if session:
            kwargs['is_login']=True
            kwargs['username']=args[1].session.get('username')
        else:
            kwargs['is_login']=False
        return func(*args, **kwargs)
    return wrapper