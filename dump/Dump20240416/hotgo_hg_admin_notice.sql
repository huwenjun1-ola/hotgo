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
-- Table structure for table `hg_admin_notice`
--

DROP TABLE IF EXISTS `hg_admin_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_admin_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(64) NOT NULL COMMENT '公告标题',
  `type` bigint(20) NOT NULL COMMENT '公告类型',
  `tag` int(11) DEFAULT NULL COMMENT '标签',
  `content` longtext NOT NULL COMMENT '公告内容',
  `receiver` json DEFAULT NULL COMMENT '接收者',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '公告状态',
  `created_by` bigint(20) DEFAULT NULL COMMENT '发送人',
  `updated_by` bigint(20) DEFAULT '0' COMMENT '修改人',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='管理员_通知公告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_admin_notice`
--

LOCK TABLES `hg_admin_notice` WRITE;
/*!40000 ALTER TABLE `hg_admin_notice` DISABLE KEYS */;
INSERT INTO `hg_admin_notice` VALUES (29,'2023年春季学期开学工作通知！',1,1,'1.学生：2月11日、2月12日报到，2月13日起安排考试。\n\n2.教职工：2月10日（周五）起正式上班（2月11日、2月12日正常上班）。\n\n3.校内进行的各类社会服务项目，主办部门、单位须关注参与人员的健康状况，如有异常第一时间报告。感染后仍在康复期内的师生，不参加剧烈活动。开学后两周内，原则上不组织各类竞技性较强的体育比赛等活动。\n\n4.全校师生员工要牢固树立健康第一的观念，切实增强个人责任感和防护意识，掌握防护技能，坚持戴口罩、勤洗手等良好卫生习惯，加强身体锻炼，保持健康生活方式，提升健康素养和自我防护能力，当好自身健康第一责任人。符合条件的师生，积极有序接种第二剂次加强针疫苗。','null','',10,1,1,1,'2023-02-09 12:25:39','2023-02-09 12:48:08',NULL),(30,'国务院办公厅关于2023年部分节假日安排的通知',1,3,'新华社北京12月8日电  国务院办公厅关于2023年部分节假日安排的通知，全文如下：\n\n　　各省、自治区、直辖市人民政府，国务院\n\n　　各部委、各直属机构：\n\n　　经国务院批准，现将2023年元旦、春节、清明节、劳动节、端午节、中秋节和国庆节放假调休日期的具体安排通知如下。\n\n　　一、元旦：2022年12月31日至2023年1月2日放假调休，共3天。\n\n　　二、春节：1月21日至27日放假调休，共7天。1月28日（星期六）、1月29日（星期日）上班。\n\n　　三、清明节：4月5日放假，共1天。\n\n　　四、劳动节：4月29日至5月3日放假调休，共5天。4月23日（星期日）、5月6日（星期六）上班。\n\n　　五、端午节：6月22日至24日放假调休，共3天。6月25日（星期日）上班。\n\n　　六、中秋节、国庆节：9月29日至10月6日放假调休，共8天。10月7日（星期六）、10月8日（星期日）上班。\n\n　　节假日期间，各地区、各部门要妥善安排好值班和安全、保卫、疫情防控等工作，遇有重大突发事件，要按规定及时报告并妥善处置，确保人民群众祥和平安度过节日假期。','null','',20,1,1,1,'2023-02-09 12:32:32','2023-02-09 12:48:28',NULL),(31,'hotgo新版本发布啦！',2,4,'<p><img src=\"http://bufanyun.cn-bj.ufileos.com/hotgo/attachment/2023-02-09/cqdr8lj1mpl0eu0jpn.png\"></p><h2><br></h2><h2>本次更新内容如下：</h2><h2>1. 优化角色权限</h2><h2>2. 优化代码生成</h2><h2>3. ....</h2>','null','',30,1,1,0,'2023-02-09 12:45:17','2023-02-09 12:45:17','2023-06-09 18:04:30'),(32,'新的好友',3,5,'<p><strong>哈喽，你好呀！</strong></p>','[1, 3, 8]','',40,1,1,3,'2023-02-09 12:45:54','2023-08-11 15:19:04',NULL),(33,'1',2,0,'','null','',50,1,3,0,'2023-04-28 16:45:11','2023-04-28 16:45:11','2023-04-28 16:45:14'),(34,'1',1,0,'1','null','',50,1,3,0,'2023-04-28 16:45:22','2023-04-28 16:45:22','2023-04-28 16:45:26');
/*!40000 ALTER TABLE `hg_admin_notice` ENABLE KEYS */;
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

-- Dump completed on 2024-04-16 17:32:16
