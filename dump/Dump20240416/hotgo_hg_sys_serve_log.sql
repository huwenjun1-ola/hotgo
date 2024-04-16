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
-- Table structure for table `hg_sys_serve_log`
--

DROP TABLE IF EXISTS `hg_sys_serve_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_sys_serve_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `trace_id` varchar(50) DEFAULT NULL COMMENT '链路ID',
  `level_format` varchar(32) DEFAULT NULL COMMENT '日志级别',
  `content` text COMMENT '日志内容',
  `stack` json DEFAULT NULL COMMENT '打印堆栈',
  `line` varchar(255) NOT NULL COMMENT '调用行',
  `trigger_ns` bigint(20) DEFAULT NULL COMMENT '触发时间(ns)',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `member_id` (`level_format`),
  KEY `traceid` (`trace_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='系统_服务日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_sys_serve_log`
--

LOCK TABLES `hg_sys_serve_log` WRITE;
/*!40000 ALTER TABLE `hg_sys_serve_log` DISABLE KEYS */;
INSERT INTO `hg_sys_serve_log` VALUES (32,'c89ee4940e10941769c77e4fd6248c19','ERRO','','[\"1.  hotgo/internal/logic/middleware.parseResponse\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/response.go:93\", \"2.  hotgo/internal/logic/middleware.responseJson\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/response.go:63\", \"3.  hotgo/internal/logic/middleware.(*sMiddleware).ResponseHandler\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/response.go:40\", \"4.  hotgo/internal/logic/middleware.(*sMiddleware).PreFilter\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/pre_filter.go:89\", \"5.  hotgo/internal/logic/middleware.(*sMiddleware).Blacklist\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/limit_blacklist.go:15\", \"6.  hotgo/internal/logic/middleware.(*sMiddleware).CORS\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/init.go:92\", \"7.  hotgo/internal/logic/middleware.(*sMiddleware).Ctx\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/init.go:72\", \"\"]','/Users/huwenjun1/goworkspace/hotgo/server/internal/logic/middleware/response.go:93',1699000614305492000,1,'2023-11-03 16:36:56','2023-11-03 16:36:56'),(33,'139436b804ee9417d7a0dd059fe41cef','ERRO','','[\"1.  hotgo/utility/simple.Logf\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:114\", \"2.  hotgo/utility/simple.SafeGo.func2\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:94\", \"3.  hotgo/internal/cmd.glob..func5\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/cmd/http.go:31\", \"4.  hotgo/internal/cmd.glob..func3.1\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/cmd/cmd.go:61\", \"5.  hotgo/utility/simple.SafeGo.func1\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:92\", \"\"]','/Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:114',1699244663510695611,1,'2023-11-06 12:24:36','2023-11-06 12:24:36'),(34,'8b23e91c20ee9417683c660c05c4ed80','PANI','','[\"1.  hotgo/internal/library/casbin.InitEnforcer\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/library/casbin/enforcer.go:42\", \"2.  hotgo/internal/cmd.glob..func5\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/cmd/http.go:81\", \"3.  hotgo/internal/cmd.glob..func3.1\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/cmd/cmd.go:61\", \"4.  hotgo/utility/simple.SafeGo.func1\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:92\", \"\"]','/Users/huwenjun1/goworkspace/hotgo/server/internal/library/casbin/enforcer.go:42',1699244781162385854,1,'2023-11-06 12:26:23','2023-11-06 12:26:23'),(35,'8b23e91c20ee9417683c660c05c4ed80','ERRO','','[\"1.  hotgo/utility/simple.Logf\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:114\", \"2.  hotgo/utility/simple.SafeGo.func2\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:94\", \"3.  hotgo/internal/library/casbin.InitEnforcer\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/library/casbin/enforcer.go:42\", \"4.  hotgo/internal/cmd.glob..func5\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/cmd/http.go:81\", \"5.  hotgo/internal/cmd.glob..func3.1\", \"    /Users/huwenjun1/goworkspace/hotgo/server/internal/cmd/cmd.go:61\", \"6.  hotgo/utility/simple.SafeGo.func1\", \"    /Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:92\", \"\"]','/Users/huwenjun1/goworkspace/hotgo/server/utility/simple/simple.go:114',1699244781164862212,1,'2023-11-06 12:26:23','2023-11-06 12:26:23');
/*!40000 ALTER TABLE `hg_sys_serve_log` ENABLE KEYS */;
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
