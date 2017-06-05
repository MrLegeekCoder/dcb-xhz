/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : dcb

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-06-05 19:03:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dcb_all_img
-- ----------------------------
DROP TABLE IF EXISTS `dcb_all_img`;
CREATE TABLE `dcb_all_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片添加时id',
  `p_a_img` varchar(255) DEFAULT NULL COMMENT '产品图片信息',
  `p_a_simg` varchar(255) DEFAULT NULL COMMENT '产品缩略图信息',
  `s_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `s_bg_img` varchar(255) DEFAULT NULL COMMENT '店铺背景图片存放',
  `img_add_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '图片添加时间',
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='所有图片的存放路径';

-- ----------------------------
-- Records of dcb_all_img
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_aplay
-- ----------------------------
DROP TABLE IF EXISTS `dcb_aplay`;
CREATE TABLE `dcb_aplay` (
  `aplay_id` int(12) NOT NULL COMMENT '支付后成功后生成一个支付后单号',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠圈ID',
  `count_money` decimal(10,2) DEFAULT NULL COMMENT '产品总金额',
  `c_value` varchar(255) DEFAULT NULL COMMENT '优惠券面额',
  `Actual_pay` decimal(10,2) DEFAULT NULL COMMENT '实际付款金额',
  `shop_id` int(11) DEFAULT NULL COMMENT '哪家店铺收到了支付订单',
  PRIMARY KEY (`aplay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='根据实际金额，支付钱';

