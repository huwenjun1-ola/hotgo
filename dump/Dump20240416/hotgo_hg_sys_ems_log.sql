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
-- Table structure for table `hg_sys_ems_log`
--

DROP TABLE IF EXISTS `hg_sys_ems_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hg_sys_ems_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event` varchar(64) NOT NULL COMMENT '事件',
  `email` varchar(512) NOT NULL COMMENT '邮箱地址，多个用;隔开',
  `code` varchar(256) DEFAULT '' COMMENT '验证码',
  `times` bigint(20) NOT NULL COMMENT '验证次数',
  `content` longtext COMMENT '邮件内容',
  `ip` varchar(128) DEFAULT NULL COMMENT 'ip地址',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(1未验证,2已验证)',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统_邮件发送记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hg_sys_ems_log`
--

LOCK TABLES `hg_sys_ems_log` WRITE;
/*!40000 ALTER TABLE `hg_sys_ems_log` DISABLE KEYS */;
INSERT INTO `hg_sys_ems_log` VALUES (4,'bind','133814250@qq.com','8793',1,'<!doctype html>\r\n<html>\r\n<head>\r\n    <meta charset=\"utf-8\" />\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\r\n    <title>验证码邮件</title>\r\n    <style>\r\n        html,\r\n        body {\r\n            margin: 0 auto !important;\r\n            padding: 0 !important;\r\n            width: 100% !important;\r\n            font-family: sans-serif;\r\n            line-height: 1.4;\r\n            -webkit-font-smoothing: antialiased;\r\n            -ms-text-size-adjust: 100%;\r\n            -webkit-text-size-adjust: 100%;\r\n        }\r\n        * {\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n        table,\r\n        td {\r\n            mso-table-lspace: 0 !important;\r\n            mso-table-rspace: 0 !important;\r\n        }\r\n        img {\r\n            display: block;\r\n            border: none;\r\n            max-width: 100%;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n        a {\r\n            text-decoration: none;\r\n        }\r\n    </style>\r\n</head>\r\n<body\r\n        leftmargin=\"0\"\r\n        marginwidth=\"0\"\r\n        topmargin=\"0\"\r\n        marginheight=\"0\"\r\n        offset=\"0\"\r\n        width=\"100%\"\r\n        style=\"margin: 0; padding: 0 !important; mso-line-height-rule: exactly\"\r\n>\r\n<table\r\n        role=\"presentation\"\r\n        align=\"center\"\r\n        valign=\"top\"\r\n        border=\"0\"\r\n        cellpadding=\"0\"\r\n        cellspacing=\"0\"\r\n        height=\"100%\"\r\n        width=\"100%\"\r\n        style=\"border-spacing: 0;\r\n				border-collapse: collapse;\r\n				vertical-align: top;\r\n				padding: 0;\r\n				margin: 0;\r\n				width: 100%;\r\n				text-align: center;\"\r\n>\r\n    <tr>\r\n        <td align=\"center\" valign=\"top\">\r\n            <table\r\n                    role=\"presentation\"\r\n                    align=\"center\"\r\n                    border=\"0\"\r\n                    cellpadding=\"0\"\r\n                    cellspacing=\"0\"\r\n                    width=\"600\"\r\n                    bgcolor=\"#ffffff\"\r\n                    style=\"max-width: 600px;\r\n							border-spacing: 0;\r\n							border-collapse: collapse;\r\n							vertical-align: top;\r\n							padding: 0;\r\n							margin: 0;\r\n							width: 100%;\r\n							background: #ffffff;\"\r\n            >\r\n                <tr>\r\n                    <td height=40\" style=\"height:40px\"></td>\r\n                </tr>\r\n                <tr>\r\n                    <td align=\"center\" valign=\"top\">\r\n                        <table\r\n                                role=\"presentation\"\r\n                                align=\"center\"\r\n                                border=\"0\"\r\n                                cellpadding=\"0\"\r\n                                cellspacing=\"0\"\r\n                                width=\"440\"\r\n                                style=\"max-width: 440px;\r\n										border-spacing: 0;\r\n										border-collapse: collapse;\r\n										vertical-align: top;\r\n										padding: 0;\r\n										margin: 0;\r\n										width: 100%;\r\n										text-align: center;\"\r\n                        >\r\n                            <tr>\r\n                                <td align=\"center\">\r\n                                    <img\r\n                                            src=\"https://hotgo.facms.cn/attachment/2022-10-07/cnf9tml2ikirr1i6ss.png\"\r\n                                            width=\"170\"\r\n                                            style=\"border: none; display: block; max-width: 170px; width: 100%\"\r\n                                     alt=\"logo\">\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height=\"40\" style=\"height:40px\"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <h1\r\n                                            style=\"font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 24px;\r\n													color: #010E28;\r\n													font-weight: bold;\r\n													margin: 0 0 5px;\r\n													padding: 0\"\r\n                                    >\r\n                                        这是你发送的验证码吗？\r\n                                    </h1>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height=\"15\" style=\"height: 15px\"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style=\"font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 15px;\r\n													color: #5B6987;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\"\r\n                                    >\r\n                                        Windows 10 <br />\r\n                                        保留地址 (estimated) <br />\r\n                                        IP 地址: 127**.0.1\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height=\"30\" style=\"height: 30px\"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style=\"font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 15px;\r\n													color: #5B6987;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\r\n													font-weight: bold;\"\r\n                                    >\r\n                                        如果是，请输入验证码:\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height=\"20\" style=\"height: 20px\"></td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style=\"font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 35px;\r\n													color: #010E28;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\r\n													font-weight: bold;\"\r\n                                    >\r\n                                        8793\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td height=\"20\" style=\"height: 20px\">	</td>\r\n                            </tr>\r\n                            <tr>\r\n                                <td>\r\n                                    <p\r\n                                            style=\"font-family: Arial, Helvetica, sans-serif;\r\n													font-size: 15px;\r\n													color: #5B6987;\r\n													margin: 0;\r\n													padding: 0;\r\n													line-height: 20px;\r\n													font-weight: bold;\"\r\n                                    >\r\n                                        该验证码10分钟内有效，请不要告诉于他人！\r\n                                    </p>\r\n                                </td>\r\n                            </tr>\r\n                        </table>\r\n\r\n                    </td>\r\n                </tr>\r\n                <tr>\r\n                    <td height=\"40\" style=\"height:40px\"></td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n</body>\r\n</html>','39.165.245.100',2,'2023-02-04 16:49:39','2023-02-04 16:56:24');
/*!40000 ALTER TABLE `hg_sys_ems_log` ENABLE KEYS */;
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
