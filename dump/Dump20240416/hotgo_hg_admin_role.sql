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
-- Table structure for table `hg_admin_role`
--

DROP TABLE IF EXISTS `hg_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_admin_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(32) NOT NULL COMMENT '角色名称',
  `key` varchar(128) NOT NULL COMMENT '角色权限字符串',
  `data_scope` tinyint(1) DEFAULT '1' COMMENT '数据范围',
  `custom_dept` json DEFAULT NULL COMMENT '自定义部门权限',
  `pid` bigint(20) DEFAULT '0' COMMENT '上级角色ID',
  `level` int(11) NOT NULL DEFAULT '1' COMMENT '关系树等级',
  `tree` varchar(512) DEFAULT NULL COMMENT '关系树',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '角色状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8 COMMENT='管理员_角色信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_admin_role`
--

LOCK TABLES `hg_admin_role` WRITE;
/*!40000 ALTER TABLE `hg_admin_role` DISABLE KEYS */;
INSERT INTO `hg_admin_role` VALUES (1,'超级管理员','super',1,'[]',0,1,NULL,'超级管理员，拥有全部权限',1,1,'2022-01-04 17:54:52','2023-01-12 00:00:00'),(2,'管理员','manage',3,'[]',1,2,'tr_1 ','普通管理员，拥有常规的后台管理权限',2,1,'2022-01-04 17:54:52','2023-04-27 00:00:00'),(200,'金牌代理商','gold_agent',7,'[]',2,3,'tr_1 tr_2 ','市场服务商，非企业内部的多级代理商角色',200,1,'2023-01-12 00:00:00','2023-08-11 15:55:46'),(201,'银牌代理商','silver_agent',7,'[]',200,4,'tr_1 tr_2 tr_200 ','',210,1,'2023-01-12 00:00:00','2023-08-11 15:55:46'),(202,'铜牌代理','copper_agent',5,'[]',201,5,'tr_1 tr_2 tr_200 tr_201 ','',220,1,'2023-01-12 11:20:02','2023-08-11 15:55:46'),(206,'财务部','finance',2,'[]',2,3,'tr_1 tr_2 ','',5,1,'2023-01-24 20:22:10','2023-08-11 15:55:46'),(207,'商务部','business',2,'[]',2,3,'tr_1 tr_2 ','',3,1,'2023-01-24 20:23:27','2023-08-11 15:55:46'),(208,'技术部','science',2,'[]',2,3,'tr_1 tr_2 ','',2,1,'2023-01-24 20:23:54','2023-08-11 15:55:46'),(209,'研发','dev',2,'[]',0,1,'','',0,1,'2023-11-03 15:39:07','2023-11-03 15:39:07');
/*!40000 ALTER TABLE `hg_admin_role` ENABLE KEYS */;
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
