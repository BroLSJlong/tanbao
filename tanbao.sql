/*
Navicat MySQL Data Transfer

Source Server         : ALiyun
Source Server Version : 50735
Source Host           : 112.74.44.189:3306
Source Database       : tanbao

Target Server Type    : MYSQL
Target Server Version : 50735
File Encoding         : 65001

Date: 2021-09-06 10:45:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresstable
-- ----------------------------
DROP TABLE IF EXISTS `addresstable`;
CREATE TABLE `addresstable` (
  `addressId` varchar(32) NOT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `address` varchar(108) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collectiongoodstable
-- ----------------------------
DROP TABLE IF EXISTS `collectiongoodstable`;
CREATE TABLE `collectiongoodstable` (
  `userId` varchar(32) DEFAULT NULL,
  `goodsId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for collectionstoretable
-- ----------------------------
DROP TABLE IF EXISTS `collectionstoretable`;
CREATE TABLE `collectionstoretable` (
  `userId` varchar(32) DEFAULT NULL,
  `sellerId` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goodsimgtable
-- ----------------------------
DROP TABLE IF EXISTS `goodsimgtable`;
CREATE TABLE `goodsimgtable` (
  `goodsId` varchar(32) DEFAULT NULL,
  `imgId` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for goodstable
-- ----------------------------
DROP TABLE IF EXISTS `goodstable`;
CREATE TABLE `goodstable` (
  `goodsId` varchar(32) NOT NULL,
  `goodsName` varchar(20) DEFAULT NULL,
  `goodsOutPrice` varchar(10) DEFAULT NULL,
  `goodsInPrice` varchar(10) DEFAULT NULL,
  `goodsDescript` varchar(200) DEFAULT NULL,
  `goodsNum` varchar(10) DEFAULT NULL,
  `goodsClass` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`goodsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orderdetailtable
-- ----------------------------
DROP TABLE IF EXISTS `orderdetailtable`;
CREATE TABLE `orderdetailtable` (
  `orderId` varchar(32) DEFAULT NULL,
  `goodsId` varchar(32) DEFAULT NULL,
  `orderNum` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ordertable
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `orderId` varchar(32) NOT NULL,
  `buyId` varchar(32) DEFAULT NULL,
  `sellerId` varchar(32) DEFAULT NULL,
  `orderPrice` varchar(10) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `addressId` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for shoppingtable
-- ----------------------------
DROP TABLE IF EXISTS `shoppingtable`;
CREATE TABLE `shoppingtable` (
  `userId` varchar(32) DEFAULT NULL,
  `goodsId` varchar(32) DEFAULT NULL,
  `shopNum` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for storetable
-- ----------------------------
DROP TABLE IF EXISTS `storetable`;
CREATE TABLE `storetable` (
  `sellerId` varchar(32) NOT NULL,
  `goodsId` varchar(32) DEFAULT NULL,
  `storeName` varchar(20) DEFAULT NULL,
  `storeDescript` varchar(200) DEFAULT NULL COMMENT '店铺简介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for usertable
-- ----------------------------
DROP TABLE IF EXISTS `usertable`;
CREATE TABLE `usertable` (
  `userId` varchar(32) NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `userPwd` varchar(20) DEFAULT NULL,
  `userSex` varchar(2) DEFAULT NULL,
  `userBorn` varchar(16) DEFAULT NULL,
  `idCard` varchar(18) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `headImg` varchar(40) DEFAULT NULL,
  `userClass` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
