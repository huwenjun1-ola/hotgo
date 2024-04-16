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
-- Table structure for table `hg_pay_log`
--

DROP TABLE IF EXISTS `hg_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_pay_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) DEFAULT '0' COMMENT '会员ID',
  `app_id` varchar(50) DEFAULT NULL COMMENT '应用ID',
  `addons_name` varchar(100) DEFAULT '' COMMENT '插件名称',
  `order_sn` varchar(64) DEFAULT '' COMMENT '关联订单号',
  `order_group` varchar(32) DEFAULT '' COMMENT '组别[默认统一支付类型]',
  `openid` varchar(50) DEFAULT '' COMMENT 'openid',
  `mch_id` varchar(20) DEFAULT '' COMMENT '商户支付账户',
  `subject` varchar(255) DEFAULT NULL COMMENT '订单标题',
  `detail` json DEFAULT NULL COMMENT '支付商品详情',
  `auth_code` varchar(50) DEFAULT '' COMMENT '刷卡码',
  `out_trade_no` varchar(128) DEFAULT '' COMMENT '商户订单号',
  `transaction_id` varchar(128) DEFAULT NULL COMMENT '交易号',
  `pay_type` varchar(32) NOT NULL COMMENT '支付类型',
  `pay_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `actual_amount` decimal(10,2) DEFAULT NULL COMMENT '实付金额',
  `pay_status` tinyint(4) DEFAULT '0' COMMENT '支付状态',
  `pay_at` datetime DEFAULT NULL COMMENT '支付时间',
  `trade_type` varchar(16) DEFAULT '' COMMENT '交易类型',
  `refund_sn` varchar(128) DEFAULT NULL COMMENT '退款单号',
  `is_refund` tinyint(4) DEFAULT '0' COMMENT '是否退款 ',
  `custom` text COMMENT '自定义参数',
  `create_ip` varchar(30) DEFAULT NULL COMMENT '创建者IP',
  `pay_ip` varchar(30) DEFAULT NULL COMMENT '支付者IP',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '支付通知回调地址',
  `return_url` varchar(255) DEFAULT NULL COMMENT '买家付款成功跳转地址',
  `trace_ids` json DEFAULT NULL COMMENT '链路ID集合',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付_支付日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_pay_log`
--

LOCK TABLES `hg_pay_log` WRITE;
/*!40000 ALTER TABLE `hg_pay_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `hg_pay_log` ENABLE KEYS */;
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
