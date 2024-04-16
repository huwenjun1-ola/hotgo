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
-- Table structure for table `hg_admin_dept`
--

DROP TABLE IF EXISTS `hg_admin_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_admin_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `pid` bigint(20) DEFAULT '0' COMMENT '父部门ID',
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `code` varchar(255) DEFAULT NULL COMMENT '部门编码',
  `type` varchar(10) DEFAULT NULL COMMENT '部门类型',
  `leader` varchar(32) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `level` int(11) NOT NULL COMMENT '关系树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '部门状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COMMENT='后台_部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_admin_dept`
--

LOCK TABLES `hg_admin_dept` WRITE;
/*!40000 ALTER TABLE `hg_admin_dept` DISABLE KEYS */;
INSERT INTO `hg_admin_dept` VALUES (100,0,'hotgo','hotgo','','mengshuai','15303830571','133814250@qq.com',1,'',0,1,'2022-01-04 09:54:52','2023-05-29 15:08:32'),(101,100,'深圳总公司','shenzhen','company','hotgo','15888888888','hotgo@qq.com',2,'tr_100 ',1,1,'2022-01-04 17:54:52','2023-08-02 14:03:23'),(102,100,'市场服务商','chansgha','','hotgo','15888888888','hotgo@qq.com',2,'tr_100 ',2,1,'2022-01-04 01:54:52','2023-08-02 14:03:23'),(103,101,'研发部门','science','dept','hotgo','15888888888','hotgo@qq.com',3,'tr_100 tr_101 ',1,1,'2022-01-04 17:54:52','2023-08-02 14:03:31'),(105,101,'测试部门','test','dept','hotgo','15888888888','hotgo@qq.com',3,'tr_100 tr_101 ',3,1,'2022-01-04 17:54:52','2023-08-02 14:03:31'),(106,101,'财务部门','finance','dept','hotgo','15888888888','hotgo@qq.com',3,'tr_100 tr_101 ',4,1,'2022-01-04 17:54:52','2023-08-02 14:03:31'),(107,101,'运维部门','maintain','','hotgo','15888888888','hotgo@qq.com',3,'tr_100 tr_101 ',5,1,'2022-01-04 09:54:52','2023-08-02 14:03:31'),(108,102,'一级市场','market','dept','hotgo','15888888888','hotgo@qq.com',3,'tr_100 tr_102 ',1,1,'2022-01-04 17:54:52','2023-08-02 14:32:58'),(109,108,'二级市场','market2','dept','hotgo','','',4,'tr_100 tr_102 tr_108 ',0,1,'2023-08-02 14:29:23','2023-08-02 14:32:58'),(110,0,'房间游戏','RoomGame','','','','',1,'',0,1,'2023-11-03 15:27:25','2023-11-03 15:27:25'),(111,110,'研发部','Dev','','','','',2,'tr_110 ',0,1,'2023-11-03 15:33:21','2023-11-03 15:33:21');
/*!40000 ALTER TABLE `hg_admin_dept` ENABLE KEYS */;
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
