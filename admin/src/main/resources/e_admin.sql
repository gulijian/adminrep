/*
Navicat MySQL Data Transfer

Source Server         : localhostserver
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : e_admin

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2015-12-18 18:00:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `icon` varchar(30) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '根目录', null, '', null, null, null, null, '2015-11-17 10:49:32');
INSERT INTO `sys_menu` VALUES ('2', '表格管理', '#', '1', '1', 'fa fa-list', 'table', null, '2015-11-17 10:57:53');
INSERT INTO `sys_menu` VALUES ('3', 'jqgrid', 'admin/table/jqgrid', '2', '1', '', 'table', 'jqgird', '2015-11-17 10:57:59');
INSERT INTO `sys_menu` VALUES ('4', 'table', 'admin/table/table', '2', '2', '', 'table', 'table', '2015-11-17 10:58:02');
INSERT INTO `sys_menu` VALUES ('5', '微信管理', '#', '1', '2', 'fa-pencil-square-o', 'wechat', null, '2015-11-17 10:58:05');
INSERT INTO `sys_menu` VALUES ('6', 'image', 'admin/wechat/image', '5', '1', null, 'wechat', 'image', '2015-11-17 10:58:09');
INSERT INTO `sys_menu` VALUES ('7', 'text', 'admin/wechat/text', '5', '2', null, 'wechat', 'text', '2015-11-17 10:58:12');
INSERT INTO `sys_menu` VALUES ('8', '报表统计', '#', '1', null, 'fa-desktop', 'chart', null, '2015-12-18 15:10:05');
INSERT INTO `sys_menu` VALUES ('9', 'echart', 'admin/chart/echart', '8', null, null, 'chart', 'echart', '2015-12-18 15:10:08');
INSERT INTO `sys_menu` VALUES ('10', 'fusionchart', 'admin/chart/fusionchart', '8', null, null, 'chart', 'fusionchart', '2015-12-18 15:10:11');
INSERT INTO `sys_menu` VALUES ('11', '权限管理', '#', '1', null, 'fa fa-list', 'permission', null, '2015-12-18 15:10:13');
INSERT INTO `sys_menu` VALUES ('12', 'treeview', 'admin/permisson/treeview', '11', null, null, 'permission', 'treeview', '2015-12-18 15:10:17');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` longtext,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '2015-04-30 21:23:45', '超级管理员', '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '2015-04-30 21:24:06', '管理员', '管理员');
INSERT INTO `sys_role` VALUES ('3', '2015-11-17 11:19:59', '普通用户', '普通用户');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(10) NOT NULL DEFAULT '0',
  `menu_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '6');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '9');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '5');
INSERT INTO `sys_role_menu` VALUES ('2', '6');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '8');
INSERT INTO `sys_role_menu` VALUES ('2', '9');
INSERT INTO `sys_role_menu` VALUES ('2', '10');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `password` varchar(80) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '2015-11-17 11:23:12', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员');
INSERT INTO `sys_user` VALUES ('2', 'gulj', '2015-11-17 11:23:23', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑');
INSERT INTO `sys_user` VALUES ('3', 'liuxiao', '2015-11-17 11:23:17', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `FK_635epekaf2ve7ohtm5arn0n1d` (`role_id`),
  KEY `FK_56ke0ige734wu87q6gwf8p2ey` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('3', '3');
