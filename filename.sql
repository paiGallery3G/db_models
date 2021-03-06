-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: pai_gallery
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT 'NULL',
  `author` varchar(64) DEFAULT 'NULL',
  `description` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Wakacje','John Doe','Album ze zdj─Öciami z wakacji 2004','2001-02-01'),(2,'Wakacje','John Doe','Album ze zdj─Öciami z wakacji 2004','2001-02-01');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_tag`
--

DROP TABLE IF EXISTS `album_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_tag` (
  `album_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`album_id`,`tag_id`),
  KEY `IDX_6397379A1137ABCF` (`album_id`),
  KEY `IDX_6397379ABAD26311` (`tag_id`),
  CONSTRAINT `FK_6397379A1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6397379ABAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_tag`
--

LOCK TABLES `album_tag` WRITE;
/*!40000 ALTER TABLE `album_tag` DISABLE KEYS */;
INSERT INTO `album_tag` VALUES (2,3);
/*!40000 ALTER TABLE `album_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20220403154310','2022-04-03 18:53:10',117);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT 'NULL',
  `ftype` varchar(32) NOT NULL,
  `author` varchar(64) DEFAULT 'NULL',
  `description` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `album_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C53D045F1137ABCF` (`album_id`),
  CONSTRAINT `FK_C53D045F1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'Wujek w wodzie','gigachad-6261f2870e602.jpg','Tata','Wujek tonie w wodzie','2002-02-22',1),(3,'Grill','gigachad-6261f2170169c.jpg','Tata','Wieczorny grill','2022-04-08',1),(4,'Ja','gigachad-6261f2e17f000.jpg','Giga CHAD','moje zdj','2022-04-22',2);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_tag`
--

DROP TABLE IF EXISTS `image_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_tag` (
  `image_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`image_id`,`tag_id`),
  KEY `IDX_5B6367D03DA5256D` (`image_id`),
  KEY `IDX_5B6367D0BAD26311` (`tag_id`),
  CONSTRAINT `FK_5B6367D03DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5B6367D0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_tag`
--

LOCK TABLES `image_tag` WRITE;
/*!40000 ALTER TABLE `image_tag` DISABLE KEYS */;
INSERT INTO `image_tag` VALUES (1,1);
/*!40000 ALTER TABLE `image_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `primary_comment`
--

DROP TABLE IF EXISTS `primary_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `primary_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT 'NULL',
  `author` varchar(64) DEFAULT 'NULL',
  `content` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `image_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5FED16583DA5256D` (`image_id`),
  CONSTRAINT `FK_5FED16583DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `primary_comment`
--

LOCK TABLES `primary_comment` WRITE;
/*!40000 ALTER TABLE `primary_comment` DISABLE KEYS */;
INSERT INTO `primary_comment` VALUES (1,'Hahaha','Pawe┼éek','ale ┼Ťmieszne zdj─Öcie','2022-04-08',1),(2,'Pyszne','Ciocia','Wygl─ůda bardzo pysznie','2022-04-08',3);
/*!40000 ALTER TABLE `primary_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secondary_comment`
--

DROP TABLE IF EXISTS `secondary_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secondary_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT 'NULL',
  `author` varchar(64) DEFAULT 'NULL',
  `content` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `primary_comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_516AA4ACC6CD9175` (`primary_comment_id`),
  CONSTRAINT `FK_516AA4ACC6CD9175` FOREIGN KEY (`primary_comment_id`) REFERENCES `primary_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secondary_comment`
--

LOCK TABLES `secondary_comment` WRITE;
/*!40000 ALTER TABLE `secondary_comment` DISABLE KEYS */;
INSERT INTO `secondary_comment` VALUES (1,':(','Mama','Pawe┼éku to nie ┼éadnie si─Ö ┼Ťmia─ç z kogo┼Ť','2022-04-08',1);
/*!40000 ALTER TABLE `secondary_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT 'NULL',
  `author` varchar(64) DEFAULT 'NULL',
  `content` text DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Polska','Mama','Zdj─Öcia z Polski','2022-04-08'),(2,'G├│ry','Mama','Zdj─Öcia z g├│r','2022-04-08'),(3,'2004','Tata','Zdj─Öcia z roku 2004','2022-04-08');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-22  6:05:30
