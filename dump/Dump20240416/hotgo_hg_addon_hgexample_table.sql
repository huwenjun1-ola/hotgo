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
-- Table structure for table `hg_addon_hgexample_table`
--

DROP TABLE IF EXISTS `hg_addon_hgexample_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_addon_hgexample_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `flag` json DEFAULT NULL COMMENT '标签',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `content` longtext NOT NULL COMMENT '内容',
  `image` varchar(255) DEFAULT NULL COMMENT '单图',
  `images` json DEFAULT NULL COMMENT '多图',
  `attachfile` varchar(255) DEFAULT NULL COMMENT '附件',
  `attachfiles` json DEFAULT NULL COMMENT '多附件',
  `map` json DEFAULT NULL COMMENT '动态键值对',
  `star` decimal(5,1) DEFAULT '0.0' COMMENT '推荐星',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` bigint(20) DEFAULT NULL COMMENT '浏览次数',
  `activity_at` date DEFAULT NULL COMMENT '活动时间',
  `start_at` datetime DEFAULT NULL COMMENT '开启时间',
  `end_at` datetime DEFAULT NULL COMMENT '结束时间',
  `switch` tinyint(1) DEFAULT NULL COMMENT '开关',
  `sort` int(11) NOT NULL COMMENT '排序',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `qq` varchar(20) DEFAULT '' COMMENT 'qq',
  `email` varchar(60) DEFAULT '' COMMENT '邮箱',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `hobby` json DEFAULT NULL COMMENT '爱好',
  `channel` int(11) NOT NULL DEFAULT '1' COMMENT '渠道',
  `city_id` bigint(20) DEFAULT '0' COMMENT '所在城市',
  `pid` bigint(20) NOT NULL COMMENT '上级ID',
  `level` int(11) DEFAULT '1' COMMENT '树等级',
  `tree` varchar(512) NOT NULL COMMENT '关系树',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_by` bigint(20) DEFAULT '0' COMMENT '创建者',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '更新者',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='插件_案例_表格';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_addon_hgexample_table`
--

LOCK TABLES `hg_addon_hgexample_table` WRITE;
/*!40000 ALTER TABLE `hg_addon_hgexample_table` DISABLE KEYS */;
INSERT INTO `hg_addon_hgexample_table` VALUES (1,1,'[1, 2]','测试标题','描述','<p>这是内容............</p>','http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqamvhlq4w3ki6bl.webp','[\"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqap5l9brk2lkavu.jpg\", \"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqaqua7fw8ukbbp5.jpg\"]','http://localhost:8000/attachment/2023-07-18/cu54ama4z54oejf5xx.mp3','[\"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqawg96ba4cuezvv.xlsx\", \"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqaup19k9oznyixz.doc\"]','[{\"key\": \"qwe\", \"value\": \"123\"}, {\"key\": \"asd\", \"value\": \"456\"}]',3.0,88.00,10,'2022-12-23','2022-12-01 00:00:00','2022-12-31 23:59:59',1,20,'',15,'133814250','133814250@qq.com','15303830571','[3, 2, 1]',1,140406,0,1,'','备注！',1,1,1,'2022-12-15 19:30:14','2023-07-18 20:05:45',NULL),(2,0,'[1]','测试2','描述','<h2><strong>不知道写点啥！</strong></h2><p><br></p><p><img src=\"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqbknawlkgdttuxl.png\"></p>','http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqbmxmtaq06gbnqa.jpeg','[\"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqborf529kf4cxbm.jpeg\"]','http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqawg96ba4cuezvv.xlsx','[\"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdqaup19k9oznyixz.doc\"]','{}',2.5,10.00,0,'2023-02-18',NULL,NULL,2,30,'',0,'','1561561@qq.com','15303830571','[2, 1]',3,140214,0,1,'','',1,1,1,'2023-02-06 14:17:11','2023-02-23 13:59:01',NULL);
/*!40000 ALTER TABLE `hg_addon_hgexample_table` ENABLE KEYS */;
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
