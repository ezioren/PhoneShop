'''
    创建一个myapp/models/目录，目录下放一个init.py和存储models的多个文件。你必须在init.py中导入所有的model.
'''
from app.models.goods.goods import GoodsInfo, CompanyInfo
from app.models.goods.guanggao import AdvertisementInfo
from app.models.user.users import UserInfo, UserAddressInfo
