#-*- coding:utf-8 -*-
# author:reyn
# datetime:19-3-12 下午4:05
# software: PyCharm

def check_login(func):
    def wrapper(*args, **kwargs):
        session = args[1].session.get('username', False)
        if session :
            kwargs['is_login']=True
            kwargs['username']=session
        else:
            kwargs['is_login']=False
        return func(*args, **kwargs)
    return wrapper