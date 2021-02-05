DROP DATABASE IF EXISTS jspCommunityReal;

CREATE DATABASE jspCommunityReal;

USE jspCommunityReal;

CREATE TABLE article(
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `title` CHAR(100) NOT NULL,
  `body` LONGTEXT NOT NULL,
  `memberId` INT(10) NOT NULL,
  `boardId` INT(10) NOT NULL,
  `hitsCount` INT(10) NOT NULL DEFAULT 0,
  `likesCount` INT(10) NOT NULL DEFAULT 0,
  `commentsCount` INT(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
);

CREATE TABLE `attr` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `relTypeCode` CHAR(50) NOT NULL,
  `relId` INT(10) UNSIGNED NOT NULL,
  `typeCode` CHAR(30) NOT NULL,
  `type2Code` CHAR(30) NOT NULL,
  `value` TEXT NOT NULL,
  `expireDate` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `relTypeCode` (`relTypeCode`),
  UNIQUE KEY `relId` (`relId`),
  UNIQUE KEY `typeCode` (`typeCode`),
  UNIQUE KEY `type2Code` (`type2Code`),
  KEY `relTypeCode_2` (`relTypeCode`,`typeCode`,`type2Code`)
);

CREATE TABLE `board` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `code` CHAR(50) DEFAULT NULL,
  `name` CHAR(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
);

INSERT  INTO `board`(`id`,`regDate`,`updateDate`,`memberId`,`code`,`name`) VALUES 
(1,'2021-01-07 12:42:11','2021-01-07 12:42:11',0,'free','자유'),
(2,'2021-01-07 12:42:11','2021-01-07 12:42:11',0,'notice','공지사항'),
(3,'2021-01-07 12:42:11','2021-01-07 12:42:11',0,'guestBook','방명록');

CREATE TABLE `cMessage` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `body` TEXT NOT NULL,
  `senderMemberId` INT(10) UNSIGNED NOT NULL,
  `receiverMemberId` INT(10) UNSIGNED NOT NULL,
  `receiverDate` DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `chatRoom` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `title` CHAR(100) NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `delDate` DATETIME DEFAULT NULL,
  `delStatus` INT(1) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `chatRoomMsg` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `chatRoomId` INT(10) UNSIGNED NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `body` TEXT NOT NULL,
  `delDate` DATETIME DEFAULT NULL,
  `delStatus` INT(1) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `file` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `originalFileName` CHAR(100) NOT NULL,
  `fileExt` CHAR(50) NOT NULL,
  `typeCode` CHAR(20) NOT NULL,
  `type2Code` CHAR(20) NOT NULL,
  `fileSize` INT(10) UNSIGNED NOT NULL,
  `fileNo` INT(10) UNSIGNED NOT NULL,
  `fileDir` CHAR(20) NOT NULL,
  `fileExtTypeCode` CHAR(20) NOT NULL,
  `fileExtType2Code` CHAR(20) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `member` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `loginId` CHAR(50) NOT NULL,
  `loginPw` CHAR(200) NOT NULL,
  `name` CHAR(50) NOT NULL,
  `nickname` CHAR(50) NOT NULL,
  `email` CHAR(50) NOT NULL,
  `phoneNumber` CHAR(50) NOT NULL,
  `authLever` INT(1) NOT NULL DEFAULT 2 COMMENT '0: 탈퇴 1: 정지: 2: 미인증 3: 인증 4: 관리자',
  `loginPwManage` INT(1) NOT NULL DEFAULT 0 COMMENT '0 : 미인증, 1 : 인증',
  `eamilAuth` INT(1) NOT NULL DEFAULT 0 COMMENT '0 : 미인증, 1 : 인증',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`)
);

INSERT  INTO `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`name`,`nickname`,`email`,`phoneNumber`,`authLever`,`loginPwManage`,`eamilAuth`) VALUES 
(1,'2021-02-03 10:46:48','2021-01-28 18:30:51','user1','0a041b9462caa4a31bac3567e0b6e6fd9100787db2ab433d96f6d178cabfce90','김가나','가나초콜렛','nwh0716@gmail.com','',2,0,0),
(2,'2021-01-28 19:30:19','2021-01-07 12:42:11','user2','6025d18fe48abd45168528f18a82e265dd98d421a7084aa09f61b341703901a3','김다라','무구정광대다라니경','nwh0716@gmail.com','123',2,0,0);

CREATE TABLE `recommend` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `relTypeCode` CHAR(50) NOT NULL,
  `relId` INT(10) UNSIGNED NOT NULL,
  `point` INT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
);

CREATE TABLE `reply` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `regDate` DATETIME NOT NULL,
  `updateDate` DATETIME NOT NULL,
  `memberId` INT(10) UNSIGNED NOT NULL,
  `relTypeCode` CHAR(50) NOT NULL,
  `relId` INT(10) UNSIGNED NOT NULL,
  `body` TEXT NOT NULL,
  `delDate` DATETIME DEFAULT NULL,
  `delStatus` INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);
