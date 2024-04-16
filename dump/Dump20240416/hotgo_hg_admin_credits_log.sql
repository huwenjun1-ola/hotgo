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
-- Table structure for table `hg_admin_credits_log`
--

DROP TABLE IF EXISTS `hg_admin_credits_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_admin_credits_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '变动ID',
  `member_id` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `app_id` varchar(64) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '应用id',
  `addons_name` varchar(100) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '插件名称',
  `credit_type` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '' COMMENT '变动类型',
  `credit_group` varchar(32) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '变动组别',
  `before_num` decimal(10,2) DEFAULT '0.00' COMMENT '变动前',
  `num` decimal(10,2) DEFAULT '0.00' COMMENT '变动数据',
  `after_num` decimal(10,2) DEFAULT '0.00' COMMENT '变动后',
  `remark` varchar(255) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '备注',
  `ip` varchar(20) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '操作人IP',
  `map_id` bigint(20) DEFAULT '0' COMMENT '关联ID',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员_资产变动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_admin_credits_log`
--

LOCK TABLES `hg_admin_credits_log` WRITE;
/*!40000 ALTER TABLE `hg_admin_credits_log` DISABLE KEYS */;
INSERT INTO `hg_admin_credits_log` VALUES (1,1,'admin','','balance','apply_cash',99391.78,-100.00,99291.78,'后台申请提现','127.0.0.1',1,0,'2023-05-29 14:16:57','2023-05-29 14:16:57'),(2,1,'admin','','balance','op_incr',99291.78,-1.00,99290.78,'为后台用户:8 操作增加余额:1','127.0.0.1',0,0,'2023-07-06 17:17:39','2023-07-06 17:17:39'),(3,8,'admin','','balance','incr',3.22,1.00,4.22,'后台用户:1 为你操作增加余额:1','127.0.0.1',0,0,'2023-07-06 17:17:39','2023-07-06 17:17:39');
/*!40000 ALTER TABLE `hg_admin_credits_log` ENABLE KEYS */;
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

-- Dump completed on 2024-04-16 17:32:13
