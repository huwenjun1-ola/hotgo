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
-- Table structure for table `hg_sys_dict_type`
--

DROP TABLE IF EXISTS `hg_sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_sys_dict_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典类型ID',
  `pid` bigint(20) NOT NULL COMMENT '父类字典类型ID',
  `name` varchar(100) DEFAULT '' COMMENT '字典类型名称',
  `type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '字典类型状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dict_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='系统_字典类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_sys_dict_type`
--

LOCK TABLES `hg_sys_dict_type` WRITE;
/*!40000 ALTER TABLE `hg_sys_dict_type` DISABLE KEYS */;
INSERT INTO `hg_sys_dict_type` VALUES (1,27,'用户性别','sys_user_sex',0,'用户性别列表',1,'2021-01-30 13:27:43','2021-03-24 11:38:47'),(2,28,'菜单状态','sys_show_hide',0,'',1,'2021-01-30 13:27:43','2023-02-26 00:46:18'),(3,28,'系统状态','sys_normal_disable',0,'系统状态列表',1,'2021-01-30 13:27:43',NULL),(4,26,'任务状态','sys_job_status',0,'任务状态列表',1,'2021-01-30 13:27:43',NULL),(5,26,'任务分组','sys_job_group',0,'任务分组列表',1,'2021-01-30 13:27:43',NULL),(7,29,'通知类型','sys_notice_type',0,'通知类型列表',1,'2021-01-30 13:27:43',NULL),(9,28,'操作类型','sys_oper_type',0,'',1,'2021-01-30 13:27:43','2023-02-26 00:48:01'),(22,25,'请求方式','sys_oper_method',0,'',1,'2022-01-24 11:33:16','2022-01-24 11:33:16'),(23,25,'请求状态码','req_code',0,'',1,'2022-01-25 10:22:40','2022-01-25 10:22:40'),(24,25,'请求耗时','req_take_up_time',0,'',1,'2022-01-25 15:51:19','2022-01-25 15:51:19'),(25,0,'请求枚举','req',40,'',1,'2022-01-24 11:33:16','2022-01-24 11:33:16'),(26,0,'任务枚举','job',30,'',1,'2022-01-24 11:33:16','2022-01-24 11:33:16'),(27,0,'组织枚举','org',20,'',1,'2022-01-24 11:33:16','2023-04-27 23:24:53'),(28,0,'系统枚举','sys',10,'',1,'2022-01-24 11:33:16','2023-02-26 00:33:13'),(29,0,'通知枚举','notice',50,'',1,'2022-01-24 11:33:16','2022-01-24 11:33:16'),(30,27,'用户爱好','sys_user_hobby',0,NULL,1,'2021-03-01 11:41:07','2021-03-01 11:41:07'),(31,27,'用户渠道','sys_user_channel',0,NULL,1,'2021-03-01 11:41:07','2021-03-01 11:41:07'),(32,0,'配置枚举','config',60,'',1,'2022-12-30 17:55:42','2023-05-29 14:47:01'),(33,32,'上传驱动','config_upload_drive',10,'',1,'2022-12-30 17:57:18','2022-12-30 17:57:18'),(34,28,'日志类型','sys_log_type',50,'',1,'2023-01-20 16:39:52','2023-02-24 17:40:45'),(35,32,'短信驱动','config_sms_drive',20,'',1,'2023-01-21 10:27:01','2023-01-21 10:27:01'),(36,32,'短信模板','config_sms_template',30,'',1,'2023-01-21 10:27:41','2023-01-21 10:27:41'),(37,29,'通知标签','sys_notice_tag',20,'',1,'2023-01-26 12:09:46','2023-01-26 12:09:46'),(38,32,'邮件模板','config_ems_template',40,'',1,'2023-02-04 12:53:07','2023-02-04 12:53:07');
/*!40000 ALTER TABLE `hg_sys_dict_type` ENABLE KEYS */;
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

-- Dump completed on 2024-04-16 17:32:15
