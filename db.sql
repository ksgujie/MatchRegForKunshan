/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.6.16 : Database - baoming
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `items` */

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `group_id` (`group_id`),
  KEY `user_id` (`user_id`),
  KEY `created_at` (`created_at`),
  KEY `updated_at` (`updated_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `students` */

/*Table structure for table `sysconfigs` */

DROP TABLE IF EXISTS `sysconfigs`;

CREATE TABLE `sysconfigs` (
  `id` varchar(50) NOT NULL,
  `value` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sysconfigs` */

insert  into `sysconfigs`(`id`,`value`) values ('info_picture','http://');
insert  into `sysconfigs`(`id`,`value`) values ('siteClosed','2');
insert  into `sysconfigs`(`id`,`value`) values ('info','<center>\r\n<a style=\"FONT-size:24px\">昆山车模比赛报名</A>\r\n</center>\r\n注意：\r\n系统将2014年3月14日准时关闭，请及时完成报名');
insert  into `sysconfigs`(`id`,`value`) values ('siteCloseTime','2014-09-25 00:05:22');

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `teachers` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `leader` varchar(20) NOT NULL DEFAULT '',
  `address` varchar(200) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `diners` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `isadmin` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (1,'系统管理员','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'管理员','1');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (2,'﻿昆山高新区吴淞江学校（初中部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (3,'昆山开发区青阳港学校（初中部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (4,'昆山市兵希中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (5,'昆山市城北中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (6,'昆山市第二中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (7,'昆山市淀山湖中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (8,'昆山市费俊龙中学（初中部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (9,'昆山市葛江中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (10,'昆山市花桥中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (11,'昆山市锦溪中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (12,'昆山市娄江实验学校（初中部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (13,'昆山市陆家中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (14,'昆山市鹿峰初级中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (15,'昆山市蓬朗中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (16,'昆山市石牌中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (17,'昆山市石浦中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (18,'昆山市亭林中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (19,'昆山市新镇中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (20,'昆山市秀峰中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (21,'昆山市玉山中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (22,'昆山市张浦中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (23,'昆山市正仪中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (24,'昆山市周市中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (25,'昆山市周庄中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'初中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (26,'江苏省昆山中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','1','1','1',0,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (27,'昆山经济技术开发区高级中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (28,'昆山陆家高级中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (29,'昆山市第一中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','f','f','f',0,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (30,'昆山市费俊龙中学（高中部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (31,'昆山文峰高级中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (32,'昆山震川高级中学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','1','1','1',1,'高中','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (33,'昆山高新区美陆小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (34,'昆山高新区吴淞江学校（小学部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (35,'昆山花桥国际商务城花溪小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (36,'昆山经济技术开发区包桥小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (37,'昆山经济技术开发区实验小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','1','1','1',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (38,'昆山经济技术开发区中华园小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','1','1','1',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (39,'昆山经济开发区世茂小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (40,'昆山开发区晨曦小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (41,'昆山开发区青阳港学校（小学部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (42,'昆山开发区世茂蝶湖湾小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (43,'昆山市巴城中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (44,'昆山市柏庐实验小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (45,'昆山市城北高科园中心小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (46,'昆山市城北中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (47,'昆山市大市中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (48,'昆山市淀山湖中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (49,'昆山市花桥中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (50,'昆山市锦溪中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (51,'昆山市娄江实验学校（小学部）','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (52,'昆山市陆家中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (53,'昆山市南港中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (54,'昆山市培本实验小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (55,'昆山市蓬朗中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (56,'昆山市千灯镇炎武小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (57,'昆山市千灯中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (58,'昆山市石牌中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (59,'昆山市石浦中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (60,'昆山市实验小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (61,'昆山市新镇中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (62,'昆山市玉峰实验学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (63,'昆山市玉山镇朝阳小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (64,'昆山市玉山镇第三中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (65,'昆山市玉山镇第一中心小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (66,'昆山市玉山镇司徒街小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (67,'昆山市玉山镇同心小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (68,'昆山市玉山镇西塘小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (69,'昆山市玉山镇新城域小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (70,'昆山市玉山镇振华实验小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (71,'昆山市裕元实验学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (72,'昆山市张浦镇第二小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (73,'昆山市张浦镇周巷小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (74,'昆山市张浦中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (75,'昆山市正仪中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (76,'昆山市周市华城美地小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (77,'昆山市周市镇永平小学','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (78,'昆山市周市中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (79,'昆山市周庄中心小学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (80,'开发区中华园幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','形式提出。报名网址http://www.','形式提出。报名网址http://www.ksqsng.cn:88。','形式提出。报名网址http://www.',1,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (81,'昆山博顿幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','1','1','1',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (82,'昆山大公翔艺幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (83,'昆山淀山湖中心小学校花园幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (84,'昆山东方合丰幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (85,'昆山东方剑桥中城幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','3','3','3',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (86,'昆山高新区翰林幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (87,'昆山高新区鹿城幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (88,'昆山高新区美陆幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (89,'昆山高新区南星渎幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (90,'昆山高新区前进幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (91,'昆山高新区新华舍幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','00','00','00',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (92,'昆山国际学校附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (93,'昆山花桥曹安幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (94,'昆山花桥国际商务城花溪幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (95,'昆山花桥国际商务城聚福幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (96,'昆山花桥国际商务城鑫苑幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (97,'昆山经济技术开发区蓬欣幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (98,'昆山经济技术开发区世茂幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (99,'昆山开发区包桥小学附属美华幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (100,'昆山开发区晨曦小学夏驾幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (101,'昆山开发区晨曦小学幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (102,'昆山开发区东部新城幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (103,'昆山开发区世茂蝶湖湾小学幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (104,'昆山千灯中心小学校美景幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (105,'昆山三之三新城域幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (106,'昆山圣欣美德幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (107,'昆山市爱儿法幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (108,'昆山市巴城镇凤栖园幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','形式提出。报名网址http://www.','形式提出。报名网址http://www.ksqsng.cn:88。','形式提出。报名网址http://www.',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (109,'昆山市巴城中心校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (110,'昆山市柏庐幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (111,'昆山市城北富士康幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (112,'昆山市城北中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (113,'昆山市大市中心小学校附设幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (114,'昆山市淀山湖中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (115,'昆山市东方巴城幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (116,'昆山市东方幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (117,'昆山市枫景苑翔艺幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (118,'昆山市汉浦书香幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (119,'昆山市红峰幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (120,'昆山市花桥中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (121,'昆山市机关幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (122,'昆山市江南春晓幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (123,'昆山市锦华幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (124,'昆山市锦溪中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (125,'昆山市陆家好孩子幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (126,'昆山市陆杨中心校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (127,'昆山市南港中心小学附设幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (128,'昆山市蓬朗中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (129,'昆山市千灯镇浦园幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (130,'昆山市千灯镇少卿幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (131,'昆山市千灯镇淞南幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (132,'昆山市千灯中心校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (133,'昆山市仁宝幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (134,'昆山市三之三大德世家幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (135,'昆山市三之三幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (136,'昆山市圣欣幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (137,'昆山市石牌中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (138,'昆山市石浦中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (139,'昆山市实验幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (140,'昆山市实验幼儿园金谷园分园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (141,'昆山市实验幼儿园澞河苑分园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (142,'昆山市私立育英幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (143,'昆山市西塘街小学附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (144,'昆山市西湾幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (145,'昆山市西湾幼儿园富华分园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (146,'昆山市新镇中心小学附设幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (147,'昆山市星空艺术幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (148,'昆山市绣衣幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (149,'昆山市玉山镇北珊湾幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (150,'昆山市玉山镇朝阳幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (151,'昆山市玉山镇城北福娃幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (152,'昆山市玉山镇城中幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (153,'昆山市玉山镇城中幼儿园共青分园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (154,'昆山市玉山镇第三中心幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (155,'昆山市玉山镇第一中心小学校幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (156,'昆山市玉山镇司徒街小学附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (157,'昆山市玉山镇童心幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (158,'昆山市玉山镇振华实验小学附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (159,'昆山市裕元实验学校附设幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (160,'昆山市张浦镇第二幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (161,'昆山市张浦镇锦程幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (162,'昆山市张浦镇周巷小学附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (163,'昆山市张浦中心幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (164,'昆山市正仪中心小学附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (165,'昆山市周市镇光大幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (166,'昆山市周市中心小学校附属幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (167,'昆山市周庄镇中心幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (168,'昆山鑫茂幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (169,'昆山阳光圣杰幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (170,'昆山玉山镇童乐幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (171,'昆山周市宏盛幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (172,'昆山周市金澄幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (173,'昆山周市五丰幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (174,'中福会绿地昆山幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (175,'昆山国际学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'中小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (176,'昆山经济技术开发区国际学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'中小学','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (177,'江苏省昆山第二中等专业学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'中职','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (178,'江苏省昆山第一中等专业学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'中职','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (179,'昆山花桥国际商务城中等专业学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'中职','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (180,'苏州福纳影视艺术学校','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'中职','0');
insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`) values (181,'昆山市华城美地幼儿园','$2y$10$vURCVIpp20weWOpxGmZO9uvXtx/HDA17uZ3X4e8BQ8NslZgu2/LNm','','','',0,'幼儿园','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
