/*
 Navicat Premium Data Transfer

 Source Server         : 103
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : 192.168.58.103
 Source Database       : zentao

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 01/04/2017 10:29:17 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `zt_action`
-- ----------------------------
DROP TABLE IF EXISTS `zt_action`;
CREATE TABLE `zt_action` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `objectType` varchar(30) NOT NULL DEFAULT '',
  `objectID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product` varchar(255) NOT NULL,
  `project` mediumint(9) NOT NULL,
  `actor` varchar(30) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` text NOT NULL,
  `read` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `action` (`objectID`,`product`,`project`,`action`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=58235 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_action`
-- ----------------------------
BEGIN;
INSERT INTO `zt_action` VALUES ('58223', 'user', '5486', ',0,', '0', '11014', 'logout', '2017-01-04 10:23:57', '', '', '0'), ('58224', 'user', '6912', ',0,', '0', '11014', 'login', '2017-01-04 10:24:04', '', '', '0'), ('58225', 'user', '6912', ',0,', '0', '11014', 'logout', '2017-01-04 10:24:17', '', '', '0'), ('58226', 'user', '6912', ',0,', '0', '11014', 'login', '2017-01-04 10:24:23', '', '', '0'), ('58227', 'user', '6912', ',0,', '0', '11014', 'logout', '2017-01-04 10:25:05', '', '', '0'), ('58228', 'user', '6912', ',0,', '0', '11014', 'login', '2017-01-04 10:25:19', '', '', '0'), ('58229', 'user', '6912', ',0,', '0', '11014', 'logout', '2017-01-04 10:27:17', '', '', '0'), ('58230', 'user', '6912', ',0,', '0', '11014', 'login', '2017-01-04 10:27:24', '', '', '0'), ('58231', 'user', '6912', ',0,', '0', '11014', 'logout', '2017-01-04 10:27:53', '', '', '0'), ('58232', 'user', '6912', ',0,', '0', '11014', 'login', '2017-01-04 10:27:57', '', '', '0'), ('58233', 'user', '6912', ',0,', '0', '11014', 'logout', '2017-01-04 10:28:34', '', '', '0'), ('58234', 'user', '6912', ',0,', '0', '11014', 'login', '2017-01-04 10:28:38', '', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `zt_allocation`
-- ----------------------------
DROP TABLE IF EXISTS `zt_allocation`;
CREATE TABLE `zt_allocation` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `project_id` smallint(6) DEFAULT NULL COMMENT '项目',
  `frame_id` smallint(5) DEFAULT NULL COMMENT '技术框架',
  `manager_id` varchar(20) DEFAULT NULL COMMENT '项目经理',
  `uat_date` date NOT NULL COMMENT 'UAT日期',
  `online_date` date NOT NULL COMMENT '上线日期',
  `cto_id` varchar(30) DEFAULT NULL COMMENT '技术总监',
  `spotcto_id` varchar(20) DEFAULT NULL COMMENT '现场技术经理',
  `fpd` smallint(4) NOT NULL COMMENT '预估总开发人天',
  `applystatus` enum('N','S','Y','C') NOT NULL COMMENT '申请状态',
  `description` varchar(100) NOT NULL COMMENT '申请说明',
  `applydate` date NOT NULL COMMENT '申请日期',
  `create_user` varchar(20) DEFAULT NULL COMMENT '申请人',
  `assigntodevelop` smallint(6) NOT NULL COMMENT '分配到远程开发项',
  `assigndate` smallint(6) NOT NULL COMMENT '分配到远程人天',
  `ascenter_id` smallint(6) NOT NULL COMMENT '分配到开发中心',
  `tech_manager` varchar(20) DEFAULT NULL COMMENT '开发中心技术经理',
  `test_manager` varchar(20) DEFAULT NULL COMMENT '开发中心测试经理',
  `assignstatus` enum('N','Y','NA') NOT NULL COMMENT '项目分配状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '数据状态',
  `orderby` smallint(6) NOT NULL COMMENT '排序',
  `assignnote` varchar(100) NOT NULL COMMENT '项目分配备注',
  `astestcenter_id` smallint(6) DEFAULT NULL,
  `listcomfim` varchar(20) DEFAULT NULL,
  `uat_datecopy` date DEFAULT NULL,
  `online_datecopy` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_approval`
-- ----------------------------
DROP TABLE IF EXISTS `zt_approval`;
CREATE TABLE `zt_approval` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custome_id` bigint(6) NOT NULL,
  `buyproject` varchar(20) NOT NULL,
  `opinion` tinyint(1) NOT NULL,
  `create_time` datetime NOT NULL,
  `edit_time` datetime NOT NULL,
  `editor` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_block`
-- ----------------------------
DROP TABLE IF EXISTS `zt_block`;
CREATE TABLE `zt_block` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `module` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `source` varchar(20) NOT NULL,
  `block` varchar(20) NOT NULL,
  `params` text NOT NULL,
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `grid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hidden` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountModuleOrder` (`account`,`module`,`order`),
  KEY `block` (`account`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=696 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_block`
-- ----------------------------
BEGIN;
INSERT INTO `zt_block` VALUES ('679', '11014', 'my', '流程图', '', 'flowchart', '', '1', '8', '0'), ('680', '11014', 'my', '最新公告', '', 'bulletin', '', '2', '4', '0'), ('681', '11014', 'my', '进行中的项目', 'project', 'list', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"undone\"}', '3', '8', '0'), ('682', '11014', 'my', '我的待办', 'todo', 'list', '{\"num\":\"20\"}', '4', '4', '0'), ('683', '11014', 'my', '未关闭的产品', 'product', 'list', '{\"num\":15,\"type\":\"noclosed\"}', '5', '8', '0'), ('684', '11014', 'my', '指派给我的任务', 'project', 'task', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assignedTo\"}', '6', '4', '0'), ('685', '11014', 'my', '指派给我的Bug', 'qa', 'bug', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assignedTo\"}', '7', '4', '0'), ('686', '11014', 'my', '指派给我的需求', 'product', 'story', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assignedTo\"}', '8', '4', '0'), ('687', '11014', 'my', '指派给我的用例', 'qa', 'case', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assigntome\"}', '9', '4', '0'), ('688', '11014', 'my', '最新动态', '', 'dynamic', '', '10', '4', '0'), ('689', '11014', 'product', '未关闭的产品', 'product', 'list', '{\"num\":15,\"type\":\"noclosed\"}', '1', '8', '0'), ('690', '11014', 'product', '指派给我的需求', 'product', 'story', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assignedTo\"}', '2', '4', '0'), ('691', '11014', 'project', '进行中的项目', 'project', 'list', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"doing\"}', '1', '8', '0'), ('692', '11014', 'project', '指派给我的任务', 'project', 'task', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assignedTo\"}', '2', '4', '0'), ('693', '11014', 'qa', '指派给我的Bug', 'qa', 'bug', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assignedTo\"}', '1', '4', '0'), ('694', '11014', 'qa', '指派给我的用例', 'qa', 'case', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"assigntome\"}', '2', '4', '0'), ('695', '11014', 'qa', '待测版本列表', 'qa', 'testtask', '{\"num\":15,\"orderBy\":\"id_desc\",\"type\":\"wait\"}', '3', '4', '0');
COMMIT;

-- ----------------------------
--  Table structure for `zt_branch`
-- ----------------------------
DROP TABLE IF EXISTS `zt_branch`;
CREATE TABLE `zt_branch` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_bug`
-- ----------------------------
DROP TABLE IF EXISTS `zt_bug`;
CREATE TABLE `zt_bug` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plan` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toTask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toStory` mediumint(8) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `severity` tinyint(4) NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `os` varchar(30) NOT NULL DEFAULT '',
  `browser` varchar(30) NOT NULL DEFAULT '',
  `hardware` varchar(30) NOT NULL,
  `found` varchar(30) NOT NULL DEFAULT '',
  `steps` text NOT NULL,
  `status` enum('active','resolved','closed') NOT NULL DEFAULT 'active',
  `color` char(7) NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `activatedCount` smallint(6) NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `openedBuild` varchar(255) NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `resolvedBy` varchar(30) NOT NULL DEFAULT '',
  `resolution` varchar(30) NOT NULL DEFAULT '',
  `resolvedBuild` varchar(30) NOT NULL DEFAULT '',
  `resolvedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  `duplicateBug` mediumint(8) unsigned NOT NULL,
  `linkBug` varchar(255) NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `caseVersion` smallint(6) NOT NULL DEFAULT '1',
  `result` mediumint(8) unsigned NOT NULL,
  `testtask` mediumint(8) unsigned NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `bug` (`product`,`module`,`project`,`assignedTo`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_build`
-- ----------------------------
DROP TABLE IF EXISTS `zt_build`;
CREATE TABLE `zt_build` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(150) NOT NULL,
  `scmPath` char(255) NOT NULL,
  `filePath` char(255) NOT NULL,
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `builder` char(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `build` (`product`,`project`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_burn`
-- ----------------------------
DROP TABLE IF EXISTS `zt_burn`;
CREATE TABLE `zt_burn` (
  `project` mediumint(8) unsigned NOT NULL,
  `date` date NOT NULL,
  `left` float NOT NULL,
  `consumed` float NOT NULL,
  PRIMARY KEY (`project`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_case`
-- ----------------------------
DROP TABLE IF EXISTS `zt_case`;
CREATE TABLE `zt_case` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(30) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `precondition` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `type` char(30) NOT NULL DEFAULT '1',
  `stage` varchar(255) NOT NULL,
  `howRun` varchar(30) NOT NULL,
  `scriptedBy` varchar(30) NOT NULL,
  `scriptedDate` date NOT NULL,
  `scriptStatus` varchar(30) NOT NULL,
  `scriptLocation` varchar(255) NOT NULL,
  `status` char(30) NOT NULL DEFAULT '1',
  `color` char(7) NOT NULL,
  `frequency` enum('1','2','3') NOT NULL DEFAULT '1',
  `order` tinyint(30) unsigned NOT NULL DEFAULT '0',
  `openedBy` char(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `lastEditedBy` char(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `linkCase` varchar(255) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case` (`product`,`module`,`story`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_casestep`
-- ----------------------------
DROP TABLE IF EXISTS `zt_casestep`;
CREATE TABLE `zt_casestep` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `case` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` smallint(3) unsigned NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `expect` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_centeruser`
-- ----------------------------
DROP TABLE IF EXISTS `zt_centeruser`;
CREATE TABLE `zt_centeruser` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `hr_id` mediumint(8) NOT NULL COMMENT '对应HR的部门id',
  `dep_id` mediumint(8) NOT NULL COMMENT '部门Id',
  `manager_id` mediumint(8) DEFAULT NULL COMMENT '主管id',
  `username` varchar(30) DEFAULT NULL COMMENT '姓名',
  `account` mediumint(8) DEFAULT NULL COMMENT '工号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1：有效，0：失效',
  `route` enum('P','S','A') DEFAULT NULL COMMENT 'P：计划，S：统计,A:计划/统计',
  `fromway` tinyint(1) NOT NULL DEFAULT '1' COMMENT '来源，1：系统，0：手工',
  `is_valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1：有效，0：失效',
  `is_manager` tinyint(1) DEFAULT '0' COMMENT '管理员：1：是；0：不是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` mediumint(8) NOT NULL COMMENT '创建者',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=utf8 COMMENT='中心人员表';

-- ----------------------------
--  Table structure for `zt_company`
-- ----------------------------
DROP TABLE IF EXISTS `zt_company`;
CREATE TABLE `zt_company` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(120) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `fax` char(20) DEFAULT NULL,
  `address` char(120) DEFAULT NULL,
  `zipcode` char(10) DEFAULT NULL,
  `website` char(120) DEFAULT NULL,
  `backyard` char(120) DEFAULT NULL,
  `guest` enum('1','0') NOT NULL DEFAULT '0',
  `admins` char(255) DEFAULT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_company`
-- ----------------------------
BEGIN;
INSERT INTO `zt_company` VALUES ('1', '华润', '', '', '', '', '', '', '0', ',4422,', '0');
COMMIT;

-- ----------------------------
--  Table structure for `zt_config`
-- ----------------------------
DROP TABLE IF EXISTS `zt_config`;
CREATE TABLE `zt_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner` char(30) NOT NULL DEFAULT '',
  `module` varchar(30) NOT NULL,
  `section` char(30) NOT NULL DEFAULT '',
  `key` char(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`owner`,`module`,`section`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_config`
-- ----------------------------
BEGIN;
INSERT INTO `zt_config` VALUES ('1', 'system', 'common', 'global', 'version', '9.0.beta'), ('2', 'system', 'common', 'global', 'flow', 'full'), ('3', 'system', 'common', 'global', 'cron', '1'), ('4', 'admin', 'my', 'common', 'blockInited', '1'), ('5', 'system', 'cron', 'run', 'status', 'running'), ('6', 'admin', 'common', 'global', 'novice', 'false'), ('7', 'admin', 'product', '', 'homepage', 'index'), ('8', 'admin', 'product', 'common', 'blockInited', '1'), ('9', 'admin', 'project', '', 'homepage', 'index'), ('10', 'admin', 'project', 'common', 'blockInited', '1'), ('11', '11014', 'my', 'common', 'blockInited', '1'), ('12', '11014', 'common', 'global', 'novice', 'false'), ('13', '11014', 'product', '', 'homepage', 'index'), ('14', '11014', 'product', 'common', 'blockInited', '1'), ('15', '11014', 'project', '', 'homepage', 'index'), ('16', '11014', 'project', 'common', 'blockInited', '1'), ('17', '11014', 'qa', '', 'homepage', 'index'), ('18', '11014', 'qa', 'common', 'blockInited', '1');
COMMIT;

-- ----------------------------
--  Table structure for `zt_cron`
-- ----------------------------
DROP TABLE IF EXISTS `zt_cron`;
CREATE TABLE `zt_cron` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(20) NOT NULL,
  `h` varchar(20) NOT NULL,
  `dom` varchar(20) NOT NULL,
  `mon` varchar(20) NOT NULL,
  `dow` varchar(20) NOT NULL,
  `command` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `buildin` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL,
  `lastTime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lastTime` (`lastTime`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_cron`
-- ----------------------------
BEGIN;
INSERT INTO `zt_cron` VALUES ('1', '*', '*', '*', '*', '*', '', '监控定时任务', 'zentao', '1', 'normal', '2017-01-04 10:29:01'), ('2', '30', '23', '*', '*', '*', 'moduleName=project&methodName=computeburn', '更新燃尽图', 'zentao', '1', 'normal', '2016-11-16 09:14:46'), ('3', '0', '1', '*', '*', '*', 'moduleName=report&methodName=remind', '每日任务提醒', 'zentao', '1', 'normal', '2016-11-16 09:14:46'), ('4', '*/5', '*', '*', '*', '*', 'moduleName=svn&methodName=run', '同步SVN', 'zentao', '1', 'normal', '2017-01-04 10:25:01'), ('5', '*/5', '*', '*', '*', '*', 'moduleName=git&methodName=run', '同步GIT', 'zentao', '1', 'normal', '2017-01-04 10:25:01'), ('6', '30', '0', '*', '*', '*', 'moduleName=backup&methodName=backup', '备份数据和附件', 'zentao', '1', 'normal', '2016-11-16 09:14:59'), ('7', '*/5', '*', '*', '*', '*', 'moduleName=mail&methodName=asyncSend', '异步发信', 'zentao', '1', 'normal', '2017-01-04 10:25:01');
COMMIT;

-- ----------------------------
--  Table structure for `zt_csicode`
-- ----------------------------
DROP TABLE IF EXISTS `zt_csicode`;
CREATE TABLE `zt_csicode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custome_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `csi_code` varchar(60) NOT NULL,
  `release_id` int(6) NOT NULL,
  `expire_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_cusinfo`
-- ----------------------------
DROP TABLE IF EXISTS `zt_cusinfo`;
CREATE TABLE `zt_cusinfo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(150) NOT NULL,
  `cusname` char(30) NOT NULL DEFAULT '',
  `webaddress` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `account` (`cusname`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_cusinfo`
-- ----------------------------
BEGIN;
INSERT INTO `zt_cusinfo` VALUES ('1', '64723079@qq.com', '浙江宇视科技有限公司', 'www.uniview.com'), ('2', '346741069@qq.com', '测试', 'www.ll.com'), ('3', 'dhdjsgod@126.com', '东纪燊', 'www.jishen.space'), ('4', 'test@163.com', '测试动力', 'http://www.ceshidongli.com'), ('7', 'testtest@qwe.com', 'testtest', 'qwe.com'), ('8', '602077075@qq.com', 'jason', 'www.baidu.com');
COMMIT;

-- ----------------------------
--  Table structure for `zt_custome`
-- ----------------------------
DROP TABLE IF EXISTS `zt_custome`;
CREATE TABLE `zt_custome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(20) NOT NULL COMMENT '公司名称',
  `protimebegan` date NOT NULL COMMENT '合同开始时间',
  `protimeend` date NOT NULL COMMENT '合同结束时间',
  `project_id` int(6) NOT NULL COMMENT '项目ID',
  `contractid` varchar(20) NOT NULL COMMENT '合同编号',
  `promanager` varchar(20) NOT NULL COMMENT '项目负责人',
  `tel` bigint(16) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(60) NOT NULL COMMENT '邮箱',
  `buyproject` varchar(60) NOT NULL COMMENT '购买产品',
  `create_time` datetime NOT NULL,
  `create_by` int(10) NOT NULL,
  `edit_time` datetime NOT NULL,
  `last_editor` int(10) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_custome`
-- ----------------------------
BEGIN;
INSERT INTO `zt_custome` VALUES ('1', '汉得信息科技股份有限公司', '2016-11-24', '2016-11-25', '9', 'KGD13123124', '009:盛锡飞', '0', '', '2,1,4,3', '2016-11-28 15:58:05', '11014', '2016-11-28 15:59:35', '11014', '1'), ('2', '汉得信息科技股份有限公司', '2016-11-25', '2016-11-15', '1589', 'KGD13123124', '', '0', '', '2,1,3,4', '2016-11-28 16:02:13', '11014', '2016-11-28 16:03:42', '11014', '1'), ('3', '汉得信息科技股份有限公司', '2016-11-15', '2016-11-30', '9', 'KGD13123124', '005:吴晓通', '0', '', '3', '2016-11-29 09:24:17', '11014', '0000-00-00 00:00:00', null, '1'), ('4', '测试', '0000-00-00', '0000-00-00', '1098', 'KGD13123124', '', '0', '', '3,4,2', '2016-11-29 09:30:17', '11014', '0000-00-00 00:00:00', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `zt_dept`
-- ----------------------------
DROP TABLE IF EXISTS `zt_dept`;
CREATE TABLE `zt_dept` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(60) NOT NULL,
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` char(30) NOT NULL DEFAULT '',
  `function` char(255) NOT NULL DEFAULT '',
  `manager` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `dept` (`parent`,`path`)
) ENGINE=MyISAM AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_dept1`
-- ----------------------------
DROP TABLE IF EXISTS `zt_dept1`;
CREATE TABLE `zt_dept1` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(60) NOT NULL,
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` char(30) NOT NULL DEFAULT '',
  `function` char(255) NOT NULL DEFAULT '',
  `manager` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `dept` (`parent`,`path`)
) ENGINE=MyISAM AUTO_INCREMENT=1138 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_devcenter`
-- ----------------------------
DROP TABLE IF EXISTS `zt_devcenter`;
CREATE TABLE `zt_devcenter` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `center_name` varchar(30) DEFAULT NULL COMMENT '中心名称',
  `center_code` varchar(30) DEFAULT NULL COMMENT '中心代码',
  `manager_id` mediumint(8) DEFAULT NULL COMMENT '主管经理',
  `hr_id` mediumint(8) DEFAULT NULL COMMENT '对应HR部门id',
  `is_valid` tinyint(1) DEFAULT '1' COMMENT '是否有效：1：有效，0：无效',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否删除，1：正常，0删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `orders` mediumint(8) NOT NULL COMMENT '排序',
  `create_by` mediumint(8) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='开发中心表';

-- ----------------------------
--  Table structure for `zt_distribute`
-- ----------------------------
DROP TABLE IF EXISTS `zt_distribute`;
CREATE TABLE `zt_distribute` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `product` varchar(90) DEFAULT NULL,
  `release` varchar(50) NOT NULL,
  `department` varchar(40) NOT NULL,
  `applicant` varchar(40) DEFAULT NULL,
  `leader` varchar(40) NOT NULL,
  `licenseqty` int(11) NOT NULL,
  `licenseprice` int(11) NOT NULL,
  `custom` varchar(40) NOT NULL,
  `status` varchar(40) NOT NULL,
  `note` text NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
--  Table structure for `zt_doc`
-- ----------------------------
DROP TABLE IF EXISTS `zt_doc`;
CREATE TABLE `zt_doc` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `lib` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `views` smallint(5) unsigned NOT NULL,
  `addedBy` varchar(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `doc` (`product`,`project`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_doclib`
