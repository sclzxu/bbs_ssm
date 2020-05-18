/*
MySQL Data Transfer
Source Host: localhost
Source Database: bbs_system
Target Host: localhost
Target Database: bbs_system
Date: 5/18/2020 3:39:56 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bbs_category
-- ----------------------------
CREATE TABLE `bbs_category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_follow
-- ----------------------------
CREATE TABLE `bbs_follow` (
  `userId` varchar(32) NOT NULL,
  `beUserId` varchar(32) NOT NULL,
  `followDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`,`beUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_invitation
-- ----------------------------
CREATE TABLE `bbs_invitation` (
  `invitationId` varchar(128) NOT NULL,
  `invitationTitle` varchar(128) NOT NULL,
  `invitationMessage` mediumtext NOT NULL,
  `userId` varchar(32) NOT NULL,
  `plateId` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `isPass` int(11) DEFAULT '0',
  `isEnable` int(11) DEFAULT '0',
  `isCream` int(11) DEFAULT '0',
  `invitationCreate` datetime DEFAULT NULL,
  `invitationModify` datetime DEFAULT NULL,
  PRIMARY KEY (`invitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_invitation_ans
-- ----------------------------
CREATE TABLE `bbs_invitation_ans` (
  `ansId` varchar(128) NOT NULL,
  `ansMessage` mediumtext NOT NULL,
  `invitationId` varchar(128) NOT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `ansDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ansId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_level
-- ----------------------------
CREATE TABLE `bbs_level` (
  `levelId` int(11) NOT NULL AUTO_INCREMENT,
  `levelMessage` varchar(8) NOT NULL,
  PRIMARY KEY (`levelId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_plate
-- ----------------------------
CREATE TABLE `bbs_plate` (
  `plateId` int(11) NOT NULL AUTO_INCREMENT,
  `plateTitle` varchar(32) NOT NULL,
  `plateMessage` varchar(128) DEFAULT NULL,
  `isEnable` int(11) DEFAULT '0',
  PRIMARY KEY (`plateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_store
-- ----------------------------
CREATE TABLE `bbs_store` (
  `userId` varchar(32) NOT NULL,
  `invitationId` varchar(128) NOT NULL,
  `storeDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`,`invitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_system_ans
-- ----------------------------
CREATE TABLE `bbs_system_ans` (
  `id` varchar(128) NOT NULL,
  `systemId` varchar(32) NOT NULL,
  `userId` varchar(32) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `isRead` int(11) DEFAULT '0',
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_user
-- ----------------------------
CREATE TABLE `bbs_user` (
  `userId` varchar(32) NOT NULL,
  `userPsw` varchar(32) NOT NULL,
  `userAlice` varchar(64) DEFAULT NULL,
  `userEmail` varchar(64) DEFAULT NULL,
  `userSex` varchar(1) DEFAULT '男',
  `userPhoto` varchar(128) DEFAULT 'xxx.jpg',
  `userScore` double DEFAULT '0',
  `userLevel` int(11) DEFAULT '1',
  `levelDown` date DEFAULT NULL,
  `userLock` date DEFAULT NULL,
  `userCreateDate` date DEFAULT NULL,
  `isPass` int(11) DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bbs_level` VALUES ('5', '系统管理员');
INSERT INTO `bbs_level` VALUES ('6', '初级会员');
INSERT INTO `bbs_level` VALUES ('7', '中级会员');
INSERT INTO `bbs_level` VALUES ('8', '高级会员');
INSERT INTO `bbs_user` VALUES ('admin', 'f379eaf3c831b04de153469d1bec345e', null, null, '男', 'xxx.jpg', '0', '5', null, null, '2020-05-18', '0');
