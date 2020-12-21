/*
Navicat MySQL Data Transfer

Source Server         : ss
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : jsh_erp

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-12-21 11:26:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jsh_account
-- ----------------------------
DROP TABLE IF EXISTS `jsh_account`;
CREATE TABLE `jsh_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `serial_no` varchar(50) DEFAULT NULL COMMENT '编号',
  `initial_amount` decimal(24,6) DEFAULT NULL COMMENT '期初金额',
  `current_amount` decimal(24,6) DEFAULT NULL COMMENT '当前余额',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否默认',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='账户信息';

-- ----------------------------
-- Records of jsh_account
-- ----------------------------
INSERT INTO `jsh_account` VALUES ('17', '账户1', 'zzz111', '100.000000', '-2096.000000', 'aabb', '', '63', '0');
INSERT INTO `jsh_account` VALUES ('18', '账户2', '1234131324', '200.000000', '-1750.000000', 'bb', '\0', '63', '0');

-- ----------------------------
-- Table structure for jsh_account_head
-- ----------------------------
DROP TABLE IF EXISTS `jsh_account_head`;
CREATE TABLE `jsh_account_head` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) DEFAULT NULL COMMENT '类型(支出/收入/收款/付款/转账)',
  `organ_id` bigint(20) DEFAULT NULL COMMENT '单位Id(收款/付款单位)',
  `hands_person_id` bigint(20) DEFAULT NULL COMMENT '经手人id',
  `creator` bigint(20) DEFAULT NULL COMMENT '操作员',
  `change_amount` decimal(24,6) DEFAULT NULL COMMENT '变动金额(优惠/收款/付款/实付)',
  `total_price` decimal(24,6) DEFAULT NULL COMMENT '合计金额',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户(收款/付款)',
  `bill_no` varchar(50) DEFAULT NULL COMMENT '单据编号',
  `bill_time` datetime DEFAULT NULL COMMENT '单据日期',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`),
  KEY `FK9F4C0D8DB610FC06` (`organ_id`),
  KEY `FK9F4C0D8DAAE50527` (`account_id`),
  KEY `FK9F4C0D8DC4170B37` (`hands_person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='财务主表';

-- ----------------------------
-- Records of jsh_account_head
-- ----------------------------
INSERT INTO `jsh_account_head` VALUES ('97', '收入', '58', '16', '63', '10.000000', '10.000000', '17', 'SR20191228121609', '2019-12-28 00:00:00', '备注1', '63', '1');
INSERT INTO `jsh_account_head` VALUES ('98', '支出', '57', '16', '63', '-20.000000', '-20.000000', '17', 'ZC20191228121854', '2019-12-28 12:18:54', '', '63', '1');
INSERT INTO `jsh_account_head` VALUES ('99', '收款', '58', '16', '63', null, '20.000000', null, 'SK20191228121908', '2019-12-28 12:19:08', '', '63', '0');
INSERT INTO `jsh_account_head` VALUES ('100', '付款', '68', '16', '63', null, '-20.000000', null, 'FK20191228121920', '2019-12-28 12:19:20', '', '63', '0');
INSERT INTO `jsh_account_head` VALUES ('101', '转账', null, '16', '63', '-20.000000', '-20.000000', '18', 'ZZ20191228121932', '2019-12-28 12:19:32', '', '63', '0');
INSERT INTO `jsh_account_head` VALUES ('102', '收预付款', '60', '16', '63', null, '1000.000000', null, 'SYF20191228121945', '2019-12-28 12:19:45', '', '63', '0');
INSERT INTO `jsh_account_head` VALUES ('103', '收入', '58', '16', '63', '20.000000', '20.000000', '18', 'SR20200721163125', '2020-07-21 16:31:25', '', '63', '1');
INSERT INTO `jsh_account_head` VALUES ('104', '收入', '71', '16', '63', '60.000000', '50.000000', '18', 'SR20200721225712', '2020-07-21 00:00:00', 'bb', '63', '1');
INSERT INTO `jsh_account_head` VALUES ('105', '转账', null, '16', '63', '-11.000000', '-11.000000', '18', 'ZZ20200722005429', '2020-07-22 00:54:29', '', '63', '0');
INSERT INTO `jsh_account_head` VALUES ('106', '收入', '58', '16', '131', '1000.000000', '1000.000000', '17', 'SR20200913184412', '2020-09-13 18:44:12', '', '63', '1');
INSERT INTO `jsh_account_head` VALUES ('107', '支出', '57', '16', '63', '0.000000', '-100.000000', '17', 'ZC20201125141721', '2020-11-25 14:17:21', '', '63', '1');

-- ----------------------------
-- Table structure for jsh_account_item
-- ----------------------------
DROP TABLE IF EXISTS `jsh_account_item`;
CREATE TABLE `jsh_account_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `header_id` bigint(20) NOT NULL COMMENT '表头Id',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户Id',
  `in_out_item_id` bigint(20) DEFAULT NULL COMMENT '收支项目Id',
  `each_amount` decimal(24,6) DEFAULT NULL COMMENT '单项金额',
  `remark` varchar(100) DEFAULT NULL COMMENT '单据备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`),
  KEY `FK9F4CBAC0AAE50527` (`account_id`),
  KEY `FK9F4CBAC0C5FE6007` (`header_id`),
  KEY `FK9F4CBAC0D203EDC5` (`in_out_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='财务子表';

-- ----------------------------
-- Records of jsh_account_item
-- ----------------------------
INSERT INTO `jsh_account_item` VALUES ('98', '97', null, '22', '10.000000', '', '63', '1');
INSERT INTO `jsh_account_item` VALUES ('99', '98', null, '21', '20.000000', '', '63', '1');
INSERT INTO `jsh_account_item` VALUES ('100', '99', '17', null, '20.000000', '', '63', '0');
INSERT INTO `jsh_account_item` VALUES ('101', '100', '17', null, '-20.000000', '', '63', '0');
INSERT INTO `jsh_account_item` VALUES ('102', '101', '17', null, '20.000000', '', '63', '0');
INSERT INTO `jsh_account_item` VALUES ('103', '102', '17', null, '1000.000000', '', '63', '0');
INSERT INTO `jsh_account_item` VALUES ('104', '103', null, '22', '20.000000', '', '63', '1');
INSERT INTO `jsh_account_item` VALUES ('105', '104', null, '22', '50.000000', '', '63', '1');
INSERT INTO `jsh_account_item` VALUES ('106', '105', '17', null, '11.000000', '', '63', '0');
INSERT INTO `jsh_account_item` VALUES ('107', '106', null, '22', '1000.000000', '', '63', '1');
INSERT INTO `jsh_account_item` VALUES ('108', '107', null, '21', '100.000000', '', '63', '1');

-- ----------------------------
-- Table structure for jsh_depot
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depot`;
CREATE TABLE `jsh_depot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) DEFAULT NULL COMMENT '仓库名称',
  `address` varchar(50) DEFAULT NULL COMMENT '仓库地址',
  `warehousing` decimal(24,6) DEFAULT NULL COMMENT '仓储费',
  `truckage` decimal(24,6) DEFAULT NULL COMMENT '搬运费',
  `type` int(10) DEFAULT NULL COMMENT '类型',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `remark` varchar(100) DEFAULT NULL COMMENT '描述',
  `principal` bigint(20) DEFAULT NULL COMMENT '负责人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `is_default` bit(1) DEFAULT NULL COMMENT '是否默认',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='仓库表';

-- ----------------------------
-- Records of jsh_depot
-- ----------------------------
INSERT INTO `jsh_depot` VALUES ('14', '仓库1', 'dizhi', '12.000000', '12.000000', '0', '2', '描述', '131', '63', '0', '');
INSERT INTO `jsh_depot` VALUES ('15', '仓库2', '地址100', null, null, '0', '', '', '131', '63', '1', '\0');
INSERT INTO `jsh_depot` VALUES ('17', '仓库3', '123123', '123.000000', '123.000000', '0', '123', '123', '131', '63', '1', '\0');

-- ----------------------------
-- Table structure for jsh_depot_head
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depot_head`;
CREATE TABLE `jsh_depot_head` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) DEFAULT NULL COMMENT '类型(出库/入库)',
  `sub_type` varchar(50) DEFAULT NULL COMMENT '出入库分类',
  `default_number` varchar(50) DEFAULT NULL COMMENT '初始票据号',
  `number` varchar(50) DEFAULT NULL COMMENT '票据号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `oper_time` datetime DEFAULT NULL COMMENT '出入库时间',
  `organ_id` bigint(20) DEFAULT NULL COMMENT '供应商id',
  `hands_person_id` bigint(20) DEFAULT NULL COMMENT '采购/领料-经手人id',
  `creator` bigint(20) DEFAULT NULL COMMENT '操作员',
  `account_id` bigint(20) DEFAULT NULL COMMENT '账户id',
  `change_amount` decimal(24,6) DEFAULT NULL COMMENT '变动金额(收款/付款)',
  `total_price` decimal(24,6) DEFAULT NULL COMMENT '合计金额',
  `pay_type` varchar(50) DEFAULT NULL COMMENT '付款类型(现金、记账等)',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `sales_man` varchar(50) DEFAULT NULL COMMENT '业务员（可以多个）',
  `account_id_list` varchar(50) DEFAULT NULL COMMENT '多账户ID列表',
  `account_money_list` varchar(200) DEFAULT NULL COMMENT '多账户金额列表',
  `discount` decimal(24,6) DEFAULT NULL COMMENT '优惠率',
  `discount_money` decimal(24,6) DEFAULT NULL COMMENT '优惠金额',
  `discount_last_money` decimal(24,6) DEFAULT NULL COMMENT '优惠后金额',
  `other_money` decimal(24,6) DEFAULT NULL COMMENT '销售或采购费用合计',
  `other_money_list` varchar(200) DEFAULT NULL COMMENT '销售或采购费用涉及项目Id数组（包括快递、招待等）',
  `other_money_item` varchar(200) DEFAULT NULL COMMENT '销售或采购费用涉及项目（包括快递、招待等）',
  `account_day` int(10) DEFAULT NULL COMMENT '结算天数',
  `status` varchar(1) DEFAULT NULL COMMENT '状态，0未审核、1已审核、2已转采购|销售',
  `link_number` varchar(50) DEFAULT NULL COMMENT '关联订单号',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`),
  KEY `FK2A80F214C4170B37` (`hands_person_id`),
  KEY `FK2A80F214B610FC06` (`organ_id`),
  KEY `FK2A80F214AAE50527` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=868 DEFAULT CHARSET=utf8 COMMENT='单据主表';

-- ----------------------------
-- Records of jsh_depot_head
-- ----------------------------
INSERT INTO `jsh_depot_head` VALUES ('816', '出库', '零售', '112-6874589-9305016', '112-6874589-9305016', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('817', '出库', '零售', '112-6874589-9305017', '112-6874589-9305017', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('818', '出库', '零售', '112-6874589-9305018', '112-6874589-9305018', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('819', '出库', '零售', '112-6874589-9305019', '112-6874589-9305019', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('820', '出库', '零售', '112-6874589-9305020', '112-6874589-9305020', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('821', '出库', '零售', '112-6874589-9305021', '112-6874589-9305021', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('822', '出库', '零售', '112-6874589-9305022', '112-6874589-9305022', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('823', '出库', '零售', '112-6874589-9305023', '112-6874589-9305023', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('824', '出库', '零售', '112-6874589-9305024', '112-6874589-9305024', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '9.990000', '9.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('825', '出库', '零售', '112-6874589-9305025', '112-6874589-9305025', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.490000', '10.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('826', '出库', '零售', '112-6874589-9305026', '112-6874589-9305026', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('827', '出库', '零售', '112-6874589-9305028', '112-6874589-9305028', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('828', '出库', '零售', '112-6874589-9305029', '112-6874589-9305029', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('829', '出库', '零售', '112-6874589-9305030', '112-6874589-9305030', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '43.960000', '43.960000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('830', '出库', '零售', '112-6874589-9305031', '112-6874589-9305031', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '7.990000', '7.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('831', '出库', '零售', '112-6874589-9305032', '112-6874589-9305032', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('832', '出库', '零售', '112-6874589-9305033', '112-6874589-9305033', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('833', '出库', '零售', '112-6874589-9305034', '112-6874589-9305034', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('834', '出库', '零售', '112-6874589-9305035', '112-6874589-9305035', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('835', '出库', '零售', '112-6874589-9305038', '112-6874589-9305038', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('836', '出库', '零售', '112-6874589-9305039', '112-6874589-9305039', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('837', '出库', '零售', '112-6874589-9305040', '112-6874589-9305040', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('838', '出库', '零售', '112-6874589-9305041', '112-6874589-9305041', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('839', '出库', '零售', '112-6874589-9305042', '112-6874589-9305042', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('840', '出库', '零售', '112-6874589-9305043', '112-6874589-9305043', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('841', '出库', '零售', '112-6874589-9305045', '112-6874589-9305045', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('842', '出库', '零售', '112-6874589-9305046', '112-6874589-9305046', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('843', '出库', '零售', '112-6874589-9305047', '112-6874589-9305047', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('844', '出库', '零售', '112-6874589-9305048', '112-6874589-9305048', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('845', '出库', '零售', '112-6874589-9305049', '112-6874589-9305049', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('846', '出库', '零售', '112-6874589-9305050', '112-6874589-9305050', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('847', '出库', '零售', '112-6874589-9305051', '112-6874589-9305051', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('848', '出库', '零售', '112-6874589-9305052', '112-6874589-9305052', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('849', '出库', '零售', '112-6874589-9305053', '112-6874589-9305053', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('850', '出库', '零售', '112-6874589-9305054', '112-6874589-9305054', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('851', '出库', '零售', '112-6874589-9305055', '112-6874589-9305055', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('852', '出库', '零售', '112-6874589-9305056', '112-6874589-9305056', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('853', '出库', '零售', '112-6874589-9305057', '112-6874589-9305057', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('854', '出库', '零售', '112-6874589-9305058', '112-6874589-9305058', '2020-12-21 10:25:12', '2020-12-20 02:41:55', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('855', '出库', '零售', '112-6874589-9305059', '112-6874589-9305059', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('856', '出库', '零售', '112-6874589-9305060', '112-6874589-9305060', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('857', '出库', '零售', '112-6874589-9305061', '112-6874589-9305061', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('858', '出库', '零售', '112-6874589-9305062', '112-6874589-9305062', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('859', '出库', '零售', '112-6874589-9305063', '112-6874589-9305063', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('860', '出库', '零售', '112-6874589-9305064', '112-6874589-9305064', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('861', '出库', '零售', '112-6874589-9305065', '112-6874589-9305065', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('862', '出库', '零售', '112-6874589-9305066', '112-6874589-9305066', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('863', '出库', '零售', '112-6874589-9305067', '112-6874589-9305067', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('864', '出库', '零售', '112-6874589-9305068', '112-6874589-9305068', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('865', '出库', '零售', '112-6874589-9305069', '112-6874589-9305069', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('866', '出库', '零售', '112-6874589-9305070', '112-6874589-9305070', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '11.490000', '11.490000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');
INSERT INTO `jsh_depot_head` VALUES ('867', '出库', '零售', '112-6874589-9305071', '112-6874589-9305071', '2020-12-21 10:25:12', '2020-12-21 02:13:10', null, null, '63', '17', '10.990000', '10.990000', '现付', null, null, null, null, null, null, null, null, null, null, null, '0', null, '63', '0');

-- ----------------------------
-- Table structure for jsh_depot_item
-- ----------------------------
DROP TABLE IF EXISTS `jsh_depot_item`;
CREATE TABLE `jsh_depot_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `header_id` bigint(20) NOT NULL COMMENT '表头Id',
  `material_id` bigint(20) NOT NULL COMMENT '商品Id',
  `material_extend_id` bigint(20) DEFAULT NULL COMMENT '商品扩展id',
  `material_unit` varchar(20) DEFAULT NULL COMMENT '商品计量单位',
  `oper_number` decimal(24,6) DEFAULT NULL COMMENT '数量',
  `basic_number` decimal(24,6) DEFAULT NULL COMMENT '基础数量，如kg、瓶',
  `unit_price` decimal(24,6) DEFAULT NULL COMMENT '单价',
  `tax_unit_price` decimal(24,6) DEFAULT NULL COMMENT '含税单价',
  `all_price` decimal(24,6) DEFAULT NULL COMMENT '金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `img` varchar(50) DEFAULT NULL COMMENT '图片',
  `incidentals` decimal(24,6) DEFAULT NULL COMMENT '运杂费',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库ID',
  `another_depot_id` bigint(20) DEFAULT NULL COMMENT '调拨时，对方仓库Id',
  `tax_rate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `tax_money` decimal(24,6) DEFAULT NULL COMMENT '税额',
  `tax_last_money` decimal(24,6) DEFAULT NULL COMMENT '价税合计',
  `other_field1` varchar(50) DEFAULT NULL COMMENT '自定义字段1-名称',
  `other_field2` varchar(50) DEFAULT NULL COMMENT '自定义字段2-型号',
  `other_field3` varchar(50) DEFAULT NULL COMMENT '自定义字段3-制造商',
  `other_field4` varchar(50) DEFAULT NULL COMMENT '自定义字段4-名称',
  `other_field5` varchar(50) DEFAULT NULL COMMENT '自定义字段5-名称',
  `material_type` varchar(20) DEFAULT NULL COMMENT '商品类型',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`),
  KEY `FK2A819F475D61CCF7` (`material_id`),
  KEY `FK2A819F474BB6190E` (`header_id`),
  KEY `FK2A819F479485B3F5` (`depot_id`),
  KEY `FK2A819F47729F5392` (`another_depot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1152 DEFAULT CHARSET=utf8 COMMENT='单据子表';

-- ----------------------------
-- Records of jsh_depot_item
-- ----------------------------
INSERT INTO `jsh_depot_item` VALUES ('1100', '816', '981', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1101', '817', '1002', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1102', '818', '982', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1103', '819', '984', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1104', '820', '985', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1105', '821', '990', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1106', '822', '983', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1107', '823', '999', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1108', '824', '958', '43', '件', '1.000000', '1.000000', '9.990000', null, '9.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1109', '825', '1005', '43', '件', '1.000000', '1.000000', '10.490000', null, '10.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1110', '826', '987', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1111', '827', '988', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1112', '828', '990', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1113', '829', '1003', '43', '件', '2.000000', '2.000000', '21.980000', null, '43.960000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1114', '830', '933', '43', '件', '1.000000', '1.000000', '7.990000', null, '7.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1115', '831', '985', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1116', '832', '990', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1117', '833', '983', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1118', '834', '981', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1119', '835', '986', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1120', '836', '986', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1121', '837', '987', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1122', '838', '987', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1123', '839', '1014', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1124', '840', '991', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1125', '841', '987', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1126', '842', '986', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1127', '843', '982', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1128', '844', '1004', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1129', '845', '983', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1130', '846', '986', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1131', '847', '981', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1132', '848', '991', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1133', '849', '987', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1134', '850', '1002', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1135', '851', '990', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1136', '852', '1014', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1137', '853', '985', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1138', '854', '1010', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1139', '855', '983', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1140', '856', '986', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1141', '857', '985', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1142', '858', '985', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1143', '859', '981', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1144', '860', '996', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1145', '861', '983', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1146', '862', '991', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1147', '863', '990', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1148', '864', '993', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1149', '865', '982', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1150', '866', '994', '43', '件', '1.000000', '1.000000', '11.490000', null, '11.490000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');
INSERT INTO `jsh_depot_item` VALUES ('1151', '867', '993', '43', '件', '1.000000', '1.000000', '10.990000', null, '10.990000', null, null, null, '14', null, null, null, null, null, null, null, null, null, null, '63', '0');

-- ----------------------------
-- Table structure for jsh_function
-- ----------------------------
DROP TABLE IF EXISTS `jsh_function`;
CREATE TABLE `jsh_function` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `number` varchar(50) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `parent_number` varchar(50) DEFAULT NULL COMMENT '上级编号',
  `url` varchar(100) DEFAULT NULL COMMENT '链接',
  `state` bit(1) DEFAULT NULL COMMENT '收缩',
  `sort` varchar(50) DEFAULT NULL COMMENT '排序',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `push_btn` varchar(50) DEFAULT NULL COMMENT '功能按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '图标',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COMMENT='功能模块表';

-- ----------------------------
-- Records of jsh_function
-- ----------------------------
INSERT INTO `jsh_function` VALUES ('1', '0001', '系统管理', '0', '', '', '0910', '', '电脑版', '', 'icon-settings', '0');
INSERT INTO `jsh_function` VALUES ('13', '000102', '角色管理', '0001', '/pages/manage/role.html', '\0', '0130', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('14', '000103', '用户管理', '0001', '/pages/manage/user.html', '\0', '0140', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('15', '000104', '日志管理', '0001', '/pages/manage/log.html', '\0', '0160', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('16', '000105', '功能管理', '0001', '/pages/manage/functions.html', '\0', '0166', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('21', '0101', '商品管理', '0', '', '\0', '0620', '', '电脑版', null, 'icon-social-dropbox', '0');
INSERT INTO `jsh_function` VALUES ('22', '010101', '商品类别', '0101', '/pages/materials/materialcategory.html', '\0', '0230', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('23', '010102', '商品信息', '0101', '/pages/materials/material.html', '\0', '0240', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('24', '0102', '基本资料', '0', '', '\0', '0750', '', '电脑版', null, 'icon-grid', '0');
INSERT INTO `jsh_function` VALUES ('25', '01020101', '供应商信息', '0102', '/pages/manage/vendor.html', '\0', '0260', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('26', '010202', '仓库信息', '0102', '/pages/manage/depot.html', '\0', '0270', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('31', '010206', '经手人管理', '0102', '/pages/manage/person.html', '\0', '0284', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('32', '0502', '仓库管理', '0', '', '\0', '0330', '', '电脑版', '', 'icon-loop', '0');
INSERT INTO `jsh_function` VALUES ('33', '050201', '采购入库', '0502', '/pages/bill/purchase_in_list.html', '\0', '0340', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('38', '0603', '销售管理', '0', '', '\0', '0390', '', '电脑版', '', 'icon-briefcase', '1');
INSERT INTO `jsh_function` VALUES ('40', '080107', '调拨出库', '0801', '/pages/bill/allocation_out_list.html', '\0', '0807', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('41', '060303', '销售出库', '0603', '/pages/bill/sale_out_list.html', '\0', '0394', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('44', '0704', '财务管理', '0', '', '\0', '0450', '', '电脑版', '', 'icon-map', '0');
INSERT INTO `jsh_function` VALUES ('59', '030101', '库存状况', '0301', '/pages/reports/in_out_stock_report.html', '\0', '0600', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('194', '010204', '收支项目', '0102', '/pages/manage/inOutItem.html', '\0', '0282', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('195', '010205', '结算账户', '0102', '/pages/manage/account.html', '\0', '0283', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('197', '070402', '收入单', '0704', '/pages/financial/item_in.html', '\0', '0465', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('198', '0301', '报表查询', '0', '', '\0', '0570', '', '电脑版', null, 'icon-pie-chart', '1');
INSERT INTO `jsh_function` VALUES ('199', '050204', '采购退货', '0502', '/pages/bill/purchase_back_list.html', '\0', '0345', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('200', '060305', '销售退货', '0603', '/pages/bill/sale_back_list.html', '\0', '0396', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('201', '080103', '其它入库', '0801', '/pages/bill/other_in_list.html', '\0', '0803', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('202', '080105', '其它出库', '0801', '/pages/bill/other_out_list.html', '\0', '0805', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('203', '070403', '支出单', '0704', '/pages/financial/item_out.html', '\0', '0470', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('204', '070404', '收款单', '0704', '/pages/financial/money_in.html', '\0', '0475', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('205', '070405', '付款单', '0704', '/pages/financial/money_out.html', '\0', '0480', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('206', '070406', '转账单', '0704', '/pages/financial/giro.html', '\0', '0490', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('207', '030102', '账户统计', '0301', '/pages/reports/account_report.html', '\0', '0610', '', '电脑版', '', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('208', '030103', '进货统计', '0301', '/pages/reports/buy_in_report.html', '\0', '0620', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('209', '030104', '销售统计', '0301', '/pages/reports/sale_out_report.html', '\0', '0630', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('210', '040102', '零售出库', '0401', '/pages/bill/retail_out_list.html', '\0', '0405', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('211', '040104', '零售退货', '0401', '/pages/bill/retail_back_list.html', '\0', '0407', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('212', '070407', '收预付款', '0704', '/pages/financial/advance_in.html', '\0', '0495', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('217', '01020102', '客户信息', '0102', '/pages/manage/customer.html', '\0', '0262', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('218', '01020103', '会员信息', '0102', '/pages/manage/member.html', '\0', '0263', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('220', '010103', '计量单位', '0101', '/pages/manage/unit.html', '\0', '0245', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('225', '0401', '零售管理', '0', '', '\0', '0101', '', '电脑版', '', 'icon-present', '0');
INSERT INTO `jsh_function` VALUES ('226', '030106', '入库明细', '0301', '/pages/reports/in_detail.html', '\0', '0640', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('227', '030107', '出库明细', '0301', '/pages/reports/out_detail.html', '\0', '0645', '', '电脑版', '', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('228', '030108', '入库汇总', '0301', '/pages/reports/in_material_count.html', '\0', '0650', '', '电脑版', '', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('229', '030109', '出库汇总', '0301', '/pages/reports/out_material_count.html', '\0', '0655', '', '电脑版', '', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('232', '080109', '组装单', '0801', '/pages/bill/assemble_list.html', '\0', '0809', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('233', '080111', '拆卸单', '0801', '/pages/bill/disassemble_list.html', '\0', '0811', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('234', '000105', '系统配置', '0001', '/pages/manage/systemConfig.html', '\0', '0165', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('235', '030110', '客户对账', '0301', '/pages/reports/customer_account.html', '\0', '0660', '', '电脑版', '', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('236', '000106', '商品属性', '0001', '/pages/materials/materialProperty.html', '\0', '0168', '', '电脑版', '1', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('237', '030111', '供应商对账', '0301', '/pages/reports/vendor_account.html', '\0', '0665', '', '电脑版', '', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('239', '0801', '仓库管理', '0', '', '\0', '0420', '', '电脑版', '', 'icon-layers', '1');
INSERT INTO `jsh_function` VALUES ('240', '010104', '序列号', '0101', '/pages/manage/serialNumber.html', '\0', '0246', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('241', '050202', '采购订单', '0502', '/pages/bill/purchase_orders_list.html', '\0', '0335', '', '电脑版', '1,2', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('242', '060301', '销售订单', '0603', '/pages/bill/sale_orders_list.html', '\0', '0392', '', '电脑版', '1,2', 'icon-notebook', '0');
INSERT INTO `jsh_function` VALUES ('243', '000108', '机构管理', '0001', '/pages/manage/organization.html', '', '0150', '', '电脑版', '1', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('244', '030112', '库存预警', '0301', '/pages/reports/stock_warning_report.html', '\0', '0670', '', '电脑版', '', 'icon-notebook', '1');
INSERT INTO `jsh_function` VALUES ('245', '000107', '插件管理', '0001', '/pages/manage/plugin.html', '\0', '0170', '', '电脑版', '1', 'icon-notebook', '0');

-- ----------------------------
-- Table structure for jsh_in_out_item
-- ----------------------------
DROP TABLE IF EXISTS `jsh_in_out_item`;
CREATE TABLE `jsh_in_out_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='收支项目';

-- ----------------------------
-- Records of jsh_in_out_item
-- ----------------------------
INSERT INTO `jsh_in_out_item` VALUES ('21', '快递费', '支出', '', '63', '0');
INSERT INTO `jsh_in_out_item` VALUES ('22', '房租收入', '收入', '', '63', '1');
INSERT INTO `jsh_in_out_item` VALUES ('23', '利息收入', '收入', '收入', '63', '1');
INSERT INTO `jsh_in_out_item` VALUES ('24', '广告费', '支出', '', '63', '0');
INSERT INTO `jsh_in_out_item` VALUES ('25', '仓库管理费', '支出', '', '63', '0');

-- ----------------------------
-- Table structure for jsh_log
-- ----------------------------
DROP TABLE IF EXISTS `jsh_log`;
CREATE TABLE `jsh_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `operation` varchar(500) DEFAULT NULL COMMENT '操作模块名称',
  `client_ip` varchar(50) DEFAULT NULL COMMENT '客户端IP',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '操作状态 0==成功，1==失败',
  `content` varchar(1000) DEFAULT NULL COMMENT '详情',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `FKF2696AA13E226853` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7198 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of jsh_log
-- ----------------------------
INSERT INTO `jsh_log` VALUES ('6800', '63', '用户', '192.168.221.1', '2020-11-13 17:56:09', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6801', '63', '用户', '192.168.221.1', '2020-11-20 14:03:42', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6802', '63', '用户', '192.168.221.1', '2020-11-23 14:16:40', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6803', '63', '单据', '192.168.221.1', '2020-11-23 14:16:59', '0', '删除CGDD00000000345', '63');
INSERT INTO `jsh_log` VALUES ('6804', '63', '单据', '192.168.221.1', '2020-11-23 14:16:59', '0', '删除CGDD00000000333', '63');
INSERT INTO `jsh_log` VALUES ('6805', '63', '单据', '192.168.221.1', '2020-11-23 14:16:59', '0', '删除CGDD00000000305', '63');
INSERT INTO `jsh_log` VALUES ('6806', '63', '用户', '192.168.221.1', '2020-11-23 14:17:37', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6807', '63', '用户', '192.168.221.1', '2020-11-23 14:18:18', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6808', '63', '单据', '192.168.221.1', '2020-11-23 14:19:54', '0', '新增CGDD00000000354', '63');
INSERT INTO `jsh_log` VALUES ('6809', '63', '用户', '192.168.221.1', '2020-11-23 15:54:00', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6810', '63', '用户', '192.168.221.1', '2020-11-25 10:38:40', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6813', '63', '单据', '192.168.221.1', '2020-11-25 10:41:31', '0', '新增QTRK00000000356', '63');
INSERT INTO `jsh_log` VALUES ('6814', '63', '单据', '192.168.221.1', '2020-11-25 10:47:55', '0', '新增LSCK00000000358', '63');
INSERT INTO `jsh_log` VALUES ('6815', '63', '单据', '192.168.221.1', '2020-11-25 10:50:11', '0', '新增LSCK00000000359', '63');
INSERT INTO `jsh_log` VALUES ('6816', '63', '用户', '192.168.221.1', '2020-11-25 11:16:33', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6817', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000352', '63');
INSERT INTO `jsh_log` VALUES ('6818', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000351', '63');
INSERT INTO `jsh_log` VALUES ('6819', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000339', '63');
INSERT INTO `jsh_log` VALUES ('6820', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000334', '63');
INSERT INTO `jsh_log` VALUES ('6821', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000329', '63');
INSERT INTO `jsh_log` VALUES ('6822', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000320', '63');
INSERT INTO `jsh_log` VALUES ('6823', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000319', '63');
INSERT INTO `jsh_log` VALUES ('6824', '63', '单据', '192.168.221.1', '2020-11-25 11:17:57', '0', '删除CGRK00000000318', '63');
INSERT INTO `jsh_log` VALUES ('6825', '63', '单据', '192.168.221.1', '2020-11-25 11:17:58', '0', '删除CGRK00000000274', '63');
INSERT INTO `jsh_log` VALUES ('6826', '63', '单据', '192.168.221.1', '2020-11-25 11:17:58', '0', '删除CGRK00000000265', '63');
INSERT INTO `jsh_log` VALUES ('6827', '63', '单据', '192.168.221.1', '2020-11-25 11:18:02', '0', '删除CGRK00000000264', '63');
INSERT INTO `jsh_log` VALUES ('6828', '63', '单据', '192.168.221.1', '2020-11-25 11:18:02', '0', '删除CGRK00000000261', '63');
INSERT INTO `jsh_log` VALUES ('6829', '63', '单据', '192.168.221.1', '2020-11-25 11:18:15', '0', '新增CGRK00000000361', '63');
INSERT INTO `jsh_log` VALUES ('6830', '63', '单据', '192.168.221.1', '2020-11-25 11:19:47', '0', '新增CGTH00000000362', '63');
INSERT INTO `jsh_log` VALUES ('6831', '63', '商家', '192.168.221.1', '2020-11-25 11:21:57', '0', '修改60', '63');
INSERT INTO `jsh_log` VALUES ('6832', '63', '单据', '192.168.221.1', '2020-11-25 11:21:57', '0', '新增LSCK00000000363', '63');
INSERT INTO `jsh_log` VALUES ('6833', '63', '单据', '192.168.221.1', '2020-11-25 11:22:32', '0', '新增LSTH00000000364', '63');
INSERT INTO `jsh_log` VALUES ('6834', '63', '商品', '192.168.221.1', '2020-11-25 11:26:11', '0', '删除[商品1][商品2][商品3][商品8][商品17]', '63');
INSERT INTO `jsh_log` VALUES ('6835', '63', '商品', '192.168.221.1', '2020-11-25 11:26:22', '0', '删除[序列号商品测试][商品test1]', '63');
INSERT INTO `jsh_log` VALUES ('6836', '63', '序列号', '192.168.221.1', '2020-11-25 11:27:30', '0', '删除[12312323423223][3215952626621201][3215952626621202]', '63');
INSERT INTO `jsh_log` VALUES ('6837', '63', '仓库', '192.168.221.1', '2020-11-25 11:29:11', '0', '删除[仓库2][仓库3]', '63');
INSERT INTO `jsh_log` VALUES ('6838', '63', '商品', '192.168.221.1', '2020-11-25 14:06:38', '0', '新增毛毯', '63');
INSERT INTO `jsh_log` VALUES ('6839', '63', '计量单位', '192.168.221.1', '2020-11-25 14:11:35', '0', '新增条,箱(1:12)', '63');
INSERT INTO `jsh_log` VALUES ('6840', '63', '财务', '192.168.221.1', '2020-11-25 14:17:44', '0', '新增ZC20201125141721', '63');
INSERT INTO `jsh_log` VALUES ('6841', '63', '财务明细', '192.168.221.1', '2020-11-25 14:17:44', '0', '修改,headerId:107', '63');
INSERT INTO `jsh_log` VALUES ('6842', '63', '财务明细', '192.168.221.1', '2020-11-25 14:17:44', '0', '删除', '63');
INSERT INTO `jsh_log` VALUES ('6843', '63', '商品类型', '192.168.221.1', '2020-11-25 14:54:14', '0', '修改宠物用品', '63');
INSERT INTO `jsh_log` VALUES ('6844', '63', '商品类型', '192.168.221.1', '2020-11-25 14:56:12', '0', '新增服饰', '63');
INSERT INTO `jsh_log` VALUES ('6845', '63', '商品类型', '192.168.221.1', '2020-11-25 14:57:14', '0', '新增日用品', '63');
INSERT INTO `jsh_log` VALUES ('6846', '63', '计量单位', '192.168.221.1', '2020-11-25 15:02:54', '0', '新增件,1(1:12)', '63');
INSERT INTO `jsh_log` VALUES ('6847', '63', '商品', '192.168.221.1', '2020-11-25 15:04:39', '0', '新增滑板小子卫衣', '63');
INSERT INTO `jsh_log` VALUES ('6848', '63', '商品', '192.168.221.1', '2020-11-25 15:04:59', '0', '删除[毛毯]', '63');
INSERT INTO `jsh_log` VALUES ('6849', '63', '收支项目', '192.168.221.1', '2020-11-25 15:09:10', '0', '新增广告费', '63');
INSERT INTO `jsh_log` VALUES ('6850', '63', '收支项目', '192.168.221.1', '2020-11-25 15:09:30', '0', '新增仓库管理费', '63');
INSERT INTO `jsh_log` VALUES ('6851', '63', '收支项目', '192.168.221.1', '2020-11-25 15:09:39', '0', '删除[房租收入][利息收入]', '63');
INSERT INTO `jsh_log` VALUES ('6852', '63', '商家', '192.168.221.1', '2020-11-25 15:09:50', '0', '删除[供应商3][供应商5]', '63');
INSERT INTO `jsh_log` VALUES ('6853', '63', '用户', '192.168.221.1', '2020-11-25 15:43:56', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6854', '63', '用户', '192.168.221.1', '2020-11-25 15:47:17', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6855', '63', '用户', '192.168.221.1', '2020-11-25 16:15:22', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6856', '63', '用户', '192.168.221.1', '2020-11-25 16:49:30', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6857', '63', '用户', '192.168.221.1', '2020-11-25 16:51:20', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6858', '63', '用户', '192.168.221.1', '2020-11-25 16:53:40', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6859', '63', '用户', '192.168.221.1', '2020-11-25 17:25:59', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6860', '63', '用户', '192.168.221.1', '2020-11-25 17:33:12', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6861', '63', '用户', '192.168.221.1', '2020-11-25 17:33:54', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6862', '63', '用户', '192.168.221.1', '2020-11-25 17:39:20', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6863', '63', '用户', '192.168.221.1', '2020-11-25 17:41:33', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6864', '63', '用户', '192.168.221.1', '2020-11-25 17:43:13', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6865', '63', '用户', '192.168.221.1', '2020-11-25 18:02:25', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6866', '63', '用户', '192.168.221.1', '2020-11-25 18:04:18', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6867', '63', '单据', '192.168.221.1', '2020-11-25 18:05:58', '0', '新增LSCK00000000368', '63');
INSERT INTO `jsh_log` VALUES ('6868', '63', '商家', '192.168.221.1', '2020-11-25 18:07:48', '0', '修改60', '63');
INSERT INTO `jsh_log` VALUES ('6869', '63', '单据', '192.168.221.1', '2020-11-25 18:07:48', '0', '新增LSCK00000000369', '63');
INSERT INTO `jsh_log` VALUES ('6870', '63', '单据', '192.168.221.1', '2020-11-25 18:08:45', '0', '新增LSCK00000000370', '63');
INSERT INTO `jsh_log` VALUES ('6871', '63', '单据', '192.168.221.1', '2020-11-25 18:09:12', '0', '新增LSCK00000000371', '63');
INSERT INTO `jsh_log` VALUES ('6872', '63', '用户', '192.168.221.1', '2020-11-25 18:15:45', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6873', '63', '用户', '192.168.221.1', '2020-11-25 18:17:08', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6874', '63', '用户', '192.168.221.1', '2020-11-25 18:20:41', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6875', '63', '用户', '192.168.221.1', '2020-11-25 18:21:51', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6876', '63', '用户', '192.168.221.1', '2020-11-25 18:22:25', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6877', '63', '用户', '192.168.221.1', '2020-11-25 18:25:00', '0', '登录jsh', '63');
INSERT INTO `jsh_log` VALUES ('6878', '63', '单据', '192.168.221.1', '2020-11-25 18:28:56', '0', '新增LSCK00000000381', '63');
INSERT INTO `jsh_log` VALUES ('6879', '63', '用户', '192.168.221.1', '2020-11-25 18:32:50', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6880', '63', '用户', '192.168.221.1', '2020-11-26 09:39:11', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6881', '63', '用户', '192.168.221.1', '2020-11-26 09:40:43', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6882', '63', '商家', '192.168.221.1', '2020-11-26 09:55:48', '0', '修改60', '63');
INSERT INTO `jsh_log` VALUES ('6883', '63', '单据', '192.168.221.1', '2020-11-26 09:55:48', '0', '删除LSCK00000000363', '63');
INSERT INTO `jsh_log` VALUES ('6884', '63', '单据', '192.168.221.1', '2020-11-26 09:55:48', '0', '删除LSCK00000000359', '63');
INSERT INTO `jsh_log` VALUES ('6885', '63', '单据', '192.168.221.1', '2020-11-26 09:55:48', '0', '删除LSCK00000000358', '63');
INSERT INTO `jsh_log` VALUES ('6886', '63', '单据', '192.168.221.1', '2020-11-26 09:55:48', '0', '删除LSCK00000000314', '63');
INSERT INTO `jsh_log` VALUES ('6887', '63', '单据', '192.168.221.1', '2020-11-26 09:56:04', '0', '新增LSCK00000000385', '63');
INSERT INTO `jsh_log` VALUES ('6888', '63', '用户', '192.168.221.1', '2020-11-26 10:02:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6889', '63', '单据', '192.168.221.1', '2020-11-26 10:06:04', '0', '新增LSCK00000000386', '63');
INSERT INTO `jsh_log` VALUES ('6890', '63', '单据', '192.168.221.1', '2020-11-26 10:06:29', '0', '新增LSCK00000000387', '63');
INSERT INTO `jsh_log` VALUES ('6891', '63', '用户', '192.168.221.1', '2020-11-26 10:16:46', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6892', '63', '用户', '192.168.221.1', '2020-11-26 10:32:41', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6893', '63', '用户', '192.168.221.1', '2020-11-26 10:34:53', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6894', '63', '单据', '192.168.221.1', '2020-11-26 10:39:32', '0', '新增LSCK00000000389', '63');
INSERT INTO `jsh_log` VALUES ('6895', '63', '单据', '192.168.221.1', '2020-11-26 10:42:26', '0', '新增CGRK00000000390', '63');
INSERT INTO `jsh_log` VALUES ('6896', '63', '用户', '192.168.221.1', '2020-11-26 10:50:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6897', '63', '用户', '192.168.221.1', '2020-11-26 11:07:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6898', '63', '用户', '192.168.221.1', '2020-11-26 11:07:40', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6899', '63', '用户', '192.168.221.1', '2020-11-26 11:12:55', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6900', '63', '用户', '192.168.221.1', '2020-11-26 11:14:04', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6901', '63', '单据', '192.168.221.1', '2020-11-26 11:14:33', '0', '新增CGRK00000000391', '63');
INSERT INTO `jsh_log` VALUES ('6902', '63', '用户', '192.168.221.1', '2020-11-26 11:17:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6903', '63', '单据', '192.168.221.1', '2020-11-26 11:18:07', '0', '新增CGRK00000000392', '63');
INSERT INTO `jsh_log` VALUES ('6904', '63', '单据', '192.168.221.1', '2020-11-26 11:18:49', '0', '新增CGRK00000000393', '63');
INSERT INTO `jsh_log` VALUES ('6905', '63', '用户', '192.168.221.1', '2020-11-26 11:33:12', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6906', '63', '用户', '192.168.221.1', '2020-11-26 11:34:17', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6907', '63', '用户', '192.168.221.1', '2020-11-26 11:40:19', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6908', '63', '用户', '192.168.221.1', '2020-11-26 11:43:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6909', '63', '单据', '192.168.221.1', '2020-11-26 11:44:20', '0', '新增LSCK00000000394', '63');
INSERT INTO `jsh_log` VALUES ('6910', '63', '用户', '192.168.221.1', '2020-11-26 11:45:43', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6911', '63', '用户', '192.168.221.1', '2020-11-26 14:32:08', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6912', '63', '用户', '192.168.221.1', '2020-11-26 14:33:21', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6913', '63', '用户', '192.168.221.1', '2020-11-26 14:33:43', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6914', '63', '用户', '192.168.221.1', '2020-11-26 14:36:31', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6915', '63', '用户', '192.168.221.1', '2020-11-26 14:39:18', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6916', '63', '用户', '192.168.221.1', '2020-11-26 14:39:53', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6917', '63', '用户', '192.168.221.1', '2020-11-26 14:40:23', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6918', '63', '用户', '192.168.221.1', '2020-11-26 14:56:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6919', '63', '用户', '192.168.221.1', '2020-11-26 15:04:23', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6920', '63', '用户', '192.168.221.1', '2020-11-26 15:07:47', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6921', '63', '用户', '192.168.221.1', '2020-11-27 16:13:53', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6922', '63', '用户', '192.168.221.1', '2020-11-27 16:28:38', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6923', '63', '用户', '192.168.221.1', '2020-11-27 16:31:16', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6924', '63', '用户', '192.168.221.1', '2020-11-27 16:43:13', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6925', '63', '用户', '192.168.221.1', '2020-11-27 16:43:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6926', '63', '用户', '192.168.221.1', '2020-11-27 16:46:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6927', '63', '用户', '192.168.221.1', '2020-11-27 16:48:41', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6928', '63', '用户', '192.168.221.1', '2020-11-27 16:49:58', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6929', '63', '单据', '192.168.221.1', '2020-11-27 16:50:25', '0', '新增LSCK00000000395', '63');
INSERT INTO `jsh_log` VALUES ('6930', '63', '单据', '192.168.221.1', '2020-11-27 16:50:55', '0', '新增LSCK00000000396', '63');
INSERT INTO `jsh_log` VALUES ('6931', '63', '用户', '192.168.221.1', '2020-11-27 16:57:21', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6932', '63', '单据', '192.168.221.1', '2020-11-27 17:44:38', '0', '新增LSCK00000000404', '63');
INSERT INTO `jsh_log` VALUES ('6933', '63', '单据', '192.168.221.1', '2020-11-27 17:45:47', '0', '删除LSCK00000000404', '63');
INSERT INTO `jsh_log` VALUES ('6934', '63', '单据', '192.168.221.1', '2020-11-27 17:46:00', '0', '新增LSCK00000000405', '63');
INSERT INTO `jsh_log` VALUES ('6935', '63', '单据', '192.168.221.1', '2020-11-27 17:46:28', '0', '新增LSCK00000000406', '63');
INSERT INTO `jsh_log` VALUES ('6936', '63', '单据', '192.168.221.1', '2020-11-27 17:46:37', '0', '新增LSCK00000000407', '63');
INSERT INTO `jsh_log` VALUES ('6937', '63', '单据', '192.168.221.1', '2020-11-27 17:46:51', '0', '新增LSCK00000000408', '63');
INSERT INTO `jsh_log` VALUES ('6938', '63', '单据', '192.168.221.1', '2020-11-27 17:47:00', '0', '新增LSCK00000000409', '63');
INSERT INTO `jsh_log` VALUES ('6939', '63', '单据', '192.168.221.1', '2020-11-27 17:47:11', '0', '新增LSCK00000000410', '63');
INSERT INTO `jsh_log` VALUES ('6940', '63', '单据', '192.168.221.1', '2020-11-27 17:49:03', '0', '新增LSCK00000000414', '63');
INSERT INTO `jsh_log` VALUES ('6941', '63', '单据', '192.168.221.1', '2020-11-27 17:49:46', '0', '新增LSCK00000000415', '63');
INSERT INTO `jsh_log` VALUES ('6942', '63', '单据', '192.168.221.1', '2020-11-27 17:52:05', '0', '新增LSCK00000000417', '63');
INSERT INTO `jsh_log` VALUES ('6943', '63', '单据', '192.168.221.1', '2020-11-27 17:54:17', '0', '新增LSCK00000000418', '63');
INSERT INTO `jsh_log` VALUES ('6944', '63', '单据', '192.168.221.1', '2020-11-27 17:54:32', '0', '新增LSCK00000000419', '63');
INSERT INTO `jsh_log` VALUES ('6945', '63', '单据', '192.168.221.1', '2020-11-27 17:55:00', '0', '新增LSCK00000000420', '63');
INSERT INTO `jsh_log` VALUES ('6946', '63', '用户', '192.168.221.1', '2020-11-28 16:54:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6947', '63', '单据', '192.168.221.1', '2020-11-28 17:01:40', '0', '删除LSCK00000000420', '63');
INSERT INTO `jsh_log` VALUES ('6948', '63', '单据', '192.168.221.1', '2020-11-28 17:01:40', '0', '删除LSCK00000000419', '63');
INSERT INTO `jsh_log` VALUES ('6949', '63', '单据', '192.168.221.1', '2020-11-28 17:01:40', '0', '删除LSCK00000000418', '63');
INSERT INTO `jsh_log` VALUES ('6950', '63', '单据', '192.168.221.1', '2020-11-28 17:01:40', '0', '删除LSCK00000000417', '63');
INSERT INTO `jsh_log` VALUES ('6951', '63', '单据', '192.168.221.1', '2020-11-28 17:01:41', '0', '删除LSCK00000000415', '63');
INSERT INTO `jsh_log` VALUES ('6952', '63', '单据', '192.168.221.1', '2020-11-28 17:01:41', '0', '删除LSCK00000000414', '63');
INSERT INTO `jsh_log` VALUES ('6953', '63', '单据', '192.168.221.1', '2020-11-28 17:01:41', '0', '删除LSCK00000000410', '63');
INSERT INTO `jsh_log` VALUES ('6954', '63', '单据', '192.168.221.1', '2020-11-28 17:01:41', '0', '删除LSCK00000000409', '63');
INSERT INTO `jsh_log` VALUES ('6955', '63', '单据', '192.168.221.1', '2020-11-28 17:01:41', '0', '删除LSCK00000000408', '63');
INSERT INTO `jsh_log` VALUES ('6956', '63', '单据', '192.168.221.1', '2020-11-28 17:01:41', '0', '删除LSCK00000000407', '63');
INSERT INTO `jsh_log` VALUES ('6957', '63', '单据', '192.168.221.1', '2020-11-28 17:01:43', '0', '删除LSCK00000000406', '63');
INSERT INTO `jsh_log` VALUES ('6958', '63', '单据', '192.168.221.1', '2020-11-28 17:01:43', '0', '删除LSCK00000000405', '63');
INSERT INTO `jsh_log` VALUES ('6959', '63', '单据', '192.168.221.1', '2020-11-28 17:01:43', '0', '删除LSCK00000000396', '63');
INSERT INTO `jsh_log` VALUES ('6960', '63', '单据', '192.168.221.1', '2020-11-28 17:01:44', '0', '删除LSCK00000000395', '63');
INSERT INTO `jsh_log` VALUES ('6961', '63', '单据', '192.168.221.1', '2020-11-28 17:01:44', '0', '删除LSCK00000000389', '63');
INSERT INTO `jsh_log` VALUES ('6962', '63', '单据', '192.168.221.1', '2020-11-28 17:01:44', '0', '删除LSCK00000000394', '63');
INSERT INTO `jsh_log` VALUES ('6963', '63', '单据', '192.168.221.1', '2020-11-28 17:01:44', '0', '删除LSCK00000000389', '63');
INSERT INTO `jsh_log` VALUES ('6964', '63', '单据', '192.168.221.1', '2020-11-28 17:01:44', '0', '删除LSCK00000000387', '63');
INSERT INTO `jsh_log` VALUES ('6965', '63', '单据', '192.168.221.1', '2020-11-28 17:01:44', '0', '删除LSCK00000000386', '63');
INSERT INTO `jsh_log` VALUES ('6966', '63', '商品', '192.168.221.1', '2020-11-28 17:06:25', '0', '新增滑板小子卫衣', '63');
INSERT INTO `jsh_log` VALUES ('6967', '63', '商品', '192.168.221.1', '2020-11-28 17:15:31', '0', '导入16条', '63');
INSERT INTO `jsh_log` VALUES ('6968', '63', '商品', '192.168.221.1', '2020-11-28 17:21:16', '0', '删除[滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣][滑板小子卫衣]', '63');
INSERT INTO `jsh_log` VALUES ('6969', '63', '商品', '192.168.221.1', '2020-11-28 17:21:49', '0', '导入0条', '63');
INSERT INTO `jsh_log` VALUES ('6970', '63', '商品', '192.168.221.1', '2020-11-28 17:22:25', '0', '导入0条', '63');
INSERT INTO `jsh_log` VALUES ('6971', '63', '商品', '192.168.221.1', '2020-11-28 17:23:24', '0', '导入0条', '63');
INSERT INTO `jsh_log` VALUES ('6972', '63', '商品', '192.168.221.1', '2020-11-28 17:23:47', '0', '导入0条', '63');
INSERT INTO `jsh_log` VALUES ('6973', '63', '商品', '192.168.221.1', '2020-11-28 17:24:28', '0', '导入16条', '63');
INSERT INTO `jsh_log` VALUES ('6974', '63', '单据', '192.168.221.1', '2020-11-28 17:35:45', '0', '新增LSCK00000000426', '63');
INSERT INTO `jsh_log` VALUES ('6975', '63', '单据', '192.168.221.1', '2020-11-28 17:45:12', '0', '新增LSCK00000000427', '63');
INSERT INTO `jsh_log` VALUES ('6976', '63', '用户', '192.168.221.1', '2020-11-30 11:21:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6977', '63', '用户', '192.168.221.1', '2020-11-30 11:28:16', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6978', '63', '单据', '192.168.221.1', '2020-11-30 11:31:22', '0', '新增LSCK00000000430', '63');
INSERT INTO `jsh_log` VALUES ('6979', '63', '单据', '192.168.221.1', '2020-11-30 11:40:32', '0', '新增LSCK00000000432', '63');
INSERT INTO `jsh_log` VALUES ('6980', '63', '用户', '192.168.221.1', '2020-11-30 13:51:58', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6981', '63', '单据', '192.168.221.1', '2020-11-30 14:14:00', '0', '新增LSCK00000000435', '63');
INSERT INTO `jsh_log` VALUES ('6982', '63', '单据', '192.168.221.1', '2020-11-30 14:27:36', '0', '新增LSCK00000000438', '63');
INSERT INTO `jsh_log` VALUES ('6983', '63', '用户', '192.168.221.1', '2020-11-30 15:52:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6984', '63', '单据', '192.168.221.1', '2020-11-30 15:56:18', '0', '新增LSCK00000000440', '63');
INSERT INTO `jsh_log` VALUES ('6985', '63', '用户', '192.168.221.1', '2020-11-30 16:16:49', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6986', '63', '单据', '192.168.221.1', '2020-11-30 16:19:35', '0', '新增LSCK00000000441', '63');
INSERT INTO `jsh_log` VALUES ('6987', '63', '单据', '192.168.221.1', '2020-11-30 16:42:54', '0', '新增LSCK00000000442', '63');
INSERT INTO `jsh_log` VALUES ('6988', '63', '商品', '192.168.221.1', '2020-11-30 17:28:04', '0', '导入1条', '63');
INSERT INTO `jsh_log` VALUES ('6989', '63', '单据', '192.168.221.1', '2020-11-30 17:37:05', '0', '新增LSTH00000000443', '63');
INSERT INTO `jsh_log` VALUES ('6990', '63', '单据', '192.168.221.1', '2020-11-30 17:38:05', '0', '新增LSTH00000000445', '63');
INSERT INTO `jsh_log` VALUES ('6991', '63', '商品', '192.168.221.1', '2020-11-30 17:49:23', '0', '导入1条', '63');
INSERT INTO `jsh_log` VALUES ('6992', '63', '用户', '192.168.221.1', '2020-11-30 17:53:06', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6993', '63', '商品', '192.168.221.1', '2020-11-30 17:58:47', '0', '导入4条', '63');
INSERT INTO `jsh_log` VALUES ('6994', '63', '商品', '192.168.221.1', '2020-11-30 18:00:16', '0', '导入2条', '63');
INSERT INTO `jsh_log` VALUES ('6995', '63', '用户', '192.168.221.1', '2020-12-01 10:50:58', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6996', '63', '用户', '192.168.221.1', '2020-12-01 11:08:11', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6997', '63', '用户', '192.168.221.1', '2020-12-01 11:08:57', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6998', '63', '用户', '192.168.221.1', '2020-12-01 14:15:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('6999', '63', '用户', '192.168.221.1', '2020-12-01 14:22:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7000', '63', '用户', '192.168.221.1', '2020-12-01 14:34:19', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7001', '63', '用户', '192.168.221.1', '2020-12-01 14:37:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7002', '63', '用户', '192.168.221.1', '2020-12-01 14:42:05', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7003', '63', '单据', '192.168.221.1', '2020-12-01 14:53:41', '0', '新增LSCK00000000453', '63');
INSERT INTO `jsh_log` VALUES ('7004', '63', '用户', '192.168.221.1', '2020-12-01 15:09:13', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7005', '63', '用户', '192.168.221.1', '2020-12-01 15:10:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7006', '63', '用户', '192.168.221.1', '2020-12-01 15:15:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7007', '63', '用户', '192.168.221.1', '2020-12-01 15:18:13', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7008', '63', '用户', '192.168.221.1', '2020-12-01 15:21:03', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7009', '63', '用户', '192.168.221.1', '2020-12-01 15:35:34', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7010', '63', '用户', '192.168.221.1', '2020-12-01 15:37:34', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7011', '63', '用户', '192.168.221.1', '2020-12-01 16:20:57', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7012', '63', '用户', '192.168.221.1', '2020-12-01 18:07:57', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7013', '63', '用户', '192.168.221.1', '2020-12-02 10:17:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7014', '63', '用户', '192.168.221.1', '2020-12-02 10:25:25', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7015', '63', '用户', '192.168.221.1', '2020-12-02 10:26:59', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7016', '63', '用户', '192.168.221.1', '2020-12-02 10:29:30', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7017', '63', '用户', '192.168.221.1', '2020-12-02 10:29:48', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7018', '63', '用户', '192.168.221.1', '2020-12-02 10:39:25', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7019', '63', '单据', '192.168.221.1', '2020-12-02 10:41:18', '0', '删除113-2314702-5345831', '63');
INSERT INTO `jsh_log` VALUES ('7020', '63', '用户', '192.168.221.1', '2020-12-02 10:43:14', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7021', '63', '商品', '192.168.221.1', '2020-12-02 11:08:38', '0', '删除[商品200]', '63');
INSERT INTO `jsh_log` VALUES ('7022', '63', '用户', '192.168.221.1', '2020-12-02 11:11:28', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7023', '63', '用户', '192.168.221.1', '2020-12-02 11:15:51', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7024', '63', '商品', '192.168.221.1', '2020-12-02 11:21:45', '0', '导入77条', '63');
INSERT INTO `jsh_log` VALUES ('7025', '63', '商品', '192.168.221.1', '2020-12-02 11:30:18', '0', '导入101条', '63');
INSERT INTO `jsh_log` VALUES ('7026', '63', '单据', '192.168.221.1', '2020-12-02 11:36:00', '0', '删除113-8056942-9712226', '63');
INSERT INTO `jsh_log` VALUES ('7027', '63', '单据', '192.168.221.1', '2020-12-02 11:36:00', '0', '删除114-9182258-1659446', '63');
INSERT INTO `jsh_log` VALUES ('7028', '63', '用户', '192.168.221.1', '2020-12-02 11:41:39', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7029', '63', '用户', '192.168.221.1', '2020-12-02 14:15:05', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7030', '63', '用户', '192.168.221.1', '2020-12-02 14:21:05', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7031', '63', '商品', '192.168.221.1', '2020-12-02 16:26:06', '0', '导入121条', '63');
INSERT INTO `jsh_log` VALUES ('7032', '63', '用户', '192.168.221.1', '2020-12-02 16:36:00', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7033', '63', '用户', '192.168.221.1', '2020-12-02 16:48:30', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7034', '63', '用户', '192.168.221.1', '2020-12-02 16:55:53', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7035', '63', '用户', '192.168.221.1', '2020-12-02 17:01:48', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7036', '63', '用户', '192.168.221.1', '2020-12-02 18:03:39', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7037', '63', '用户', '192.168.221.1', '2020-12-02 18:05:07', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7038', '63', '用户', '192.168.221.1', '2020-12-02 18:06:56', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7039', '63', '用户', '192.168.221.1', '2020-12-02 18:09:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7040', '63', '用户', '192.168.221.1', '2020-12-02 18:14:02', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7041', '63', '用户', '192.168.221.1', '2020-12-02 18:17:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7042', '63', '用户', '192.168.221.1', '2020-12-02 18:18:48', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7043', '63', '用户', '192.168.221.1', '2020-12-02 18:20:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7044', '63', '用户', '192.168.221.1', '2020-12-02 18:23:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7045', '63', '用户', '192.168.221.1', '2020-12-02 18:32:04', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7046', '63', '用户', '192.168.221.1', '2020-12-04 09:59:49', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7047', '63', '用户', '192.168.221.1', '2020-12-04 10:12:21', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7048', '63', '用户', '192.168.221.1', '2020-12-04 10:17:00', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7049', '63', '用户', '192.168.221.1', '2020-12-04 10:30:20', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7050', '63', '用户', '192.168.221.1', '2020-12-04 10:36:53', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7051', '63', '单据', '192.168.221.1', '2020-12-04 10:44:09', '0', '新增CGRK00000000456', '63');
INSERT INTO `jsh_log` VALUES ('7052', '63', '用户', '192.168.221.1', '2020-12-04 11:06:33', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7053', '63', '用户', '192.168.221.1', '2020-12-04 11:12:38', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7054', '63', '用户', '192.168.221.1', '2020-12-04 11:36:52', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7055', '63', '用户', '192.168.221.1', '2020-12-04 11:39:31', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7056', '63', '用户', '192.168.221.1', '2020-12-04 11:40:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7057', '63', '用户', '192.168.221.1', '2020-12-04 11:41:18', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7058', '63', '用户', '192.168.221.1', '2020-12-04 11:43:47', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7059', '63', '用户', '192.168.221.1', '2020-12-04 11:45:13', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7060', '63', '用户', '192.168.221.1', '2020-12-04 11:46:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7061', '63', '单据', '192.168.221.1', '2020-12-04 11:47:17', '0', '新增LSCK00000000457', '63');
INSERT INTO `jsh_log` VALUES ('7062', '63', '用户', '192.168.221.1', '2020-12-04 11:54:31', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7063', '63', '单据', '192.168.221.1', '2020-12-04 14:05:59', '0', '新增LSCK00000000458', '63');
INSERT INTO `jsh_log` VALUES ('7064', '63', '用户', '192.168.221.1', '2020-12-04 15:58:48', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7065', '63', '商品类型', '192.168.221.1', '2020-12-04 16:02:17', '0', '新增宠物毛毯', '63');
INSERT INTO `jsh_log` VALUES ('7066', '63', '商品类型', '192.168.221.1', '2020-12-04 16:04:05', '0', '新增格子雄胸背', '63');
INSERT INTO `jsh_log` VALUES ('7067', '63', '商品类型', '192.168.221.1', '2020-12-04 16:04:39', '0', '新增滑板小子卫衣', '63');
INSERT INTO `jsh_log` VALUES ('7068', '63', '商品类型', '192.168.221.1', '2020-12-04 16:04:55', '0', '新增圣诞裙子', '63');
INSERT INTO `jsh_log` VALUES ('7069', '63', '商品类型', '192.168.221.1', '2020-12-04 16:05:20', '0', '新增云朵绒背心', '63');
INSERT INTO `jsh_log` VALUES ('7070', '63', '商品类型', '192.168.221.1', '2020-12-04 16:05:41', '0', '新增云朵绒背心Z1', '63');
INSERT INTO `jsh_log` VALUES ('7071', '63', '商品类型', '192.168.221.1', '2020-12-04 16:06:00', '0', '新增玩具', '63');
INSERT INTO `jsh_log` VALUES ('7072', '63', '商品类型', '192.168.221.1', '2020-12-04 16:06:17', '0', '新增宠物玩具套装', '63');
INSERT INTO `jsh_log` VALUES ('7073', '63', '商品类型', '192.168.221.1', '2020-12-04 16:06:53', '0', '新增其他', '63');
INSERT INTO `jsh_log` VALUES ('7074', '63', '商品类型', '192.168.221.1', '2020-12-04 16:06:54', '0', '新增其他', '63');
INSERT INTO `jsh_log` VALUES ('7075', '63', '商品类型', '192.168.221.1', '2020-12-04 16:07:00', '0', '删除[其他]', '63');
INSERT INTO `jsh_log` VALUES ('7076', '63', '商品类型', '192.168.221.1', '2020-12-04 16:10:09', '0', '新增白毛绒外套', '63');
INSERT INTO `jsh_log` VALUES ('7077', '63', '商品类型', '192.168.221.1', '2020-12-04 16:10:47', '0', '新增宠物尿垫', '63');
INSERT INTO `jsh_log` VALUES ('7078', '63', '商品类型', '192.168.221.1', '2020-12-04 16:12:14', '0', '新增苏格兰风三角巾', '63');
INSERT INTO `jsh_log` VALUES ('7079', '63', '商品类型', '192.168.221.1', '2020-12-04 16:12:39', '0', '新增儿童围脖印花', '63');
INSERT INTO `jsh_log` VALUES ('7080', '63', '商品类型', '192.168.221.1', '2020-12-04 16:13:30', '0', '新增儿童纯色过膝袜', '63');
INSERT INTO `jsh_log` VALUES ('7081', '63', '单据', '192.168.221.1', '2020-12-04 16:14:18', '0', '删除LSCK00000000458', '63');
INSERT INTO `jsh_log` VALUES ('7082', '63', '单据', '192.168.221.1', '2020-12-04 16:14:18', '0', '删除LSCK00000000457', '63');
INSERT INTO `jsh_log` VALUES ('7083', '63', '用户', '192.168.221.1', '2020-12-04 16:15:50', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7084', '63', '用户', '192.168.221.1', '2020-12-04 16:17:01', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7085', '63', '用户', '192.168.221.1', '2020-12-04 16:30:58', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7086', '63', '用户', '192.168.221.1', '2020-12-04 16:57:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7087', '63', '用户', '192.168.221.1', '2020-12-04 16:58:40', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7088', '63', '用户', '192.168.221.1', '2020-12-04 17:03:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7089', '63', '单据', '192.168.221.1', '2020-12-04 17:04:00', '0', '新增LSCK00000000460', '63');
INSERT INTO `jsh_log` VALUES ('7090', '63', '单据', '192.168.221.1', '2020-12-04 17:12:56', '0', '新增LSTH00000000461', '63');
INSERT INTO `jsh_log` VALUES ('7091', '63', '用户', '192.168.221.1', '2020-12-04 17:14:51', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7092', '63', '用户', '192.168.221.1', '2020-12-04 17:15:43', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7093', '63', '用户', '192.168.221.1', '2020-12-04 17:26:03', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7094', '63', '用户', '192.168.221.1', '2020-12-04 17:29:59', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7095', '63', '用户', '192.168.221.1', '2020-12-04 17:31:21', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7096', '63', '用户', '192.168.221.1', '2020-12-04 17:32:17', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7097', '63', '用户', '192.168.221.1', '2020-12-04 17:34:48', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7098', '63', '用户', '192.168.221.1', '2020-12-04 17:35:57', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7099', '63', '用户', '192.168.221.1', '2020-12-04 17:39:44', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7100', '63', '用户', '192.168.221.1', '2020-12-04 17:43:01', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7101', '63', '用户', '192.168.221.1', '2020-12-04 17:44:04', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7102', '63', '用户', '192.168.221.1', '2020-12-04 17:45:56', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7103', '63', '用户', '192.168.221.1', '2020-12-04 17:47:14', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7104', '63', '用户', '192.168.221.1', '2020-12-04 17:50:02', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7105', '63', '用户', '192.168.221.1', '2020-12-04 17:53:39', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7106', '63', '用户', '192.168.221.1', '2020-12-04 17:54:19', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7107', '63', '用户', '192.168.221.1', '2020-12-04 17:58:08', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7108', '63', '用户', '192.168.221.1', '2020-12-04 17:58:31', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7109', '63', '用户', '192.168.221.1', '2020-12-14 10:22:07', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7110', '63', '单据', '192.168.221.1', '2020-12-14 10:29:10', '0', '新增LSCK00000000462', '63');
INSERT INTO `jsh_log` VALUES ('7111', '63', '单据', '192.168.221.1', '2020-12-14 10:29:19', '0', '新增LSCK00000000463', '63');
INSERT INTO `jsh_log` VALUES ('7112', '63', '用户', '192.168.221.1', '2020-12-14 11:00:29', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7113', '63', '单据', '192.168.221.1', '2020-12-14 11:01:08', '0', '新增LSCK00000000465', '63');
INSERT INTO `jsh_log` VALUES ('7114', '63', '单据', '192.168.221.1', '2020-12-14 11:13:20', '0', '新增LSTH00000000466', '63');
INSERT INTO `jsh_log` VALUES ('7115', '63', '用户', '192.168.221.1', '2020-12-14 11:14:11', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7116', '63', '用户', '192.168.221.1', '2020-12-14 11:15:46', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7117', '63', '用户', '192.168.221.1', '2020-12-14 11:16:55', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7118', '63', '用户', '192.168.221.1', '2020-12-14 11:20:33', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7119', '63', '用户', '192.168.221.1', '2020-12-14 11:24:03', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7120', '63', '用户', '192.168.221.1', '2020-12-14 11:32:01', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7121', '63', '用户', '192.168.221.1', '2020-12-14 11:33:47', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7122', '63', '用户', '192.168.221.1', '2020-12-14 11:35:15', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7123', '63', '用户', '192.168.221.1', '2020-12-14 13:01:56', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7124', '63', '用户', '192.168.221.1', '2020-12-14 13:48:20', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7125', '63', '用户', '192.168.221.1', '2020-12-14 13:53:42', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7126', '63', '用户', '192.168.221.1', '2020-12-14 13:56:09', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7127', '63', '用户', '192.168.221.1', '2020-12-14 14:14:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7128', '63', '单据', '192.168.221.1', '2020-12-14 14:15:06', '0', '新增LSCK00000000467', '63');
INSERT INTO `jsh_log` VALUES ('7129', '63', '用户', '192.168.221.1', '2020-12-14 14:20:14', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7130', '63', '单据', '192.168.221.1', '2020-12-14 14:25:39', '0', '新增LSCK00000000468', '63');
INSERT INTO `jsh_log` VALUES ('7131', '63', '用户', '192.168.221.1', '2020-12-14 14:35:41', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7132', '63', '用户', '192.168.221.1', '2020-12-14 14:36:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7133', '63', '用户', '192.168.221.1', '2020-12-14 14:39:46', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7134', '63', '用户', '192.168.221.1', '2020-12-14 14:47:37', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7135', '63', '用户', '192.168.221.1', '2020-12-14 14:48:31', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7136', '63', '单据', '192.168.221.1', '2020-12-14 15:00:10', '0', '新增LSCK00000000469', '63');
INSERT INTO `jsh_log` VALUES ('7137', '63', '用户', '192.168.221.1', '2020-12-14 15:08:39', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7138', '63', '用户', '192.168.221.1', '2020-12-14 15:22:52', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7139', '63', '用户', '192.168.221.1', '2020-12-14 15:30:59', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7140', '132', '用户', '192.168.221.1', '2020-12-14 15:34:07', '0', '登录15657872898', '132');
INSERT INTO `jsh_log` VALUES ('7141', '63', '用户', '192.168.221.1', '2020-12-14 15:34:23', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7142', '63', '用户', '192.168.221.1', '2020-12-14 16:34:53', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7143', '63', '用户', '192.168.221.1', '2020-12-14 16:43:17', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7144', '63', '用户', '192.168.221.1', '2020-12-14 16:47:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7145', '63', '用户', '192.168.221.1', '2020-12-14 16:53:08', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7146', '63', '用户', '192.168.221.1', '2020-12-14 16:56:30', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7147', '63', '用户', '192.168.221.1', '2020-12-14 17:20:10', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7148', '63', '用户', '192.168.221.1', '2020-12-14 17:44:08', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7149', '63', '用户', '192.168.221.1', '2020-12-14 17:49:54', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7150', '63', '用户', '192.168.221.1', '2020-12-14 17:57:19', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7151', '63', '用户', '192.168.221.1', '2020-12-15 09:53:19', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7152', '63', '用户', '192.168.221.1', '2020-12-15 10:02:59', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7153', '63', '用户', '192.168.221.1', '2020-12-15 10:08:36', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7154', '63', '用户', '192.168.221.1', '2020-12-15 10:13:35', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7155', '63', '用户', '192.168.221.1', '2020-12-15 10:26:24', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7156', '63', '用户', '192.168.221.1', '2020-12-15 10:28:14', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7157', '63', '用户', '192.168.221.1', '2020-12-15 10:29:57', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7158', '63', '用户', '192.168.221.1', '2020-12-15 10:30:48', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7159', '63', '单据', '192.168.221.1', '2020-12-15 10:32:14', '0', '删除LSTH00000000461', '63');
INSERT INTO `jsh_log` VALUES ('7160', '63', '单据', '192.168.221.1', '2020-12-15 10:32:22', '0', '删除CGRK00000000456', '63');
INSERT INTO `jsh_log` VALUES ('7161', '63', '财务', '192.168.221.1', '2020-12-15 10:32:44', '0', '删除[SR20191228121609][SR20200721163125][SR20200721225712][SR20200913184412]', '63');
INSERT INTO `jsh_log` VALUES ('7162', '63', '财务', '192.168.221.1', '2020-12-15 10:32:49', '0', '删除[ZC20191228121854][ZC20201125141721]', '63');
INSERT INTO `jsh_log` VALUES ('7163', '63', '商家', '192.168.221.1', '2020-12-15 10:33:16', '0', '修改供应商1', '63');
INSERT INTO `jsh_log` VALUES ('7164', '63', '单据', '192.168.221.1', '2020-12-15 10:36:05', '0', '删除LSCK00000000469', '63');
INSERT INTO `jsh_log` VALUES ('7165', '63', '单据', '192.168.221.1', '2020-12-15 10:36:05', '0', '删除LSCK00000000468', '63');
INSERT INTO `jsh_log` VALUES ('7166', '63', '单据', '192.168.221.1', '2020-12-15 10:36:05', '0', '删除LSCK00000000467', '63');
INSERT INTO `jsh_log` VALUES ('7167', '63', '用户', '192.168.221.1', '2020-12-15 14:19:58', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7168', '63', '用户', '192.168.221.1', '2020-12-15 14:21:51', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7169', '63', '用户', '192.168.221.1', '2020-12-16 14:00:10', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7170', '63', '用户', '192.168.221.1', '2020-12-16 14:04:11', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7171', '63', '用户', '192.168.221.1', '2020-12-16 14:07:36', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7172', '63', '用户', '192.168.221.1', '2020-12-16 15:55:01', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7173', '63', '用户', '192.168.221.1', '2020-12-16 16:08:06', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7174', '63', '用户', '192.168.221.1', '2020-12-16 16:20:59', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7175', '63', '用户', '192.168.221.1', '2020-12-16 16:29:35', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7176', '63', '用户', '192.168.221.1', '2020-12-16 16:31:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7177', '63', '用户', '192.168.221.1', '2020-12-16 16:36:45', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7178', '63', '单据', '192.168.221.1', '2020-12-16 16:37:26', '0', '修改114-5255970-1783399', '63');
INSERT INTO `jsh_log` VALUES ('7179', '63', '用户', '192.168.221.1', '2020-12-16 16:43:00', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7180', '63', '用户', '192.168.221.1', '2020-12-16 16:46:26', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7181', '63', '用户', '192.168.221.1', '2020-12-16 16:47:19', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7182', '63', '单据', '192.168.221.1', '2020-12-16 16:49:11', '0', '新增LSCK00000000471', '63');
INSERT INTO `jsh_log` VALUES ('7183', '63', '用户', '192.168.221.1', '2020-12-16 16:51:15', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7184', '63', '用户', '192.168.221.1', '2020-12-16 17:27:08', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7185', '63', '用户', '192.168.221.1', '2020-12-16 17:29:05', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7186', '63', '用户', '192.168.221.1', '2020-12-17 09:59:26', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7187', '63', '用户', '192.168.221.1', '2020-12-17 10:00:46', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7188', '63', '用户', '192.168.221.1', '2020-12-17 10:01:25', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7189', '63', '用户', '192.168.221.1', '2020-12-17 10:43:25', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7190', '63', '单据', '192.168.221.1', '2020-12-17 10:43:51', '0', '新增LSCK00000000472', '63');
INSERT INTO `jsh_log` VALUES ('7191', '63', '单据', '192.168.221.1', '2020-12-17 10:44:04', '0', '新增LSCK00000000473', '63');
INSERT INTO `jsh_log` VALUES ('7192', '63', '单据', '192.168.221.1', '2020-12-17 10:44:15', '0', '新增LSCK00000000474', '63');
INSERT INTO `jsh_log` VALUES ('7193', '63', '用户', '192.168.9.209', '2020-12-21 10:02:52', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7194', '63', '用户', '192.168.9.209', '2020-12-21 10:11:40', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7195', '63', '用户', '192.168.9.209', '2020-12-21 10:14:34', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7196', '63', '用户', '192.168.9.209', '2020-12-21 10:20:30', '0', '登录Kim', '63');
INSERT INTO `jsh_log` VALUES ('7197', '63', '用户', '192.168.9.209', '2020-12-21 11:23:16', '0', '登录Kim', '63');

-- ----------------------------
-- Table structure for jsh_material
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material`;
CREATE TABLE `jsh_material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` bigint(20) DEFAULT NULL COMMENT '产品类型id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `mfrs` varchar(50) DEFAULT NULL COMMENT '制造商',
  `safety_stock` decimal(24,6) DEFAULT NULL COMMENT '安全存量（KG）',
  `model` varchar(50) DEFAULT NULL COMMENT '型号',
  `standard` varchar(50) DEFAULT NULL COMMENT '规格',
  `color` varchar(50) DEFAULT NULL COMMENT '颜色',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位-单个',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `unit_id` bigint(20) DEFAULT NULL COMMENT '计量单位Id',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用 0-禁用  1-启用',
  `other_field1` varchar(50) DEFAULT NULL COMMENT '自定义1',
  `other_field2` varchar(50) DEFAULT NULL COMMENT '自定义2',
  `other_field3` varchar(50) DEFAULT NULL COMMENT '自定义3',
  `enable_serial_number` varchar(1) DEFAULT '0' COMMENT '是否开启序列号，0否，1是',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`),
  KEY `FK675951272AB6672C` (`category_id`),
  KEY `UnitId` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1055 DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Records of jsh_material
-- ----------------------------
INSERT INTO `jsh_material` VALUES ('568', '17', '商品1', '制1', '100.000000', 'sp1', '', '', '个', '', null, '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('587', '17', '商品test1', '南通中远', null, '', 'test1', '', '个', '', null, '', '', '', '', '0', '63', '1');
INSERT INTO `jsh_material` VALUES ('933', '22', '滑板小子卫衣', null, null, 'B08DF8T8RK', 'Medium', '粉色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('934', '22', '滑板小子卫衣', null, null, 'B08DF7NSHZ', 'Large', '粉色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('935', '22', '滑板小子卫衣', null, null, 'B08DFDJT9L', 'X-large', '粉色', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('936', '22', '滑板小子卫衣', null, null, 'B08DFTGJPF', 'XX-large', '粉色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('937', '22', '滑板小子卫衣', null, null, 'B08DFKTYM4', 'Medium', '蓝色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('938', '22', '滑板小子卫衣', null, null, 'B08DF7KQXP', 'Large', '蓝色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('939', '22', '滑板小子卫衣', null, null, 'B08DFS6ZJT', 'X-large', '蓝色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('940', '22', '滑板小子卫衣', null, null, 'B08DFP2RGY', 'XX-large', '蓝色', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('941', '22', '滑板小子卫衣', null, null, 'B08DFT88TV', 'Medium', '橘色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('942', '22', '滑板小子卫衣', null, null, 'B08DF7FH99', 'Large', '橘色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('943', '22', '滑板小子卫衣', null, null, 'B08DFPZMY7', 'X-large', '橘色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('944', '22', '滑板小子卫衣', null, null, 'B08DFBG5XW', 'XX-large', '橘色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('945', '22', '滑板小子卫衣', null, null, 'B08DF8WJ2P', 'Medium', '红色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('946', '22', '滑板小子卫衣', null, null, 'B08DF5PZX7', 'Large', '红色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('947', '22', '滑板小子卫衣', null, null, 'B08DFM38RJ', 'X-large', '红色', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('948', '22', '滑板小子卫衣', null, null, 'B08DFBQCBV', 'Small', '红色', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('949', '22', '宠物毛毯', null, null, 'B08DJ2TT8G', 'Small', '卡其 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('950', '22', '宠物毛毯', null, null, 'B08DHMQ1M8', 'Medium', '卡其 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('951', '22', '宠物毛毯', null, null, 'B08DHLKGQL', 'Large', '卡其 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('952', '22', '宠物毛毯', null, null, 'B08DHF25D1', 'Small', '米色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('953', '22', '宠物毛毯', null, null, 'B08DHJFF2P', 'Medium', '米色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('954', '22', '宠物毛毯', null, null, 'B08DHTXC5F', 'Large', '米色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('955', '22', '宠物毛毯', null, null, 'B08DH97S9Q', 'Small', '粉色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('956', '22', '宠物毛毯', null, null, 'B08DHQ2VQX', 'Medium', '粉色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('957', '22', '宠物毛毯', null, null, 'B08DHH5N7G', 'Large', '粉色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('958', '22', '宠物毛毯', null, null, 'B08DHNRJ1G', 'Small', '灰色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('959', '22', '宠物毛毯', null, null, 'B08DHGBFSL', 'Medium', '灰色 ', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('960', '22', '宠物毛毯', null, null, 'B08DHTJFDV', '', '灰色 Large', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('961', '22', '苏格兰风三角巾', null, null, 'B08DHQJHGT', '', '黑蓝橘 One Size', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('962', '22', '苏格兰风三角巾', null, null, 'B08DHJQG75', '', '粉红黄 One Size', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('963', '22', '苏格兰风三角巾', null, null, 'B08DHCCNYK', '', '蓝橘蓝 One Size', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('964', '22', '儿童围脖印花', null, null, 'B08FB1B9YH', '', '彩虹 长颈鹿 两组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('965', '22', '儿童围脖印花', null, null, 'B08F9TMF9F', '', '暗黑老鼠 炫彩 两组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('966', '22', '儿童围脖印花', null, null, 'B08F9FPSTY', '', '黑底Kiss 深蓝独角兽 两组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('967', '22', '儿童围脖印花', null, null, 'B08F9LTKJN', '', '熊猫 白底恐龙  两组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('968', '22', '儿童围脖印花', null, null, 'B08F9G6SMQ', '', '菠萝 Game Over 两组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('969', '22', '儿童纯色过膝袜', null, null, 'B08FD5NTCS', '', '白色 三组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('970', '22', '儿童纯色过膝袜', null, null, 'B08FD6V2YX', '', '黑色 三组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('971', '22', '儿童纯色过膝袜', null, null, 'B08FD7LJCZ', '', '粉色 三组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('972', '22', '儿童纯色过膝袜', null, null, 'B08FD62VP5', '', '黄色 三组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('973', '22', '儿童纯色过膝袜', null, null, 'B08FD6VDDM', '', '绿色 三组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('974', '22', '儿童纯色过膝袜', null, null, 'B08FD724BY', '', '红色 三组', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('975', '22', '格子熊胸背', null, null, 'B08FDLCBVK', '', '黄色 S', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('976', '22', '格子熊胸背', null, null, 'B08FDK97W9', '', '黄色 M', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('977', '22', '格子熊胸背', null, null, 'B08FDM26RQ', '', '灰色 S', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('978', '22', '格子熊胸背', null, null, 'B08FDL4H5S', '', '灰色 M', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('979', '22', '格子熊胸背', null, null, 'B08FDL4RGL', '', '粉色 S', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('980', '22', '格子熊胸背', null, null, 'B08FDK555S', '', '粉色 M', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('981', '22', '云朵绒背心', null, null, 'B08KRNNBFK', '', '紫色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('982', '22', '云朵绒背心', null, null, 'B08KRW7H4N', '', '紫色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('983', '22', '云朵绒背心', null, null, 'B08KR927KF', '', '紫色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('984', '22', '云朵绒背心', null, null, 'B08KRGZS2M', '', '紫色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('985', '22', '云朵绒背心', null, null, 'B08N5XYTKF', '', '米色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('986', '22', '云朵绒背心', null, null, 'B08NDFXZW1', '', '米色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('987', '22', '云朵绒背心', null, null, 'B08NDF7FMG', '', '米色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('988', '22', '云朵绒背心', null, null, 'B08KRZ7TYC', '', '米色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('989', '22', '云朵绒背心', null, null, 'B08KRYNVGV', '', '蓝色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('990', '22', '云朵绒背心', null, null, 'B08KRWY3HV', '', '蓝色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('991', '22', '云朵绒背心', null, null, 'B08KS1GVLC', '', '蓝色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('992', '22', '云朵绒背心', null, null, 'B08NDG5ZLP', '', '蓝色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('993', '22', '云朵绒背心', null, null, 'B08KRZ5XGM', '', '绿色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('994', '22', '云朵绒背心', null, null, 'B08KRX6ZR8', '', '绿色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('995', '22', '云朵绒背心', null, null, 'B08KRNTTBL', '', '绿色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('996', '22', '云朵绒背心', null, null, 'B08KS1172F', '', '绿色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('997', '22', '云朵绒背心', null, null, 'B08LV9NSBZ', '', '黄色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('998', '22', '云朵绒背心', null, null, 'B08LVBYMJ4', '', '黄色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('999', '22', '云朵绒背心', null, null, 'B08LVCGHPL', '', '黄色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1000', '22', '云朵绒背心', null, null, 'B08LVBLKN5', '', '黄色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1001', '22', '云朵绒背心', null, null, 'B08MVVX846', '', '德绒灰白条纹打底衫 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1002', '22', '云朵绒背心', null, null, 'B08MW1HJ33', '', '德绒灰白条纹打底衫 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1003', '22', '云朵绒背心', null, null, 'B08MVZTNJ7', '', '德绒灰白条纹打底衫 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1004', '22', '云朵绒背心', null, null, 'B08MW1N63W', '', '德绒灰白条纹打底衫 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1005', '22', '云朵绒背心 Z1', null, null, 'B08LZRBLZV', '', '紫色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1006', '22', '云朵绒背心 Z1', null, null, 'B08LZWSL76', '', '紫色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1007', '22', '云朵绒背心 Z1', null, null, 'B08LZTH2FS', '', '紫色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1008', '22', '云朵绒背心 Z1', null, null, 'B08LZSBY4G', '', '紫色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1009', '22', '云朵绒背心 Z1', null, null, 'B08LZSGG32', '', '米色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1010', '22', '云朵绒背心 Z1', null, null, 'B08LZTCT3L', '', '米色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1011', '22', '云朵绒背心 Z1', null, null, 'B08LZRVS32', '', '米色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1012', '22', '云朵绒背心 Z1', null, null, 'B08LZRKKHX', '', '米色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1013', '22', '云朵绒背心 Z1', null, null, 'B08LZRBBC9', '', '蓝色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1014', '22', '云朵绒背心 Z1', null, null, 'B08LZSCM44', '', '蓝色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1015', '22', '云朵绒背心 Z1', null, null, 'B08LZSL2ZH', '', '蓝色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1016', '22', '云朵绒背心 Z1', null, null, 'B08LZRZP8Q', '', '蓝色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1017', '22', '云朵绒背心 Z1', null, null, 'B08LZSP4Y5', '', '绿色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1018', '22', '云朵绒背心 Z1', null, null, 'B08LZS4B42', '', '绿色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1019', '22', '云朵绒背心 Z1', null, null, 'B08LZS9KPC', '', '绿色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1020', '22', '云朵绒背心 Z1', null, null, 'B08LZQXSKC', '', '绿色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1021', '22', '云朵绒背心 Z1', null, null, 'B08LZS2PQT', '', '黄色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1022', '22', '云朵绒背心 Z1', null, null, 'B08LZTGC24', '', '黄色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1023', '22', '云朵绒背心 Z1', null, null, 'B08LZRF8J9', '', '黄色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1024', '22', '云朵绒背心 Z1', null, null, 'B08LZRPNF2', '', '黄色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1025', '30', '宠物尿垫', null, null, 'B08K42YGW5', '', '', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1026', '30', '宠物尿垫', null, null, 'B08K427DCX', '', '', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1027', '31', '宠物玩具套装', null, null, 'B08JTN2BLQ', '', '5件套洁牙绳子', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1028', '31', '宠物玩具套装', null, null, 'B08JTP5HCJ', '', '6件套球', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1029', '31', '宠物玩具套装', null, null, 'B08JSNHQ32', '', '猴子长颈鹿熊', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1030', '22', '圣诞裙子', null, null, 'B08JTDK2G9', '', '红格麋鹿裙 XS', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1031', '22', '圣诞裙子', null, null, 'B08JTTD4ZR', '', '红格麋鹿裙 S', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1032', '22', '圣诞裙子', null, null, 'B08JTZ7NGX', '', '红格麋鹿裙 M', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1033', '22', '圣诞裙子', null, null, 'B08JTW3JFK', '', '红格麋鹿裙 L', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1034', '22', '圣诞裙子', null, null, 'B08JSHPPWK', '', '花瓣领蝴蝶结裙子 XS', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1035', '22', '圣诞裙子', null, null, 'B08JTVFJ9Q', '', '花瓣领蝴蝶结裙子 S', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1036', '22', '圣诞裙子', null, null, 'B08JTWB2PV', '', '花瓣领蝴蝶结裙子 M', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1037', '22', '圣诞裙子', null, null, 'B08JV2S83M', '', '花瓣领蝴蝶结裙子 L', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1038', '22', '白毛绒外套', null, null, 'B08PCT9HCP', '', '红色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1039', '22', '白毛绒外套', null, null, 'B08PCRQ5PF', '', '红色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1040', '22', '白毛绒外套', null, null, 'B08PCQ8V75', '', '红色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1041', '22', '白毛绒外套', null, null, 'B08PCTX9R8', '', '红色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1042', '22', '白毛绒外套', null, null, 'B08PCSZ22C', '', '黄色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1043', '22', '白毛绒外套', null, null, 'B08PCSGM7B', '', '黄色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1044', '22', '白毛绒外套', null, null, 'B08PCK3V6Q', '', '黄色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1045', '22', '白毛绒外套', null, null, 'B08PCT3SNK', '', '黄色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1046', '22', '白毛绒外套', null, null, 'B08PCV8N17', '', '蓝色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1047', '22', '白毛绒外套', null, null, 'B08PCSHSYT', '', '蓝色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1048', '22', '白毛绒外套', null, null, 'B08PCKMR2Y', '', '蓝色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1049', '22', '白毛绒外套', null, null, 'B08PCT2YWG', '', '蓝色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1050', '22', '白毛绒外套', null, null, 'B08PCTJY8W', '', '粉色 12', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1051', '22', '白毛绒外套', null, null, 'B08PCRCMS7', '', '粉色 14', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1052', '22', '白毛绒外套', null, null, 'B08PCRJS8L', '', '粉色 16', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1053', '22', '白毛绒外套', null, null, 'B08PCTKTSW', '', '粉色 18', '件', null, null, '', null, null, null, '0', '63', '0');
INSERT INTO `jsh_material` VALUES ('1054', '22', '背心', null, null, 'B08KRG3QPP', null, '米色 12', '件', null, null, '', null, null, null, '0', '63', '0');

-- ----------------------------
-- Table structure for jsh_material_category
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material_category`;
CREATE TABLE `jsh_material_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `category_level` smallint(6) DEFAULT NULL COMMENT '等级',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级id',
  `sort` varchar(10) DEFAULT NULL COMMENT '显示顺序',
  `status` varchar(1) DEFAULT '0' COMMENT '状态，0系统默认，1启用，2删除',
  `serial_no` varchar(100) DEFAULT NULL COMMENT '编号',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`),
  KEY `FK3EE7F725237A77D8` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Records of jsh_material_category
-- ----------------------------
INSERT INTO `jsh_material_category` VALUES ('17', '商品', null, '-1', '', '1', '', '', '2019-04-10 22:18:12', '63', '2019-04-10 22:18:12', '63', '63');
INSERT INTO `jsh_material_category` VALUES ('21', '宠物用品', null, '17', '', '1', '', '', '2020-07-20 23:08:44', '63', '2020-11-25 14:54:14', '63', '63');
INSERT INTO `jsh_material_category` VALUES ('22', '服饰', null, '21', '', '1', '', '', '2020-11-25 14:56:12', '63', '2020-11-25 14:56:12', '63', '63');
INSERT INTO `jsh_material_category` VALUES ('23', '日用品', null, '21', '', '1', '', '', '2020-11-25 14:57:14', '63', '2020-11-25 14:57:14', '63', '63');
INSERT INTO `jsh_material_category` VALUES ('30', '玩具', null, '21', '', '1', '', '', '2020-12-04 16:06:00', '63', '2020-12-04 16:06:00', '63', '63');
INSERT INTO `jsh_material_category` VALUES ('32', '其他', null, '21', '', '1', '', '', '2020-12-04 16:06:53', '63', '2020-12-04 16:06:53', '63', '63');

-- ----------------------------
-- Table structure for jsh_material_current_stock
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material_current_stock`;
CREATE TABLE `jsh_material_current_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `current_number` decimal(24,6) DEFAULT NULL COMMENT '当前库存数量',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品当前库存';

-- ----------------------------
-- Records of jsh_material_current_stock
-- ----------------------------
INSERT INTO `jsh_material_current_stock` VALUES ('1', '587', '14', '288.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('2', '570', '14', '-125.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('3', '568', '14', '5.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('4', '569', '14', '0.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('5', '588', '14', '-9.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('6', '569', '15', '0.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('7', '579', '14', '0.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('8', '568', '15', '1.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('9', '590', '14', '1056.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('10', '750', '14', '30.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('11', '749', '14', '8.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('12', '735', '14', '-16.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('13', '748', '14', '1109.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('14', '746', '14', '-12.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('15', '747', '14', '-12.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('16', '745', '14', '-15.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('17', '743', '14', '6.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('18', '754', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('19', '843', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('20', '842', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('21', '844', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('22', '1052', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('23', '1053', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('24', '1050', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('25', '1037', '14', '-12.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('26', '1051', '14', '341.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('27', '1046', '14', '9.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('28', '1047', '14', '-23.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('29', '1002', '14', '-2.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('30', '1043', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('31', '979', '14', '-23.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('32', '1026', '14', '7.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('33', '1031', '14', '-1.000000', '63', '0');
INSERT INTO `jsh_material_current_stock` VALUES ('34', '933', '14', '3.000000', '63', '0');

-- ----------------------------
-- Table structure for jsh_material_extend
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material_extend`;
CREATE TABLE `jsh_material_extend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `bar_code` varchar(50) DEFAULT NULL COMMENT '商品条码',
  `commodity_unit` varchar(50) DEFAULT NULL COMMENT '商品单位',
  `purchase_decimal` decimal(24,6) DEFAULT NULL COMMENT '采购价格',
  `commodity_decimal` decimal(24,6) DEFAULT NULL COMMENT '零售价格',
  `wholesale_decimal` decimal(24,6) DEFAULT NULL COMMENT '销售价格',
  `low_decimal` decimal(24,6) DEFAULT NULL COMMENT '最低售价',
  `default_flag` varchar(1) DEFAULT '1' COMMENT '是否为默认单位，1是，0否',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `create_serial` varchar(50) DEFAULT NULL COMMENT '创建人编码',
  `update_serial` varchar(50) DEFAULT NULL COMMENT '更新人编码',
  `update_time` bigint(20) DEFAULT NULL COMMENT '更新时间戳',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品价格扩展';

-- ----------------------------
-- Records of jsh_material_extend
-- ----------------------------
INSERT INTO `jsh_material_extend` VALUES ('1', '587', '1000', '个', '11.000000', '22.000000', '22.000000', '22.000000', '1', '2020-02-20 23:22:03', 'jsh', 'jsh', '1595263657135', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('2', '568', '1001', '个', '11.000000', '15.000000', '15.000000', '15.000000', '1', '2020-02-20 23:44:57', 'jsh', 'jsh', '1595265439418', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('3', '569', '1002', '只', '10.000000', '15.000000', '15.000000', '13.000000', '1', '2020-02-20 23:45:15', 'jsh', 'jsh', '1582213514731', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('4', '570', '1003', '个', '8.000000', '15.000000', '14.000000', '13.000000', '1', '2020-02-20 23:45:37', 'jsh', 'jsh', '1587657604430', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('5', '577', '1004', '个', '10.000000', '20.000000', '20.000000', '20.000000', '1', '2020-02-20 23:46:36', 'jsh', 'jsh', '1582213596494', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('6', '577', '1005', '箱', '120.000000', '240.000000', '240.000000', '240.000000', '0', '2020-02-20 23:46:36', 'jsh', 'jsh', '1582213596497', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('7', '579', '1006', '个', '20.000000', '30.000000', '30.000000', '30.000000', '1', '2020-02-20 23:47:04', 'jsh', 'jsh', '1595264270458', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('8', '579', '1007', '箱', '240.000000', '360.000000', '360.000000', '360.000000', '0', '2020-02-20 23:47:04', 'jsh', 'jsh', '1595264270466', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('9', '586', '1008', '个', '12.000000', '15.000000', '15.000000', '15.000000', '1', '2020-02-20 23:47:23', 'jsh', 'jsh', '1595254981896', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('10', '588', '1009', '个', '11.000000', '22.000000', '22.000000', '22.000000', '1', '2020-07-21 00:58:15', 'jsh', 'jsh', '1595264315873', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('11', '589', 'AJJFLKDFA4343', '条', '10.000000', '50.000000', '30.000000', '10.000000', '1', '2020-11-25 14:06:38', 'jsh', 'jsh', '1606284397709', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('12', '590', '1011', '件', '12.990000', '12.990000', '1.000000', '1.000000', '1', '2020-11-25 15:04:39', 'jsh', 'jsh', '1606287879190', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('13', '719', '2015', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554930880', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('14', '720', '2016', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554930941', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('15', '721', '2017', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554930985', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('16', '722', '2018', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554931034', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('17', '723', '2019', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554931151', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('18', '724', '2020', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554931197', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('19', '725', '2021', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554931259', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('20', '726', '2022', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554931360', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('21', '727', '2023', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:31', 'Kim', 'Kim', '1606554931460', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('22', '728', '2024', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:32', 'Kim', 'Kim', '1606554931533', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('23', '729', '2025', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:32', 'Kim', 'Kim', '1606554931619', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('24', '730', '2026', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:32', 'Kim', 'Kim', '1606554931686', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('25', '731', '2027', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:32', 'Kim', 'Kim', '1606554931765', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('26', '732', '2028', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:32', 'Kim', 'Kim', '1606554932036', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('27', '733', '2029', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:32', 'Kim', 'Kim', '1606554932107', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('28', '734', '2030', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:15:33', 'Kim', 'Kim', '1606554932623', '63', '1');
INSERT INTO `jsh_material_extend` VALUES ('29', '735', '2031', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467572', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('30', '736', '2032', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467598', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('31', '737', '2033', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467624', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('32', '738', '2034', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467652', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('33', '739', '2035', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467682', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('34', '740', '2036', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467711', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('35', '741', '2037', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467743', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('36', '742', '2038', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467779', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('37', '743', '2039', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467816', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('38', '744', '2040', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467850', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('39', '745', '2041', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467884', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('40', '746', '2042', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467911', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('41', '747', '2043', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467937', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('42', '748', '2044', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467965', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('43', '749', '2045', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555467996', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('44', '750', '2046', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-28 17:24:28', 'Kim', 'Kim', '1606555468030', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('45', '751', '2033', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-30 17:58:47', 'Kim', 'Kim', '1606730326886', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('46', '752', '2034', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-30 17:58:47', 'Kim', 'Kim', '1606730326924', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('47', '753', '2036', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-30 18:01:14', 'Kim', 'Kim', '1606730474279', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('48', '754', '2035', '件', '6.000000', '12.990000', '12.990000', null, '1', '2020-11-30 18:01:56', 'Kim', 'Kim', '1606730515746', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('49', '755', '1001', '件', null, null, null, null, '1', '2020-12-02 11:21:49', 'Kim', 'Kim', '1606879309490', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('50', '756', '1002', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309551', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('51', '757', '1003', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309588', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('52', '758', '1004', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309627', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('53', '759', '1005', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309664', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('54', '760', '1006', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309702', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('55', '761', '1007', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309738', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('56', '762', '1008', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309776', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('57', '763', '1009', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309813', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('58', '764', '1010', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309842', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('59', '765', '1011', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309873', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('60', '766', '1012', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309905', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('61', '767', '1013', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309935', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('62', '768', '1014', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309966', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('63', '769', '1015', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879309995', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('64', '770', '1016', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310029', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('65', '771', '1017', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310065', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('66', '772', '1018', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310099', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('67', '773', '1019', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310131', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('68', '774', '1020', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310160', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('69', '775', '1021', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310189', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('70', '776', '1022', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310218', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('71', '777', '1023', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310246', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('72', '778', '1024', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310274', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('73', '779', '1025', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310303', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('74', '780', '1026', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310336', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('75', '781', '1027', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310370', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('76', '782', '1028', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310407', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('77', '783', '1029', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310442', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('78', '784', '1030', '件', null, null, null, null, '1', '2020-12-02 11:21:50', 'Kim', 'Kim', '1606879310474', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('79', '785', '1031', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310503', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('80', '786', '1032', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310530', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('81', '787', '1033', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310557', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('82', '788', '1034', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310584', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('83', '789', '1035', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310612', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('84', '790', '1036', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310643', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('85', '791', '1037', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310670', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('86', '792', '1038', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310698', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('87', '793', '1039', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310729', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('88', '794', '1040', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310758', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('89', '795', '1041', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310786', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('90', '796', '1042', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310813', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('91', '797', '1043', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310839', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('92', '798', '1044', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310865', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('93', '799', '1045', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310894', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('94', '800', '1046', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310947', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('95', '801', '1047', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879310990', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('96', '802', '1048', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311053', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('97', '803', '1049', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311099', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('98', '804', '1050', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311129', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('99', '805', '1051', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311161', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('100', '806', '1052', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311196', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('101', '807', '1053', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311222', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('102', '808', '1054', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311253', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('103', '809', '1055', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311284', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('104', '810', '1056', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311314', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('105', '811', '1057', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311348', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('106', '812', '1058', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311384', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('107', '813', '1059', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311419', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('108', '814', '1060', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311456', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('109', '815', '1061', '件', null, null, null, null, '1', '2020-12-02 11:21:51', 'Kim', 'Kim', '1606879311490', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('110', '816', '1062', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311526', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('111', '817', '1063', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311554', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('112', '818', '1064', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311587', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('113', '819', '1089', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311621', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('114', '820', '1090', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311657', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('115', '821', '1091', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311694', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('116', '822', '1092', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311730', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('117', '823', '1093', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311764', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('118', '824', '1094', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311793', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('119', '825', '1095', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311819', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('120', '826', '1096', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311853', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('121', '827', '1097', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311882', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('122', '828', '1098', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311915', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('123', '829', '1099', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311949', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('124', '830', '1100', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879311983', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('125', '831', '1101', '件', null, null, null, null, '1', '2020-12-02 11:21:52', 'Kim', 'Kim', '1606879312015', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('126', '832', '1001', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818084', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('127', '833', '1002', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818112', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('128', '834', '1003', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818138', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('129', '835', '1004', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818163', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('130', '836', '1005', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818190', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('131', '837', '1006', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818219', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('132', '838', '1007', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818246', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('133', '839', '1008', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818273', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('134', '840', '1009', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818302', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('135', '841', '1010', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818328', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('136', '842', '1011', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818355', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('137', '843', '1012', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818383', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('138', '844', '1013', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818410', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('139', '845', '1014', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818437', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('140', '846', '1015', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818464', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('141', '847', '1016', '件', null, null, null, null, '1', '2020-12-02 11:30:18', 'Kim', 'Kim', '1606879818491', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('142', '848', '1017', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818517', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('143', '849', '1018', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818544', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('144', '850', '1019', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818579', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('145', '851', '1020', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818606', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('146', '852', '1021', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818629', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('147', '853', '1022', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818657', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('148', '854', '1023', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818687', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('149', '855', '1024', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818713', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('150', '856', '1025', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818738', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('151', '857', '1026', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818763', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('152', '858', '1027', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818789', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('153', '859', '1028', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818814', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('154', '860', '1029', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818972', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('155', '861', '1030', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879818997', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('156', '862', '1031', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819023', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('157', '863', '1032', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819049', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('158', '864', '1033', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819074', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('159', '865', '1034', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819103', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('160', '866', '1035', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819130', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('161', '867', '1036', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819157', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('162', '868', '1037', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819189', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('163', '869', '1038', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819218', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('164', '870', '1039', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819243', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('165', '871', '1040', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819270', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('166', '872', '1041', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819297', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('167', '873', '1042', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819325', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('168', '874', '1043', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819352', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('169', '875', '1044', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819379', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('170', '876', '1045', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819406', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('171', '877', '1046', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819431', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('172', '878', '1047', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819457', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('173', '879', '1048', '件', null, null, null, null, '1', '2020-12-02 11:30:19', 'Kim', 'Kim', '1606879819485', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('174', '880', '1049', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819510', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('175', '881', '1050', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819539', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('176', '882', '1051', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819566', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('177', '883', '1052', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819597', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('178', '884', '1053', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819623', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('179', '885', '1054', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819650', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('180', '886', '1055', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819678', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('181', '887', '1056', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819707', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('182', '888', '1057', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819734', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('183', '889', '1058', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819765', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('184', '890', '1059', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819793', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('185', '891', '1060', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819820', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('186', '892', '1061', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819846', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('187', '893', '1062', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819873', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('188', '894', '1063', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819899', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('189', '895', '1064', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819927', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('190', '896', '1089', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819954', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('191', '897', '1090', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879819982', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('192', '898', '1091', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820009', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('193', '899', '1092', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820034', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('194', '900', '1093', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820063', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('195', '901', '1094', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820090', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('196', '902', '1095', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820115', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('197', '903', '1096', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820141', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('198', '904', '1097', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820168', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('199', '905', '1098', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820199', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('200', '906', '1099', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820230', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('201', '907', '1100', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820258', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('202', '908', '1101', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820284', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('203', '909', '1102', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820310', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('204', '910', '1103', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820338', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('205', '911', '1104', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820363', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('206', '912', '1105', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820394', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('207', '913', '1106', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820422', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('208', '914', '1107', '件', null, null, null, null, '1', '2020-12-02 11:30:20', 'Kim', 'Kim', '1606879820471', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('209', '915', '1108', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820504', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('210', '916', '1109', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820542', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('211', '917', '1110', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820572', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('212', '918', '1111', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820601', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('213', '919', '1112', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820626', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('214', '920', '1113', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820651', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('215', '921', '1114', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820676', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('216', '922', '1115', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820703', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('217', '923', '1116', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820728', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('218', '924', '1117', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820753', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('219', '925', '1118', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820789', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('220', '926', '1119', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820818', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('221', '927', '1120', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820845', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('222', '928', '1121', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820872', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('223', '929', '1122', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820898', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('224', '930', '1123', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820923', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('225', '931', '1124', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820948', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('226', '932', '1125', '件', null, null, null, null, '1', '2020-12-02 11:30:21', 'Kim', 'Kim', '1606879820974', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('227', '933', '1001', '件', null, null, null, null, '1', '2020-12-02 16:26:06', 'Kim', 'Kim', '1606897566236', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('228', '934', '1002', '件', null, null, null, null, '1', '2020-12-02 16:26:06', 'Kim', 'Kim', '1606897566285', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('229', '935', '1003', '件', null, null, null, null, '1', '2020-12-02 16:26:06', 'Kim', 'Kim', '1606897566314', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('230', '936', '1004', '件', null, null, null, null, '1', '2020-12-02 16:26:06', 'Kim', 'Kim', '1606897566353', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('231', '937', '1005', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566768', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('232', '938', '1006', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566805', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('233', '939', '1007', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566856', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('234', '940', '1008', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566892', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('235', '941', '1009', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566925', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('236', '942', '1010', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566953', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('237', '943', '1011', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897566984', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('238', '944', '1012', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567012', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('239', '945', '1013', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567041', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('240', '946', '1014', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567068', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('241', '947', '1015', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567100', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('242', '948', '1016', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567131', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('243', '949', '1017', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567171', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('244', '950', '1018', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567201', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('245', '951', '1019', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567228', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('246', '952', '1020', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567265', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('247', '953', '1021', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567293', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('248', '954', '1022', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567319', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('249', '955', '1023', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567349', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('250', '956', '1024', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567376', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('251', '957', '1025', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567404', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('252', '958', '1026', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567431', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('253', '959', '1027', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567460', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('254', '960', '1028', '件', null, null, null, null, '1', '2020-12-02 16:26:07', 'Kim', 'Kim', '1606897567486', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('255', '961', '1029', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567516', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('256', '962', '1030', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567564', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('257', '963', '1031', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567599', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('258', '964', '1032', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567627', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('259', '965', '1033', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567657', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('260', '966', '1034', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567684', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('261', '967', '1035', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567709', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('262', '968', '1036', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567735', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('263', '969', '1037', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567765', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('264', '970', '1038', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567793', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('265', '971', '1039', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567819', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('266', '972', '1040', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567847', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('267', '973', '1041', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567875', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('268', '974', '1042', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567909', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('269', '975', '1043', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567951', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('270', '976', '1044', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897567977', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('271', '977', '1045', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568004', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('272', '978', '1046', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568052', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('273', '979', '1047', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568091', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('274', '980', '1048', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568137', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('275', '981', '1049', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568192', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('276', '982', '1050', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568219', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('277', '983', '1051', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568246', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('278', '984', '1052', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568271', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('279', '985', '1053', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568296', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('280', '986', '1054', '件', null, null, null, null, '1', '2020-12-02 16:26:08', 'Kim', 'Kim', '1606897568323', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('281', '987', '1055', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568568', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('282', '988', '1056', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568594', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('283', '989', '1057', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568621', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('284', '990', '1058', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568650', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('285', '991', '1059', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568675', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('286', '992', '1060', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568702', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('287', '993', '1061', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568729', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('288', '994', '1062', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568755', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('289', '995', '1063', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568784', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('290', '996', '1064', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568811', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('291', '997', '1089', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568837', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('292', '998', '1090', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568865', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('293', '999', '1091', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568892', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('294', '1000', '1092', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568919', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('295', '1001', '1093', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568949', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('296', '1002', '1094', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897568982', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('297', '1003', '1095', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569009', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('298', '1004', '1096', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569036', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('299', '1005', '1097', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569063', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('300', '1006', '1098', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569090', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('301', '1007', '1099', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569117', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('302', '1008', '1100', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569154', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('303', '1009', '1101', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569191', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('304', '1010', '1102', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569220', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('305', '1011', '1103', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569248', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('306', '1012', '1104', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569273', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('307', '1013', '1105', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569297', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('308', '1014', '1106', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569324', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('309', '1015', '1107', '件', null, null, null, null, '1', '2020-12-02 16:26:09', 'Kim', 'Kim', '1606897569496', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('310', '1016', '1108', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569525', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('311', '1017', '1109', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569553', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('312', '1018', '1110', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569580', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('313', '1019', '1111', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569605', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('314', '1020', '1112', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569631', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('315', '1021', '1113', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569667', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('316', '1022', '1114', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569716', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('317', '1023', '1115', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569767', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('318', '1024', '1116', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569805', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('319', '1025', '1117', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569832', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('320', '1026', '1118', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569858', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('321', '1027', '1119', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569885', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('322', '1028', '1120', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569911', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('323', '1029', '1121', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569939', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('324', '1030', '1122', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569965', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('325', '1031', '1123', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897569992', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('326', '1032', '1124', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570017', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('327', '1033', '1125', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570042', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('328', '1034', '1126', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570070', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('329', '1035', '1127', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570099', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('330', '1036', '1128', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570126', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('331', '1037', '1129', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570151', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('332', '1038', '1130', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570175', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('333', '1039', '1131', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570199', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('334', '1040', '1132', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570225', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('335', '1041', '1133', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570251', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('336', '1042', '1134', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570278', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('337', '1043', '1135', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570304', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('338', '1044', '1136', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570334', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('339', '1045', '1137', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570362', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('340', '1046', '1138', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570388', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('341', '1047', '1139', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570416', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('342', '1048', '1140', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570443', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('343', '1049', '1141', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570468', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('344', '1050', '1142', '件', null, null, null, null, '1', '2020-12-02 16:26:10', 'Kim', 'Kim', '1606897570497', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('345', '1051', '1143', '件', null, null, null, null, '1', '2020-12-02 16:26:11', 'Kim', 'Kim', '1606897570525', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('346', '1052', '1144', '件', null, null, null, null, '1', '2020-12-02 16:26:11', 'Kim', 'Kim', '1606897570552', '63', '0');
INSERT INTO `jsh_material_extend` VALUES ('347', '1053', '1145', '件', null, null, null, null, '1', '2020-12-02 16:26:11', 'Kim', 'Kim', '1606897570579', '63', '0');

-- ----------------------------
-- Table structure for jsh_material_initial_stock
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material_initial_stock`;
CREATE TABLE `jsh_material_initial_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `depot_id` bigint(20) DEFAULT NULL COMMENT '仓库id',
  `number` decimal(24,6) DEFAULT NULL COMMENT '初始库存数量',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='产品初始库存';

-- ----------------------------
-- Records of jsh_material_initial_stock
-- ----------------------------
INSERT INTO `jsh_material_initial_stock` VALUES ('123', '587', '14', '5.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('124', '719', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('125', '720', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('126', '721', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('127', '722', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('128', '723', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('129', '724', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('130', '725', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('131', '726', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('132', '727', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('133', '728', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('134', '729', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('135', '730', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('136', '731', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('137', '732', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('138', '733', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('139', '734', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('140', '735', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('141', '736', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('142', '737', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('143', '738', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('144', '739', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('145', '740', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('146', '741', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('147', '742', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('148', '743', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('149', '744', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('150', '745', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('151', '746', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('152', '747', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('153', '748', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('154', '749', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('155', '750', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('160', '751', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('161', '752', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('162', '753', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('163', '754', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('164', '755', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('165', '756', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('166', '757', '14', '11.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('167', '758', '14', '12.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('168', '759', '14', '13.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('169', '760', '14', '14.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('170', '761', '14', '15.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('171', '762', '14', '16.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('172', '763', '14', '17.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('173', '764', '14', '18.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('174', '765', '14', '19.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('175', '766', '14', '20.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('176', '767', '14', '21.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('177', '768', '14', '22.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('178', '769', '14', '23.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('179', '770', '14', '24.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('180', '771', '14', '25.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('181', '772', '14', '26.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('182', '773', '14', '27.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('183', '774', '14', '28.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('184', '775', '14', '29.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('185', '776', '14', '30.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('186', '777', '14', '31.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('187', '778', '14', '32.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('188', '779', '14', '33.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('189', '780', '14', '34.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('190', '781', '14', '35.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('191', '782', '14', '36.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('192', '783', '14', '37.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('193', '784', '14', '38.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('194', '785', '14', '39.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('195', '786', '14', '40.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('196', '787', '14', '41.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('197', '788', '14', '42.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('198', '789', '14', '43.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('199', '790', '14', '44.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('200', '791', '14', '45.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('201', '792', '14', '46.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('202', '793', '14', '47.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('203', '794', '14', '48.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('204', '795', '14', '49.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('205', '796', '14', '50.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('206', '797', '14', '51.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('207', '798', '14', '52.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('208', '799', '14', '53.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('209', '800', '14', '54.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('210', '801', '14', '55.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('211', '802', '14', '56.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('212', '803', '14', '57.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('213', '804', '14', '58.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('214', '805', '14', '59.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('215', '806', '14', '60.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('216', '807', '14', '61.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('217', '808', '14', '62.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('218', '809', '14', '63.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('219', '810', '14', '64.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('220', '811', '14', '65.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('221', '812', '14', '66.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('222', '813', '14', '67.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('223', '814', '14', '68.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('224', '815', '14', '69.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('225', '816', '14', '70.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('226', '817', '14', '71.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('227', '818', '14', '72.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('228', '819', '14', '73.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('229', '820', '14', '74.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('230', '821', '14', '75.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('231', '822', '14', '76.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('232', '823', '14', '77.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('233', '824', '14', '78.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('234', '825', '14', '79.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('235', '826', '14', '80.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('236', '827', '14', '81.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('237', '828', '14', '82.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('238', '829', '14', '83.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('239', '830', '14', '84.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('240', '831', '14', '85.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('241', '832', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('242', '833', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('243', '834', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('244', '835', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('245', '836', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('246', '837', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('247', '838', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('248', '839', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('249', '840', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('250', '841', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('251', '842', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('252', '843', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('253', '844', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('254', '845', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('255', '846', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('256', '847', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('257', '848', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('258', '849', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('259', '850', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('260', '851', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('261', '852', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('262', '853', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('263', '854', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('264', '855', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('265', '856', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('266', '857', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('267', '858', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('268', '859', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('269', '860', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('270', '861', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('271', '862', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('272', '863', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('273', '864', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('274', '865', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('275', '866', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('276', '867', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('277', '868', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('278', '869', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('279', '870', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('280', '871', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('281', '872', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('282', '873', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('283', '874', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('284', '875', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('285', '876', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('286', '877', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('287', '878', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('288', '879', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('289', '880', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('290', '881', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('291', '882', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('292', '883', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('293', '884', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('294', '885', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('295', '886', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('296', '887', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('297', '888', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('298', '889', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('299', '890', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('300', '891', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('301', '892', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('302', '893', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('303', '894', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('304', '895', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('305', '896', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('306', '897', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('307', '898', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('308', '899', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('309', '900', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('310', '901', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('311', '902', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('312', '903', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('313', '904', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('314', '905', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('315', '906', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('316', '907', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('317', '908', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('318', '909', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('319', '910', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('320', '911', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('321', '912', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('322', '913', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('323', '914', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('324', '915', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('325', '916', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('326', '917', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('327', '918', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('328', '919', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('329', '920', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('330', '921', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('331', '922', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('332', '923', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('333', '924', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('334', '925', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('335', '926', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('336', '927', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('337', '928', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('338', '929', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('339', '930', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('340', '931', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('341', '932', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('342', '933', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('343', '934', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('344', '935', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('345', '936', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('346', '937', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('347', '938', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('348', '939', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('349', '940', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('350', '941', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('351', '942', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('352', '943', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('353', '944', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('354', '945', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('355', '946', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('356', '947', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('357', '948', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('358', '949', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('359', '950', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('360', '951', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('361', '952', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('362', '953', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('363', '954', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('364', '955', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('365', '956', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('366', '957', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('367', '958', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('368', '959', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('369', '960', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('370', '961', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('371', '962', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('372', '963', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('373', '964', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('374', '965', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('375', '966', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('376', '967', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('377', '968', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('378', '969', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('379', '970', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('380', '971', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('381', '972', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('382', '973', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('383', '974', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('384', '975', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('385', '976', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('386', '977', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('387', '978', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('388', '979', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('389', '980', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('390', '981', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('391', '982', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('392', '983', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('393', '984', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('394', '985', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('395', '986', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('396', '987', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('397', '988', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('398', '989', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('399', '990', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('400', '991', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('401', '992', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('402', '993', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('403', '994', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('404', '995', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('405', '996', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('406', '997', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('407', '998', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('408', '999', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('409', '1000', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('410', '1001', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('411', '1002', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('412', '1003', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('413', '1004', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('414', '1005', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('415', '1006', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('416', '1007', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('417', '1008', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('418', '1009', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('419', '1010', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('420', '1011', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('421', '1012', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('422', '1013', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('423', '1014', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('424', '1015', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('425', '1016', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('426', '1017', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('427', '1018', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('428', '1019', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('429', '1020', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('430', '1021', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('431', '1022', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('432', '1023', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('433', '1024', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('434', '1025', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('435', '1026', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('436', '1027', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('437', '1028', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('438', '1029', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('439', '1030', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('440', '1031', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('441', '1032', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('442', '1033', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('443', '1034', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('444', '1035', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('445', '1036', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('446', '1037', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('447', '1038', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('448', '1039', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('449', '1040', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('450', '1041', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('451', '1042', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('452', '1043', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('453', '1044', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('454', '1045', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('455', '1046', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('456', '1047', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('457', '1048', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('458', '1049', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('459', '1050', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('460', '1051', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('461', '1052', '14', '10.000000', '63', '0');
INSERT INTO `jsh_material_initial_stock` VALUES ('462', '1053', '14', '10.000000', '63', '0');

-- ----------------------------
-- Table structure for jsh_material_property
-- ----------------------------
DROP TABLE IF EXISTS `jsh_material_property`;
CREATE TABLE `jsh_material_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `native_name` varchar(50) DEFAULT NULL COMMENT '原始名称',
  `enabled` bit(1) DEFAULT NULL COMMENT '是否启用',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  `another_name` varchar(50) DEFAULT NULL COMMENT '别名',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='产品扩展字段表';

-- ----------------------------
-- Records of jsh_material_property
-- ----------------------------
INSERT INTO `jsh_material_property` VALUES ('1', '规格', '', '02', '规格', '0');
INSERT INTO `jsh_material_property` VALUES ('2', '颜色', '', '01', '颜色', '0');
INSERT INTO `jsh_material_property` VALUES ('3', '制造商', '', '03', '制造商', '0');
INSERT INTO `jsh_material_property` VALUES ('4', '自定义1', '\0', '04', '自定义1', '0');
INSERT INTO `jsh_material_property` VALUES ('5', '自定义2', '\0', '05', '自定义2', '0');
INSERT INTO `jsh_material_property` VALUES ('6', '自定义3', '\0', '06', '自定义3', '0');

-- ----------------------------
-- Table structure for jsh_msg
-- ----------------------------
DROP TABLE IF EXISTS `jsh_msg`;
CREATE TABLE `jsh_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msg_title` varchar(100) DEFAULT NULL COMMENT '消息标题',
  `msg_content` varchar(500) DEFAULT NULL COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `type` varchar(20) DEFAULT NULL COMMENT '消息类型',
  `status` varchar(1) DEFAULT NULL COMMENT '状态，1未读 2已读',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_Flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='消息表';

-- ----------------------------
-- Records of jsh_msg
-- ----------------------------
INSERT INTO `jsh_msg` VALUES ('2', '标题1', '内容1', '2019-09-10 00:11:39', '类型1', '1', '63', '0');

-- ----------------------------
-- Table structure for jsh_organization
-- ----------------------------
DROP TABLE IF EXISTS `jsh_organization`;
CREATE TABLE `jsh_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_no` varchar(20) DEFAULT NULL COMMENT '机构编号',
  `org_full_name` varchar(500) DEFAULT NULL COMMENT '机构全称',
  `org_abr` varchar(20) DEFAULT NULL COMMENT '机构简称',
  `org_tpcd` varchar(9) DEFAULT NULL COMMENT '机构类型',
  `org_stcd` char(1) DEFAULT NULL COMMENT '机构状态,1未营业、2正常营业、3暂停营业、4终止营业、5已除名',
  `org_parent_no` varchar(20) DEFAULT NULL COMMENT '机构父节点编号',
  `sort` varchar(20) DEFAULT NULL COMMENT '机构显示顺序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `org_create_time` datetime DEFAULT NULL COMMENT '机构创建时间',
  `org_stop_time` datetime DEFAULT NULL COMMENT '机构停运时间',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of jsh_organization
-- ----------------------------
INSERT INTO `jsh_organization` VALUES ('12', '001', '测试机构', '测试机构', null, '2', '-1', '001', '', '2019-12-28 12:13:01', '63', '2019-12-28 12:13:01', '63', null, null, '63');
INSERT INTO `jsh_organization` VALUES ('13', 'jg1', '机构1', '机构1', null, '2', '001', '22', '', '2020-07-21 00:09:57', '63', '2020-07-21 00:10:22', '63', null, null, '63');
INSERT INTO `jsh_organization` VALUES ('14', '12', '机构2', '机构2', null, '', 'jg1', '12', '', '2020-07-21 22:45:42', '63', '2020-07-21 22:45:51', '63', null, null, '63');

-- ----------------------------
-- Table structure for jsh_orga_user_rel
-- ----------------------------
DROP TABLE IF EXISTS `jsh_orga_user_rel`;
CREATE TABLE `jsh_orga_user_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orga_id` bigint(20) NOT NULL COMMENT '机构id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `user_blng_orga_dspl_seq` varchar(20) DEFAULT NULL COMMENT '用户在所属机构中显示顺序',
  `delete_flag` char(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='机构用户关系表';

-- ----------------------------
-- Records of jsh_orga_user_rel
-- ----------------------------
INSERT INTO `jsh_orga_user_rel` VALUES ('10', '13', '131', '2', '0', '2019-12-28 12:13:15', '63', '2020-09-13 18:42:52', '63', '63');
INSERT INTO `jsh_orga_user_rel` VALUES ('11', '12', '63', '', '0', '2020-09-13 18:42:45', '63', '2020-09-13 18:42:45', '63', '63');

-- ----------------------------
-- Table structure for jsh_person
-- ----------------------------
DROP TABLE IF EXISTS `jsh_person`;
CREATE TABLE `jsh_person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='经手人表';

-- ----------------------------
-- Records of jsh_person
-- ----------------------------
INSERT INTO `jsh_person` VALUES ('14', '业务员', '小李', '63', '0');
INSERT INTO `jsh_person` VALUES ('15', '仓管员', '小军', '63', '0');
INSERT INTO `jsh_person` VALUES ('16', '财务员', '小夏', '63', '0');

-- ----------------------------
-- Table structure for jsh_platform_config
-- ----------------------------
DROP TABLE IF EXISTS `jsh_platform_config`;
CREATE TABLE `jsh_platform_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `platform_key` varchar(100) DEFAULT NULL COMMENT '关键词',
  `platform_key_info` varchar(100) DEFAULT NULL COMMENT '关键词名称',
  `platform_value` varchar(200) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='平台参数';

-- ----------------------------
-- Records of jsh_platform_config
-- ----------------------------
INSERT INTO `jsh_platform_config` VALUES ('1', 'platform_name', '平台名称', '华夏ERP');
INSERT INTO `jsh_platform_config` VALUES ('2', 'activation_code', '激活码', null);

-- ----------------------------
-- Table structure for jsh_role
-- ----------------------------
DROP TABLE IF EXISTS `jsh_role`;
CREATE TABLE `jsh_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jsh_role
-- ----------------------------
INSERT INTO `jsh_role` VALUES ('4', '管理员', '全部数据', null, null, null, '0');
INSERT INTO `jsh_role` VALUES ('10', '租户', '全部数据', null, '', null, '0');
INSERT INTO `jsh_role` VALUES ('16', '销售经理', '全部数据', null, 'ddd', '63', '0');
INSERT INTO `jsh_role` VALUES ('17', '销售代表', '个人数据', null, 'rrr', '63', '0');
INSERT INTO `jsh_role` VALUES ('18', '角色abc', '本机构数据', null, '33333', '63', '0');

-- ----------------------------
-- Table structure for jsh_sequence
-- ----------------------------
DROP TABLE IF EXISTS `jsh_sequence`;
CREATE TABLE `jsh_sequence` (
  `seq_name` varchar(50) NOT NULL COMMENT '序列名称',
  `min_value` bigint(20) NOT NULL COMMENT '最小值',
  `max_value` bigint(20) NOT NULL COMMENT '最大值',
  `current_val` bigint(20) NOT NULL COMMENT '当前值',
  `increment_val` int(11) NOT NULL DEFAULT '1' COMMENT '增长步数',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`seq_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单据编号表';

-- ----------------------------
-- Records of jsh_sequence
-- ----------------------------
INSERT INTO `jsh_sequence` VALUES ('depot_number_seq', '1', '999999999999999999', '474', '1', '单据编号sequence');

-- ----------------------------
-- Table structure for jsh_serial_number
-- ----------------------------
DROP TABLE IF EXISTS `jsh_serial_number`;
CREATE TABLE `jsh_serial_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `material_id` bigint(20) DEFAULT NULL COMMENT '产品表id',
  `serial_number` varchar(64) DEFAULT NULL COMMENT '序列号',
  `is_sell` varchar(1) DEFAULT '0' COMMENT '是否卖出，0未卖出，1卖出',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` bigint(20) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updater` bigint(20) DEFAULT NULL COMMENT '更新人',
  `depot_head_id` bigint(20) DEFAULT NULL COMMENT '单据主表id，用于跟踪序列号流向',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='序列号表';

-- ----------------------------
-- Records of jsh_serial_number
-- ----------------------------
INSERT INTO `jsh_serial_number` VALUES ('105', '586', '12312323423223', '0', 'abab', '1', '2019-12-28 12:14:39', '63', '2020-11-25 11:27:30', '63', null, '63');
INSERT INTO `jsh_serial_number` VALUES ('106', '586', '143132415952626404571', '0', '', '1', '2020-07-21 00:30:40', '63', '2020-07-21 00:30:49', '63', null, '63');
INSERT INTO `jsh_serial_number` VALUES ('107', '586', '143132415952626404572', '0', '', '1', '2020-07-21 00:30:40', '63', '2020-07-21 00:30:47', '63', null, '63');
INSERT INTO `jsh_serial_number` VALUES ('108', '586', '3215952626621201', '0', '', '1', '2020-07-21 00:31:02', '63', '2020-11-25 11:27:30', '63', null, '63');
INSERT INTO `jsh_serial_number` VALUES ('109', '586', '3215952626621202', '0', '', '1', '2020-07-21 00:31:02', '63', '2020-11-25 11:27:30', '63', null, '63');

-- ----------------------------
-- Table structure for jsh_supplier
-- ----------------------------
DROP TABLE IF EXISTS `jsh_supplier`;
CREATE TABLE `jsh_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `contacts` varchar(100) DEFAULT NULL COMMENT '联系人',
  `phone_num` varchar(30) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮箱',
  `description` varchar(500) DEFAULT NULL COMMENT '备注',
  `isystem` tinyint(4) DEFAULT NULL COMMENT '是否系统自带 0==系统 1==非系统',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `enabled` bit(1) DEFAULT NULL COMMENT '启用',
  `advance_in` decimal(24,6) DEFAULT '0.000000' COMMENT '预收款',
  `begin_need_get` decimal(24,6) DEFAULT NULL COMMENT '期初应收',
  `begin_need_pay` decimal(24,6) DEFAULT NULL COMMENT '期初应付',
  `all_need_get` decimal(24,6) DEFAULT NULL COMMENT '累计应收',
  `all_need_pay` decimal(24,6) DEFAULT NULL COMMENT '累计应付',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `telephone` varchar(30) DEFAULT NULL COMMENT '手机',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `tax_num` varchar(50) DEFAULT NULL COMMENT '纳税人识别号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户行',
  `account_number` varchar(50) DEFAULT NULL COMMENT '账号',
  `tax_rate` decimal(24,6) DEFAULT NULL COMMENT '税率',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='供应商/客户信息表';

-- ----------------------------
-- Records of jsh_supplier
-- ----------------------------
INSERT INTO `jsh_supplier` VALUES ('57', '供应商1', '小九', '12345678', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, '0.000000', '', '', '地址1', '', '', '', '12.000000', '63', '0');
INSERT INTO `jsh_supplier` VALUES ('58', '客户1', '小李', '12345678', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '-100.000000', null, '', '', '', '', '', '', '12.000000', '63', '0');
INSERT INTO `jsh_supplier` VALUES ('59', '客户2', '小陈', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('60', '12312666', '小曹', '', '', '', null, '会员', '', '-12981.000000', '0.000000', '0.000000', null, null, '', '13000000000', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('68', '供应商3', '晓丽', '', '', '', null, '供应商', '', '0.000000', '15.000000', '0.000000', null, '-15.000000', '', '13000000000', '', '1341324', '', '', '22.000000', '63', '1');
INSERT INTO `jsh_supplier` VALUES ('71', '客户3', '小周', '', '', '', null, '客户', '', '0.000000', '0.000000', '0.000000', '0.000000', null, '', '', '', '', '', '', null, '63', '0');
INSERT INTO `jsh_supplier` VALUES ('74', '供应商5', '小季', '', '', '', null, '供应商', '', '0.000000', '0.000000', '0.000000', null, null, '', '', '', '', '', '', null, '63', '1');

-- ----------------------------
-- Table structure for jsh_system_config
-- ----------------------------
DROP TABLE IF EXISTS `jsh_system_config`;
CREATE TABLE `jsh_system_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_contacts` varchar(20) DEFAULT NULL COMMENT '公司联系人',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_tel` varchar(20) DEFAULT NULL COMMENT '公司电话',
  `company_fax` varchar(20) DEFAULT NULL COMMENT '公司传真',
  `company_post_code` varchar(20) DEFAULT NULL COMMENT '公司邮编',
  `depot_flag` varchar(1) DEFAULT '0' COMMENT '仓库启用标记，0未启用，1启用',
  `customer_flag` varchar(1) DEFAULT '0' COMMENT '客户启用标记，0未启用，1启用',
  `minus_stock_flag` varchar(1) DEFAULT '0' COMMENT '负库存启用标记，0未启用，1启用',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统参数';

-- ----------------------------
-- Records of jsh_system_config
-- ----------------------------
INSERT INTO `jsh_system_config` VALUES ('9', '公司1', '小军', '地址1', '12313', '1233', '4231', '0', '0', '1', '63', '0');

-- ----------------------------
-- Table structure for jsh_tenant
-- ----------------------------
DROP TABLE IF EXISTS `jsh_tenant`;
CREATE TABLE `jsh_tenant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `login_name` varchar(255) DEFAULT NULL COMMENT '登录名',
  `user_num_limit` int(11) DEFAULT NULL COMMENT '用户数量限制',
  `bills_num_limit` int(11) DEFAULT NULL COMMENT '单据数量限制',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='租户';

-- ----------------------------
-- Records of jsh_tenant
-- ----------------------------
INSERT INTO `jsh_tenant` VALUES ('13', '63', 'jsh', '20', '2000', null);
INSERT INTO `jsh_tenant` VALUES ('22', '132', '15657872898', '1000000', '100000000', '2020-12-14 15:33:59');

-- ----------------------------
-- Table structure for jsh_unit
-- ----------------------------
DROP TABLE IF EXISTS `jsh_unit`;
CREATE TABLE `jsh_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) DEFAULT NULL COMMENT '名称，支持多单位',
  `basic_unit` varchar(50) DEFAULT NULL COMMENT '基础单位',
  `other_unit` varchar(50) DEFAULT NULL COMMENT '副单位',
  `ratio` int(11) DEFAULT NULL COMMENT '比例',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='多单位表';

-- ----------------------------
-- Records of jsh_unit
-- ----------------------------
INSERT INTO `jsh_unit` VALUES ('15', '个,箱(1:12)', '个', '箱', '12', '63', '0');
INSERT INTO `jsh_unit` VALUES ('16', '个,台(1:10)', '个', '台', '10', '63', '1');
INSERT INTO `jsh_unit` VALUES ('17', '个,只(1:12)', '个', '只', '12', '63', '1');
INSERT INTO `jsh_unit` VALUES ('18', '条,箱(1:12)', '条', '箱', '12', '63', '0');
INSERT INTO `jsh_unit` VALUES ('19', '件,1(1:12)', '件', '1', '12', '63', '0');

-- ----------------------------
-- Table structure for jsh_user
-- ----------------------------
DROP TABLE IF EXISTS `jsh_user`;
CREATE TABLE `jsh_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) NOT NULL COMMENT '用户姓名--例如张三',
  `login_name` varchar(255) NOT NULL COMMENT '登录用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '登陆密码',
  `position` varchar(200) DEFAULT NULL COMMENT '职位',
  `department` varchar(255) DEFAULT NULL COMMENT '所属部门',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `phonenum` varchar(100) DEFAULT NULL COMMENT '手机号码',
  `ismanager` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否为管理者 0==管理者 1==员工',
  `isystem` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否系统自带数据 ',
  `Status` tinyint(4) DEFAULT '0' COMMENT '状态，0：正常，1：删除，2封禁',
  `description` varchar(500) DEFAULT NULL COMMENT '用户描述信息',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint(20) DEFAULT NULL COMMENT '租户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jsh_user
-- ----------------------------
INSERT INTO `jsh_user` VALUES ('63', 'Kim', 'Kim', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '1', '0', '', null, '63');
INSERT INTO `jsh_user` VALUES ('120', '管理员', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, null, null, '1', '0', '0', null, null, null);
INSERT INTO `jsh_user` VALUES ('131', '测试用户', 'test123', 'e10adc3949ba59abbe56e057f20f883e', '', null, '', '', '1', '0', '0', '', null, '63');
INSERT INTO `jsh_user` VALUES ('132', '15657872898', '15657872898', '1e04d858759bd779660cfb6815d1dcd2', null, null, null, null, '1', '0', '0', null, null, '132');

-- ----------------------------
-- Table structure for jsh_user_business
-- ----------------------------
DROP TABLE IF EXISTS `jsh_user_business`;
CREATE TABLE `jsh_user_business` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `key_id` varchar(50) DEFAULT NULL COMMENT '主id',
  `value` varchar(10000) DEFAULT NULL COMMENT '值',
  `btn_str` varchar(2000) DEFAULT NULL COMMENT '按钮权限',
  `delete_flag` varchar(1) DEFAULT '0' COMMENT '删除标记，0未删除，1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='用户/角色/模块关系表';

-- ----------------------------
-- Records of jsh_user_business
-- ----------------------------
INSERT INTO `jsh_user_business` VALUES ('5', 'RoleFunctions', '4', '[210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][59][207][208][209][226][227][228][229][235][237][244][246][22][23][220][240][25][217][218][26][194][195][31][13][16][243][14][15][234][236][245]', '[{\"funId\":\"13\",\"btnStr\":\"1\"},{\"funId\":\"16\",\"btnStr\":\"1\"},{\"funId\":\"243\",\"btnStr\":\"1\"},{\"funId\":\"14\",\"btnStr\":\"1\"},{\"funId\":\"234\",\"btnStr\":\"1\"},{\"funId\":\"236\",\"btnStr\":\"1\"},{\"funId\":\"245\",\"btnStr\":\"1\"},{\"funId\":\"22\",\"btnStr\":\"1\"},{\"funId\":\"23\",\"btnStr\":\"1\"},{\"funId\":\"220\",\"btnStr\":\"1\"},{\"funId\":\"240\",\"btnStr\":\"1\"},{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"26\",\"btnStr\":\"1\"},{\"funId\":\"194\",\"btnStr\":\"1\"},{\"funId\":\"195\",\"btnStr\":\"1\"},{\"funId\":\"31\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"1,2\"},{\"funId\":\"33\",\"btnStr\":\"1,2\"},{\"funId\":\"199\",\"btnStr\":\"1,2\"},{\"funId\":\"242\",\"btnStr\":\"1,2\"},{\"funId\":\"41\",\"btnStr\":\"1,2\"},{\"funId\":\"200\",\"btnStr\":\"1,2\"},{\"funId\":\"210\",\"btnStr\":\"1,2\"},{\"funId\":\"211\",\"btnStr\":\"1,2\"},{\"funId\":\"197\",\"btnStr\":\"1\"},{\"funId\":\"203\",\"btnStr\":\"1\"},{\"funId\":\"204\",\"btnStr\":\"1\"},{\"funId\":\"205\",\"btnStr\":\"1\"},{\"funId\":\"206\",\"btnStr\":\"1\"},{\"funId\":\"212\",\"btnStr\":\"1\"},{\"funId\":\"201\",\"btnStr\":\"1,2\"},{\"funId\":\"202\",\"btnStr\":\"1,2\"},{\"funId\":\"40\",\"btnStr\":\"1,2\"},{\"funId\":\"232\",\"btnStr\":\"1,2\"},{\"funId\":\"233\",\"btnStr\":\"1,2\"}]', '0');
INSERT INTO `jsh_user_business` VALUES ('6', 'RoleFunctions', '5', '[22][23][25][26][194][195][31][33][200][201][41][199][202]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('7', 'RoleFunctions', '6', '[22][23][220][240][25][217][218][26][194][195][31][59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]', '[{\"funId\":\"33\",\"btnStr\":\"4\"}]', '0');
INSERT INTO `jsh_user_business` VALUES ('9', 'RoleFunctions', '7', '[168][13][12][16][14][15][189][18][19][132]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('10', 'RoleFunctions', '8', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('11', 'RoleFunctions', '9', '[168][13][12][16][14][15][189][18][19][132][22][23][25][26][27][157][158][155][156][125][31][127][126][128][33][34][35][36][37][39][40][41][42][43][46][47][48][49][50][51][52][53][54][55][56][57][192][59][60][61][62][63][65][66][68][69][70][71][73][74][76][77][79][191][81][82][83][85][89][161][86][176][165][160][28][134][91][92][29][94][95][97][104][99][100][101][102][105][107][108][110][111][113][114][116][117][118][120][121][131][135][123][122][20][130][146][147][138][148][149][153][140][145][184][152][143][170][171][169][166][167][163][164][172][173][179][178][181][182][183][186][187][188]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('12', 'UserRole', '1', '[5]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('13', 'UserRole', '2', '[6][7]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('14', 'UserDepot', '2', '[1][2][6][7]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('15', 'UserDepot', '1', '[1][2][5][6][7][10][12][14][15][17]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('16', 'UserRole', '63', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('18', 'UserDepot', '63', '[14][15]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('19', 'UserDepot', '5', '[6][45][46][50]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('20', 'UserRole', '5', '[5]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('21', 'UserRole', '64', '[13]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('22', 'UserDepot', '64', '[1]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('23', 'UserRole', '65', '[5]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('24', 'UserDepot', '65', '[1]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('25', 'UserCustomer', '64', '[5][2]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('26', 'UserCustomer', '65', '[6]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('27', 'UserCustomer', '63', '[58]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('28', 'UserDepot', '96', '[7]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('29', 'UserRole', '96', '[6]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('30', 'UserRole', '113', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('32', 'RoleFunctions', '10', '[210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212][59][207][208][209][226][227][228][229][235][237][244][246][22][23][220][240][25][217][218][26][194][195][31][13][243][14][15][234]', '[{\"funId\":\"13\",\"btnStr\":\"1\"},{\"funId\":\"243\",\"btnStr\":\"1\"},{\"funId\":\"14\",\"btnStr\":\"1\"},{\"funId\":\"234\",\"btnStr\":\"1\"},{\"funId\":\"22\",\"btnStr\":\"1\"},{\"funId\":\"23\",\"btnStr\":\"1\"},{\"funId\":\"220\",\"btnStr\":\"1\"},{\"funId\":\"240\",\"btnStr\":\"1\"},{\"funId\":\"25\",\"btnStr\":\"1\"},{\"funId\":\"217\",\"btnStr\":\"1\"},{\"funId\":\"218\",\"btnStr\":\"1\"},{\"funId\":\"26\",\"btnStr\":\"1\"},{\"funId\":\"194\",\"btnStr\":\"1\"},{\"funId\":\"195\",\"btnStr\":\"1\"},{\"funId\":\"31\",\"btnStr\":\"1\"},{\"funId\":\"241\",\"btnStr\":\"1,2\"},{\"funId\":\"33\",\"btnStr\":\"1,2\"},{\"funId\":\"199\",\"btnStr\":\"1,2\"},{\"funId\":\"242\",\"btnStr\":\"1,2\"},{\"funId\":\"41\",\"btnStr\":\"1,2\"},{\"funId\":\"200\",\"btnStr\":\"1,2\"},{\"funId\":\"210\",\"btnStr\":\"1,2\"},{\"funId\":\"211\",\"btnStr\":\"1,2\"},{\"funId\":\"197\",\"btnStr\":\"1\"},{\"funId\":\"203\",\"btnStr\":\"1\"},{\"funId\":\"204\",\"btnStr\":\"1\"},{\"funId\":\"205\",\"btnStr\":\"1\"},{\"funId\":\"206\",\"btnStr\":\"1\"},{\"funId\":\"212\",\"btnStr\":\"1\"},{\"funId\":\"201\",\"btnStr\":\"1,2\"},{\"funId\":\"202\",\"btnStr\":\"1,2\"},{\"funId\":\"40\",\"btnStr\":\"1,2\"},{\"funId\":\"232\",\"btnStr\":\"1,2\"},{\"funId\":\"233\",\"btnStr\":\"1,2\"}]', '0');
INSERT INTO `jsh_user_business` VALUES ('34', 'UserRole', '115', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('35', 'UserRole', '117', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('36', 'UserDepot', '117', '[8][9]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('37', 'UserCustomer', '117', '[52]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('38', 'UserRole', '120', '[4]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('39', 'UserDepot', '120', '[7][8][9][10][11][12][2][1][3]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('40', 'UserCustomer', '120', '[52][48][6][5][2]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('41', 'RoleFunctions', '12', '', null, '0');
INSERT INTO `jsh_user_business` VALUES ('48', 'RoleFunctions', '13', '[59][207][208][209][226][227][228][229][235][237][210][211][241][33][199][242][41][200]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('51', 'UserRole', '74', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('52', 'UserDepot', '121', '[13]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('54', 'UserDepot', '115', '[13]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('56', 'UserCustomer', '115', '[56]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('57', 'UserCustomer', '121', '[56]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('58', 'UserRole', '121', '[15]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('59', 'UserRole', '123', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('60', 'UserRole', '124', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('61', 'UserRole', '125', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('62', 'UserRole', '126', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('63', 'UserRole', '127', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('64', 'UserRole', '128', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('65', 'UserRole', '129', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('66', 'UserRole', '130', '[10]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('67', 'UserRole', '131', '[17]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('68', 'RoleFunctions', '16', '[210]', null, '0');
INSERT INTO `jsh_user_business` VALUES ('69', 'RoleFunctions', '17', '[210][211][241][33][199][242][41][200][201][202][40][232][233][197][203][204][205][206][212]', '[{\"funId\":\"241\",\"btnStr\":\"1,2\"},{\"funId\":\"33\",\"btnStr\":\"1,2\"},{\"funId\":\"199\",\"btnStr\":\"1,2\"},{\"funId\":\"242\",\"btnStr\":\"1,2\"},{\"funId\":\"41\",\"btnStr\":\"1,2\"},{\"funId\":\"200\",\"btnStr\":\"1,2\"},{\"funId\":\"210\",\"btnStr\":\"1,2\"},{\"funId\":\"211\",\"btnStr\":\"1,2\"},{\"funId\":\"197\",\"btnStr\":\"1\"},{\"funId\":\"203\",\"btnStr\":\"1\"},{\"funId\":\"204\",\"btnStr\":\"1\"},{\"funId\":\"205\",\"btnStr\":\"1\"},{\"funId\":\"206\",\"btnStr\":\"1\"},{\"funId\":\"212\",\"btnStr\":\"1\"},{\"funId\":\"201\",\"btnStr\":\"1,2\"},{\"funId\":\"202\",\"btnStr\":\"1,2\"},{\"funId\":\"40\",\"btnStr\":\"1,2\"},{\"funId\":\"232\",\"btnStr\":\"1,2\"},{\"funId\":\"233\",\"btnStr\":\"1,2\"}]', '0');
INSERT INTO `jsh_user_business` VALUES ('70', 'UserRole', '132', '[10]', null, '0');