-- ----------------------------
DROP TABLE IF EXISTS `zt_doclib`;
CREATE TABLE `zt_doclib` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_download`
-- ----------------------------
DROP TABLE IF EXISTS `zt_download`;
CREATE TABLE `zt_download` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL,
  `release` varchar(255) NOT NULL,
  `staff` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
--  Records of `zt_download`
-- ----------------------------
BEGIN;
INSERT INTO `zt_download` VALUES ('1', '1', 'HRP1.0', '9241', '2016-07-05 10:43:09'), ('2', '1', 'HRP1.0', '9241', '2016-07-05 10:53:53'), ('3', '1', 'HRP1.0', '4422', '2016-07-06 15:52:52'), ('4', '1', 'HRP1.0', '7246', '2016-07-15 13:41:53'), ('5', '1', 'HRP1.0', '4422', '2016-07-22 09:45:45'), ('6', '1', 'HRP1.0', '9241', '2016-07-25 13:33:30');
COMMIT;

-- ----------------------------
--  Table structure for `zt_effort`
-- ----------------------------
DROP TABLE IF EXISTS `zt_effort`;
CREATE TABLE `zt_effort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` char(30) NOT NULL DEFAULT '',
  `todo` enum('1','0') NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  `begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` enum('1','2','3') NOT NULL DEFAULT '1',
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `desc` char(255) NOT NULL DEFAULT '',
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_extension`
-- ----------------------------
DROP TABLE IF EXISTS `zt_extension`;
CREATE TABLE `zt_extension` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `code` varchar(30) NOT NULL,
  `version` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `license` text NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'extension',
  `site` varchar(150) NOT NULL,
  `zentaoCompatible` varchar(100) NOT NULL,
  `installedTime` datetime NOT NULL,
  `depends` varchar(100) NOT NULL,
  `dirs` text NOT NULL,
  `files` text NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `extension` (`name`,`installedTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_file`
-- ----------------------------
DROP TABLE IF EXISTS `zt_file`;
CREATE TABLE `zt_file` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pathname` char(50) NOT NULL,
  `title` char(90) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) NOT NULL DEFAULT '',
  `addedDate` datetime NOT NULL,
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extra` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `file` (`objectType`,`objectID`)
) ENGINE=MyISAM AUTO_INCREMENT=514 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_group`
-- ----------------------------
DROP TABLE IF EXISTS `zt_group`;
CREATE TABLE `zt_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `role` char(30) NOT NULL DEFAULT '',
  `desc` char(255) NOT NULL DEFAULT '',
  `acl` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_group`
-- ----------------------------
BEGIN;
INSERT INTO `zt_group` VALUES ('1', '管理员', 'admin', '系统管理员', '{\"views\":{\"product\":\"product\",\"project\":\"project\",\"qa\":\"qa\",\"doc\":\"doc\",\"report\":\"report\",\"company\":\"company\",\"admin\":\"admin\",\"distribution\":\"distribution\",\"correspondent\":\"correspondent\",\"hdc\":\"hdc\"}}'), ('2', '研发', 'dev', '研发人员', ''), ('3', '测试', 'qa', '测试人员', ''), ('4', '项目经理', 'pm', '项目经理', ''), ('5', '产品经理', 'po', '产品经理', ''), ('6', '研发主管', 'td', '研发主管', ''), ('7', '产品主管', 'pd', '产品主管', ''), ('8', '测试主管', 'qd', '测试主管', ''), ('9', '高层管理', 'top', '高层管理', ''), ('10', '其他', '', '其他', ''), ('11', 'guest', 'guest', 'For guest', '');
COMMIT;

-- ----------------------------
--  Table structure for `zt_grouppriv`
-- ----------------------------
DROP TABLE IF EXISTS `zt_grouppriv`;
CREATE TABLE `zt_grouppriv` (
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` char(30) NOT NULL DEFAULT '',
  `method` char(30) NOT NULL DEFAULT '',
  UNIQUE KEY `group` (`group`,`module`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_grouppriv`
-- ----------------------------
BEGIN;
INSERT INTO `zt_grouppriv` VALUES ('1', 'action', 'editComment'), ('1', 'action', 'hideAll'), ('1', 'action', 'hideOne'), ('1', 'action', 'trash'), ('1', 'action', 'undelete'), ('1', 'admin', 'checkDB'), ('1', 'admin', 'checkWeak'), ('1', 'admin', 'index'), ('1', 'admin', 'safe'), ('1', 'api', 'debug'), ('1', 'api', 'getModel'), ('1', 'api', 'sql'), ('1', 'backup', 'backup'), ('1', 'backup', 'change'), ('1', 'backup', 'delete'), ('1', 'backup', 'index'), ('1', 'backup', 'restore'), ('1', 'branch', 'delete'), ('1', 'branch', 'manage'), ('1', 'bug', 'activate'), ('1', 'bug', 'assignTo'), ('1', 'bug', 'batchAssignTo'), ('1', 'bug', 'batchChangeModule'), ('1', 'bug', 'batchClose'), ('1', 'bug', 'batchConfirm'), ('1', 'bug', 'batchCreate'), ('1', 'bug', 'batchEdit'), ('1', 'bug', 'batchResolve'), ('1', 'bug', 'browse'), ('1', 'bug', 'close'), ('1', 'bug', 'confirmBug'), ('1', 'bug', 'confirmStoryChange'), ('1', 'bug', 'create'), ('1', 'bug', 'delete'), ('1', 'bug', 'deleteTemplate'), ('1', 'bug', 'edit'), ('1', 'bug', 'export'), ('1', 'bug', 'index'), ('1', 'bug', 'linkBugs'), ('1', 'bug', 'report'), ('1', 'bug', 'resolve'), ('1', 'bug', 'saveTemplate'), ('1', 'bug', 'unlinkBug'), ('1', 'bug', 'view'), ('1', 'build', 'batchUnlinkBug'), ('1', 'build', 'batchUnlinkStory'), ('1', 'build', 'create'), ('1', 'build', 'delete'), ('1', 'build', 'edit'), ('1', 'build', 'linkBug'), ('1', 'build', 'linkStory'), ('1', 'build', 'unlinkBug'), ('1', 'build', 'unlinkStory'), ('1', 'build', 'view'), ('1', 'bulletin', 'browse'), ('1', 'bulletin', 'create'), ('1', 'bulletin', 'delete'), ('1', 'bulletin', 'detail'), ('1', 'bulletin', 'edit'), ('1', 'company', 'browse'), ('1', 'company', 'dynamic'), ('1', 'company', 'edit'), ('1', 'company', 'index'), ('1', 'company', 'view'), ('1', 'convert', 'checkBugFree'), ('1', 'convert', 'checkConfig'), ('1', 'convert', 'checkRedmine'), ('1', 'convert', 'convertBugFree'), ('1', 'convert', 'convertRedmine'), ('1', 'convert', 'execute'), ('1', 'convert', 'index'), ('1', 'convert', 'selectSource'), ('1', 'convert', 'setBugfree'), ('1', 'convert', 'setConfig'), ('1', 'convert', 'setRedmine'), ('1', 'cron', 'create'), ('1', 'cron', 'delete'), ('1', 'cron', 'edit'), ('1', 'cron', 'index'), ('1', 'cron', 'toggle'), ('1', 'cron', 'turnon'), ('1', 'custom', 'flow'), ('1', 'custom', 'index'), ('1', 'custom', 'restore'), ('1', 'custom', 'set'), ('1', 'dept', 'browse'), ('1', 'dept', 'delete'), ('1', 'dept', 'edit'), ('1', 'dept', 'manageChild'), ('1', 'dept', 'updateOrder'), ('1', 'dev', 'api'), ('1', 'dev', 'db'), ('1', 'distribution', 'detail'), ('1', 'distribution', 'download'), ('1', 'distribution', 'index'), ('1', 'doc', 'browse'), ('1', 'doc', 'create'), ('1', 'doc', 'createLib'), ('1', 'doc', 'delete'), ('1', 'doc', 'deleteLib'), ('1', 'doc', 'edit'), ('1', 'doc', 'editLib'), ('1', 'doc', 'index'), ('1', 'doc', 'view'), ('1', 'editor', 'delete'), ('1', 'editor', 'edit'), ('1', 'editor', 'extend'), ('1', 'editor', 'index'), ('1', 'editor', 'newPage'), ('1', 'editor', 'save'), ('1', 'extension', 'activate'), ('1', 'extension', 'browse'), ('1', 'extension', 'deactivate'), ('1', 'extension', 'erase'), ('1', 'extension', 'install'), ('1', 'extension', 'obtain'), ('1', 'extension', 'structure'), ('1', 'extension', 'uninstall'), ('1', 'extension', 'upgrade'), ('1', 'extension', 'upload'), ('1', 'file', 'delete'), ('1', 'file', 'download'), ('1', 'file', 'edit'), ('1', 'file', 'uploadImages'), ('1', 'git', 'apiSync'), ('1', 'git', 'cat'), ('1', 'git', 'diff'), ('1', 'group', 'browse'), ('1', 'group', 'copy'), ('1', 'group', 'create'), ('1', 'group', 'delete'), ('1', 'group', 'edit'), ('1', 'group', 'manageMember'), ('1', 'group', 'managePriv'), ('1', 'group', 'manageView'), ('1', 'index', 'index'), ('1', 'mail', 'batchDelete'), ('1', 'mail', 'browse'), ('1', 'mail', 'delete'), ('1', 'mail', 'detect'), ('1', 'mail', 'edit'), ('1', 'mail', 'index'), ('1', 'mail', 'reset'), ('1', 'mail', 'save'), ('1', 'mail', 'test'), ('1', 'manual', 'browse'), ('1', 'manual', 'create'), ('1', 'manual', 'delete'), ('1', 'manual', 'edit'), ('1', 'manual', 'index'), ('1', 'manual', 'view'), ('1', 'misc', 'ping'), ('1', 'my', 'bug'), ('1', 'my', 'deleteContacts'), ('1', 'my', 'dynamic'), ('1', 'my', 'editProfile'), ('1', 'my', 'index'), ('1', 'my', 'manageContacts'), ('1', 'my', 'profile'), ('1', 'my', 'project'), ('1', 'my', 'story'), ('1', 'my', 'task'), ('1', 'my', 'testCase'), ('1', 'my', 'testTask'), ('1', 'my', 'todo'), ('1', 'my', 'unbind'), ('1', 'product', 'all'), ('1', 'product', 'batchEdit'), ('1', 'product', 'browse'), ('1', 'product', 'close'), ('1', 'product', 'create'), ('1', 'product', 'delete'), ('1', 'product', 'doc'), ('1', 'product', 'dynamic'), ('1', 'product', 'edit'), ('1', 'product', 'index'), ('1', 'product', 'project'), ('1', 'product', 'roadmap'), ('1', 'product', 'updateOrder'), ('1', 'product', 'view'), ('1', 'productplan', 'batchEdit'), ('1', 'productplan', 'batchUnlinkBug'), ('1', 'productplan', 'batchUnlinkStory'), ('1', 'productplan', 'browse'), ('1', 'productplan', 'create'), ('1', 'productplan', 'delete'), ('1', 'productplan', 'edit'), ('1', 'productplan', 'linkBug'), ('1', 'productplan', 'linkStory'), ('1', 'productplan', 'unlinkBug'), ('1', 'productplan', 'unlinkStory'), ('1', 'productplan', 'view'), ('1', 'project', 'activate'), ('1', 'project', 'addcustommember'), ('1', 'project', 'all'), ('1', 'project', 'batchedit'), ('1', 'project', 'batchUnlinkStory'), ('1', 'project', 'browse'), ('1', 'project', 'bug'), ('1', 'project', 'build'), ('1', 'project', 'burn'), ('1', 'project', 'burnData'), ('1', 'project', 'close'), ('1', 'project', 'computeBurn'), ('1', 'project', 'create'), ('1', 'project', 'custommanage'), ('1', 'project', 'delete'), ('1', 'project', 'doc'), ('1', 'project', 'dynamic'), ('1', 'project', 'edit'), ('1', 'project', 'grouptask'), ('1', 'project', 'importBug'), ('1', 'project', 'importtask'), ('1', 'project', 'index'), ('1', 'project', 'kanban'), ('1', 'project', 'linkStory'), ('1', 'project', 'manageMembers'), ('1', 'project', 'manageProducts'), ('1', 'project', 'putoff'), ('1', 'project', 'start'), ('1', 'project', 'story'), ('1', 'project', 'suspend'), ('1', 'project', 'task'), ('1', 'project', 'team'), ('1', 'project', 'testtask'), ('1', 'project', 'tree'), ('1', 'project', 'unlinkcustom'), ('1', 'project', 'unlinkMember'), ('1', 'project', 'unlinkStory'), ('1', 'project', 'updateOrder'), ('1', 'project', 'view'), ('1', 'qa', 'index'), ('1', 'release', 'batchUnlinkBug'), ('1', 'release', 'batchUnlinkStory'), ('1', 'release', 'browse'), ('1', 'release', 'changeStatus'), ('1', 'release', 'create'), ('1', 'release', 'delete'), ('1', 'release', 'edit'), ('1', 'release', 'export'), ('1', 'release', 'linkBug'), ('1', 'release', 'linkStory'), ('1', 'release', 'unlinkBug'), ('1', 'release', 'unlinkStory'), ('1', 'release', 'view'), ('1', 'report', 'bugAssign'), ('1', 'report', 'bugCreate'), ('1', 'report', 'index'), ('1', 'report', 'productStatistics'), ('1', 'report', 'productStatisticsExport'), ('1', 'report', 'productSummary'), ('1', 'report', 'projectDays'), ('1', 'report', 'projectDeviation'), ('1', 'report', 'workload'), ('1', 'search', 'buildForm'), ('1', 'search', 'buildQuery'), ('1', 'search', 'deleteQuery'), ('1', 'search', 'saveQuery'), ('1', 'search', 'select'), ('1', 'story', 'activate'), ('1', 'story', 'batchAssignTo'), ('1', 'story', 'batchChangeBranch'), ('1', 'story', 'batchChangeModule'), ('1', 'story', 'batchChangePlan'), ('1', 'story', 'batchChangeStage'), ('1', 'story', 'batchClose'), ('1', 'story', 'batchCreate'), ('1', 'story', 'batchEdit'), ('1', 'story', 'batchReview'), ('1', 'story', 'change'), ('1', 'story', 'close'), ('1', 'story', 'create'), ('1', 'story', 'delete'), ('1', 'story', 'edit'), ('1', 'story', 'export'), ('1', 'story', 'linkStory'), ('1', 'story', 'report'), ('1', 'story', 'review'), ('1', 'story', 'tasks'), ('1', 'story', 'unlinkStory'), ('1', 'story', 'view'), ('1', 'story', 'zeroCase'), ('1', 'svn', 'apiSync'), ('1', 'svn', 'cat'), ('1', 'svn', 'diff'), ('1', 'task', 'activate'), ('1', 'task', 'assignTo'), ('1', 'task', 'batchAssignTo'), ('1', 'task', 'batchChangeModule'), ('1', 'task', 'batchClose'), ('1', 'task', 'batchCreate'), ('1', 'task', 'batchEdit'), ('1', 'task', 'cancel'), ('1', 'task', 'close'), ('1', 'task', 'confirmStoryChange'), ('1', 'task', 'create'), ('1', 'task', 'delete'), ('1', 'task', 'deleteEstimate'), ('1', 'task', 'edit'), ('1', 'task', 'editEstimate'), ('1', 'task', 'export'), ('1', 'task', 'finish'), ('1', 'task', 'pause'), ('1', 'task', 'recordEstimate'), ('1', 'task', 'report'), ('1', 'task', 'restart'), ('1', 'task', 'start'), ('1', 'task', 'view'), ('1', 'testcase', 'batchChangeModule'), ('1', 'testcase', 'batchCreate'), ('1', 'testcase', 'batchDelete'), ('1', 'testcase', 'batchEdit'), ('1', 'testcase', 'browse'), ('1', 'testcase', 'confirmChange'), ('1', 'testcase', 'confirmStoryChange'), ('1', 'testcase', 'create'), ('1', 'testcase', 'createBug'), ('1', 'testcase', 'delete'), ('1', 'testcase', 'edit'), ('1', 'testcase', 'export'), ('1', 'testcase', 'exportTemplet'), ('1', 'testcase', 'groupCase'), ('1', 'testcase', 'import'), ('1', 'testcase', 'index'), ('1', 'testcase', 'linkCases'), ('1', 'testcase', 'showImport'), ('1', 'testcase', 'unlinkCase'), ('1', 'testcase', 'view'), ('1', 'testtask', 'batchAssign'), ('1', 'testtask', 'batchRun'), ('1', 'testtask', 'browse'), ('1', 'testtask', 'cases'), ('1', 'testtask', 'close'), ('1', 'testtask', 'create'), ('1', 'testtask', 'delete'), ('1', 'testtask', 'edit'), ('1', 'testtask', 'groupCase'), ('1', 'testtask', 'index'), ('1', 'testtask', 'linkcase'), ('1', 'testtask', 'results'), ('1', 'testtask', 'runcase'), ('1', 'testtask', 'start'), ('1', 'testtask', 'unlinkcase'), ('1', 'testtask', 'view'), ('1', 'todo', 'batchCreate'), ('1', 'todo', 'batchEdit'), ('1', 'todo', 'batchFinish'), ('1', 'todo', 'create'), ('1', 'todo', 'delete'), ('1', 'todo', 'edit'), ('1', 'todo', 'export'), ('1', 'todo', 'finish'), ('1', 'todo', 'import2Today'), ('1', 'todo', 'view'), ('1', 'tree', 'browse'), ('1', 'tree', 'browseTask'), ('1', 'tree', 'delete'), ('1', 'tree', 'edit'), ('1', 'tree', 'fix'), ('1', 'tree', 'manageChild'), ('1', 'tree', 'updateOrder'), ('1', 'user', 'batchCreate'), ('1', 'user', 'batchEdit'), ('1', 'user', 'bug'), ('1', 'user', 'create'), ('1', 'user', 'delete'), ('1', 'user', 'dynamic'), ('1', 'user', 'edit'), ('1', 'user', 'profile'), ('1', 'user', 'project'), ('1', 'user', 'story'), ('1', 'user', 'task'), ('1', 'user', 'testCase'), ('1', 'user', 'testTask'), ('1', 'user', 'todo'), ('1', 'user', 'unbind'), ('1', 'user', 'unlock'), ('1', 'user', 'view'), ('2', 'action', 'editComment'), ('2', 'api', 'getModel'), ('2', 'bug', 'activate'), ('2', 'bug', 'assignTo'), ('2', 'bug', 'batchAssignTo'), ('2', 'bug', 'batchChangeModule'), ('2', 'bug', 'batchClose'), ('2', 'bug', 'batchConfirm'), ('2', 'bug', 'batchCreate'), ('2', 'bug', 'batchEdit'), ('2', 'bug', 'batchResolve'), ('2', 'bug', 'browse'), ('2', 'bug', 'close'), ('2', 'bug', 'confirmBug'), ('2', 'bug', 'confirmStoryChange'), ('2', 'bug', 'create'), ('2', 'bug', 'deleteTemplate'), ('2', 'bug', 'edit'), ('2', 'bug', 'export'), ('2', 'bug', 'index'), ('2', 'bug', 'linkBugs'), ('2', 'bug', 'report'), ('2', 'bug', 'resolve'), ('2', 'bug', 'saveTemplate'), ('2', 'bug', 'unlinkBug'), ('2', 'bug', 'view'), ('2', 'build', 'create'), ('2', 'build', 'delete'), ('2', 'build', 'edit'), ('2', 'build', 'view'), ('2', 'bulletin', 'browse'), ('2', 'bulletin', 'detail'), ('2', 'company', 'browse'), ('2', 'company', 'dynamic'), ('2', 'company', 'index'), ('2', 'company', 'view'), ('2', 'doc', 'browse'), ('2', 'doc', 'create'), ('2', 'doc', 'edit'), ('2', 'doc', 'index'), ('2', 'doc', 'view'), ('2', 'file', 'download'), ('2', 'file', 'edit'), ('2', 'git', 'apiSync'), ('2', 'git', 'cat'), ('2', 'git', 'diff'), ('2', 'group', 'browse'), ('2', 'index', 'index'), ('2', 'misc', 'ping'), ('2', 'my', 'bug'), ('2', 'my', 'changePassword'), ('2', 'my', 'deleteContacts'), ('2', 'my', 'editProfile'), ('2', 'my', 'index'), ('2', 'my', 'manageContacts'), ('2', 'my', 'profile'), ('2', 'my', 'project'), ('2', 'my', 'story'), ('2', 'my', 'task'), ('2', 'my', 'todo'), ('2', 'my', 'unbind'), ('2', 'product', 'all'), ('2', 'product', 'browse'), ('2', 'product', 'doc'), ('2', 'product', 'dynamic'), ('2', 'product', 'index'), ('2', 'product', 'project'), ('2', 'product', 'roadmap'), ('2', 'product', 'view'), ('2', 'productplan', 'browse'), ('2', 'productplan', 'view'), ('2', 'project', 'all'), ('2', 'project', 'browse'), ('2', 'project', 'bug'), ('2', 'project', 'build'), ('2', 'project', 'burn'), ('2', 'project', 'burnData'), ('2', 'project', 'computeBurn'), ('2', 'project', 'doc'), ('2', 'project', 'dynamic'), ('2', 'project', 'grouptask'), ('2', 'project', 'importBug'), ('2', 'project', 'importtask'), ('2', 'project', 'index'), ('2', 'project', 'kanban'), ('2', 'project', 'story'), ('2', 'project', 'task'), ('2', 'project', 'team'), ('2', 'project', 'testtask'), ('2', 'project', 'tree'), ('2', 'project', 'view'), ('2', 'qa', 'index'), ('2', 'release', 'browse'), ('2', 'release', 'export'), ('2', 'release', 'view'), ('2', 'report', 'bugAssign'), ('2', 'report', 'bugCreate'), ('2', 'report', 'index'), ('2', 'report', 'productSummary'), ('2', 'report', 'projectDeviation'), ('2', 'report', 'workload'), ('2', 'search', 'buildForm'), ('2', 'search', 'buildQuery'), ('2', 'search', 'deleteQuery'), ('2', 'search', 'saveQuery'), ('2', 'search', 'select'), ('2', 'story', 'export'), ('2', 'story', 'report'), ('2', 'story', 'tasks'), ('2', 'story', 'view'), ('2', 'svn', 'apiSync'), ('2', 'svn', 'cat'), ('2', 'svn', 'diff'), ('2', 'task', 'activate'), ('2', 'task', 'assignTo'), ('2', 'task', 'batchAssignTo'), ('2', 'task', 'batchChangeModule'), ('2', 'task', 'batchClose'), ('2', 'task', 'batchCreate'), ('2', 'task', 'batchEdit'), ('2', 'task', 'cancel'), ('2', 'task', 'close'), ('2', 'task', 'confirmStoryChange'), ('2', 'task', 'create'), ('2', 'task', 'deleteEstimate'), ('2', 'task', 'edit'), ('2', 'task', 'editEstimate'), ('2', 'task', 'export'), ('2', 'task', 'finish'), ('2', 'task', 'pause'), ('2', 'task', 'recordEstimate'), ('2', 'task', 'report'), ('2', 'task', 'restart'), ('2', 'task', 'start'), ('2', 'task', 'view'), ('2', 'testcase', 'browse'), ('2', 'testcase', 'export'), ('2', 'testcase', 'groupCase'), ('2', 'testcase', 'index'), ('2', 'testcase', 'view'), ('2', 'testtask', 'browse'), ('2', 'testtask', 'cases'), ('2', 'testtask', 'create'), ('2', 'testtask', 'edit'), ('2', 'testtask', 'groupCase'), ('2', 'testtask', 'index'), ('2', 'testtask', 'results'), ('2', 'testtask', 'view'), ('2', 'todo', 'batchCreate'), ('2', 'todo', 'batchEdit'), ('2', 'todo', 'batchFinish'), ('2', 'todo', 'create'), ('2', 'todo', 'delete'), ('2', 'todo', 'edit'), ('2', 'todo', 'export'), ('2', 'todo', 'finish'), ('2', 'todo', 'import2Today'), ('2', 'todo', 'view'), ('2', 'user', 'bug'), ('2', 'user', 'deleteContacts'), ('2', 'user', 'dynamic'), ('2', 'user', 'manageContacts'), ('2', 'user', 'profile'), ('2', 'user', 'project'), ('2', 'user', 'story'), ('2', 'user', 'task'), ('2', 'user', 'testCase'), ('2', 'user', 'testTask'), ('2', 'user', 'todo'), ('2', 'user', 'view'), ('3', 'action', 'editComment'), ('3', 'api', 'getModel'), ('3', 'bug', 'activate'), ('3', 'bug', 'assignTo'), ('3', 'bug', 'batchChangeModule'), ('3', 'bug', 'batchClose'), ('3', 'bug', 'batchConfirm'), ('3', 'bug', 'batchCreate'), ('3', 'bug', 'batchEdit'), ('3', 'bug', 'batchResolve'), ('3', 'bug', 'browse'), ('3', 'bug', 'close'), ('3', 'bug', 'confirmBug'), ('3', 'bug', 'confirmStoryChange'), ('3', 'bug', 'create'), ('3', 'bug', 'deleteTemplate'), ('3', 'bug', 'edit'), ('3', 'bug', 'export'), ('3', 'bug', 'index'), ('3', 'bug', 'linkBugs'), ('3', 'bug', 'report'), ('3', 'bug', 'resolve'), ('3', 'bug', 'saveTemplate'), ('3', 'bug', 'unlinkBug'), ('3', 'bug', 'view'), ('3', 'build', 'create'), ('3', 'build', 'edit'), ('3', 'build', 'view'), ('3', 'bulletin', 'browse'), ('3', 'bulletin', 'detail'), ('3', 'company', 'browse'), ('3', 'company', 'dynamic'), ('3', 'company', 'index'), ('3', 'company', 'view'), ('3', 'doc', 'browse'), ('3', 'doc', 'create'), ('3', 'doc', 'edit'), ('3', 'doc', 'index'), ('3', 'doc', 'view'), ('3', 'file', 'download'), ('3', 'file', 'edit'), ('3', 'git', 'apiSync'), ('3', 'git', 'cat'), ('3', 'git', 'diff'), ('3', 'group', 'browse'), ('3', 'index', 'index'), ('3', 'misc', 'ping'), ('3', 'my', 'bug'), ('3', 'my', 'changePassword'), ('3', 'my', 'deleteContacts'), ('3', 'my', 'editProfile'), ('3', 'my', 'index'), ('3', 'my', 'manageContacts'), ('3', 'my', 'profile'), ('3', 'my', 'project'), ('3', 'my', 'story'), ('3', 'my', 'task'), ('3', 'my', 'testCase'), ('3', 'my', 'testTask'), ('3', 'my', 'todo'), ('3', 'my', 'unbind'), ('3', 'product', 'all'), ('3', 'product', 'browse'), ('3', 'product', 'doc'), ('3', 'product', 'dynamic'), ('3', 'product', 'index'), ('3', 'product', 'project'), ('3', 'product', 'roadmap'), ('3', 'product', 'view'), ('3', 'productplan', 'browse'), ('3', 'productplan', 'view'), ('3', 'project', 'all'), ('3', 'project', 'browse'), ('3', 'project', 'bug'), ('3', 'project', 'build'), ('3', 'project', 'burn'), ('3', 'project', 'burnData'), ('3', 'project', 'computeBurn'), ('3', 'project', 'doc'), ('3', 'project', 'dynamic'), ('3', 'project', 'grouptask'), ('3', 'project', 'importBug'), ('3', 'project', 'importtask'), ('3', 'project', 'index'), ('3', 'project', 'kanban'), ('3', 'project', 'story'), ('3', 'project', 'task'), ('3', 'project', 'team'), ('3', 'project', 'testtask'), ('3', 'project', 'tree'), ('3', 'project', 'view'), ('3', 'qa', 'index'), ('3', 'release', 'browse'), ('3', 'release', 'export'), ('3', 'release', 'view'), ('3', 'report', 'bugAssign'), ('3', 'report', 'bugCreate'), ('3', 'report', 'index'), ('3', 'report', 'productSummary'), ('3', 'report', 'projectDeviation'), ('3', 'report', 'workload'), ('3', 'search', 'buildForm'), ('3', 'search', 'buildQuery'), ('3', 'search', 'deleteQuery'), ('3', 'search', 'saveQuery'), ('3', 'search', 'select'), ('3', 'story', 'export'), ('3', 'story', 'report'), ('3', 'story', 'tasks'), ('3', 'story', 'view'), ('3', 'story', 'zeroCase'), ('3', 'svn', 'apiSync'), ('3', 'svn', 'cat'), ('3', 'svn', 'diff'), ('3', 'task', 'activate'), ('3', 'task', 'assignTo'), ('3', 'task', 'batchAssignTo'), ('3', 'task', 'batchChangeModule'), ('3', 'task', 'batchClose'), ('3', 'task', 'batchCreate'), ('3', 'task', 'batchEdit'), ('3', 'task', 'cancel'), ('3', 'task', 'close'), ('3', 'task', 'confirmStoryChange'), ('3', 'task', 'create'), ('3', 'task', 'deleteEstimate'), ('3', 'task', 'edit'), ('3', 'task', 'editEstimate'), ('3', 'task', 'export'), ('3', 'task', 'finish'), ('3', 'task', 'pause'), ('3', 'task', 'recordEstimate'), ('3', 'task', 'report'), ('3', 'task', 'restart'), ('3', 'task', 'start'), ('3', 'task', 'view'), ('3', 'testcase', 'batchChangeModule'), ('3', 'testcase', 'batchCreate'), ('3', 'testcase', 'batchEdit'), ('3', 'testcase', 'browse'), ('3', 'testcase', 'confirmChange'), ('3', 'testcase', 'confirmStoryChange'), ('3', 'testcase', 'create'), ('3', 'testcase', 'createBug'), ('3', 'testcase', 'edit'), ('3', 'testcase', 'export'), ('3', 'testcase', 'exportTemplet'), ('3', 'testcase', 'groupCase'), ('3', 'testcase', 'import'), ('3', 'testcase', 'index'), ('3', 'testcase', 'linkCases'), ('3', 'testcase', 'showImport'), ('3', 'testcase', 'unlinkCase'), ('3', 'testcase', 'view'), ('3', 'testtask', 'batchAssign'), ('3', 'testtask', 'batchRun'), ('3', 'testtask', 'browse'), ('3', 'testtask', 'cases'), ('3', 'testtask', 'close'), ('3', 'testtask', 'create'), ('3', 'testtask', 'edit'), ('3', 'testtask', 'groupCase'), ('3', 'testtask', 'index'), ('3', 'testtask', 'linkcase'), ('3', 'testtask', 'results'), ('3', 'testtask', 'runcase'), ('3', 'testtask', 'start'), ('3', 'testtask', 'unlinkcase'), ('3', 'testtask', 'view'), ('3', 'todo', 'batchCreate'), ('3', 'todo', 'batchEdit'), ('3', 'todo', 'batchFinish'), ('3', 'todo', 'create'), ('3', 'todo', 'delete'), ('3', 'todo', 'edit'), ('3', 'todo', 'export'), ('3', 'todo', 'finish'), ('3', 'todo', 'import2Today'), ('3', 'todo', 'view'), ('3', 'user', 'bug'), ('3', 'user', 'deleteContacts'), ('3', 'user', 'dynamic'), ('3', 'user', 'manageContacts'), ('3', 'user', 'profile'), ('3', 'user', 'project'), ('3', 'user', 'story'), ('3', 'user', 'task'), ('3', 'user', 'testCase'), ('3', 'user', 'testTask'), ('3', 'user', 'todo'), ('3', 'user', 'view'), ('4', 'action', 'editComment'), ('4', 'action', 'hideAll'), ('4', 'action', 'hideOne'), ('4', 'action', 'trash'), ('4', 'action', 'undelete'), ('4', 'admin', 'index'), ('4', 'api', 'getModel'), ('4', 'bug', 'activate'), ('4', 'bug', 'assignTo'), ('4', 'bug', 'batchAssignTo'), ('4', 'bug', 'batchChangeModule'), ('4', 'bug', 'batchClose'), ('4', 'bug', 'batchConfirm'), ('4', 'bug', 'batchCreate'), ('4', 'bug', 'batchEdit'), ('4', 'bug', 'batchResolve'), ('4', 'bug', 'browse'), ('4', 'bug', 'close'), ('4', 'bug', 'confirmBug'), ('4', 'bug', 'confirmStoryChange'), ('4', 'bug', 'create'), ('4', 'bug', 'delete'), ('4', 'bug', 'deleteTemplate'), ('4', 'bug', 'edit'), ('4', 'bug', 'export'), ('4', 'bug', 'index'), ('4', 'bug', 'linkBugs'), ('4', 'bug', 'report'), ('4', 'bug', 'resolve'), ('4', 'bug', 'saveTemplate'), ('4', 'bug', 'unlinkBug'), ('4', 'bug', 'view'), ('4', 'build', 'batchUnlinkBug'), ('4', 'build', 'batchUnlinkStory'), ('4', 'build', 'create'), ('4', 'build', 'delete'), ('4', 'build', 'edit'), ('4', 'build', 'linkBug'), ('4', 'build', 'linkStory'), ('4', 'build', 'unlinkBug'), ('4', 'build', 'unlinkStory'), ('4', 'build', 'view'), ('4', 'bulletin', 'browse'), ('4', 'bulletin', 'detail'), ('4', 'company', 'browse'), ('4', 'company', 'dynamic'), ('4', 'company', 'index'), ('4', 'company', 'view'), ('4', 'doc', 'browse'), ('4', 'doc', 'create'), ('4', 'doc', 'createLib'), ('4', 'doc', 'delete'), ('4', 'doc', 'deleteLib'), ('4', 'doc', 'edit'), ('4', 'doc', 'editLib'), ('4', 'doc', 'index'), ('4', 'doc', 'view'), ('4', 'extension', 'browse'), ('4', 'extension', 'obtain'), ('4', 'extension', 'structure'), ('4', 'file', 'delete'), ('4', 'file', 'download'), ('4', 'file', 'edit'), ('4', 'file', 'uploadImages'), ('4', 'git', 'apiSync'), ('4', 'git', 'cat'), ('4', 'git', 'diff'), ('4', 'group', 'browse'), ('4', 'index', 'index'), ('4', 'misc', 'ping'), ('4', 'my', 'bug'), ('4', 'my', 'changePassword'), ('4', 'my', 'deleteContacts'), ('4', 'my', 'editProfile'), ('4', 'my', 'index'), ('4', 'my', 'manageContacts'), ('4', 'my', 'profile'), ('4', 'my', 'project'), ('4', 'my', 'story'), ('4', 'my', 'task'), ('4', 'my', 'testCase'), ('4', 'my', 'testTask'), ('4', 'my', 'todo'), ('4', 'my', 'unbind'), ('4', 'product', 'all'), ('4', 'product', 'browse'), ('4', 'product', 'doc'), ('4', 'product', 'dynamic'), ('4', 'product', 'index'), ('4', 'product', 'project'), ('4', 'product', 'roadmap'), ('4', 'product', 'view'), ('4', 'productplan', 'browse'), ('4', 'productplan', 'view'), ('4', 'project', 'activate'), ('4', 'project', 'all'), ('4', 'project', 'batchedit'), ('4', 'project', 'batchUnlinkStory'), ('4', 'project', 'browse'), ('4', 'project', 'bug'), ('4', 'project', 'build'), ('4', 'project', 'burn'), ('4', 'project', 'burnData'), ('4', 'project', 'close'), ('4', 'project', 'computeBurn'), ('4', 'project', 'create'), ('4', 'project', 'delete'), ('4', 'project', 'doc'), ('4', 'project', 'dynamic'), ('4', 'project', 'edit'), ('4', 'project', 'grouptask'), ('4', 'project', 'importBug'), ('4', 'project', 'importtask'), ('4', 'project', 'index'), ('4', 'project', 'kanban'), ('4', 'project', 'linkStory'), ('4', 'project', 'manageMembers'), ('4', 'project', 'manageProducts'), ('4', 'project', 'putoff'), ('4', 'project', 'start'), ('4', 'project', 'story'), ('4', 'project', 'suspend'), ('4', 'project', 'task'), ('4', 'project', 'team'), ('4', 'project', 'testtask'), ('4', 'project', 'tree'), ('4', 'project', 'unlinkMember'), ('4', 'project', 'unlinkStory'), ('4', 'project', 'updateOrder'), ('4', 'project', 'view'), ('4', 'qa', 'index'), ('4', 'release', 'browse'), ('4', 'release', 'export'), ('4', 'release', 'view'), ('4', 'report', 'bugAssign'), ('4', 'report', 'bugCreate'), ('4', 'report', 'index'), ('4', 'report', 'productSummary'), ('4', 'report', 'projectDeviation'), ('4', 'report', 'workload'), ('4', 'search', 'buildForm'), ('4', 'search', 'buildQuery'), ('4', 'search', 'deleteQuery'), ('4', 'search', 'saveQuery'), ('4', 'search', 'select'), ('4', 'story', 'export'), ('4', 'story', 'report'), ('4', 'story', 'tasks'), ('4', 'story', 'view'), ('4', 'story', 'zeroCase'), ('4', 'svn', 'apiSync'), ('4', 'svn', 'cat'), ('4', 'svn', 'diff'), ('4', 'task', 'activate'), ('4', 'task', 'assignTo'), ('4', 'task', 'batchAssignTo'), ('4', 'task', 'batchChangeModule'), ('4', 'task', 'batchClose'), ('4', 'task', 'batchCreate'), ('4', 'task', 'batchEdit'), ('4', 'task', 'cancel'), ('4', 'task', 'close'), ('4', 'task', 'confirmStoryChange'), ('4', 'task', 'create'), ('4', 'task', 'delete'), ('4', 'task', 'deleteEstimate'), ('4', 'task', 'edit'), ('4', 'task', 'editEstimate'), ('4', 'task', 'export'), ('4', 'task', 'finish'), ('4', 'task', 'pause'), ('4', 'task', 'recordEstimate'), ('4', 'task', 'report'), ('4', 'task', 'restart'), ('4', 'task', 'start'), ('4', 'task', 'view'), ('4', 'testcase', 'browse'), ('4', 'testcase', 'createBug'), ('4', 'testcase', 'export'), ('4', 'testcase', 'groupCase'), ('4', 'testcase', 'index'), ('4', 'testcase', 'view'), ('4', 'testtask', 'batchAssign'), ('4', 'testtask', 'browse'), ('4', 'testtask', 'cases'), ('4', 'testtask', 'create'), ('4', 'testtask', 'edit'), ('4', 'testtask', 'groupCase'), ('4', 'testtask', 'index'), ('4', 'testtask', 'results'), ('4', 'testtask', 'view'), ('4', 'todo', 'batchCreate'), ('4', 'todo', 'batchEdit'), ('4', 'todo', 'batchFinish'), ('4', 'todo', 'create'), ('4', 'todo', 'delete'), ('4', 'todo', 'edit'), ('4', 'todo', 'export'), ('4', 'todo', 'finish'), ('4', 'todo', 'import2Today'), ('4', 'todo', 'view'), ('4', 'tree', 'browse'), ('4', 'tree', 'browseTask'), ('4', 'tree', 'delete'), ('4', 'tree', 'edit'), ('4', 'tree', 'fix'), ('4', 'tree', 'manageChild'), ('4', 'tree', 'updateOrder'), ('4', 'user', 'bug'), ('4', 'user', 'deleteContacts'), ('4', 'user', 'dynamic'), ('4', 'user', 'manageContacts'), ('4', 'user', 'profile'), ('4', 'user', 'project'), ('4', 'user', 'story'), ('4', 'user', 'task'), ('4', 'user', 'testCase'), ('4', 'user', 'testTask'), ('4', 'user', 'todo'), ('4', 'user', 'view'), ('5', 'action', 'editComment'), ('5', 'action', 'hideAll'), ('5', 'action', 'hideOne'), ('5', 'action', 'trash'), ('5', 'action', 'undelete'), ('5', 'admin', 'index'), ('5', 'api', 'getModel'), ('5', 'branch', 'delete'), ('5', 'branch', 'manage'), ('5', 'bug', 'activate'), ('5', 'bug', 'assignTo'), ('5', 'bug', 'batchAssignTo'), ('5', 'bug', 'batchChangeModule'), ('5', 'bug', 'batchClose'), ('5', 'bug', 'batchConfirm'), ('5', 'bug', 'batchCreate'), ('5', 'bug', 'batchEdit'), ('5', 'bug', 'batchResolve'), ('5', 'bug', 'browse'), ('5', 'bug', 'close'), ('5', 'bug', 'confirmBug'), ('5', 'bug', 'confirmStoryChange'), ('5', 'bug', 'create'), ('5', 'bug', 'deleteTemplate'), ('5', 'bug', 'edit'), ('5', 'bug', 'export'), ('5', 'bug', 'index'), ('5', 'bug', 'linkBugs'), ('5', 'bug', 'report'), ('5', 'bug', 'resolve'), ('5', 'bug', 'saveTemplate'), ('5', 'bug', 'unlinkBug'), ('5', 'bug', 'view'), ('5', 'build', 'view'), ('5', 'bulletin', 'browse'), ('5', 'bulletin', 'detail'), ('5', 'company', 'browse'), ('5', 'company', 'dynamic'), ('5', 'company', 'index'), ('5', 'company', 'view'), ('5', 'doc', 'browse'), ('5', 'doc', 'create'), ('5', 'doc', 'createLib'), ('5', 'doc', 'delete'), ('5', 'doc', 'deleteLib'), ('5', 'doc', 'edit'), ('5', 'doc', 'editLib'), ('5', 'doc', 'index'), ('5', 'doc', 'view'), ('5', 'extension', 'browse'), ('5', 'extension', 'obtain'), ('5', 'extension', 'structure'), ('5', 'file', 'delete'), ('5', 'file', 'download'), ('5', 'file', 'edit'), ('5', 'file', 'uploadImages'), ('5', 'git', 'apiSync'), ('5', 'git', 'cat'), ('5', 'git', 'diff'), ('5', 'group', 'browse'), ('5', 'index', 'index'), ('5', 'misc', 'ping'), ('5', 'my', 'bug'), ('5', 'my', 'changePassword'), ('5', 'my', 'deleteContacts'), ('5', 'my', 'editProfile'), ('5', 'my', 'index'), ('5', 'my', 'manageContacts'), ('5', 'my', 'profile'), ('5', 'my', 'project'), ('5', 'my', 'story'), ('5', 'my', 'task'), ('5', 'my', 'testCase'), ('5', 'my', 'testTask'), ('5', 'my', 'todo'), ('5', 'my', 'unbind'), ('5', 'product', 'all'), ('5', 'product', 'batchEdit'), ('5', 'product', 'browse'), ('5', 'product', 'close'), ('5', 'product', 'create'), ('5', 'product', 'delete'), ('5', 'product', 'doc'), ('5', 'product', 'dynamic'), ('5', 'product', 'edit'), ('5', 'product', 'index'), ('5', 'product', 'project'), ('5', 'product', 'roadmap'), ('5', 'product', 'updateOrder'), ('5', 'product', 'view'), ('5', 'productplan', 'batchUnlinkBug'), ('5', 'productplan', 'batchUnlinkStory'), ('5', 'productplan', 'browse'), ('5', 'productplan', 'create'), ('5', 'productplan', 'delete'), ('5', 'productplan', 'edit'), ('5', 'productplan', 'linkBug'), ('5', 'productplan', 'linkStory'), ('5', 'productplan', 'unlinkBug'), ('5', 'productplan', 'unlinkStory'), ('5', 'productplan', 'view'), ('5', 'project', 'activate'), ('5', 'project', 'all'), ('5', 'project', 'batchedit'), ('5', 'project', 'batchUnlinkStory'), ('5', 'project', 'browse'), ('5', 'project', 'bug'), ('5', 'project', 'build'), ('5', 'project', 'burn'), ('5', 'project', 'burnData'), ('5', 'project', 'close'), ('5', 'project', 'computeBurn'), ('5', 'project', 'create'), ('5', 'project', 'delete'), ('5', 'project', 'doc'), ('5', 'project', 'dynamic'), ('5', 'project', 'edit'), ('5', 'project', 'grouptask'), ('5', 'project', 'importBug'), ('5', 'project', 'importtask'), ('5', 'project', 'index'), ('5', 'project', 'kanban'), ('5', 'project', 'linkStory'), ('5', 'project', 'manageMembers'), ('5', 'project', 'manageProducts'), ('5', 'project', 'putoff'), ('5', 'project', 'start'), ('5', 'project', 'story'), ('5', 'project', 'suspend'), ('5', 'project', 'task'), ('5', 'project', 'team'), ('5', 'project', 'testtask'), ('5', 'project', 'tree'), ('5', 'project', 'unlinkMember'), ('5', 'project', 'unlinkStory'), ('5', 'project', 'updateOrder'), ('5', 'project', 'view'), ('5', 'qa', 'index'), ('5', 'release', 'batchUnlinkBug'), ('5', 'release', 'batchUnlinkStory'), ('5', 'release', 'browse'), ('5', 'release', 'changeStatus'), ('5', 'release', 'create'), ('5', 'release', 'delete'), ('5', 'release', 'edit'), ('5', 'release', 'export'), ('5', 'release', 'linkBug'), ('5', 'release', 'linkStory'), ('5', 'release', 'unlinkBug'), ('5', 'release', 'unlinkStory'), ('5', 'release', 'view'), ('5', 'report', 'bugAssign'), ('5', 'report', 'bugCreate'), ('5', 'report', 'index'), ('5', 'report', 'productSummary'), ('5', 'report', 'projectDeviation'), ('5', 'report', 'workload'), ('5', 'search', 'buildForm'), ('5', 'search', 'buildQuery'), ('5', 'search', 'deleteQuery'), ('5', 'search', 'saveQuery'), ('5', 'search', 'select'), ('5', 'story', 'activate'), ('5', 'story', 'batchChangeBranch'), ('5', 'story', 'batchChangeModule'), ('5', 'story', 'batchChangePlan'), ('5', 'story', 'batchChangeStage'), ('5', 'story', 'batchClose'), ('5', 'story', 'batchCreate'), ('5', 'story', 'batchEdit'), ('5', 'story', 'batchReview'), ('5', 'story', 'change'), ('5', 'story', 'close'), ('5', 'story', 'create'), ('5', 'story', 'delete'), ('5', 'story', 'edit'), ('5', 'story', 'export'), ('5', 'story', 'linkStory'), ('5', 'story', 'report'), ('5', 'story', 'review'), ('5', 'story', 'tasks'), ('5', 'story', 'unlinkStory'), ('5', 'story', 'view'), ('5', 'story', 'zeroCase'), ('5', 'svn', 'apiSync'), ('5', 'svn', 'cat'), ('5', 'svn', 'diff'), ('5', 'task', 'confirmStoryChange'), ('5', 'task', 'deleteEstimate'), ('5', 'task', 'editEstimate'), ('5', 'task', 'export'), ('5', 'task', 'recordEstimate'), ('5', 'task', 'report'), ('5', 'task', 'view'), ('5', 'testcase', 'browse'), ('5', 'testcase', 'createBug'), ('5', 'testcase', 'export'), ('5', 'testcase', 'groupCase'), ('5', 'testcase', 'index'), ('5', 'testcase', 'view'), ('5', 'testtask', 'browse'), ('5', 'testtask', 'cases'), ('5', 'testtask', 'groupCase'), ('5', 'testtask', 'index'), ('5', 'testtask', 'results'), ('5', 'testtask', 'view'), ('5', 'todo', 'batchCreate'), ('5', 'todo', 'batchEdit'), ('5', 'todo', 'batchFinish'), ('5', 'todo', 'create'), ('5', 'todo', 'delete'), ('5', 'todo', 'edit'), ('5', 'todo', 'export'), ('5', 'todo', 'finish'), ('5', 'todo', 'import2Today'), ('5', 'todo', 'view'), ('5', 'tree', 'browse'), ('5', 'tree', 'browseTask'), ('5', 'tree', 'delete'), ('5', 'tree', 'edit'), ('5', 'tree', 'fix'), ('5', 'tree', 'manageChild'), ('5', 'tree', 'updateOrder'), ('5', 'user', 'bug'), ('5', 'user', 'dynamic'), ('5', 'user', 'profile'), ('5', 'user', 'project'), ('5', 'user', 'story'), ('5', 'user', 'task'), ('5', 'user', 'testCase'), ('5', 'user', 'testTask'), ('5', 'user', 'todo'), ('5', 'user', 'view'), ('6', 'action', 'editComment'), ('6', 'action', 'hideAll'), ('6', 'action', 'hideOne'), ('6', 'action', 'trash'), ('6', 'action', 'undelete'), ('6', 'admin', 'index'), ('6', 'api', 'getModel'), ('6', 'bug', 'activate'), ('6', 'bug', 'assignTo'), ('6', 'bug', 'batchAssignTo'), ('6', 'bug', 'batchChangeModule'), ('6', 'bug', 'batchClose'), ('6', 'bug', 'batchConfirm'), ('6', 'bug', 'batchCreate'), ('6', 'bug', 'batchEdit'), ('6', 'bug', 'batchResolve'), ('6', 'bug', 'browse'), ('6', 'bug', 'close'), ('6', 'bug', 'confirmBug'), ('6', 'bug', 'confirmStoryChange'), ('6', 'bug', 'create'), ('6', 'bug', 'delete'), ('6', 'bug', 'deleteTemplate'), ('6', 'bug', 'edit'), ('6', 'bug', 'export'), ('6', 'bug', 'index'), ('6', 'bug', 'linkBugs'), ('6', 'bug', 'report'), ('6', 'bug', 'resolve'), ('6', 'bug', 'saveTemplate'), ('6', 'bug', 'unlinkBug'), ('6', 'bug', 'view'), ('6', 'build', 'batchUnlinkBug'), ('6', 'build', 'batchUnlinkStory'), ('6', 'build', 'create'), ('6', 'build', 'delete'), ('6', 'build', 'edit'), ('6', 'build', 'linkBug'), ('6', 'build', 'linkStory'), ('6', 'build', 'unlinkBug'), ('6', 'build', 'unlinkStory'), ('6', 'build', 'view'), ('6', 'bulletin', 'browse'), ('6', 'bulletin', 'detail'), ('6', 'company', 'browse'), ('6', 'company', 'dynamic'), ('6', 'company', 'index'), ('6', 'company', 'view'), ('6', 'doc', 'browse'), ('6', 'doc', 'create'), ('6', 'doc', 'createLib'), ('6', 'doc', 'delete'), ('6', 'doc', 'deleteLib'), ('6', 'doc', 'edit'), ('6', 'doc', 'editLib'), ('6', 'doc', 'index'), ('6', 'doc', 'view'), ('6', 'extension', 'browse'), ('6', 'extension', 'obtain'), ('6', 'extension', 'structure'), ('6', 'file', 'delete'), ('6', 'file', 'download'), ('6', 'file', 'edit'), ('6', 'file', 'uploadImages'), ('6', 'git', 'apiSync'), ('6', 'git', 'cat'), ('6', 'git', 'diff'), ('6', 'group', 'browse'), ('6', 'index', 'index'), ('6', 'misc', 'ping'), ('6', 'my', 'bug'), ('6', 'my', 'changePassword'), ('6', 'my', 'deleteContacts'), ('6', 'my', 'editProfile'), ('6', 'my', 'index'), ('6', 'my', 'manageContacts'), ('6', 'my', 'profile'), ('6', 'my', 'project'), ('6', 'my', 'story'), ('6', 'my', 'task'), ('6', 'my', 'testCase'), ('6', 'my', 'testTask'), ('6', 'my', 'todo'), ('6', 'my', 'unbind'), ('6', 'product', 'all'), ('6', 'product', 'browse'), ('6', 'product', 'doc'), ('6', 'product', 'dynamic'), ('6', 'product', 'index'), ('6', 'product', 'project'), ('6', 'product', 'roadmap'), ('6', 'product', 'view'), ('6', 'productplan', 'browse'), ('6', 'productplan', 'view'), ('6', 'project', 'activate'), ('6', 'project', 'all'), ('6', 'project', 'batchedit'), ('6', 'project', 'batchUnlinkStory'), ('6', 'project', 'browse'), ('6', 'project', 'bug'), ('6', 'project', 'build'), ('6', 'project', 'burn'), ('6', 'project', 'burnData'), ('6', 'project', 'close'), ('6', 'project', 'computeBurn'), ('6', 'project', 'create'), ('6', 'project', 'delete'), ('6', 'project', 'doc'), ('6', 'project', 'dynamic'), ('6', 'project', 'edit'), ('6', 'project', 'grouptask'), ('6', 'project', 'importBug'), ('6', 'project', 'importtask'), ('6', 'project', 'index'), ('6', 'project', 'kanban'), ('6', 'project', 'linkStory'), ('6', 'project', 'manageMembers'), ('6', 'project', 'manageProducts'), ('6', 'project', 'order'), ('6', 'project', 'putoff'), ('6', 'project', 'start'), ('6', 'project', 'story'), ('6', 'project', 'suspend'), ('6', 'project', 'task'), ('6', 'project', 'team'), ('6', 'project', 'testtask'), ('6', 'project', 'tree'), ('6', 'project', 'unlinkMember'), ('6', 'project', 'unlinkStory'), ('6', 'project', 'updateOrder'), ('6', 'project', 'view'), ('6', 'qa', 'index'), ('6', 'release', 'browse'), ('6', 'release', 'export'), ('6', 'release', 'view'), ('6', 'report', 'bugAssign'), ('6', 'report', 'bugCreate'), ('6', 'report', 'index'), ('6', 'report', 'productSummary'), ('6', 'report', 'projectDeviation'), ('6', 'report', 'workload'), ('6', 'search', 'buildForm'), ('6', 'search', 'buildQuery'), ('6', 'search', 'deleteQuery'), ('6', 'search', 'saveQuery'), ('6', 'search', 'select'), ('6', 'story', 'export'), ('6', 'story', 'report'), ('6', 'story', 'tasks'), ('6', 'story', 'view'), ('6', 'story', 'zeroCase'), ('6', 'svn', 'apiSync'), ('6', 'svn', 'cat'), ('6', 'svn', 'diff'), ('6', 'task', 'activate'), ('6', 'task', 'assignTo'), ('6', 'task', 'batchAssignTo'), ('6', 'task', 'batchChangeModule'), ('6', 'task', 'batchClose'), ('6', 'task', 'batchCreate'), ('6', 'task', 'batchEdit'), ('6', 'task', 'cancel'), ('6', 'task', 'close'), ('6', 'task', 'confirmStoryChange'), ('6', 'task', 'create'), ('6', 'task', 'delete'), ('6', 'task', 'deleteEstimate'), ('6', 'task', 'edit'), ('6', 'task', 'editEstimate'), ('6', 'task', 'export'), ('6', 'task', 'finish'), ('6', 'task', 'pause'), ('6', 'task', 'recordEstimate'), ('6', 'task', 'report'), ('6', 'task', 'restart'), ('6', 'task', 'start'), ('6', 'task', 'view'), ('6', 'testcase', 'browse'), ('6', 'testcase', 'export'), ('6', 'testcase', 'groupCase'), ('6', 'testcase', 'index'), ('6', 'testcase', 'view'), ('6', 'testtask', 'browse'), ('6', 'testtask', 'cases'), ('6', 'testtask', 'create'), ('6', 'testtask', 'edit'), ('6', 'testtask', 'groupCase'), ('6', 'testtask', 'index'), ('6', 'testtask', 'results'), ('6', 'testtask', 'view'), ('6', 'todo', 'batchCreate'), ('6', 'todo', 'batchEdit'), ('6', 'todo', 'batchFinish'), ('6', 'todo', 'create'), ('6', 'todo', 'delete'), ('6', 'todo', 'edit'), ('6', 'todo', 'export'), ('6', 'todo', 'finish'), ('6', 'todo', 'import2Today'), ('6', 'todo', 'view'), ('6', 'tree', 'browse'), ('6', 'tree', 'browseTask'), ('6', 'tree', 'delete'), ('6', 'tree', 'edit'), ('6', 'tree', 'fix'), ('6', 'tree', 'manageChild'), ('6', 'tree', 'updateOrder'), ('6', 'user', 'bug'), ('6', 'user', 'deleteContacts'), ('6', 'user', 'dynamic'), ('6', 'user', 'manageContacts'), ('6', 'user', 'profile'), ('6', 'user', 'project'), ('6', 'user', 'story'), ('6', 'user', 'task'), ('6', 'user', 'testCase'), ('6', 'user', 'testTask'), ('6', 'user', 'todo'), ('6', 'user', 'view'), ('7', 'action', 'editComment'), ('7', 'action', 'hideAll'), ('7', 'action', 'hideOne'), ('7', 'action', 'trash'), ('7', 'action', 'undelete'), ('7', 'admin', 'index'), ('7', 'api', 'getModel'), ('7', 'branch', 'delete'), ('7', 'branch', 'manage'), ('7', 'bug', 'activate'), ('7', 'bug', 'assignTo'), ('7', 'bug', 'batchChangeModule'), ('7', 'bug', 'batchClose'), ('7', 'bug', 'batchConfirm'), ('7', 'bug', 'batchCreate'), ('7', 'bug', 'batchEdit'), ('7', 'bug', 'batchResolve'), ('7', 'bug', 'browse'), ('7', 'bug', 'close'), ('7', 'bug', 'confirmBug'), ('7', 'bug', 'confirmStoryChange'), ('7', 'bug', 'create'), ('7', 'bug', 'delete'), ('7', 'bug', 'deleteTemplate'), ('7', 'bug', 'edit'), ('7', 'bug', 'export'), ('7', 'bug', 'index'), ('7', 'bug', 'linkBugs'), ('7', 'bug', 'report'), ('7', 'bug', 'resolve'), ('7', 'bug', 'saveTemplate'), ('7', 'bug', 'unlinkBug'), ('7', 'bug', 'view'), ('7', 'build', 'view'), ('7', 'bulletin', 'browse'), ('7', 'bulletin', 'detail'), ('7', 'company', 'browse'), ('7', 'company', 'dynamic'), ('7', 'company', 'index'), ('7', 'company', 'view'), ('7', 'doc', 'browse'), ('7', 'doc', 'create'), ('7', 'doc', 'createLib'), ('7', 'doc', 'delete'), ('7', 'doc', 'deleteLib'), ('7', 'doc', 'edit'), ('7', 'doc', 'editLib'), ('7', 'doc', 'index'), ('7', 'doc', 'view'), ('7', 'extension', 'browse'), ('7', 'extension', 'obtain'), ('7', 'extension', 'structure'), ('7', 'file', 'delete'), ('7', 'file', 'download'), ('7', 'file', 'edit'), ('7', 'file', 'uploadImages'), ('7', 'git', 'apiSync'), ('7', 'git', 'cat'), ('7', 'git', 'diff'), ('7', 'group', 'browse'), ('7', 'index', 'index'), ('7', 'misc', 'ping'), ('7', 'my', 'bug'), ('7', 'my', 'changePassword'), ('7', 'my', 'deleteContacts'), ('7', 'my', 'editProfile'), ('7', 'my', 'index'), ('7', 'my', 'manageContacts'), ('7', 'my', 'profile'), ('7', 'my', 'project'), ('7', 'my', 'story'), ('7', 'my', 'task'), ('7', 'my', 'testCase'), ('7', 'my', 'testTask'), ('7', 'my', 'todo'), ('7', 'my', 'unbind'), ('7', 'product', 'all'), ('7', 'product', 'batchEdit'), ('7', 'product', 'browse'), ('7', 'product', 'close'), ('7', 'product', 'create'), ('7', 'product', 'delete'), ('7', 'product', 'doc'), ('7', 'product', 'dynamic'), ('7', 'product', 'edit'), ('7', 'product', 'index'), ('7', 'product', 'order'), ('7', 'product', 'project'), ('7', 'product', 'roadmap'), ('7', 'product', 'updateOrder'), ('7', 'product', 'view'), ('7', 'productplan', 'batchUnlinkBug'), ('7', 'productplan', 'batchUnlinkStory'), ('7', 'productplan', 'browse'), ('7', 'productplan', 'create'), ('7', 'productplan', 'delete'), ('7', 'productplan', 'edit'), ('7', 'productplan', 'linkBug'), ('7', 'productplan', 'linkStory'), ('7', 'productplan', 'unlinkBug'), ('7', 'productplan', 'unlinkStory'), ('7', 'productplan', 'view'), ('7', 'project', 'all'), ('7', 'project', 'browse'), ('7', 'project', 'bug'), ('7', 'project', 'build'), ('7', 'project', 'burn'), ('7', 'project', 'burnData'), ('7', 'project', 'doc'), ('7', 'project', 'dynamic'), ('7', 'project', 'grouptask'), ('7', 'project', 'index'), ('7', 'project', 'kanban'), ('7', 'project', 'linkStory'), ('7', 'project', 'manageProducts'), ('7', 'project', 'story'), ('7', 'project', 'task'), ('7', 'project', 'team'), ('7', 'project', 'testtask'), ('7', 'project', 'tree'), ('7', 'project', 'unlinkStory'), ('7', 'project', 'view'), ('7', 'qa', 'index'), ('7', 'release', 'batchUnlinkBug'), ('7', 'release', 'batchUnlinkStory'), ('7', 'release', 'browse'), ('7', 'release', 'changeStatus'), ('7', 'release', 'create'), ('7', 'release', 'delete'), ('7', 'release', 'edit'), ('7', 'release', 'export'), ('7', 'release', 'linkBug'), ('7', 'release', 'linkStory'), ('7', 'release', 'unlinkBug'), ('7', 'release', 'unlinkStory'), ('7', 'release', 'view'), ('7', 'report', 'bugAssign'), ('7', 'report', 'bugCreate'), ('7', 'report', 'index'), ('7', 'report', 'productSummary'), ('7', 'report', 'projectDeviation'), ('7', 'report', 'workload'), ('7', 'search', 'buildForm'), ('7', 'search', 'buildQuery'), ('7', 'search', 'deleteQuery'), ('7', 'search', 'saveQuery'), ('7', 'search', 'select'), ('7', 'story', 'activate'), ('7', 'story', 'batchAssignTo'), ('7', 'story', 'batchChangeBranch'), ('7', 'story', 'batchChangeModule'), ('7', 'story', 'batchChangePlan'), ('7', 'story', 'batchChangeStage'), ('7', 'story', 'batchClose'), ('7', 'story', 'batchCreate'), ('7', 'story', 'batchEdit'), ('7', 'story', 'batchReview'), ('7', 'story', 'change'), ('7', 'story', 'close'), ('7', 'story', 'create'), ('7', 'story', 'delete'), ('7', 'story', 'edit'), ('7', 'story', 'export'), ('7', 'story', 'linkStory'), ('7', 'story', 'report'), ('7', 'story', 'review'), ('7', 'story', 'tasks'), ('7', 'story', 'unlinkStory'), ('7', 'story', 'view'), ('7', 'story', 'zeroCase'), ('7', 'svn', 'apiSync'), ('7', 'svn', 'cat'), ('7', 'svn', 'diff'), ('7', 'task', 'confirmStoryChange'), ('7', 'task', 'deleteEstimate'), ('7', 'task', 'editEstimate'), ('7', 'task', 'export'), ('7', 'task', 'recordEstimate'), ('7', 'task', 'report'), ('7', 'task', 'view'), ('7', 'testcase', 'browse'), ('7', 'testcase', 'createBug'), ('7', 'testcase', 'export'), ('7', 'testcase', 'groupCase'), ('7', 'testcase', 'index'), ('7', 'testcase', 'view'), ('7', 'testtask', 'browse'), ('7', 'testtask', 'cases'), ('7', 'testtask', 'groupCase'), ('7', 'testtask', 'index'), ('7', 'testtask', 'results'), ('7', 'testtask', 'view'), ('7', 'todo', 'batchCreate'), ('7', 'todo', 'batchEdit'), ('7', 'todo', 'batchFinish'), ('7', 'todo', 'create'), ('7', 'todo', 'delete'), ('7', 'todo', 'edit'), ('7', 'todo', 'export'), ('7', 'todo', 'finish'), ('7', 'todo', 'import2Today'), ('7', 'todo', 'view'), ('7', 'tree', 'browse'), ('7', 'tree', 'browseTask'), ('7', 'tree', 'delete'), ('7', 'tree', 'edit'), ('7', 'tree', 'fix'), ('7', 'tree', 'manageChild'), ('7', 'tree', 'updateOrder'), ('7', 'user', 'bug'), ('7', 'user', 'deleteContacts'), ('7', 'user', 'dynamic'), ('7', 'user', 'manageContacts'), ('7', 'user', 'profile'), ('7', 'user', 'project'), ('7', 'user', 'story'), ('7', 'user', 'task'), ('7', 'user', 'testCase'), ('7', 'user', 'testTask'), ('7', 'user', 'todo'), ('7', 'user', 'view'), ('8', 'action', 'editComment'), ('8', 'action', 'hideAll'), ('8', 'action', 'hideOne'), ('8', 'action', 'trash'), ('8', 'action', 'undelete'), ('8', 'admin', 'index'), ('8', 'api', 'getModel'), ('8', 'bug', 'activate'), ('8', 'bug', 'assignTo'), ('8', 'bug', 'batchAssignTo'), ('8', 'bug', 'batchChangeModule'), ('8', 'bug', 'batchClose'), ('8', 'bug', 'batchConfirm'), ('8', 'bug', 'batchCreate'), ('8', 'bug', 'batchEdit'), ('8', 'bug', 'batchResolve'), ('8', 'bug', 'browse'), ('8', 'bug', 'close'), ('8', 'bug', 'confirmBug'), ('8', 'bug', 'confirmStoryChange'), ('8', 'bug', 'create'), ('8', 'bug', 'delete'), ('8', 'bug', 'deleteTemplate'), ('8', 'bug', 'edit'), ('8', 'bug', 'export'), ('8', 'bug', 'index'), ('8', 'bug', 'linkBugs'), ('8', 'bug', 'report'), ('8', 'bug', 'resolve'), ('8', 'bug', 'saveTemplate'), ('8', 'bug', 'unlinkBug'), ('8', 'bug', 'view'), ('8', 'build', 'create'), ('8', 'build', 'delete'), ('8', 'build', 'edit'), ('8', 'build', 'view'), ('8', 'bulletin', 'browse'), ('8', 'bulletin', 'detail'), ('8', 'company', 'browse'), ('8', 'company', 'dynamic'), ('8', 'company', 'index'), ('8', 'company', 'view'), ('8', 'doc', 'browse'), ('8', 'doc', 'create'), ('8', 'doc', 'createLib'), ('8', 'doc', 'delete'), ('8', 'doc', 'deleteLib'), ('8', 'doc', 'edit'), ('8', 'doc', 'editLib'), ('8', 'doc', 'index'), ('8', 'doc', 'view'), ('8', 'extension', 'browse'), ('8', 'extension', 'obtain'), ('8', 'extension', 'structure'), ('8', 'file', 'delete'), ('8', 'file', 'download'), ('8', 'file', 'edit'), ('8', 'file', 'uploadImages'), ('8', 'git', 'apiSync'), ('8', 'git', 'cat'), ('8', 'git', 'diff'), ('8', 'group', 'browse'), ('8', 'index', 'index'), ('8', 'misc', 'ping'), ('8', 'my', 'bug'), ('8', 'my', 'changePassword'), ('8', 'my', 'deleteContacts'), ('8', 'my', 'editProfile'), ('8', 'my', 'index'), ('8', 'my', 'manageContacts'), ('8', 'my', 'profile'), ('8', 'my', 'project'), ('8', 'my', 'story'), ('8', 'my', 'task'), ('8', 'my', 'testCase'), ('8', 'my', 'testTask'), ('8', 'my', 'todo'), ('8', 'my', 'unbind'), ('8', 'product', 'all'), ('8', 'product', 'browse'), ('8', 'product', 'doc'), ('8', 'product', 'dynamic'), ('8', 'product', 'index'), ('8', 'product', 'project'), ('8', 'product', 'roadmap'), ('8', 'product', 'view'), ('8', 'productplan', 'browse'), ('8', 'productplan', 'view'), ('8', 'project', 'all'), ('8', 'project', 'bug'), ('8', 'project', 'build'), ('8', 'project', 'burn'), ('8', 'project', 'burnData'), ('8', 'project', 'doc'), ('8', 'project', 'dynamic'), ('8', 'project', 'grouptask'), ('8', 'project', 'importBug'), ('8', 'project', 'importtask'), ('8', 'project', 'index'), ('8', 'project', 'kanban'), ('8', 'project', 'story'), ('8', 'project', 'task'), ('8', 'project', 'team'), ('8', 'project', 'testtask'), ('8', 'project', 'tree'), ('8', 'project', 'view'), ('8', 'qa', 'index'), ('8', 'release', 'browse'), ('8', 'release', 'export'), ('8', 'release', 'view'), ('8', 'report', 'bugAssign'), ('8', 'report', 'bugCreate'), ('8', 'report', 'index'), ('8', 'report', 'productSummary'), ('8', 'report', 'projectDeviation'), ('8', 'report', 'workload'), ('8', 'search', 'buildForm'), ('8', 'search', 'buildQuery'), ('8', 'search', 'deleteQuery'), ('8', 'search', 'saveQuery'), ('8', 'search', 'select'), ('8', 'story', 'export'), ('8', 'story', 'report'), ('8', 'story', 'tasks'), ('8', 'story', 'view'), ('8', 'story', 'zeroCase'), ('8', 'svn', 'apiSync'), ('8', 'svn', 'cat'), ('8', 'svn', 'diff'), ('8', 'task', 'activate'), ('8', 'task', 'assignTo'), ('8', 'task', 'batchAssignTo'), ('8', 'task', 'batchChangeModule'), ('8', 'task', 'batchClose'), ('8', 'task', 'batchCreate'), ('8', 'task', 'batchEdit'), ('8', 'task', 'cancel'), ('8', 'task', 'close'), ('8', 'task', 'confirmStoryChange'), ('8', 'task', 'create'), ('8', 'task', 'delete'), ('8', 'task', 'deleteEstimate'), ('8', 'task', 'edit'), ('8', 'task', 'editEstimate'), ('8', 'task', 'export'), ('8', 'task', 'finish'), ('8', 'task', 'pause'), ('8', 'task', 'recordEstimate'), ('8', 'task', 'report'), ('8', 'task', 'restart'), ('8', 'task', 'start'), ('8', 'task', 'view'), ('8', 'testcase', 'batchChangeModule'), ('8', 'testcase', 'batchCreate'), ('8', 'testcase', 'batchDelete'), ('8', 'testcase', 'batchEdit'), ('8', 'testcase', 'browse'), ('8', 'testcase', 'confirmChange'), ('8', 'testcase', 'confirmStoryChange'), ('8', 'testcase', 'create'), ('8', 'testcase', 'createBug'), ('8', 'testcase', 'delete'), ('8', 'testcase', 'edit'), ('8', 'testcase', 'export'), ('8', 'testcase', 'exportTemplet'), ('8', 'testcase', 'groupCase'), ('8', 'testcase', 'import'), ('8', 'testcase', 'index'), ('8', 'testcase', 'linkCases'), ('8', 'testcase', 'showImport'), ('8', 'testcase', 'unlinkCase'), ('8', 'testcase', 'view'), ('8', 'testtask', 'batchAssign'), ('8', 'testtask', 'batchRun'), ('8', 'testtask', 'browse'), ('8', 'testtask', 'cases'), ('8', 'testtask', 'close'), ('8', 'testtask', 'create'), ('8', 'testtask', 'delete'), ('8', 'testtask', 'edit'), ('8', 'testtask', 'groupCase'), ('8', 'testtask', 'index'), ('8', 'testtask', 'linkcase'), ('8', 'testtask', 'results'), ('8', 'testtask', 'runcase'), ('8', 'testtask', 'start'), ('8', 'testtask', 'unlinkcase'), ('8', 'testtask', 'view'), ('8', 'todo', 'batchCreate'), ('8', 'todo', 'batchEdit'), ('8', 'todo', 'batchFinish'), ('8', 'todo', 'create'), ('8', 'todo', 'delete'), ('8', 'todo', 'edit'), ('8', 'todo', 'export'), ('8', 'todo', 'finish'), ('8', 'todo', 'import2Today'), ('8', 'todo', 'view'), ('8', 'tree', 'browse'), ('8', 'tree', 'browseTask'), ('8', 'tree', 'delete'), ('8', 'tree', 'edit'), ('8', 'tree', 'fix'), ('8', 'tree', 'manageChild'), ('8', 'tree', 'updateOrder'), ('8', 'user', 'bug'), ('8', 'user', 'deleteContacts'), ('8', 'user', 'dynamic'), ('8', 'user', 'manageContacts'), ('8', 'user', 'profile'), ('8', 'user', 'project'), ('8', 'user', 'story'), ('8', 'user', 'task'), ('8', 'user', 'testCase'), ('8', 'user', 'testTask'), ('8', 'user', 'todo'), ('8', 'user', 'view'), ('9', 'action', 'editComment'), ('9', 'action', 'hideAll'), ('9', 'action', 'hideOne'), ('9', 'action', 'trash'), ('9', 'action', 'undelete'), ('9', 'admin', 'index'), ('9', 'api', 'getModel'), ('9', 'bug', 'browse'), ('9', 'bug', 'export'), ('9', 'bug', 'index'), ('9', 'bug', 'report'), ('9', 'bug', 'view'), ('9', 'build', 'view'), ('9', 'bulletin', 'browse'), ('9', 'bulletin', 'detail'), ('9', 'company', 'browse'), ('9', 'company', 'dynamic'), ('9', 'company', 'edit'), ('9', 'company', 'index'), ('9', 'company', 'view'), ('9', 'dept', 'browse'), ('9', 'dept', 'delete'), ('9', 'dept', 'manageChild'), ('9', 'dept', 'updateOrder'), ('9', 'doc', 'browse'), ('9', 'doc', 'create'), ('9', 'doc', 'createLib'), ('9', 'doc', 'delete'), ('9', 'doc', 'deleteLib'), ('9', 'doc', 'edit'), ('9', 'doc', 'editLib'), ('9', 'doc', 'index'), ('9', 'doc', 'view'), ('9', 'extension', 'browse'), ('9', 'extension', 'obtain'), ('9', 'extension', 'structure'), ('9', 'file', 'delete'), ('9', 'file', 'download'), ('9', 'file', 'edit'), ('9', 'file', 'uploadImages'), ('9', 'git', 'apiSync'), ('9', 'git', 'cat'), ('9', 'git', 'diff'), ('9', 'group', 'browse'), ('9', 'index', 'index'), ('9', 'misc', 'ping'), ('9', 'my', 'bug'), ('9', 'my', 'changePassword'), ('9', 'my', 'deleteContacts'), ('9', 'my', 'editProfile'), ('9', 'my', 'index'), ('9', 'my', 'manageContacts'), ('9', 'my', 'profile'), ('9', 'my', 'project'), ('9', 'my', 'story'), ('9', 'my', 'task'), ('9', 'my', 'testCase'), ('9', 'my', 'testTask'), ('9', 'my', 'todo'), ('9', 'my', 'unbind'), ('9', 'product', 'all'), ('9', 'product', 'browse'), ('9', 'product', 'doc'), ('9', 'product', 'dynamic'), ('9', 'product', 'index'), ('9', 'product', 'project'), ('9', 'product', 'roadmap'), ('9', 'product', 'view'), ('9', 'productplan', 'browse'), ('9', 'productplan', 'view'), ('9', 'project', 'all'), ('9', 'project', 'browse'), ('9', 'project', 'bug'), ('9', 'project', 'build'), ('9', 'project', 'burn'), ('9', 'project', 'burnData'), ('9', 'project', 'computeBurn'), ('9', 'project', 'doc'), ('9', 'project', 'dynamic'), ('9', 'project', 'grouptask'), ('9', 'project', 'index'), ('9', 'project', 'kanban'), ('9', 'project', 'story'), ('9', 'project', 'task'), ('9', 'project', 'team'), ('9', 'project', 'tree'), ('9', 'project', 'view'), ('9', 'qa', 'index'), ('9', 'release', 'browse'), ('9', 'release', 'export'), ('9', 'release', 'view'), ('9', 'report', 'bugAssign'), ('9', 'report', 'bugCreate'), ('9', 'report', 'index'), ('9', 'report', 'productSummary'), ('9', 'report', 'projectDeviation'), ('9', 'report', 'workload'), ('9', 'search', 'buildForm'), ('9', 'search', 'buildQuery'), ('9', 'search', 'deleteQuery'), ('9', 'search', 'saveQuery'), ('9', 'search', 'select'), ('9', 'story', 'export'), ('9', 'story', 'report'), ('9', 'story', 'review'), ('9', 'story', 'tasks'), ('9', 'story', 'view'), ('9', 'story', 'zeroCase'), ('9', 'svn', 'apiSync'), ('9', 'svn', 'cat'), ('9', 'svn', 'diff'), ('9', 'task', 'deleteEstimate'), ('9', 'task', 'editEstimate'), ('9', 'task', 'export'), ('9', 'task', 'recordEstimate'), ('9', 'task', 'report'), ('9', 'task', 'view'), ('9', 'testcase', 'browse'), ('9', 'testcase', 'export'), ('9', 'testcase', 'groupCase'), ('9', 'testcase', 'index'), ('9', 'testcase', 'view'), ('9', 'testtask', 'browse'), ('9', 'testtask', 'cases'), ('9', 'testtask', 'groupCase'), ('9', 'testtask', 'index'), ('9', 'testtask', 'results'), ('9', 'testtask', 'view'), ('9', 'todo', 'batchCreate'), ('9', 'todo', 'batchEdit'), ('9', 'todo', 'batchFinish'), ('9', 'todo', 'create'), ('9', 'todo', 'delete'), ('9', 'todo', 'edit'), ('9', 'todo', 'export'), ('9', 'todo', 'finish'), ('9', 'todo', 'import2Today'), ('9', 'todo', 'view'), ('9', 'user', 'batchCreate'), ('9', 'user', 'batchEdit'), ('9', 'user', 'bug'), ('9', 'user', 'create'), ('9', 'user', 'delete'), ('9', 'user', 'deleteContacts'), ('9', 'user', 'dynamic'), ('9', 'user', 'edit'), ('9', 'user', 'manageContacts'), ('9', 'user', 'profile'), ('9', 'user', 'project'), ('9', 'user', 'story'), ('9', 'user', 'task'), ('9', 'user', 'testCase'), ('9', 'user', 'testTask'), ('9', 'user', 'todo'), ('9', 'user', 'unbind'), ('9', 'user', 'unlock'), ('9', 'user', 'view'), ('10', 'action', 'editComment'), ('10', 'api', 'getModel'), ('10', 'bug', 'activate'), ('10', 'bug', 'batchChangeModule'), ('10', 'bug', 'browse'), ('10', 'bug', 'close'), ('10', 'bug', 'create'), ('10', 'bug', 'edit'), ('10', 'bug', 'index'), ('10', 'bug', 'linkBugs'), ('10', 'bug', 'report'), ('10', 'bug', 'unlinkBug'), ('10', 'bug', 'view'), ('10', 'build', 'view'), ('10', 'bulletin', 'browse'), ('10', 'bulletin', 'detail'), ('10', 'company', 'browse'), ('10', 'company', 'dynamic'), ('10', 'company', 'index'), ('10', 'company', 'view'), ('10', 'doc', 'browse'), ('10', 'doc', 'index'), ('10', 'doc', 'view'), ('10', 'file', 'download'), ('10', 'index', 'index'), ('10', 'misc', 'ping'), ('10', 'my', 'changePassword'), ('10', 'my', 'editProfile'), ('10', 'my', 'index'), ('10', 'my', 'profile'), ('10', 'my', 'task'), ('10', 'my', 'todo'), ('10', 'my', 'unbind'), ('10', 'product', 'all'), ('10', 'product', 'browse'), ('10', 'product', 'doc'), ('10', 'product', 'dynamic'), ('10', 'product', 'index'), ('10', 'product', 'roadmap'), ('10', 'product', 'view'), ('10', 'productplan', 'browse'), ('10', 'productplan', 'view'), ('10', 'project', 'all'), ('10', 'project', 'browse'), ('10', 'project', 'bug'), ('10', 'project', 'build'), ('10', 'project', 'burn'), ('10', 'project', 'doc'), ('10', 'project', 'dynamic'), ('10', 'project', 'grouptask'), ('10', 'project', 'index'), ('10', 'project', 'kanban'), ('10', 'project', 'story'), ('10', 'project', 'task'), ('10', 'project', 'team'), ('10', 'project', 'testtask'), ('10', 'project', 'tree'), ('10', 'project', 'view'), ('10', 'qa', 'index'), ('10', 'release', 'browse'), ('10', 'release', 'view'), ('10', 'report', 'bugAssign'), ('10', 'report', 'bugCreate'), ('10', 'report', 'index'), ('10', 'report', 'productSummary'), ('10', 'report', 'projectDeviation'), ('10', 'report', 'workload'), ('10', 'search', 'buildForm'), ('10', 'search', 'buildQuery'), ('10', 'search', 'deleteQuery'), ('10', 'search', 'saveQuery'), ('10', 'story', 'tasks'), ('10', 'story', 'view'), ('10', 'task', 'deleteEstimate'), ('10', 'task', 'editEstimate'), ('10', 'task', 'recordEstimate'), ('10', 'task', 'view'), ('10', 'todo', 'batchCreate'), ('10', 'todo', 'batchEdit'), ('10', 'todo', 'batchFinish'), ('10', 'todo', 'create'), ('10', 'todo', 'delete'), ('10', 'todo', 'edit'), ('10', 'todo', 'export'), ('10', 'todo', 'finish'), ('10', 'todo', 'import2Today'), ('10', 'todo', 'view'), ('10', 'user', 'bug'), ('10', 'user', 'dynamic'), ('10', 'user', 'profile'), ('10', 'user', 'project'), ('10', 'user', 'story'), ('10', 'user', 'task'), ('10', 'user', 'testCase'), ('10', 'user', 'testTask'), ('10', 'user', 'todo'), ('10', 'user', 'view'), ('11', 'bug', 'activate'), ('11', 'bug', 'assignTo'), ('11', 'bug', 'batchChangeModule'), ('11', 'bug', 'browse'), ('11', 'bug', 'close'), ('11', 'bug', 'confirmStoryChange'), ('11', 'bug', 'create'), ('11', 'bug', 'edit'), ('11', 'bug', 'index'), ('11', 'bug', 'linkBugs'), ('11', 'bug', 'report'), ('11', 'bug', 'unlinkBug'), ('11', 'bug', 'view'), ('11', 'build', 'view'), ('11', 'bulletin', 'browse'), ('11', 'bulletin', 'detail'), ('11', 'file', 'download'), ('11', 'git', 'cat'), ('11', 'git', 'diff'), ('11', 'index', 'index'), ('11', 'misc', 'ping'), ('11', 'my', 'bug'), ('11', 'my', 'changePassword'), ('11', 'my', 'editProfile'), ('11', 'my', 'index'), ('11', 'my', 'profile'), ('11', 'my', 'project'), ('11', 'my', 'story'), ('11', 'my', 'task'), ('11', 'my', 'testCase'), ('11', 'my', 'testTask'), ('11', 'my', 'todo'), ('11', 'my', 'unbind'), ('11', 'product', 'all'), ('11', 'product', 'browse'), ('11', 'product', 'doc'), ('11', 'product', 'dynamic'), ('11', 'product', 'index'), ('11', 'product', 'roadmap'), ('11', 'product', 'view'), ('11', 'productplan', 'browse'), ('11', 'productplan', 'view'), ('11', 'project', 'all'), ('11', 'project', 'browse'), ('11', 'project', 'bug'), ('11', 'project', 'burn'), ('11', 'project', 'doc'), ('11', 'project', 'dynamic'), ('11', 'project', 'index'), ('11', 'project', 'kanban'), ('11', 'project', 'story'), ('11', 'project', 'task'), ('11', 'project', 'testtask'), ('11', 'project', 'tree'), ('11', 'project', 'view'), ('11', 'qa', 'index'), ('11', 'search', 'buildForm'), ('11', 'search', 'buildQuery'), ('11', 'story', 'batchChangeModule'), ('11', 'story', 'change'), ('11', 'story', 'create'), ('11', 'story', 'edit'), ('11', 'story', 'linkStory'), ('11', 'story', 'unlinkStory'), ('11', 'story', 'view'), ('11', 'svn', 'cat'), ('11', 'svn', 'diff'), ('11', 'task', 'recordEstimate'), ('11', 'task', 'view'), ('11', 'testcase', 'browse'), ('11', 'testcase', 'groupCase'), ('11', 'testcase', 'index'), ('11', 'testcase', 'view'), ('11', 'testtask', 'browse'), ('11', 'testtask', 'cases'), ('11', 'testtask', 'groupCase'), ('11', 'testtask', 'index'), ('11', 'testtask', 'results'), ('11', 'testtask', 'view'), ('11', 'todo', 'batchCreate'), ('11', 'todo', 'create'), ('11', 'todo', 'delete'), ('11', 'todo', 'edit'), ('11', 'todo', 'export'), ('11', 'todo', 'finish'), ('11', 'todo', 'view'), ('12', 'bug', 'activate'), ('12', 'bug', 'assignTo'), ('12', 'bug', 'batchAssignTo'), ('12', 'bug', 'batchChangeModule'), ('12', 'bug', 'batchClose'), ('12', 'bug', 'batchConfirm'), ('12', 'bug', 'batchCreate'), ('12', 'bug', 'batchEdit'), ('12', 'bug', 'batchResolve'), ('12', 'bug', 'browse'), ('12', 'bug', 'close'), ('12', 'bug', 'confirmBug'), ('12', 'bug', 'confirmStoryChange'), ('12', 'bug', 'create'), ('12', 'bug', 'delete'), ('12', 'bug', 'deleteTemplate'), ('12', 'bug', 'edit'), ('12', 'bug', 'export'), ('12', 'bug', 'index'), ('12', 'bug', 'linkBugs'), ('12', 'bug', 'report'), ('12', 'bug', 'resolve'), ('12', 'bug', 'saveTemplate'), ('12', 'bug', 'unlinkBug'), ('12', 'bug', 'view'), ('12', 'build', 'view'), ('12', 'bulletin', 'browse'), ('12', 'bulletin', 'detail'), ('12', 'doc', 'browse'), ('12', 'doc', 'create'), ('12', 'doc', 'delete'), ('12', 'doc', 'edit'), ('12', 'doc', 'index'), ('12', 'doc', 'view'), ('12', 'file', 'download'), ('12', 'git', 'cat'), ('12', 'git', 'diff'), ('12', 'index', 'index'), ('12', 'manual', 'browse'), ('12', 'manual', 'index'), ('12', 'manual', 'view'), ('12', 'my', 'bug'), ('12', 'my', 'editProfile'), ('12', 'my', 'index'), ('12', 'my', 'profile'), ('12', 'my', 'project'), ('12', 'my', 'story'), ('12', 'my', 'task'), ('12', 'my', 'testCase'), ('12', 'my', 'testTask'), ('12', 'my', 'todo'), ('12', 'my', 'unbind'), ('12', 'product', 'all'), ('12', 'product', 'browse'), ('12', 'product', 'doc'), ('12', 'product', 'dynamic'), ('12', 'product', 'index'), ('12', 'product', 'project'), ('12', 'product', 'roadmap'), ('12', 'product', 'updateOrder'), ('12', 'product', 'view'), ('12', 'productplan', 'browse'), ('12', 'productplan', 'view'), ('12', 'project', 'all'), ('12', 'project', 'browse'), ('12', 'project', 'bug'), ('12', 'project', 'build'), ('12', 'project', 'burn'), ('12', 'project', 'burnData'), ('12', 'project', 'doc'), ('12', 'project', 'dynamic'), ('12', 'project', 'grouptask'), ('12', 'project', 'importBug'), ('12', 'project', 'importtask'), ('12', 'project', 'index'), ('12', 'project', 'kanban'), ('12', 'project', 'linkStory'), ('12', 'project', 'story'), ('12', 'project', 'task'), ('12', 'project', 'team'), ('12', 'project', 'testtask'), ('12', 'project', 'tree'), ('12', 'project', 'unlinkStory'), ('12', 'project', 'updateOrder'), ('12', 'project', 'view'), ('12', 'qa', 'index'), ('12', 'release', 'browse'), ('12', 'release', 'view'), ('12', 'search', 'buildForm'), ('12', 'search', 'buildQuery'), ('12', 'search', 'deleteQuery'), ('12', 'search', 'saveQuery'), ('12', 'search', 'select'), ('12', 'story', 'activate'), ('12', 'story', 'batchAssignTo'), ('12', 'story', 'batchChangeBranch'), ('12', 'story', 'batchChangeModule'), ('12', 'story', 'batchChangePlan'), ('12', 'story', 'batchChangeStage'), ('12', 'story', 'batchClose'), ('12', 'story', 'batchCreate'), ('12', 'story', 'batchEdit'), ('12', 'story', 'batchReview'), ('12', 'story', 'change'), ('12', 'story', 'close'), ('12', 'story', 'create'), ('12', 'story', 'delete'), ('12', 'story', 'edit'), ('12', 'story', 'export'), ('12', 'story', 'linkStory'), ('12', 'story', 'report'), ('12', 'story', 'review'), ('12', 'story', 'tasks'), ('12', 'story', 'unlinkStory'), ('12', 'story', 'view'), ('12', 'story', 'zeroCase'), ('12', 'task', 'activate'), ('12', 'task', 'assignTo'), ('12', 'task', 'batchAssignTo'), ('12', 'task', 'batchChangeModule'), ('12', 'task', 'batchClose'), ('12', 'task', 'batchCreate'), ('12', 'task', 'batchEdit'), ('12', 'task', 'cancel'), ('12', 'task', 'close'), ('12', 'task', 'confirmStoryChange'), ('12', 'task', 'create'), ('12', 'task', 'delete'), ('12', 'task', 'deleteEstimate'), ('12', 'task', 'edit'), ('12', 'task', 'editEstimate'), ('12', 'task', 'export'), ('12', 'task', 'finish'), ('12', 'task', 'pause'), ('12', 'task', 'recordEstimate'), ('12', 'task', 'report'), ('12', 'task', 'restart'), ('12', 'task', 'start'), ('12', 'task', 'view'), ('12', 'testcase', 'batchChangeModule'), ('12', 'testcase', 'batchCreate'), ('12', 'testcase', 'batchDelete'), ('12', 'testcase', 'batchEdit'), ('12', 'testcase', 'browse'), ('12', 'testcase', 'confirmChange'), ('12', 'testcase', 'confirmStoryChange'), ('12', 'testcase', 'create'), ('12', 'testcase', 'createBug'), ('12', 'testcase', 'delete'), ('12', 'testcase', 'edit'), ('12', 'testcase', 'export'), ('12', 'testcase', 'exportTemplet'), ('12', 'testcase', 'groupCase'), ('12', 'testcase', 'import'), ('12', 'testcase', 'index'), ('12', 'testcase', 'linkCases'), ('12', 'testcase', 'showImport'), ('12', 'testcase', 'unlinkCase'), ('12', 'testcase', 'view'), ('12', 'testtask', 'batchAssign'), ('12', 'testtask', 'batchRun'), ('12', 'testtask', 'browse'), ('12', 'testtask', 'cases'), ('12', 'testtask', 'close'), ('12', 'testtask', 'create'), ('12', 'testtask', 'delete'), ('12', 'testtask', 'edit'), ('12', 'testtask', 'groupCase'), ('12', 'testtask', 'index'), ('12', 'testtask', 'linkcase'), ('12', 'testtask', 'results'), ('12', 'testtask', 'runcase'), ('12', 'testtask', 'start'), ('12', 'testtask', 'unlinkcase');
INSERT INTO `zt_grouppriv` VALUES ('12', 'testtask', 'view'), ('12', 'todo', 'batchCreate'), ('12', 'todo', 'batchEdit'), ('12', 'todo', 'batchFinish'), ('12', 'todo', 'create'), ('12', 'todo', 'delete'), ('12', 'todo', 'edit'), ('12', 'todo', 'export'), ('12', 'todo', 'finish'), ('12', 'todo', 'import2Today'), ('12', 'todo', 'view'), ('13', 'bulletin', 'browse'), ('13', 'bulletin', 'detail'), ('14', 'bug', 'activate'), ('14', 'bug', 'assignTo'), ('14', 'bug', 'batchAssignTo'), ('14', 'bug', 'batchChangeModule'), ('14', 'bug', 'batchClose'), ('14', 'bug', 'batchConfirm'), ('14', 'bug', 'batchCreate'), ('14', 'bug', 'batchEdit'), ('14', 'bug', 'batchResolve'), ('14', 'bug', 'browse'), ('14', 'bug', 'close'), ('14', 'bug', 'confirmBug'), ('14', 'bug', 'confirmStoryChange'), ('14', 'bug', 'create'), ('14', 'bug', 'delete'), ('14', 'bug', 'deleteTemplate'), ('14', 'bug', 'edit'), ('14', 'bug', 'export'), ('14', 'bug', 'index'), ('14', 'bug', 'linkBugs'), ('14', 'bug', 'report'), ('14', 'bug', 'resolve'), ('14', 'bug', 'saveTemplate'), ('14', 'bug', 'unlinkBug'), ('14', 'bug', 'view'), ('14', 'build', 'batchUnlinkBug'), ('14', 'build', 'batchUnlinkStory'), ('14', 'build', 'create'), ('14', 'build', 'delete'), ('14', 'build', 'edit'), ('14', 'build', 'linkBug'), ('14', 'build', 'linkStory'), ('14', 'build', 'unlinkBug'), ('14', 'build', 'unlinkStory'), ('14', 'build', 'view'), ('14', 'bulletin', 'browse'), ('14', 'bulletin', 'detail'), ('14', 'doc', 'browse'), ('14', 'doc', 'create'), ('14', 'doc', 'createLib'), ('14', 'doc', 'delete'), ('14', 'doc', 'deleteLib'), ('14', 'doc', 'edit'), ('14', 'doc', 'editLib'), ('14', 'doc', 'index'), ('14', 'doc', 'view'), ('14', 'file', 'download'), ('14', 'git', 'cat'), ('14', 'git', 'diff'), ('14', 'index', 'index'), ('14', 'my', 'bug'), ('14', 'my', 'editProfile'), ('14', 'my', 'index'), ('14', 'my', 'profile'), ('14', 'my', 'project'), ('14', 'my', 'story'), ('14', 'my', 'task'), ('14', 'my', 'testCase'), ('14', 'my', 'testTask'), ('14', 'my', 'todo'), ('14', 'my', 'unbind'), ('14', 'product', 'all'), ('14', 'product', 'browse'), ('14', 'product', 'close'), ('14', 'product', 'doc'), ('14', 'product', 'dynamic'), ('14', 'product', 'index'), ('14', 'product', 'project'), ('14', 'product', 'roadmap'), ('14', 'product', 'updateOrder'), ('14', 'product', 'view'), ('14', 'productplan', 'batchEdit'), ('14', 'productplan', 'batchUnlinkBug'), ('14', 'productplan', 'batchUnlinkStory'), ('14', 'productplan', 'browse'), ('14', 'productplan', 'create'), ('14', 'productplan', 'delete'), ('14', 'productplan', 'edit'), ('14', 'productplan', 'linkBug'), ('14', 'productplan', 'linkStory'), ('14', 'productplan', 'unlinkBug'), ('14', 'productplan', 'unlinkStory'), ('14', 'productplan', 'view'), ('14', 'project', 'activate'), ('14', 'project', 'all'), ('14', 'project', 'batchUnlinkStory'), ('14', 'project', 'browse'), ('14', 'project', 'bug'), ('14', 'project', 'build'), ('14', 'project', 'burn'), ('14', 'project', 'burnData'), ('14', 'project', 'close'), ('14', 'project', 'computeBurn'), ('14', 'project', 'doc'), ('14', 'project', 'dynamic'), ('14', 'project', 'fixFirst'), ('14', 'project', 'grouptask'), ('14', 'project', 'importBug'), ('14', 'project', 'importtask'), ('14', 'project', 'index'), ('14', 'project', 'kanban'), ('14', 'project', 'linkStory'), ('14', 'project', 'manageMembers'), ('14', 'project', 'putoff'), ('14', 'project', 'start'), ('14', 'project', 'story'), ('14', 'project', 'suspend'), ('14', 'project', 'task'), ('14', 'project', 'team'), ('14', 'project', 'testtask'), ('14', 'project', 'tree'), ('14', 'project', 'unlinkMember'), ('14', 'project', 'unlinkStory'), ('14', 'project', 'updateOrder'), ('14', 'project', 'view'), ('14', 'qa', 'index'), ('14', 'release', 'batchUnlinkBug'), ('14', 'release', 'batchUnlinkStory'), ('14', 'release', 'browse'), ('14', 'release', 'changeStatus'), ('14', 'release', 'create'), ('14', 'release', 'delete'), ('14', 'release', 'edit'), ('14', 'release', 'export'), ('14', 'release', 'linkBug'), ('14', 'release', 'linkStory'), ('14', 'release', 'unlinkBug'), ('14', 'release', 'unlinkStory'), ('14', 'release', 'view'), ('14', 'report', 'bugAssign'), ('14', 'report', 'bugCreate'), ('14', 'report', 'index'), ('14', 'report', 'productSummary'), ('14', 'report', 'projectDeviation'), ('14', 'report', 'workload'), ('14', 'search', 'buildForm'), ('14', 'search', 'buildQuery'), ('14', 'search', 'saveQuery'), ('14', 'search', 'select'), ('14', 'story', 'activate'), ('14', 'story', 'batchAssignTo'), ('14', 'story', 'batchChangeBranch'), ('14', 'story', 'batchChangeModule'), ('14', 'story', 'batchChangePlan'), ('14', 'story', 'batchChangeStage'), ('14', 'story', 'batchClose'), ('14', 'story', 'batchCreate'), ('14', 'story', 'batchEdit'), ('14', 'story', 'batchReview'), ('14', 'story', 'change'), ('14', 'story', 'close'), ('14', 'story', 'create'), ('14', 'story', 'delete'), ('14', 'story', 'edit'), ('14', 'story', 'export'), ('14', 'story', 'linkStory'), ('14', 'story', 'report'), ('14', 'story', 'review'), ('14', 'story', 'tasks'), ('14', 'story', 'unlinkStory'), ('14', 'story', 'view'), ('14', 'story', 'zeroCase'), ('14', 'task', 'activate'), ('14', 'task', 'assignTo'), ('14', 'task', 'batchAssignTo'), ('14', 'task', 'batchChangeModule'), ('14', 'task', 'batchClose'), ('14', 'task', 'batchCreate'), ('14', 'task', 'batchEdit'), ('14', 'task', 'cancel'), ('14', 'task', 'close'), ('14', 'task', 'confirmStoryChange'), ('14', 'task', 'create'), ('14', 'task', 'delete'), ('14', 'task', 'deleteEstimate'), ('14', 'task', 'edit'), ('14', 'task', 'editEstimate'), ('14', 'task', 'export'), ('14', 'task', 'finish'), ('14', 'task', 'pause'), ('14', 'task', 'recordEstimate'), ('14', 'task', 'report'), ('14', 'task', 'restart'), ('14', 'task', 'start'), ('14', 'task', 'view'), ('14', 'testcase', 'batchChangeModule'), ('14', 'testcase', 'batchCreate'), ('14', 'testcase', 'batchDelete'), ('14', 'testcase', 'batchEdit'), ('14', 'testcase', 'browse'), ('14', 'testcase', 'confirmChange'), ('14', 'testcase', 'confirmStoryChange'), ('14', 'testcase', 'create'), ('14', 'testcase', 'createBug'), ('14', 'testcase', 'delete'), ('14', 'testcase', 'edit'), ('14', 'testcase', 'export'), ('14', 'testcase', 'exportTemplet'), ('14', 'testcase', 'groupCase'), ('14', 'testcase', 'import'), ('14', 'testcase', 'index'), ('14', 'testcase', 'linkCases'), ('14', 'testcase', 'showImport'), ('14', 'testcase', 'unlinkCase'), ('14', 'testcase', 'view'), ('14', 'testtask', 'batchAssign'), ('14', 'testtask', 'batchRun'), ('14', 'testtask', 'browse'), ('14', 'testtask', 'cases'), ('14', 'testtask', 'close'), ('14', 'testtask', 'create'), ('14', 'testtask', 'delete'), ('14', 'testtask', 'edit'), ('14', 'testtask', 'groupCase'), ('14', 'testtask', 'index'), ('14', 'testtask', 'linkcase'), ('14', 'testtask', 'results'), ('14', 'testtask', 'runcase'), ('14', 'testtask', 'start'), ('14', 'testtask', 'unlinkcase'), ('14', 'testtask', 'view'), ('14', 'todo', 'batchCreate'), ('14', 'todo', 'batchEdit'), ('14', 'todo', 'batchFinish'), ('14', 'todo', 'create'), ('14', 'todo', 'delete'), ('14', 'todo', 'edit'), ('14', 'todo', 'export'), ('14', 'todo', 'finish'), ('14', 'todo', 'import2Today'), ('14', 'todo', 'view'), ('14', 'tree', 'browse'), ('14', 'tree', 'browseTask'), ('14', 'tree', 'delete'), ('14', 'tree', 'edit'), ('14', 'tree', 'fix'), ('14', 'tree', 'manageChild'), ('14', 'tree', 'updateOrder'), ('15', 'bug', 'activate'), ('15', 'bug', 'assignTo'), ('15', 'bug', 'batchChangeModule'), ('15', 'bug', 'browse'), ('15', 'bug', 'close'), ('15', 'bug', 'confirmBug'), ('15', 'bug', 'confirmStoryChange'), ('15', 'bug', 'create'), ('15', 'bug', 'edit'), ('15', 'bug', 'index'), ('15', 'bug', 'linkBugs'), ('15', 'bug', 'report'), ('15', 'bug', 'unlinkBug'), ('15', 'bug', 'view'), ('15', 'build', 'view'), ('15', 'bulletin', 'browse'), ('15', 'bulletin', 'detail'), ('15', 'doc', 'browse'), ('15', 'doc', 'create'), ('15', 'doc', 'index'), ('15', 'doc', 'view'), ('15', 'file', 'download'), ('15', 'git', 'cat'), ('15', 'git', 'diff'), ('15', 'index', 'index'), ('15', 'manual', 'browse'), ('15', 'manual', 'index'), ('15', 'manual', 'view'), ('15', 'misc', 'ping'), ('15', 'my', 'bug'), ('15', 'my', 'changePassword'), ('15', 'my', 'editProfile'), ('15', 'my', 'index'), ('15', 'my', 'profile'), ('15', 'my', 'project'), ('15', 'my', 'story'), ('15', 'my', 'task'), ('15', 'my', 'testCase'), ('15', 'my', 'testTask'), ('15', 'my', 'todo'), ('15', 'my', 'unbind'), ('15', 'project', 'all'), ('15', 'project', 'browse'), ('15', 'project', 'bug'), ('15', 'project', 'burn'), ('15', 'project', 'doc'), ('15', 'project', 'index'), ('15', 'project', 'kanban'), ('15', 'project', 'story'), ('15', 'project', 'task'), ('15', 'project', 'team'), ('15', 'project', 'tree'), ('15', 'project', 'view'), ('15', 'qa', 'index'), ('15', 'search', 'buildForm'), ('15', 'search', 'buildQuery'), ('15', 'story', 'batchChangeModule'), ('15', 'story', 'change'), ('15', 'story', 'create'), ('15', 'story', 'edit'), ('15', 'story', 'linkStory'), ('15', 'story', 'unlinkStory'), ('15', 'story', 'view'), ('15', 'svn', 'cat'), ('15', 'svn', 'diff'), ('15', 'task', 'recordEstimate'), ('15', 'task', 'view'), ('15', 'testcase', 'batchChangeModule'), ('15', 'testcase', 'browse'), ('15', 'testcase', 'confirmChange'), ('15', 'testcase', 'confirmStoryChange'), ('15', 'testcase', 'createBug'), ('15', 'testcase', 'edit'), ('15', 'testcase', 'groupCase'), ('15', 'testcase', 'index'), ('15', 'testcase', 'linkCases'), ('15', 'testcase', 'unlinkCase'), ('15', 'testcase', 'view'), ('15', 'testtask', 'browse'), ('15', 'testtask', 'cases'), ('15', 'testtask', 'groupCase'), ('15', 'testtask', 'index'), ('15', 'testtask', 'linkcase'), ('15', 'testtask', 'results'), ('15', 'testtask', 'runcase'), ('15', 'testtask', 'start'), ('15', 'testtask', 'view'), ('15', 'todo', 'create'), ('15', 'todo', 'delete'), ('15', 'todo', 'edit'), ('15', 'todo', 'finish'), ('15', 'todo', 'view'), ('16', 'bug', 'activate'), ('16', 'bug', 'assignTo'), ('16', 'bug', 'batchAssignTo'), ('16', 'bug', 'batchChangeModule'), ('16', 'bug', 'batchClose'), ('16', 'bug', 'batchConfirm'), ('16', 'bug', 'batchCreate'), ('16', 'bug', 'batchEdit'), ('16', 'bug', 'batchResolve'), ('16', 'bug', 'browse'), ('16', 'bug', 'close'), ('16', 'bug', 'confirmBug'), ('16', 'bug', 'confirmStoryChange'), ('16', 'bug', 'create'), ('16', 'bug', 'delete'), ('16', 'bug', 'deleteTemplate'), ('16', 'bug', 'edit'), ('16', 'bug', 'export'), ('16', 'bug', 'index'), ('16', 'bug', 'linkBugs'), ('16', 'bug', 'report'), ('16', 'bug', 'resolve'), ('16', 'bug', 'saveTemplate'), ('16', 'bug', 'setPublic'), ('16', 'bug', 'unlinkBug'), ('16', 'bug', 'view'), ('16', 'bulletin', 'browse'), ('16', 'bulletin', 'detail'), ('16', 'hdc', 'activate'), ('16', 'hdc', 'batchActivate'), ('16', 'hdc', 'browse'), ('16', 'hdc', 'delete'), ('16', 'hdc', 'edit'), ('16', 'hdc', 'exportReport'), ('16', 'hdc', 'hdcstatic'), ('16', 'hdc', 'hdcsummary'), ('16', 'hdc', 'import'), ('16', 'hdc', 'showImport'), ('16', 'hdc', 'updatedate'), ('16', 'index', 'index'), ('16', 'my', 'bug'), ('16', 'my', 'editProfile'), ('16', 'my', 'index'), ('16', 'my', 'manageContacts'), ('16', 'my', 'profile'), ('16', 'my', 'project'), ('16', 'my', 'story'), ('16', 'my', 'task'), ('16', 'my', 'testCase'), ('16', 'my', 'testTask'), ('16', 'my', 'todo'), ('16', 'my', 'unbind'), ('16', 'product', 'all'), ('16', 'product', 'batchEdit'), ('16', 'product', 'browse'), ('16', 'product', 'close'), ('16', 'product', 'doc'), ('16', 'product', 'dynamic'), ('16', 'product', 'index'), ('16', 'product', 'project'), ('16', 'product', 'roadmap'), ('16', 'product', 'updateOrder'), ('16', 'product', 'view'), ('16', 'productplan', 'batchEdit'), ('16', 'productplan', 'batchUnlinkBug'), ('16', 'productplan', 'batchUnlinkStory'), ('16', 'productplan', 'browse'), ('16', 'productplan', 'create'), ('16', 'productplan', 'edit'), ('16', 'productplan', 'linkBug'), ('16', 'productplan', 'linkStory'), ('16', 'productplan', 'unlinkBug'), ('16', 'productplan', 'view'), ('16', 'project', 'activate'), ('16', 'project', 'all'), ('16', 'project', 'batchedit'), ('16', 'project', 'batchUnlinkStory'), ('16', 'project', 'browse'), ('16', 'project', 'bug'), ('16', 'project', 'build'), ('16', 'project', 'burn'), ('16', 'project', 'burnData'), ('16', 'project', 'close'), ('16', 'project', 'computeBurn'), ('16', 'project', 'doc'), ('16', 'project', 'dynamic'), ('16', 'project', 'edit'), ('16', 'project', 'fixFirst'), ('16', 'project', 'grouptask'), ('16', 'project', 'importBug'), ('16', 'project', 'importtask'), ('16', 'project', 'index'), ('16', 'project', 'kanban'), ('16', 'project', 'linkStory'), ('16', 'project', 'manageMembers'), ('16', 'project', 'manageProducts'), ('16', 'project', 'printKanban'), ('16', 'project', 'putoff'), ('16', 'project', 'start'), ('16', 'project', 'story'), ('16', 'project', 'suspend'), ('16', 'project', 'task'), ('16', 'project', 'testtask'), ('16', 'project', 'tree'), ('16', 'project', 'unlinkStory'), ('16', 'project', 'updateOrder'), ('16', 'project', 'view'), ('16', 'release', 'batchUnlinkBug'), ('16', 'release', 'batchUnlinkStory'), ('16', 'release', 'browse'), ('16', 'release', 'changeStatus'), ('16', 'release', 'edit'), ('16', 'release', 'export'), ('16', 'release', 'linkBug'), ('16', 'release', 'linkStory'), ('16', 'release', 'unlinkBug'), ('16', 'release', 'unlinkStory'), ('16', 'release', 'view'), ('16', 'story', 'activate'), ('16', 'story', 'batchAssignTo'), ('16', 'story', 'batchChangeBranch'), ('16', 'story', 'batchChangeModule'), ('16', 'story', 'batchChangePlan'), ('16', 'story', 'batchChangeStage'), ('16', 'story', 'batchClose'), ('16', 'story', 'batchCreate'), ('16', 'story', 'batchEdit'), ('16', 'story', 'batchReview'), ('16', 'story', 'change'), ('16', 'story', 'close'), ('16', 'story', 'create'), ('16', 'story', 'delete'), ('16', 'story', 'edit'), ('16', 'story', 'export'), ('16', 'story', 'linkStory'), ('16', 'story', 'report'), ('16', 'story', 'review'), ('16', 'story', 'tasks'), ('16', 'story', 'unlinkStory'), ('16', 'story', 'view'), ('16', 'story', 'zeroCase'), ('16', 'task', 'activate'), ('16', 'task', 'assignTo'), ('16', 'task', 'batchAssignTo'), ('16', 'task', 'batchChangeModule'), ('16', 'task', 'batchClose'), ('16', 'task', 'batchEdit'), ('16', 'task', 'cancel'), ('16', 'task', 'close'), ('16', 'task', 'confirmStoryChange'), ('16', 'task', 'delete'), ('16', 'task', 'deleteEstimate'), ('16', 'task', 'edit'), ('16', 'task', 'editEstimate'), ('16', 'task', 'export'), ('16', 'task', 'finish'), ('16', 'task', 'pause'), ('16', 'task', 'recordEstimate'), ('16', 'task', 'report'), ('16', 'task', 'restart'), ('16', 'task', 'start'), ('16', 'task', 'view'), ('16', 'testcase', 'batchChangeModule'), ('16', 'testcase', 'batchCreate'), ('16', 'testcase', 'batchDelete'), ('16', 'testcase', 'batchEdit'), ('16', 'testcase', 'browse'), ('16', 'testcase', 'confirmChange'), ('16', 'testcase', 'confirmStoryChange'), ('16', 'testcase', 'create'), ('16', 'testcase', 'createBug'), ('16', 'testcase', 'delete'), ('16', 'testcase', 'edit'), ('16', 'testcase', 'export'), ('16', 'testcase', 'exportTemplet'), ('16', 'testcase', 'groupCase'), ('16', 'testcase', 'import'), ('16', 'testcase', 'index'), ('16', 'testcase', 'linkCases'), ('16', 'testcase', 'showImport'), ('16', 'testcase', 'unlinkCase'), ('16', 'testcase', 'view'), ('16', 'testtask', 'batchAssign'), ('16', 'testtask', 'batchRun'), ('16', 'testtask', 'browse'), ('16', 'testtask', 'cases'), ('16', 'testtask', 'close'), ('16', 'testtask', 'create'), ('16', 'testtask', 'edit'), ('16', 'testtask', 'groupCase'), ('16', 'testtask', 'index'), ('16', 'testtask', 'linkcase'), ('16', 'testtask', 'results'), ('16', 'testtask', 'runcase'), ('16', 'testtask', 'start'), ('16', 'testtask', 'unlinkcase'), ('16', 'testtask', 'view'), ('16', 'todo', 'batchCreate'), ('16', 'todo', 'batchEdit'), ('16', 'todo', 'batchFinish'), ('16', 'todo', 'create'), ('16', 'todo', 'delete'), ('16', 'todo', 'edit'), ('16', 'todo', 'export'), ('16', 'todo', 'finish'), ('16', 'todo', 'import2Today'), ('16', 'todo', 'view'), ('19', 'hdc', 'allcationcancel'), ('19', 'hdc', 'allcationedit'), ('19', 'hdc', 'browse'), ('19', 'hdc', 'centerall'), ('19', 'hdc', 'centerusercreate'), ('19', 'hdc', 'centeruserdelete'), ('19', 'hdc', 'createcation'), ('19', 'hdc', 'createcenter'), ('19', 'hdc', 'createframe'), ('19', 'hdc', 'createmanager'), ('19', 'hdc', 'deleteframe'), ('19', 'hdc', 'deletemanager'), ('19', 'hdc', 'editmanager'), ('19', 'hdc', 'frameall'), ('19', 'hdc', 'hdcallcation'), ('19', 'hdc', 'hdcmaintenance'), ('19', 'hdc', 'hdcmanage'), ('19', 'hdc', 'hdcproject'), ('19', 'hdc', 'hdcundone'), ('19', 'hdc', 'managedelete'), ('19', 'hdc', 'manageedit'), ('19', 'hdc', 'managerall'), ('19', 'hdc', 'usersync'), ('21', 'group', 'manageMember'), ('21', 'hdc', 'activate'), ('21', 'hdc', 'allcationcancel'), ('21', 'hdc', 'allcationedit'), ('21', 'hdc', 'batchActivate'), ('21', 'hdc', 'browse'), ('21', 'hdc', 'centerall'), ('21', 'hdc', 'centerusercreate'), ('21', 'hdc', 'centeruserdelete'), ('21', 'hdc', 'createcation'), ('21', 'hdc', 'createcenter'), ('21', 'hdc', 'createframe'), ('21', 'hdc', 'createmanager'), ('21', 'hdc', 'delete'), ('21', 'hdc', 'deleteframe'), ('21', 'hdc', 'deletemanager'), ('21', 'hdc', 'edit'), ('21', 'hdc', 'editmanager'), ('21', 'hdc', 'exportReport'), ('21', 'hdc', 'frameall'), ('21', 'hdc', 'hdcallcation'), ('21', 'hdc', 'hdcmaintenance'), ('21', 'hdc', 'hdcmanage'), ('21', 'hdc', 'hdcplan'), ('21', 'hdc', 'hdcproject'), ('21', 'hdc', 'hdcsummary'), ('21', 'hdc', 'hdcundone'), ('21', 'hdc', 'import'), ('21', 'hdc', 'managedelete'), ('21', 'hdc', 'manageedit'), ('21', 'hdc', 'managerall'), ('21', 'hdc', 'showImport'), ('21', 'hdc', 'usersync'), ('22', 'hdc', 'browse'), ('22', 'hdc', 'creatallplan'), ('22', 'hdc', 'hdcdeleteplan'), ('22', 'hdc', 'hdcdetailplan'), ('22', 'hdc', 'hdceditplan'), ('22', 'hdc', 'hdcplan');
COMMIT;

-- ----------------------------
--  Table structure for `zt_hdc`
-- ----------------------------
DROP TABLE IF EXISTS `zt_hdc`;
CREATE TABLE `zt_hdc` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) DEFAULT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `story` mediumint(8) DEFAULT NULL,
  `code` varchar(30) NOT NULL,
  `name` varchar(255) NOT NULL,
  `desc` text,
  `step` varchar(30) DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `type` varchar(30) NOT NULL,
  `rating` varchar(30) NOT NULL,
  `totalManday` float DEFAULT NULL,
  `onsiteManday` float DEFAULT NULL,
  `remoteManday` float DEFAULT NULL,
  `codecmtManday` float DEFAULT NULL,
  `funcDesign` varchar(30) DEFAULT NULL,
  `techDesign` varchar(30) DEFAULT NULL,
  `codeDevelop` varchar(30) DEFAULT NULL,
  `remoteTest` varchar(30) DEFAULT NULL,
  `siteAccept` varchar(30) DEFAULT NULL,
  `remoteHead` varchar(30) DEFAULT NULL,
  `siteHead` varchar(30) DEFAULT NULL,
  `funcOwnership` varchar(30) DEFAULT NULL,
  `estReqSubmitDate` date DEFAULT NULL,
  `estCodeStartDate` date DEFAULT NULL,
  `estCodeEndDate` date DEFAULT NULL,
  `estTestEndDate` date DEFAULT NULL,
  `actReqSubmitDate` date DEFAULT NULL,
  `actCodeStartDate` date DEFAULT NULL,
  `actCodeEndDate` date DEFAULT NULL,
  `actTestEndDate` date DEFAULT NULL,
  `devOwnership` varchar(30) DEFAULT NULL,
  `operateTime` datetime DEFAULT NULL,
  `status` enum('0','1') DEFAULT '0',
  `deleted` enum('0','1') DEFAULT '0',
  `actReqComfimBeganDate` date DEFAULT NULL COMMENT '需求确认开始日期(实际)',
  `actReqComfimEndDate` date DEFAULT NULL COMMENT '需求确认结束日期(实际)',
  `actTestBeganDate` date DEFAULT NULL COMMENT '测试开始日期(实际)',
  `actOnsiteTestBeganDate` date DEFAULT NULL COMMENT '现场测试开始日期(实际)',
  `actOnsiteTestEndDate` date DEFAULT NULL COMMENT '现场测试完成日期(实际)',
  `confimDate` date DEFAULT NULL COMMENT '全部计费完成日期',
  `onCodingStartDate` date DEFAULT NULL COMMENT '开发实际开始日期',
  `recopercent` varchar(5) NOT NULL COMMENT '收入确认百分比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2994 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_hdcplan`
-- ----------------------------
DROP TABLE IF EXISTS `zt_hdcplan`;
CREATE TABLE `zt_hdcplan` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) NOT NULL COMMENT '用户id',
  `project_id` mediumint(8) NOT NULL COMMENT '项目id',
  `plandate` date NOT NULL COMMENT '时间',
  `worktype` varchar(20) NOT NULL COMMENT '工作类型',
  `percent` smallint(3) NOT NULL COMMENT '计划百分比',
  `target` text NOT NULL COMMENT '备注',
  `lasteditor` mediumint(8) NOT NULL COMMENT '最后编辑人',
  `lasteditdate` datetime NOT NULL COMMENT '最后编辑时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='计划详细表';

