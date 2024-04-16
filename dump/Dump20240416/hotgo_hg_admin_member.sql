-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: 192.168.11.48    Database: hotgo
-- ------------------------------------------------------
-- Server version	5.7.40-0ubuntu0.18.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '300ca9ea-4369-11eb-a19a-00163e0879f0:1-7125653,
4491380c-5966-11ec-b318-005056afa0b8:1-8500511';

--
-- Table structure for table `hg_admin_member`
--

DROP TABLE IF EXISTS `hg_admin_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_admin_member` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `dept_id` bigint(20) DEFAULT '0' COMMENT '部门ID',
  `role_id` bigint(20) DEFAULT '10' COMMENT '角色ID',
  `real_name` varchar(32) DEFAULT '' COMMENT '真实姓名',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '帐号',
  `password_hash` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` char(16) NOT NULL COMMENT '密码盐',
  `password_reset_token` varchar(150) DEFAULT '' COMMENT '密码重置令牌',
  `integral` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '积分',
  `balance` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '余额',
  `avatar` char(150) DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性别',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `email` varchar(60) DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `city_id` bigint(20) DEFAULT '0' COMMENT '城市编码',
  `address` varchar(100) DEFAULT '' COMMENT '联系地址',
  `pid` bigint(20) NOT NULL COMMENT '上级管理员ID',
  `level` int(11) DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(512) NOT NULL COMMENT '关系树',
  `invite_code` varchar(12) DEFAULT NULL COMMENT '邀请码',
  `cash` json DEFAULT NULL COMMENT '提现配置',
  `last_active_at` datetime DEFAULT NULL COMMENT '最后活跃时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `invite_code` (`invite_code`),
  KEY `dept_id` (`dept_id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='管理员_用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_admin_member`
--

LOCK TABLES `hg_admin_member` WRITE;
/*!40000 ALTER TABLE `hg_admin_member` DISABLE KEYS */;
INSERT INTO `hg_admin_member` VALUES (1,100,1,'孟帅','admin','a7c588fffeb2c1d99b29879d7fe97c78','6541561','',89.00,99290.78,'http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png',1,'133814250','133814250@qq.com','15303830571','2016-04-16',410172,'莲花街001号',0,1,'','111','{\"name\": \"孟帅\", \"account\": \"15303830571\", \"payeeCode\": \"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdq8mqal5isvcb58g.jpg\"}','2024-04-16 17:29:11',NULL,1,'2021-02-12 17:59:45','2024-04-16 17:29:11'),(13,111,209,'研发','dev','f0050f11179368e6149860543122644e','XcBjhm','',0.00,0.00,'http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdq8er9nfkchdopav.png',1,'','','',NULL,0,'',1,2,'tr_1 ','7Cni2nSftvPv',NULL,'2024-04-12 11:27:13','',1,'2023-11-03 15:39:49','2024-04-12 11:27:13');
/*!40000 ALTER TABLE `hg_admin_member` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16 17:32:14
