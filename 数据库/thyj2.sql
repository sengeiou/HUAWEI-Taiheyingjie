/*
Navicat MySQL Data Transfer

Source Server         : C
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : thyj2

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2018-10-23 12:39:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for i_login
-- ----------------------------
DROP TABLE IF EXISTS `i_login`;
CREATE TABLE `i_login` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `role` enum('customer','staff','admin') NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`lid`),
  KEY `INDEX1` (`pid`),
  KEY `INDEX2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for i_operate
-- ----------------------------
DROP TABLE IF EXISTS `i_operate`;
CREATE TABLE `i_operate` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `info` varchar(2048) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `INDEX1` (`pid`),
  KEY `INDEX2` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for i_systemd
-- ----------------------------
DROP TABLE IF EXISTS `i_systemd`;
CREATE TABLE `i_systemd` (
  `tid` int(11) NOT NULL,
  `info` varchar(4096) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `INDEX1` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for l_sale
-- ----------------------------
DROP TABLE IF EXISTS `l_sale`;
CREATE TABLE `l_sale` (
  `oid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  KEY `INDEX1` (`oid`),
  KEY `INDEX2` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_complaint
-- ----------------------------
DROP TABLE IF EXISTS `t_complaint`;
CREATE TABLE `t_complaint` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `info` varchar(2048) NOT NULL,
  PRIMARY KEY (`wid`),
  KEY `INDEX1` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_customer
-- ----------------------------
DROP TABLE IF EXISTS `t_customer`;
CREATE TABLE `t_customer` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `company` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `legalperson` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `founder` varchar(45) NOT NULL,
  `timestamp` datetime NOT NULL,
  `remarks` varchar(256) NOT NULL,
  PRIMARY KEY (`cid`),
  UNIQUE KEY `INDEX2` (`phone`) USING BTREE,
  KEY `INDEX4` (`type`) USING BTREE,
  KEY `INDEX3` (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `categories` varchar(45) NOT NULL,
  `manufacturer` varchar(45) NOT NULL,
  `isselfsale` int(10) NOT NULL,
  `tip_time` varchar(45) NOT NULL,
  `status` enum('offline','online') NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `INDEX1` (`code`),
  KEY `INDEX2` (`model`),
  KEY `INDEX3` (`categories`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_inspection
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection`;
CREATE TABLE `t_inspection` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `table` text NOT NULL,
  `status` varchar(45) NOT NULL,
  `timestamp` varchar(45) NOT NULL,
  `report` varchar(2048) NOT NULL,
  `feedback` varchar(2048) NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `INDEX1` (`cid`),
  KEY `INDEX2` (`sid`),
  KEY `INDEX3` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `t_maintenance`;
CREATE TABLE `t_maintenance` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `table` text NOT NULL,
  `status` varchar(45) NOT NULL,
  `timestamp` varchar(45) NOT NULL,
  `report` varchar(2048) NOT NULL,
  `feedback` varchar(2048) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `INDEX1` (`cid`),
  KEY `INDEX2` (`sid`),
  KEY `INDEX3` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `content` varchar(2048) NOT NULL,
  `insurance` enum('False','True') NOT NULL,
  `position` varchar(256) NOT NULL,
  `sign_time` varchar(45) NOT NULL,
  `force_time` varchar(45) NOT NULL,
  `expire_time` varchar(45) NOT NULL,
  `add_time` datetime NOT NULL,
  `modify_time` datetime NOT NULL,
  `status` int(11) NOT NULL,
  `remarks` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `INDEX1` (`cid`),
  KEY `INDEX2` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_password
-- ----------------------------
DROP TABLE IF EXISTS `t_password`;
CREATE TABLE `t_password` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `unionid` varchar(45) NOT NULL,
  `role` enum('customer','staff','admin') NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `INDEX1_2` (`username`,`password`),
  KEY `INDEX3` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_register
-- ----------------------------
DROP TABLE IF EXISTS `t_register`;
CREATE TABLE `t_register` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `action` varchar(45) NOT NULL,
  `position` varchar(128) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `INDEX1` (`sid`),
  KEY `INDEX2` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Table structure for t_staff
-- ----------------------------
DROP TABLE IF EXISTS `t_staff`;
CREATE TABLE `t_staff` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `active` varchar(45) NOT NULL COMMENT '账户状态',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `uni_staff_phone` (`phone`) USING BTREE,
  KEY `ind_staff_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