-- ----------------------------
--  Table structure for `zt_history`
-- ----------------------------
DROP TABLE IF EXISTS `zt_history`;
CREATE TABLE `zt_history` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field` varchar(30) NOT NULL DEFAULT '',
  `old` text NOT NULL,
  `new` text NOT NULL,
  `diff` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52023 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_lang`
-- ----------------------------
DROP TABLE IF EXISTS `zt_lang`;
CREATE TABLE `zt_lang` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `system` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`,`module`,`section`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_mailqueue`
-- ----------------------------
DROP TABLE IF EXISTS `zt_mailqueue`;
CREATE TABLE `zt_mailqueue` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `toList` varchar(255) NOT NULL,
  `ccList` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `addedBy` char(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `sendTime` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'wait',
  `failReason` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sendTime` (`sendTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_mandays`
-- ----------------------------
DROP TABLE IF EXISTS `zt_mandays`;
CREATE TABLE `zt_mandays` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `project` mediumint(8) unsigned NOT NULL,
  `account` char(30) NOT NULL,
  `plandays` mediumint(6) NOT NULL DEFAULT '0',
  `actualdays` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mandays_idx` (`project`,`account`)
) ENGINE=InnoDB AUTO_INCREMENT=20234 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_module`
-- ----------------------------
DROP TABLE IF EXISTS `zt_module`;
CREATE TABLE `zt_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(60) NOT NULL DEFAULT '',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `short` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `module` (`root`,`type`,`path`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_product`
-- ----------------------------
DROP TABLE IF EXISTS `zt_product`;
CREATE TABLE `zt_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT 'normal',
  `status` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `PO` varchar(30) NOT NULL,
  `QD` varchar(30) NOT NULL,
  `RD` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL DEFAULT 'open',
  `whitelist` varchar(255) NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdVersion` varchar(20) NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order` (`order`)
) ENGINE=MyISAM AUTO_INCREMENT=3885 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_productplan`
-- ----------------------------
DROP TABLE IF EXISTS `zt_productplan`;
CREATE TABLE `zt_productplan` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `title` varchar(90) NOT NULL,
  `desc` text NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `plan` (`product`,`end`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_proframework`
