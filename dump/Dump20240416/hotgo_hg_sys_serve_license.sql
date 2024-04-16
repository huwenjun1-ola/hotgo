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
-- Table structure for table `hg_sys_serve_license`
--

DROP TABLE IF EXISTS `hg_sys_serve_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_sys_serve_license` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '许可ID',
  `group` varchar(50) NOT NULL COMMENT '分组',
  `name` varchar(128) NOT NULL COMMENT '许可名称',
  `appid` varchar(64) NOT NULL COMMENT '应用ID',
  `secret_key` varchar(255) DEFAULT NULL COMMENT '应用秘钥',
  `remote_addr` varchar(64) DEFAULT NULL COMMENT '最后连接地址',
  `online_limit` int(11) DEFAULT '1' COMMENT '在线限制',
  `login_times` bigint(20) DEFAULT NULL COMMENT '登录次数',
  `last_login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_active_at` datetime DEFAULT NULL COMMENT '最后心跳',
  `routes` json DEFAULT NULL COMMENT '路由表，空使用默认分组路由',
  `allowed_ips` varchar(512) DEFAULT NULL COMMENT 'IP白名单',
  `end_at` datetime NOT NULL COMMENT '授权有效期',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统_服务许可证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_sys_serve_license`
--

LOCK TABLES `hg_sys_serve_license` WRITE;
/*!40000 ALTER TABLE `hg_sys_serve_license` DISABLE KEYS */;
INSERT INTO `hg_sys_serve_license` VALUES (1,'cron','定时任务','1002','hotgo','127.0.0.1:60752',1,179,'2024-04-10 16:24:34','2024-04-16 17:29:08',NULL,'127.0.0.1','2033-03-09 00:00:00','这是默认的定时任务TCP客户端授权凭证。',1,'2023-03-11 00:00:00','2024-04-16 17:29:08'),(2,'auth','授权服务','mengshuai','123456','127.0.0.1:50640',1,12,'2023-07-26 17:05:30','2023-07-26 17:07:01','[\"ExampleRPCHelloReq\", \"ExampleHelloReq\", \"AuthSummaryReq\"]','127.0.0.1','2033-03-09 00:00:00','这是一个测试的授权服务，可以为第三方平台提供授权支持。',1,'2023-03-11 00:00:00','2023-07-26 17:07:01');
/*!40000 ALTER TABLE `hg_sys_serve_license` ENABLE KEYS */;
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
