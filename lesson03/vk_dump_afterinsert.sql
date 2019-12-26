-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (14,'culpa'),(3,'cum'),(8,'dolore'),(20,'dolores'),(9,'et'),(6,'eum'),(10,'exercitationem'),(1,'laboriosam'),(2,'molestiae'),(18,'possimus'),(16,'provident'),(11,'qui'),(17,'quia'),(4,'quis'),(7,'quo'),(13,'sunt'),(19,'suscipit'),(5,'tempora'),(12,'ut'),(15,'voluptas');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`community_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,1),(1,21),(1,41),(1,61),(1,81),(2,2),(2,22),(2,42),(2,62),(2,82),(3,3),(3,23),(3,43),(3,63),(3,83),(4,4),(4,24),(4,44),(4,64),(4,84),(5,5),(5,25),(5,45),(5,65),(5,85),(6,6),(6,26),(6,46),(6,66),(6,86),(7,7),(7,27),(7,47),(7,67),(7,87),(8,8),(8,28),(8,48),(8,68),(8,88),(9,9),(9,29),(9,49),(9,69),(9,89),(10,10),(10,30),(10,50),(10,70),(10,90),(11,11),(11,31),(11,51),(11,71),(11,91),(12,12),(12,32),(12,52),(12,72),(12,92),(13,13),(13,33),(13,53),(13,73),(13,93),(14,14),(14,34),(14,54),(14,74),(14,94),(15,15),(15,35),(15,55),(15,75),(15,95),(16,16),(16,36),(16,56),(16,76),(16,96),(17,17),(17,37),(17,57),(17,77),(17,97),(18,18),(18,38),(18,58),(18,78),(18,98),(19,19),(19,39),(19,59),(19,79),(19,99),(20,20),(20,40),(20,60),(20,80),(20,100);
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `user_id` int(10) unsigned NOT NULL,
  `friend_id` int(10) unsigned NOT NULL,
  `status` enum('requested','confirmed','interrupted') NOT NULL,
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `confirmed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (1,78,'interrupted','1981-10-21 17:08:59','2011-03-31 00:29:51'),(2,73,'interrupted','1992-05-07 14:44:33','1981-03-08 13:08:44'),(3,37,'confirmed','1977-10-02 23:49:36','1971-08-23 01:42:48'),(4,64,'interrupted','1981-01-17 17:32:22','1997-02-22 15:07:53'),(5,24,'confirmed','2019-11-20 21:11:12','1983-04-11 01:19:42'),(6,64,'interrupted','2005-03-15 11:47:01','1992-11-01 00:55:11'),(7,45,'confirmed','2012-08-02 02:13:21','2002-05-31 10:02:19'),(8,78,'interrupted','2015-12-10 09:36:20','2007-11-10 21:48:44'),(9,55,'interrupted','1998-09-01 14:23:46','1998-04-14 15:59:03'),(10,21,'interrupted','2015-09-06 07:27:11','1980-05-04 14:27:41'),(11,92,'confirmed','1998-11-08 20:53:10','1983-11-01 03:17:33'),(12,48,'requested','1993-10-14 23:48:42','1984-06-14 15:09:39'),(13,16,'confirmed','1998-03-20 15:01:45','1981-10-13 03:43:14'),(14,15,'confirmed','1971-10-18 19:42:55','1987-05-12 13:54:05'),(15,82,'interrupted','1972-01-30 12:21:59','1994-01-14 13:05:13'),(16,100,'requested','1996-05-02 11:07:03','1971-06-10 00:08:38'),(17,100,'requested','1991-10-24 21:21:44','1971-06-19 20:45:17'),(18,18,'confirmed','1977-01-13 18:29:41','1976-10-17 04:39:22'),(19,27,'requested','1987-04-28 12:03:16','1976-02-21 02:48:03'),(20,61,'interrupted','1978-01-12 04:40:37','2013-03-26 22:36:31'),(21,90,'interrupted','2017-12-27 21:46:19','1978-09-01 02:40:15'),(22,76,'requested','1992-11-12 07:17:57','2017-07-14 11:30:29'),(23,32,'confirmed','2007-05-30 02:48:06','2009-04-21 14:50:21'),(24,20,'requested','1982-01-10 13:01:38','2001-02-23 07:40:23'),(25,69,'interrupted','2009-10-19 01:40:19','1978-08-02 00:55:26'),(26,16,'confirmed','2000-01-04 19:51:30','2016-05-26 17:52:42'),(27,31,'confirmed','1994-09-02 03:46:08','1985-05-08 02:19:22'),(28,10,'interrupted','2007-01-17 03:34:57','1979-12-10 07:54:37'),(29,53,'confirmed','2013-07-30 13:17:24','2008-05-02 19:22:42'),(30,4,'confirmed','1977-05-02 10:07:50','1980-04-17 20:16:24'),(31,47,'requested','1986-11-23 13:21:46','1986-01-02 07:23:04'),(32,40,'confirmed','2013-12-19 01:42:17','1978-11-19 01:42:37'),(33,53,'confirmed','2000-06-15 01:01:08','1988-03-14 03:21:02'),(34,27,'requested','2009-03-28 19:17:58','1977-11-30 01:36:12'),(35,35,'interrupted','2014-07-21 03:24:01','2015-10-17 10:14:36'),(36,55,'confirmed','2018-02-07 03:06:43','1974-08-03 11:33:48'),(37,72,'confirmed','2013-12-07 11:20:13','1997-03-31 07:25:29'),(38,42,'requested','1991-10-17 04:33:14','2003-11-19 16:28:49'),(39,61,'confirmed','1982-05-05 14:21:30','1981-10-11 22:50:43'),(40,99,'interrupted','1987-07-08 23:12:04','1995-09-13 13:36:36'),(41,49,'requested','2012-12-12 18:11:03','1995-02-18 05:23:36'),(42,86,'interrupted','1992-01-18 09:33:29','1970-08-02 04:17:56'),(43,47,'confirmed','1994-01-03 10:38:11','1976-11-17 19:41:11'),(44,100,'requested','2000-10-30 02:58:06','1994-04-23 17:48:54'),(45,48,'requested','1991-07-08 15:50:34','1970-11-28 10:53:50'),(46,95,'interrupted','1989-05-06 20:27:57','2015-02-11 08:05:51'),(47,37,'interrupted','1984-11-24 13:28:22','2004-08-07 19:24:09'),(48,60,'interrupted','1974-02-13 19:18:24','1982-02-22 04:13:38'),(49,81,'confirmed','1994-08-29 05:59:28','1985-05-14 11:54:46'),(50,92,'confirmed','2013-01-16 17:24:03','2008-07-24 05:57:58'),(51,72,'requested','2000-10-20 06:42:45','1999-07-14 12:30:12'),(52,55,'requested','2013-01-05 06:21:21','2013-01-25 19:50:36'),(53,25,'confirmed','1973-03-09 13:15:20','1981-09-14 11:31:34'),(54,89,'interrupted','2005-02-13 06:11:01','2012-11-27 10:00:53'),(55,52,'requested','1999-03-17 10:16:50','2006-12-06 15:57:49'),(56,29,'confirmed','2009-02-21 11:09:55','2012-05-24 12:10:39'),(57,10,'requested','1972-09-20 06:39:52','2010-09-24 11:39:38'),(58,47,'confirmed','1985-12-10 11:46:24','2017-02-20 04:03:00'),(59,47,'confirmed','1993-08-18 05:59:43','1988-05-06 04:07:08'),(60,91,'requested','2015-08-09 22:49:12','2009-07-31 03:44:16'),(61,25,'requested','1995-02-10 03:21:27','1983-05-14 15:59:09'),(62,6,'interrupted','2007-07-03 16:33:32','2019-01-25 15:06:25'),(63,10,'requested','1990-05-03 07:24:02','1970-12-05 04:49:44'),(64,60,'confirmed','2017-01-17 19:02:17','2009-07-30 01:20:15'),(65,83,'interrupted','1978-03-20 23:42:51','1970-12-17 18:46:47'),(66,91,'confirmed','1987-08-27 03:16:32','2006-02-06 14:37:51'),(67,13,'confirmed','1974-04-04 01:14:20','1970-07-12 13:17:35'),(68,38,'requested','2007-01-15 18:09:39','1993-10-29 19:10:44'),(69,65,'interrupted','1987-02-26 15:05:24','1975-06-16 06:00:47'),(70,58,'requested','2006-08-28 13:51:10','2016-08-04 20:22:42'),(71,94,'requested','2012-11-25 16:34:08','1980-04-10 18:15:36'),(72,71,'interrupted','2008-06-08 14:53:19','1991-05-31 07:18:57'),(73,84,'interrupted','2016-06-11 06:31:52','2017-02-10 07:31:51'),(74,65,'interrupted','2014-12-19 01:05:44','1985-06-11 05:56:48'),(75,16,'requested','1973-09-26 12:53:38','1991-09-25 10:59:19'),(76,43,'confirmed','2010-02-15 06:43:37','1984-06-14 00:12:25'),(77,15,'interrupted','2006-06-11 05:23:12','1999-08-29 00:28:16'),(78,99,'requested','2008-08-31 16:56:34','1971-04-27 18:09:25'),(79,58,'requested','1991-03-09 16:53:09','2018-06-27 18:17:47'),(80,21,'confirmed','1975-12-31 22:35:05','2013-07-06 02:48:03'),(81,54,'requested','1981-12-27 22:00:21','1974-07-29 19:39:29'),(82,39,'confirmed','1975-04-22 06:21:55','1997-02-03 17:19:03'),(83,16,'interrupted','2012-06-22 11:02:47','2013-08-18 20:59:11'),(84,98,'interrupted','1990-08-01 21:14:54','1984-05-30 15:41:42'),(85,72,'requested','1974-12-26 11:15:46','2014-11-28 11:35:51'),(86,3,'confirmed','2014-11-05 18:01:42','1982-11-28 18:52:16'),(87,11,'interrupted','1992-10-11 05:16:00','1990-09-27 09:15:28'),(88,9,'interrupted','1983-08-02 13:37:33','1978-07-11 03:11:32'),(89,8,'interrupted','2019-01-08 19:42:47','2000-04-11 09:10:44'),(90,74,'interrupted','2003-12-07 18:49:35','2001-02-12 23:36:58'),(91,68,'interrupted','1992-04-16 16:02:57','2003-12-22 16:59:07'),(92,24,'confirmed','2001-09-12 14:47:14','2013-09-10 22:11:02'),(93,59,'interrupted','2005-04-12 09:06:22','1990-04-19 23:00:10'),(94,33,'interrupted','1994-07-02 19:18:17','1979-05-30 17:57:24'),(95,59,'confirmed','1985-03-27 04:20:50','1992-06-05 04:42:30'),(96,38,'requested','1977-07-21 23:35:20','2015-07-09 18:44:06'),(97,16,'requested','2001-06-25 01:29:08','1992-06-24 12:41:49'),(98,22,'interrupted','2001-04-04 04:30:04','1994-07-28 08:34:14'),(99,67,'requested','1987-04-10 07:06:22','1974-09-25 11:31:19'),(100,60,'interrupted','1980-04-29 16:41:22','2010-03-26 03:25:56');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `metadata` json DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,'/1764bc7777926151a849a00471cfe767.jpg','{\"type-photo\": \"avatat\"}','2014-08-24 18:09:21','2000-12-09 06:38:49'),(2,2,2,'/f51ff40505d7932edac71d73d09b7a01.jpg','{\"type-photo\": \"avatat\"}','1981-03-10 15:28:43','1992-04-09 06:19:12'),(3,3,3,'/43e956a7d2efef2bd9414db12dc90e3e.jpg','{\"type-photo\": \"avatat\"}','1978-06-07 10:04:20','2007-09-06 01:32:07'),(4,4,4,'/3d0f094cdc14658d2bc2a330c45c8ada.jpg','{\"type-photo\": \"avatat\"}','1987-08-08 20:08:44','1980-03-29 08:25:47'),(5,1,5,'/4f7e7156e1a0151acb53570c9dbc65c9.jpg','{\"type-photo\": \"avatat\"}','2005-03-11 15:41:57','1981-09-17 01:06:03'),(6,2,6,'/c790136020237c903a6da5756312bcdc.jpg','{\"type-photo\": \"avatat\"}','1989-07-27 17:55:06','1981-10-23 19:36:48'),(7,3,7,'/358657b2e6540c8481489814553d215e.jpg','{\"type-photo\": \"avatat\"}','1994-01-08 17:32:16','1985-12-02 13:14:55'),(8,4,8,'/26a2906461b6c3dfe7f3e8e2dfc8dcf1.jpg','{\"type-photo\": \"avatat\"}','2018-07-06 00:39:55','2004-05-17 19:03:27'),(9,1,9,'/16135b8fd85742be6e53129705b01379.jpg','{\"type-photo\": \"avatat\"}','2014-12-03 10:39:31','2011-08-24 11:33:41'),(10,2,10,'/41b915d3d37efc6f53b06c34a461f5d7.jpg','{\"type-photo\": \"avatat\"}','2018-07-26 02:23:00','1979-12-23 10:54:11'),(11,3,11,'/df1469541a88c99fdb6a5d9225f47696.jpg','{\"type-photo\": \"avatat\"}','1986-06-21 11:39:25','1984-01-23 23:49:21'),(12,4,12,'/b22cdfb06283a32c076eddc30abc871b.jpg','{\"type-photo\": \"avatat\"}','1985-04-19 07:29:54','2011-11-09 10:48:53'),(13,1,13,'/a89a0fcae6b6f2ef7a626da8dfcef42a.jpg','{\"type-photo\": \"avatat\"}','1979-12-15 21:08:30','2006-05-04 13:53:40'),(14,2,14,'/36dd35e92c61c5ea2013c9e4761fefc4.jpg','{\"type-photo\": \"avatat\"}','1974-10-06 09:43:54','2019-03-02 20:31:14'),(15,3,15,'/a4c0480c07d6a2848e9460c1cd3856ad.jpg','{\"type-photo\": \"avatat\"}','1996-05-29 19:31:48','2001-05-06 16:10:31'),(16,4,16,'/71755f43dd2b6689e5a18ad849898b68.jpg','{\"type-photo\": \"avatat\"}','1990-02-25 10:21:20','1970-08-19 11:57:45'),(17,1,17,'/952343408c854f2e1a91f077e1ee32cc.jpg','{\"type-photo\": \"avatat\"}','1980-09-04 13:04:44','2013-09-24 20:23:00'),(18,2,18,'/1e457981ad1b0935f969be09e7e82660.jpg','{\"type-photo\": \"avatat\"}','1983-11-22 22:44:12','1991-01-19 19:18:38'),(19,3,19,'/c74a2136c57aec08ee20aca270d0c1fc.jpg','{\"type-photo\": \"avatat\"}','2006-02-20 10:00:30','2013-12-11 05:17:31'),(20,4,20,'/15f6c348fb0c769ae9da856efa77eab8.jpg','{\"type-photo\": \"avatat\"}','1976-10-01 06:22:47','1992-04-08 06:34:35'),(21,1,21,'/8099d43c06d2f5bb1689e52fc4841cba.jpg','{\"type-photo\": \"avatat\"}','1980-12-14 20:26:53','2008-02-04 06:14:02'),(22,2,22,'/1a15d60a8b829cad0369692c5945b221.jpg','{\"type-photo\": \"avatat\"}','2009-04-11 07:27:13','1987-07-05 03:50:50'),(23,3,23,'/541940ff57de0f3b166a0eb03b99f952.jpg','{\"type-photo\": \"avatat\"}','2004-10-28 00:19:13','2010-07-22 10:31:43'),(24,4,24,'/840e3f86454716766e8a819d5672a71f.jpg','{\"type-photo\": \"avatat\"}','2011-09-11 21:10:25','1982-02-27 19:39:29'),(25,1,25,'/3ca2bbf6863f9a7ae16cb744d2a47c27.jpg','{\"type-photo\": \"avatat\"}','2008-01-15 06:31:21','1982-10-16 06:37:16'),(26,2,26,'/bfcb1aeb96378959e7d797d5794f27b6.jpg','{\"type-photo\": \"avatat\"}','1998-04-15 11:07:58','2012-06-04 16:53:01'),(27,3,27,'/f7e03d08f593e5705297e84d637a31b8.jpg','{\"type-photo\": \"avatat\"}','1982-10-02 11:06:28','1995-09-02 15:25:19'),(28,4,28,'/bce730da2b42c695c66ed9f922edbb59.jpg','{\"type-photo\": \"avatat\"}','1997-05-03 09:18:01','1995-04-19 05:45:05'),(29,1,29,'/4ca5a618db1f21fefc5da455b4af7d93.jpg','{\"type-photo\": \"avatat\"}','2014-09-25 01:13:31','1986-08-06 14:45:17'),(30,2,30,'/120738dc06ce6029ed5d9d12377af91a.jpg','{\"type-photo\": \"avatat\"}','1989-11-26 12:01:44','2001-06-27 13:05:09'),(31,3,31,'/c4bebd553a4d049c686f7a30f6cfe9e3.jpg','{\"type-photo\": \"avatat\"}','2012-03-30 02:41:15','2019-05-25 14:18:49'),(32,4,32,'/1e52a284db2ec8bc6d04f16b1381052f.jpg','{\"type-photo\": \"avatat\"}','1980-06-01 23:53:58','2013-07-31 13:06:29'),(33,1,33,'/33598e3ae9324b4fc71b6c73c274f7ac.jpg','{\"type-photo\": \"avatat\"}','1998-04-09 13:44:01','1975-05-25 15:13:25'),(34,2,34,'/027bab6248fb897481676826ad13e393.jpg','{\"type-photo\": \"avatat\"}','2007-12-12 11:17:11','1971-05-24 19:40:31'),(35,3,35,'/d7c5b8d0a6ec6f394732a1a50cfe5a52.jpg','{\"type-photo\": \"avatat\"}','2000-07-17 17:00:14','2018-06-01 06:54:58'),(36,4,36,'/71c65a037fd72a4ce2dc19e57609e857.jpg','{\"type-photo\": \"avatat\"}','2009-01-25 18:42:29','1994-11-20 01:43:47'),(37,1,37,'/f2c7396038e56b46887891c3de0cb3ba.jpg','{\"type-photo\": \"avatat\"}','1992-05-14 13:58:06','1985-01-26 10:51:48'),(38,2,38,'/01af34c889cc357713c28a0884cf770f.jpg','{\"type-photo\": \"avatat\"}','2012-05-30 06:12:55','1995-12-27 23:12:10'),(39,3,39,'/c11cb41170c97517b5f6ceda02e83536.jpg','{\"type-photo\": \"avatat\"}','1999-01-31 01:04:45','1983-06-18 01:43:38'),(40,4,40,'/e044c38bb498a1730fd52066d52b66ea.jpg','{\"type-photo\": \"avatat\"}','1982-09-27 08:49:04','1991-03-09 19:05:22'),(41,1,41,'/0364e6ea38ff9f3ceba67f4902324b0c.jpg','{\"type-photo\": \"avatat\"}','1986-03-25 01:55:54','1977-08-28 17:33:10'),(42,2,42,'/d790edcc900fdb0af1bf24561bd36a3f.jpg','{\"type-photo\": \"avatat\"}','1982-10-30 10:40:53','1980-04-23 06:40:52'),(43,3,43,'/f7d1068dd3c185fbc8bb6054c4d0f96f.jpg','{\"type-photo\": \"avatat\"}','1975-04-03 00:44:50','2017-11-12 05:28:51'),(44,4,44,'/13c286c88079bf4304eea59c3a6f2fbb.jpg','{\"type-photo\": \"avatat\"}','2006-02-19 08:28:49','1970-06-04 21:41:27'),(45,1,45,'/d27790c0bfa53379f0b26f004e84fb1f.jpg','{\"type-photo\": \"avatat\"}','2005-09-17 10:16:24','2006-01-25 02:22:59'),(46,2,46,'/bd9cb905a1917a48f12b8158eb5513d5.jpg','{\"type-photo\": \"avatat\"}','2017-12-18 17:00:29','1986-04-30 22:15:22'),(47,3,47,'/af775dcfc17ea2a0b9a135c6cd09131d.jpg','{\"type-photo\": \"avatat\"}','1974-03-25 13:12:14','1988-12-11 13:03:47'),(48,4,48,'/ee2bd9a0e5d1402a9acb4e1c2f96f57a.jpg','{\"type-photo\": \"avatat\"}','2008-08-29 20:54:35','1989-12-13 14:26:59'),(49,1,49,'/3e862cd20bb0c2115b789230c1eed98d.jpg','{\"type-photo\": \"avatat\"}','2002-08-15 10:49:47','1998-04-09 19:18:10'),(50,2,50,'/d3bc22f5f9734477679cdaf8286bebe4.jpg','{\"type-photo\": \"avatat\"}','2008-12-02 13:59:38','1986-07-05 02:36:04'),(51,3,51,'/a49f6aa16cb913132197e3a064be4634.jpg','{\"type-photo\": \"avatat\"}','2007-06-15 17:25:33','2018-12-03 21:56:26'),(52,4,52,'/98bf24b3c6b1e9f732ceeb977deacee1.jpg','{\"type-photo\": \"avatat\"}','1980-02-06 05:58:36','1989-10-12 02:54:48'),(53,1,53,'/ca44a51d4c3d6f857a2caaa098eaca1f.jpg','{\"type-photo\": \"avatat\"}','1984-04-03 01:08:15','1970-06-01 11:04:26'),(54,2,54,'/1559c7b30d20679bb140f2ccf7d453c0.jpg','{\"type-photo\": \"avatat\"}','1970-06-28 17:48:06','1983-02-10 17:11:46'),(55,3,55,'/9973033ebf32413d4fd03594ebd35a80.jpg','{\"type-photo\": \"avatat\"}','1974-04-04 00:23:22','1985-12-28 22:23:56'),(56,4,56,'/a505e1e2822fac80ae1d5a90bbfbdacd.jpg','{\"type-photo\": \"avatat\"}','2002-02-25 13:28:19','2001-12-01 01:31:33'),(57,1,57,'/b6bd2fe959e8f11b52e0a24cd579c228.jpg','{\"type-photo\": \"avatat\"}','2001-11-11 23:23:53','1981-08-01 10:05:18'),(58,2,58,'/5f23ab211441045d3ae41aac80df34ad.jpg','{\"type-photo\": \"avatat\"}','2010-06-22 01:49:39','2014-12-25 21:47:01'),(59,3,59,'/16a41c191b0a7733c5a414e0a1ef359a.jpg','{\"type-photo\": \"avatat\"}','1972-07-20 16:24:31','2010-09-29 10:18:30'),(60,4,60,'/00a0bf48076925f3d5168ca569609e41.jpg','{\"type-photo\": \"avatat\"}','2000-03-29 11:08:00','2005-06-04 11:35:30'),(61,1,61,'/9084d90bf940e3cfc548ae136d064c64.jpg','{\"type-photo\": \"avatat\"}','1992-03-03 14:45:23','1998-07-23 08:32:43'),(62,2,62,'/72c835f8edde14496a5d0a404afdc7eb.jpg','{\"type-photo\": \"avatat\"}','2010-02-01 09:25:39','1973-07-04 02:01:47'),(63,3,63,'/0981bfef412589fc9a3122481a77468b.jpg','{\"type-photo\": \"avatat\"}','2005-11-30 00:46:22','1992-11-23 22:23:45'),(64,4,64,'/016ef498b3a8e82f2ecd03464236ca06.jpg','{\"type-photo\": \"avatat\"}','2010-11-14 11:15:53','2010-08-25 18:33:38'),(65,1,65,'/5a60cc31df9f016743e019f2c5ec09bf.jpg','{\"type-photo\": \"avatat\"}','2018-03-11 07:02:36','2015-08-20 07:01:32'),(66,2,66,'/526377e88c2cfdb81969846633980bfb.jpg','{\"type-photo\": \"avatat\"}','1991-04-01 19:27:44','2008-08-08 04:05:08'),(67,3,67,'/77145c3ef76ad4a015a628a7393afa4d.jpg','{\"type-photo\": \"avatat\"}','1980-04-10 09:11:34','2004-03-01 07:53:52'),(68,4,68,'/bb1c7abfed5844e842fd30228c46f4c8.jpg','{\"type-photo\": \"avatat\"}','1983-01-04 06:13:51','1989-04-01 04:00:27'),(69,1,69,'/209aa230c7c0e5e84993ecd92ece7bdb.jpg','{\"type-photo\": \"avatat\"}','2013-09-28 11:01:07','2001-05-18 17:03:00'),(70,2,70,'/74fd7fc950bcd3a3adca891bff401648.jpg','{\"type-photo\": \"avatat\"}','2006-03-31 13:10:11','1977-02-19 01:36:34'),(71,3,71,'/6b74e77064055abcf46a731c37d0b2a4.jpg','{\"type-photo\": \"avatat\"}','1972-12-04 13:45:32','1997-03-11 09:55:41'),(72,4,72,'/9d38fbd267d8ddac57437eacd05a2016.jpg','{\"type-photo\": \"avatat\"}','1986-09-24 18:13:57','1990-10-20 04:07:17'),(73,1,73,'/0a44adc26086e30ebb144cf2e7461628.jpg','{\"type-photo\": \"avatat\"}','2005-12-10 15:15:19','2002-08-18 13:08:31'),(74,2,74,'/0aaa88ce1f4505f598a1093575cdbf82.jpg','{\"type-photo\": \"avatat\"}','1992-04-05 03:46:18','2006-04-07 04:48:14'),(75,3,75,'/d39831d86fe2cf165343d585bfe3e74a.jpg','{\"type-photo\": \"avatat\"}','2013-12-11 23:12:20','1988-12-12 07:02:37'),(76,4,76,'/97fa6cec811239c49a8c0e07210e5390.jpg','{\"type-photo\": \"avatat\"}','2017-06-05 13:25:29','1995-11-15 13:36:23'),(77,1,77,'/74b4a5ed71d2bc7f1c15dda389e7f141.jpg','{\"type-photo\": \"avatat\"}','1994-10-11 19:00:35','2005-09-11 06:27:23'),(78,2,78,'/43eefc2c49e9c3cfc50e60d56279c6c8.jpg','{\"type-photo\": \"avatat\"}','2002-05-05 20:27:14','1971-01-10 18:15:54'),(79,3,79,'/02390b0007998c5ac8ebfa0e215bb342.jpg','{\"type-photo\": \"avatat\"}','1990-09-26 20:15:10','1990-11-04 06:33:01'),(80,4,80,'/d76b85c1f8ab7a1c23c399d2d9a090a9.jpg','{\"type-photo\": \"avatat\"}','1994-03-25 00:17:49','2004-11-03 23:25:26'),(81,1,81,'/38de902063b6c462322032190c8f9aca.jpg','{\"type-photo\": \"avatat\"}','2003-01-27 10:31:39','1986-02-07 20:09:08'),(82,2,82,'/94f172b5144131fd5fa76314b144df58.jpg','{\"type-photo\": \"avatat\"}','1993-11-04 02:09:59','2014-11-01 09:02:01'),(83,3,83,'/f422b0f29d8edbb5bc52e40f26aea5d5.jpg','{\"type-photo\": \"avatat\"}','1981-06-17 03:42:24','2015-03-25 11:50:11'),(84,4,84,'/3fb076a799f58ab6ddf2850cae36cc68.jpg','{\"type-photo\": \"avatat\"}','1977-09-04 03:27:32','2013-12-24 00:25:38'),(85,1,85,'/73674f20c645a5b5fa223cdb2ec3e876.jpg','{\"type-photo\": \"avatat\"}','2018-03-05 13:20:19','1986-05-02 23:17:08'),(86,2,86,'/08a4e97a054116bf2a55a5efb31ad9e5.jpg','{\"type-photo\": \"avatat\"}','1983-09-06 20:34:47','2013-12-12 03:10:05'),(87,3,87,'/b7a894baaa7a7b5122f34a5e9dbe93fb.jpg','{\"type-photo\": \"avatat\"}','1984-05-08 13:08:05','1977-02-16 01:12:29'),(88,4,88,'/9e3cfa7431aca8531828a46022924adf.jpg','{\"type-photo\": \"avatat\"}','2000-08-05 08:18:40','2011-04-16 21:27:17'),(89,1,89,'/d6f7d65aa8e248c1fe362b168128051f.jpg','{\"type-photo\": \"avatat\"}','2016-02-05 10:43:57','1987-05-07 11:11:16'),(90,2,90,'/bc5f178560dd645b5d01be2a56a1a9d5.jpg','{\"type-photo\": \"avatat\"}','1981-06-09 18:14:33','2018-01-28 19:25:23'),(91,3,91,'/2312c4af9f06f1a8cdff0c004c1c400c.jpg','{\"type-photo\": \"avatat\"}','1985-06-06 10:21:45','1998-12-21 19:39:37'),(92,4,92,'/954617c2f733958088196f0e19446074.jpg','{\"type-photo\": \"avatat\"}','1981-07-26 09:52:11','1974-03-01 17:02:57'),(93,1,93,'/b28cbb625be43ff30229045ca52cd03f.jpg','{\"type-photo\": \"avatat\"}','1983-01-17 12:39:35','2017-01-06 02:59:10'),(94,2,94,'/9aa50dcfa8333b03183bcdb78f9a1f42.jpg','{\"type-photo\": \"avatat\"}','1975-04-08 03:54:23','2012-03-29 14:16:12'),(95,3,95,'/be716e44cf48945445aa58d9feae4f6c.jpg','{\"type-photo\": \"avatat\"}','1972-05-04 14:19:11','2002-12-31 01:00:36'),(96,4,96,'/a0153d72365e5b2e57b92fd5a45606a7.jpg','{\"type-photo\": \"avatat\"}','2011-03-17 18:49:48','1991-09-12 03:04:10'),(97,1,97,'/ec4409cc6707945d21013a2ec40e9b87.jpg','{\"type-photo\": \"avatat\"}','1970-02-01 21:02:45','1972-02-03 23:44:31'),(98,2,98,'/2610129ec3d983bc9a405bcc13e37dfe.jpg','{\"type-photo\": \"avatat\"}','2007-03-24 19:24:25','1999-01-28 12:14:04'),(99,3,99,'/d2a555c75e832b14f00d434aad5a2cf1.jpg','{\"type-photo\": \"avatat\"}','2005-04-15 21:39:01','2015-08-28 22:36:56'),(100,4,100,'/cd315888ad5c549c4cc5fdeafea483ed.jpg','{\"type-photo\": \"avatat\"}','1979-11-10 13:01:56','1981-03-31 10:33:13');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (2,' photo'),(4,' text'),(1,' video'),(3,'avatar');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `is_important` tinyint(1) DEFAULT NULL,
  `is_delivered` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` int(10) unsigned NOT NULL,
  `sex` enum('male','female') NOT NULL,
  `birthday` date DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `photo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'male','2007-08-20','Feeneyton',1),(2,'female','1987-07-20','West Bryanashire',2),(3,'female','1984-10-17','Marquardtshire',3),(4,'female','1989-03-05','Jacquelynborough',4),(5,'female','2016-04-28','Lake Lavernbury',5),(6,'male','2011-06-03','Port Bennett',6),(7,'female','1987-07-20','Ullrichberg',7),(8,'male','2012-05-16','Mireilleborough',8),(9,'male','2019-08-06','Lake Norbert',9),(10,'male','2001-04-12','New Evan',10),(11,'female','1999-09-26','Lake Edythton',11),(12,'male','1994-09-10','South Raegan',12),(13,'female','1994-11-29','Koeppland',13),(14,'male','1998-03-22','Haleyfort',14),(15,'female','1975-03-27','South Ettieberg',15),(16,'female','2001-07-18','Joellemouth',16),(17,'male','1988-11-14','Lubowitzfurt',17),(18,'female','2007-02-02','North Joannyborough',18),(19,'female','1975-09-07','North Whitney',19),(20,'male','1993-05-13','West Libbie',20),(21,'female','2003-11-27','Angieside',21),(22,'male','2006-01-04','Rustyberg',22),(23,'male','2001-07-29','Lorenaland',23),(24,'female','2003-08-31','Robertsborough',24),(25,'female','2015-06-10','New Mossie',25),(26,'female','2013-08-04','North Christine',26),(27,'male','1974-03-22','South Dorian',27),(28,'female','2018-01-19','North Norval',28),(29,'male','2016-09-07','Leuschkeview',29),(30,'female','2005-08-08','North Lincoln',30),(31,'female','1984-10-14','Lambertview',31),(32,'male','1983-11-19','Jakobhaven',32),(33,'female','1978-10-04','Bellestad',33),(34,'female','2010-02-27','Juniorton',34),(35,'male','1974-04-14','New Jessytown',35),(36,'male','1977-08-09','Medhursthaven',36),(37,'male','1988-03-24','West Bryonport',37),(38,'female','1991-06-20','East Zoebury',38),(39,'male','1970-11-01','North Alda',39),(40,'female','2006-10-07','East Hermannhaven',40),(41,'female','2010-08-15','Luzfurt',41),(42,'female','1989-03-15','Bartolettiberg',42),(43,'female','2000-11-30','West Nakiaview',43),(44,'male','1988-09-02','East Hassan',44),(45,'female','1991-10-11','Feilchester',45),(46,'male','1995-08-15','Archibaldmouth',46),(47,'male','1983-08-07','New Verda',47),(48,'female','2004-08-05','South Cristobalmouth',48),(49,'male','2006-02-21','North Esther',49),(50,'female','2006-04-22','Alexysview',50),(51,'female','1996-09-11','Lake Zoe',51),(52,'female','1992-12-30','Rainachester',52),(53,'female','1979-12-03','Dejahborough',53),(54,'female','2013-03-25','South Nikita',54),(55,'male','2007-10-24','East Franco',55),(56,'female','1977-12-15','Sauerfort',56),(57,'female','1983-07-25','West Daxport',57),(58,'female','1990-02-09','North Axelbury',58),(59,'male','2010-11-23','West Krystalborough',59),(60,'female','2009-05-25','Janychester',60),(61,'male','2007-03-21','Roseland',61),(62,'female','1973-04-07','Port Reva',62),(63,'male','2014-05-10','Port Kristofer',63),(64,'male','2004-09-28','North Elna',64),(65,'male','1978-11-09','Ariannaborough',65),(66,'female','1993-05-13','Littelview',66),(67,'female','2006-10-22','Boydton',67),(68,'female','1992-09-03','Gerholdchester',68),(69,'male','1991-10-16','North Olgashire',69),(70,'male','1980-01-16','Port Reese',70),(71,'female','1995-06-20','Schillershire',71),(72,'female','2018-03-13','Port Elbert',72),(73,'male','2001-04-21','Bruenborough',73),(74,'male','2019-10-08','Kemmershire',74),(75,'female','1985-07-11','West Rosstown',75),(76,'female','2000-01-26','Reillybury',76),(77,'female','1971-06-16','South Destanychester',77),(78,'male','1988-12-25','Port Damaris',78),(79,'female','1970-08-29','Kipmouth',79),(80,'male','1970-01-26','South Dejah',80),(81,'female','2009-09-13','Dibbertville',81),(82,'female','1994-07-20','New Wardshire',82),(83,'male','1986-06-05','Nolantown',83),(84,'female','1976-03-08','New Lonnyborough',84),(85,'female','2003-03-05','Willshire',85),(86,'female','2007-07-23','Godfreymouth',86),(87,'male','1977-12-31','Bernierfort',87),(88,'female','1999-08-19','Balistreriport',88),(89,'male','1978-04-10','Bernadineside',89),(90,'male','1999-03-16','South Ethelton',90),(91,'female','1986-01-09','New Brockchester',91),(92,'male','2001-03-02','Thielshire',92),(93,'male','2015-10-15','Maciborough',93),(94,'female','1981-06-14','Kozeyberg',94),(95,'female','2012-01-25','Satterfieldfurt',95),(96,'male','1996-04-01','Edmundchester',96),(97,'female','1982-07-16','East Marleeside',97),(98,'female','1991-07-02','West Savannaside',98),(99,'male','2003-10-31','Nienowstad',99),(100,'female','2004-10-18','Huelshire',100);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_emails`
--

DROP TABLE IF EXISTS `user_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_emails` (
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(128) NOT NULL,
  `email_type` enum('main','reserved') NOT NULL DEFAULT 'main',
  PRIMARY KEY (`user_id`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_emails`
