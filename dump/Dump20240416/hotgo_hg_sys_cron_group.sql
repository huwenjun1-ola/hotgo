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
-- Table structure for table `hg_sys_cron_group`
--

DROP TABLE IF EXISTS `hg_sys_cron_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_sys_cron_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务分组ID',
  `pid` bigint(20) NOT NULL COMMENT '父类任务分组ID',
  `name` varchar(100) DEFAULT '' COMMENT '分组名称',
  `is_default` tinyint(1) DEFAULT '0' COMMENT '是否默认',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '分组状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统_定时任务分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_sys_cron_group`
--

LOCK TABLES `hg_sys_cron_group` WRITE;
/*!40000 ALTER TABLE `hg_sys_cron_group` DISABLE KEYS */;
INSERT INTO `hg_sys_cron_group` VALUES (1,0,'系统默认',1,0,'这是系统默认的任务分组，无法删除！',1,'2021-02-25 17:38:07','2021-02-25 19:32:57'),(2,0,'测试',0,0,'这是测试任务分组',1,NULL,'2023-05-29 14:59:39');
/*!40000 ALTER TABLE `hg_sys_cron_group` ENABLE KEYS */;
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

-- Dump completed on 2024-04-16 17:32:12