-- ----------------------------
-- Records of dcb_aplay
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_aplay_log
-- ----------------------------
DROP TABLE IF EXISTS `dcb_aplay_log`;
CREATE TABLE `dcb_aplay_log` (
  `aplay_id` int(12) NOT NULL COMMENT '支付后返回的订单号',
  `order_id` int(12) DEFAULT NULL COMMENT '产品订单生成的ID',
  `apaly_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '支付时间，存储时间搓',
  `Actual_pay` decimal(10,2) DEFAULT NULL COMMENT '实际支付金额',
  `pay_tool` varchar(255) DEFAULT NULL COMMENT '支付方式，微信或者支付宝',
  PRIMARY KEY (`aplay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付日志文件';

-- ----------------------------
-- Records of dcb_aplay_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_car
-- ----------------------------
DROP TABLE IF EXISTS `dcb_car`;
CREATE TABLE `dcb_car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `p_id` int(11) DEFAULT NULL COMMENT '产品id同产品表pid',
  `total_money` decimal(10,0) DEFAULT NULL COMMENT '选择产品总共金额',
  `total_count` int(5) DEFAULT NULL COMMENT '选择产品总计数量',
  `p_n_price` decimal(10,2) DEFAULT NULL COMMENT '产品价格同产品表p_n_price',
  `p_count_buy` int(10) DEFAULT NULL COMMENT '买的此种类商品个数',
  `p_name` char(20) DEFAULT NULL COMMENT '订单中商品名称',
  `p_img` varchar(255) DEFAULT NULL COMMENT '购物车内产品图片',
  `integral` int(10) DEFAULT NULL COMMENT '根据总价格算出积分',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的购物车（菜单）';

-- ----------------------------
-- Records of dcb_car
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_coupon
-- ----------------------------
DROP TABLE IF EXISTS `dcb_coupon`;
CREATE TABLE `dcb_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券ID，哪家店铺优惠券，领取人',
  `userid` int(11) DEFAULT NULL,
  `shop_id` int(8) DEFAULT NULL,
  `get_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '优惠券获得时间',
  `end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '优惠券过期时间',
  `c_value` decimal(10,2) DEFAULT NULL COMMENT '优惠券额度',
  `c_range_value` decimal(10,2) DEFAULT NULL COMMENT '满多少可用优惠',
  `c_range` varchar(255) DEFAULT NULL COMMENT '根据菜单品种使用优惠券',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `生成的优惠券需要店铺和用户信息` (`coupon_id`,`userid`,`shop_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券表';

-- ----------------------------
-- Records of dcb_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_coupon_log
-- ----------------------------
DROP TABLE IF EXISTS `dcb_coupon_log`;
CREATE TABLE `dcb_coupon_log` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `belong_user` varchar(255) DEFAULT NULL COMMENT '优惠券领取者',
  `draw_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '优惠券领取时间',
  `use_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '优惠券使用过期',
  `is_use` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '优惠券是否使用默认0 未使用，1代表使用',
  PRIMARY KEY (`coupon_id`),
  KEY `coupon_id` (`coupon_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券使用日志';

-- ----------------------------
-- Records of dcb_coupon_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_login
-- ----------------------------
DROP TABLE IF EXISTS `dcb_login`;
CREATE TABLE `dcb_login` (
  `name` varchar(255) DEFAULT NULL COMMENT '用户的登录名',
  `pwd` varchar(255) DEFAULT NULL COMMENT '用户登陆密码',
  `userid` int(11) DEFAULT NULL COMMENT '根据用户信息，生成网站唯一识别id，便于个人信息查询；'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆信息表';

-- ----------------------------
-- Records of dcb_login
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_login_log
-- ----------------------------
DROP TABLE IF EXISTS `dcb_login_log`;
CREATE TABLE `dcb_login_log` (
  `user_id` varchar(255) DEFAULT NULL COMMENT '同login表ID',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  `car_id` int(11) DEFAULT NULL COMMENT '购物车ID',
  `integral` int(10) DEFAULT NULL COMMENT '根据每次实际支付金额，获取积分',
  `count_integral` int(10) DEFAULT NULL COMMENT '总共获取了多少优惠券，根据领取优惠券累加'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆日志信息';

-- ----------------------------
-- Records of dcb_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_login_role
-- ----------------------------
DROP TABLE IF EXISTS `dcb_login_role`;
CREATE TABLE `dcb_login_role` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `roleid` int(11) DEFAULT NULL COMMENT '登陆的角色，分配不同权限',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of dcb_login_role
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_order
-- ----------------------------
DROP TABLE IF EXISTS `dcb_order`;
CREATE TABLE `dcb_order` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `p_id` int(11) unsigned DEFAULT NULL COMMENT '购买的产品id',
  `car_id` int(11) unsigned DEFAULT NULL COMMENT '获取对应店铺的购物车ID同car表car_id',
  `o_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订单付款状态 0代表未付款，1,代表付款，',
  `total_money` decimal(10,0) DEFAULT NULL COMMENT '订单中商品总金额',
  `total_count` int(5) DEFAULT NULL COMMENT '订单中商品总数量',
  `p_img` varchar(255) DEFAULT NULL COMMENT '订单中商品对应图片',
  `p_n_price` decimal(10,2) DEFAULT NULL COMMENT '订单中对应商品现价',
  `p_p_price` decimal(10,2) DEFAULT NULL COMMENT '订单中对应商品原价',
  `p_count_buy` int(10) unsigned DEFAULT NULL COMMENT '总共买该商品多少件',
  `p_name` char(20) DEFAULT NULL COMMENT '订单中商品名称',
  `o_notice` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `order_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '用户下单时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='由购物车生成的订单表信息';

-- ----------------------------
-- Records of dcb_order
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_privilege
-- ----------------------------
DROP TABLE IF EXISTS `dcb_privilege`;
CREATE TABLE `dcb_privilege` (
  `pri_id` int(11) NOT NULL COMMENT '权限id',
  `pri_name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `pri_modul` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `pri_controller` varchar(255) DEFAULT NULL COMMENT '控制器名称',
  `pri_view` varchar(255) DEFAULT NULL COMMENT '模板名称',
  `parent_id` int(11) DEFAULT NULL COMMENT '上级权限的ID，0：代表顶级权限',
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of dcb_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_privilege_role
-- ----------------------------
DROP TABLE IF EXISTS `dcb_privilege_role`;
CREATE TABLE `dcb_privilege_role` (
  `pri_id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `role_id` int(5) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`pri_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权利角色表';

-- ----------------------------
-- Records of dcb_privilege_role
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_product
-- ----------------------------
DROP TABLE IF EXISTS `dcb_product`;
CREATE TABLE `dcb_product` (
  `p_id` mediumint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `sort_id` int(11) NOT NULL COMMENT '根据sort_id，获取对应分类的产品id',
  `p_name` char(20) DEFAULT NULL COMMENT '产品名字',
  `p_img_url` varchar(255) DEFAULT NULL COMMENT '产品图片，该数据库仅接受图片地址',
  `p_simg_url` char(255) DEFAULT NULL COMMENT '图片缩略图，该数据库仅接受图片地址',
  `p_p_pricce` decimal(10,2) DEFAULT NULL COMMENT '产品原价',
  `p_n_price` decimal(10,2) DEFAULT NULL COMMENT '产品现价',
  `p_comment` text COMMENT '产品评价',
  `p_ishow` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '代表商品是否上架显示.默认0上架，1下架',
  `p_desc` varchar(255) DEFAULT NULL COMMENT '产品描述',
  `p_ishot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热卖0 默认不是热卖，1代表热卖',
  `p_addtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '商品上传时间，存时间戳类型',
  PRIMARY KEY (`p_id`),
  UNIQUE KEY `产品唯一id` (`p_id`) USING HASH,
  KEY `产品名字` (`p_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';

-- ----------------------------
-- Records of dcb_product
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `dcb_product_attr`;
CREATE TABLE `dcb_product_attr` (
  `attr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品属性ID',
  `p_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `p_taste` varchar(255) DEFAULT NULL COMMENT '产品口味选择',
  `p_size` double DEFAULT NULL COMMENT '产品分数大小',
  `p_special` text COMMENT '产品特色',
  PRIMARY KEY (`attr_id`),
  UNIQUE KEY `根据产品id,快速获取对应产品属性` (`attr_id`) USING HASH,
  UNIQUE KEY `产品id` (`p_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品属性表。口味大小等';

-- ----------------------------
-- Records of dcb_product_attr
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_product_sort
-- ----------------------------
DROP TABLE IF EXISTS `dcb_product_sort`;
CREATE TABLE `dcb_product_sort` (
  `sort_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品分类id',
  `sort_name` varchar(255) DEFAULT NULL COMMENT '产品分类名称同产品表',
  `shop_id` int(11) DEFAULT NULL COMMENT '根据shopid获取对应店铺的产品菜单',
  PRIMARY KEY (`sort_id`),
  UNIQUE KEY `根据店铺id快速获取分类id` (`sort_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品分类，根据不同菜系分';

-- ----------------------------
-- Records of dcb_product_sort
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_shop
-- ----------------------------
DROP TABLE IF EXISTS `dcb_shop`;
CREATE TABLE `dcb_shop` (
  `shop_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '根据店铺分类表获取当前店铺ID',
  `s_name` char(20) DEFAULT NULL COMMENT '店铺名字',
  `s_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `s_desc` varchar(255) DEFAULT NULL COMMENT '店铺信息描述',
  `s_del` int(11) DEFAULT NULL COMMENT '店铺联系电话',
  `s_addr` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `s_bg_img` varchar(255) DEFAULT NULL COMMENT '店铺背景图',
  `s_notice` text COMMENT '店铺公告',
  PRIMARY KEY (`shop_id`),
  UNIQUE KEY `店铺id` (`shop_id`) USING HASH,
  KEY `店铺名字` (`s_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺信息表';

-- ----------------------------
-- Records of dcb_shop
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_shop_log
-- ----------------------------
DROP TABLE IF EXISTS `dcb_shop_log`;
CREATE TABLE `dcb_shop_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水id号，按照店铺添加规则生成',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺id',
  `shop_sort_id` int(11) DEFAULT NULL COMMENT '店铺分类id',
  `shop_name` varchar(255) DEFAULT NULL,
  `shop_add_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '店铺添加时间',
  `shop_delete_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '店铺删除时间',
  `shop_tel` int(11) DEFAULT NULL COMMENT '店铺提供给管理员电话',
  `shop_addr` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `shop_deposite_money` decimal(10,0) DEFAULT NULL COMMENT '店铺使用平台押金',
  PRIMARY KEY (`id`),
  UNIQUE KEY `店铺id` (`shop_id`) USING HASH,
  UNIQUE KEY `店铺名字` (`shop_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员对店铺信息管理';

-- ----------------------------
-- Records of dcb_shop_log
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_shop_sort
-- ----------------------------
DROP TABLE IF EXISTS `dcb_shop_sort`;
CREATE TABLE `dcb_shop_sort` (
  `shop_sort_id` varchar(255) DEFAULT NULL COMMENT '店铺分类id',
  `shop_sort_name` varchar(255) DEFAULT NULL COMMENT '店铺的分类名',
  UNIQUE KEY `店铺分类` (`shop_sort_id`) USING HASH,
  KEY `店铺分类名字` (`shop_sort_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺分类表';

-- ----------------------------
-- Records of dcb_shop_sort
-- ----------------------------

-- ----------------------------
-- Table structure for dcb_user_msg
-- ----------------------------
DROP TABLE IF EXISTS `dcb_user_msg`;
CREATE TABLE `dcb_user_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '同login表name',
  `m_img` varchar(255) DEFAULT NULL COMMENT '我的头像',
  `m_desc` varchar(255) DEFAULT NULL COMMENT '个人口味简介',
  `integral` int(10) DEFAULT NULL COMMENT '同car表里面积分',
  `m_coupon` varchar(255) DEFAULT NULL COMMENT '我的优惠圈',
  `coupon_id` int(11) DEFAULT NULL COMMENT '优惠券ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登陆之后，用户根据生产id，获取自己信息';

-- ----------------------------
-- Records of dcb_user_msg
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
