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
-- Table structure for table `hg_game_route`
--

DROP TABLE IF EXISTS `hg_game_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_game_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factory_type` varchar(50) NOT NULL COMMENT '房型',
  `url` text NOT NULL COMMENT '游戏地址',
  `desc` text COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `factory_type_UNIQUE` (`factory_type`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_game_route`
--

LOCK TABLES `hg_game_route` WRITE;
/*!40000 ALTER TABLE `hg_game_route` DISABLE KEYS */;
INSERT INTO `hg_game_route` VALUES (1,'laya-ludo','http://172.19.45.30:8002/','飞行棋'),(2,'landlord','http://172.19.46.1:8900/bin/','斗地主'),(3,'laya-richman','http://172.19.186.6:8005/','大富翁'),(4,'laya-garden','http://172.19.186.5:8000/','花园'),(5,'laya-bigtwo','http://172.19.186.6:8009/','大老二'),(6,'laya-domino','http://172.19.186.6:8000/',''),(7,'laya-breakout','http://172.19.186.8:8000/',''),(8,'laya-tetris','http://172.19.46.3/tetris/','俄罗斯方块'),(9,'laya-carrom','http://172.19.46.1:8002/','撞球'),(10,'laya-sevens','http://172.19.186.8:8800/','排七'),(11,'laya-billiards','http://172.19.46.11:8900/bin/','桌球'),(12,'laya-dummy','http://172.19.186.19:81/',''),(13,'laya-dodgem','http://172.19.46.1:8003/',''),(14,'laya-truco','http://172.19.186.5:8900/bin/',''),(15,'laya-knife','http://172.19.46.1:8005/',''),(16,'cocos-tower-pk','http://172.19.186.9:8888/web-mobile/','塔防pk'),(17,'laya-wolf','http://172.19.46.5:8080/wolf3/','狼人杀'),(18,'laya-kittens','http://172.19.46.1:8004/',''),(19,'laya-chameleon','http://172.19.186.8:8700/',''),(20,'cocos-butt','http://172.19.46.9:809/',''),(21,'cocos-cubeboom','http://172.19.186.88:9999/cubeboom/','多人三消'),(22,'cocos-monopoly','http://172.19.46.9:802',''),(23,'laya-jackpot','http://172.19.16.107:803/',''),(24,'cocos-gobang','http://172.19.186.88:9999/gobang/','五子棋'),(25,'cocos-pet','http://172.19.186.88:9999/pet/','宠物'),(26,'laya-football','http://172.19.46.1:8002/','足球'),(27,'uno','http://172.19.186.88:9999/uno/',''),(28,'cocos-uno','http://172.19.186.88:9999/uno/',''),(29,'cocos-2048','http://172.19.186.88:9999/2048/','2048'),(30,'laya-mahjong-tw','http://172.19.16.24:8080/mahjong/','台湾麻将'),(31,'laya-wolf-guide','http://172.19.186.30:8003/',''),(32,'laya-teenpatti','http://172.19.16.62:8005/',''),(33,'/ps/laya-common.zip','http://172.19.46.9:8080/ludo_ps/ps_common.zip','ps公共包'),(34,'/ps/laya-ludo.zip','http://172.19.46.9:8080/ludo_ps/game.zip','ps飞行棋'),(35,'/ps/laya-carrom.zip','http://172.19.16.62:8009/laya-carrom.zip','ps撞球'),(36,'/ps/laya-billiards.zip','http://172.19.16.62:8009/laya-billiards.zip','ps桌球'),(37,'ps','raw','ps比较特殊，原包转发,不要删除本条'),(38,'cocos-homeland','http://172.19.16.107:805/',''),(39,'laya-ludo_room','http://172.19.46.9:808/','ps房间内ludo'),(40,'laya-carrom_room','http://172.19.46.1:8006/','ps房间内carrom'),(41,'laya-billiards_room','http://172.19.34.6:8001/','ps房间内billiards'),(42,'pg','raw','pg比较特殊，原包转发，不要删除本条'),(43,'/pg/laya-billiards.zip','http://172.19.46.1:8010/pg/laya-billiards.zip','pg桌球'),(44,'/pg/laya-carrom.zip','http://172.19.46.1:8010/pg/laya-carrom.zip','pg撞球'),(45,'/pg/laya-ludo.zip','http://172.19.46.1:8010/pg/laya-ludo.zip','pg飞行棋'),(46,'/pg/laya-common.zip','http://172.19.46.1:8010/pg/laya-common.zip','pg公共包'),(47,'laya-texas','http://172.19.47.165:8100/','德州'),(48,'cocos-uno_room','http://172.19.46.9:804/','ps-uno');
/*!40000 ALTER TABLE `hg_game_route` ENABLE KEYS */;
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

-- Dump completed on 2024-04-16 17:32:11
