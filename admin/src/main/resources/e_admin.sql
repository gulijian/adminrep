/*
Navicat MySQL Data Transfer

Source Server         : localhostserver
Source Server Version : 50156
Source Host           : localhost:3306
Source Database       : e_admin

Target Server Type    : MYSQL
Target Server Version : 50156
File Encoding         : 65001

Date: 2015-12-24 17:45:56
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
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '根目录', null, null, null, null, null, null, '2015-11-17 10:49:32');
INSERT INTO `sys_menu` VALUES ('2', '表格管理', '#', '1', '1', 'fa fa-list', 'table', null, '2015-11-17 10:57:53');
INSERT INTO `sys_menu` VALUES ('3', 'jqgrid', 'admin/table/jqgrid', '2', '1', '', 'table', 'jqgird', '2015-11-17 10:57:59');
INSERT INTO `sys_menu` VALUES ('4', 'table', 'admin/table/table', '2', '2', '', 'table', 'table', '2015-11-17 10:58:02');
INSERT INTO `sys_menu` VALUES ('5', '微信管理', '#', '1', '3', 'fa-pencil-square-o', 'wechat', null, '2015-11-17 10:58:05');
INSERT INTO `sys_menu` VALUES ('6', 'image', 'admin/wechat/image', '5', '1', null, 'wechat', 'image', '2015-11-17 10:58:09');
INSERT INTO `sys_menu` VALUES ('7', 'text', 'admin/wechat/text', '5', '2', null, 'wechat', 'text', '2015-11-17 10:58:12');
INSERT INTO `sys_menu` VALUES ('8', '报表统计', '#', '1', '2', 'fa-desktop', 'chart', null, '2015-12-18 15:10:05');
INSERT INTO `sys_menu` VALUES ('9', 'echart', 'admin/chart/echart', '8', '1', null, 'chart', 'echart', '2015-12-18 15:10:08');
INSERT INTO `sys_menu` VALUES ('10', 'fusionchart', 'admin/chart/fusionchart', '8', '2', null, 'chart', 'fusionchart', '2015-12-18 15:10:11');
INSERT INTO `sys_menu` VALUES ('11', '权限管理', '#', '1', '4', 'fa fa-list', 'permission', null, '2015-12-18 15:10:13');
INSERT INTO `sys_menu` VALUES ('12', 'treeview', 'admin/permission/treeview', '11', '1', null, 'permission', 'treeview', '2015-12-18 15:10:17');
INSERT INTO `sys_menu` VALUES ('13', 'ztree', 'admin/permission/list', '11', '2', null, 'permission', 'ztree', '2015-12-16 10:02:01');
INSERT INTO `sys_menu` VALUES ('14', '角色列表', 'admin/permission/role', '11', '3', null, 'permission', 'role', '2015-12-22 13:39:19');
INSERT INTO `sys_menu` VALUES ('15', '用户列表', 'admin/permission/user', '11', '4', null, 'permission', 'user', '2015-12-22 13:39:21');

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
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');

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
  `address` varchar(500) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT '' COMMENT '性别（0，男；1，女）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '2015-12-24 15:43:42', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', null, '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('2', 'gulj', '2015-12-24 15:54:04', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', null, '0', '15295059076', '0');
INSERT INTO `sys_user` VALUES ('3', 'liuxiao', '2015-12-24 15:54:08', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', null, '0', '15295059077', '0');
INSERT INTO `sys_user` VALUES ('4', 'admin4', '2015-12-24 15:54:13', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059078', '0');
INSERT INTO `sys_user` VALUES ('5', 'gulj5', '2015-12-24 15:54:16', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059079', '0');
INSERT INTO `sys_user` VALUES ('6', 'liuxiao6', '2015-12-24 15:43:53', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('7', 'admin7', '2015-12-24 15:43:56', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('8', 'gulj8', '2015-12-24 15:43:57', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('9', 'liuxiao9', '2015-12-24 15:44:00', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('10', 'admin10', '2015-12-24 15:44:03', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('11', 'gulj11', '2015-12-24 15:44:06', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('12', 'liuxiao12', '2015-12-24 15:44:07', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('13', 'admin13', '2015-12-24 15:44:08', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('14', 'gulj14', '2015-12-24 15:44:09', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('15', 'liuxiao15', '2015-12-24 15:44:10', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('16', 'admin16', '2015-12-24 15:44:12', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('17', 'gulj17', '2015-12-24 15:44:13', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('18', 'liuxiao18', '2015-12-24 15:44:14', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('19', 'admin19', '2015-12-24 15:44:16', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('20', 'gulj20', '2015-12-24 15:44:17', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('21', 'admin21', '2015-12-24 15:44:18', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('22', 'admin22', '2015-12-24 15:44:22', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('23', 'gulj23', '2015-12-24 15:44:23', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('24', 'liuxiao24', '2015-12-24 15:44:24', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('25', 'admin25', '2015-12-24 15:44:25', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('26', 'gulj26', '2015-12-24 15:44:26', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('27', 'liuxiao27', '2015-12-24 15:44:27', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('28', 'admin28', '2015-12-24 15:44:28', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('29', 'gulj29', '2015-12-24 15:44:29', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('30', 'liuxiao30', '2015-12-24 15:44:29', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('31', 'admin31', '2015-12-24 15:44:30', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('32', 'gulj32', '2015-12-24 15:44:31', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('33', 'liuxiao33', '2015-12-24 15:44:33', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('34', 'admin34', '2015-12-24 15:44:34', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('35', 'gulj35', '2015-12-24 15:44:35', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('36', 'liuxiao36', '2015-12-24 15:44:36', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('37', 'admin37', '2015-12-24 15:44:37', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('38', 'gulj38', '2015-12-24 15:44:38', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '0');
INSERT INTO `sys_user` VALUES ('39', 'liuxiao39', '2015-12-24 15:44:39', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('40', 'admin40', '2015-12-24 15:44:40', '4QrcOUm6Wau+VuBX8g+IPg==', '超级管理员', '江苏宿迁', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('41', 'gulj41', '2015-12-24 15:44:42', '4QrcOUm6Wau+VuBX8g+IPg==', '顾立剑', '上海松江', '0000-00-00 00:00:00', '0', '15295059075', '1');
INSERT INTO `sys_user` VALUES ('42', 'liuxiao42', '2015-12-24 15:44:45', '4QrcOUm6Wau+VuBX8g+IPg==', '刘潇', '苏州吴中区', '0000-00-00 00:00:00', '0', '15295059075', '1');

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
