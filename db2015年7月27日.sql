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
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `sysconfigs` */

insert  into `sysconfigs`(`id`,`value`) values ('info_picture','http://'),('siteClosed','0'),('info','<center>\r\n<a style=\"FONT-size:24px\">2015年“放飞梦想”全国青少年纸飞机通讯赛<br>网上报名系统\r\n</A>\r\n</center>\r\n<div>\r\n注意：请先注册一个新帐号，注册好后登陆，按页面提示录入相关信息！有问题请联系 顾杰 电话 15506250512 QQ 37893522'),('siteCloseTime','2015-03-22 17:00:00');

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
  `boys` int(11) NOT NULL DEFAULT '0',
  `girls` int(11) NOT NULL DEFAULT '0',
  `adultmales` int(11) NOT NULL DEFAULT '0',
  `adultfemales` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`leader`,`address`,`tel`,`diners`,`type`,`isadmin`,`boys`,`girls`,`adultmales`,`adultfemales`) values (1,'系统管理员','$2y$10$Xe.BZe75ia3s1yDCLB36oe2K3Ke1tIFmJ8To5DGPpd5astyaHaW7W','','','',0,'管理员','1',0,0,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
