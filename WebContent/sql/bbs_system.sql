/*
MySQL Data Transfer
Source Host: localhost
Source Database: bbs_system
Target Host: localhost
Target Database: bbs_system
Date: 6/1/2020 9:48:30 AM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bbs_category
-- ----------------------------
CREATE TABLE `bbs_category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) NOT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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
  `invitationCreate` datetime DEFAULT NULL,
  `invitationModify` datetime DEFAULT NULL,
  PRIMARY KEY (`invitationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_invitation_access
-- ----------------------------
CREATE TABLE `bbs_invitation_access` (
  `invitationId` varchar(128) NOT NULL,
  `accessCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`invitationId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
-- Table structure for bbs_invitation_inter
-- ----------------------------
CREATE TABLE `bbs_invitation_inter` (
  `interId` bigint(20) NOT NULL AUTO_INCREMENT,
  `followUserId` varchar(32) DEFAULT NULL,
  `storeUserId` varchar(32) DEFAULT NULL,
  `invitationId` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`interId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
  `userLevel` int(11) DEFAULT NULL,
  `levelDown` date DEFAULT NULL,
  `userLock` date DEFAULT NULL,
  `userCreateDate` date DEFAULT NULL,
  `isPass` int(11) DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bbs_category` VALUES ('2', '投票');
INSERT INTO `bbs_category` VALUES ('3', '活动');
INSERT INTO `bbs_category` VALUES ('4', '讨论');
INSERT INTO `bbs_category` VALUES ('5', '主题');
INSERT INTO `bbs_category` VALUES ('6', '新闻');
INSERT INTO `bbs_category` VALUES ('7', '求助');
INSERT INTO `bbs_category` VALUES ('8', '公告');
INSERT INTO `bbs_category` VALUES ('9', '其他');
INSERT INTO `bbs_category` VALUES ('12', '心得');
INSERT INTO `bbs_invitation` VALUES ('gouDan1590723951484', '%E4%BA%8C%E7%8B%97%E5%AD%90%E7%9A%84%E5%A6%96%E5%AD%BD%E4%BA%BA%E7%94%9F', '%3Cp%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+xx-large%3B+color%3A+rgb%28249%2C+150%2C+59%29%3B%22%3E%E6%88%91%E6%98%AF%E4%BA%8C%E7%8B%97%E5%AD%90%EF%BC%8C%E6%88%91%E5%BE%88%E5%A6%96%E5%AD%BD%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cbr%3E%3C%2Fp%3E', 'gouDan', '13', '9', '1', '0', '2020-05-29 11:45:51', null);
INSERT INTO `bbs_invitation` VALUES ('gouDan1590723992637', 'Java%E5%A5%BD%E5%AD%A6%E5%90%97%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+xx-large%3B+color%3A+rgb%28123%2C+91%2C+161%29%3B%22%3E%E5%A5%BD%E5%AD%A6%E7%9A%84%E6%89%A31%EF%BC%9B%E4%B8%8D%E5%A5%BD%E5%AD%A6%E7%9A%84%E6%89%A32%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+xx-large%3B+color%3A+rgb%28123%2C+91%2C+161%29%3B%22%3E%E5%8A%9D%E6%88%91%E6%94%BE%E5%BC%83%E7%9A%84%EF%BC%8C%E8%AF%B7%E7%82%B9%E8%B5%9E%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E', 'gouDan', '1', '4', '1', '0', '2020-05-29 11:46:33', null);
INSERT INTO `bbs_invitation` VALUES ('gouDan1590724038179', '%E4%BC%9A%E6%9C%89%E7%AC%AC%E4%B8%89%E6%AC%A1%E4%B8%96%E7%95%8C%E5%A4%A7%E6%88%98%E5%90%97%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+x-large%3B+color%3A+rgb%2870%2C+172%2C+200%29%3B%22%3E%E7%AC%AC%E4%B8%89%E6%AC%A1%E4%B8%96%E7%95%8C%E5%A4%A7%E6%88%98%EF%BC%8C%E5%8F%AF%E8%83%BD%E5%90%97%EF%BC%9F%3C%2Fspan%3E%3C%2Fp%3E', 'gouDan', '11', '4', '1', '0', '2020-05-29 11:47:18', null);
INSERT INTO `bbs_invitation` VALUES ('gouDan1590724079795', '%E5%A4%A7%E5%AE%B6%E8%BF%98%E8%BF%87%E5%84%BF%E7%AB%A5%E8%8A%82%E5%90%97%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+xx-large%3B%22%3E%E8%BF%87%E4%B8%A4%E5%A4%A9%E6%98%AF%E5%84%BF%E7%AB%A5%E8%8A%82%E4%BA%86%EF%BC%8C%E5%A4%A7%E5%AE%B6%E5%92%8B%E8%BF%87%E5%91%A2%EF%BC%9F%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F40%2Fpcmoren_tian_org.png%22+alt%3D%22%5B%E8%88%94%E5%B1%8F%5D%22+data-w-e%3D%221%22%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F40%2Fpcmoren_tian_org.png%22+alt%3D%22%5B%E8%88%94%E5%B1%8F%5D%22+data-w-e%3D%221%22+style%3D%22font-size%3A+12px%3B%22%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+xx-large%3B%22%3E%3Cbr%3E%3C%2Fspan%3E%3C%2Fp%3E', 'gouDan', '12', '2', '1', '0', '2020-05-29 11:48:00', null);
INSERT INTO `bbs_invitation` VALUES ('gouDan1590724143425', '%E6%80%8E%E4%B9%88%E6%8A%8A%E8%87%AA%E5%B7%B1%E6%94%B9%E4%B8%91%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+large%3B+color%3A+rgb%2877%2C+128%2C+191%29%3B%22%3E%E5%A4%AA%E5%B8%85%EF%BC%8C%E6%B2%A1%E6%B3%95%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cspan+style%3D%22font-size%3A+large%3B+color%3A+rgb%2877%2C+128%2C+191%29%3B%22%3E%E8%B0%81%E8%83%BD%E5%91%8A%E8%AF%89%E6%88%91%EF%BC%8CPS%E6%80%8E%E4%B9%88%E6%8A%8A%E8%87%AA%E5%B7%B1%E6%94%B9%E4%B8%91%E5%95%8A%EF%BC%8C%E5%A4%AA%E5%B8%85%EF%BC%8C%E9%83%BD%E4%B8%8D%E6%95%A2%E5%87%BA%E9%97%A8%E4%BA%86%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E', 'gouDan', '10', '7', '1', '0', '2020-05-29 11:49:03', null);
INSERT INTO `bbs_invitation` VALUES ('gouDan1590724168713', '%E4%BD%A0%E4%BB%AC%E6%89%93%E4%BB%80%E4%B9%88%E6%89%8B%E6%B8%B8%E5%91%A2%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+xx-large%3B%22%3E%E5%A6%82%E9%A2%98%EF%BC%81%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E', 'gouDan', '5', '4', '1', '0', '2020-05-29 11:49:29', null);
INSERT INTO `bbs_invitation` VALUES ('gouDan1590724202545', '%E6%80%8E%E4%B9%88%E4%B8%8A%E7%8E%8B%E8%80%85%EF%BC%81%EF%BC%81', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+xx-large%3B+color%3A+rgb%28123%2C+91%2C+161%29%3B%22%3E%E6%88%91%E5%A4%AA%E9%9A%BE%E4%BA%86%EF%BC%81%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E', 'gouDan', '5', '7', '2', '0', '2020-05-29 11:50:03', null);
INSERT INTO `bbs_invitation` VALUES ('zhangSan1590723811313', '%E6%96%B0%E5%86%A0%E7%97%85%E6%AF%92', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+large%3B%22%3E%E7%9C%9F%E7%9A%84%E5%BE%88%E5%8F%AF%E6%80%95%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cspan+style%3D%22font-size%3A+large%3B%22%3E%E6%88%91%E5%AE%81%E6%84%BF%E5%AE%85%E6%AD%BB%E5%AE%B6%E9%87%8C%EF%BC%8C%E9%83%BD%E4%B8%8D%E5%87%BA%E5%8E%BB%EF%BC%81%EF%BC%81%EF%BC%81%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft35%2Fstyle%2Fimages%2Fcommon%2Fface%2Fext%2Fnormal%2F7a%2Fshenshou_thumb.gif%22+alt%3D%22%5B%E8%8D%89%E6%B3%A5%E9%A9%AC%5D%22+data-w-e%3D%221%22+style%3D%22%22%3E%3C%2Fspan%3E%3C%2Fp%3E', 'zhangSan', '3', '6', '1', '0', '2020-05-29 11:43:31', null);
INSERT INTO `bbs_invitation` VALUES ('zhangSan1590723849794', '%E7%A7%91%E6%AF%94%E8%B5%B0%E5%A5%BD', '%3Cp%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+medium%3B%22%3E%E7%A7%91%E6%AF%94%E8%B5%B0%E4%BA%86%EF%BC%8C%E5%A4%AA%E7%AA%81%E7%84%B6%EF%BC%8C%E5%A5%BD%E9%9A%BE%E5%8F%97%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E', 'zhangSan', '4', '6', '1', '0', '2020-05-29 11:44:10', null);
INSERT INTO `bbs_invitation` VALUES ('zhangXiaoHua1590723665639', '%E5%8E%BB%E5%93%AA%E5%84%BF%E7%8E%A9%E5%A5%BD%E5%91%A2%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+x-large%3B+color%3A+rgb%28194%2C+79%2C+74%29%3B%22%3E%E4%BA%B2%E4%BB%AC%EF%BC%8C%E5%93%AA%E5%84%BF%E5%A5%BD%E7%8E%A9%E5%91%A2%EF%BC%9F%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22%2Fbbs_ssm%2Fstatics%2Ffile%2FzhangXiaoHua159072363115473.png%22+style%3D%22max-width%3A100%25%3B%22%3E%3Cimg+src%3D%22%2Fbbs_ssm%2Fstatics%2Ffile%2FzhangXiaoHua159072363115672.png%22+style%3D%22font-size%3A+12px%3B+max-width%3A+100%25%3B%22%3E%3Cspan+style%3D%22font-weight%3A+bold%3B+font-size%3A+x-large%3B+color%3A+rgb%28194%2C+79%2C+74%29%3B%22%3E%3Cbr%3E%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cspan+style%3D%22font-family%3A+%E9%BB%91%E4%BD%93%3B+font-size%3A+large%3B%22%3E%E8%AF%B7%E5%A4%A7%E5%AE%B6%E6%8F%90%E5%BB%BA%E8%AE%AE%EF%BC%8C%E8%B0%A2%E8%B0%A2%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F3c%2Fpcmoren_wu_org.png%22+alt%3D%22%5B%E6%B1%A1%5D%22+data-w-e%3D%221%22%3E%3Cspan+style%3D%22font-family%3A+%E9%BB%91%E4%BD%93%3B+font-size%3A+large%3B%22%3E%3Cbr%3E%3C%2Fspan%3E%3C%2Fp%3E', 'zhangXiaoHua', '2', '7', '1', '0', '2020-05-29 11:41:06', null);
INSERT INTO `bbs_invitation` VALUES ('zhangXiaoHua1590723754606', '%E9%83%BD%E6%B1%9F%E5%A0%B0%E6%97%85%E6%B8%B8%E6%94%BB%E7%95%A5', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+x-large%3B+color%3A+rgb%2870%2C+172%2C+200%29%3B%22%3E%E9%83%BD%E6%B1%9F%E5%A0%B0%E6%97%85%E6%B8%B8%EF%BC%8C%E5%A4%A7%E5%AE%B6%E5%8F%AA%E8%A6%81%E5%8E%BB%E6%88%90%E9%83%BD%E8%A5%BF%E7%AB%99%E5%9D%90%E5%8A%A8%E8%BD%A6%EF%BC%8C%E5%B0%B1%E5%8F%AF%E4%BB%A5%E7%9B%B4%E8%BE%BE%E5%93%A6%EF%BC%81%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F40%2Fpcmoren_tian_org.png%22+alt%3D%22%5B%E8%88%94%E5%B1%8F%5D%22+data-w-e%3D%221%22%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F50%2Fpcmoren_huaixiao_org.png%22+alt%3D%22%5B%E5%9D%8F%E7%AC%91%5D%22+data-w-e%3D%221%22+style%3D%22font-size%3A+12px%3B%22%3E%3Cspan+style%3D%22font-size%3A+x-large%3B+color%3A+rgb%2870%2C+172%2C+200%29%3B%22%3E%3Cbr%3E%3C%2Fspan%3E%3C%2Fp%3E', 'zhangXiaoHua', '2', '12', '1', '0', '2020-05-29 11:42:35', null);
INSERT INTO `bbs_invitation` VALUES ('zhangXiaoHua1590973482473', '%E6%88%91%E7%9A%84%E5%B0%8F%E7%8C%AB%E5%92%AA', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+large%3B+color%3A+rgb%2828%2C+72%2C+127%29%3B%22%3E%E6%88%91%E5%8F%AF%E7%88%B1%E7%9A%84%E5%B0%8F%E7%8C%AB%E5%92%AA%E9%9D%93%E7%85%A7%3C%2Fspan%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22%2Fbbs_ssm%2Fstatics%2Ffile%2FzhangXiaoHua159097347159579.png%22+style%3D%22max-width%3A100%25%3B%22%3E%3Cbr%3E%3C%2Fp%3E%3Cp%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F40%2Fpcmoren_tian_org.png%22+alt%3D%22%5B%E8%88%94%E5%B1%8F%5D%22+data-w-e%3D%221%22%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F40%2Fpcmoren_tian_org.png%22+alt%3D%22%5B%E8%88%94%E5%B1%8F%5D%22+data-w-e%3D%221%22+style%3D%22font-size%3A+12px%3B%22%3E%3Cimg+src%3D%22http%3A%2F%2Fimg.t.sinajs.cn%2Ft4%2Fappstyle%2Fexpression%2Fext%2Fnormal%2F40%2Fpcmoren_tian_org.png%22+alt%3D%22%5B%E8%88%94%E5%B1%8F%5D%22+data-w-e%3D%221%22+style%3D%22font-size%3A+12px%3B%22%3E%3Cbr%3E%3C%2Fp%3E', 'zhangXiaoHua', '2', '5', '1', '0', '2020-06-01 09:04:42', null);
INSERT INTO `bbs_invitation` VALUES ('zhangXiaoHua1590973568782', '%E4%BD%A0%E4%BB%AC%E5%96%9C%E6%AC%A2%E6%97%85%E6%B8%B8%E5%90%97%EF%BC%9F', '%3Cp%3E%3Cspan+style%3D%22font-size%3A+x-large%3B%22%3E%3Cspan+style%3D%22color%3A+rgb%2877%2C+128%2C+191%29%3B%22%3E%E5%96%9C%E6%AC%A2%E7%9A%84%E6%89%A31%EF%BC%9B%3C%2Fspan%3E%3Cspan+style%3D%22color%3A+rgb%28194%2C+79%2C+74%29%3B%22%3E%E4%B8%8D%E5%96%9C%E6%AC%A2%E7%9A%84%E6%89%A366121213131%EF%BC%81%EF%BC%81%EF%BC%81%3C%2Fspan%3E%3C%2Fspan%3E%3C%2Fp%3E', 'zhangXiaoHua', '2', '4', '1', '0', '2020-06-01 09:06:09', null);
INSERT INTO `bbs_level` VALUES ('5', '系统管理员');
INSERT INTO `bbs_level` VALUES ('6', '初级会员');
INSERT INTO `bbs_level` VALUES ('7', '中级会员');
INSERT INTO `bbs_level` VALUES ('8', '高级会员');
INSERT INTO `bbs_plate` VALUES ('1', 'Java', 'Java技术探讨，邀请各位大牛！', '0');
INSERT INTO `bbs_plate` VALUES ('2', '旅游', '旅游，是一件赏心悦目的事情！！！', '0');
INSERT INTO `bbs_plate` VALUES ('3', '新闻', '新闻纪要，实时更新', '0');
INSERT INTO `bbs_plate` VALUES ('4', '体育', '为了呈现最新的体育资讯', '0');
INSERT INTO `bbs_plate` VALUES ('5', '游戏', '游戏人生，竞争激烈', '1');
INSERT INTO `bbs_plate` VALUES ('6', 'ASP.NET', '微软企业级项目设计解决方案', '1');
INSERT INTO `bbs_plate` VALUES ('7', 'C++', '很稳的技术', '0');
INSERT INTO `bbs_plate` VALUES ('8', 'JavaScript', '前端，无所不能', '0');
INSERT INTO `bbs_plate` VALUES ('9', 'Node.JS', '没有后台，我就是后台', '0');
INSERT INTO `bbs_plate` VALUES ('10', 'PhotoShop', '你的美，我来改！', '0');
INSERT INTO `bbs_plate` VALUES ('11', '军事', '军迷们的小茶馆', '0');
INSERT INTO `bbs_plate` VALUES ('12', '国际', '不出门，知天下', '0');
INSERT INTO `bbs_plate` VALUES ('13', '知音', '好的沟通，是有益的桥梁', '0');
INSERT INTO `bbs_plate` VALUES ('14', '历史', '知过去，掌未来', '0');
INSERT INTO `bbs_user` VALUES ('admin', 'f379eaf3c831b04de153469d1bec345e', '系统管理员', null, '男', 'xxx.jpg', '0', '5', null, null, '2020-05-18', '0');
INSERT INTO `bbs_user` VALUES ('gouDan', 'f379eaf3c831b04de153469d1bec345e', '二狗子', 'ergouzi@qq.com', '男', 'xxx.jpg', '0', '6', null, null, '2020-05-29', '0');
INSERT INTO `bbs_user` VALUES ('wangWu', 'e10adc3949ba59abbe56e057f20f883e', '老王', 'laowang@qq.com', '男', 'xxx.jpg', '0', '6', null, null, '2020-05-25', '0');
INSERT INTO `bbs_user` VALUES ('zhangSan', 'f379eaf3c831b04de153469d1bec345e', '张三', '', '男', 'zhangSan15907126282528.png', '0', '8', '2020-07-26', null, '2020-05-22', '0');
INSERT INTO `bbs_user` VALUES ('zhangXiaoHua', 'f379eaf3c831b04de153469d1bec345e', '小花', '76gf@11.com', '女', 'zhangXiaoHua15904850058157.png', '0', '8', null, null, '2020-05-22', '0');
