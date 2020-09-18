/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:3306
 Source Schema         : eleme-vue

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 18/09/2020 20:54:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for el_activity
-- ----------------------------
DROP TABLE IF EXISTS `el_activity`;
CREATE TABLE `el_activity`  (
  `id` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `icon_color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  `icon_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标名字',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名字',
  `ranking_weight` int(11) NULL DEFAULT NULL COMMENT '权重',
  `restaurant_id` int(11) NULL DEFAULT NULL COMMENT '饭馆id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '外卖活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_activity
-- ----------------------------
INSERT INTO `el_activity` VALUES (1, '满100减1', '#FFFFFF', 'manjian', '满减活动', 10, 1);

-- ----------------------------
-- Table structure for el_address
-- ----------------------------
DROP TABLE IF EXISTS `el_address`;
CREATE TABLE `el_address`  (
  `id` int(11) NOT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名地址',
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `county_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区县',
  `receive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货电话',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地址表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_address
-- ----------------------------
INSERT INTO `el_address` VALUES (1, '西南航空港经济开发区学府路一段24号', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for el_cart
-- ----------------------------
DROP TABLE IF EXISTS `el_cart`;
CREATE TABLE `el_cart`  (
  `id` int(11) NOT NULL,
  `is_support_coupon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠',
  `deliver_time` datetime(0) NULL DEFAULT NULL COMMENT '送达时间',
  `invoice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票',
  `deliver_time1` datetime(0) NULL DEFAULT NULL COMMENT '送达时间1',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `deliver_time2` datetime(0) NULL DEFAULT NULL COMMENT '送达时间2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_cart
-- ----------------------------
INSERT INTO `el_cart` VALUES (1, '0', '2020-09-15 19:22:43', '0', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for el_cart_food
-- ----------------------------
DROP TABLE IF EXISTS `el_cart_food`;
CREATE TABLE `el_cart_food`  (
  `cart_id` int(11) NULL DEFAULT NULL,
  `food_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车食品关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_cart_food
-- ----------------------------
INSERT INTO `el_cart_food` VALUES (1, 1);

-- ----------------------------
-- Table structure for el_category
-- ----------------------------
DROP TABLE IF EXISTS `el_category`;
CREATE TABLE `el_category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父分类ID',
  `category_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '分类类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '分类状态',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分类信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_category
-- ----------------------------
INSERT INTO `el_category` VALUES (1, '麻辣', 0, '1', '1', 1, 'system', '2020-09-14 19:39:40', 'system', '2020-09-14 19:39:48', '');

-- ----------------------------
-- Table structure for el_city
-- ----------------------------
DROP TABLE IF EXISTS `el_city`;
CREATE TABLE `el_city`  (
  `id` int(11) NOT NULL,
  `parent_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_city
-- ----------------------------

-- ----------------------------
-- Table structure for el_food
-- ----------------------------
DROP TABLE IF EXISTS `el_food`;
CREATE TABLE `el_food`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `activity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动',
  `restuarant_id` int(11) NOT NULL COMMENT '饭馆id',
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小介绍',
  `rating_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分数',
  `month_sale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '月销量',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `rating` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '食物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_food
-- ----------------------------
INSERT INTO `el_food` VALUES (1, '宫保鸡丁', '/data/1.png', '0', 1, '月销100', '300', '400', '好吃的不得了', '4.9', NULL);

-- ----------------------------
-- Table structure for el_order
-- ----------------------------
DROP TABLE IF EXISTS `el_order`;
CREATE TABLE `el_order`  (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL COMMENT '饭馆id',
  `restaurant_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '饭馆名',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户名',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `total_amount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买件数',
  `total_quality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总价钱',
  `address_id` int(11) NULL DEFAULT NULL COMMENT '地址id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_order
-- ----------------------------
INSERT INTO `el_order` VALUES (1, 1, '信息工程饭馆', 'wuliang', '2020-09-15 19:28:17', '30', '1', NULL);
INSERT INTO `el_order` VALUES (2, 1, '信息工程饭馆', 'zhangsan', NULL, '2', '2', 1);
INSERT INTO `el_order` VALUES (3, 1, '信息工程饭馆', 'zhangsan', NULL, '3', '6', NULL);

-- ----------------------------
-- Table structure for el_rating
-- ----------------------------
DROP TABLE IF EXISTS `el_rating`;
CREATE TABLE `el_rating`  (
  `id` int(11) NOT NULL,
  `restuarant_id` int(11) NOT NULL COMMENT '饭馆id',
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分',
  `rating_at` datetime(0) NULL DEFAULT NULL COMMENT '评分时间',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `food_id` int(11) NULL DEFAULT NULL COMMENT '食物id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_rating
-- ----------------------------
INSERT INTO `el_rating` VALUES (1, 1, '4.9', '2020-09-14 19:38:45', 'wuliang', NULL);

-- ----------------------------
-- Table structure for el_shop
-- ----------------------------
DROP TABLE IF EXISTS `el_shop`;
CREATE TABLE `el_shop`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商铺名',
  `province_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省',
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '县/区',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `latitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `promotion_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '促销信息',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `delivery_mode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `is_new` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新店',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '营业开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '营业结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of el_shop
-- ----------------------------
INSERT INTO `el_shop` VALUES (1, '信息工程饭馆1', '四川', '成都', '双流', '西南航空港经济开发区学府路一段24号 ', NULL, NULL, '123456789', NULL, NULL, '欢迎光临', '这是个饭馆', '骑手送', '1', '2020-09-17 15:23:56', '2020-09-17 17:24:03');
INSERT INTO `el_shop` VALUES (2, '漂亮学姐饭馆', '四川', '成都', '双流', '成都信息工程大学航空港校区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '顺丰', NULL, '2020-09-16 15:24:10', '2020-09-17 15:24:15');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (69, 'el_activity', '外卖活动表', 'ElActivity', 'crud', 'com.ruoyi.hunger', 'hunger', 'activity', '活动管理', 'gourddoll', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12', NULL);
INSERT INTO `gen_table` VALUES (70, 'el_address', '地址表', 'ElAddress', 'crud', 'com.ruoyi.hunger', 'hunger', 'address', '地址管理', 'gourddoll', '0', '/', '{\"parentMenuId\":\"2000\"}', 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22', NULL);
INSERT INTO `gen_table` VALUES (71, 'el_cart', '购物车表', 'ElCart', 'crud', 'com.ruoyi.hunger', 'hunger', 'cart', '购物车', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39', NULL);
INSERT INTO `gen_table` VALUES (72, 'el_category', '分类信息表', 'ElCategory', 'crud', 'com.ruoyi.hunger', 'hunger', 'category', '分类信息', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47', NULL);
INSERT INTO `gen_table` VALUES (73, 'el_city', '城市表', 'ElCity', 'crud', 'com.ruoyi.hunger', 'hunger', 'city', '城市管理', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:36', NULL);
INSERT INTO `gen_table` VALUES (74, 'el_food', '食物表', 'ElFood', 'crud', 'com.ruoyi.hunger', 'hunger', 'food', '食物管理', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:47', NULL);
INSERT INTO `gen_table` VALUES (75, 'el_order', '订单表', 'ElOrder', 'crud', 'com.ruoyi.hunger', 'hunger', 'order', '订单管理', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57', NULL);
INSERT INTO `gen_table` VALUES (76, 'el_rating', '评分表', 'ElRating', 'crud', 'com.ruoyi.hunger', 'hunger', 'rating', '评分管理', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08', NULL);
INSERT INTO `gen_table` VALUES (77, 'el_shop', '商铺表', 'ElShop', 'crud', 'com.ruoyi.hunger', 'hunger', 'shop', '商铺管理', 'gourddoll', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 571 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (493, '69', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (494, '69', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (495, '69', 'icon_color', '图标颜色', 'varchar(255)', 'String', 'iconColor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (496, '69', 'icon_name', '图标名字', 'varchar(255)', 'String', 'iconName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (497, '69', 'name', '活动名字', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (498, '69', 'ranking_weight', '权重', 'int(11)', 'Long', 'rankingWeight', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (499, '69', 'restaurant_id', '饭馆id', 'int(11)', 'Long', 'restaurantId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:12');
INSERT INTO `gen_table_column` VALUES (500, '70', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (501, '70', 'detail', '详细地址', 'varchar(255)', 'String', 'detail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (502, '70', 'user_name', '用户名地址', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (503, '70', 'province_name', '省', 'varchar(255)', 'String', 'provinceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (504, '70', 'city_name', '市', 'varchar(255)', 'String', 'cityName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (505, '70', 'county_name', '区县', 'varchar(255)', 'String', 'countyName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (506, '70', 'receive_name', '收货人', 'varchar(255)', 'String', 'receiveName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (507, '70', 'receive_phone', '收货电话', 'varchar(255)', 'String', 'receivePhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:22');
INSERT INTO `gen_table_column` VALUES (508, '71', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (509, '71', 'is_support_coupon', '优惠', 'varchar(255)', 'String', 'isSupportCoupon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (510, '71', 'deliver_time', '送达时间', 'datetime', 'Date', 'deliverTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (511, '71', 'invoice', '发票', 'varchar(255)', 'String', 'invoice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (512, '71', 'deliver_time1', '送达时间1', 'datetime', 'Date', 'deliverTime1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (513, '71', 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (514, '71', 'deliver_time2', '送达时间2', 'datetime', 'Date', 'deliverTime2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:39');
INSERT INTO `gen_table_column` VALUES (515, '72', 'category_id', '分类ID', 'bigint(20)', 'Long', 'categoryId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (516, '72', 'category_name', '分类名称', 'varchar(50)', 'String', 'categoryName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (517, '72', 'parent_id', '父分类ID', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (518, '72', 'category_type', '分类类型', 'char(1)', 'String', 'categoryType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (519, '72', 'status', '分类状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 5, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (520, '72', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (521, '72', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (522, '72', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (523, '72', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (524, '72', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (525, '72', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:05:47');
INSERT INTO `gen_table_column` VALUES (526, '73', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:36');
INSERT INTO `gen_table_column` VALUES (527, '73', 'parent_id', '父级id', 'varchar(255)', 'String', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:36');
INSERT INTO `gen_table_column` VALUES (528, '73', 'name', '城市名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:36');
INSERT INTO `gen_table_column` VALUES (529, '74', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (530, '74', 'name', '名字', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (531, '74', 'image_path', '图片', 'varchar(255)', 'String', 'imagePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (532, '74', 'activity', '活动', 'varchar(255)', 'String', 'activity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (533, '74', 'restuarant_id', '饭馆id', 'int(11)', 'Long', 'restuarantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-09-17 15:36:16', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (534, '74', 'tips', '小介绍', 'varchar(255)', 'String', 'tips', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (535, '74', 'rating_count', '评分数', 'varchar(255)', 'String', 'ratingCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (536, '74', 'month_sale', '月销量', 'varchar(255)', 'String', 'monthSale', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (537, '74', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (538, '74', 'rating', '评分', 'varchar(255)', 'String', 'rating', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (539, '74', 'category_id', '分类id', 'int(11)', 'Long', 'categoryId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:47');
INSERT INTO `gen_table_column` VALUES (540, '75', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (541, '75', 'restaurant_id', '饭馆id', 'int(11)', 'Long', 'restaurantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (542, '75', 'restaurant_name', '饭馆名', 'varchar(255)', 'String', 'restaurantName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (543, '75', 'user_name', '创建用户名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (544, '75', 'created_time', '创建时间', 'datetime', 'Date', 'createdTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (545, '75', 'total_amount', '购买件数', 'varchar(255)', 'String', 'totalAmount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (546, '75', 'total_quality', '总价钱', 'varchar(255)', 'String', 'totalQuality', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (547, '75', 'address_id', '地址id', 'int(11)', 'Long', 'addressId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:06:57');
INSERT INTO `gen_table_column` VALUES (548, '76', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08');
INSERT INTO `gen_table_column` VALUES (549, '76', 'restuarant_id', '饭馆id', 'int(11)', 'Long', 'restuarantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08');
INSERT INTO `gen_table_column` VALUES (550, '76', 'score', '评分', 'varchar(255)', 'String', 'score', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08');
INSERT INTO `gen_table_column` VALUES (551, '76', 'rating_at', '评分时间', 'datetime', 'Date', 'ratingAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08');
INSERT INTO `gen_table_column` VALUES (552, '76', 'user_name', '用户名', 'varchar(255)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08');
INSERT INTO `gen_table_column` VALUES (553, '76', 'food_id', '食物id', 'int(11)', 'Long', 'foodId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:08');
INSERT INTO `gen_table_column` VALUES (554, '77', 'id', NULL, 'int(11)', 'Long', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (555, '77', 'name', '商铺名', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (556, '77', 'province_name', '省', 'varchar(255)', 'String', 'provinceName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (557, '77', 'city_name', '市', 'varchar(255)', 'String', 'cityName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (558, '77', 'area_name', '县/区', 'varchar(255)', 'String', 'areaName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (559, '77', 'detail', '详细地址', 'varchar(255)', 'String', 'detail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (560, '77', 'latitude', '纬度', 'varchar(255)', 'String', 'latitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (561, '77', 'longitude', '经度', 'varchar(255)', 'String', 'longitude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (562, '77', 'phone', '电话', 'varchar(255)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (563, '77', 'image_path', '图片路径', 'varchar(255)', 'String', 'imagePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (564, '77', 'status', '状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (565, '77', 'promotion_info', '促销信息', 'varchar(255)', 'String', 'promotionInfo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (566, '77', 'description', '描述', 'varchar(255)', 'String', 'description', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (567, '77', 'delivery_mode', '配送方式', 'varchar(255)', 'String', 'deliveryMode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (568, '77', 'is_new', '新店', 'varchar(255)', 'String', 'isNew', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (569, '77', 'start_time', '营业开始时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');
INSERT INTO `gen_table_column` VALUES (570, '77', 'end_time', '营业结束时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 17, 'admin', '2020-09-17 15:36:17', '', '2020-09-17 16:07:18');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Taipei');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Taipei');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Taipei');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E07870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-2LVMILM1600433366182', 1600433535194, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1600433370000, -1, 5, 'PAUSED', 'CRON', 1600433366000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1600433370000, -1, 5, 'PAUSED', 'CRON', 1600433366000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1600433380000, -1, 5, 'PAUSED', 'CRON', 1600433366000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-14 20:48:24');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-14 21:17:40');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-14 21:26:21');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-14 21:32:49');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-14 22:48:40');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-15 00:15:57');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 00:16:04');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 00:28:48');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 09:38:19');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-15 09:40:22');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 09:40:40');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 11:25:59');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 14:05:05');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 15:13:09');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 18:45:36');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-15 19:55:30');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-16 18:59:53');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-16 20:16:02');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-16 22:01:16');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-17 15:29:10');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-17 21:43:21');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-17 21:48:04');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-17 21:48:10');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-17 23:57:37');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-18 09:21:14');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-18 10:50:46');
INSERT INTO `sys_logininfor` VALUES (126, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2020-09-18 11:05:52');
INSERT INTO `sys_logininfor` VALUES (127, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2020-09-18 11:46:27');
INSERT INTO `sys_logininfor` VALUES (128, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2020-09-18 15:05:15');
INSERT INTO `sys_logininfor` VALUES (129, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2020-09-18 15:13:59');
INSERT INTO `sys_logininfor` VALUES (130, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '用户不存在/密码错误', '2020-09-18 15:18:16');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-18 15:24:06');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-18 15:24:16');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-18 15:25:44');
INSERT INTO `sys_logininfor` VALUES (134, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2020-09-18 15:26:13');
INSERT INTO `sys_logininfor` VALUES (135, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-18 15:34:53');
INSERT INTO `sys_logininfor` VALUES (136, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-18 15:35:07');
INSERT INTO `sys_logininfor` VALUES (137, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2020-09-18 15:35:17');
INSERT INTO `sys_logininfor` VALUES (138, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-18 15:36:22');
INSERT INTO `sys_logininfor` VALUES (139, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-18 15:37:27');
INSERT INTO `sys_logininfor` VALUES (140, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-18 15:37:50');
INSERT INTO `sys_logininfor` VALUES (141, 'zhangsan', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-18 15:38:16');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-18 15:38:21');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-18 15:38:43');
INSERT INTO `sys_logininfor` VALUES (144, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2020-09-18 15:39:00');
INSERT INTO `sys_logininfor` VALUES (145, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2020-09-18 18:39:31');
INSERT INTO `sys_logininfor` VALUES (146, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2020-09-18 19:45:14');
INSERT INTO `sys_logininfor` VALUES (147, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2020-09-18 19:45:18');
INSERT INTO `sys_logininfor` VALUES (148, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2020-09-18 19:45:20');
INSERT INTO `sys_logininfor` VALUES (149, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2020-09-18 19:45:21');
INSERT INTO `sys_logininfor` VALUES (150, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '1', '验证码错误', '2020-09-18 19:45:29');
INSERT INTO `sys_logininfor` VALUES (151, 'zhangsan', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2020-09-18 19:45:41');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2364 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 2, 'system', NULL, 1, 'M', '0', '0', '', 'system', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-15 00:27:22', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, 1, 'M', '0', '0', '', 'monitor', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-14 23:00:03', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, 1, 'M', '0', '0', '', 'tool', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-14 23:00:08', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '0', '', 'log', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', '0', 'system:post:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', '0', 'system:config:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '饥饿管理', 0, 1, 'hunger', '', 1, 'M', '0', '0', '', 'shopping', 'admin', '2020-09-14 22:59:09', 'admin', '2020-09-14 23:21:14', '');
INSERT INTO `sys_menu` VALUES (2310, '活动管理', 2000, 1, 'activity', 'hunger/activity/index', 1, 'C', '0', '0', 'hunger:activity:list', 'build', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-17 21:53:33', '活动管理菜单');
INSERT INTO `sys_menu` VALUES (2311, '活动管理查询', 2310, 1, '#', '', 1, 'F', '0', '0', 'hunger:activity:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2312, '活动管理新增', 2310, 2, '#', '', 1, 'F', '0', '0', 'hunger:activity:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2313, '活动管理修改', 2310, 3, '#', '', 1, 'F', '0', '0', 'hunger:activity:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2314, '活动管理删除', 2310, 4, '#', '', 1, 'F', '0', '0', 'hunger:activity:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2315, '活动管理导出', 2310, 5, '#', '', 1, 'F', '0', '0', 'hunger:activity:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2316, '地址管理', 2000, 1, 'address', 'hunger/address/index', 1, 'C', '0', '0', 'hunger:address:list', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '地址管理菜单');
INSERT INTO `sys_menu` VALUES (2317, '地址管理查询', 2316, 1, '#', '', 1, 'F', '0', '0', 'hunger:address:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2318, '地址管理新增', 2316, 2, '#', '', 1, 'F', '0', '0', 'hunger:address:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2319, '地址管理修改', 2316, 3, '#', '', 1, 'F', '0', '0', 'hunger:address:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2320, '地址管理删除', 2316, 4, '#', '', 1, 'F', '0', '0', 'hunger:address:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2321, '地址管理导出', 2316, 5, '#', '', 1, 'F', '0', '0', 'hunger:address:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2322, '购物车管理', 2000, 1, 'cart', 'hunger/cart/index', 1, 'C', '0', '0', 'hunger:cart:list', 'build', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-17 16:12:37', '购物车菜单');
INSERT INTO `sys_menu` VALUES (2323, '购物车查询', 2322, 1, '#', '', 1, 'F', '0', '0', 'hunger:cart:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2324, '购物车新增', 2322, 2, '#', '', 1, 'F', '0', '0', 'hunger:cart:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2325, '购物车修改', 2322, 3, '#', '', 1, 'F', '0', '0', 'hunger:cart:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2326, '购物车删除', 2322, 4, '#', '', 1, 'F', '0', '0', 'hunger:cart:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2327, '购物车导出', 2322, 5, '#', '', 1, 'F', '0', '0', 'hunger:cart:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2328, '分类信息', 2000, 1, 'category', 'hunger/category/index', 1, 'C', '0', '0', 'hunger:category:list', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '分类信息菜单');
INSERT INTO `sys_menu` VALUES (2329, '分类信息查询', 2328, 1, '#', '', 1, 'F', '0', '0', 'hunger:category:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2330, '分类信息新增', 2328, 2, '#', '', 1, 'F', '0', '0', 'hunger:category:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2331, '分类信息修改', 2328, 3, '#', '', 1, 'F', '0', '0', 'hunger:category:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2332, '分类信息删除', 2328, 4, '#', '', 1, 'F', '0', '0', 'hunger:category:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2333, '分类信息导出', 2328, 5, '#', '', 1, 'F', '0', '0', 'hunger:category:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2334, '城市管理', 2000, 1, 'city', 'hunger/city/index', 1, 'C', '0', '0', 'hunger:city:list', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '城市管理菜单');
INSERT INTO `sys_menu` VALUES (2335, '城市管理查询', 2334, 1, '#', '', 1, 'F', '0', '0', 'hunger:city:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2336, '城市管理新增', 2334, 2, '#', '', 1, 'F', '0', '0', 'hunger:city:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2337, '城市管理修改', 2334, 3, '#', '', 1, 'F', '0', '0', 'hunger:city:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2338, '城市管理删除', 2334, 4, '#', '', 1, 'F', '0', '0', 'hunger:city:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2339, '城市管理导出', 2334, 5, '#', '', 1, 'F', '0', '0', 'hunger:city:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2340, '食物管理', 2000, 1, 'food', 'hunger/food/index', 1, 'C', '0', '0', 'hunger:food:list', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '食物管理菜单');
INSERT INTO `sys_menu` VALUES (2341, '食物管理查询', 2340, 1, '#', '', 1, 'F', '0', '0', 'hunger:food:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2342, '食物管理新增', 2340, 2, '#', '', 1, 'F', '0', '0', 'hunger:food:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2343, '食物管理修改', 2340, 3, '#', '', 1, 'F', '0', '0', 'hunger:food:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2344, '食物管理删除', 2340, 4, '#', '', 1, 'F', '0', '0', 'hunger:food:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2345, '食物管理导出', 2340, 5, '#', '', 1, 'F', '0', '0', 'hunger:food:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2346, '订单管理', 2000, 1, 'order', 'hunger/order/index', 1, 'C', '0', '0', 'hunger:order:list', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '订单管理菜单');
INSERT INTO `sys_menu` VALUES (2347, '订单管理查询', 2346, 1, '#', '', 1, 'F', '0', '0', 'hunger:order:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2348, '订单管理新增', 2346, 2, '#', '', 1, 'F', '0', '0', 'hunger:order:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2349, '订单管理修改', 2346, 3, '#', '', 1, 'F', '0', '0', 'hunger:order:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2350, '订单管理删除', 2346, 4, '#', '', 1, 'F', '0', '0', 'hunger:order:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2351, '订单管理导出', 2346, 5, '#', '', 1, 'F', '0', '0', 'hunger:order:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2352, '评分管理', 2000, 1, 'rating', 'hunger/rating/index', 1, 'C', '0', '0', 'hunger:rating:list', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '评分管理菜单');
INSERT INTO `sys_menu` VALUES (2353, '评分管理查询', 2352, 1, '#', '', 1, 'F', '0', '0', 'hunger:rating:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2354, '评分管理新增', 2352, 2, '#', '', 1, 'F', '0', '0', 'hunger:rating:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2355, '评分管理修改', 2352, 3, '#', '', 1, 'F', '0', '0', 'hunger:rating:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2356, '评分管理删除', 2352, 4, '#', '', 1, 'F', '0', '0', 'hunger:rating:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2357, '评分管理导出', 2352, 5, '#', '', 1, 'F', '0', '0', 'hunger:rating:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2358, '商铺管理', 2000, 1, 'shop', 'hunger/shop/index', 1, 'C', '0', '0', '', 'build', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '商铺管理菜单');
INSERT INTO `sys_menu` VALUES (2359, '商铺管理查询', 2358, 1, '#', '', 1, 'F', '0', '0', 'hunger:shop:query', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2360, '商铺管理新增', 2358, 2, '#', '', 1, 'F', '0', '0', 'hunger:shop:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2361, '商铺管理修改', 2358, 3, '#', '', 1, 'F', '0', '0', 'hunger:shop:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2362, '商铺管理删除', 2358, 4, '#', '', 1, 'F', '0', '0', 'hunger:shop:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2363, '商铺管理导出', 2358, 5, '#', '', 1, 'F', '0', '0', 'hunger:shop:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-14 21:52:07');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2020-09-14 21:52:30');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_deliveries,el_foods,el_orders,el_ratings,el_shops,el_activities,el_adresses,el_carts,el_category,el_cities', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 21:53:22');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2,3,4,5,6,7,8,9,10', '127.0.0.1', '内网IP', '{tableIds=1,2,3,4,5,6,7,8,9,10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:00:30');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activities,el_adresses,el_carts,el_category,el_cities,el_deliveries,el_foods,el_orders,el_ratings,el_shops', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:00:39');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600092038000,\"tableId\":11,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":72,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"description\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"描述\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600092038000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"description\"},{\"usableColumn\":false,\"columnId\":73,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconColor\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标颜色\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600092038000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"icon_color\"},{\"usableColumn\":false,\"columnId\":74,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标名字\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600092038000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"icon_name\"},{\"usableColumn\":false,\"columnId\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:01:06');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-14 22:49:03');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":77,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600092038000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":78,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"detail\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"详细地址\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600092038000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"detail\"}],\"businessName\":\"adresses\",\"moduleName\":\"hunger\",\"className\":\"ElAdresses\",\"tableName\":\"el_adresses\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.gourddoll.hunger\",\"functionName\":\"地址\",\"tree\":false,\"tableComment\":\"地址表\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":12,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:52:22');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\"hunger\",\"component\":\"hunger\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:59:09');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\" \",\"component\":\"hunger\",\"children\":[],\"createTime\":1600095549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:59:46');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 22:59:57');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"monitor\",\"orderNum\":\"3\",\"menuName\":\"系统监控\",\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:00:03');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"tool\",\"orderNum\":\"4\",\"menuName\":\"系统工具\",\"params\":{},\"parentId\":0,\"path\":\"tool\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":3,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:00:08');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"guide\",\"orderNum\":\"5\",\"menuName\":\"若依官网\",\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"0\",\"menuId\":4,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:00:12');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"食品管理\",\"params\":{},\"parentId\":2000,\"path\":\"/hunger/foods\",\"component\":\"/hunger/foods\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:01:07');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"食品管理\",\"params\":{},\"parentId\":2000,\"path\":\"hunger/foods\",\"component\":\"/hunger/foods\",\"children\":[],\"createTime\":1600095667000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:01:20');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"商铺管理\",\"params\":{},\"parentId\":2000,\"path\":\"hunger/shops\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:03:15');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"商铺管理\",\"params\":{},\"parentId\":2000,\"path\":\"hunger/shops\",\"children\":[],\"createTime\":1600095795000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:03:25');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"食品管理\",\"params\":{},\"parentId\":2000,\"path\":\"hunger/foods\",\"component\":\"hunger/foods\",\"children\":[],\"createTime\":1600095667000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:03:33');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\" hunger\",\"component\":\"hunger\",\"children\":[],\"createTime\":1600095549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:04:04');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"食品管理\",\"params\":{},\"parentId\":2000,\"path\":\"foods\",\"component\":\"hunger/foods\",\"children\":[],\"createTime\":1600095667000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:04:13');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"商铺管理\",\"params\":{},\"parentId\":2000,\"path\":\"shops\",\"component\":\"hunger/shops\",\"children\":[],\"createTime\":1600095795000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:07:02');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":2000,\"path\":\"orders\",\"component\":\"hunger/orders\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:09:27');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"4\",\"menuName\":\"地址管理\",\"params\":{},\"parentId\":2000,\"path\":\"addresses\",\"component\":\"hunger/addresses\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:10:25');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"5\",\"menuName\":\"配送管理\",\"params\":{},\"parentId\":0,\"path\":\"deliveries\",\"component\":\"hunger/deliveries\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:11:16');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"5\",\"menuName\":\"配送管理\",\"params\":{},\"parentId\":2000,\"path\":\"deliveries\",\"component\":\"hunger/deliveries\",\"children\":[],\"createTime\":1600096276000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:11:29');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"6\",\"menuName\":\"评分管理\",\"params\":{},\"parentId\":2000,\"path\":\"rating\",\"component\":\"hunger/rating\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:13:08');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"8\",\"menuName\":\"分类管理\",\"params\":{},\"parentId\":2000,\"path\":\"category\",\"component\":\"hunger/category\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:13:55');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\" hunger\",\"component\":\"hunger\",\"children\":[],\"createTime\":1600095549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:14:21');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"1\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\" hunger\",\"component\":\"hunger\",\"children\":[],\"createTime\":1600095549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:14:55');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\" hunger\",\"component\":\"hunger\",\"children\":[],\"createTime\":1600095549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:15:26');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"食品管理\",\"params\":{},\"parentId\":2000,\"path\":\"food\",\"component\":\"hunger/food\",\"children\":[],\"createTime\":1600095667000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:17:03');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"商铺管理\",\"params\":{},\"parentId\":2000,\"path\":\"shop\",\"component\":\"hunger/shop\",\"children\":[],\"createTime\":1600095795000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:17:11');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":2000,\"path\":\"order\",\"component\":\"hunger/order\",\"children\":[],\"createTime\":1600096166000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:17:17');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":2000,\"path\":\"order\",\"component\":\"hunger/order\",\"children\":[],\"createTime\":1600096166000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:17:18');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"4\",\"menuName\":\"地址管理\",\"params\":{},\"parentId\":2000,\"path\":\"address\",\"component\":\"hunger/address\",\"children\":[],\"createTime\":1600096225000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:17:25');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"5\",\"menuName\":\"配送管理\",\"params\":{},\"parentId\":2000,\"path\":\"delivery\",\"component\":\"hunger/delivery\",\"children\":[],\"createTime\":1600096276000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:17:37');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"6\",\"menuName\":\"评分管理\",\"params\":{},\"parentId\":2000,\"path\":\"rating\",\"component\":\"hunger/rating\",\"children\":[],\"createTime\":1600096388000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:18:48');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"活动管理\",\"params\":{},\"parentId\":2000,\"path\":\"activity\",\"component\":\"hunger/activity\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:20:50');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"shopping\",\"orderNum\":\"1\",\"menuName\":\"饥饿管理\",\"params\":{},\"parentId\":0,\"path\":\"hunger\",\"component\":\"hunger\",\"children\":[],\"createTime\":1600095549000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:21:15');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/11,12,13,14,15,16,17,18,19,20', '127.0.0.1', '内网IP', '{tableIds=11,12,13,14,15,16,17,18,19,20}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:22:27');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activity,el_address,el_cart,el_category,el_city,el_delivery,el_food,el_order,el_rating,el_shop', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:22:43');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":141,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":21,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":142,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"description\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"描述\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"description\"},{\"usableColumn\":false,\"columnId\":143,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconColor\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标颜色\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"icon_color\"},{\"usableColumn\":false,\"columnId\":144,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标名字\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"icon_name\"},{\"usableColumn\":false,\"co', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:24:00');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":22,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":148,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"detail\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"详细地址\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":22,\"pk\":false,\"columnName\":\"detail\"}],\"businessName\":\"address\",\"moduleName\":\"hunger\",\"className\":\"ElAddress\",\"tableName\":\"el_address\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2004}\",\"genType\":\"0\",\"packageName\":\"com.gourddoll.hunger\",\"functionName\":\"地址\",\"tree\":false,\"tableComment\":\"地址表\",\"params\":{\"parentMenuId\":2004},\"tplCategory\":\"crud\",\"parentMenuId\":\"2004\",\"tableId\":22,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:25:21');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":23,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":150,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deliveryReachTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配送时间\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"delivery_reach_time\"},{\"usableColumn\":false,\"columnId\":151,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"isSupportCoupon\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"优惠\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"is_support_coupon\"},{\"usableColumn\":false,\"columnId\":152,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deliverTime\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"送达时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnNam', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:29:00');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"8\",\"menuName\":\"购物车管理\",\"params\":{},\"parentId\":2000,\"path\":\"cart\",\"component\":\"hunger/cart\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:29:40');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097340000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":23,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":150,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deliveryReachTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配送时间\",\"isQuery\":\"1\",\"updateTime\":1600097340000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"delivery_reach_time\"},{\"usableColumn\":false,\"columnId\":151,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"isSupportCoupon\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"优惠\",\"isQuery\":\"1\",\"updateTime\":1600097340000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"is_support_coupon\"},{\"usableColumn\":false,\"columnId\":152,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deliverTime\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"送达时间\",\"isQuery\":\"1\",\"updateTime\":1600097340000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"dateti', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:29:54');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分类ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":24,\"pk\":true,\"columnName\":\"category_id\"},{\"usableColumn\":false,\"columnId\":157,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分类名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"category_name\"},{\"usableColumn\":true,\"columnId\":158,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父分类ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":159,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分类类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:30:52');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":167,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":25,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":168,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父级id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":169,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"城市名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"name\"}],\"businessName\":\"city\",\"moduleName\":\"gourddoll\",\"className\":\"ElCity\",\"tableName\":\"el_city\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.gourddoll.hunger\",\"functionName\":\"城市\",\"tree\":false,\"tableComment\":\"城市表\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":25,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:31:21');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":170,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":26,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":171,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"color\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"颜色\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"color\"},{\"usableColumn\":false,\"columnId\":172,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"isSolid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"送达\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"is_solid\"},{\"usableColumn\":false,\"columnId\":173,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"方式\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"type\"}],\"businessName\":\"delivery\",\"moduleName\":\"hunge', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:31:48');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":27,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名字\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"imagePath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图片\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"image_path\"},{\"usableColumn\":false,\"columnId\":177,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"活动\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"activity\"},{\"usableColumn\":false,\"columnId\":178,\"isIncr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:32:04');
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":28,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"restaurant_id\"},{\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"restaurantName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"restaurant_name\"},{\"usableColumn\":false,\"columnId\":188,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户名\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"user_name\"},{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:32:16');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":193,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":29,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":194,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restuarantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":29,\"pk\":false,\"columnName\":\"restuarant_id\"},{\"usableColumn\":false,\"columnId\":195,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"score\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评分\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":29,\"pk\":false,\"columnName\":\"score\"},{\"usableColumn\":false,\"columnId\":196,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ratingAt\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"评分时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":29,\"pk\":false,\"columnName\":\"rating_at\"},{\"usableColumn\":false,\"colu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:32:39');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":170,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097508000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":26,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":171,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"color\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"颜色\",\"isQuery\":\"1\",\"updateTime\":1600097508000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"color\"},{\"usableColumn\":false,\"columnId\":172,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"isSolid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"送达\",\"isQuery\":\"1\",\"updateTime\":1600097508000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"is_solid\"},{\"usableColumn\":false,\"columnId\":173,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"方式\",\"isQuery\":\"1\",\"updateTime\":1600097508000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:32:49');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097524000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":27,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名字\",\"isQuery\":\"1\",\"updateTime\":1600097524000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"imagePath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图片\",\"isQuery\":\"1\",\"updateTime\":1600097524000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"image_path\"},{\"usableColumn\":false,\"columnId\":177,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"活动\",\"isQuery\":\"1\",\"updateTime\":1600097524000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":160009696300', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:32:59');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097536000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":28,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆id\",\"isQuery\":\"1\",\"updateTime\":1600097536000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"restaurant_id\"},{\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"restaurantName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆名\",\"isQuery\":\"1\",\"updateTime\":1600097536000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"restaurant_name\"},{\"usableColumn\":false,\"columnId\":188,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户名\",\"isQuery\":\"1\",\"updateTime\":1600097536000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:33:33');
INSERT INTO `sys_oper_log` VALUES (156, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":199,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":30,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":200,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":30,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":201,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"address\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":30,\"pk\":false,\"columnName\":\"address\"},{\"usableColumn\":false,\"columnId\":202,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"latitude\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":30,\"pk\":false,\"columnName\":\"latitude\"},{\"usableColumn\":false,\"columnId\":203,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:34:10');
INSERT INTO `sys_oper_log` VALUES (157, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-14 23:36:05');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":149,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097394000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":23,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":150,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"deliveryReachTime\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"配送时间\",\"isQuery\":\"1\",\"updateTime\":1600097394000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"delivery_reach_time\"},{\"usableColumn\":false,\"columnId\":151,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"isSupportCoupon\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"优惠\",\"isQuery\":\"1\",\"updateTime\":1600097394000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"is_support_coupon\"},{\"usableColumn\":false,\"columnId\":152,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deliverTime\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"送达时间\",\"isQuery\":\"1\",\"updateTime\":1600097394000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"dateti', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:37:09');
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":167,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097480000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":25,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":168,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父级id\",\"isQuery\":\"1\",\"updateTime\":1600097480000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":169,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"城市名\",\"isQuery\":\"1\",\"updateTime\":1600097480000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"name\"}],\"businessName\":\"city\",\"moduleName\":\"hunger\",\"className\":\"ElCity\",\"tableName\":\"el_city\",\"crud\":true,\"options\":\"{}\",\"genType\":\"0\",\"packageName\":\"com.gourddoll.hunger\",\"functionName\":\"城市\",\"tree\":false,\"tableComment\":\"城市表\",\"params\":{},\"tplCategory\":\"crud\",\"tableId\":25,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:37:31');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":156,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分类ID\",\"updateTime\":1600097452000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":24,\"pk\":true,\"columnName\":\"category_id\"},{\"usableColumn\":false,\"columnId\":157,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分类名称\",\"isQuery\":\"1\",\"updateTime\":1600097452000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"category_name\"},{\"usableColumn\":true,\"columnId\":158,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父分类ID\",\"isQuery\":\"1\",\"updateTime\":1600097452000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":159,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分类类型\",\"isQuery\":\"1\",\"updateTime\":1600097452000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:37:57');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":174,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097579000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":27,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":175,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名字\",\"isQuery\":\"1\",\"updateTime\":1600097579000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":176,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"imagePath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图片\",\"isQuery\":\"1\",\"updateTime\":1600097579000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":27,\"pk\":false,\"columnName\":\"image_path\"},{\"usableColumn\":false,\"columnId\":177,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"活动\",\"isQuery\":\"1\",\"updateTime\":1600097579000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":160009696300', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:38:22');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600097613000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600096963000,\"tableId\":28,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆id\",\"isQuery\":\"1\",\"updateTime\":1600097613000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"restaurant_id\"},{\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"restaurantName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆名\",\"isQuery\":\"1\",\"updateTime\":1600097613000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600096963000,\"isEdit\":\"1\",\"tableId\":28,\"pk\":false,\"columnName\":\"restaurant_name\"},{\"usableColumn\":false,\"columnId\":188,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户名\",\"isQuery\":\"1\",\"updateTime\":1600097613000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-14 23:38:34');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-14 23:38:42');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system1\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 00:27:16');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"system\",\"orderNum\":\"2\",\"menuName\":\"系统管理\",\"params\":{},\"parentId\":0,\"path\":\"system\",\"children\":[],\"createTime\":1521171180000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":1,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 00:27:22');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"城市\",\"params\":{},\"parentId\":2000,\"path\":\"city\",\"component\":\"hunger/city/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2034,\"menuType\":\"C\",\"perms\":\"hunger:city:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 15:18:47');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/21,22,23,24,25,26,27,28,29,30', '127.0.0.1', '内网IP', '{tableIds=21,22,23,24,25,26,27,28,29,30}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 15:20:11');
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activity,el_address,el_cart,el_category,el_city,el_delivery,el_food,el_order,el_rating,el_shop', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 15:20:18');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"城市管理\",\"params\":{},\"parentId\":2000,\"path\":\"city\",\"component\":\"hunger/city/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2034,\"menuType\":\"C\",\"perms\":\"hunger:city:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 18:46:18');
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/31,32,33,34,35,36,37,38,39,40', '127.0.0.1', '内网IP', '{tableIds=31,32,33,34,35,36,37,38,39,40}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 18:46:48');
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activity,el_address,el_cart,el_category,el_city,el_delivery,el_food,el_order,el_rating,el_shop', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 18:46:54');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-15 18:47:51');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"食品管理\",\"params\":{},\"parentId\":2000,\"path\":\"food\",\"component\":\"hunger/food/index\",\"children\":[],\"createTime\":1600095667000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"hunger:food:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 20:04:23');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"活动管理\",\"params\":{},\"parentId\":2000,\"path\":\"activity\",\"component\":\"hunger/activity\",\"children\":[],\"createTime\":1600096850000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"hunger:factivity:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 20:04:54');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"2\",\"menuName\":\"商铺管理\",\"params\":{},\"parentId\":2000,\"path\":\"shop\",\"component\":\"hunger/shop\",\"children\":[],\"createTime\":1600095795000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"C\",\"perms\":\"hunger:shop:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 20:05:06');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"订单管理\",\"params\":{},\"parentId\":2000,\"path\":\"order\",\"component\":\"hunger/order\",\"children\":[],\"createTime\":1600096166000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"hunger:order:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 20:05:16');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"4\",\"menuName\":\"地址管理\",\"params\":{},\"parentId\":2000,\"path\":\"address\",\"component\":\"hunger/address\",\"children\":[],\"createTime\":1600096225000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"C\",\"perms\":\"hunger:address:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-15 20:05:30');
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/41,42,43,44,45,46,47,48,49,50', '127.0.0.1', '内网IP', '{tableIds=41,42,43,44,45,46,47,48,49,50}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 19:07:13');
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activity,el_address,el_cart,el_category,el_city,el_food,el_order', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 19:07:34');
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_rating,el_shop', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 19:07:48');
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-16 19:08:44');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2130', '127.0.0.1', '内网IP', '{menuId=2130}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-09-16 19:31:19');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/51,52,53,54,55,56,57,58,59', '127.0.0.1', '内网IP', '{tableIds=51,52,53,54,55,56,57,58,59}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 19:37:36');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activity,el_address,el_cart,el_category,el_city,el_food,el_order', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 19:37:49');
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_rating,el_shop', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 19:37:58');
INSERT INTO `sys_oper_log` VALUES (186, '商铺', 2, 'com.ruoyi.web.controller.hunger.ElShopController.edit()', 'PUT', 1, 'admin', NULL, '/hunger/shop', '127.0.0.1', '内网IP', '{\"address\":\"四川省成都市西南航空港经济开发区学府路一段24号 \",\"deliveryMode\":\"骑手送\",\"phone\":\"123456789\",\"name\":\"信息工程饭馆1\",\"description\":\"这是个饭馆\",\"id\":1,\"isNew\":\"1\",\"promotionInfo\":\"欢迎光临\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-16 20:23:18');
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/60,61,62,63,64,65,66,67,68', '127.0.0.1', '内网IP', '{tableIds=60,61,62,63,64,65,66,67,68}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 15:36:06');
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'el_activity,el_address,el_cart,el_category,el_city,el_food,el_order,el_rating,el_shop', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 15:36:17');
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-17 15:36:51');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"商铺\",\"params\":{},\"parentId\":2002,\"path\":\"shop\",\"component\":\"hunger/shop/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2304,\"menuType\":\"C\",\"perms\":\"hunger:shop:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 15:52:25');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"外卖活动\",\"params\":{},\"parentId\":2008,\"path\":\"activity\",\"component\":\"hunger/activity/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2256,\"menuType\":\"C\",\"perms\":\"hunger:activity:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 15:52:48');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"食物查询\",\"params\":{},\"parentId\":2001,\"path\":\"#\",\"component\":\"\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2287,\"menuType\":\"F\",\"perms\":\"hunger:food:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 15:58:43');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-09-17 16:03:30');
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":493,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":69,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":494,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"description\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"描述\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":69,\"pk\":false,\"columnName\":\"description\"},{\"usableColumn\":false,\"columnId\":495,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconColor\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标颜色\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":69,\"pk\":false,\"columnName\":\"icon_color\"},{\"usableColumn\":false,\"columnId\":496,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标名字\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":69,\"pk\":false,\"columnName\":\"icon_name\"},{\"usableColumn\":false,\"co', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:05:20');
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":500,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":70,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":501,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"detail\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"详细地址\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":70,\"pk\":false,\"columnName\":\"detail\"},{\"usableColumn\":false,\"columnId\":502,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户名地址\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":70,\"pk\":false,\"columnName\":\"user_name\"},{\"usableColumn\":false,\"columnId\":503,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"provinceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"省\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":70,\"pk\":false,\"columnName\":\"province_name\"},{\"usableColumn\":false,\"colu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:05:31');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":508,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":71,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":509,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"isSupportCoupon\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"优惠\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":71,\"pk\":false,\"columnName\":\"is_support_coupon\"},{\"usableColumn\":false,\"columnId\":510,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"deliverTime\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"送达时间\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":71,\"pk\":false,\"columnName\":\"deliver_time\"},{\"usableColumn\":false,\"columnId\":511,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"invoice\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"发票\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":71,\"pk\":false,\"columnName\":\"invoice\"},{\"usableColumn\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:05:39');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":515,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"分类ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":72,\"pk\":true,\"columnName\":\"category_id\"},{\"usableColumn\":false,\"columnId\":516,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分类名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":72,\"pk\":false,\"columnName\":\"category_name\"},{\"usableColumn\":true,\"columnId\":517,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父分类ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":72,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":518,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"categoryType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"分类类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":72,\"pk\":false,\"columnName\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:05:47');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":493,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600329920000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":69,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":494,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"description\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"描述\",\"isQuery\":\"1\",\"updateTime\":1600329920000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":69,\"pk\":false,\"columnName\":\"description\"},{\"usableColumn\":false,\"columnId\":495,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconColor\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标颜色\",\"isQuery\":\"1\",\"updateTime\":1600329920000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":69,\"pk\":false,\"columnName\":\"icon_color\"},{\"usableColumn\":false,\"columnId\":496,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"iconName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图标名字\",\"isQuery\":\"1\",\"updateTime\":1600329920000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"create', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:06:12');
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":500,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"updateTime\":1600329930000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":70,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":501,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"detail\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"详细地址\",\"isQuery\":\"1\",\"updateTime\":1600329930000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":70,\"pk\":false,\"columnName\":\"detail\"},{\"usableColumn\":false,\"columnId\":502,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户名地址\",\"isQuery\":\"1\",\"updateTime\":1600329931000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":70,\"pk\":false,\"columnName\":\"user_name\"},{\"usableColumn\":false,\"columnId\":503,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"provinceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"省\",\"isQuery\":\"1\",\"updateTime\":1600329931000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:06:22');
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":526,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":73,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":true,\"columnId\":527,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":true,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"parentId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"父级id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":73,\"pk\":false,\"columnName\":\"parent_id\"},{\"usableColumn\":false,\"columnId\":528,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"城市名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":73,\"pk\":false,\"columnName\":\"name\"}],\"businessName\":\"city\",\"moduleName\":\"hunger\",\"className\":\"ElCity\",\"tableName\":\"el_city\",\"crud\":true,\"options\":\"{\\\"parentMenuId\\\":2000}\",\"genType\":\"0\",\"packageName\":\"com.ruoyi.hunger\",\"functionName\":\"城市管理\",\"tree\":false,\"tableComment\":\"城市表\",\"params\":{\"parentMenuId\":2000},\"tplCategory\":\"crud\",\"parentMenuId\":\"2000\",\"tableId\":73,\"genPath\":\"/\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:06:36');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":529,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328176000,\"tableId\":74,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":530,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"名字\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":74,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":531,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"imagePath\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"图片\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":74,\"pk\":false,\"columnName\":\"image_path\"},{\"usableColumn\":false,\"columnId\":532,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"activity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"活动\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328176000,\"isEdit\":\"1\",\"tableId\":74,\"pk\":false,\"columnName\":\"activity\"},{\"usableColumn\":false,\"columnId\":533,\"isIncr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:06:47');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":540,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328177000,\"tableId\":75,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":541,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restaurantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":75,\"pk\":false,\"columnName\":\"restaurant_id\"},{\"usableColumn\":false,\"columnId\":542,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"restaurantName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆名\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":75,\"pk\":false,\"columnName\":\"restaurant_name\"},{\"usableColumn\":false,\"columnId\":543,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"userName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"创建用户名\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":75,\"pk\":false,\"columnName\":\"user_name\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:06:57');
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":548,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328177000,\"tableId\":76,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":549,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"restuarantId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"饭馆id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":76,\"pk\":false,\"columnName\":\"restuarant_id\"},{\"usableColumn\":false,\"columnId\":550,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"score\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"评分\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":76,\"pk\":false,\"columnName\":\"score\"},{\"usableColumn\":false,\"columnId\":551,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ratingAt\",\"htmlType\":\"datetime\",\"edit\":true,\"query\":true,\"columnComment\":\"评分时间\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Date\",\"queryType\":\"EQ\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":76,\"pk\":false,\"columnName\":\"rating_at\"},{\"usableColumn\":false,\"colu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:07:08');
INSERT INTO `sys_oper_log` VALUES (204, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"gourddoll\",\"columns\":[{\"usableColumn\":false,\"columnId\":554,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1600328177000,\"tableId\":77,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":555,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"name\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"商铺名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":77,\"pk\":false,\"columnName\":\"name\"},{\"usableColumn\":false,\"columnId\":556,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"provinceName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"省\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":77,\"pk\":false,\"columnName\":\"province_name\"},{\"usableColumn\":false,\"columnId\":557,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"cityName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"市\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1600328177000,\"isEdit\":\"1\",\"tableId\":77,\"pk\":false,\"columnName\":\"city_name\"},{\"usableColumn\":false,\"columnId\":5', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:07:18');
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-09-17 16:07:28');
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"购物车管理\",\"params\":{},\"parentId\":2000,\"path\":\"cart\",\"component\":\"hunger/cart/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2322,\"menuType\":\"C\",\"perms\":\"hunger:cart:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 16:12:38');
INSERT INTO `sys_oper_log` VALUES (207, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"活动管理\",\"params\":{},\"parentId\":2000,\"path\":\"activity\",\"component\":\"hunger/activity/index\",\"children\":[],\"createTime\":1519833600000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2310,\"menuType\":\"C\",\"perms\":\"hunger:activity:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-09-17 21:53:33');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2346);
INSERT INTO `sys_role_menu` VALUES (2, 2347);
INSERT INTO `sys_role_menu` VALUES (2, 2348);
INSERT INTO `sys_role_menu` VALUES (2, 2349);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'gd@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'gd@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES (3, 102, 'zhangsan', '火云邪神', '00', 'gd@gmail.com', '11234567891', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);

SET FOREIGN_KEY_CHECKS = 1;