--

LOCK TABLES `user_emails` WRITE;
/*!40000 ALTER TABLE `user_emails` DISABLE KEYS */;
INSERT INTO `user_emails` VALUES (1,'fpadberg@example.org','main'),(2,'aglae.bruen@example.org','main'),(3,'fmosciski@example.com','main'),(4,'malinda.hettinger@example.com','reserved'),(5,'roscoe.sawayn@example.org','main'),(6,'justyn94@example.net','reserved'),(7,'murphy.earnest@example.com','reserved'),(8,'ledner.johann@example.net','reserved'),(9,'dgoyette@example.org','main'),(10,'miller.lucienne@example.com','reserved'),(11,'ehermann@example.com','main'),(12,'parisian.marc@example.com','main'),(13,'egrant@example.com','main'),(14,'ycrist@example.net','reserved'),(15,'igottlieb@example.com','main'),(16,'borer.madyson@example.net','main'),(17,'harley.abbott@example.com','main'),(18,'pollich.judy@example.org','main'),(19,'wlegros@example.com','reserved'),(20,'waelchi.kathryne@example.org','main'),(21,'bud.pfannerstill@example.org','main'),(22,'sherzog@example.org','main'),(23,'edaugherty@example.com','reserved'),(24,'hoeger.rebecca@example.com','main'),(25,'clemmie.kris@example.com','reserved'),(26,'ernser.elvie@example.org','reserved'),(27,'smith.garfield@example.org','reserved'),(28,'altenwerth.natalie@example.net','main'),(29,'zoila.treutel@example.org','main'),(30,'emelie20@example.net','main'),(31,'wyost@example.com','reserved'),(32,'bogisich.silas@example.org','reserved'),(33,'kherzog@example.net','main'),(34,'oceane19@example.org','reserved'),(35,'ebba17@example.com','main'),(36,'reynolds.hailee@example.org','main'),(37,'ivy.corkery@example.net','main'),(38,'bayer.travis@example.com','main'),(39,'jschmeler@example.org','main'),(40,'kyra.kassulke@example.net','main'),(41,'ben.feest@example.net','main'),(42,'kemmer.shaniya@example.org','reserved'),(43,'estefania50@example.net','main'),(44,'emorar@example.net','main'),(45,'xander49@example.org','reserved'),(46,'justyn.renner@example.net','reserved'),(47,'lswift@example.net','main'),(48,'bailey.alda@example.org','reserved'),(49,'kshlerin.kayley@example.net','main'),(50,'arvilla57@example.com','main'),(51,'abbigail.hessel@example.org','main'),(52,'schaden.darien@example.com','reserved'),(53,'miller.legros@example.net','reserved'),(54,'ibernhard@example.net','reserved'),(55,'dnader@example.org','main'),(56,'twila.ratke@example.com','main'),(57,'rice.keira@example.net','main'),(58,'gilda.stanton@example.net','reserved'),(59,'oberbrunner.marietta@example.net','reserved'),(60,'schoen.jane@example.net','main'),(61,'schamberger.herman@example.net','main'),(62,'nicolas.demetris@example.org','main'),(63,'odooley@example.com','main'),(64,'dickinson.hollie@example.com','reserved'),(65,'felipa.reynolds@example.com','reserved'),(66,'aisha38@example.net','reserved'),(67,'moshe96@example.net','reserved'),(68,'tfisher@example.org','reserved'),(69,'verna.rutherford@example.com','reserved'),(70,'hoppe.ivy@example.net','reserved'),(71,'heidenreich.ila@example.com','reserved'),(72,'von.baylee@example.com','main'),(73,'alejandra74@example.org','reserved'),(74,'jalon75@example.com','main'),(75,'simonis.darien@example.com','main'),(76,'electa.boehm@example.com','main'),(77,'stamm.alexandra@example.org','reserved'),(78,'ilene98@example.org','reserved'),(79,'claude19@example.net','main'),(80,'abshire.lennie@example.org','reserved'),(81,'mann.bartholome@example.net','reserved'),(82,'elittle@example.net','main'),(83,'sporer.trever@example.org','main'),(84,'yorn@example.com','main'),(85,'sanford.fabian@example.com','reserved'),(86,'amy10@example.net','main'),(87,'milford75@example.net','main'),(88,'yesenia.rowe@example.com','reserved'),(89,'melissa60@example.net','reserved'),(90,'dale08@example.com','main'),(91,'mario05@example.com','main'),(92,'cody60@example.net','reserved'),(93,'schmeler.malika@example.com','main'),(94,'kenya03@example.net','main'),(95,'vincenzo50@example.net','main'),(96,'olittle@example.net','main'),(97,'terrell37@example.org','main'),(98,'haylie.pfannerstill@example.org','reserved'),(99,'electa.wunsch@example.org','reserved'),(100,'gus36@example.net','main');
/*!40000 ALTER TABLE `user_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jalen','Lubowitz','741-585-2266','2011-03-08 22:55:57','1981-10-10 15:40:59'),(2,'Geoffrey','Krajcik','1-512-579-6879x8','2019-01-27 09:38:44','1971-01-13 19:01:41'),(3,'Donavon','Hermann','1-399-111-8992x5','1988-09-15 04:07:09','1980-01-27 08:29:12'),(4,'Jacklyn','Will','869-893-1994','2002-05-13 22:03:08','2009-04-07 00:13:02'),(5,'Sincere','Connelly','1-375-606-5244','1989-03-04 11:34:20','2016-10-15 02:34:53'),(6,'Delpha','Daniel','(824)963-8433','2019-09-20 03:50:03','1977-06-02 10:29:02'),(7,'Jennie','Schmitt','00160777876','1983-10-12 02:08:12','1987-09-07 09:32:14'),(8,'Keith','Kutch','296-356-5287','1996-07-26 11:16:46','1976-06-22 12:27:29'),(9,'Lonie','Padberg','1-551-623-7899','1979-03-13 20:09:05','1981-04-11 02:52:12'),(10,'Wyman','Bode','774-931-9661','1994-11-16 15:18:31','2015-08-13 21:48:18'),(11,'Deshaun','Sporer','1-673-526-4813','1980-08-26 05:13:35','2013-05-03 15:26:28'),(12,'Valentine','Kuhic','661.386.3533x817','2007-05-14 05:48:48','1999-10-05 18:54:13'),(13,'Della','Dickinson','09513605189','1977-02-14 01:44:49','2016-12-01 19:31:43'),(14,'Randi','O\'Connell','1-362-283-3234x2','1973-04-13 10:31:23','2005-09-23 05:52:04'),(15,'Ottis','Waelchi','(655)163-9599x12','2009-04-15 18:54:05','1998-11-07 08:19:12'),(16,'Corene','Dickinson','063-578-6156','2016-09-26 12:37:27','2001-05-09 10:16:27'),(17,'Zelda','Windler','(419)136-6388x48','2010-07-10 08:51:35','1972-07-17 10:23:05'),(18,'Shaina','Daugherty','1-278-907-5920x1','1983-08-29 15:15:48','2007-02-06 02:44:45'),(19,'Kathryn','Dickinson','726.536.0770','2005-08-01 16:03:31','1975-05-29 12:32:39'),(20,'Olin','Hayes','(205)465-5135x84','2008-04-18 09:22:01','2005-11-02 00:02:52'),(21,'Anya','Goldner','501-785-4530x369','1987-05-22 09:55:22','2018-10-19 01:19:10'),(22,'Minnie','Champlin','616.006.8354x478','2011-01-21 21:28:52','1974-08-25 11:11:59'),(23,'Linda','Satterfield','705.667.7170x638','1999-03-29 22:02:25','1974-02-15 15:35:05'),(24,'Jaida','Hauck','1-444-715-2826','1977-06-02 11:04:12','1986-11-14 09:01:12'),(25,'Elmo','Lowe','265.326.4129x285','2007-10-18 13:54:28','2007-12-07 08:29:30'),(26,'Lennie','Connelly','863.201.9406x903','1998-01-29 10:51:43','1974-09-08 14:28:49'),(27,'Devon','Nader','018.939.8955','2017-10-26 03:54:59','1982-11-24 00:22:14'),(28,'Opal','White','1-720-974-6300x2','2018-11-08 02:09:07','1991-08-27 06:19:32'),(29,'Camron','Toy','139.179.0114x747','2012-11-02 21:55:16','2005-07-05 15:39:16'),(30,'Pink','Langosh','432.183.0328x398','1987-09-05 10:49:48','1993-06-08 10:32:38'),(31,'Harry','Hoppe','973-352-6656x567','2011-02-19 14:46:31','1991-11-28 18:24:19'),(32,'Emil','Ankunding','(221)916-7280x16','1973-10-08 13:14:38','1987-09-21 04:19:29'),(33,'Cindy','Trantow','881-440-5982','1995-10-08 19:45:23','1976-04-18 08:30:10'),(34,'Kali','Torphy','241-462-7270x829','1976-06-28 07:23:52','2008-09-24 15:34:44'),(35,'Zachariah','Waelchi','(492)741-9749x27','2000-05-20 21:05:17','1983-09-07 08:58:45'),(36,'Effie','Bechtelar','237.527.9622','1995-07-09 12:42:04','1984-12-31 20:12:37'),(37,'Vida','Sporer','885-864-9275','1980-09-23 18:42:44','2014-10-23 07:26:36'),(38,'Aletha','Champlin','438.065.0379x734','1999-05-07 18:44:46','2000-09-22 18:44:14'),(39,'Torrey','Barton','046.386.5268x022','2017-01-07 12:55:43','1991-01-20 09:01:59'),(40,'Ned','Cassin','748.605.3763x518','1975-02-08 19:06:14','1993-04-18 09:08:16'),(41,'Torrey','Marquardt','1-608-534-1792','1978-04-27 03:26:09','2000-10-17 11:01:34'),(42,'Benedict','Schulist','(989)042-3611','1977-08-31 00:33:55','1974-10-20 15:17:28'),(43,'Kelli','Eichmann','494-917-4456','1994-10-27 10:40:52','2013-08-18 09:54:08'),(44,'Naomie','Walter','943.820.5176x559','1987-01-19 08:34:00','2003-05-21 13:43:51'),(45,'Jeanne','Jones','1-301-150-4520','1971-09-19 10:03:57','1988-03-28 00:16:22'),(46,'Stefanie','Gutmann','635.310.3400','1974-02-10 22:17:45','1996-01-15 15:43:34'),(47,'Darrion','Beier','084.915.4382','2009-09-22 21:12:44','1994-08-28 02:37:33'),(48,'Dovie','Volkman','(419)293-3227x32','1995-07-03 09:54:40','1990-05-31 13:11:23'),(49,'Leopold','Konopelski','(912)376-9989','1976-04-26 21:12:25','1998-03-06 00:54:14'),(50,'Roman','Steuber','1-427-144-7771x2','1993-02-22 16:50:02','2001-07-07 13:13:41'),(51,'Ally','Hyatt','(516)272-0087x68','2018-02-25 17:35:23','2014-09-30 10:38:10'),(52,'Tommie','McGlynn','01897473281','2002-04-08 22:34:50','2017-11-01 00:50:16'),(53,'Bertrand','Kunze','985.375.5725x633','1981-09-14 16:46:05','1980-07-06 03:00:38'),(54,'Zackery','Wisoky','(552)482-5903','2004-01-19 08:49:09','2001-04-01 21:20:59'),(55,'Della','Leffler','242.789.7511','2010-11-22 09:05:05','1996-10-01 04:24:49'),(56,'Harley','Kerluke','790-208-6495x708','1976-05-11 11:27:53','1973-12-10 19:24:21'),(57,'Charles','Harris','947.373.1519x579','2016-01-05 01:00:25','1972-09-13 08:55:31'),(58,'Jaquan','Gorczany','1-664-151-5931','2005-11-03 20:12:14','1998-04-08 11:43:20'),(59,'Marc','Kuphal','410-578-0127','1985-02-16 15:10:42','2018-05-09 00:30:54'),(60,'Sierra','Hackett','1-868-586-0807x0','2010-02-17 01:22:28','1998-09-09 14:34:21'),(61,'Lucas','Williamson','974-194-5369','1987-07-18 17:13:22','2019-08-25 03:28:33'),(62,'Reba','Lueilwitz','(272)323-9194','2015-04-22 07:52:40','2019-10-05 06:40:12'),(63,'Carlie','Hills','702-967-5328x090','2005-02-15 13:45:33','2010-12-17 02:07:48'),(64,'Aurelia','Mohr','(352)921-7057','1993-12-21 15:49:15','2004-06-12 00:24:08'),(65,'Jedediah','Moen','(562)516-3873','2011-11-05 18:05:08','2004-02-29 15:51:15'),(66,'Rowland','Mills','395-905-6475x773','1975-10-01 05:19:11','2008-03-15 04:39:25'),(67,'Santa','Rowe','1-513-323-8200x9','1987-03-26 06:16:44','1986-09-07 04:26:57'),(68,'Margie','Rohan','(023)713-0891x90','1990-05-05 22:42:59','1998-11-19 06:52:16'),(69,'Damon','Schoen','299.975.2662x136','1972-05-02 18:25:59','2011-09-05 00:26:24'),(70,'Vinnie','Ferry','999-546-4166','2000-07-15 22:20:34','1991-08-19 20:16:58'),(71,'Tanner','Christiansen','698-080-8410x014','2001-03-25 14:06:38','2010-07-08 10:42:19'),(72,'Lew','Baumbach','(938)592-8645','2004-09-03 03:36:00','1977-06-11 07:02:25'),(73,'Tremaine','Wuckert','1-545-751-6781x4','1970-11-05 21:46:31','1987-07-09 22:01:36'),(74,'Rocky','Hyatt','923.030.1866x233','2004-12-29 15:37:06','2012-10-22 02:13:26'),(75,'Evan','Ledner','(829)482-5415','2008-02-01 18:40:19','2006-12-28 03:38:18'),(76,'Madelyn','Hoeger','397.087.1601x188','1995-12-18 06:20:32','1975-01-08 00:14:03'),(77,'Paula','Farrell','+78(6)8817377988','1999-09-16 06:52:58','2000-11-06 06:57:19'),(78,'Trace','Zieme','411.235.8622x882','1997-10-10 05:15:49','1981-12-26 22:31:24'),(79,'Nichole','Jakubowski','(379)300-5159x03','1970-06-29 10:30:40','1987-03-31 12:09:16'),(80,'Carleton','Parker','1-924-632-3214','1979-08-06 20:47:59','1998-12-31 21:18:20'),(81,'Jeanette','Klocko','(236)283-3709','2014-11-24 09:03:11','1989-05-02 09:58:50'),(82,'Joe','Sawayn','972.205.6361x554','1998-02-20 19:40:17','2014-03-02 19:23:02'),(83,'Kade','Harber','08451300676','1990-02-04 19:56:11','2014-06-05 09:30:24'),(84,'Brenna','Kulas','460-278-2779','2012-10-06 17:40:19','1994-07-10 09:16:26'),(85,'Jameson','Metz','071.197.7792','1978-02-17 12:23:40','2014-01-26 16:16:45'),(86,'Reynold','Mann','(689)023-5485x04','1977-08-10 18:08:34','1995-07-09 11:25:13'),(87,'Nikita','Larkin','451.590.7630x260','1979-08-22 03:23:53','1994-02-20 00:08:57'),(88,'Garrick','Hartmann','+65(2)0954776200','1988-08-16 15:28:15','1988-02-21 16:40:26'),(89,'Destinee','Lehner','(348)359-7922','1994-01-16 17:56:08','2003-03-24 02:34:04'),(90,'Emil','Satterfield','1-794-910-7800x8','1972-12-03 17:42:47','1997-12-07 00:52:24'),(91,'Judge','Harvey','09111580166','1981-01-31 05:01:26','1977-08-27 02:13:44'),(92,'Randal','Ernser','(718)908-6609x25','1998-10-06 10:44:31','1984-11-03 22:01:30'),(93,'Guy','Fay','(545)037-3555x48','1973-02-07 09:13:23','1999-06-25 14:17:08'),(94,'Charity','Leuschke','(343)141-4695x47','1997-02-26 19:48:13','2010-12-21 17:50:09'),(95,'Kaleb','Schuppe','021.321.2958x860','1980-06-16 11:35:09','2007-04-20 13:30:11'),(96,'Aniya','Bartoletti','261.806.8811x369','2009-06-17 03:42:57','1993-08-24 23:20:19'),(97,'Rossie','Mayer','226.259.0273x415','1971-09-06 20:14:08','1983-04-22 20:34:35'),(98,'Julien','Nolan','(927)256-9244','1992-10-20 11:10:36','2008-10-16 23:37:37'),(99,'Giovanny','Hamill','1-104-419-5314','1985-12-20 18:17:45','1980-12-20 01:34:55'),(100,'Tyree','Bernier','1-732-138-9879x5','1983-11-24 14:43:04','2012-11-05 04:48:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-26 22:23:08