-- ----------------------------
DROP TABLE IF EXISTS `zt_proframework`;
CREATE TABLE `zt_proframework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `center_id` mediumint(8) NOT NULL COMMENT '中心id',
  `name` varchar(30) COLLATE utf8_estonian_ci DEFAULT NULL COMMENT '框架名称',
  `description` varchar(60) COLLATE utf8_estonian_ci NOT NULL COMMENT '框架描述',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_by` mediumint(8) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci;

-- ----------------------------
--  Table structure for `zt_project`
-- ----------------------------
DROP TABLE IF EXISTS `zt_project`;
CREATE TABLE `zt_project` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `isCat` enum('1','0') NOT NULL DEFAULT '0',
  `catID` mediumint(8) unsigned NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sprint',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `days` smallint(5) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `statge` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `pri` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` int(10) unsigned NOT NULL DEFAULT '0',
  `openedVersion` varchar(20) NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` int(10) unsigned NOT NULL DEFAULT '0',
  `canceledBy` varchar(30) NOT NULL DEFAULT '',
  `canceledDate` int(10) unsigned NOT NULL DEFAULT '0',
  `PO` varchar(30) NOT NULL DEFAULT '',
  `PM` varchar(30) NOT NULL DEFAULT '',
  `QD` varchar(30) NOT NULL DEFAULT '',
  `RD` varchar(30) NOT NULL DEFAULT '',
  `team` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL DEFAULT 'open',
  `whitelist` varchar(255) NOT NULL,
  `order` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `gitaddress` varchar(150) DEFAULT ' ',
  `deptid` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project` (`parent`,`begin`,`end`,`status`,`order`)
) ENGINE=MyISAM AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_projectproduct`
-- ----------------------------
DROP TABLE IF EXISTS `zt_projectproduct`;
CREATE TABLE `zt_projectproduct` (
  `project` mediumint(8) unsigned NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`project`,`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_projectstory`
-- ----------------------------
DROP TABLE IF EXISTS `zt_projectstory`;
CREATE TABLE `zt_projectstory` (
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product` mediumint(8) unsigned NOT NULL,
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` smallint(6) NOT NULL DEFAULT '1',
  UNIQUE KEY `project` (`project`,`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_release`
-- ----------------------------
DROP TABLE IF EXISTS `zt_release`;
CREATE TABLE `zt_release` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` mediumint(8) unsigned NOT NULL,
  `name` char(30) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `leftBugs` text NOT NULL,
  `desc` text NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'normal',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `build` (`build`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_story`
-- ----------------------------
DROP TABLE IF EXISTS `zt_story`;
CREATE TABLE `zt_story` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `branch` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plan` text NOT NULL,
  `source` varchar(20) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `estimate` float unsigned NOT NULL,
  `status` enum('','changed','active','draft','closed') NOT NULL DEFAULT '',
  `color` char(7) NOT NULL,
  `stage` enum('','wait','planned','projected','developing','developed','testing','tested','verified','released') NOT NULL DEFAULT 'wait',
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `reviewedBy` varchar(255) NOT NULL,
  `reviewedDate` date NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `toBug` mediumint(9) NOT NULL,
  `childStories` varchar(255) NOT NULL,
  `linkStories` varchar(255) NOT NULL,
  `duplicateStory` mediumint(8) unsigned NOT NULL,
  `version` smallint(6) NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `story` (`product`,`module`,`status`,`assignedTo`)
) ENGINE=MyISAM AUTO_INCREMENT=3593 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_storyspec`
-- ----------------------------
DROP TABLE IF EXISTS `zt_storyspec`;
CREATE TABLE `zt_storyspec` (
  `story` mediumint(9) NOT NULL,
  `version` smallint(6) NOT NULL,
  `title` varchar(90) NOT NULL,
  `spec` text NOT NULL,
  `verify` text NOT NULL,
  UNIQUE KEY `story` (`story`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_storystage`
