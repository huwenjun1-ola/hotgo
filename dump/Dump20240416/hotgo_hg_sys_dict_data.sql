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
-- Table structure for table `hg_sys_dict_data`
--

DROP TABLE IF EXISTS `hg_sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_sys_dict_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典数据ID',
  `label` varchar(100) DEFAULT NULL COMMENT '字典标签',
  `value` varchar(100) DEFAULT NULL COMMENT '字典键值',
  `value_type` varchar(255) NOT NULL DEFAULT 'string' COMMENT '键值数据类型：string,int,uint,bool,datetime,date',
  `type` varchar(100) DEFAULT NULL COMMENT '字典类型',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT '2' COMMENT '是否为系统默认',
  `sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `dict_data_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='系统_字典数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_sys_dict_data`
--

LOCK TABLES `hg_sys_dict_data` WRITE;
/*!40000 ALTER TABLE `hg_sys_dict_data` DISABLE KEYS */;
INSERT INTO `hg_sys_dict_data` VALUES (1,'男','1','int','sys_user_sex','success',1,10,'性别男',1,'2021-01-30 13:27:43','2023-04-27 23:24:58'),(2,'女','2','int','sys_user_sex','warning',1,20,'性别女',1,'2021-01-30 13:27:43','2023-01-06 09:45:21'),(3,'保密','3','int','sys_user_sex','error',1,30,'性别保密',1,'2021-01-30 13:27:43','2023-01-06 09:45:18'),(4,'显示','2','int','sys_show_hide','primary',1,10,'显示菜单',1,'2021-01-30 13:27:43','2023-01-18 09:52:59'),(5,'隐藏','1','int','sys_show_hide','error',1,20,'隐藏菜单',1,'2021-01-30 13:27:43','2023-01-18 09:52:56'),(6,'正常','1','int','sys_normal_disable','success',1,10,'正常状态',1,'2021-01-30 13:27:43','2023-01-18 09:52:44'),(7,'停用','2','int','sys_normal_disable','warning',1,20,'停用状态',1,'2021-01-30 13:27:43','2023-01-18 09:52:48'),(8,'正常','1','int','sys_job_status','primary',1,10,'正常状态',1,'2021-01-30 13:27:43','2023-01-18 09:53:48'),(9,'暂停','2','int','sys_job_status','error',1,20,'停用状态',1,'2021-01-30 13:27:43','2023-01-18 09:53:53'),(10,'默认','DEFAULT','string','sys_job_group','',1,10,'默认分组',1,'2021-01-30 13:27:43',NULL),(11,'系统','SYSTEM','string','sys_job_group','',1,20,'系统分组',1,'2021-01-30 13:27:43',NULL),(14,'通知','1','int','sys_notice_type','warning',1,10,'通知',1,'2021-01-30 13:27:43','2023-01-05 20:06:47'),(15,'公告','2','int','sys_notice_type','error',1,20,'公告',1,'2021-01-30 13:27:43','2023-01-26 12:08:52'),(18,'新增','1','int','sys_oper_type','info',0,10,'新增操作',1,'2021-01-30 13:27:43',NULL),(19,'修改','2','int','sys_oper_type','info',0,20,'修改操作',1,'2021-01-30 13:27:43',NULL),(20,'删除','3','int','sys_oper_type','error',0,30,'删除操作',1,'2021-01-30 13:27:43',NULL),(21,'授权','4','int','sys_oper_type','primary',0,40,'授权操作',1,'2021-01-30 13:27:43',NULL),(22,'导出','5','int','sys_oper_type','warning',0,50,'导出操作',1,'2021-01-30 13:27:43',NULL),(23,'导入','6','int','sys_oper_type','warning',0,60,'导入操作',1,'2021-01-30 13:27:43',NULL),(24,'强退','7','int','sys_oper_type','error',0,70,'强退操作',1,'2021-01-30 13:27:43',NULL),(25,'生成代码','8','int','sys_oper_type','warning',0,80,'生成操作',1,'2021-01-30 13:27:43',NULL),(26,'清空数据','9','int','sys_oper_type','error',0,90,'清空操作',1,'2021-01-30 13:27:43',NULL),(28,'校验','11','int','sys_oper_type',NULL,0,110,'校验',1,'2021-10-04 22:40:50','2021-10-04 22:50:02'),(80,'查询','10','int','sys_oper_type',NULL,0,100,'查询',1,'2021-10-04 22:37:38','2021-10-04 22:49:32'),(88,'GET','GET','string','sys_oper_method','',0,10,'',1,'2022-01-25 10:16:46','2022-01-25 10:16:46'),(89,'POST','POST','string','sys_oper_method','',0,20,'',1,'2022-01-25 10:16:54','2022-01-25 10:16:54'),(90,'请求失败','-1','int','req_code','warning',0,20,'通用错误码',1,'2022-01-25 10:23:34','2023-01-06 09:58:17'),(91,'请求成功','0','int','req_code','success',0,10,'通用成功码',1,'2022-01-25 10:23:54','2023-01-06 09:58:14'),(92,'内部发生错误','50','int','req_code','error',0,30,'内部错误',1,'2022-01-25 10:24:06','2023-01-06 09:56:31'),(95,'不允许的操作','59','int','req_code','error',0,60,'当前操作的给定参数无效',1,'2022-01-25 10:24:38','2023-01-06 09:56:00'),(103,'没有授权登录','61','int','req_code','warning',0,140,'未授权',1,'2022-01-25 10:26:12','2023-01-06 09:55:50'),(109,'业务验证失败','300','int','req_code','warning',0,200,'业务验证失败',1,'2022-01-25 10:27:51','2023-01-06 09:56:51'),(110,'大于50ms','50','int64','req_take_up_time','success',0,10,'',1,'2022-01-25 15:51:45','2023-01-06 09:59:50'),(111,'大于100ms','100','int64','req_take_up_time','success',0,20,'',1,'2022-01-25 15:51:57','2023-01-06 09:59:53'),(112,'大于200ms','200','int64','req_take_up_time','info',0,30,'',1,'2022-01-25 15:52:21','2023-01-06 09:59:57'),(113,'大于500ms','500','int64','req_take_up_time','warning',0,40,'',1,'2022-01-25 15:52:32','2023-01-06 10:00:02'),(114,'大于1000ms','1000','int64','req_take_up_time','error',0,50,'',1,'2022-01-25 15:52:57','2023-01-06 10:00:06'),(115,'大于5000ms','5000','int64','req_take_up_time','error',0,60,'',1,'2022-01-24 23:54:15','2023-01-06 10:00:10'),(116,'开启','1','string','sys_switch','info',1,10,'系统开关开启',1,'2021-01-30 13:27:43','2022-12-27 00:00:00'),(117,'关闭','0','string','sys_switch','warning',1,10,'系统开关关闭',1,'2021-01-30 13:27:43','2022-12-27 00:00:00'),(118,'PC端','1','int','sys_user_channel','info',0,80,'用户来源',1,'2021-01-30 13:27:43','2023-01-05 17:01:21'),(119,'移动端','2','int','sys_user_channel','success',0,80,'用户来源',1,'2021-01-30 13:27:43','2023-01-05 16:52:48'),(120,'微信','3','int','sys_user_channel','warning',0,80,'用户来源',1,'2021-01-30 13:27:43','2023-01-05 16:52:43'),(121,'抖音','4','int','sys_user_channel','error',0,80,'用户来源',1,'2021-01-30 13:27:43','2023-01-05 16:52:39'),(122,'音乐','1','int','sys_user_hobby','error',0,80,'爱好类型',1,'2021-01-30 13:27:43','2023-01-06 09:45:11'),(123,'读书','2','int','sys_user_hobby','info',0,80,'爱好类型',1,'2021-01-30 13:27:43','2023-01-06 09:45:08'),(124,'游泳','3','int','sys_user_hobby','warning',0,80,'爱好类型',1,'2021-01-30 13:27:43','2023-01-06 09:45:05'),(125,'本地存储','local','string','config_upload_drive','info',1,10,'',1,'2022-12-30 17:57:50','2023-01-06 10:02:31'),(126,'ucloud','ucloud','string','config_upload_drive','success',1,20,'',1,'2022-12-30 17:58:26','2022-12-30 17:58:26'),(127,'DEBU','DEBU','string','sys_log_type','default',0,10,'',1,'2023-01-20 16:56:23','2023-01-20 16:56:23'),(128,'INFO','INFO','string','sys_log_type','info',0,20,'',1,'2023-01-20 16:56:34','2023-01-20 16:56:34'),(129,'WARN','WARN','string','sys_log_type','warning',0,30,'',1,'2023-01-20 16:56:47','2023-01-20 16:56:47'),(130,'ERRO','ERRO','string','sys_log_type','error',0,50,'',1,'2023-01-20 16:57:01','2023-01-20 16:57:01'),(131,'PANI','PANI','string','sys_log_type','error',0,60,'',1,'2023-01-20 16:57:23','2023-01-20 16:57:23'),(132,'FATA','FATA','string','sys_log_type','error',0,70,'',1,'2023-01-20 16:57:37','2023-01-20 16:57:37'),(133,'阿里云','aliyun','string','config_sms_drive','success',0,10,'',1,'2023-01-21 10:27:59','2023-01-21 10:27:59'),(134,'腾讯云','tencent','string','config_sms_drive','info',0,20,'',1,'2023-01-21 10:28:23','2023-01-21 10:28:23'),(135,'通用验证码','code','string','config_sms_template','info',0,10,'',1,'2023-01-21 10:28:39','2023-01-21 20:40:09'),(136,'登录','login','string','config_sms_template','success',0,20,'',1,'2023-01-21 10:28:48','2023-01-21 10:28:48'),(137,'注册','register','string','config_sms_template','warning',0,30,'',1,'2023-01-21 10:28:58','2023-01-21 10:28:58'),(138,'重置密码','resetPwd','string','config_sms_template','error',0,40,'',1,'2023-01-21 10:29:10','2023-01-21 10:29:10'),(139,'绑定手机号','bind','string','config_sms_template','info',0,50,'',1,'2023-01-21 10:29:22','2023-01-21 10:29:22'),(140,'申请提现','cash','string','config_sms_template','primary',0,60,'',1,'2023-01-21 10:29:36','2023-01-21 10:29:40'),(141,'私信','3','int','sys_notice_type','info',0,30,'',1,'2023-01-26 12:08:42','2023-01-26 12:08:42'),(142,'一般','1','int','sys_notice_tag','info',0,10,'',1,'2023-01-26 12:13:04','2023-01-26 12:16:07'),(143,'重要','2','int','sys_notice_tag','error',0,20,'',1,'2023-01-26 12:13:36','2023-01-26 12:13:36'),(144,'提醒','3','int','sys_notice_tag','warning',0,30,'',1,'2023-01-26 12:13:52','2023-01-26 12:13:52'),(145,'注意','4','int','sys_notice_tag','success',0,40,'',1,'2023-01-26 12:14:12','2023-01-26 12:14:12'),(146,'调试','5','int','sys_notice_tag','default',0,50,'',1,'2023-01-26 12:15:59','2023-01-26 12:15:59'),(147,'通用验证码','code','string','config_ems_template','info',0,10,'',1,'2023-01-21 10:28:39','2023-01-21 20:40:09'),(148,'登录','login','string','config_ems_template','success',0,20,'',1,'2023-01-21 10:28:48','2023-01-21 10:28:48'),(149,'注册','register','string','config_ems_template','warning',0,30,'',1,'2023-01-21 10:28:58','2023-01-21 10:28:58'),(150,'重置密码','resetPwd','string','config_ems_template','error',0,40,'',1,'2023-01-21 10:29:10','2023-01-21 10:29:10'),(151,'绑定手机号','bind','string','config_ems_template','info',0,50,'',1,'2023-01-21 10:29:22','2023-01-21 10:29:22'),(152,'申请提现','cash','string','config_ems_template','primary',0,60,'',1,'2023-01-21 10:29:36','2023-01-21 10:29:40'),(153,'富文本','text','string','config_ems_template','default',0,0,'自定义编辑邮件内容时使用',1,'2023-01-21 10:29:36','2023-05-29 14:30:49'),(154,'腾讯云','cos','string','config_upload_drive','info',1,30,'',1,'2022-12-30 17:58:26','2022-12-30 17:58:26'),(155,'阿里云','oss','string','config_upload_drive','info',1,40,'',1,'2022-12-30 17:58:26','2022-12-30 17:58:26'),(156,'七牛云','qiniu','string','config_upload_drive','success',1,50,'',1,'2022-12-30 17:58:26','2022-12-30 17:58:26');
/*!40000 ALTER TABLE `hg_sys_dict_data` ENABLE KEYS */;
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
