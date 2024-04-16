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
-- Table structure for table `hg_admin_notice_read`
--

DROP TABLE IF EXISTS `hg_admin_notice_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_admin_notice_read` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `clicks` int(11) DEFAULT '1' COMMENT '已读次数',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_id` (`notice_id`,`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='管理员_公告已读记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_admin_notice_read`
--

LOCK TABLES `hg_admin_notice_read` WRITE;
/*!40000 ALTER TABLE `hg_admin_notice_read` DISABLE KEYS */;
INSERT INTO `hg_admin_notice_read` VALUES (1,31,1,2,'2023-04-26 22:44:51','2023-04-25 22:59:16'),(2,30,1,20,'2023-08-11 16:07:34','2023-04-25 23:01:27'),(3,32,3,0,'2023-04-28 16:48:41','2023-04-28 16:48:41'),(4,29,3,4,'2023-08-11 14:42:22','2023-04-28 16:48:47'),(5,30,3,3,'2023-08-11 15:24:45','2023-04-28 16:48:47'),(6,29,1,1,'2023-08-11 16:07:58','2023-06-09 20:26:43'),(7,29,11,7,'2023-08-02 14:54:26','2023-08-02 14:54:16'),(8,30,8,0,'2023-08-02 14:59:21','2023-08-02 14:59:21'),(9,30,13,0,'2023-11-07 15:36:31','2023-11-07 15:36:31'),(10,29,13,0,'2023-11-07 16:36:51','2023-11-07 16:36:51'),(11,32,1,2,'2023-12-18 18:35:41','2023-12-18 17:46:23');
/*!40000 ALTER TABLE `hg_admin_notice_read` ENABLE KEYS */;
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