-- ----------------------------
DROP TABLE IF EXISTS `zt_storystage`;
CREATE TABLE `zt_storystage` (
  `story` mediumint(8) unsigned NOT NULL,
  `branch` mediumint(8) unsigned NOT NULL,
  `stage` varchar(50) NOT NULL,
  KEY `story` (`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_task`
-- ----------------------------
DROP TABLE IF EXISTS `zt_task`;
CREATE TABLE `zt_task` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `fromBug` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `estimate` float unsigned NOT NULL,
  `consumed` float unsigned NOT NULL,
  `left` float unsigned NOT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('wait','doing','done','pause','cancel','closed') NOT NULL DEFAULT 'wait',
  `color` char(7) NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL,
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `estStarted` date DEFAULT NULL,
  `realStarted` date DEFAULT NULL,
  `finishedBy` varchar(30) NOT NULL,
  `finishedDate` datetime DEFAULT NULL,
  `canceledBy` varchar(30) NOT NULL,
  `canceledDate` datetime DEFAULT NULL,
  `closedBy` varchar(30) NOT NULL,
  `closedDate` datetime DEFAULT NULL,
  `closedReason` varchar(30) NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL,
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `task` (`project`,`module`,`story`,`assignedTo`)
) ENGINE=MyISAM AUTO_INCREMENT=21428 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_taskestimate`
-- ----------------------------
DROP TABLE IF EXISTS `zt_taskestimate`;
CREATE TABLE `zt_taskestimate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `left` float unsigned NOT NULL DEFAULT '0',
  `consumed` float unsigned NOT NULL,
  `account` char(30) NOT NULL DEFAULT '',
  `work` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task` (`task`)
) ENGINE=MyISAM AUTO_INCREMENT=376 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_team`
-- ----------------------------
DROP TABLE IF EXISTS `zt_team`;
CREATE TABLE `zt_team` (
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `role` char(30) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `days` smallint(5) unsigned NOT NULL,
  `hours` float(2,1) unsigned NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`project`,`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_testresult`
-- ----------------------------
DROP TABLE IF EXISTS `zt_testresult`;
CREATE TABLE `zt_testresult` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `run` mediumint(8) unsigned NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  `caseResult` char(30) NOT NULL,
  `stepResults` text NOT NULL,
  `lastRunner` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `testresult` (`case`,`version`,`run`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_testrun`
-- ----------------------------
DROP TABLE IF EXISTS `zt_testrun`;
CREATE TABLE `zt_testrun` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `case` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `assignedTo` char(30) NOT NULL DEFAULT '',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  `status` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task` (`task`,`case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_testtask`
-- ----------------------------
DROP TABLE IF EXISTS `zt_testtask`;
CREATE TABLE `zt_testtask` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(90) NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `report` text NOT NULL,
  `status` enum('blocked','doing','wait','done') NOT NULL DEFAULT 'wait',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `build` (`build`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_todo`
-- ----------------------------
DROP TABLE IF EXISTS `zt_todo`;
CREATE TABLE `zt_todo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `date` date NOT NULL,
  `begin` smallint(4) unsigned zerofill NOT NULL,
  `end` smallint(4) unsigned zerofill NOT NULL,
  `type` char(10) NOT NULL,
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `name` char(150) NOT NULL,
  `desc` text NOT NULL,
  `status` enum('wait','doing','done') NOT NULL DEFAULT 'wait',
  `private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `todo` (`account`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_user`
-- ----------------------------
DROP TABLE IF EXISTS `zt_user`;
CREATE TABLE `zt_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `dept` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `role` char(10) NOT NULL DEFAULT '',
  `realname` char(30) NOT NULL DEFAULT '',
  `nickname` char(60) NOT NULL DEFAULT '',
  `commiter` varchar(100) NOT NULL,
  `avatar` char(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `gender` enum('f','m') NOT NULL DEFAULT 'f',
  `email` char(90) NOT NULL DEFAULT '',
  `skype` char(90) NOT NULL DEFAULT '',
  `qq` char(20) NOT NULL DEFAULT '',
  `yahoo` char(90) NOT NULL DEFAULT '',
  `gtalk` char(90) NOT NULL DEFAULT '',
  `wangwang` char(90) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `phone` char(20) NOT NULL DEFAULT '',
  `address` char(120) NOT NULL DEFAULT '',
  `zipcode` char(10) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `visits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `last` int(10) unsigned NOT NULL DEFAULT '0',
  `fails` tinyint(5) NOT NULL DEFAULT '0',
  `locked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ranzhi` char(30) NOT NULL DEFAULT '',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `user` (`dept`,`email`,`commiter`)
) ENGINE=MyISAM AUTO_INCREMENT=6913 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_user`
-- ----------------------------
BEGIN;
INSERT INTO `zt_user` VALUES ('6912', '0', '11014', 'handhand', '', '11014', '', '', '', '0000-00-00', 'f', '', '', '', '', '', '', '', '', '', '', '0000-00-00', '0', '', '0', '0', '0000-00-00 00:00:00', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `zt_usercontact`
-- ----------------------------
DROP TABLE IF EXISTS `zt_usercontact`;
CREATE TABLE `zt_usercontact` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `listName` varchar(60) NOT NULL,
  `userList` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `zt_usergroup`;
CREATE TABLE `zt_usergroup` (
  `account` char(30) NOT NULL DEFAULT '',
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `account` (`account`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `zt_usergroup`
-- ----------------------------
BEGIN;
INSERT INTO `zt_usergroup` VALUES ('11014', '1');
COMMIT;

-- ----------------------------
--  Table structure for `zt_userquery`
-- ----------------------------
DROP TABLE IF EXISTS `zt_userquery`;
CREATE TABLE `zt_userquery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(90) NOT NULL,
  `form` text NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `query` (`account`,`module`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `zt_usertpl`
-- ----------------------------
DROP TABLE IF EXISTS `zt_usertpl`;
CREATE TABLE `zt_usertpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `type` char(30) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `public` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
