SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `app_advertisementinfo` (
  `id` int(11) NOT NULL,
  `adv_name` varchar(20) NOT NULL,
  `adv_pic` varchar(100) NOT NULL,
  `adv_content` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `app_company` (
  `id` int(11) NOT NULL,
  `companyname` varchar(20) NOT NULL,
  `indexweb` varchar(10000) NOT NULL,
  `context` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `app_company` (`id`, `companyname`, `indexweb`, `context`) VALUES
(1, '华为', '', ''),
(2, '小米', '', ''),
(3, 'vivo', '', ''),
(4, 'oppo', '', ''),
(5, '三星', '', ''),
(6, '苹果', '', ''),
(7, '魅族', '', '');

CREATE TABLE `app_goods` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `click` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `cp_id` int(11) NOT NULL,
  `identifier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `app_goods` (`id`, `name`, `price`, `type`, `click`, `isDelete`, `cp_id`, `identifier`) VALUES
(3, '小米 9', '3299.00', 'New', 0, 0, 2, 'xm-9-201904261135'),
(11, '红米 Note7', '1199.00', 'New', 0, 0, 2, 'xm-hmN7-201901261505'),
(12, '小米8SE', '1399.00', 'New', 0, 0, 2, 'xm-8SE-201904261524'),
(13, '小米6A', '649.00', 'Cost', 0, 0, 2, 'xm-6A-201904261530'),
(14, '小米MIX2S', '2699.00', 'Cost', 0, 0, 2, 'xm-mix2S-201904261545'),
(16, '小米Mix3', '3299.00', 'New', 0, 0, 2, 'xm-mix3-201904261553'),
(17, '紫米', '469.00', 'Classic', 0, 0, 2, 'xm-zimi-201904261559'),
(18, '米兔定位电话', '169.00', 'Parts', 0, 0, 2, 'xm-mitu-201904261700'),
(19, '荣耀V20', '2798.00', 'New', 0, 0, 1, 'hw-v20-201904280916'),
(20, '华为P30', '3988.00', 'New', 0, 0, 1, 'hw-p30-201904281124'),
(21, '荣耀8X', '1299.00', 'Cost', 0, 0, 1, 'hw-honor8x-201904281147'),
(22, '荣耀10青春版', '1299.00', 'Cost', 0, 0, 1, 'hw-honor10-201904281153'),
(23, '华为Mate 20', '3999', 'New', 0, 0, 1, 'hw-meta20-201904281230'),
(24, '荣耀畅玩7', '599', 'Cost', 0, 0, 1, 'hw-honorCW7-201904281235'),
(25, '荣耀5c ', '988', 'Classic', 0, 0, 1, 'hw-honor5c-201904281243'),
(26, '荣耀 V8 ', '1428.00', 'Cost', 0, 0, 1, 'hw-honorv8-201904281332'),
(27, ' 华为畅享9e', '999.80', 'Classic', 0, 0, 1, 'hw-cx9e-201904281339'),
(28, '麦芒6', '1179.00', 'Classic', 0, 0, 1, 'hw-mm6-201904281345'),
(29, '华为nova 2s', '1328', 'Classic', 0, 0, 1, 'hw-nova2s-201904281412'),
(30, 'vivo iQOO', '3298', 'New', 0, 0, 3, 'vivo-iqoo-201904281419'),
(31, 'vivo U1', '1099.00', 'Cost', 0, 0, 3, 'vivo-u1-201904281426'),
(32, 'vivo S1', '2298.00', 'New', 0, 0, 3, 'vivo-s1-201904281434'),
(33, 'vivo X27', '3598.00', 'New', 0, 0, 3, 'vivo-x27-201904281437'),
(34, 'vivo NEX 双屏版', '4998.00', 'Cost', 0, 0, 3, 'vivo-nex-201904281448'),
(35, 'vivo X20', '1498.00', 'Classic', 0, 0, 3, 'vivo-x20-201904281453'),
(36, 'vivo X21', '2498.00', 'Cost', 0, 0, 3, 'vivo-x21-201904281500'),
(37, 'vivo Z3', '1348.00', 'Classic', 0, 0, 3, 'vivo-z3-201904281503'),
(38, 'OPPO Reno', '2999.00', 'New', 0, 0, 4, 'oppo-reno-201904281511'),
(39, 'OPPO K1', '1399.00', 'Cost', 0, 0, 4, 'oppo-k1-201904281521'),
(40, 'OPPO R17', '2399.00', 'Cost', 0, 0, 4, 'oppo-r17-201904281524'),
(41, 'OPPO A5', '999', 'Classic', 0, 0, 4, 'oppo-a5-2019042815259'),
(42, 'OPPO A7x', '1599.00', 'Cost', 0, 0, 4, 'oppo-a7x-201904281532'),
(43, 'OPPO  R15x', '1999.00', 'Classic', 0, 0, 4, 'oppo-r15x-201904281537'),
(44, 'Apple iPhone XR', '5699.00', 'New', 0, 0, 6, 'apple-xr-201904281543'),
(45, 'Apple iPhone 8', '3799.00', 'New', 0, 0, 6, 'apple-i8-201904281548'),
(46, 'Apple iPhone 7', '3199.00', 'Cost', 0, 0, 6, 'apple-i7-201904281551'),
(47, 'Apple iPhone 6s', '2999.00', 'Classic', 0, 0, 6, 'apple-i6-201904281557'),
(48, '三星 Galaxy S10', '4999.00', 'New', 0, 0, 5, 'sansung-gs10-201904281603'),
(49, '三星 Galaxy A8s', '2499.00', 'New', 0, 0, 5, 'sansung-ga8s-201904281607'),
(50, '三星 Galaxy Note8', '4299.00', 'Cost', 0, 0, 5, 'sansung-note8-201904281615'),
(52, '三星 Galaxy Folder2', '1299.00', 'Classic', 0, 0, 5, 'sansung-folder2-201904281618'),
(53, '魅族 16s ', '3198.00', 'New', 0, 0, 7, 'meizu-16s-201904281624'),
(54, '魅族 V8 ', '749', 'Cost', 0, 0, 7, 'meizu-v8-201904281630'),
(55, '华为原装数据线/充电线', '25.00', 'Parts', 0, 0, 1, 'huawei-typec-201904281651'),
(56, '华为p30手机壳', '39.00', 'Parts', 0, 0, 1, 'huawei-p30bft-201904281654'),
(57, 'PAENQEAR 吃鸡神器', '58.00', 'Parts', 0, 0, 2, 'xiaomi-cjsq-201904281658'),
(58, '华为（HUAWEI）充电宝/移动电源', '229.00', 'Parts', 0, 0, 1, 'huawei-cdb-201904281700'),
(59, '华为耳机原装半入耳式', '38.00', 'Parts', 0, 0, 1, 'huawei-erji-201904281702'),
(60, 'Apple  EarPods 耳机', '229.00', 'Parts', 0, 0, 6, 'apple-erji-201904281705'),
(61, 'OPPO原装闪充充电正品', '99.00', 'Parts', 0, 0, 4, 'oppo-cdx-201904281708'),
(62, '【vivo官方原装】耳机正品手机耳塞', '39.00', 'Parts', 0, 0, 3, 'vivo-erji-201904281712'),
(63, '三星 无线运动耳机', '399.00', 'Parts', 0, 0, 5, 'sansung-erji-201904281714');

CREATE TABLE `app_goodscontent` (
  `id` int(11) NOT NULL,
  `content` varchar(200) NOT NULL,
  `user_source` varchar(200) NOT NULL,
  `grade` varchar(200) NOT NULL,
  `good_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `app_goodsdetail` (
  `id` int(11) NOT NULL,
  `context` varchar(200) NOT NULL,
  `color` varchar(1000) NOT NULL,
  `version` varchar(1000) NOT NULL,
  `good_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `parttype` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `app_goodsdetail` (`id`, `context`, `color`, `version`, `good_id`, `stock`, `parttype`) VALUES
(2, '小米9 4800万超广角三摄 骁龙855 全网通4G 双卡双待 水滴全面屏拍照游戏智能手机', '[\'幻彩蓝\', \'幻彩紫\', \'深空灰\']', '[\'6GB+128GB\', \'8GB+128GB\']', 3, 1000, NULL),
(3, '小米 红米Redmi Note7 幻彩渐变AI双摄 全网通4G 双卡双待 水滴全面屏拍照游戏智能手机', '[\'梦幻蓝\', \'暮光金\', \'亮黑色\']', '[\'3GB+32GB\', \'4GB+64GB\', \'6GB+64GB\']', 11, 1000, NULL),
(4, '小米8SE 全面屏智能游戏拍照手机 6GB+64GB 灰色 骁龙710处理器 全网通4G 双卡双待', '[\'灰\', \'红\', \'金\', \'蓝\']', '[\'6GB+64GB\', \'6GB+128GB\']', 12, 10000, NULL),
(5, '小米 红米6A AI美颜 全网通4G手机 双卡双待', '[\'铂银灰\', \'流沙金\', \'樱花粉\', \'巴厘蓝\']', '[\'2GB+16GB\', \'3GB+32GB\']', 13, 2000, NULL),
(6, '小米MIX2S 全面屏游戏拍照手机 骁龙845处理器 全网通4G 陶瓷手机', '[\'黑\', \'白\']', '[\'6GB+128GB\', \'8GB+256GB\']', 14, 3200, NULL),
(7, '小米Mix3 骁龙845 全网通4G 双卡双待 全面屏拍照游戏智能手机', '[\'黑\', \'宝石蓝\', \'皓月白\']', '[\'6GB+128GB\', \'8GB+128GB\', \'8GB+258GB\']', 16, 1500, NULL),
(8, 'ZMI 紫米旅行助手翻译路由手机内置小米小爱同学双卡双待实时翻译老人机儿童电话 紫米手机 黑色', '[\'黑\']', '[\'无\']', 17, 10000, NULL),
(9, '米兔定位电话 防丢GPS定位器 车辆防盗器 儿童老人微型跟踪器 追踪器 高精度实时位置查看', '[\'白\']', '[\'无\']', 18, 1500, NULL),
(10, '荣耀V20 胡歌同款 麒麟980芯片 魅眼全视屏 4800万深感相机 移动联通电信4G全面屏手机', '[\'幻影红\', \'魅力红\', \'魅海蓝\', \'幻夜黑\']', '[\'6GB+128GB（全网通）\', \'8GB+256GB（全网通）\']', 19, 1516, NULL),
(11, '华为 HUAWEI P30 超感光徕卡三摄 麒麟980AI智能芯片 全面屏 屏内指纹版手机 全网通双4G手机', '[\'亮黑色\', \'极光色\', \'天空之境\', \'珠光贝母\']', '[\'8GB+64GB\', \'8GB+128GB\']', 20, 1900, NULL),
(12, '荣耀8X 千元屏霸 91%屏占比 2000万AI双摄 移动联通电信4G全面屏手机 双卡双待', '[\'幻夜黑\', \'魅海蓝\', \'魅焰红\', \'梦幻紫\']', '[\'4GB+64GB\', \'6GB+64GB\', \'6GB+128GB\']', 21, 9000, NULL),
(13, '荣耀10青春版 幻彩渐变 2400万AI自拍 全网通版4 移动联通电信4G全面屏手机 双卡双待', '[\'幻夜黑\', \'渐变蓝\', \'渐变红\', \'铃兰白\']', '[\'4GB+64GB\', \'6GB+64GB\', \'6GB+128GB\']', 22, 222, NULL),
(14, '华为 HUAWEI Mate 20 麒麟980AI智能芯片全面屏超微距影像超大广角徕卡三摄 全网通版双4G手机', '[\'亮黑色\', \'宝石蓝\', \'翡翠绿\', \'极光色\']', '[\'6GB+128GB\', \'6GB+64GB\']', 23, 12355, NULL),
(15, '荣耀 畅玩7 全网通4G手机 双卡双待', '[\'黑色\', \'蓝色\', \'金色\']', '[\'4GB+64GB\']', 24, 1100, NULL),
(16, '华为 荣耀5c 畅玩5C 4G智能手机 双卡双待 暗夜灰 全网通版', '[\'暗夜灰\', \'落日金\', \'太空银\']', '[\'3GB+32GB\', \'2GB+16GB\']', 25, 10000, NULL),
(17, '荣耀 V8 移动联通电信全网通4G手机 双卡双待 指纹识别NFC5.7英寸 银色（1080P） 全网通4+64GB', '[\'典雅灰\', \'玫瑰金\', \'香槟金\', \'银色\']', '[\'4GB+32GB\', \'4GB+64GB\']', 26, 10005, NULL),
(18, '华为畅享9e手机【现货速发 原装正品】', '[\'宝石蓝\', \'幻夜黑\', \'琥珀棕\']', '[\'4GB+32GB\']', 27, 10000, NULL),
(19, '华为（HUAWEI） 麦芒6 手机 ', '[\'极光蓝\', \'流光金\', \'曜石黑\']', '[\'4GB+32GB\']', 28, 200, NULL),
(20, '华为（HUAWEI） 华为nova 2s 手机', '[\'樱粉金\', \'曜石黑\', \'浅艾蓝\']', '[\'4GB+64GB\', \'4GB+64GB\']', 29, 10000, NULL),
(21, '【KPL官方比赛用机】vivo iQOO 全面屏拍照手机 骁龙855电竞游戏 全网通4G手机', '[\'电光蓝\', \'熔岩橙\', \'武士黑\']', '[\'8GB+128GB\', \'12GB+128GB\']', 30, 5000, NULL),
(22, 'vivo【限时直降100元】U1全面屏 AI智慧拍照 双卡双待 4G全网通 大电量智能手机', '[\'星空黑\', \'极光色\', \'极光红\']', '[\'3GB+32GB\', \'4GB+64GB\']', 31, 11000, NULL),
(23, 'vivo S1 2480万AI高清自拍 超广角后置三摄拍照手机 移动联通电信全网通4G手机', '[\'冰湖蓝\', \'宠爱粉\']', '[\'6GB+128GB\', \'4GB+128GB\', \'6GB+64GB\']', 32, 5600, NULL),
(24, 'vivo X27 大内存 4800万AI三摄全面屏拍照手机 移动联通电信全网通4G手机', '[\'雀羽蓝\', \'粉黛金\']', '[\'8GB+256GB\', \'8GB+128GB\']', 33, 6000, NULL),
(25, 'vivo NEX 双屏版 AI三摄 游戏手机 移动联通电信全网通4G手机', '[\'冰原蓝\', \'星漾紫\']', '[\'10GB+128GB\', \'8GB+256GB\']', 34, 100, NULL),
(26, 'vivo 【移动全网通版】X20 全面屏手机 全网通 移动联通电信4G手机 【移动全网通版本】', '[\'磨砂黑\']', '[\'4GB+64GB\']', 35, 1033, NULL),
(27, 'vivo X21 全面屏 双摄拍照游戏手机 移动联通电信全网通4G手机 双卡双待', '[\'极光白\']', '[\'6GB+64GB\']', 36, 3000, NULL),
(28, 'vivo Z3 性能实力派 全面屏游戏手机 移动联通电信全网通4G手机', '[\'星夜黑\', \'极光蓝\', \'梦幻粉\']', '[\'4GB+64GB\', \'6GB+64GB\', \'6GB+128GB\']', 37, 10000, NULL),
(29, 'OPPO Reno 全面屏拍照手机 全网通 移动联通电信 双卡双待手机', '[\'极夜黑\', \'星云紫\']', '[\'6GB+128GB\', \'6GB+256GB\', \'8GB+256GB\']', 38, 5000, NULL),
(30, 'OPPO K1 光感屏幕指纹 水滴屏拍照手机 全网通 移动联通电信4G 双卡双待手机', '[\'墨玉黑\', \'摩卡红\', \'银光绿\']', '[\'4GB+64GB\', \'6GB+64GB\']', 39, 5220, NULL),
(31, 'OPPO R17 2500万美颜拍照 6.4英寸水滴屏 光感屏幕指纹 全网通 移动联通电信4G 双卡双待手机', '[\'霓光紫\', \'流光蓝\']', '[\'6GB+128GB\', \'8GB+128GB\']', 40, 100, NULL),
(32, 'OPPO A5 全面屏拍照手机 全网通 移动联通电信4G 双卡双待手机', '[\'珊瑚红\', \'凝夜紫\']', '[\'3GB+32GB\', \'3GB+64GB\', \'4GB+64GB\']', 41, 1000, NULL),
(33, 'OPPO A7x 全面屏拍照手机 全网通 移动联通电信4G 双卡双待手机', '[\'雾松青\', \'冰焰蓝\', \'星空紫\']', '[\'4GB+128GB\', \'4GB+64GB\']', 42, 2000, NULL),
(34, 'OPPO R15x 屏下指纹水滴全面屏 ', '[\'冰萃银\', \'星云渐变\']', '[\'6GB+128GB\']', 43, 3000, NULL),
(35, 'Apple iPhone XR (A2108) 移动联通电信4G手机 双卡双待', '[\'黑色\', \'蓝色\', \'白色\', \'黄色\']', '[\'内存64GB\', \'内存128GB\', \'内存256GB\']', 44, 2000, NULL),
(36, 'Apple iPhone 8 (A1863) 移动联通电信4G手机', '[\'银色\', \'金色\', \'深空灰\']', '[\'内存64GB\', \'内存256GB\']', 45, 3000, NULL),
(37, 'Apple iPhone 7 (A1660) 移动联通电信4G手机', '[\'金色\', \'玫瑰金\', \'黑色\', \'灰色\']', '[\'内存128GB\']', 46, 2000, NULL),
(38, 'Apple iPhone 6s Plus (A1699) 移动联通电信4G手机', '[\'金色\', \'银色\', \'深空灰\', \'玫瑰金\']', '[\'128GB\']', 47, 1000, NULL),
(39, '三星 Galaxy S10e（SM-G9700）超感官全视屏 骁龙855 双卡双待 全网通4G手机', '[\'皓玉白\', \'沁柠黄\', \'碳晶黑\']', '[\'6GB+128GB\', \'8BG+128GB\']', 48, 10000, NULL),
(40, '三星 Galaxy A8s（SM-G8870）黑瞳全视屏手机 骁龙710芯片 后置三摄 全网通4G 双卡双待', '[\'外星银\', \'情人节限定\', \'极光黑\', \'外星银\']', '[\'6GB+128GB\', \'8GB+128GB\']', 49, 2000, NULL),
(41, '三星 Galaxy Note8（SM-N9500）智能双摄|IP68级防尘防水 全网通4G 游戏手机 双卡双待', '[\'旷野灰\', \'迷夜黑\']', '[\'6GB+256GB\', \'6GB+128GB\']', 50, 1000, NULL),
(42, '三星 Galaxy Folder2 （SM-G1650）2GB+16GB 帕托金 移动联通电信4G翻盖手机 双卡双待', '[\'帕托金\']', '[\'2GB+16GB\']', 52, 1000, NULL),
(43, '魅族 16s 骁龙855全面屏拍照游戏手机 全网通移动联通电信4G手机 双卡双待', '[\'凝光白 \', \'碳纤黑\']', '[\'6GB+128GB\', \'8GB+128GB\']', 53, 20000, NULL),
(44, '魅族 V8 全面屏手机 全网通移动联通电信4G手机 双卡双待', '[\'灰蓝\', \'曜黑\', \'雅金\', \'烟紫\']', '[\'4GB+64GB\', \'3GB+32GB\']', 54, 1000, NULL),
(45, '华为原装数据线/充电线快速Type-C转接头 Type-c 【数据线】3A 1米 盒装', '[\'白色\']', '[\'3米 TypeC转换头\']', 55, 1000, '充电线'),
(46, '亿色(ESR)华为p30手机壳 p30玻璃壳超薄透明外壳 华为p30保护套女款 p30硅胶软边全包防摔硬壳女男【剔透白】', '[\'剔透白\']', '[\'p30\', \'p30pro\']', 56, 500, '保护套'),
(47, 'PAENQEAR 吃鸡神器 游戏手柄刺激战场荒野行动手机键盘鼠标外设四指辅苹果安卓绝地求生物理外挂 【一体式散热吃鸡神器】不挡屏 秒开枪', '[\'黑色\']', '[\'不挡屏、秒开抢\']', 57, 100, '其他'),
(48, '华为（HUAWEI）充电宝/移动电源 SuperCharge 4.5V5A快充版 曜石黑 适用于华为Mate20/P20系列等AP09S', '[\'黑色\']', '[\'22.5w\', \'40w\']', 58, 100, '充电宝'),
(49, '华为耳机原装半入耳式有线荣耀mate9/8x/p10plus/v10nova2s9iv9p9play 【标准版】华为AM115 白色-热卖款', '[\'白色\']', '[\'标准版\', \'加长版\']', 59, 1000, '耳机'),
(50, 'Apple 采用Lightning/闪电接头的 EarPods 耳机', '[\'白色\']', '[\'Lightning/闪电接头\', \'3.5毫米插头\']', 60, 1000, '耳机'),
(51, 'OPPO原装闪充充电器正品 r7 r9s r11s plus r15充电器数据线套装快充充电器 新款闪充充电套装【闪充充电头+闪充数据线】', '[\'白色\']', '[\'原装\']', 61, 100, '充电线'),
(52, '【vivo官方原装】耳机正品手机耳塞X21X20X7X9X6 plus vivoy67 y66 z1 灰白色 带话筒重低音', '[\'白色\']', '[\'原装\']', 62, 102, '耳机'),
(53, '三星（SAMSUNG）U Flex 弹力项圈蓝牙无线运动耳机（黑色） 颈挂式 磁吸入耳式 手机音乐游戏耳机', '[\'黑色\', \'蓝色\']', '[\'柔性\', \'\']', 63, 100, '耳机');

CREATE TABLE `app_goodspic` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `pic0` varchar(1000) DEFAULT NULL,
  `pic1` varchar(1000) DEFAULT NULL,
  `pic2` varchar(1000) DEFAULT NULL,
  `pic3` varchar(1000) DEFAULT NULL,
  `pic4` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `app_goodspic` (`id`, `good_id`, `pic0`, `pic1`, `pic2`, `pic3`, `pic4`) VALUES
(2, 3, 'images/goods/xiaomi/xiaomi9/xiaomi9-00.jpg', 'images/goods/xiaomi/xiaomi9/xiaomi9-01.jpg', 'images/goods/xiaomi/xiaomi9/xiaomi9-02.jpg', 'images/goods/xiaomi/xiaomi9/xiaomi9-03.jpg', NULL),
(3, 11, 'images/goods/xiaomi/hongminote7/hongminote7-00.jpg', 'images/goods/xiaomi/hongminote7/hongminote7-01.jpg', 'images/goods/xiaomi/hongminote7/hongminote7-02.jpg', 'images/goods/xiaomi/hongminote7/hongminote7-03.jpg', NULL),
(4, 12, 'images/goods/xiaomi/xiaomi8SE/xiaomi8SE-00.jpg', 'images/goods/xiaomi/xiaomi8SE/xiaomi8SE-01.jpg', 'images/goods/xiaomi/xiaomi8SE/xiaomi8SE-02.jpg', 'images/goods/xiaomi/xiaomi8SE/xiaomi8SE-03.jpg', NULL),
(5, 13, 'images/goods/xiaomi/xiaomi6A/xiaomi6a-hui.jpg', 'images/goods/xiaomi/xiaomi6A/xiaomi6a-jin.jpg', 'images/goods/xiaomi/xiaomi6A/xiaomi6a-pink.jpg', 'images/goods/xiaomi/xiaomi6A/xiaomi6a-blue.jpg', NULL),
(6, 14, 'images/goods/xiaomi/xiaomimix2S/xiaomimix2S-00.jpg', 'images/goods/xiaomi/xiaomimix2S/xiaomimix2S-01.jpg', 'images/goods/xiaomi/xiaomimix2S/xiaomimix2S-02.jpg', 'images/goods/xiaomi/xiaomimix2S/xiaomimix2S-03.jpg', NULL),
(7, 16, 'images/goods/xiaomi/xiaomimix3/xiaomimix3-00.jpg', 'images/goods/xiaomi/xiaomimix3/xiaomimix3-01.jpg', 'images/goods/xiaomi/xiaomimix3/xiaomimix3-02.jpg', 'images/goods/xiaomi/xiaomimix3/xiaomimix3-03.jpg', NULL),
(8, 17, 'images/goods/xiaomi/xiaomizimi/zimi-00.jpg', 'images/goods/xiaomi/xiaomizimi/zimi-01.jpg', 'images/goods/xiaomi/xiaomizimi/zimi-02.jpg', 'images/goods/xiaomi/xiaomizimi/zimi-03.jpg', NULL),
(9, 18, 'images/goods/peijian/other/xiaomimitu/xiaomimitu-00.jpg', 'images/goods/peijian/other/xiaomimitu/xiaomimitu-01.jpg', 'images/goods/peijian/other/xiaomimitu/xiaomimitu-02.jpg', 'images/goods/peijian/other/xiaomimitu/xiaomimitu-03.jpg', NULL),
(10, 19, 'images/goods/huawei/huaweiv20/huaweiv20-bigred.jpg', 'images/goods/huawei/huaweiv20/huaweiv20-red.jpg', 'images/goods/huawei/huaweiv20/huaweiv20-blue.jpg', 'images/goods/huawei/huaweiv20/huaweiv20-black.jpg', NULL),
(11, 20, 'images/goods/huawei/huaweip30/huaweip30-black.jpg', 'images/goods/huawei/huaweip30/huaweip30-ji.jpg', 'images/goods/huawei/huaweip30/huaweip30-tian.jpg', 'images/goods/huawei/huaweip30/huaweip30-zheng.jpg', NULL),
(12, 21, 'images/goods/huawei/honor8x/honor8x-black.jpg', 'images/goods/huawei/honor8x/honor8x-blue.jpg', 'images/goods/huawei/honor8x/honor8x-red.jpg', 'images/goods/huawei/honor8x/honor8x-violet.jpg', NULL),
(13, 22, 'images/goods/huawei/honor10/honor10-black.jpg', 'images/goods/huawei/honor10/honor10-blue.jpg', 'images/goods/huawei/honor10/honor10-red.jpg', 'images/goods/huawei/honor10/honor10-white.jpg', NULL),
(14, 23, 'images/goods/huawei/huaweimeta20/huaweimeta20-black.jpg', 'images/goods/huawei/huaweimeta20/huaweimeta20-blue.jpg', 'images/goods/huawei/huaweimeta20/huaweimeta20-fei.jpg', 'images/goods/huawei/huaweimeta20/huaweimeta20-ji.jpg', NULL),
(15, 24, 'images/goods/huawei/honorcw7/huaweihonorcw7-black.jpg', 'images/goods/huawei/honorcw7/huaweihonorcw7-blue.jpg', 'images/goods/huawei/honorcw7/huaweihonorcw7-jin.jpg', '', NULL),
(16, 25, 'images/goods/huawei/honor5c/huaweihonor5c-grey.jpg', 'images/goods/huawei/honor5c/huaweihonor5c-jin.jpg', 'images/goods/huawei/honor5c/huaweihonor5c-ying.jpg', '', NULL),
(17, 26, 'images/goods/huawei/honorv8/huaweihonorv8-grey.jpg', 'images/goods/huawei/honorv8/huaweihonorv8-jin.jpg', 'images/goods/huawei/honorv8/huaweihonorv8-pink.jpg', 'images/goods/huawei/honorv8/huaweihonorv8-ying.jpg', NULL),
(18, 27, 'images/goods/huawei/huaweicx9e/huaweicx9e-black.jpg', 'images/goods/huawei/huaweicx9e/huaweicx9e-blue.jpg', 'images/goods/huawei/huaweicx9e/huaweicx9e-hupo.jpg', '', NULL),
(19, 28, 'images/goods/huawei/huaweimm6/huaweimm6-black.jpg', 'images/goods/huawei/huaweimm6/huaweimm6-jin.jpg', 'images/goods/huawei/huaweimm6/huaweimm6-lan.jpg', '', NULL),
(20, 29, 'images/goods/huawei/huaweinova2s/huaweinova2s-black.jpg', 'images/goods/huawei/huaweinova2s/huaweinova2s-blue.jpg', 'images/goods/huawei/huaweinova2s/huaweinova2s-jin.jpg', '', NULL),
(21, 30, 'images/goods/vivo/iqoo/vivoiqoo-black.jpg', 'images/goods/vivo/iqoo/vivoiqoo-blue.jpg', 'images/goods/vivo/iqoo/vivoiqoo-orange.jpg', '', NULL),
(22, 31, 'images/goods/vivo/vivou1/vivou1-black.jpg', 'images/goods/vivo/vivou1/vivou1-ji.jpg', 'images/goods/vivo/vivou1/vivou1-red.jpg', '', NULL),
(23, 32, 'images/goods/vivo/vivos1/vivos1-blue.jpg', 'images/goods/vivo/vivos1/vivos1-blue2.jpg', 'images/goods/vivo/vivos1/vivos1-pink.jpg', 'images/goods/vivo/vivos1/vivos1-pink2.jpg', NULL),
(24, 33, 'images/goods/vivo/vivox27/vivox27-blue.jpg', 'images/goods/vivo/vivox27/vivox27-blue2.jpg', 'images/goods/vivo/vivox27/vivox27-pink.jpg', 'images/goods/vivo/vivox27/vivox27-pink2.jpg', NULL),
(25, 34, 'images/goods/vivo/vivonex/vivonex-blue.jpg', 'images/goods/vivo/vivonex/vivonex-blue2.jpg', 'images/goods/vivo/vivonex/vivonex-violet.jpg', 'images/goods/vivo/vivonex/vivonex-violet2.jpg', NULL),
(26, 35, 'images/goods/vivo/vivox20/vivox20-00.jpg', 'images/goods/vivo/vivox20/vivox20-01.jpg', 'images/goods/vivo/vivox20/vivox20-02.jpg', 'images/goods/vivo/vivox20/vivox20-03.jpg', NULL),
(27, 36, 'images/goods/vivo/vivox21/vivox21-00.jpg', 'images/goods/vivo/vivox21/vivox21-01.jpg', 'images/goods/vivo/vivox21/vivox21-02.jpg', 'images/goods/vivo/vivox21/vivox21-03.jpg', NULL),
(28, 37, 'images/goods/vivo/vivoz3/vivoz3-black.jpg', 'images/goods/vivo/vivoz3/vivoz3-blue.jpg', 'images/goods/vivo/vivoz3/vivoz3-pink.jpg', '', NULL),
(29, 38, 'images/goods/oppo/opporeno/opporeno-black.jpg', 'images/goods/oppo/opporeno/opporeno-violet.jpg', '', '', NULL),
(30, 39, 'images/goods/oppo/oppok1/oppok1-black.jpg', 'images/goods/oppo/oppok1/oppok1-red.jpg', 'images/goods/oppo/oppok1/oppok1-green.jpg', '', NULL),
(31, 40, 'images/goods/oppo/oppor17/oppor17-blue.jpg', 'images/goods/oppo/oppor17/oppor17-violet.jpg', '', '', NULL),
(32, 41, 'images/goods/oppo/oppoa5/oppoa5-red.jpg', 'images/goods/oppo/oppoa5/oppoa5-violet.jpg', '', '', NULL),
(33, 42, 'images/goods/oppo/oppoa7x/oppoa7x-blue.jpg', 'images/goods/oppo/oppoa7x/oppoa7x-qing.jpg', 'images/goods/oppo/oppoa7x/oppoa7x-violet.jpg', '', NULL),
(34, 43, 'images/goods/oppo/oppor15x/oppor15x-jian.jpg', 'images/goods/oppo/oppor15x/oppor15x-yin.jpg', '', '', NULL),
(35, 44, 'images/goods/apple/applexr/applexr-black.jpg', 'images/goods/apple/applexr/applexr-blue.jpg', 'images/goods/apple/applexr/applexr-white.jpg', 'images/goods/apple/applexr/applexr-yellow.jpg', NULL),
(36, 45, 'images/goods/apple/applei8/applei8-grey.jpg', 'images/goods/apple/applei8/applei8-jin.jpg', 'images/goods/apple/applei8/applei8-yin.jpg', '', NULL),
(37, 46, 'images/goods/apple/applei7/applei7-alljin.jpg', 'images/goods/apple/applei7/applei7-jin.jpg', 'images/goods/apple/applei7/applei7-black.jpg', 'images/goods/apple/applei7/applei7-grey.jpg', NULL),
(38, 47, 'images/goods/apple/applei6/applei6-alljin.jpg', 'images/goods/apple/applei6/applei6-jin.jpg', 'images/goods/apple/applei6/applei6-grey.jpg', 'images/goods/apple/applei6/applei6-yin.jpg', NULL),
(39, 48, 'images/goods/sansung/sansunggs10/sansunggs10-black.jpg', 'images/goods/sansung/sansunggs10/sansunggs10-white.jpg', 'images/goods/sansung/sansunggs10/sansunggs10-yellow.jpg', '', NULL),
(40, 49, 'images/goods/sansung/sansungga8s/sansungga8s-black.jpg', 'images/goods/sansung/sansungga8s/sansungga8s-blue.jpg', 'images/goods/sansung/sansungga8s/sansungga8s-pink.jpg', 'images/goods/sansung/sansungga8s/sansungga8s-yin.jpg', NULL),
(41, 50, 'images/goods/sansung/sansungnote8/sansungnote8-black.jpg', 'images/goods/sansung/sansungnote8/sansungnote8-pink.jpg', '', '', NULL),
(42, 52, 'images/goods/sansung/sangsungfolder2/sansungfolder2.jpg', '', '', '', NULL),
(43, 53, 'meizu16s-black.jpg', 'meizu16s-white.jpg', '', '', NULL),
(44, 54, 'images/goods/meizu/meizuv8-black.jpg', 'images/goods/meizu/meizuv8-blue.jpg', 'images/goods/meizu/meizuv8-jin.jpg', 'images/goods/meizu/meizuv8-violet.jpg', NULL),
(45, 55, 'images/goods/peijian/cdx/huaweitypec.png', '', '', '', NULL),
(46, 56, 'images/goods/peijian/bft/huaweip30-bft.jpg', '', '', '', NULL),
(47, 57, 'images/goods/peijian/other/chijishenqi.jpg', '', '', '', NULL),
(48, 58, 'images/goods/peijian/cdb/huaweicdb.jpg', '', '', '', NULL),
(49, 59, 'images/goods/peijian/erji/huaweierji.jpg', '', '', '', NULL),
(50, 60, 'images/goods/peijian/erji/appleerji.jpg', '', '', '', NULL),
(51, 61, 'images/goods/peijian/cdx/oppocdx.jpg', '', '', '', NULL),
(52, 62, 'images/goods/peijian/erji/vivoerji.png', '', '', '', NULL),
(53, 63, 'images/goods/peijian/erji/sansungerji-black.jpg', 'images/goods/peijian/erji/sansungerji-blue.jpg', '', '', NULL);

CREATE TABLE `app_profile` (
  `id` int(11) NOT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `mobile` varchar(20) NOT NULL,
  `sendaddress` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `app_profile` (`id`, `sex`, `mobile`, `sendaddress`, `user_id`) VALUES
(34, '男', '13711056339', 'xxx路xxx小区xxx楼', 42),
(35, '男', '18144803346', NULL, 43),
(36, '男', '13711089999', NULL, 44);

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add company info', 7, 'add_companyinfo'),
(20, 'Can change company info', 7, 'change_companyinfo'),
(21, 'Can delete company info', 7, 'delete_companyinfo'),
(22, 'Can add goods info', 8, 'add_goodsinfo'),
(23, 'Can change goods info', 8, 'change_goodsinfo'),
(24, 'Can delete goods info', 8, 'delete_goodsinfo'),
(25, 'Can add user address info', 9, 'add_useraddressinfo'),
(26, 'Can change user address info', 9, 'change_useraddressinfo'),
(27, 'Can delete user address info', 9, 'delete_useraddressinfo'),
(28, 'Can add user info', 10, 'add_userinfo'),
(29, 'Can change user info', 10, 'change_userinfo'),
(30, 'Can delete user info', 10, 'delete_userinfo'),
(31, 'Can add advertisement info', 11, 'add_advertisementinfo'),
(32, 'Can change advertisement info', 11, 'change_advertisementinfo'),
(33, 'Can delete advertisement info', 11, 'delete_advertisementinfo'),
(34, 'Can add profile', 12, 'add_profile'),
(35, 'Can change profile', 12, 'change_profile'),
(36, 'Can delete profile', 12, 'delete_profile'),
(37, 'Can add my user', 4, 'add_myuser'),
(38, 'Can change my user', 4, 'change_myuser'),
(39, 'Can delete my user', 4, 'delete_myuser'),
(40, 'Can view my user', 4, 'view_myuser'),
(41, 'Can add goods content', 14, 'add_goodscontent'),
(42, 'Can change goods content', 14, 'change_goodscontent'),
(43, 'Can delete goods content', 14, 'delete_goodscontent'),
(44, 'Can add goods', 15, 'add_goods'),
(45, 'Can change goods', 15, 'change_goods'),
(46, 'Can delete goods', 15, 'delete_goods'),
(47, 'Can add goods detail', 16, 'add_goodsdetail'),
(48, 'Can change goods detail', 16, 'change_goodsdetail'),
(49, 'Can delete goods detail', 16, 'delete_goodsdetail'),
(50, 'Can add company', 17, 'add_company'),
(51, 'Can change company', 17, 'change_company'),
(52, 'Can delete company', 17, 'delete_company'),
(53, 'Can add goods pic', 18, 'add_goodspic'),
(54, 'Can change goods pic', 18, 'change_goodspic'),
(55, 'Can delete goods pic', 18, 'delete_goodspic');

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(42, 'pbkdf2_sha256$36000$5zjvC32ctClT$jEZpcshy21PnDZyk317FhQP6mEz7kcmAODMc1PNdbZc=', '2019-04-23 15:08:52.547292', 0, '13711056339', '13711056339', '', '137@qq.com', 0, 1, '2019-04-22 10:05:18.391174'),
(43, 'pbkdf2_sha256$36000$8E0Vt7XMR8Tr$HhuH6txmlTd52aEW1XUynOpTtEHVZJjmQFjWEzK36Vs=', '2019-04-23 11:50:30.077232', 0, 'reyn', '18144803346', '', 'reyn@163.com', 0, 1, '2019-04-22 10:05:53.731956'),
(44, 'pbkdf2_sha256$36000$PbIhb5KYNl2Z$MqcGznpTxzvHznXmsLk9VtELto3Gn4onCy36B0yCueI=', NULL, 0, 'bob@qq.com', '13711089999', '', 'bob@qq.com', 0, 1, '2019-04-22 10:10:26.920944');

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(11, 'app', 'advertisementinfo'),
(17, 'app', 'company'),
(7, 'app', 'companyinfo'),
(15, 'app', 'goods'),
(14, 'app', 'goodscontent'),
(16, 'app', 'goodsdetail'),
(8, 'app', 'goodsinfo'),
(18, 'app', 'goodspic'),
(13, 'app', 'myuser'),
(12, 'app', 'profile'),
(9, 'app', 'useraddressinfo'),
(10, 'app', 'userinfo'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-01-25 08:24:09.399312'),
(2, 'auth', '0001_initial', '2019-01-25 08:24:09.957223'),
(3, 'admin', '0001_initial', '2019-01-25 08:24:10.114790'),
(5, 'app', '0001_initial', '2019-01-25 08:24:10.251484'),
(7, 'contenttypes', '0002_remove_content_type_name', '2019-01-25 08:24:10.494624'),
(8, 'auth', '0002_alter_permission_name_max_length', '2019-01-25 08:24:10.546970'),
(9, 'auth', '0003_alter_user_email_max_length', '2019-01-25 08:24:10.612075'),
(10, 'auth', '0004_alter_user_username_opts', '2019-01-25 08:24:10.640599'),
(11, 'auth', '0005_alter_user_last_login_null', '2019-01-25 08:24:10.693240'),
(12, 'auth', '0006_require_contenttypes_0002', '2019-01-25 08:24:10.698488'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2019-01-25 08:24:10.722234'),
(14, 'auth', '0008_alter_user_username_max_length', '2019-01-25 08:24:10.791659'),
(15, 'sessions', '0001_initial', '2019-01-25 08:24:10.837693'),
(17, 'admin', '0002_logentry_remove_auto_add', '2019-01-30 02:43:37.221085'),
(20, 'app', '0002_auto_20190130_0312', '2019-01-30 03:12:20.628439'),
(21, 'app', '0003_auto_20190130_0312', '2019-01-30 05:20:05.799222'),
(22, 'app', '0004_auto_20190130_0527', '2019-01-30 13:34:21.336846'),
(23, 'app', '0005_auto_20190130_1337', '2019-01-30 13:37:58.819201'),
(24, 'app', '0004_auto_20190130_1338', '2019-01-30 13:38:43.598352'),
(25, 'app', '0005_auto_20190130_1451', '2019-01-30 14:53:58.590674'),
(26, 'app', '0006_merge_20190130_1453', '2019-01-30 14:53:58.592320'),
(27, 'app', '0003_auto_20190130_1459', '2019-01-30 15:00:26.986165'),
(28, 'app', '0003_auto_20190219_1400', '2019-02-19 14:24:09.496958'),
(29, 'app', '0003_auto_20190219_1427', '2019-02-19 14:28:25.477228'),
(30, 'app', '0003_auto_20190220_1620', '2019-02-20 16:20:41.678034'),
(31, 'app', '0002_auto_20190307_1629', '2019-03-07 16:32:10.720723'),
(32, 'app', '0003_auto_20190419_1441', '2019-04-19 14:46:56.397634'),
(33, 'app', '0004_auto_20190419_1530', '2019-04-19 15:30:42.918650'),
(34, 'app', '0005_auto_20190419_1532', '2019-04-19 15:32:10.204112'),
(35, 'app', '0006_auto_20190424_0942', '2019-04-24 09:43:31.686915'),
(36, 'app', '0007_auto_20190424_1407', '2019-04-24 14:07:29.749327'),
(37, 'app', '0008_auto_20190424_1438', '2019-04-24 14:38:26.338514'),
(38, 'app', '0009_auto_20190424_1539', '2019-04-24 15:41:35.500495'),
(39, 'app', '0010_remove_goodsdetail_colortype', '2019-04-24 16:03:26.098748'),
(40, 'app', '0011_auto_20190424_1605', '2019-04-24 16:05:12.548759'),
(41, 'app', '0012_auto_20190424_1742', '2019-04-24 17:42:58.207744'),
(42, 'app', '0013_auto_20190424_1754', '2019-04-24 17:54:34.688917'),
(43, 'app', '0014_auto_20190425_1142', '2019-04-25 11:42:29.838664'),
(44, 'app', '0015_auto_20190425_1327', '2019-04-25 13:29:24.077986'),
(45, 'app', '0016_auto_20190425_1448', '2019-04-25 14:48:53.245028'),
(46, 'app', '0017_auto_20190426_1140', '2019-04-26 11:40:26.389346'),
(47, 'app', '0018_auto_20190426_1144', '2019-04-26 11:44:06.513761'),
(48, 'app', '0019_auto_20190426_1145', '2019-04-26 11:45:26.258592'),
(49, 'app', '0020_auto_20190426_1550', '2019-04-26 15:50:57.716620'),
(50, 'app', '0021_goodsdetail_parttype', '2019-04-28 16:27:51.943577');

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('7iju4rpg6bx325z8p4m1rmfd64hbibnx', 'ODZhYzk2NTYzMjQ3Mzg0ZGZkZGYwOGE1NWZiNDMxYWZlYjljOWE2MjqABJWvAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMAjQylIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA9fYXV0aF91c2VyX2hhc2iUjCgwYmQ4ZDY5NjM4MjJjNWJiMWQ5ZmJmZDc2NjcxNzQ3YmQyYzBiMjZllIwPX3Nlc3Npb25fZXhwaXJ5lEqAxhMAdS4=', '2019-05-08 15:07:20.642995'),
('jd77a9isbedywzwgbzyxppg8kujmwatb', 'ODZhYzk2NTYzMjQ3Mzg0ZGZkZGYwOGE1NWZiNDMxYWZlYjljOWE2MjqABJWvAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMAjQylIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA9fYXV0aF91c2VyX2hhc2iUjCgwYmQ4ZDY5NjM4MjJjNWJiMWQ5ZmJmZDc2NjcxNzQ3YmQyYzBiMjZllIwPX3Nlc3Npb25fZXhwaXJ5lEqAxhMAdS4=', '2019-05-11 11:43:34.782150');


ALTER TABLE `app_advertisementinfo`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `app_company`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `app_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_goods_cp_id_1fd5576e_fk_app_company_id` (`cp_id`);

ALTER TABLE `app_goodscontent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `good_id` (`good_id`);

ALTER TABLE `app_goodsdetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `good_id` (`good_id`);

ALTER TABLE `app_goodspic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `good_id` (`good_id`);

ALTER TABLE `app_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);


ALTER TABLE `app_advertisementinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `app_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
ALTER TABLE `app_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
ALTER TABLE `app_goodscontent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `app_goodsdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
ALTER TABLE `app_goodspic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
ALTER TABLE `app_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

ALTER TABLE `app_goods`
  ADD CONSTRAINT `app_goods_cp_id_1fd5576e_fk_app_company_id` FOREIGN KEY (`cp_id`) REFERENCES `app_company` (`id`);

ALTER TABLE `app_goodscontent`
  ADD CONSTRAINT `app_goodscontent_good_id_8f9efe83_fk_app_goods_id` FOREIGN KEY (`good_id`) REFERENCES `app_goods` (`id`);

ALTER TABLE `app_goodsdetail`
  ADD CONSTRAINT `app_goodsdetail_good_id_33090b6f_fk_app_goods_id` FOREIGN KEY (`good_id`) REFERENCES `app_goods` (`id`);

ALTER TABLE `app_goodspic`
  ADD CONSTRAINT `app_goodspic_good_id_581368ec_fk_app_goods_id` FOREIGN KEY (`good_id`) REFERENCES `app_goods` (`id`);

ALTER TABLE `app_profile`
  ADD CONSTRAINT `app_profile_user_id_87d292a0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
