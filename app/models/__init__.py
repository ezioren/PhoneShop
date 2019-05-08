'''
    创建一个myapp/models/目录，目录下放一个init.py和存储models的多个文件。你必须在init.py中导入所有的model.
'''
from app.models.goods.goods import Goods
from app.models.goods.goodsDetail import GoodsDetail, GoodsContent, GoodsPic
from app.models.goods.company import Company
from app.models.goods.guanggao import AdvertisementInfo
from app.models.user.users import MyUser
from app.models.user.profile import Profile
from app.models.cart.cart import Cart
from app.models.order.order import Order, Orderinfo