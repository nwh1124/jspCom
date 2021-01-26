/*
SQLyog Community v13.1.7 (64 bit)
MySQL - 10.4.14-MariaDB : Database - jspCommunity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jspCommunity` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `jspCommunity`;

/*Table structure for table `article` */

DROP TABLE IF EXISTS `article`;

CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(100) NOT NULL,
  `body` longtext NOT NULL,
  `memberId` int(10) NOT NULL,
  `boardId` int(10) NOT NULL,
  `hitsCount` int(10) NOT NULL DEFAULT 0,
  `likesCount` int(10) NOT NULL DEFAULT 0,
  `commentsCount` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8mb4;

/*Data for the table `article` */

insert  into `article`(`id`,`regDate`,`updateDate`,`title`,`body`,`memberId`,`boardId`,`hitsCount`,`likesCount`,`commentsCount`) values 
(1,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목1','내용1',1,1,0,0,0),
(2,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목2','내용2',1,2,0,0,0),
(3,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목3','내용3',1,1,0,0,0),
(4,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목4','내용4',2,1,0,0,0),
(5,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목5','내용5',2,2,0,0,0),
(6,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목5','내용5',1,3,0,0,0),
(7,'2021-01-07 12:42:11','2021-01-07 12:42:11','제목5','내용5',2,3,0,0,0),
(8,'2021-01-07 19:05:34','2021-01-07 19:05:34','제목jsp','내용jsp',1,3,0,0,0),
(9,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a02ad-5ee8-11eb-b8e6-00d8614e419b','ed0a02b2-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(10,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a0318-5ee8-11eb-b8e6-00d8614e419b','ed0a031b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(11,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a0328-5ee8-11eb-b8e6-00d8614e419b','ed0a032b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(12,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a0337-5ee8-11eb-b8e6-00d8614e419b','ed0a0339-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(13,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a0345-5ee8-11eb-b8e6-00d8614e419b','ed0a0347-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(14,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a0353-5ee8-11eb-b8e6-00d8614e419b','ed0a0355-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(15,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a0360-5ee8-11eb-b8e6-00d8614e419b','ed0a0363-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(16,'2021-01-25 17:40:06','2021-01-25 17:40:06','ed0a036e-5ee8-11eb-b8e6-00d8614e419b','ed0a0370-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(24,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553435-5ee8-11eb-b8e6-00d8614e419b','f1553447-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(25,'2021-01-25 17:40:13','2021-01-25 17:40:13','f15534be-5ee8-11eb-b8e6-00d8614e419b','f15534c3-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(26,'2021-01-25 17:40:13','2021-01-25 17:40:13','f15534e3-5ee8-11eb-b8e6-00d8614e419b','f15534e8-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(27,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553505-5ee8-11eb-b8e6-00d8614e419b','f155350a-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(28,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553527-5ee8-11eb-b8e6-00d8614e419b','f155352c-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(29,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553547-5ee8-11eb-b8e6-00d8614e419b','f155354c-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(30,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553567-5ee8-11eb-b8e6-00d8614e419b','f155356d-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(31,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553587-5ee8-11eb-b8e6-00d8614e419b','f155358c-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(32,'2021-01-25 17:40:13','2021-01-25 17:40:13','f15535a6-5ee8-11eb-b8e6-00d8614e419b','f15535ac-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(33,'2021-01-25 17:40:13','2021-01-25 17:40:13','f15535c6-5ee8-11eb-b8e6-00d8614e419b','f15535cb-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(34,'2021-01-25 17:40:13','2021-01-25 17:40:13','f15535e6-5ee8-11eb-b8e6-00d8614e419b','f15535eb-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(35,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553606-5ee8-11eb-b8e6-00d8614e419b','f155360b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(36,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553626-5ee8-11eb-b8e6-00d8614e419b','f155362b-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(37,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553646-5ee8-11eb-b8e6-00d8614e419b','f155364b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(38,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553666-5ee8-11eb-b8e6-00d8614e419b','f155366b-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(39,'2021-01-25 17:40:13','2021-01-25 17:40:13','f1553685-5ee8-11eb-b8e6-00d8614e419b','f155368b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(55,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a612-5ee8-11eb-b8e6-00d8614e419b','f1a3a626-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(56,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a6a3-5ee8-11eb-b8e6-00d8614e419b','f1a3a6aa-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(57,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a6ca-5ee8-11eb-b8e6-00d8614e419b','f1a3a6d0-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(58,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a6ed-5ee8-11eb-b8e6-00d8614e419b','f1a3a6f2-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(59,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a70f-5ee8-11eb-b8e6-00d8614e419b','f1a3a714-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(60,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a730-5ee8-11eb-b8e6-00d8614e419b','f1a3a736-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(61,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a752-5ee8-11eb-b8e6-00d8614e419b','f1a3a757-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(62,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a774-5ee8-11eb-b8e6-00d8614e419b','f1a3a779-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(63,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a795-5ee8-11eb-b8e6-00d8614e419b','f1a3a79a-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(64,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a7b6-5ee8-11eb-b8e6-00d8614e419b','f1a3a7bb-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(65,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a7d7-5ee8-11eb-b8e6-00d8614e419b','f1a3a7dc-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(66,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a7f7-5ee8-11eb-b8e6-00d8614e419b','f1a3a7fd-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(67,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a818-5ee8-11eb-b8e6-00d8614e419b','f1a3a81d-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(68,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a838-5ee8-11eb-b8e6-00d8614e419b','f1a3a83e-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(69,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a859-5ee8-11eb-b8e6-00d8614e419b','f1a3a85e-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(70,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a87a-5ee8-11eb-b8e6-00d8614e419b','f1a3a87f-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(71,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a89a-5ee8-11eb-b8e6-00d8614e419b','f1a3a89f-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(72,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a8bb-5ee8-11eb-b8e6-00d8614e419b','f1a3a8c0-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(73,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a8db-5ee8-11eb-b8e6-00d8614e419b','f1a3a8e0-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(74,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a8fb-5ee8-11eb-b8e6-00d8614e419b','f1a3a901-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(75,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a91c-5ee8-11eb-b8e6-00d8614e419b','f1a3a921-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(76,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a93c-5ee8-11eb-b8e6-00d8614e419b','f1a3a942-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(77,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a95d-5ee8-11eb-b8e6-00d8614e419b','f1a3a962-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(78,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a97d-5ee8-11eb-b8e6-00d8614e419b','f1a3a983-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(79,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a99e-5ee8-11eb-b8e6-00d8614e419b','f1a3a9a3-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(80,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a9be-5ee8-11eb-b8e6-00d8614e419b','f1a3a9c3-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(81,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a9de-5ee8-11eb-b8e6-00d8614e419b','f1a3a9e4-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(82,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3a9ff-5ee8-11eb-b8e6-00d8614e419b','f1a3aa04-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(83,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3aa1f-5ee8-11eb-b8e6-00d8614e419b','f1a3aa24-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(84,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3aa3f-5ee8-11eb-b8e6-00d8614e419b','f1a3aa45-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(85,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3aa60-5ee8-11eb-b8e6-00d8614e419b','f1a3aa65-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(86,'2021-01-25 17:40:14','2021-01-25 17:40:14','f1a3aa80-5ee8-11eb-b8e6-00d8614e419b','f1a3aa85-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(118,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21033dc-5ee8-11eb-b8e6-00d8614e419b','f21033eb-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(119,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103447-5ee8-11eb-b8e6-00d8614e419b','f210344b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(120,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210345d-5ee8-11eb-b8e6-00d8614e419b','f2103461-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(121,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103472-5ee8-11eb-b8e6-00d8614e419b','f2103475-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(122,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103486-5ee8-11eb-b8e6-00d8614e419b','f210348a-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(123,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210349b-5ee8-11eb-b8e6-00d8614e419b','f210349e-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(124,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21034ae-5ee8-11eb-b8e6-00d8614e419b','f21034b1-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(125,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21034c1-5ee8-11eb-b8e6-00d8614e419b','f21034c4-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(126,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21034d5-5ee8-11eb-b8e6-00d8614e419b','f21034d8-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(127,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21034e8-5ee8-11eb-b8e6-00d8614e419b','f21034eb-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(128,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21034fb-5ee8-11eb-b8e6-00d8614e419b','f21034fe-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(129,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210350e-5ee8-11eb-b8e6-00d8614e419b','f2103511-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(130,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103521-5ee8-11eb-b8e6-00d8614e419b','f2103524-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(131,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103534-5ee8-11eb-b8e6-00d8614e419b','f2103538-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(132,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103548-5ee8-11eb-b8e6-00d8614e419b','f210354b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(133,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210355b-5ee8-11eb-b8e6-00d8614e419b','f210355e-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(134,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210356e-5ee8-11eb-b8e6-00d8614e419b','f2103571-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(135,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103581-5ee8-11eb-b8e6-00d8614e419b','f2103584-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(136,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103594-5ee8-11eb-b8e6-00d8614e419b','f2103597-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(137,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21035a7-5ee8-11eb-b8e6-00d8614e419b','f21035aa-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(138,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21035ba-5ee8-11eb-b8e6-00d8614e419b','f21035bd-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(139,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21035cd-5ee8-11eb-b8e6-00d8614e419b','f21035d0-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(140,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21035e0-5ee8-11eb-b8e6-00d8614e419b','f21035e3-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(141,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21035f3-5ee8-11eb-b8e6-00d8614e419b','f21035f6-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(142,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103606-5ee8-11eb-b8e6-00d8614e419b','f2103609-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(143,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103619-5ee8-11eb-b8e6-00d8614e419b','f210361c-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(144,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210362f-5ee8-11eb-b8e6-00d8614e419b','f2103632-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(145,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103642-5ee8-11eb-b8e6-00d8614e419b','f2103645-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(146,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103655-5ee8-11eb-b8e6-00d8614e419b','f2103658-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(147,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103668-5ee8-11eb-b8e6-00d8614e419b','f210366b-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(148,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210367b-5ee8-11eb-b8e6-00d8614e419b','f210367e-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(149,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210368e-5ee8-11eb-b8e6-00d8614e419b','f2103691-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(150,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21036a1-5ee8-11eb-b8e6-00d8614e419b','f21036a4-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(151,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21036b4-5ee8-11eb-b8e6-00d8614e419b','f21036b7-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(152,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21036c7-5ee8-11eb-b8e6-00d8614e419b','f21036ca-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(153,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21036da-5ee8-11eb-b8e6-00d8614e419b','f21036dd-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(154,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21036ed-5ee8-11eb-b8e6-00d8614e419b','f21036f0-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(155,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103700-5ee8-11eb-b8e6-00d8614e419b','f2103703-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(156,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103713-5ee8-11eb-b8e6-00d8614e419b','f2103716-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(157,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103726-5ee8-11eb-b8e6-00d8614e419b','f2103729-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(158,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103739-5ee8-11eb-b8e6-00d8614e419b','f210373c-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(159,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210374c-5ee8-11eb-b8e6-00d8614e419b','f210374f-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(160,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210375f-5ee8-11eb-b8e6-00d8614e419b','f2103762-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(161,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103773-5ee8-11eb-b8e6-00d8614e419b','f2103776-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(162,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103786-5ee8-11eb-b8e6-00d8614e419b','f2103789-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(163,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103799-5ee8-11eb-b8e6-00d8614e419b','f210379c-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(164,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21037ac-5ee8-11eb-b8e6-00d8614e419b','f21037af-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(165,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21037bf-5ee8-11eb-b8e6-00d8614e419b','f21037c2-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(166,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21037d2-5ee8-11eb-b8e6-00d8614e419b','f21037d5-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(167,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21037e5-5ee8-11eb-b8e6-00d8614e419b','f21037e8-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(168,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21037f8-5ee8-11eb-b8e6-00d8614e419b','f21037fb-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(169,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210380b-5ee8-11eb-b8e6-00d8614e419b','f210380e-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(170,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210381e-5ee8-11eb-b8e6-00d8614e419b','f2103821-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(171,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103831-5ee8-11eb-b8e6-00d8614e419b','f2103834-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(172,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103844-5ee8-11eb-b8e6-00d8614e419b','f2103847-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(173,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103857-5ee8-11eb-b8e6-00d8614e419b','f210385a-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(174,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210386a-5ee8-11eb-b8e6-00d8614e419b','f210386d-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(175,'2021-01-25 17:40:15','2021-01-25 17:40:15','f210387d-5ee8-11eb-b8e6-00d8614e419b','f2103880-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(176,'2021-01-25 17:40:15','2021-01-25 17:40:15','f2103890-5ee8-11eb-b8e6-00d8614e419b','f2103893-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(177,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21038a3-5ee8-11eb-b8e6-00d8614e419b','f21038a6-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0),
(178,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21038b6-5ee8-11eb-b8e6-00d8614e419b','f21038b9-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(179,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21038c9-5ee8-11eb-b8e6-00d8614e419b','f21038cc-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(180,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21038dc-5ee8-11eb-b8e6-00d8614e419b','f21038df-5ee8-11eb-b8e6-00d8614e419b',2,3,0,0,0),
(181,'2021-01-25 17:40:15','2021-01-25 17:40:15','f21038ef-5ee8-11eb-b8e6-00d8614e419b','f21038f2-5ee8-11eb-b8e6-00d8614e419b',1,3,0,0,0);

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `code` char(50) DEFAULT NULL,
  `name` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `board` */

insert  into `board`(`id`,`regDate`,`updateDate`,`memberId`,`code`,`name`) values 
(1,'2021-01-07 12:42:11','2021-01-07 12:42:11',0,'free','자유'),
(2,'2021-01-07 12:42:11','2021-01-07 12:42:11',0,'notice','공지사항'),
(3,'2021-01-07 12:42:11','2021-01-07 12:42:11',0,'guestBook','방명록');

/*Table structure for table `cMessage` */

DROP TABLE IF EXISTS `cMessage`;

CREATE TABLE `cMessage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `body` text NOT NULL,
  `senderMemberId` int(10) unsigned NOT NULL,
  `receiverMemberId` int(10) unsigned NOT NULL,
  `receiverDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `cMessage` */

/*Table structure for table `chatRoom` */

DROP TABLE IF EXISTS `chatRoom`;

CREATE TABLE `chatRoom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `title` char(100) NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `chatRoom` */

/*Table structure for table `chatRoomMsg` */

DROP TABLE IF EXISTS `chatRoomMsg`;

CREATE TABLE `chatRoomMsg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `chatRoomId` int(10) unsigned NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `chatRoomMsg` */

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `originalFileName` char(100) NOT NULL,
  `fileExt` char(50) NOT NULL,
  `typeCode` char(20) NOT NULL,
  `type2Code` char(20) NOT NULL,
  `fileSize` int(10) unsigned NOT NULL,
  `fileNo` int(10) unsigned NOT NULL,
  `fileDir` char(20) NOT NULL,
  `fileExtTypeCode` char(20) NOT NULL,
  `fileExtType2Code` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `file` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `loginId` char(50) NOT NULL,
  `loginPw` char(200) NOT NULL,
  `name` char(50) NOT NULL,
  `nickname` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `phoneNumber` char(50) NOT NULL,
  `authLever` tinyint(1) NOT NULL DEFAULT 2 COMMENT '0: 탈퇴 1: 정지: 2: 미인증 3: 인증 4: 관리자',
  `loginPwManage` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 : 미인증, 1 : 인증',
  `eamilAuth` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 : 미인증, 1 : 인증',
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginId` (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `member` */

insert  into `member`(`id`,`regDate`,`updateDate`,`loginId`,`loginPw`,`name`,`nickname`,`email`,`phoneNumber`,`authLever`,`loginPwManage`,`eamilAuth`) values 
(1,'2021-01-07 12:42:11','2021-01-07 12:42:11','user1','0a041b9462caa4a31bac3567e0b6e6fd9100787db2ab433d96f6d178cabfce90','김가나','가나초콜렛','nwh0716@gmail.com','',2,0,0),
(2,'2021-01-07 12:42:11','2021-01-07 12:42:11','user2','6025d18fe48abd45168528f18a82e265dd98d421a7084aa09f61b341703901a3','김다라','무구정광대다라니경','nwh0716@gmail.com','',2,0,0);

/*Table structure for table `recommend` */

DROP TABLE IF EXISTS `recommend`;

CREATE TABLE `recommend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `relType` char(50) NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `point` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `recommend` */

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regDate` datetime NOT NULL,
  `updateDate` datetime NOT NULL,
  `memberId` int(10) unsigned NOT NULL,
  `relType` char(50) NOT NULL,
  `relId` int(10) unsigned NOT NULL,
  `delDate` datetime DEFAULT NULL,
  `delStatus` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `reply` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
