# -*- coding:utf-8 -*-
# author:reyn
# datetime:2019/4/29 下午1:50
# software: PyCharm
import re

class TransDbData():
    def trans(self, targets):
        result = {}
        for target in targets:
            result['color{}'.format(target.id)] = re.findall('\'(.*?)\'', target.goodsdetail.color)
            result['version{}'.format(target.id)] = re.findall('\'(.*?)\'', target.goodsdetail.version)
        return result

    def trans_for_one(self, targets):
        result = {}
        for target in targets:
            result['color'] = re.findall('\'(.*?)\'', target.goodsdetail.color)
            result['version'] = re.findall('\'(.*?)\'', target.goodsdetail.version)
        return result
