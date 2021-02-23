-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: clothing
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `application_logs`
--

DROP TABLE IF EXISTS `application_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pid` int DEFAULT NULL,
  `timestamp` datetime NOT NULL,
  `message` text,
  `priority` enum('emergency','alert','critical','error','warning','notice','info','debug') DEFAULT NULL,
  `fileobject` varchar(1024) DEFAULT NULL,
  `info` varchar(1024) DEFAULT NULL,
  `component` varchar(190) DEFAULT NULL,
  `source` varchar(190) DEFAULT NULL,
  `relatedobject` int unsigned DEFAULT NULL,
  `relatedobjecttype` enum('object','document','asset') DEFAULT NULL,
  `maintenanceChecked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `component` (`component`),
  KEY `timestamp` (`timestamp`),
  KEY `relatedobject` (`relatedobject`),
  KEY `priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_logs`
--

LOCK TABLES `application_logs` WRITE;
/*!40000 ALTER TABLE `application_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mimetype` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `customSettings` longtext,
  `hasMetaData` tinyint(1) NOT NULL DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`filename`),
  KEY `parentId` (`parentId`),
  KEY `filename` (`filename`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1613976326,1613976326,1,1,NULL,0,0),(2,1,'folder','brandLogo','/',NULL,1614075740,1614075740,2,2,'a:0:{}',0,1),(3,2,'image','levi.png','/brandLogo/','image/png',1614075781,1614075781,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:300;s:11:\"imageHeight\";i:168;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(4,1,'folder','_default_upload_bucket','/',NULL,1614107224,1614107224,1,0,'a:0:{}',0,1),(5,4,'image','kurti 6.jpeg','/_default_upload_bucket/','image/jpeg',1614107224,1614107224,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614107224;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(6,4,'image','kurti 6_1.jpeg','/_default_upload_bucket/','image/jpeg',1614107380,1614107380,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614107380;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1);
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_metadata`
--

DROP TABLE IF EXISTS `assets_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_metadata` (
  `cid` int NOT NULL,
  `name` varchar(190) NOT NULL,
  `language` varchar(10) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` enum('input','textarea','asset','document','object','date','select','checkbox') DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`cid`,`name`,`language`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_metadata`
--

LOCK TABLES `assets_metadata` WRITE;
/*!40000 ALTER TABLE `assets_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `data` longblob,
  `mtime` int unsigned DEFAULT NULL,
  `expire` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('asset_1',_binary 's:574:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:11:\"\0*\0filename\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1613976326;s:19:\"\0*\0modificationDate\";i:1613976326;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1613976326;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104844,1616524044),('asset_2',_binary 's:583:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:2;s:11:\"\0*\0parentId\";i:1;s:11:\"\0*\0filename\";s:9:\"brandLogo\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1614075740;s:19:\"\0*\0modificationDate\";i:1614075740;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075740;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104845,1616524045),('asset_3',_binary 's:758:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:3;s:11:\"\0*\0parentId\";i:2;s:11:\"\0*\0filename\";s:8:\"levi.png\";s:7:\"\0*\0path\";s:11:\"/brandLogo/\";s:11:\"\0*\0mimetype\";s:9:\"image/png\";s:15:\"\0*\0creationDate\";i:1614075781;s:19:\"\0*\0modificationDate\";i:1614075781;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:300;s:11:\"imageHeight\";i:168;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075781;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104845,1616524045),('asset_4',_binary 's:597:\"O:26:\"Pimcore\\Model\\Asset\\Folder\":20:{s:7:\"\0*\0type\";s:6:\"folder\";s:5:\"\0*\0id\";i:4;s:11:\"\0*\0parentId\";i:1;s:11:\"\0*\0filename\";s:22:\"_default_upload_bucket\";s:7:\"\0*\0path\";s:1:\"/\";s:11:\"\0*\0mimetype\";N;s:15:\"\0*\0creationDate\";i:1614107224;s:19:\"\0*\0modificationDate\";i:1614107224;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:0;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:0:{}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614107224;s:12:\"\0*\0_fulldump\";b:0;}\";',1614107665,1616526864),('asset_5',_binary 's:915:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:5;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:12:\"kurti 6.jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1614107224;s:19:\"\0*\0modificationDate\";i:1614107224;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614107224;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614107224;s:12:\"\0*\0_fulldump\";b:0;}\";',1614107226,1616526426),('asset_6',_binary 's:917:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:6;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:14:\"kurti 6_1.jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1614107380;s:19:\"\0*\0modificationDate\";i:1614107380;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614107380;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614107380;s:12:\"\0*\0_fulldump\";b:0;}\";',1614107382,1616526581),('document_1',_binary 's:886:\"O:27:\"Pimcore\\Model\\Document\\Page\":31:{s:8:\"\0*\0title\";s:0:\"\";s:14:\"\0*\0description\";s:0:\"\";s:11:\"\0*\0metaData\";a:0:{}s:7:\"\0*\0type\";s:4:\"page\";s:12:\"\0*\0prettyUrl\";N;s:17:\"\0*\0targetGroupIds\";s:0:\"\";s:9:\"\0*\0module\";N;s:13:\"\0*\0controller\";s:7:\"default\";s:9:\"\0*\0action\";s:7:\"default\";s:11:\"\0*\0template\";s:0:\"\";s:11:\"\0*\0elements\";N;s:12:\"\0*\0editables\";R:12;s:26:\"\0*\0contentMasterDocumentId\";N;s:24:\"\0*\0supportsContentMaster\";b:1;s:26:\"\0*\0missingRequiredEditable\";N;s:5:\"\0*\0id\";i:1;s:11:\"\0*\0parentId\";i:0;s:6:\"\0*\0key\";s:0:\"\";s:7:\"\0*\0path\";s:1:\"/\";s:8:\"\0*\0index\";i:999999;s:12:\"\0*\0published\";b:1;s:15:\"\0*\0creationDate\";i:1613976326;s:19:\"\0*\0modificationDate\";i:1613976326;s:12:\"\0*\0userOwner\";i:1;s:19:\"\0*\0userModification\";i:1;s:11:\"\0*\0siblings\";a:0:{}s:14:\"\0*\0hasSiblings\";a:0:{}s:9:\"\0*\0locked\";N;s:15:\"\0*\0versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1613976326;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104841,1616524039),('document_properties_1',_binary 's:6:\"a:0:{}\";',1614104841,1616524039),('object_1',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:1;s:13:\"\0*\0o_parentId\";i:0;s:8:\"\0*\0o_key\";s:0:\"\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:999999;s:17:\"\0*\0o_creationDate\";i:1613976326;s:21:\"\0*\0o_modificationDate\";i:1613976326;s:14:\"\0*\0o_userOwner\";i:1;s:21:\"\0*\0o_userModification\";i:1;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1613976326;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104844,1616524044),('object_10',_binary 's:2095:\"O:30:\"Pimcore\\Model\\DataObject\\Brand\":27:{s:12:\"\0*\0o_classId\";s:1:\"2\";s:14:\"\0*\0o_className\";s:5:\"brand\";s:7:\"\0*\0name\";s:5:\"Libas\";s:10:\"\0*\0details\";s:310:\"<p>Young stylish modern defines Libas a fashion brand that tells the story of a new age Indian woman who is free spirited, independent and aware. Our constant endeavour is to provide fashionable, stylish, upbeat collection of ethnic and fusion wear carefully curated in line with fashion trends worldwide.</p>\n\";s:12:\"\0*\0brandLogo\";O:25:\"Pimcore\\Model\\Asset\\Image\":21:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:5;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:12:\"kurti 6.jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1614107224;s:19:\"\0*\0modificationDate\";i:1614107224;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614107224;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614107224;s:12:\"\0*\0_fulldump\";b:0;s:24:\"____pimcore_cache_item__\";s:7:\"asset_5\";}s:15:\"\0*\0advertisment\";N;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:10;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:5:\"Libas\";s:9:\"\0*\0o_path\";s:7:\"/brand/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614106977;s:21:\"\0*\0o_modificationDate\";i:1614107238;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614107238;s:12:\"\0*\0_fulldump\";b:0;}\";',1614107240,1616526439),('object_11',_binary 's:1096:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":25:{s:12:\"\0*\0o_classId\";s:1:\"1\";s:14:\"\0*\0o_className\";s:8:\"category\";s:7:\"\0*\0name\";s:5:\"Kurti\";s:14:\"\0*\0description\";s:303:\"The Kurti or Kurta is an outfit that has stretched beyond the Indian borders, and has evolved down the ages to suit the ever-changing demands of the fashion forward world. A long top, generally of knee-length, paired with Salwar or Churidar and Dupatta is what comprises the Salwar-Kurti-Dupatta get-up.\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:11;s:13:\"\0*\0o_parentId\";i:2;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:5:\"kurti\";s:9:\"\0*\0o_path\";s:10:\"/category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614107276;s:21:\"\0*\0o_modificationDate\";i:1614107331;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614107331;s:12:\"\0*\0_fulldump\";b:0;}\";',1614107332,1616526532),('object_2',_binary 's:601:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:2;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:8:\"category\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614075329;s:21:\"\0*\0o_modificationDate\";i:1614075328;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075328;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104846,1616524045),('object_3',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:3;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:5:\"brand\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614075343;s:21:\"\0*\0o_modificationDate\";i:1614075343;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075343;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104846,1616524045),('object_4',_binary 's:812:\"O:33:\"Pimcore\\Model\\DataObject\\Category\":25:{s:12:\"\0*\0o_classId\";s:1:\"1\";s:14:\"\0*\0o_className\";s:8:\"category\";s:7:\"\0*\0name\";s:5:\"Jeans\";s:14:\"\0*\0description\";s:21:\"Used for Bottom wear.\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:4;s:13:\"\0*\0o_parentId\";i:2;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:5:\"000C1\";s:9:\"\0*\0o_path\";s:10:\"/category/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614075383;s:21:\"\0*\0o_modificationDate\";i:1614075441;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075441;s:12:\"\0*\0_fulldump\";b:0;}\";',1614107253,1616526453),('object_5',_binary 's:1939:\"O:30:\"Pimcore\\Model\\DataObject\\Brand\":27:{s:12:\"\0*\0o_classId\";s:1:\"2\";s:14:\"\0*\0o_className\";s:5:\"brand\";s:7:\"\0*\0name\";s:5:\"Levis\";s:10:\"\0*\0details\";s:312:\"<p>Levi Strauss &amp; Co. is an American clothing company known worldwide for its Levi\'s brand of denim jeans. It was founded in May 1853 when German immigrant Levi Strauss moved from Buttenheim, Bavaria, to San Francisco, California to open a west coast branch of his brothers\' New York dry goods business.</p>\n\";s:12:\"\0*\0brandLogo\";O:25:\"Pimcore\\Model\\Asset\\Image\":21:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:3;s:11:\"\0*\0parentId\";i:2;s:11:\"\0*\0filename\";s:8:\"levi.png\";s:7:\"\0*\0path\";s:11:\"/brandLogo/\";s:11:\"\0*\0mimetype\";s:9:\"image/png\";s:15:\"\0*\0creationDate\";i:1614075781;s:19:\"\0*\0modificationDate\";i:1614075781;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:300;s:11:\"imageHeight\";i:168;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075781;s:12:\"\0*\0_fulldump\";b:0;s:24:\"____pimcore_cache_item__\";s:7:\"asset_3\";}s:15:\"\0*\0advertisment\";N;s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:5;s:13:\"\0*\0o_parentId\";i:3;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:5:\"000B1\";s:9:\"\0*\0o_path\";s:7:\"/brand/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614075454;s:21:\"\0*\0o_modificationDate\";i:1614075792;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614075792;s:12:\"\0*\0_fulldump\";b:0;}\";',1614106949,1616526149),('object_6',_binary 's:599:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:6;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:6:\"fabric\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614088751;s:21:\"\0*\0o_modificationDate\";i:1614088751;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614088751;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104846,1616524045),('object_7',_binary 's:1150:\"O:31:\"Pimcore\\Model\\DataObject\\Fabric\":26:{s:12:\"\0*\0o_classId\";s:1:\"3\";s:14:\"\0*\0o_className\";s:6:\"fabric\";s:7:\"\0*\0name\";s:6:\"Cotton\";s:14:\"\0*\0description\";s:325:\"Cotton fabric is one of the most commonly used types of fabrics in the world. This textile is chemically organic, which means that it does not contain any synthetic compounds. Cotton fabric is derived from the fibers surrounding the seeds of cotton plants, which emerge in a round, fluffy formation once the seeds are mature.\";s:11:\"\0*\0washable\";s:11:\"Normal Wash\";s:20:\"\0*\0__rawRelationData\";a:0:{}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:7;s:13:\"\0*\0o_parentId\";i:6;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:6:\"Cotton\";s:9:\"\0*\0o_path\";s:8:\"/fabric/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614088764;s:21:\"\0*\0o_modificationDate\";i:1614088837;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614088837;s:12:\"\0*\0_fulldump\";b:0;}\";',1614106935,1616526135),('object_8',_binary 's:600:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:8;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:7:\"product\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614099713;s:21:\"\0*\0o_modificationDate\";i:1614099712;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614099712;s:12:\"\0*\0_fulldump\";b:0;}\";',1614104846,1616524045),('quantityvalue_units_table',_binary 's:482:\"a:2:{i:1;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"1\";s:12:\"abbreviation\";s:5:\"month\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:2;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"2\";s:12:\"abbreviation\";s:5:\"years\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}}\";',1614107873,1616527073),('site_domain_499060da37cf08189e7cfe06256714c8',_binary 's:13:\"s:6:\"failed\";\";',1614107659,1616526858),('system_resource_columns_edit_lock',_binary 's:101:\"a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}\";',1614107505,1616526704),('system_route_redirect',_binary 's:6:\"a:0:{}\";',1614107658,1616526858),('system_supported_locales_en',_binary 's:26248:\"a:751:{s:2:\"af\";s:9:\"Afrikaans\";s:5:\"af_NA\";s:19:\"Afrikaans (Namibia)\";s:5:\"af_ZA\";s:24:\"Afrikaans (South Africa)\";s:3:\"agq\";s:5:\"Aghem\";s:6:\"agq_CM\";s:16:\"Aghem (Cameroon)\";s:2:\"ak\";s:4:\"Akan\";s:5:\"ak_GH\";s:12:\"Akan (Ghana)\";s:2:\"sq\";s:8:\"Albanian\";s:5:\"sq_AL\";s:18:\"Albanian (Albania)\";s:5:\"sq_XK\";s:17:\"Albanian (Kosovo)\";s:5:\"sq_MK\";s:26:\"Albanian (North Macedonia)\";s:2:\"am\";s:7:\"Amharic\";s:5:\"am_ET\";s:18:\"Amharic (Ethiopia)\";s:2:\"ar\";s:6:\"Arabic\";s:5:\"ar_DZ\";s:16:\"Arabic (Algeria)\";s:5:\"ar_BH\";s:16:\"Arabic (Bahrain)\";s:5:\"ar_TD\";s:13:\"Arabic (Chad)\";s:5:\"ar_KM\";s:16:\"Arabic (Comoros)\";s:5:\"ar_DJ\";s:17:\"Arabic (Djibouti)\";s:5:\"ar_EG\";s:14:\"Arabic (Egypt)\";s:5:\"ar_ER\";s:16:\"Arabic (Eritrea)\";s:5:\"ar_IQ\";s:13:\"Arabic (Iraq)\";s:5:\"ar_IL\";s:15:\"Arabic (Israel)\";s:5:\"ar_JO\";s:15:\"Arabic (Jordan)\";s:5:\"ar_KW\";s:15:\"Arabic (Kuwait)\";s:5:\"ar_LB\";s:16:\"Arabic (Lebanon)\";s:5:\"ar_LY\";s:14:\"Arabic (Libya)\";s:5:\"ar_MR\";s:19:\"Arabic (Mauritania)\";s:5:\"ar_MA\";s:16:\"Arabic (Morocco)\";s:5:\"ar_OM\";s:13:\"Arabic (Oman)\";s:5:\"ar_PS\";s:32:\"Arabic (Palestinian Territories)\";s:5:\"ar_QA\";s:14:\"Arabic (Qatar)\";s:5:\"ar_SA\";s:21:\"Arabic (Saudi Arabia)\";s:5:\"ar_SO\";s:16:\"Arabic (Somalia)\";s:5:\"ar_SS\";s:20:\"Arabic (South Sudan)\";s:5:\"ar_SD\";s:14:\"Arabic (Sudan)\";s:5:\"ar_SY\";s:14:\"Arabic (Syria)\";s:5:\"ar_TN\";s:16:\"Arabic (Tunisia)\";s:5:\"ar_AE\";s:29:\"Arabic (United Arab Emirates)\";s:5:\"ar_EH\";s:23:\"Arabic (Western Sahara)\";s:6:\"ar_001\";s:14:\"Arabic (World)\";s:5:\"ar_YE\";s:14:\"Arabic (Yemen)\";s:2:\"hy\";s:8:\"Armenian\";s:5:\"hy_AM\";s:18:\"Armenian (Armenia)\";s:2:\"as\";s:8:\"Assamese\";s:5:\"as_IN\";s:16:\"Assamese (India)\";s:3:\"ast\";s:8:\"Asturian\";s:6:\"ast_ES\";s:16:\"Asturian (Spain)\";s:3:\"asa\";s:3:\"Asu\";s:6:\"asa_TZ\";s:14:\"Asu (Tanzania)\";s:2:\"az\";s:11:\"Azerbaijani\";s:7:\"az_Latn\";s:11:\"Azerbaijani\";s:7:\"az_Cyrl\";s:11:\"Azerbaijani\";s:10:\"az_Latn_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:10:\"az_Cyrl_AZ\";s:24:\"Azerbaijani (Azerbaijan)\";s:3:\"ksf\";s:5:\"Bafia\";s:6:\"ksf_CM\";s:16:\"Bafia (Cameroon)\";s:2:\"bm\";s:7:\"Bambara\";s:5:\"bm_ML\";s:14:\"Bambara (Mali)\";s:2:\"bn\";s:6:\"Bangla\";s:5:\"bn_BD\";s:19:\"Bangla (Bangladesh)\";s:5:\"bn_IN\";s:14:\"Bangla (India)\";s:3:\"bas\";s:5:\"Basaa\";s:6:\"bas_CM\";s:16:\"Basaa (Cameroon)\";s:2:\"eu\";s:6:\"Basque\";s:5:\"eu_ES\";s:14:\"Basque (Spain)\";s:2:\"be\";s:10:\"Belarusian\";s:5:\"be_BY\";s:20:\"Belarusian (Belarus)\";s:3:\"bem\";s:5:\"Bemba\";s:6:\"bem_ZM\";s:14:\"Bemba (Zambia)\";s:3:\"bez\";s:4:\"Bena\";s:6:\"bez_TZ\";s:15:\"Bena (Tanzania)\";s:3:\"brx\";s:4:\"Bodo\";s:6:\"brx_IN\";s:12:\"Bodo (India)\";s:2:\"bs\";s:7:\"Bosnian\";s:7:\"bs_Cyrl\";s:7:\"Bosnian\";s:7:\"bs_Latn\";s:7:\"Bosnian\";s:10:\"bs_Cyrl_BA\";s:30:\"Bosnian (Bosnia & Herzegovina)\";s:10:\"bs_Latn_BA\";s:30:\"Bosnian (Bosnia & Herzegovina)\";s:2:\"br\";s:6:\"Breton\";s:5:\"br_FR\";s:15:\"Breton (France)\";s:2:\"bg\";s:9:\"Bulgarian\";s:5:\"bg_BG\";s:20:\"Bulgarian (Bulgaria)\";s:2:\"my\";s:7:\"Burmese\";s:5:\"my_MM\";s:25:\"Burmese (Myanmar (Burma))\";s:3:\"yue\";s:9:\"Cantonese\";s:8:\"yue_Hans\";s:9:\"Cantonese\";s:8:\"yue_Hant\";s:9:\"Cantonese\";s:11:\"yue_Hans_CN\";s:17:\"Cantonese (China)\";s:11:\"yue_Hant_HK\";s:31:\"Cantonese (Hong Kong SAR China)\";s:2:\"ca\";s:7:\"Catalan\";s:5:\"ca_AD\";s:17:\"Catalan (Andorra)\";s:5:\"ca_FR\";s:16:\"Catalan (France)\";s:5:\"ca_IT\";s:15:\"Catalan (Italy)\";s:5:\"ca_ES\";s:15:\"Catalan (Spain)\";s:3:\"ceb\";s:7:\"Cebuano\";s:6:\"ceb_PH\";s:21:\"Cebuano (Philippines)\";s:3:\"tzm\";s:23:\"Central Atlas Tamazight\";s:6:\"tzm_MA\";s:33:\"Central Atlas Tamazight (Morocco)\";s:3:\"ckb\";s:15:\"Central Kurdish\";s:6:\"ckb_IR\";s:22:\"Central Kurdish (Iran)\";s:6:\"ckb_IQ\";s:22:\"Central Kurdish (Iraq)\";s:3:\"ccp\";s:6:\"Chakma\";s:6:\"ccp_BD\";s:19:\"Chakma (Bangladesh)\";s:6:\"ccp_IN\";s:14:\"Chakma (India)\";s:2:\"ce\";s:7:\"Chechen\";s:5:\"ce_RU\";s:16:\"Chechen (Russia)\";s:3:\"chr\";s:8:\"Cherokee\";s:6:\"chr_US\";s:24:\"Cherokee (United States)\";s:3:\"cgg\";s:5:\"Chiga\";s:6:\"cgg_UG\";s:14:\"Chiga (Uganda)\";s:7:\"zh_Hans\";s:7:\"Chinese\";s:7:\"zh_Hant\";s:7:\"Chinese\";s:2:\"zh\";s:7:\"Chinese\";s:10:\"zh_Hans_CN\";s:15:\"Chinese (China)\";s:10:\"zh_Hans_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:10:\"zh_Hant_HK\";s:29:\"Chinese (Hong Kong SAR China)\";s:10:\"zh_Hant_MO\";s:25:\"Chinese (Macao SAR China)\";s:10:\"zh_Hans_MO\";s:25:\"Chinese (Macao SAR China)\";s:10:\"zh_Hans_SG\";s:19:\"Chinese (Singapore)\";s:10:\"zh_Hant_TW\";s:16:\"Chinese (Taiwan)\";s:3:\"ksh\";s:9:\"Colognian\";s:6:\"ksh_DE\";s:19:\"Colognian (Germany)\";s:2:\"kw\";s:7:\"Cornish\";s:5:\"kw_GB\";s:24:\"Cornish (United Kingdom)\";s:2:\"hr\";s:8:\"Croatian\";s:5:\"hr_BA\";s:31:\"Croatian (Bosnia & Herzegovina)\";s:5:\"hr_HR\";s:18:\"Croatian (Croatia)\";s:2:\"cs\";s:5:\"Czech\";s:5:\"cs_CZ\";s:15:\"Czech (Czechia)\";s:2:\"da\";s:6:\"Danish\";s:5:\"da_DK\";s:16:\"Danish (Denmark)\";s:5:\"da_GL\";s:18:\"Danish (Greenland)\";s:3:\"dua\";s:5:\"Duala\";s:6:\"dua_CM\";s:16:\"Duala (Cameroon)\";s:2:\"nl\";s:5:\"Dutch\";s:5:\"nl_AW\";s:13:\"Dutch (Aruba)\";s:5:\"nl_BE\";s:15:\"Dutch (Belgium)\";s:5:\"nl_BQ\";s:29:\"Dutch (Caribbean Netherlands)\";s:5:\"nl_CW\";s:16:\"Dutch (Curaçao)\";s:5:\"nl_NL\";s:19:\"Dutch (Netherlands)\";s:5:\"nl_SX\";s:20:\"Dutch (Sint Maarten)\";s:5:\"nl_SR\";s:16:\"Dutch (Suriname)\";s:2:\"dz\";s:8:\"Dzongkha\";s:5:\"dz_BT\";s:17:\"Dzongkha (Bhutan)\";s:3:\"ebu\";s:4:\"Embu\";s:6:\"ebu_KE\";s:12:\"Embu (Kenya)\";s:2:\"en\";s:7:\"English\";s:5:\"en_AS\";s:24:\"English (American Samoa)\";s:5:\"en_AI\";s:18:\"English (Anguilla)\";s:5:\"en_AG\";s:27:\"English (Antigua & Barbuda)\";s:5:\"en_AU\";s:19:\"English (Australia)\";s:5:\"en_AT\";s:17:\"English (Austria)\";s:5:\"en_BS\";s:17:\"English (Bahamas)\";s:5:\"en_BB\";s:18:\"English (Barbados)\";s:5:\"en_BE\";s:17:\"English (Belgium)\";s:5:\"en_BZ\";s:16:\"English (Belize)\";s:5:\"en_BM\";s:17:\"English (Bermuda)\";s:5:\"en_BW\";s:18:\"English (Botswana)\";s:5:\"en_IO\";s:40:\"English (British Indian Ocean Territory)\";s:5:\"en_VG\";s:32:\"English (British Virgin Islands)\";s:5:\"en_BI\";s:17:\"English (Burundi)\";s:5:\"en_CM\";s:18:\"English (Cameroon)\";s:5:\"en_CA\";s:16:\"English (Canada)\";s:5:\"en_KY\";s:24:\"English (Cayman Islands)\";s:5:\"en_CX\";s:26:\"English (Christmas Island)\";s:5:\"en_CC\";s:33:\"English (Cocos (Keeling) Islands)\";s:5:\"en_CK\";s:22:\"English (Cook Islands)\";s:5:\"en_CY\";s:16:\"English (Cyprus)\";s:5:\"en_DK\";s:17:\"English (Denmark)\";s:5:\"en_DG\";s:22:\"English (Diego Garcia)\";s:5:\"en_DM\";s:18:\"English (Dominica)\";s:5:\"en_ER\";s:17:\"English (Eritrea)\";s:5:\"en_SZ\";s:18:\"English (Eswatini)\";s:6:\"en_150\";s:16:\"English (Europe)\";s:5:\"en_FK\";s:26:\"English (Falkland Islands)\";s:5:\"en_FJ\";s:14:\"English (Fiji)\";s:5:\"en_FI\";s:17:\"English (Finland)\";s:5:\"en_GM\";s:16:\"English (Gambia)\";s:5:\"en_DE\";s:17:\"English (Germany)\";s:5:\"en_GH\";s:15:\"English (Ghana)\";s:5:\"en_GI\";s:19:\"English (Gibraltar)\";s:5:\"en_GD\";s:17:\"English (Grenada)\";s:5:\"en_GU\";s:14:\"English (Guam)\";s:5:\"en_GG\";s:18:\"English (Guernsey)\";s:5:\"en_GY\";s:16:\"English (Guyana)\";s:5:\"en_HK\";s:29:\"English (Hong Kong SAR China)\";s:5:\"en_IN\";s:15:\"English (India)\";s:5:\"en_IE\";s:17:\"English (Ireland)\";s:5:\"en_IM\";s:21:\"English (Isle of Man)\";s:5:\"en_IL\";s:16:\"English (Israel)\";s:5:\"en_JM\";s:17:\"English (Jamaica)\";s:5:\"en_JE\";s:16:\"English (Jersey)\";s:5:\"en_KE\";s:15:\"English (Kenya)\";s:5:\"en_KI\";s:18:\"English (Kiribati)\";s:5:\"en_LS\";s:17:\"English (Lesotho)\";s:5:\"en_LR\";s:17:\"English (Liberia)\";s:5:\"en_MO\";s:25:\"English (Macao SAR China)\";s:5:\"en_MG\";s:20:\"English (Madagascar)\";s:5:\"en_MW\";s:16:\"English (Malawi)\";s:5:\"en_MY\";s:18:\"English (Malaysia)\";s:5:\"en_MT\";s:15:\"English (Malta)\";s:5:\"en_MH\";s:26:\"English (Marshall Islands)\";s:5:\"en_MU\";s:19:\"English (Mauritius)\";s:5:\"en_FM\";s:20:\"English (Micronesia)\";s:5:\"en_MS\";s:20:\"English (Montserrat)\";s:5:\"en_NA\";s:17:\"English (Namibia)\";s:5:\"en_NR\";s:15:\"English (Nauru)\";s:5:\"en_NL\";s:21:\"English (Netherlands)\";s:5:\"en_NZ\";s:21:\"English (New Zealand)\";s:5:\"en_NG\";s:17:\"English (Nigeria)\";s:5:\"en_NU\";s:14:\"English (Niue)\";s:5:\"en_NF\";s:24:\"English (Norfolk Island)\";s:5:\"en_MP\";s:34:\"English (Northern Mariana Islands)\";s:5:\"en_PK\";s:18:\"English (Pakistan)\";s:5:\"en_PW\";s:15:\"English (Palau)\";s:5:\"en_PG\";s:26:\"English (Papua New Guinea)\";s:5:\"en_PH\";s:21:\"English (Philippines)\";s:5:\"en_PN\";s:26:\"English (Pitcairn Islands)\";s:5:\"en_PR\";s:21:\"English (Puerto Rico)\";s:5:\"en_RW\";s:16:\"English (Rwanda)\";s:5:\"en_WS\";s:15:\"English (Samoa)\";s:5:\"en_SC\";s:20:\"English (Seychelles)\";s:5:\"en_SL\";s:22:\"English (Sierra Leone)\";s:5:\"en_SG\";s:19:\"English (Singapore)\";s:5:\"en_SX\";s:22:\"English (Sint Maarten)\";s:5:\"en_SI\";s:18:\"English (Slovenia)\";s:5:\"en_SB\";s:25:\"English (Solomon Islands)\";s:5:\"en_ZA\";s:22:\"English (South Africa)\";s:5:\"en_SS\";s:21:\"English (South Sudan)\";s:5:\"en_SH\";s:20:\"English (St. Helena)\";s:5:\"en_KN\";s:27:\"English (St. Kitts & Nevis)\";s:5:\"en_LC\";s:19:\"English (St. Lucia)\";s:5:\"en_VC\";s:34:\"English (St. Vincent & Grenadines)\";s:5:\"en_SD\";s:15:\"English (Sudan)\";s:5:\"en_SE\";s:16:\"English (Sweden)\";s:5:\"en_CH\";s:21:\"English (Switzerland)\";s:5:\"en_TZ\";s:18:\"English (Tanzania)\";s:5:\"en_TK\";s:17:\"English (Tokelau)\";s:5:\"en_TO\";s:15:\"English (Tonga)\";s:5:\"en_TT\";s:27:\"English (Trinidad & Tobago)\";s:5:\"en_TC\";s:32:\"English (Turks & Caicos Islands)\";s:5:\"en_TV\";s:16:\"English (Tuvalu)\";s:5:\"en_UM\";s:31:\"English (U.S. Outlying Islands)\";s:5:\"en_VI\";s:29:\"English (U.S. Virgin Islands)\";s:5:\"en_UG\";s:16:\"English (Uganda)\";s:5:\"en_AE\";s:30:\"English (United Arab Emirates)\";s:5:\"en_GB\";s:24:\"English (United Kingdom)\";s:11:\"en_US_POSIX\";s:23:\"English (United States)\";s:5:\"en_US\";s:23:\"English (United States)\";s:5:\"en_VU\";s:17:\"English (Vanuatu)\";s:6:\"en_001\";s:15:\"English (World)\";s:5:\"en_ZM\";s:16:\"English (Zambia)\";s:5:\"en_ZW\";s:18:\"English (Zimbabwe)\";s:2:\"eo\";s:9:\"Esperanto\";s:6:\"eo_001\";s:17:\"Esperanto (World)\";s:2:\"et\";s:8:\"Estonian\";s:5:\"et_EE\";s:18:\"Estonian (Estonia)\";s:2:\"ee\";s:3:\"Ewe\";s:5:\"ee_GH\";s:11:\"Ewe (Ghana)\";s:5:\"ee_TG\";s:10:\"Ewe (Togo)\";s:3:\"ewo\";s:6:\"Ewondo\";s:6:\"ewo_CM\";s:17:\"Ewondo (Cameroon)\";s:2:\"fo\";s:7:\"Faroese\";s:5:\"fo_DK\";s:17:\"Faroese (Denmark)\";s:5:\"fo_FO\";s:23:\"Faroese (Faroe Islands)\";s:3:\"fil\";s:8:\"Filipino\";s:6:\"fil_PH\";s:22:\"Filipino (Philippines)\";s:2:\"fi\";s:7:\"Finnish\";s:5:\"fi_FI\";s:17:\"Finnish (Finland)\";s:2:\"fr\";s:6:\"French\";s:5:\"fr_DZ\";s:16:\"French (Algeria)\";s:5:\"fr_BE\";s:16:\"French (Belgium)\";s:5:\"fr_BJ\";s:14:\"French (Benin)\";s:5:\"fr_BF\";s:21:\"French (Burkina Faso)\";s:5:\"fr_BI\";s:16:\"French (Burundi)\";s:5:\"fr_CM\";s:17:\"French (Cameroon)\";s:5:\"fr_CA\";s:15:\"French (Canada)\";s:5:\"fr_CF\";s:33:\"French (Central African Republic)\";s:5:\"fr_TD\";s:13:\"French (Chad)\";s:5:\"fr_KM\";s:16:\"French (Comoros)\";s:5:\"fr_CG\";s:28:\"French (Congo - Brazzaville)\";s:5:\"fr_CD\";s:25:\"French (Congo - Kinshasa)\";s:5:\"fr_CI\";s:25:\"French (Côte d’Ivoire)\";s:5:\"fr_DJ\";s:17:\"French (Djibouti)\";s:5:\"fr_GQ\";s:26:\"French (Equatorial Guinea)\";s:5:\"fr_FR\";s:15:\"French (France)\";s:5:\"fr_GF\";s:22:\"French (French Guiana)\";s:5:\"fr_PF\";s:25:\"French (French Polynesia)\";s:5:\"fr_GA\";s:14:\"French (Gabon)\";s:5:\"fr_GP\";s:19:\"French (Guadeloupe)\";s:5:\"fr_GN\";s:15:\"French (Guinea)\";s:5:\"fr_HT\";s:14:\"French (Haiti)\";s:5:\"fr_LU\";s:19:\"French (Luxembourg)\";s:5:\"fr_MG\";s:19:\"French (Madagascar)\";s:5:\"fr_ML\";s:13:\"French (Mali)\";s:5:\"fr_MQ\";s:19:\"French (Martinique)\";s:5:\"fr_MR\";s:19:\"French (Mauritania)\";s:5:\"fr_MU\";s:18:\"French (Mauritius)\";s:5:\"fr_YT\";s:16:\"French (Mayotte)\";s:5:\"fr_MC\";s:15:\"French (Monaco)\";s:5:\"fr_MA\";s:16:\"French (Morocco)\";s:5:\"fr_NC\";s:22:\"French (New Caledonia)\";s:5:\"fr_NE\";s:14:\"French (Niger)\";s:5:\"fr_RW\";s:15:\"French (Rwanda)\";s:5:\"fr_RE\";s:17:\"French (Réunion)\";s:5:\"fr_SN\";s:16:\"French (Senegal)\";s:5:\"fr_SC\";s:19:\"French (Seychelles)\";s:5:\"fr_BL\";s:24:\"French (St. Barthélemy)\";s:5:\"fr_MF\";s:19:\"French (St. Martin)\";s:5:\"fr_PM\";s:30:\"French (St. Pierre & Miquelon)\";s:5:\"fr_CH\";s:20:\"French (Switzerland)\";s:5:\"fr_SY\";s:14:\"French (Syria)\";s:5:\"fr_TG\";s:13:\"French (Togo)\";s:5:\"fr_TN\";s:16:\"French (Tunisia)\";s:5:\"fr_VU\";s:16:\"French (Vanuatu)\";s:5:\"fr_WF\";s:24:\"French (Wallis & Futuna)\";s:3:\"fur\";s:8:\"Friulian\";s:6:\"fur_IT\";s:16:\"Friulian (Italy)\";s:7:\"ff_Latn\";s:5:\"Fulah\";s:2:\"ff\";s:5:\"Fulah\";s:10:\"ff_Latn_BF\";s:20:\"Fulah (Burkina Faso)\";s:10:\"ff_Latn_CM\";s:16:\"Fulah (Cameroon)\";s:10:\"ff_Latn_GM\";s:14:\"Fulah (Gambia)\";s:10:\"ff_Latn_GH\";s:13:\"Fulah (Ghana)\";s:10:\"ff_Latn_GN\";s:14:\"Fulah (Guinea)\";s:10:\"ff_Latn_GW\";s:21:\"Fulah (Guinea-Bissau)\";s:10:\"ff_Latn_LR\";s:15:\"Fulah (Liberia)\";s:10:\"ff_Latn_MR\";s:18:\"Fulah (Mauritania)\";s:10:\"ff_Latn_NE\";s:13:\"Fulah (Niger)\";s:10:\"ff_Latn_NG\";s:15:\"Fulah (Nigeria)\";s:10:\"ff_Latn_SN\";s:15:\"Fulah (Senegal)\";s:10:\"ff_Latn_SL\";s:20:\"Fulah (Sierra Leone)\";s:2:\"gl\";s:8:\"Galician\";s:5:\"gl_ES\";s:16:\"Galician (Spain)\";s:2:\"lg\";s:5:\"Ganda\";s:5:\"lg_UG\";s:14:\"Ganda (Uganda)\";s:2:\"ka\";s:8:\"Georgian\";s:5:\"ka_GE\";s:18:\"Georgian (Georgia)\";s:2:\"de\";s:6:\"German\";s:5:\"de_AT\";s:16:\"German (Austria)\";s:5:\"de_BE\";s:16:\"German (Belgium)\";s:5:\"de_DE\";s:16:\"German (Germany)\";s:5:\"de_IT\";s:14:\"German (Italy)\";s:5:\"de_LI\";s:22:\"German (Liechtenstein)\";s:5:\"de_LU\";s:19:\"German (Luxembourg)\";s:5:\"de_CH\";s:20:\"German (Switzerland)\";s:2:\"el\";s:5:\"Greek\";s:5:\"el_CY\";s:14:\"Greek (Cyprus)\";s:5:\"el_GR\";s:14:\"Greek (Greece)\";s:2:\"gu\";s:8:\"Gujarati\";s:5:\"gu_IN\";s:16:\"Gujarati (India)\";s:3:\"guz\";s:5:\"Gusii\";s:6:\"guz_KE\";s:13:\"Gusii (Kenya)\";s:2:\"ha\";s:5:\"Hausa\";s:5:\"ha_GH\";s:13:\"Hausa (Ghana)\";s:5:\"ha_NE\";s:13:\"Hausa (Niger)\";s:5:\"ha_NG\";s:15:\"Hausa (Nigeria)\";s:3:\"haw\";s:8:\"Hawaiian\";s:6:\"haw_US\";s:24:\"Hawaiian (United States)\";s:2:\"he\";s:6:\"Hebrew\";s:5:\"he_IL\";s:15:\"Hebrew (Israel)\";s:2:\"hi\";s:5:\"Hindi\";s:5:\"hi_IN\";s:13:\"Hindi (India)\";s:2:\"hu\";s:9:\"Hungarian\";s:5:\"hu_HU\";s:19:\"Hungarian (Hungary)\";s:2:\"is\";s:9:\"Icelandic\";s:5:\"is_IS\";s:19:\"Icelandic (Iceland)\";s:2:\"ig\";s:4:\"Igbo\";s:5:\"ig_NG\";s:14:\"Igbo (Nigeria)\";s:3:\"smn\";s:10:\"Inari Sami\";s:6:\"smn_FI\";s:20:\"Inari Sami (Finland)\";s:2:\"id\";s:10:\"Indonesian\";s:5:\"id_ID\";s:22:\"Indonesian (Indonesia)\";s:2:\"ia\";s:11:\"Interlingua\";s:6:\"ia_001\";s:19:\"Interlingua (World)\";s:2:\"ga\";s:5:\"Irish\";s:5:\"ga_IE\";s:15:\"Irish (Ireland)\";s:5:\"ga_GB\";s:22:\"Irish (United Kingdom)\";s:2:\"it\";s:7:\"Italian\";s:5:\"it_IT\";s:15:\"Italian (Italy)\";s:5:\"it_SM\";s:20:\"Italian (San Marino)\";s:5:\"it_CH\";s:21:\"Italian (Switzerland)\";s:5:\"it_VA\";s:22:\"Italian (Vatican City)\";s:2:\"ja\";s:8:\"Japanese\";s:5:\"ja_JP\";s:16:\"Japanese (Japan)\";s:2:\"jv\";s:8:\"Javanese\";s:5:\"jv_ID\";s:20:\"Javanese (Indonesia)\";s:3:\"dyo\";s:10:\"Jola-Fonyi\";s:6:\"dyo_SN\";s:20:\"Jola-Fonyi (Senegal)\";s:3:\"kea\";s:12:\"Kabuverdianu\";s:6:\"kea_CV\";s:25:\"Kabuverdianu (Cape Verde)\";s:3:\"kab\";s:6:\"Kabyle\";s:6:\"kab_DZ\";s:16:\"Kabyle (Algeria)\";s:3:\"kkj\";s:4:\"Kako\";s:6:\"kkj_CM\";s:15:\"Kako (Cameroon)\";s:2:\"kl\";s:11:\"Kalaallisut\";s:5:\"kl_GL\";s:23:\"Kalaallisut (Greenland)\";s:3:\"kln\";s:8:\"Kalenjin\";s:6:\"kln_KE\";s:16:\"Kalenjin (Kenya)\";s:3:\"kam\";s:5:\"Kamba\";s:6:\"kam_KE\";s:13:\"Kamba (Kenya)\";s:2:\"kn\";s:7:\"Kannada\";s:5:\"kn_IN\";s:15:\"Kannada (India)\";s:2:\"ks\";s:8:\"Kashmiri\";s:5:\"ks_IN\";s:16:\"Kashmiri (India)\";s:2:\"kk\";s:6:\"Kazakh\";s:5:\"kk_KZ\";s:19:\"Kazakh (Kazakhstan)\";s:2:\"km\";s:5:\"Khmer\";s:5:\"km_KH\";s:16:\"Khmer (Cambodia)\";s:2:\"ki\";s:6:\"Kikuyu\";s:5:\"ki_KE\";s:14:\"Kikuyu (Kenya)\";s:2:\"rw\";s:11:\"Kinyarwanda\";s:5:\"rw_RW\";s:20:\"Kinyarwanda (Rwanda)\";s:3:\"kok\";s:7:\"Konkani\";s:6:\"kok_IN\";s:15:\"Konkani (India)\";s:2:\"ko\";s:6:\"Korean\";s:5:\"ko_KP\";s:20:\"Korean (North Korea)\";s:5:\"ko_KR\";s:20:\"Korean (South Korea)\";s:3:\"khq\";s:12:\"Koyra Chiini\";s:6:\"khq_ML\";s:19:\"Koyra Chiini (Mali)\";s:3:\"ses\";s:15:\"Koyraboro Senni\";s:6:\"ses_ML\";s:22:\"Koyraboro Senni (Mali)\";s:2:\"ku\";s:7:\"Kurdish\";s:5:\"ku_TR\";s:16:\"Kurdish (Turkey)\";s:3:\"nmg\";s:6:\"Kwasio\";s:6:\"nmg_CM\";s:17:\"Kwasio (Cameroon)\";s:2:\"ky\";s:6:\"Kyrgyz\";s:5:\"ky_KG\";s:19:\"Kyrgyz (Kyrgyzstan)\";s:3:\"lkt\";s:6:\"Lakota\";s:6:\"lkt_US\";s:22:\"Lakota (United States)\";s:3:\"lag\";s:5:\"Langi\";s:6:\"lag_TZ\";s:16:\"Langi (Tanzania)\";s:2:\"lo\";s:3:\"Lao\";s:5:\"lo_LA\";s:10:\"Lao (Laos)\";s:2:\"lv\";s:7:\"Latvian\";s:5:\"lv_LV\";s:16:\"Latvian (Latvia)\";s:2:\"ln\";s:7:\"Lingala\";s:5:\"ln_AO\";s:16:\"Lingala (Angola)\";s:5:\"ln_CF\";s:34:\"Lingala (Central African Republic)\";s:5:\"ln_CG\";s:29:\"Lingala (Congo - Brazzaville)\";s:5:\"ln_CD\";s:26:\"Lingala (Congo - Kinshasa)\";s:2:\"lt\";s:10:\"Lithuanian\";s:5:\"lt_LT\";s:22:\"Lithuanian (Lithuania)\";s:3:\"nds\";s:10:\"Low German\";s:6:\"nds_DE\";s:20:\"Low German (Germany)\";s:6:\"nds_NL\";s:24:\"Low German (Netherlands)\";s:3:\"dsb\";s:13:\"Lower Sorbian\";s:6:\"dsb_DE\";s:23:\"Lower Sorbian (Germany)\";s:2:\"lu\";s:12:\"Luba-Katanga\";s:5:\"lu_CD\";s:31:\"Luba-Katanga (Congo - Kinshasa)\";s:3:\"luo\";s:3:\"Luo\";s:6:\"luo_KE\";s:11:\"Luo (Kenya)\";s:2:\"lb\";s:13:\"Luxembourgish\";s:5:\"lb_LU\";s:26:\"Luxembourgish (Luxembourg)\";s:3:\"luy\";s:5:\"Luyia\";s:6:\"luy_KE\";s:13:\"Luyia (Kenya)\";s:2:\"mk\";s:10:\"Macedonian\";s:5:\"mk_MK\";s:28:\"Macedonian (North Macedonia)\";s:3:\"jmc\";s:7:\"Machame\";s:6:\"jmc_TZ\";s:18:\"Machame (Tanzania)\";s:3:\"mgh\";s:14:\"Makhuwa-Meetto\";s:6:\"mgh_MZ\";s:27:\"Makhuwa-Meetto (Mozambique)\";s:3:\"kde\";s:7:\"Makonde\";s:6:\"kde_TZ\";s:18:\"Makonde (Tanzania)\";s:2:\"mg\";s:8:\"Malagasy\";s:5:\"mg_MG\";s:21:\"Malagasy (Madagascar)\";s:2:\"ms\";s:5:\"Malay\";s:5:\"ms_BN\";s:14:\"Malay (Brunei)\";s:5:\"ms_MY\";s:16:\"Malay (Malaysia)\";s:5:\"ms_SG\";s:17:\"Malay (Singapore)\";s:2:\"ml\";s:9:\"Malayalam\";s:5:\"ml_IN\";s:17:\"Malayalam (India)\";s:2:\"mt\";s:7:\"Maltese\";s:5:\"mt_MT\";s:15:\"Maltese (Malta)\";s:2:\"gv\";s:4:\"Manx\";s:5:\"gv_IM\";s:18:\"Manx (Isle of Man)\";s:2:\"mi\";s:5:\"Maori\";s:5:\"mi_NZ\";s:19:\"Maori (New Zealand)\";s:2:\"mr\";s:7:\"Marathi\";s:5:\"mr_IN\";s:15:\"Marathi (India)\";s:3:\"mas\";s:5:\"Masai\";s:6:\"mas_KE\";s:13:\"Masai (Kenya)\";s:6:\"mas_TZ\";s:16:\"Masai (Tanzania)\";s:3:\"mzn\";s:11:\"Mazanderani\";s:6:\"mzn_IR\";s:18:\"Mazanderani (Iran)\";s:3:\"mer\";s:4:\"Meru\";s:6:\"mer_KE\";s:12:\"Meru (Kenya)\";s:3:\"mgo\";s:6:\"Metaʼ\";s:6:\"mgo_CM\";s:17:\"Metaʼ (Cameroon)\";s:2:\"mn\";s:9:\"Mongolian\";s:5:\"mn_MN\";s:20:\"Mongolian (Mongolia)\";s:3:\"mfe\";s:8:\"Morisyen\";s:6:\"mfe_MU\";s:20:\"Morisyen (Mauritius)\";s:3:\"mua\";s:7:\"Mundang\";s:6:\"mua_CM\";s:18:\"Mundang (Cameroon)\";s:3:\"naq\";s:4:\"Nama\";s:6:\"naq_NA\";s:14:\"Nama (Namibia)\";s:2:\"ne\";s:6:\"Nepali\";s:5:\"ne_IN\";s:14:\"Nepali (India)\";s:5:\"ne_NP\";s:14:\"Nepali (Nepal)\";s:3:\"nnh\";s:9:\"Ngiemboon\";s:6:\"nnh_CM\";s:20:\"Ngiemboon (Cameroon)\";s:3:\"jgo\";s:6:\"Ngomba\";s:6:\"jgo_CM\";s:17:\"Ngomba (Cameroon)\";s:2:\"nd\";s:13:\"North Ndebele\";s:5:\"nd_ZW\";s:24:\"North Ndebele (Zimbabwe)\";s:3:\"lrc\";s:13:\"Northern Luri\";s:6:\"lrc_IR\";s:20:\"Northern Luri (Iran)\";s:6:\"lrc_IQ\";s:20:\"Northern Luri (Iraq)\";s:2:\"se\";s:13:\"Northern Sami\";s:5:\"se_FI\";s:23:\"Northern Sami (Finland)\";s:5:\"se_NO\";s:22:\"Northern Sami (Norway)\";s:5:\"se_SE\";s:22:\"Northern Sami (Sweden)\";s:2:\"nb\";s:17:\"Norwegian Bokmål\";s:5:\"nb_NO\";s:26:\"Norwegian Bokmål (Norway)\";s:5:\"nb_SJ\";s:40:\"Norwegian Bokmål (Svalbard & Jan Mayen)\";s:2:\"nn\";s:17:\"Norwegian Nynorsk\";s:5:\"nn_NO\";s:26:\"Norwegian Nynorsk (Norway)\";s:3:\"nus\";s:4:\"Nuer\";s:6:\"nus_SS\";s:18:\"Nuer (South Sudan)\";s:3:\"nyn\";s:8:\"Nyankole\";s:6:\"nyn_UG\";s:17:\"Nyankole (Uganda)\";s:2:\"or\";s:4:\"Odia\";s:5:\"or_IN\";s:12:\"Odia (India)\";s:2:\"om\";s:5:\"Oromo\";s:5:\"om_ET\";s:16:\"Oromo (Ethiopia)\";s:5:\"om_KE\";s:13:\"Oromo (Kenya)\";s:2:\"os\";s:7:\"Ossetic\";s:5:\"os_GE\";s:17:\"Ossetic (Georgia)\";s:5:\"os_RU\";s:16:\"Ossetic (Russia)\";s:2:\"ps\";s:6:\"Pashto\";s:5:\"ps_AF\";s:20:\"Pashto (Afghanistan)\";s:5:\"ps_PK\";s:17:\"Pashto (Pakistan)\";s:2:\"fa\";s:7:\"Persian\";s:5:\"fa_AF\";s:21:\"Persian (Afghanistan)\";s:5:\"fa_IR\";s:14:\"Persian (Iran)\";s:2:\"pl\";s:6:\"Polish\";s:5:\"pl_PL\";s:15:\"Polish (Poland)\";s:2:\"pt\";s:10:\"Portuguese\";s:5:\"pt_AO\";s:19:\"Portuguese (Angola)\";s:5:\"pt_BR\";s:19:\"Portuguese (Brazil)\";s:5:\"pt_CV\";s:23:\"Portuguese (Cape Verde)\";s:5:\"pt_GQ\";s:30:\"Portuguese (Equatorial Guinea)\";s:5:\"pt_GW\";s:26:\"Portuguese (Guinea-Bissau)\";s:5:\"pt_LU\";s:23:\"Portuguese (Luxembourg)\";s:5:\"pt_MO\";s:28:\"Portuguese (Macao SAR China)\";s:5:\"pt_MZ\";s:23:\"Portuguese (Mozambique)\";s:5:\"pt_PT\";s:21:\"Portuguese (Portugal)\";s:5:\"pt_CH\";s:24:\"Portuguese (Switzerland)\";s:5:\"pt_ST\";s:35:\"Portuguese (São Tomé & Príncipe)\";s:5:\"pt_TL\";s:24:\"Portuguese (Timor-Leste)\";s:7:\"pa_Guru\";s:7:\"Punjabi\";s:7:\"pa_Arab\";s:7:\"Punjabi\";s:2:\"pa\";s:7:\"Punjabi\";s:10:\"pa_Guru_IN\";s:15:\"Punjabi (India)\";s:10:\"pa_Arab_PK\";s:18:\"Punjabi (Pakistan)\";s:2:\"qu\";s:7:\"Quechua\";s:5:\"qu_BO\";s:17:\"Quechua (Bolivia)\";s:5:\"qu_EC\";s:17:\"Quechua (Ecuador)\";s:5:\"qu_PE\";s:14:\"Quechua (Peru)\";s:2:\"ro\";s:8:\"Romanian\";s:5:\"ro_MD\";s:18:\"Romanian (Moldova)\";s:5:\"ro_RO\";s:18:\"Romanian (Romania)\";s:2:\"rm\";s:7:\"Romansh\";s:5:\"rm_CH\";s:21:\"Romansh (Switzerland)\";s:3:\"rof\";s:5:\"Rombo\";s:6:\"rof_TZ\";s:16:\"Rombo (Tanzania)\";s:2:\"rn\";s:5:\"Rundi\";s:5:\"rn_BI\";s:15:\"Rundi (Burundi)\";s:2:\"ru\";s:7:\"Russian\";s:5:\"ru_BY\";s:17:\"Russian (Belarus)\";s:5:\"ru_KZ\";s:20:\"Russian (Kazakhstan)\";s:5:\"ru_KG\";s:20:\"Russian (Kyrgyzstan)\";s:5:\"ru_MD\";s:17:\"Russian (Moldova)\";s:5:\"ru_RU\";s:16:\"Russian (Russia)\";s:5:\"ru_UA\";s:17:\"Russian (Ukraine)\";s:3:\"rwk\";s:3:\"Rwa\";s:6:\"rwk_TZ\";s:14:\"Rwa (Tanzania)\";s:3:\"sah\";s:5:\"Sakha\";s:6:\"sah_RU\";s:14:\"Sakha (Russia)\";s:3:\"saq\";s:7:\"Samburu\";s:6:\"saq_KE\";s:15:\"Samburu (Kenya)\";s:2:\"sg\";s:5:\"Sango\";s:5:\"sg_CF\";s:32:\"Sango (Central African Republic)\";s:3:\"sbp\";s:5:\"Sangu\";s:6:\"sbp_TZ\";s:16:\"Sangu (Tanzania)\";s:2:\"gd\";s:15:\"Scottish Gaelic\";s:5:\"gd_GB\";s:32:\"Scottish Gaelic (United Kingdom)\";s:3:\"seh\";s:4:\"Sena\";s:6:\"seh_MZ\";s:17:\"Sena (Mozambique)\";s:2:\"sr\";s:7:\"Serbian\";s:7:\"sr_Latn\";s:7:\"Serbian\";s:7:\"sr_Cyrl\";s:7:\"Serbian\";s:10:\"sr_Cyrl_BA\";s:30:\"Serbian (Bosnia & Herzegovina)\";s:10:\"sr_Latn_BA\";s:30:\"Serbian (Bosnia & Herzegovina)\";s:10:\"sr_Latn_XK\";s:16:\"Serbian (Kosovo)\";s:10:\"sr_Cyrl_XK\";s:16:\"Serbian (Kosovo)\";s:10:\"sr_Latn_ME\";s:20:\"Serbian (Montenegro)\";s:10:\"sr_Cyrl_ME\";s:20:\"Serbian (Montenegro)\";s:10:\"sr_Cyrl_RS\";s:16:\"Serbian (Serbia)\";s:10:\"sr_Latn_RS\";s:16:\"Serbian (Serbia)\";s:3:\"ksb\";s:8:\"Shambala\";s:6:\"ksb_TZ\";s:19:\"Shambala (Tanzania)\";s:2:\"sn\";s:5:\"Shona\";s:5:\"sn_ZW\";s:16:\"Shona (Zimbabwe)\";s:2:\"ii\";s:10:\"Sichuan Yi\";s:5:\"ii_CN\";s:18:\"Sichuan Yi (China)\";s:2:\"sd\";s:6:\"Sindhi\";s:5:\"sd_PK\";s:17:\"Sindhi (Pakistan)\";s:2:\"si\";s:7:\"Sinhala\";s:5:\"si_LK\";s:19:\"Sinhala (Sri Lanka)\";s:2:\"sk\";s:6:\"Slovak\";s:5:\"sk_SK\";s:17:\"Slovak (Slovakia)\";s:2:\"sl\";s:9:\"Slovenian\";s:5:\"sl_SI\";s:20:\"Slovenian (Slovenia)\";s:3:\"xog\";s:4:\"Soga\";s:6:\"xog_UG\";s:13:\"Soga (Uganda)\";s:2:\"so\";s:6:\"Somali\";s:5:\"so_DJ\";s:17:\"Somali (Djibouti)\";s:5:\"so_ET\";s:17:\"Somali (Ethiopia)\";s:5:\"so_KE\";s:14:\"Somali (Kenya)\";s:5:\"so_SO\";s:16:\"Somali (Somalia)\";s:2:\"es\";s:7:\"Spanish\";s:5:\"es_AR\";s:19:\"Spanish (Argentina)\";s:5:\"es_BZ\";s:16:\"Spanish (Belize)\";s:5:\"es_BO\";s:17:\"Spanish (Bolivia)\";s:5:\"es_BR\";s:16:\"Spanish (Brazil)\";s:5:\"es_IC\";s:24:\"Spanish (Canary Islands)\";s:5:\"es_EA\";s:25:\"Spanish (Ceuta & Melilla)\";s:5:\"es_CL\";s:15:\"Spanish (Chile)\";s:5:\"es_CO\";s:18:\"Spanish (Colombia)\";s:5:\"es_CR\";s:20:\"Spanish (Costa Rica)\";s:5:\"es_CU\";s:14:\"Spanish (Cuba)\";s:5:\"es_DO\";s:28:\"Spanish (Dominican Republic)\";s:5:\"es_EC\";s:17:\"Spanish (Ecuador)\";s:5:\"es_SV\";s:21:\"Spanish (El Salvador)\";s:5:\"es_GQ\";s:27:\"Spanish (Equatorial Guinea)\";s:5:\"es_GT\";s:19:\"Spanish (Guatemala)\";s:5:\"es_HN\";s:18:\"Spanish (Honduras)\";s:6:\"es_419\";s:23:\"Spanish (Latin America)\";s:5:\"es_MX\";s:16:\"Spanish (Mexico)\";s:5:\"es_NI\";s:19:\"Spanish (Nicaragua)\";s:5:\"es_PA\";s:16:\"Spanish (Panama)\";s:5:\"es_PY\";s:18:\"Spanish (Paraguay)\";s:5:\"es_PE\";s:14:\"Spanish (Peru)\";s:5:\"es_PH\";s:21:\"Spanish (Philippines)\";s:5:\"es_PR\";s:21:\"Spanish (Puerto Rico)\";s:5:\"es_ES\";s:15:\"Spanish (Spain)\";s:5:\"es_US\";s:23:\"Spanish (United States)\";s:5:\"es_UY\";s:17:\"Spanish (Uruguay)\";s:5:\"es_VE\";s:19:\"Spanish (Venezuela)\";s:3:\"zgh\";s:27:\"Standard Moroccan Tamazight\";s:6:\"zgh_MA\";s:37:\"Standard Moroccan Tamazight (Morocco)\";s:2:\"sw\";s:7:\"Swahili\";s:5:\"sw_CD\";s:26:\"Swahili (Congo - Kinshasa)\";s:5:\"sw_KE\";s:15:\"Swahili (Kenya)\";s:5:\"sw_TZ\";s:18:\"Swahili (Tanzania)\";s:5:\"sw_UG\";s:16:\"Swahili (Uganda)\";s:2:\"sv\";s:7:\"Swedish\";s:5:\"sv_FI\";s:17:\"Swedish (Finland)\";s:5:\"sv_SE\";s:16:\"Swedish (Sweden)\";s:5:\"sv_AX\";s:24:\"Swedish (Åland Islands)\";s:3:\"gsw\";s:12:\"Swiss German\";s:6:\"gsw_FR\";s:21:\"Swiss German (France)\";s:6:\"gsw_LI\";s:28:\"Swiss German (Liechtenstein)\";s:6:\"gsw_CH\";s:26:\"Swiss German (Switzerland)\";s:8:\"shi_Tfng\";s:9:\"Tachelhit\";s:8:\"shi_Latn\";s:9:\"Tachelhit\";s:3:\"shi\";s:9:\"Tachelhit\";s:11:\"shi_Tfng_MA\";s:19:\"Tachelhit (Morocco)\";s:11:\"shi_Latn_MA\";s:19:\"Tachelhit (Morocco)\";s:3:\"dav\";s:5:\"Taita\";s:6:\"dav_KE\";s:13:\"Taita (Kenya)\";s:2:\"tg\";s:5:\"Tajik\";s:5:\"tg_TJ\";s:18:\"Tajik (Tajikistan)\";s:2:\"ta\";s:5:\"Tamil\";s:5:\"ta_IN\";s:13:\"Tamil (India)\";s:5:\"ta_MY\";s:16:\"Tamil (Malaysia)\";s:5:\"ta_SG\";s:17:\"Tamil (Singapore)\";s:5:\"ta_LK\";s:17:\"Tamil (Sri Lanka)\";s:3:\"twq\";s:7:\"Tasawaq\";s:6:\"twq_NE\";s:15:\"Tasawaq (Niger)\";s:2:\"tt\";s:5:\"Tatar\";s:5:\"tt_RU\";s:14:\"Tatar (Russia)\";s:2:\"te\";s:6:\"Telugu\";s:5:\"te_IN\";s:14:\"Telugu (India)\";s:3:\"teo\";s:4:\"Teso\";s:6:\"teo_KE\";s:12:\"Teso (Kenya)\";s:6:\"teo_UG\";s:13:\"Teso (Uganda)\";s:2:\"th\";s:4:\"Thai\";s:5:\"th_TH\";s:15:\"Thai (Thailand)\";s:2:\"bo\";s:7:\"Tibetan\";s:5:\"bo_CN\";s:15:\"Tibetan (China)\";s:5:\"bo_IN\";s:15:\"Tibetan (India)\";s:2:\"ti\";s:8:\"Tigrinya\";s:5:\"ti_ER\";s:18:\"Tigrinya (Eritrea)\";s:5:\"ti_ET\";s:19:\"Tigrinya (Ethiopia)\";s:2:\"to\";s:6:\"Tongan\";s:5:\"to_TO\";s:14:\"Tongan (Tonga)\";s:2:\"tr\";s:7:\"Turkish\";s:5:\"tr_CY\";s:16:\"Turkish (Cyprus)\";s:5:\"tr_TR\";s:16:\"Turkish (Turkey)\";s:2:\"tk\";s:7:\"Turkmen\";s:5:\"tk_TM\";s:22:\"Turkmen (Turkmenistan)\";s:2:\"uk\";s:9:\"Ukrainian\";s:5:\"uk_UA\";s:19:\"Ukrainian (Ukraine)\";s:3:\"hsb\";s:13:\"Upper Sorbian\";s:6:\"hsb_DE\";s:23:\"Upper Sorbian (Germany)\";s:2:\"ur\";s:4:\"Urdu\";s:5:\"ur_IN\";s:12:\"Urdu (India)\";s:5:\"ur_PK\";s:15:\"Urdu (Pakistan)\";s:2:\"ug\";s:6:\"Uyghur\";s:5:\"ug_CN\";s:14:\"Uyghur (China)\";s:7:\"uz_Latn\";s:5:\"Uzbek\";s:7:\"uz_Arab\";s:5:\"Uzbek\";s:2:\"uz\";s:5:\"Uzbek\";s:7:\"uz_Cyrl\";s:5:\"Uzbek\";s:10:\"uz_Arab_AF\";s:19:\"Uzbek (Afghanistan)\";s:10:\"uz_Latn_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:10:\"uz_Cyrl_UZ\";s:18:\"Uzbek (Uzbekistan)\";s:8:\"vai_Vaii\";s:3:\"Vai\";s:3:\"vai\";s:3:\"Vai\";s:8:\"vai_Latn\";s:3:\"Vai\";s:11:\"vai_Vaii_LR\";s:13:\"Vai (Liberia)\";s:11:\"vai_Latn_LR\";s:13:\"Vai (Liberia)\";s:2:\"vi\";s:10:\"Vietnamese\";s:5:\"vi_VN\";s:20:\"Vietnamese (Vietnam)\";s:3:\"vun\";s:5:\"Vunjo\";s:6:\"vun_TZ\";s:16:\"Vunjo (Tanzania)\";s:3:\"wae\";s:6:\"Walser\";s:6:\"wae_CH\";s:20:\"Walser (Switzerland)\";s:2:\"cy\";s:5:\"Welsh\";s:5:\"cy_GB\";s:22:\"Welsh (United Kingdom)\";s:2:\"fy\";s:15:\"Western Frisian\";s:5:\"fy_NL\";s:29:\"Western Frisian (Netherlands)\";s:2:\"wo\";s:5:\"Wolof\";s:5:\"wo_SN\";s:15:\"Wolof (Senegal)\";s:2:\"xh\";s:5:\"Xhosa\";s:5:\"xh_ZA\";s:20:\"Xhosa (South Africa)\";s:3:\"yav\";s:7:\"Yangben\";s:6:\"yav_CM\";s:18:\"Yangben (Cameroon)\";s:2:\"yi\";s:7:\"Yiddish\";s:6:\"yi_001\";s:15:\"Yiddish (World)\";s:2:\"yo\";s:6:\"Yoruba\";s:5:\"yo_BJ\";s:14:\"Yoruba (Benin)\";s:5:\"yo_NG\";s:16:\"Yoruba (Nigeria)\";s:3:\"dje\";s:5:\"Zarma\";s:6:\"dje_NE\";s:13:\"Zarma (Niger)\";s:2:\"zu\";s:4:\"Zulu\";s:5:\"zu_ZA\";s:19:\"Zulu (South Africa)\";}\";',1614107659,1616526858),('translation_data_admin_en',_binary 's:110068:\"O:46:\"Symfony\\Component\\Translation\\MessageCatalogue\":6:{s:56:\"\0Symfony\\Component\\Translation\\MessageCatalogue\0messages\";a:1:{s:5:\"admin\";a:2138:{s:15:\"__pimcore_dummy\";s:12:\"only_a_dummy\";s:17:\"validation_failed\";s:18:\"Validation Failed!\";s:10:\"deprecated\";s:10:\"Deprecated\";s:13:\"access_denied\";s:14:\"Access Denied!\";s:25:\"access_denied_description\";s:88:\"You don\'t have sufficient permissions to open the element or perform the desired action.\";s:11:\"quicksearch\";s:12:\"Quick Search\";s:34:\"you_can_only_drop_one_element_here\";s:35:\"You can only drop one element here!\";s:12:\"grid_options\";s:12:\"Grid Options\";s:16:\"open_data_object\";s:16:\"Open Data Object\";s:12:\"data_objects\";s:12:\"Data Objects\";s:29:\"asset_type_change_not_allowed\";s:127:\"<strong>Only assets of same type are allowed here.</strong><br/>[ type of uploaded asset: \"%s\" | type of existing asset: \"%s\" ]\";s:19:\"unsupported_feature\";s:54:\"Unsupported feature! Please check system requirements!\";s:18:\"upload_new_version\";s:18:\"Upload new version\";s:20:\"screen_size_to_small\";s:56:\"Your screen is too small to display the desired preview.\";s:32:\"too_many_children_for_recyclebin\";s:105:\"This element contains too many children to be moved to the recycle bin so it will be deleted permanentely\";s:7:\"default\";s:7:\"Default\";s:4:\"data\";s:4:\"Data\";s:8:\"metadata\";s:8:\"Metadata\";s:15:\"custom_metadata\";s:15:\"Custom Metadata\";s:12:\"invalid_name\";s:12:\"Invalid name\";s:30:\"login_token_invalid_user_error\";s:13:\"Invalid user.\";s:41:\"login_token_as_admin_non_admin_user_error\";s:55:\"Only admin users are allowed to login as an admin user.\";s:29:\"login_token_no_password_error\";s:25:\"User has no password set.\";s:13:\"email_address\";s:13:\"Email Address\";s:15:\"email_blacklist\";s:15:\"Email Blacklist\";s:17:\"targeting_toolbar\";s:17:\"Targeting Toolbar\";s:2:\"OK\";s:2:\"OK\";s:32:\"search_replace_assignments_error\";s:59:\"Please select items where to replace and a new target item.\";s:40:\"replace_assignments_in_selected_elements\";s:40:\"Replace assignments in selected elements\";s:35:\"replace_assignments_in_all_elements\";s:35:\"Replace assignments in all elements\";s:26:\"search_replace_assignments\";s:28:\"Search & Replace Assignments\";s:13:\"imageadvanced\";s:14:\"Image Advanced\";s:21:\"filter_active_message\";s:47:\"Do you want to export only the filtered values?\";s:12:\"close_others\";s:12:\"Close Others\";s:9:\"close_all\";s:9:\"Close All\";s:5:\"clone\";s:5:\"Clone\";s:16:\"close_unmodified\";s:16:\"Close Unmodified\";s:7:\"classid\";s:8:\"Class ID\";s:8:\"parentid\";s:9:\"Parent ID\";s:8:\"mimetype\";s:9:\"MIME-Type\";s:12:\"creationdate\";s:13:\"Creation Date\";s:16:\"usermodification\";s:17:\"User Modification\";s:9:\"userowner\";s:10:\"User Owner\";s:9:\"languages\";s:9:\"Languages\";s:24:\"password_was_not_changed\";s:54:\"Password wasn\'t changed because it isn\'t secure enough\";s:9:\"marketing\";s:9:\"Marketing\";s:29:\"clear_content_of_current_view\";s:29:\"Clear content of current view\";s:27:\"highlight_editable_elements\";s:27:\"Highlight editable elements\";s:8:\"continue\";s:8:\"Continue\";s:24:\"you_have_unsaved_changes\";s:25:\"You have unsaved changes.\";s:38:\"clear_content_of_selected_target_group\";s:38:\"Clear content of selected Target Group\";s:86:\"visitors_of_this_page_will_be_automatically_associated_with_the_selected_target_groups\";s:86:\"Visitors of this page will be automatically associated with the selected Target Groups\";s:19:\"assign_target_group\";s:19:\"Assign Target Group\";s:20:\"assign_target_groups\";s:20:\"Assign Target Groups\";s:13:\"target_groups\";s:13:\"Target Groups\";s:29:\"edit_content_for_target_group\";s:29:\"Edit Content for Target Group\";s:22:\"global_targeting_rules\";s:22:\"Global Targeting Rules\";s:15:\"personalization\";s:15:\"Personalization\";s:19:\"shared_translations\";s:19:\"Shared Translations\";s:9:\"textfield\";s:9:\"Textfield\";s:8:\"add_data\";s:8:\"Add data\";s:11:\"add_hotspot\";s:11:\"Add hotspot\";s:10:\"add_marker\";s:10:\"Add marker\";s:22:\"add_marker_or_hotspots\";s:22:\"Add marker or hotspots\";s:30:\"enter_the_name_of_the_new_item\";s:30:\"Enter the name of the new item\";s:14:\"custom_reports\";s:14:\"Custom Reports\";s:10:\"start_date\";s:10:\"Start date\";s:19:\"start_date_relative\";s:30:\"Start date (relative to today)\";s:8:\"end_date\";s:8:\"End date\";s:17:\"end_date_relative\";s:28:\"End date (relative to today)\";s:25:\"relative_date_description\";s:40:\"i.e. -1m +1d (d=days, m=months, y=years)\";s:17:\"source_definition\";s:17:\"Source Definition\";s:16:\"clear_thumbnails\";s:16:\"Clear Thumbnails\";s:10:\"recipients\";s:10:\"Recipients\";s:21:\"newsletter_send_error\";s:62:\"Can\'t send your newsletter, please contact your administrator!\";s:23:\"newsletter_sent_message\";s:154:\"Your newsletter is now sent to all recipients, this process is done in the background (you can close pimcore in the meantime) and can take up to one hour.\";s:59:\"do_you_really_want_to_send_the_newsletter_to_all_recipients\";s:59:\"Do you really want to send the newsletter to all recipients\";s:20:\"send_test_newsletter\";s:20:\"Send Test-Newsletter\";s:15:\"send_newsletter\";s:19:\"Send Newsletter Now\";s:13:\"object_filter\";s:13:\"Object Filter\";s:14:\"add_newsletter\";s:14:\"Add Newsletter\";s:10:\"plain_text\";s:10:\"Plain Text\";s:21:\"plain_text_email_part\";s:21:\"Email Plain Text Part\";s:10:\"newsletter\";s:10:\"Newsletter\";s:3:\"crm\";s:3:\"CRM\";s:12:\"notes_events\";s:18:\"Notes &amp; Events\";s:13:\"delete_folder\";s:13:\"Delete Folder\";s:4:\"home\";s:4:\"Home\";s:9:\"html_tags\";s:9:\"HTML-Tags\";s:7:\"subject\";s:7:\"Subject\";s:12:\"poster_image\";s:12:\"Poster-Image\";s:6:\"tablet\";s:6:\"Tablet\";s:8:\"hardlink\";s:8:\"Hardlink\";s:10:\"convert_to\";s:10:\"Convert to\";s:7:\"replace\";s:7:\"Replace\";s:9:\"targeting\";s:9:\"Targeting\";s:7:\"content\";s:7:\"Content\";s:17:\"paste_inheritance\";s:19:\"Paste (inheritance)\";s:12:\"are_you_sure\";s:13:\"Are you sure?\";s:24:\"all_content_will_be_lost\";s:24:\"All content will be lost\";s:23:\"content_master_document\";s:23:\"Content-Master Document\";s:9:\"overwrite\";s:9:\"Overwrite\";s:24:\"click_right_to_overwrite\";s:24:\"Click right to overwrite\";s:19:\"open_document_by_id\";s:13:\"Open Document\";s:16:\"open_asset_by_id\";s:10:\"Open Asset\";s:17:\"open_object_by_id\";s:11:\"Open Object\";s:8:\"open_url\";s:8:\"Open URL\";s:17:\"element_not_found\";s:17:\"Element not found\";s:15:\"import_from_url\";s:15:\"Import from URL\";s:40:\"do_you_really_want_to_leave_the_editmode\";s:46:\"Do you really want to leave the editmode (NO!)\";s:31:\"or_specify_an_asset_image_below\";s:31:\"or specify an asset image below\";s:18:\"saved_successfully\";s:19:\"Saved successfully!\";s:8:\"qr_codes\";s:8:\"QR-Codes\";s:7:\"element\";s:7:\"Element\";s:26:\"details_for_selected_event\";s:28:\"Details for selected element\";s:6:\"fields\";s:6:\"Fields\";s:24:\"not_possible_with_paging\";s:112:\"Sorry, this is not possible in elements which are paged, try to restructure your data to avoid pages in the tree\";s:9:\"inherited\";s:9:\"Inherited\";s:6:\"length\";s:6:\"Length\";s:12:\"show_in_tree\";s:12:\"Show in Tree\";s:10:\"exactmatch\";s:11:\"exact match\";s:7:\"desktop\";s:7:\"Desktop\";s:7:\"drag_me\";s:7:\"Drag Me\";s:10:\"serverVars\";s:16:\"Server Variables\";s:11:\"http_errors\";s:11:\"HTTP Errors\";s:10:\"attributes\";s:10:\"Attributes\";s:4:\"code\";s:4:\"Code\";s:4:\"tags\";s:4:\"Tags\";s:22:\"tag_snippet_management\";s:24:\"Tag & Snippet Management\";s:21:\"Click here to proceed\";s:21:\"Click here to proceed\";s:98:\"Your browser is not supported. Please install the latest version of one of the following browsers.\";s:98:\"Your browser is not supported. Please install the latest version of one of the following browsers.\";s:18:\"open_in_new_window\";s:18:\"Open in new Window\";s:26:\"open_preview_in_new_window\";s:26:\"Open preview in new window\";s:13:\"limit_reached\";s:13:\"Limit reached\";s:13:\"casesensitive\";s:14:\"case-sensitive\";s:12:\"path_aliases\";s:12:\"Path Aliases\";s:4:\"path\";s:4:\"Path\";s:16:\"create_redirects\";s:55:\"Create redirects to keep URLs working (incl. children)?\";s:11:\"auto_create\";s:11:\"Auto create\";s:10:\"pretty_url\";s:10:\"Pretty URL\";s:16:\"pretty_url_label\";s:47:\"Pretty URL (overrides path from tree-structure)\";s:26:\"search_engine_optimization\";s:26:\"Search Engine Optimization\";s:26:\"password_cannot_be_changed\";s:26:\"Password cannot be changed\";s:12:\"old_password\";s:12:\"Old Password\";s:12:\"new_password\";s:12:\"New Password\";s:15:\"retype_password\";s:15:\"Retype Password\";s:19:\"seo_document_editor\";s:19:\"SEO Document Editor\";s:21:\"clear_temporary_files\";s:21:\"Clear temporary files\";s:7:\"reports\";s:7:\"Reports\";s:5:\"roles\";s:5:\"Roles\";s:4:\"send\";s:4:\"Send\";s:8:\"Password\";s:8:\"Password\";s:20:\"Forgot your password\";s:20:\"Forgot your password\";s:13:\"Back to Login\";s:13:\"Back to Login\";s:76:\"Enter your username and pimcore will send a login link to your email address\";s:76:\"Enter your username and Pimcore will send a login link to your email address\";s:26:\"Please check your mailbox.\";s:26:\"Please check your mailbox.\";s:5:\"Login\";s:5:\"Login\";s:6:\"Submit\";s:6:\"Submit\";s:59:\"A temporary login link has been sent to your email address.\";s:59:\"A temporary login link has been sent to your email address.\";s:38:\"use_current_player_position_as_preview\";s:38:\"Use current player position as preview\";s:20:\"select_image_preview\";s:20:\"Select Image Preview\";s:21:\"preview_not_available\";s:21:\"Preview not available\";s:10:\"360_viewer\";s:12:\"360° Viewer\";s:16:\"standard_preview\";s:16:\"Standard Preview\";s:6:\"status\";s:6:\"Status\";s:25:\"video_preview_in_progress\";s:52:\"The preview for this video is currently in progress.\";s:54:\"php_cli_binary_and_or_ffmpeg_binary_setting_is_missing\";s:130:\"PHP-CLI binary or FFMPEG is not available, please ensure that both are installed/executable and configured in the system settings!\";s:16:\"video_thumbnails\";s:16:\"Video Thumbnails\";s:8:\"optional\";s:8:\"optional\";s:35:\"do_you_really_want_to_close_pimcore\";s:36:\"Do you really want to close Pimcore?\";s:17:\"drop_element_here\";s:17:\"Drop element here\";s:29:\"select_specific_area_of_image\";s:29:\"Select specific area of image\";s:18:\"error_pasting_item\";s:20:\"Unable to paste item\";s:35:\"paste_recursive_updating_references\";s:36:\"Paste recursive, updating references\";s:12:\"add_hardlink\";s:12:\"Add Hardlink\";s:11:\"source_path\";s:11:\"Source path\";s:22:\"properties_from_source\";s:35:\"Use properties from source document\";s:18:\"childs_from_source\";s:33:\"Use children from source document\";s:28:\"click_right_for_more_options\";s:28:\"Click right for more options\";s:11:\"move_to_tab\";s:11:\"Move to Tab\";s:13:\"not_supported\";s:13:\"Not supported\";s:9:\"edit_link\";s:9:\"Edit Link\";s:6:\"resize\";s:6:\"Resize\";s:13:\"scalebyheight\";s:15:\"Scale by Height\";s:12:\"scalebywidth\";s:14:\"Scale by Width\";s:4:\"crop\";s:4:\"Crop\";s:7:\"cleanup\";s:7:\"Cleanup\";s:29:\"this_element_cannot_be_edited\";s:29:\"This element cannot be edited\";s:7:\"details\";s:7:\"Details\";s:63:\"cannot_save_object_please_try_to_edit_the_object_in_detail_view\";s:81:\"<b>Cannot save object!</b><br />Please try to edit the object in the detail view.\";s:4:\"size\";s:4:\"Size\";s:13:\"select_a_file\";s:13:\"Select a file\";s:25:\"upload_compatibility_mode\";s:32:\"Upload File (Compatibility Mode)\";s:45:\"the_system_is_in_maintenance_mode_please_wait\";s:46:\"The system is in maintenance mode, please wait\";s:8:\"activate\";s:8:\"Activate\";s:18:\"image_is_too_small\";s:47:\"Image is too small, please choose a bigger one.\";s:19:\"name_is_not_allowed\";s:19:\"Name is not allowed\";s:18:\"import_from_server\";s:18:\"Import from Server\";s:12:\"upload_files\";s:12:\"Upload Files\";s:10:\"upload_zip\";s:18:\"Upload ZIP Archive\";s:13:\"document_root\";s:13:\"Document Root\";s:21:\"batch_change_selected\";s:19:\"Batch edit selected\";s:15:\"batch_operation\";s:15:\"Batch Operation\";s:16:\"modificationdate\";s:17:\"Modification Date\";s:15:\"download_as_zip\";s:15:\"Download as ZIP\";s:6:\"locked\";s:6:\"Locked\";s:43:\"element_cannot_be_move_because_it_is_locked\";s:45:\"Element cannot be moved because it is locked.\";s:23:\"element_cannot_be_moved\";s:32:\"The element cannot be moved here\";s:22:\"no_collections_allowed\";s:22:\"No Collections allowed\";s:37:\"this_is_a_newer_not_published_version\";s:37:\"This is a newer not published version\";s:16:\"filter_condition\";s:16:\"Filter Condition\";s:9:\"all_types\";s:9:\"All Types\";s:5:\"audio\";s:5:\"Audio\";s:5:\"video\";s:5:\"Video\";s:7:\"archive\";s:7:\"Archive\";s:7:\"unknown\";s:7:\"Unknown\";s:5:\"class\";s:5:\"Class\";s:4:\"page\";s:4:\"Page\";s:7:\"snippet\";s:7:\"Snippet\";s:6:\"folder\";s:6:\"Folder\";s:14:\"your_selection\";s:14:\"Your Selection\";s:37:\"double_click_to_add_item_to_selection\";s:61:\"Double-click an item on the left to add it to this selection.\";s:5:\"label\";s:5:\"Label\";s:17:\"error_auth_failed\";s:36:\"Login failed!<br />Please try again.\";s:21:\"error_session_expired\";s:41:\"Session expired!<br />Please login again.\";s:4:\"site\";s:4:\"Site\";s:10:\"descending\";s:10:\"Descending\";s:9:\"ascending\";s:9:\"Ascending\";s:4:\"sort\";s:4:\"Sort\";s:7:\"results\";s:7:\"Results\";s:9:\"dimension\";s:9:\"Dimension\";s:6:\"metric\";s:6:\"Metric\";s:7:\"segment\";s:7:\"Segment\";s:13:\"data_explorer\";s:13:\"Data Explorer\";s:10:\"navigation\";s:10:\"Navigation\";s:9:\"entrances\";s:9:\"Entrances\";s:5:\"exits\";s:5:\"Exits\";s:7:\"restore\";s:7:\"Restore\";s:6:\"amount\";s:6:\"Amount\";s:16:\"flush_recyclebin\";s:17:\"Flush Recycle Bin\";s:10:\"recyclebin\";s:11:\"Recycle Bin\";s:9:\"deletedby\";s:10:\"Deleted By\";s:18:\"open_select_editor\";s:21:\"Open Selection-Editor\";s:6:\"ignore\";s:6:\"Ignore\";s:5:\"blank\";s:5:\"Blank\";s:16:\"email_log_resend\";s:12:\"Resend email\";s:27:\"email_log_resend_window_msg\";s:71:\"Please confirm that you want to send the email again to all recipients.\";s:11:\"select_site\";s:13:\"Select a site\";s:9:\"main_site\";s:9:\"Main Site\";s:8:\"filename\";s:8:\"Filename\";s:20:\"unsupported_filetype\";s:20:\"Unsupported Filetype\";s:27:\"different_number_of_columns\";s:27:\"Different number of columns\";s:39:\"email_log_resend_window_success_message\";s:55:\"The email has been sent successfully to all recipients.\";s:37:\"email_log_resend_window_error_message\";s:49:\"An error occurred. The email has not been resent.\";s:10:\"error_jobs\";s:25:\"The following jobs failed\";s:12:\"batch_change\";s:14:\"Batch edit all\";s:16:\"batch_edit_field\";s:20:\"Batch edit all field\";s:25:\"batch_edit_field_selected\";s:25:\"Batch edit selected field\";s:9:\"published\";s:9:\"Published\";s:3:\"all\";s:3:\"all\";s:14:\"items_per_page\";s:14:\"Items per page\";s:22:\"reload_pimcore_changes\";s:89:\"You have to reload Pimcore for the changes to take effect, would you like to do this now?\";s:4:\"info\";s:4:\"Info\";s:30:\"area_brick_assign_info_message\";s:61:\"Please use drag & drop to assign a brick to the desired block\";s:16:\"metainfo_copy_id\";s:20:\"Copy ID to clipboard\";s:22:\"metainfo_copy_fullpath\";s:27:\"Copy full path to clipboard\";s:22:\"metainfo_copy_deeplink\";s:26:\"Copy deeplink to clipboard\";s:2:\"or\";s:2:\"or\";s:4:\"move\";s:4:\"Move\";s:22:\"force_picture_html_tag\";s:30:\"Force &lt;picture&gt; HTML tag\";s:14:\"paste_contents\";s:24:\"Paste only contents here\";s:14:\"paste_as_child\";s:14:\"Paste as child\";s:25:\"paste_recursive_as_childs\";s:26:\"Paste as child (recursive)\";s:13:\"view_original\";s:13:\"View Original\";s:4:\"feed\";s:4:\"Feed\";s:14:\"no_items_found\";s:14:\"No items found\";s:10:\"public_url\";s:10:\"Public URL\";s:9:\"pageviews\";s:9:\"Pageviews\";s:6:\"visits\";s:6:\"Visits\";s:6:\"detail\";s:6:\"Detail\";s:15:\"report_settings\";s:15:\"Report Settings\";s:8:\"overview\";s:8:\"Overview\";s:16:\"visitor_overview\";s:16:\"Visitor Overview\";s:5:\"other\";s:5:\"Other\";s:16:\"google_analytics\";s:16:\"Google Analytics\";s:21:\"reports_and_marketing\";s:19:\"Marketing & Reports\";s:25:\"save_only_scheduled_tasks\";s:25:\"Save only scheduled tasks\";s:15:\"modified_assets\";s:15:\"Modified Assets\";s:22:\"modification_statistic\";s:27:\"Changes in the last 31 days\";s:7:\"message\";s:7:\"Message\";s:11:\"add_portlet\";s:11:\"Add Portlet\";s:18:\"modified_documents\";s:18:\"Modified Documents\";s:16:\"modified_objects\";s:16:\"Modified Objects\";s:7:\"welcome\";s:7:\"Welcome\";s:16:\"save_and_publish\";s:14:\"Save & Publish\";s:6:\"delete\";s:6:\"Delete\";s:4:\"save\";s:4:\"Save\";s:10:\"add_assets\";s:12:\"Add Asset(s)\";s:7:\"preview\";s:7:\"Preview\";s:8:\"advanced\";s:8:\"Advanced\";s:5:\"basic\";s:5:\"Basic\";s:4:\"list\";s:4:\"List\";s:4:\"view\";s:4:\"View\";s:7:\"publish\";s:7:\"Publish\";s:6:\"rename\";s:6:\"Rename\";s:8:\"settings\";s:8:\"Settings\";s:10:\"properties\";s:10:\"Properties\";s:8:\"versions\";s:8:\"Versions\";s:3:\"add\";s:3:\"Add\";s:3:\"sum\";s:3:\"Sum\";s:4:\"date\";s:4:\"Date\";s:4:\"user\";s:4:\"User\";s:4:\"note\";s:4:\"Note\";s:4:\"from\";s:4:\"From\";s:14:\"email_reply_to\";s:8:\"Reply To\";s:2:\"to\";s:2:\"To\";s:8:\"email_cc\";s:2:\"Cc\";s:9:\"email_bcc\";s:3:\"Bcc\";s:14:\"email_settings\";s:14:\"Email Settings\";s:35:\"email_settings_receiver_description\";s:240:\"Multiple recipients can be specified by separating the email addresses with a semicolon. <br/>Example: receiver@pimcore.org; receiver2@pimcore.org<br/>For \'From\' you can use additionally the syntax <i>My Name &lt;my-name@example.com&gt;</i>\";s:10:\"email_logs\";s:11:\"Sent Emails\";s:19:\"email_log_sent_Date\";s:9:\"Date sent\";s:4:\"html\";s:4:\"HTML\";s:4:\"text\";s:4:\"Text\";s:24:\"predefined_document_type\";s:24:\"Predefined Document Type\";s:10:\"controller\";s:10:\"Controller\";s:6:\"action\";s:6:\"Action\";s:7:\"actions\";s:7:\"Actions\";s:8:\"template\";s:8:\"Template\";s:3:\"key\";s:3:\"Key\";s:2:\"id\";s:2:\"ID\";s:4:\"name\";s:4:\"Name\";s:5:\"title\";s:5:\"Title\";s:11:\"description\";s:11:\"Description\";s:9:\"unpublish\";s:9:\"Unpublish\";s:6:\"target\";s:6:\"Target\";s:4:\"type\";s:4:\"Type\";s:13:\"create_folder\";s:10:\"Add Folder\";s:25:\"please_enter_the_new_name\";s:25:\"Please enter the new name\";s:8:\"add_page\";s:8:\"Add Page\";s:11:\"add_snippet\";s:11:\"Add Snippet\";s:9:\"add_email\";s:9:\"Add Email\";s:8:\"add_link\";s:8:\"Add Link\";s:4:\"copy\";s:4:\"Copy\";s:5:\"paste\";s:5:\"Paste\";s:14:\"close_all_tabs\";s:14:\"Close all tabs\";s:6:\"search\";s:6:\"Search\";s:6:\"import\";s:6:\"Import\";s:6:\"export\";s:6:\"Export\";s:8:\"glossary\";s:8:\"Glossary\";s:14:\"document_types\";s:14:\"Document Types\";s:21:\"predefined_properties\";s:21:\"Predefined Properties\";s:5:\"users\";s:5:\"Users\";s:7:\"profile\";s:7:\"Profile\";s:10:\"my_profile\";s:10:\"My Profile\";s:13:\"documentation\";s:13:\"Documentation\";s:11:\"report_bugs\";s:11:\"Report Bugs\";s:5:\"about\";s:5:\"About\";s:4:\"file\";s:4:\"File\";s:6:\"extras\";s:6:\"Extras\";s:4:\"help\";s:4:\"Help\";s:13:\"configuration\";s:13:\"Configuration\";s:5:\"value\";s:5:\"Value\";s:21:\"add_a_custom_property\";s:21:\"Add a custom Property\";s:7:\"general\";s:7:\"General\";s:8:\"language\";s:8:\"Language\";s:7:\"quality\";s:7:\"Quality\";s:6:\"format\";s:6:\"Format\";s:9:\"documents\";s:9:\"Documents\";s:6:\"assets\";s:6:\"Assets\";s:6:\"upload\";s:6:\"Upload\";s:5:\"width\";s:5:\"Width\";s:6:\"height\";s:6:\"Height\";s:5:\"empty\";s:5:\"Empty\";s:8:\"workflow\";s:8:\"Workflow\";s:6:\"modify\";s:7:\"Modify \";s:6:\"create\";s:7:\"Create \";s:4:\"edit\";s:4:\"Edit\";s:6:\"logout\";s:6:\"Logout\";s:7:\"refresh\";s:7:\"Refresh\";s:5:\"input\";s:5:\"Input\";s:8:\"checkbox\";s:8:\"Checkbox\";s:8:\"textarea\";s:8:\"Textarea\";s:5:\"image\";s:5:\"Image\";s:6:\"select\";s:6:\"Select\";s:4:\"base\";s:4:\"Base\";s:10:\"add_object\";s:10:\"Add Object\";s:6:\"border\";s:6:\"Border\";s:8:\"document\";s:8:\"Document\";s:5:\"asset\";s:5:\"Asset\";s:6:\"object\";s:6:\"Object\";s:6:\"remove\";s:6:\"Remove\";s:19:\"hidden_dependencies\";s:81:\"There are additional dependencies your user does not have the permissions to see.\";s:4:\"open\";s:4:\"Open\";s:4:\"days\";s:4:\"Days\";s:7:\"seemode\";s:7:\"Seemode\";s:17:\"edit_current_page\";s:14:\"Edit this page\";s:5:\"close\";s:5:\"Close\";s:19:\"name_already_in_use\";s:54:\"Name is already in use, please choose a different one.\";s:28:\"name_and_key_must_be_defined\";s:29:\"Name and Type must be defined\";s:21:\"mandatory_field_empty\";s:32:\"Please fill all mandatory fields\";s:6:\"reload\";s:6:\"Reload\";s:8:\"schedule\";s:8:\"Schedule\";s:4:\"time\";s:4:\"Time\";s:7:\"version\";s:7:\"Version\";s:6:\"active\";s:6:\"Active\";s:7:\"success\";s:7:\"Success\";s:12:\"translations\";s:12:\"Translations\";s:11:\"translation\";s:11:\"Translation\";s:9:\"firstname\";s:9:\"Firstname\";s:8:\"lastname\";s:8:\"Lastname\";s:5:\"email\";s:5:\"Email\";s:24:\"cant_move_node_to_target\";s:24:\"Moving node not possible\";s:19:\"error_moving_object\";s:25:\"Object could not be moved\";s:31:\"translations_are_not_configured\";s:30:\"Translation are not configured\";s:14:\"read_more_here\";s:20:\"Read more about here\";s:15:\"publish_version\";s:15:\"Publish version\";s:21:\"save_only_new_version\";s:21:\"Only save new version\";s:5:\"start\";s:5:\"Start\";s:2:\"su\";s:2:\"Su\";s:2:\"mo\";s:2:\"Mo\";s:2:\"tu\";s:2:\"Tu\";s:2:\"we\";s:2:\"We\";s:2:\"th\";s:2:\"Th\";s:2:\"fr\";s:2:\"Fr\";s:2:\"sa\";s:2:\"Sa\";s:18:\"session_error_text\";s:144:\"It seems there is a problem with your session. We recommend to reload this page in order to be save, but you can try to save your changes first.\";s:13:\"session_error\";s:13:\"Session Error\";s:11:\"please_wait\";s:15:\"Please wait ...\";s:8:\"download\";s:8:\"Download\";s:11:\"inheritable\";s:11:\"Inheritable\";s:9:\"redirects\";s:9:\"Redirects\";s:6:\"source\";s:6:\"Source\";s:4:\"link\";s:4:\"Link\";s:5:\"links\";s:5:\"Links\";s:4:\"abbr\";s:5:\"Abbr.\";s:7:\"acronym\";s:7:\"Acronym\";s:4:\"stop\";s:4:\"Stop\";s:12:\"dependencies\";s:12:\"Dependencies\";s:8:\"requires\";s:8:\"Requires\";s:11:\"required_by\";s:11:\"Required By\";s:11:\"search_edit\";s:23:\"Search, Edit and Export\";s:7:\"subtype\";s:7:\"Subtype\";s:12:\"initializing\";s:16:\"Initializing ...\";s:20:\"please_select_a_type\";s:20:\"Please select a type\";s:6:\"filter\";s:6:\"Filter\";s:8:\"test_url\";s:8:\"Test URL\";s:5:\"field\";s:5:\"Field\";s:8:\"operator\";s:8:\"Operator\";s:5:\"apply\";s:5:\"Apply\";s:4:\"show\";s:4:\"Show\";s:10:\"robots.txt\";s:10:\"robots.txt\";s:6:\"public\";s:6:\"Public\";s:18:\"maximum_2_versions\";s:31:\"You can compare max. 2 versions\";s:5:\"error\";s:5:\"Error\";s:17:\"element_is_locked\";s:58:\"The desired element is currently opened by another person:\";s:21:\"element_lock_question\";s:33:\"Would you like to open it anyway?\";s:5:\"since\";s:5:\"Since\";s:9:\"longitude\";s:9:\"Longitude\";s:8:\"latitude\";s:8:\"Latitude\";s:8:\"geopoint\";s:16:\"Geographic Point\";s:6:\"cancel\";s:6:\"Cancel\";s:18:\"open_search_editor\";s:18:\"Open Search Editor\";s:10:\"parameters\";s:10:\"Parameters\";s:6:\"anchor\";s:6:\"Anchor\";s:9:\"accesskey\";s:9:\"Accesskey\";s:8:\"relation\";s:8:\"Relation\";s:8:\"tabindex\";s:9:\"Tab-Index\";s:7:\"not_set\";s:7:\"not set\";s:10:\"export_csv\";s:10:\"CSV Export\";s:11:\"export_xlsx\";s:11:\"XLSX Export\";s:10:\"import_csv\";s:10:\"CSV Import\";s:19:\"show_welcome_screen\";s:30:\"Show welcome screen on startup\";s:20:\"importFileHasHeadRow\";s:20:\"first row = headline\";s:19:\"error_deleting_item\";s:21:\"Could not delete item\";s:42:\"overwrite_object_with_same_key_description\";s:504:\"When overwrite is checked, instead of creating a new object for each import row, objects with the same key are replaced. Existing objects in your import folder with keys not contained in the import file will remain untouched. Please be aware that all objects which have a matching key in the import file will be replaced in the target folder. This is also true for objects based on a different class or even object folders! Object fields which are set to ignore in the field mapping keep their old value.\";s:34:\"object_import_filename_description\";s:57:\"select the field which is used to generate the object key\";s:17:\"save_pubish_close\";s:23:\"Save, publish and close\";s:10:\"save_close\";s:14:\"Save and close\";s:13:\"error_general\";s:99:\"Server threw exception - could not perform action. Please reload the admin interface and try again.\";s:11:\"owner_class\";s:11:\"Owner class\";s:11:\"owner_field\";s:11:\"Owner field\";s:22:\"nonownerobject_warning\";s:109:\"The current object is not the owner of these relations, making changes here might make saving the object slow\";s:30:\"element_implicit_edit_question\";s:63:\"Would you still like to implicitly  modify it with this action?\";s:20:\"element_open_message\";s:48:\"The desired element is already open for editing.\";s:30:\"nonownerobjects_self_selection\";s:113:\"In non owner objects a  relation to myself is not possible, please use original field instead of non owner field.\";s:7:\"warning\";s:7:\"Warning\";s:7:\"consent\";s:7:\"Consent\";s:25:\"csv_object_export_warning\";s:181:\"Please note that the CSV export does not support all data types. Consequently, re-importing an exported CSV to pimcore might lead to data loss. Press OK to continue with the export.\";s:21:\"object_export_warning\";s:98:\"Please note that the export does not support all data types. Press OK to continue with the export.\";s:19:\"error_renaming_item\";s:43:\"There was an error while renaming the item.\";s:18:\"navigation_exclude\";s:23:\"Exclude from Navigation\";s:8:\"variants\";s:8:\"Variants\";s:7:\"variant\";s:7:\"Variant\";s:11:\"add_variant\";s:11:\"Add variant\";s:27:\"delete_message_dependencies\";s:38:\"There are dependencies, delete anyway?\";s:14:\"delete_message\";s:39:\"Do you really want to delete this item?\";s:20:\"delete_class_message\";s:41:\"Do you really want to delete class \'%s\' ?\";s:20:\"delete_message_batch\";s:44:\"Do you really want to delete these elements?\";s:18:\"delete_error_batch\";s:84:\"Following items cannot be deleted, do you wanna proceed with deleting the remaining?\";s:12:\"delete_error\";s:35:\"The item cannot be deleted. Reason:\";s:31:\"no_further_objectbricks_allowed\";s:31:\"No further objectbricks allowed\";s:21:\"grid_current_language\";s:16:\"Current language\";s:21:\"selected_grid_columns\";s:21:\"Selected grid columns\";s:14:\"object_columns\";s:14:\"Object columns\";s:14:\"system_columns\";s:14:\"System columns\";s:7:\"columns\";s:7:\"Columns\";s:13:\"children_grid\";s:13:\"Children Grid\";s:13:\"only_children\";s:20:\"just direct children\";s:17:\"only_unreferenced\";s:17:\"only unreferenced\";s:3:\"cut\";s:3:\"Cut\";s:17:\"paste_cut_element\";s:21:\"Paste cut-out element\";s:13:\"memorize_tabs\";s:18:\"Memorize open tabs\";s:15:\"element_history\";s:24:\"Recently Opened Elements\";s:10:\"dashboards\";s:10:\"Dashboards\";s:20:\"portlet_customreport\";s:13:\"Custom Report\";s:24:\"clear_marker_or_hotspots\";s:39:\"Clear Marker, Hotspot and Cropping Data\";s:16:\"hotspots_cleared\";s:43:\"Hotspots, Markers and Cropping Data cleared\";s:8:\"deeplink\";s:8:\"Deeplink\";s:13:\"click_to_open\";s:15:\"(click to open)\";s:12:\"add_metadata\";s:12:\"Add Metadata\";s:26:\"pimcore_icon_edit_pdf_text\";s:17:\"Edit text version\";s:7:\"chapter\";s:7:\"Chapter\";s:15:\"search_and_move\";s:13:\"Search & Move\";s:9:\"searching\";s:12:\"Searching...\";s:25:\"predefined_asset_metadata\";s:25:\"Predefined Asset Metadata\";s:35:\"add_predefined_metadata_definitions\";s:26:\"Add predefined definitions\";s:9:\"scheduled\";s:9:\"Scheduled\";s:26:\"naming_requirements_3chars\";s:56:\"Name must be alphanumeric and at least 3 characters long\";s:22:\"there_are_more_columns\";s:47:\"There are more columns than currently displayed\";s:9:\"merge_csv\";s:22:\"Import &amp; Merge CSV\";s:26:\"translation_merger_current\";s:12:\"Current Text\";s:22:\"translation_merger_csv\";s:13:\"Text from CSV\";s:16:\"nothing_to_merge\";s:25:\"There is nothing to merge\";s:21:\"csv_seperated_options\";s:21:\"CSV seperated options\";s:26:\"csv_seperated_options_info\";s:173:\"The list of available options can be specified as comma-seperated list, as single-column values or  mixed. For the single-column way, the key will also be used as the value.\";s:10:\"first_page\";s:10:\"First Page\";s:13:\"previous_page\";s:13:\"Previous Page\";s:9:\"next_page\";s:9:\"Next Page\";s:9:\"last_page\";s:9:\"Last Page\";s:18:\"no_data_to_display\";s:18:\"No data to display\";s:29:\"classificationstore_no_groups\";s:15:\"No groups found\";s:27:\"classificationstore_no_keys\";s:13:\"No keys found\";s:34:\"classificationstore_no_collections\";s:14:\"No collections\";s:12:\"remove_group\";s:12:\"Remove Group\";s:9:\"reference\";s:9:\"Reference\";s:17:\"converter_service\";s:17:\"Converter service\";s:25:\"element_tag_configuration\";s:17:\"Tag Configuration\";s:20:\"element_tag_all_tags\";s:8:\"All Tags\";s:25:\"element_tag_filtered_tags\";s:13:\"Filtered Tags\";s:25:\"enter_new_name_of_the_tag\";s:25:\"Enter new name of the Tag\";s:13:\"assigned_tags\";s:13:\"Assigned Tags\";s:11:\"filter_tags\";s:15:\"Filter for Tags\";s:19:\"consider_child_tags\";s:23:\"Consider child tags too\";s:15:\"tags_assignment\";s:15:\"Tags Assignment\";s:11:\"tags_search\";s:11:\"Tags Search\";s:6:\"revert\";s:6:\"Revert\";s:18:\"identifier_warning\";s:95:\"Be careful with the unique identifier because table names can contain only up to 64 characters.\";s:17:\"unique_identifier\";s:17:\"Unique identifier\";s:18:\"invalid_identifier\";s:18:\"Invalid identifier\";s:25:\"identifier_already_exists\";s:25:\"Identifier already exists\";s:13:\"batch_applied\";s:13:\"Batch applied\";s:10:\"apply_tags\";s:22:\"Apply tags to Children\";s:21:\"remove_and_apply_tags\";s:33:\"Remove and apply tags to children\";s:16:\"batch_assignment\";s:20:\"Tag batch assignment\";s:22:\"batch_assignment_error\";s:26:\"Tag batch assignment error\";s:17:\"no_children_found\";s:18:\"No Children found.\";s:12:\"asset_search\";s:13:\"Search Assets\";s:15:\"document_search\";s:16:\"Search Documents\";s:13:\"object_search\";s:14:\"Search Objects\";s:4:\"more\";s:4:\"More\";s:16:\"open_translation\";s:16:\"Open Translation\";s:22:\"link_existing_document\";s:22:\"Link existing Document\";s:17:\"using_inheritance\";s:17:\"Using Inheritance\";s:12:\"new_document\";s:12:\"New Document\";s:6:\"parent\";s:6:\"Parent\";s:16:\"update_available\";s:16:\"Update Available\";s:23:\"target_document_invalid\";s:51:\"Please select a target document with valid language\";s:30:\"target_document_needs_language\";s:36:\"Target document needs a language set\";s:5:\"tools\";s:5:\"Tools\";s:12:\"perspectives\";s:12:\"Perspectives\";s:13:\"filter_active\";s:14:\"Filter active!\";s:17:\"save_grid_options\";s:17:\"Save Grid Options\";s:12:\"reset_config\";s:13:\"Reset changes\";s:20:\"reset_config_tooltip\";s:88:\"This will reset (and save) the grid column configuration for this element to its default\";s:22:\"error_resetting_config\";s:29:\"Error resetting configuration\";s:18:\"marketing_settings\";s:18:\"Marketing Settings\";s:30:\"cross_tree_moves_not_supported\";s:34:\"Cross tree moves not yet supported\";s:13:\"add_printpage\";s:13:\"Add PrintPage\";s:18:\"add_printcontainer\";s:18:\"Add PrintContainer\";s:21:\"web2print_preview_pdf\";s:22:\"Generate & Preview PDF\";s:29:\"web2print_cancel_pdf_creation\";s:19:\"Cancel PDF Creation\";s:22:\"web2print_generate_pdf\";s:12:\"Generate PDF\";s:22:\"web2print_download_pdf\";s:12:\"Download PDF\";s:24:\"web2print_last-generated\";s:14:\"Last Generated\";s:31:\"web2print_last-generate-message\";s:21:\"Last Generate Message\";s:9:\"web2print\";s:12:\"Web-to-Print\";s:32:\"web2print_prepare_pdf_generation\";s:22:\"Prepare PDF Generation\";s:30:\"web2print_start_html_rendering\";s:20:\"Start HTML Rendering\";s:33:\"web2print_finished_html_rendering\";s:23:\"Finished HTML Rendering\";s:25:\"web2print_saved_html_file\";s:15:\"Saved HTML File\";s:24:\"web2print_pdf_conversion\";s:14:\"PDF Conversion\";s:29:\"web2print_saving_pdf_document\";s:17:\"Save PDF Document\";s:16:\"web2print_author\";s:6:\"Author\";s:22:\"web2print_printermarks\";s:12:\"Printermarks\";s:22:\"web2print_addOverprint\";s:12:\"Overprinting\";s:19:\"web2print_bookmarks\";s:9:\"Bookmarks\";s:9:\"close_tab\";s:9:\"Close Tab\";s:24:\"web2print_only_published\";s:39:\"Only possible with published documents.\";s:27:\"web2print_documents_changed\";s:44:\"Documents changed since last pdf generation.\";s:25:\"web2print_enableDebugMode\";s:17:\"Enable debug mode\";s:32:\"web2print_enableLenientHttpsMode\";s:25:\"Enable lenient HTTPS mode\";s:36:\"web2print_enableLenientHttpsMode_txt\";s:72:\"Enable this option if PDFreactor fails to connect successfully via HTTPS\";s:13:\"about_pimcore\";s:22:\"ABOUT PIMCORE PLATFORM\";s:5:\"phone\";s:5:\"Phone\";s:24:\"workflow_additional_info\";s:22:\"Additional Information\";s:5:\"notes\";s:5:\"Notes\";s:16:\"workflow_actions\";s:7:\"Actions\";s:23:\"workflow_perform_action\";s:14:\"Perform Action\";s:23:\"workflow_notes_required\";s:16:\"Notes (Required)\";s:23:\"workflow_notes_optional\";s:16:\"Notes (Optional)\";s:36:\"workflow_notes_requred_field_message\";s:25:\"\"%s\" is a required field.\";s:40:\"workflow_transition_applied_successfully\";s:27:\"Action applied successfully\";s:42:\"workflow_change_email_notification_subject\";s:39:\"Workflow update for %s in workflow \'%s\'\";s:39:\"workflow_change_email_notification_text\";s:65:\"For %s with ID %s the action \"%s\" was triggered in workflow \'%s\'.\";s:43:\"workflow_change_email_notification_deeplink\";s:24:\"Deeplink to the element.\";s:39:\"workflow_change_email_notification_note\";s:11:\"Note Added:\";s:16:\"workflow_details\";s:16:\"Workflow Details\";s:14:\"workflow_graph\";s:14:\"Workflow Graph\";s:22:\"workflow_current_state\";s:13:\"Current State\";s:22:\"workflow_cmd_not_found\";s:86:\"Please install the \"%s\" console executable on the server to render the workflow graph.\";s:32:\"please_enter_the_id_of_the_asset\";s:64:\"Please enter the ID or Path (e.g. /images/logo.jpg) of the asset\";s:33:\"please_enter_the_id_of_the_object\";s:41:\"Please enter the ID or Path of the object\";s:35:\"please_enter_the_id_of_the_document\";s:73:\"Please enter the ID, Path or URL (also including http://) of the document\";s:27:\"element_has_unsaved_changes\";s:27:\"Element has unsaved changes\";s:31:\"element_unsaved_changes_message\";s:54:\"All unsaved changes will be lost, are you really sure?\";s:35:\"newsletter_enableTrackingParameters\";s:32:\"Add Tracking Parameters to Links\";s:6:\"medium\";s:6:\"Medium\";s:22:\"newsletter_sendingMode\";s:12:\"Sending Mode\";s:29:\"newsletter_sendingmode_single\";s:39:\"Single (Render every Mail individually)\";s:28:\"newsletter_sendingmode_batch\";s:29:\"Batch (Render Mail only once)\";s:23:\"newsletter_sendingPanel\";s:24:\"Newsletter Sending Panel\";s:24:\"newsletter_dirty_warning\";s:47:\"Newsletter is not saved yet. Please save first.\";s:18:\"newsletter_sending\";s:18:\"Sending Newsletter\";s:24:\"newsletter_sourceAdapter\";s:22:\"Address Source Adapter\";s:18:\"newsletter_default\";s:19:\"Default Object List\";s:18:\"newsletter_csvList\";s:8:\"CSV List\";s:19:\"newsletter_testsend\";s:23:\"Newsletter Test Sending\";s:28:\"newsletter_test_sent_message\";s:33:\"Test Newsletter sent successfully\";s:20:\"add_object_mbx_title\";s:25:\"Add new Object of type %s\";s:18:\"merge_translations\";s:18:\"Merge Translations\";s:24:\"newsletter_choose_report\";s:15:\"Choose a report\";s:27:\"newsletter_email_field_name\";s:16:\"Email field name\";s:4:\"mode\";s:4:\"Mode\";s:15:\"custom_download\";s:15:\"Custom Download\";s:13:\"original_file\";s:13:\"Original File\";s:10:\"web_format\";s:10:\"Web Format\";s:12:\"print_format\";s:12:\"Print Format\";s:13:\"office_format\";s:13:\"Office Format\";s:15:\"change_password\";s:15:\"Change Password\";s:32:\"file_is_bigger_that_upload_limit\";s:73:\"The following file is bigger than the actual upload limit of your server:\";s:23:\"send_test_email_success\";s:95:\"Your test-email has been sent. Would you like to keep this window open to send the email again?\";s:32:\"press_crtl_and_select_to_compare\";s:35:\"Compare: Press CTRL + Click Version\";s:13:\"clear_filters\";s:13:\"Clear Filters\";s:18:\"tags_configuration\";s:18:\"Tags Configuration\";s:26:\"export_csv_include_headers\";s:23:\"CSV Export with headers\";s:19:\"analyze_permissions\";s:19:\"Analyze Permissions\";s:6:\"unique\";s:6:\"Unique\";s:9:\"operators\";s:9:\"Operators\";s:4:\"glue\";s:4:\"Glue\";s:6:\"prefix\";s:6:\"Prefix\";s:11:\"date_format\";s:11:\"Date Format\";s:9:\"attribute\";s:9:\"Attribute\";s:17:\"forward_attribute\";s:17:\"Forward Attribute\";s:5:\"upper\";s:5:\"Upper\";s:5:\"lower\";s:5:\"Lower\";s:8:\"disabled\";s:8:\"Disabled\";s:14:\"capitalization\";s:14:\"Capitalization\";s:28:\"piwik_all_websites_dashboard\";s:12:\"All Websites\";s:19:\"piwik_widget_widget\";s:6:\"Widget\";s:19:\"piwik_widget_period\";s:6:\"Period\";s:14:\"piwik_settings\";s:21:\"Matomo/Piwik Settings\";s:13:\"piwik_reports\";s:20:\"Matomo/Piwik Reports\";s:16:\"piwik_period_day\";s:3:\"Day\";s:17:\"piwik_period_week\";s:4:\"Week\";s:18:\"piwik_period_month\";s:5:\"Month\";s:17:\"piwik_period_year\";s:4:\"Year\";s:20:\"piwik_date_yesterday\";s:9:\"Yesterday\";s:16:\"piwik_date_today\";s:5:\"Today\";s:20:\"portlet_piwik_widget\";s:19:\"Matomo/Piwik Widget\";s:26:\"portlet_piwik_unconfigured\";s:49:\"Please use the gear icon to configure the widget.\";s:19:\"portlet_piwik_error\";s:22:\"Failed to load widget.\";s:19:\"restrict_to_locales\";s:19:\"Restrict to locales\";s:10:\"predefined\";s:10:\"Predefined\";s:12:\"save_as_copy\";s:12:\"Save as copy\";s:16:\"set_as_favourite\";s:16:\"Set as favourite\";s:18:\"grid_configuration\";s:18:\"Grid Configuration\";s:12:\"shared_users\";s:12:\"Shared Users\";s:12:\"shared_roles\";s:12:\"Shared Roles\";s:14:\"save_and_share\";s:12:\"Save & Share\";s:19:\"save_copy_and_share\";s:17:\"Save Copy & Share\";s:6:\"locale\";s:6:\"Locale\";s:8:\"ellipses\";s:8:\"Ellipses\";s:11:\"insensitive\";s:11:\"Insensitive\";s:9:\"yes_value\";s:9:\"Yes Value\";s:8:\"no_value\";s:8:\"No Value\";s:11:\"count_empty\";s:11:\"Count Empty\";s:8:\"as_array\";s:8:\"As array\";s:14:\"metadata_field\";s:14:\"Metadata field\";s:10:\"only_count\";s:13:\"Only as count\";s:9:\"parameter\";s:9:\"Parameter\";s:17:\"forward_parameter\";s:17:\"Forward Parameter\";s:8:\"is_array\";s:10:\"Array Type\";s:9:\"php_class\";s:9:\"PHP Class\";s:15:\"additional_data\";s:15:\"Additional Data\";s:7:\"flatten\";s:7:\"Flatten\";s:18:\"return_last_result\";s:18:\"Return last result\";s:9:\"skip_null\";s:9:\"Skip Null\";s:15:\"expand_children\";s:15:\"Expand children\";s:17:\"collapse_children\";s:17:\"Collapse children\";s:8:\"subtract\";s:8:\"Subtract\";s:8:\"multiply\";s:8:\"Multiply\";s:6:\"divide\";s:6:\"Divide\";s:20:\"apply_to_all_objects\";s:12:\"Apply to all\";s:24:\"apply_to_all_objects_msg\";s:123:\"There are other objects which already have their own favourite settings. Do you want to apply this config to those as well?\";s:6:\"encode\";s:6:\"Encode\";s:6:\"decode\";s:6:\"Decode\";s:9:\"serialize\";s:9:\"Serialize\";s:11:\"unserialize\";s:11:\"Unserialize\";s:6:\"offset\";s:6:\"Offset\";s:13:\"col_attribute\";s:20:\"Collection Attribute\";s:15:\"brick_attribute\";s:15:\"Brick Attribute\";s:24:\"csv_column_configuration\";s:20:\"Column Configuration\";s:20:\"import_configuration\";s:30:\"Import Configuration From JSON\";s:7:\"col_idx\";s:7:\"Col Idx\";s:6:\"column\";s:6:\"Column\";s:17:\"resolver_strategy\";s:17:\"Resolver Strategy\";s:17:\"resolver_settings\";s:17:\"Resolver Settings\";s:12:\"csv_settings\";s:12:\"CSV Settings\";s:11:\"skipheadrow\";s:13:\"Skip head row\";s:16:\"csv_file_preview\";s:16:\"CSV File Preview\";s:7:\"save_as\";s:7:\"Save as\";s:4:\"load\";s:4:\"Load\";s:27:\"import_export_configuration\";s:27:\"Import Export Configuration\";s:10:\"brick_type\";s:10:\"Brick Type\";s:8:\"renderer\";s:8:\"Renderer\";s:6:\"getter\";s:6:\"Getter\";s:6:\"string\";s:6:\"String\";s:4:\"bool\";s:4:\"Bool\";s:3:\"row\";s:3:\"Row\";s:13:\"import_report\";s:13:\"Import Report\";s:13:\"import_errors\";s:46:\"Some errors occurred. Check the import report!\";s:14:\"import_is_done\";s:14:\"Import is done\";s:18:\"import_file_prefix\";s:20:\"Prefix for new files\";s:14:\"skip_if_exists\";s:18:\"Skip row if exists\";s:20:\"php_class_or_service\";s:21:\"Class or service name\";s:14:\"create_parents\";s:14:\"Create parents\";s:8:\"fullpath\";s:9:\"Full Path\";s:16:\"create_on_demand\";s:16:\"Create on demand\";s:15:\"get_by_resolver\";s:16:\"Get By Attribute\";s:6:\"direct\";s:6:\"Direct\";s:17:\"skip_empty_values\";s:17:\"Skip empty values\";s:16:\"do_not_overwrite\";s:16:\"Do not overwrite\";s:5:\"never\";s:5:\"Never\";s:12:\"if_not_empty\";s:12:\"If not empty\";s:6:\"always\";s:6:\"Always\";s:9:\"delimiter\";s:9:\"Delimiter\";s:10:\"escapechar\";s:16:\"Escape Character\";s:14:\"lineterminator\";s:21:\"Line Terminator (hex)\";s:9:\"quotechar\";s:15:\"Quote Character\";s:14:\"share_globally\";s:14:\"Share globally\";s:19:\"gdpr_data_extractor\";s:19:\"GDPR Data Extractor\";s:16:\"no_configuration\";s:16:\"No Configuration\";s:24:\"no_configuration_message\";s:63:\"No column configuration is set. Do you really want to continue?\";s:20:\"share_configurations\";s:20:\"Share configurations\";s:18:\"enable_inheritance\";s:18:\"Enable Inheritance\";s:15:\"object_settings\";s:15:\"Object Settings\";s:12:\"drop_me_here\";s:43:\"Drag an item from the tree and drop it here\";s:18:\"clear_hotspots_msg\";s:96:\"This image contains additional data like markers or hotspots. Do you want to clear them as well?\";s:14:\"restore_failed\";s:14:\"Restore failed\";s:16:\"batch_append_all\";s:19:\"Batch append to all\";s:21:\"batch_append_selected\";s:24:\"Batch append to selected\";s:15:\"batch_append_to\";s:18:\"Append data to all\";s:24:\"batch_append_selected_to\";s:23:\"Append data to selected\";s:16:\"batch_remove_all\";s:21:\"Batch remove from all\";s:21:\"batch_remove_selected\";s:26:\"Batch remove from selected\";s:17:\"batch_remove_from\";s:20:\"Remove data from all\";s:26:\"batch_remove_selected_from\";s:25:\"Remove data from selected\";s:16:\"sort_children_by\";s:16:\"Sort Children By\";s:6:\"by_key\";s:12:\"Key (A to Z)\";s:14:\"by_key_reverse\";s:12:\"Key (Z to A)\";s:8:\"by_index\";s:14:\"Index (Manual)\";s:47:\"successful_object_change_children_sort_to_index\";s:40:\"Changed object children sorting to Index\";s:45:\"successful_object_change_children_sort_to_key\";s:38:\"Changed object children sorting to Key\";s:42:\"error_object_change_children_sort_to_index\";s:49:\"Unable to change object children sorting to Index\";s:40:\"error_object_change_children_sort_to_key\";s:47:\"Unable to change object children sorting to Key\";s:21:\"clear_version_message\";s:72:\"Do you really want to delete all non-published versions of this element?\";s:9:\"clear_all\";s:9:\"Clear All\";s:23:\"error_empty_file_upload\";s:14:\"File is empty!\";s:12:\"edit_as_html\";s:12:\"Edit as HTML\";s:18:\"edit_as_plain_text\";s:18:\"Edit as plain text\";s:11:\"type_column\";s:11:\"Type column\";s:4:\"keep\";s:4:\"keep\";s:24:\"download_selected_as_zip\";s:30:\"Download selected items as ZIP\";s:31:\"please_select_items_to_download\";s:43:\"Please select items to download in the list\";s:24:\"unlink_existing_document\";s:24:\"Unlink existing Document\";s:34:\"scheduled_block_delete_all_in_past\";s:23:\"Delete all past entries\";s:34:\"scheduled_block_really_delete_past\";s:48:\"Really delete all entries scheduled in the past?\";s:26:\"scheduled_block_delete_all\";s:18:\"Delete all entries\";s:33:\"scheduled_block_really_delete_all\";s:62:\"Really delete all scheduled entries, including future entries?\";s:12:\"key_bindings\";s:12:\"Key Bindings\";s:26:\"keybinding_openClassEditor\";s:17:\"Open Class Editor\";s:23:\"keybinding_showMetaInfo\";s:14:\"Show Meta Info\";s:25:\"keybinding_clearAllCaches\";s:16:\"Clear all Caches\";s:25:\"keybinding_clearDataCache\";s:16:\"Clear Data Cache\";s:11:\"2fa_disable\";s:11:\"Disable 2FA\";s:16:\"renew_2fa_secret\";s:23:\"Renew Two Factor Secret\";s:25:\"two_factor_authentication\";s:25:\"Two Factor Authentication\";s:14:\"2fa_alert_text\";s:289:\"Please scan the QR-Code and add it to your Google Authenticator. <br>If you don\'t have the Google Authenticator app installed on your mobile phone, please download it from the App Store/Play Store.<br><br> You will need to reload Pimcore and enter the code shown within the App afterwards!\";s:16:\"2fa_alert_submit\";s:27:\"Reload Pimcore & Enter Code\";s:16:\"setup_two_factor\";s:31:\"Setup Two Factor Authentication\";s:17:\"2fa_setup_message\";s:152:\"Two Factor Authentication is required for your account! You have to set it up in your profile settings, otherwise you will not be able to sign in again.\";s:15:\"set_focal_point\";s:15:\"Set Focal Point\";s:32:\"toggle_image_features_visibility\";s:31:\"Toggle Image Feature Visibility\";s:13:\"saving_failed\";s:14:\"Saving failed!\";s:25:\"failed_to_create_new_item\";s:44:\"Failed to create new item, please try again.\";s:6:\"bundle\";s:6:\"Bundle\";s:7:\"bundles\";s:7:\"Bundles\";s:7:\"product\";s:7:\"Product\";s:27:\"index_field_selection_field\";s:21:\"Index Field Selection\";s:24:\"indexFieldSelectionField\";s:21:\"Index Field Selection\";s:33:\"indexFieldSelectionField_settings\";s:44:\"Settings (Multi Index Field Selection Field)\";s:29:\"indexFieldSelectionFieldMulti\";s:30:\"Multiple Index Field Selection\";s:27:\"index_field_selection_combo\";s:20:\"Index Field Combobox\";s:24:\"indexFieldSelectionCombo\";s:20:\"Index Field Combobox\";s:33:\"indexFieldSelectionCombo_settings\";s:31:\"Settings (Index Field Combobox)\";s:18:\"specificPriceField\";s:20:\"Specific Price Field\";s:13:\"showAllFields\";s:15:\"Show all Fields\";s:15:\"considerTenants\";s:16:\"Consider Tenants\";s:25:\"bundle_ecommerce_mainmenu\";s:11:\"Online Shop\";s:30:\"bundle_ecommerce_pricing_rules\";s:13:\"Pricing Rules\";s:40:\"bundle_ecommerce_pricing_config_behavior\";s:8:\"Behavior\";s:39:\"bundle_ecommerce_pricing_config_additiv\";s:7:\"Additiv\";s:43:\"bundle_ecommerce_pricing_config_stopExecute\";s:9:\"Last rule\";s:51:\"bundle_ecommerce_pricing_config_condition_daterange\";s:10:\"Date range\";s:53:\"bundle_ecommerce_pricing_config_condition_cart_amount\";s:11:\"Cart amount\";s:50:\"bundle_ecommerce_pricing_config_condition_products\";s:8:\"Products\";s:8:\"category\";s:8:\"Category\";s:47:\"bundle_ecommerce_pricing_config_condition_token\";s:5:\"Token\";s:47:\"bundle_ecommerce_pricing_config_condition_sales\";s:5:\"Sales\";s:46:\"bundle_ecommerce_pricing_config_condition_sold\";s:4:\"Sold\";s:52:\"bundle_ecommerce_pricing_config_condition_sold_count\";s:5:\"Count\";s:57:\"bundle_ecommerce_pricing_config_condition_sold_count_cart\";s:10:\"Count Cart\";s:54:\"bundle_ecommerce_pricing_config_condition_voucherToken\";s:7:\"Voucher\";s:13:\"error_message\";s:13:\"Error Message\";s:48:\"bundle_ecommerce_pricing_config_condition_tenant\";s:6:\"Tenant\";s:53:\"bundle_ecommerce_pricing_config_condition_targetgroup\";s:12:\"Target Group\";s:63:\"bundle_ecommerce_pricing_config_condition_targetgroup_threshold\";s:9:\"Threshold\";s:43:\"bundle_ecommerce_pricing_config_action_gift\";s:4:\"Gift\";s:52:\"bundle_ecommerce_pricing_config_action_cart_discount\";s:13:\"Cart discount\";s:60:\"bundle_ecommerce_pricing_config_action_cart_discount_percent\";s:13:\"Discount in %\";s:59:\"bundle_ecommerce_pricing_config_action_cart_discount_amount\";s:17:\"Absolute Discount\";s:55:\"bundle_ecommerce_pricing_config_action_product_discount\";s:16:\"Product discount\";s:63:\"bundle_ecommerce_pricing_config_action_product_discount_percent\";s:13:\"Discount in %\";s:62:\"bundle_ecommerce_pricing_config_action_product_discount_amount\";s:17:\"Absolute Discount\";s:52:\"bundle_ecommerce_pricing_config_action_free_shipping\";s:13:\"Free shipping\";s:9:\"ecommerce\";s:10:\"E-Commerce\";s:13:\"preSelectMode\";s:15:\"Pre Select Mode\";s:13:\"remote_single\";s:25:\"Single Select from Remote\";s:12:\"remote_multi\";s:24:\"Multi Select from Remote\";s:12:\"local_single\";s:34:\"Single Select from predefined List\";s:11:\"local_multi\";s:33:\"Multi Select from predefined List\";s:19:\"indexFieldSelection\";s:21:\"Index Field Selection\";s:28:\"indexFieldSelection_settings\";s:30:\"Index Field Selection Settings\";s:12:\"filtergroups\";s:13:\"Filter Groups\";s:9:\"preSelect\";s:10:\"Pre Select\";s:29:\"predefined_pre_select_options\";s:29:\"Predefined pre select options\";s:35:\"bundle_ecommerce_clear_config_cache\";s:25:\"Clear configuration cache\";s:34:\"bundle_ecommerce_back-office_order\";s:22:\"Back Office - Ordering\";s:35:\"bundle_ecommerce_vouchertoolkit_tab\";s:15:\"Voucher Details\";s:26:\"bundle_ecommerce_order_tab\";s:13:\"Order Details\";s:9:\"thumbnail\";s:9:\"Thumbnail\";s:18:\"download_thumbnail\";s:18:\"Download Thumbnail\";s:21:\"no_thumbnail_selected\";s:21:\"No thumbnail selected\";s:55:\"list_thumbnail_in_download_section_on_image_detail_view\";s:55:\"List as option in download section on image detail view\";s:20:\"there_are_more_items\";s:35:\"There are more items than displayed\";s:10:\"unit_width\";s:10:\"Width Unit\";s:18:\"permission_missing\";s:51:\"You need the \'%s\' permission to perform this action\";s:25:\"paste_as_language_variant\";s:29:\"Paste as new language variant\";s:32:\"select_language_for_new_document\";s:32:\"Select language for New Document\";s:32:\"source_document_language_missing\";s:43:\"Set Language(Properties) in Source Document\";s:26:\"document_language_overview\";s:26:\"Document Language Overview\";s:15:\"language_master\";s:6:\"Master\";s:30:\"create_translation_inheritance\";s:32:\"Create Translation (Inheritance)\";s:18:\"create_translation\";s:18:\"Create Translation\";s:37:\"document_translation_parent_not_found\";s:78:\"Parent document has no translation. Create a translation for the parent first.\";s:25:\"enable_batch_edit_columns\";s:29:\"Enable Batch Edit for Columns\";s:10:\"delete_all\";s:10:\"Delete All\";s:19:\"open_linked_element\";s:19:\"Open linked Element\";s:12:\"mark_as_read\";s:12:\"Mark as read\";s:6:\"sender\";s:6:\"Sender\";s:13:\"notifications\";s:13:\"Notifications\";s:18:\"notifications_send\";s:18:\"Send Notifications\";s:5:\"group\";s:5:\"Group\";s:10:\"attachment\";s:10:\"Attachment\";s:26:\"notification_has_been_sent\";s:26:\"Notification has been sent\";s:9:\"recipient\";s:9:\"Recipient\";s:22:\"this_field_is_required\";s:22:\"This field is required\";s:35:\"paste_recursive_as_language_variant\";s:41:\"Paste as new language variant (recursive)\";s:27:\"paste_no_new_language_error\";s:54:\"All system languages already linked to source element.\";s:27:\"reload_column_configuration\";s:27:\"Reload column configuration\";s:34:\"reload_column_configuration_notice\";s:69:\"Note: Reloading column configuration will reset selected grid columns\";s:18:\"embedded_meta_data\";s:18:\"Embedded Meta Info\";s:8:\"duration\";s:8:\"Duration\";s:16:\"group_icon_class\";s:16:\"Group Icon Class\";s:25:\"custom_report_permissions\";s:10:\"Permission\";s:16:\"visible_to_users\";s:16:\"Visible To Users\";s:16:\"visible_to_roles\";s:16:\"Visible To Roles\";s:55:\"paste_recursive_as_language_variant_updating_references\";s:47:\"Paste language (recursive), updating references\";s:25:\"redirects_expired_cleanup\";s:25:\"Cleanup Expired Redirects\";s:25:\"redirects_cleanup_warning\";s:48:\"Do you really want to cleanup expired redirects?\";s:23:\"redirects_cleanup_error\";s:52:\"An error occurred while cleanup of expired redirects\";s:12:\"auto_convert\";s:20:\"Automatic conversion\";s:19:\"split_view_settings\";s:19:\"Split View Settings\";s:17:\"enable_split_view\";s:17:\"Enable Split View\";s:18:\"disable_split_view\";s:18:\"Disable Split View\";s:29:\"split_view_object_dirty_title\";s:14:\"Please confirm\";s:27:\"split_view_object_dirty_msg\";s:73:\"There are unsaved modifications. You will lose all changes. Are you sure?\";s:16:\"all_translations\";s:16:\"All Translations\";s:11:\"set_to_null\";s:19:\"Empty (set to null)\";s:12:\"unit_tooltip\";s:25:\"Alternative units tooltip\";s:23:\"share_via_notifications\";s:23:\"Share via Notifications\";s:14:\"asset_metadata\";s:14:\"Asset Metadata\";s:19:\"predefined_metadata\";s:19:\"Predefined Metadata\";s:16:\"default_metadata\";s:16:\"Default Metadata\";s:20:\"asset_export_warning\";s:115:\"Please note that the export does not support some fields(e.g. preview, size). Press OK to continue with the export.\";s:15:\"paste_clipboard\";s:15:\"Paste Clipboard\";s:10:\"paste_here\";s:30:\"Paste your clipboard data here\";s:61:\"cannot_save_metadata_please_try_to_edit_the_metadata_in_asset\";s:75:\"<b>Cannot save Metadata!</b><br />Please try to edit the metadata in Asset.\";s:17:\"email_log_forward\";s:13:\"Forward email\";s:24:\"complete_required_fields\";s:66:\"Please complete following required fields to publish the document:\";s:21:\"detect_image_features\";s:21:\"Detect Image Features\";s:21:\"remove_image_features\";s:21:\"Remove Image Features\";s:15:\"available_sites\";s:15:\"Available Sites\";s:8:\"fallback\";s:8:\"Fallback\";s:8:\"add_site\";s:8:\"Add Site\";s:18:\"domain_label_width\";s:18:\"Domain label width\";s:19:\"enable_grid_locking\";s:19:\"Enable grid locking\";s:28:\"redirect_performance_warning\";s:117:\"Using this feature has very bad effects on the performance of the entire application, do you really want to continue?\";s:13:\"Uncategorized\";s:13:\"Uncategorized\";s:7:\"methods\";s:7:\"Methods\";s:23:\"default_value_generator\";s:39:\"Default value generator service / class\";s:20:\"export_configuration\";s:28:\"Export Configuration As JSON\";s:13:\"property_name\";s:13:\"Property name\";s:11:\"force_value\";s:11:\"Force value\";s:17:\"composite_indices\";s:17:\"Composite indices\";s:11:\"fieldlookup\";s:12:\"Field Lookup\";s:16:\"show_fieldlookup\";s:17:\"Show Field Lookup\";s:12:\"no_value_set\";s:12:\"no value set\";s:21:\"batch_change_language\";s:21:\"Batch update language\";s:26:\"generate_type_declarations\";s:26:\"Generate Type Declarations\";s:19:\"brick_limit_reached\";s:51:\"Limit ({bricklimit}) reached for brick: {brickname}\";s:12:\"preview_item\";s:12:\"Preview Item\";s:29:\"invert_colors_on_login_screen\";s:29:\"Invert Colors on Login Screen\";s:12:\"encrypt_data\";s:12:\"Encrypt Data\";s:24:\"encrypt_data_description\";s:78:\"Data-at-Rest/Tablespace Encryption needs to be enabled on your Database Server\";s:20:\"many_to_one_relation\";s:20:\"Many-To-One Relation\";s:21:\"many_to_many_relation\";s:21:\"Many-To-Many Relation\";s:28:\"many_to_many_object_relation\";s:28:\"Many-To-Many Object Relation\";s:30:\"advanced_many_to_many_relation\";s:30:\"Advanced Many-To-Many Relation\";s:37:\"advanced_many_to_many_object_relation\";s:37:\"Advanced Many-To-Many Object Relation\";s:36:\"reverse_many_to_many_object_relation\";s:36:\"Reverse Many-To-Many Object Relation\";s:8:\"url_slug\";s:8:\"URL Slug\";s:22:\"url_slug_datatype_info\";s:107:\"Enter the controller & action in the following format:<br>AppBundle\\Controller\\ProductController:slugAction\";s:17:\"controller_action\";s:19:\"Controller & Action\";s:15:\"admin_interface\";s:15:\"Admin Interface\";s:12:\"icon_library\";s:12:\"Icon Library\";s:36:\"system_performance_stability_warning\";s:281:\"Please do not perform this action unless you are sure what you are doing.<br /><b style=\'color:red\'>This action can have a major impact onto the stability and performance of the entire system, and may causes an overload or complete crash of the server!</b><br /><br />Are you sure?\";s:12:\"login_screen\";s:12:\"Login Screen\";s:17:\"color_description\";s:36:\"Use the HTML hex format, eg. #ffffff\";s:6:\"colors\";s:6:\"Colors\";s:5:\"media\";s:5:\"Media\";s:11:\"custom_logo\";s:11:\"Custom Logo\";s:29:\"custom_login_background_image\";s:29:\"Custom Login Background Image\";s:25:\"branding_logo_description\";s:96:\"Used on the login and start screen. We recommend to use a SVG (JPG & PNG are supported as well).\";s:23:\"appearance_and_branding\";s:21:\"Appearance & Branding\";s:20:\"dev_mode_description\";s:209:\"The DEV-mode sets the highest verbosity level and removes certain performance optimizations such as combining Javascript of the admin backend. It is typically used for developing/debugging the core or plugins.\";s:24:\"do_not_use_in_production\";s:25:\"Do not use in production!\";s:10:\"brightness\";s:10:\"Brightness\";s:10:\"saturation\";s:10:\"Saturation\";s:3:\"hue\";s:3:\"Hue\";s:14:\"addoverlay_fit\";s:15:\"Add Overlay Fit\";s:12:\"environments\";s:12:\"Environments\";s:4:\"test\";s:4:\"Test\";s:10:\"colorspace\";s:10:\"Colorspace\";s:18:\"show_cookie_notice\";s:30:\"Show Cookie Notice (EU Policy)\";s:5:\"ratio\";s:5:\"Ratio\";s:12:\"decimal_size\";s:12:\"Decimal size\";s:17:\"decimal_precision\";s:17:\"Decimal precision\";s:23:\"decimal_mysql_type_info\";s:202:\"If decimal size or precision are specified, <code>DECIMAL(decimalSize, decimalPrecision)</code> MySQL type is used. Default values if missing are <code>64</code> as size and <code>0</code> as precision.\";s:33:\"decimal_mysql_type_naming_warning\";s:162:\"Please note that in MySQL terms, the <code>decimalSize</code> is called <code>precision</code> and the <code>decimalPrecision</code> is called <code>scale</code>.\";s:13:\"only_unsigned\";s:13:\"only unsigned\";s:7:\"integer\";s:7:\"Integer\";s:17:\"object_regex_info\";s:57:\"RegExp without delimiters, has to work in both JS and PHP\";s:16:\"regex_validation\";s:29:\"Regular Expression Validation\";s:11:\"test_string\";s:11:\"Test string\";s:5:\"regex\";s:5:\"RegEx\";s:16:\"code_before_init\";s:16:\"Code before init\";s:19:\"code_after_pageview\";s:19:\"Code after pageview\";s:20:\"code_before_pageview\";s:20:\"Code before pageview\";s:17:\"select_presetting\";s:19:\"Select a presetting\";s:4:\"good\";s:4:\"Good\";s:4:\"best\";s:4:\"Best\";s:21:\"1x1_pixel_placeholder\";s:21:\"1x1 Pixel Placeholder\";s:33:\"1x1_pixel_placeholder_description\";s:111:\"Just returns a 1x1 pixel GIF base64 encoded, in case you don\'t want to display an image for a certain condition\";s:7:\"average\";s:7:\"Average\";s:17:\"enter_media_query\";s:36:\"Please enter a valid CSS media query\";s:15:\"add_media_query\";s:15:\"Add Media Query\";s:17:\"specific_settings\";s:17:\"Specific Settings\";s:30:\"login_as_this_user_description\";s:100:\"The following link is a temporary link that allows you to login as this user in a different browser:\";s:18:\"login_as_this_user\";s:41:\"Login as this user in a different browser\";s:23:\"allowed_types_to_create\";s:23:\"Allowed types to create\";s:15:\"defaults_to_all\";s:15:\"Defaults to all\";s:33:\"analytics_universal_configuration\";s:74:\"Universal/GTag Analytics Configuration eg. {\'cookieDomain\': \'example.com\'}\";s:37:\"use_different_email_delivery_settings\";s:53:\"Use different email delivery settings for newsletters\";s:12:\"action_scope\";s:12:\"Action Scope\";s:3:\"hit\";s:3:\"Hit\";s:7:\"session\";s:7:\"Session\";s:22:\"session_with_variables\";s:24:\"Session (with variables)\";s:17:\"targeting_visitor\";s:7:\"Visitor\";s:58:\"targeting_condition_visited_page_before_piwik_data_warning\";s:92:\"This condition fetches data synchronously from Piwik which can be quite slow. Use with care!\";s:68:\"targeting_condition_visited_page_before_piwik_not_configured_warning\";s:93:\"This condition cannot be matched as Piwik is not configured and will always resolve to false.\";s:31:\"targeting_condition_url_pattern\";s:12:\"URL (RegExp)\";s:30:\"targeting_toolbar_browser_note\";s:253:\"<b>NOTE:</b> Enabling the targeting toolbar affects only the browser you are currently using. If you want to use the toolbar on another browser you need to enable it again. See <a target=\'_blank\' href=\'{targetingLink}\'>the documentation</a> for details.\";s:28:\"microsoft_word_export_notice\";s:361:\"<ul><li>It is not possible to re-import this export</li><li>The export file-format is HTML, which can be perfectly opened with Word</li><li>This export doesn\'t include the full layout information (just basic text-formatting)</li><li>The language selection is used to set the language for object\'s localized fields (only localized fields are exported!)</li></ul>\";s:18:\"fallback_languages\";s:37:\"Fallback Languages (CSV eg. de_CH,de)\";s:12:\"add_language\";s:12:\"Add Language\";s:16:\"default_language\";s:16:\"Default language\";s:23:\"wildcards_are_supported\";s:23:\"Wildcards are supported\";s:37:\"localization_and_internationalization\";s:39:\"Localization &amp; Internationalization\";s:13:\"code_settings\";s:13:\"Code Settings\";s:20:\"advanced_integration\";s:20:\"Advanced Integration\";s:26:\"assign_target_group_weight\";s:6:\"Weight\";s:12:\"target_group\";s:12:\"Target Group\";s:24:\"target_group_multiselect\";s:24:\"Target Group Multiselect\";s:21:\"select_a_target_group\";s:21:\"Select a Target Group\";s:28:\"usage_statistics_explanation\";s:103:\"Please do not deactivate this unless you really need to. You can see the data in /var/logs/usagelog.log\";s:25:\"turn_off_usage_statistics\";s:25:\"Turn off usage statistics\";s:8:\"children\";s:8:\"Children\";s:18:\"elements_to_export\";s:18:\"Elements to Export\";s:22:\"xliff_export_documents\";s:408:\"If you want to translate eg. the whole /en tree to a different language, first create a copy of the /en tree. Afterwards use the copied tree in the export and select the source language \'en\' and the target language \'de\'. When importing the translated XLIFF file, the contents of the exported documents (in this case the copied tree documents) will be overwritten by the German translations in the XLIFF file.\";s:20:\"xliff_export_objects\";s:301:\"Only fields inside a Localized Fields container are recognized. When importing the translated XLIFF the source language will be untouched, only the target language fields will be overwritten. Use Relations checkbox to include Objects & Documents from Dependencies e.g. Relation fields, Properties etc.\";s:19:\"xliff_export_notice\";s:90:\"Here you can select the documents and objects you want to export for external translation.\";s:16:\"important_notice\";s:16:\"Important Notice\";s:19:\"xliff_import_notice\";s:268:\"Select a translated XLIFF file which was previously exported by pimcore and then translated by a localization service provider (LSP) or by a CAT application. Please aware that the import will overwrite the elements which were selected by the import (read also export).\";s:9:\"composite\";s:9:\"Composite\";s:6:\"origin\";s:6:\"Origin\";s:15:\"high_resolution\";s:15:\"High Resolution\";s:19:\"pass_through_params\";s:19:\"Pass Through Params\";s:25:\"redirects_type_entire_uri\";s:10:\"Entire URI\";s:25:\"redirects_type_path_query\";s:14:\"Path and Query\";s:20:\"redirects_csv_import\";s:20:\"Redirects CSV Import\";s:22:\"redirects_import_total\";s:5:\"Total\";s:24:\"redirects_import_created\";s:7:\"Created\";s:24:\"redirects_import_updated\";s:7:\"Updated\";s:24:\"redirects_import_errored\";s:7:\"Errored\";s:23:\"redirects_import_errors\";s:6:\"Errors\";s:27:\"redirects_import_error_line\";s:4:\"Line\";s:19:\"analytics_gtag_code\";s:31:\"Use the gtag code for analytics\";s:26:\"analytics_retargeting_code\";s:46:\"Use the retargeting-code for analytics (dc.js)\";s:27:\"analytics_asynchronous_code\";s:47:\"Use the asynchronous code for analytics (ga.js)\";s:17:\"newsletter_active\";s:17:\"Newsletter Active\";s:20:\"newsletter_confirmed\";s:20:\"Newsletter Confirmed\";s:6:\"gender\";s:6:\"Gender\";s:17:\"use_original_tiff\";s:30:\"Use original TIFF (only PRINT)\";s:29:\"use_original_tiff_description\";s:73:\"Use original TIFF when source format is a TIFF image -> do not modify it.\";s:4:\"port\";s:4:\"Port\";s:17:\"delivery_settings\";s:17:\"Delivery Settings\";s:17:\"generate_previews\";s:17:\"Generate previews\";s:18:\"invalid_class_name\";s:18:\"Invalid Class Name\";s:39:\"redirect_unknown_domains_to_main_domain\";s:96:\"Redirect unknown domains (not used for a site and for redirects, ...) to the main domain (above)\";s:5:\"hours\";s:5:\"Hours\";s:7:\"minutes\";s:7:\"Minutes\";s:7:\"seconds\";s:7:\"Seconds\";s:16:\"operating_system\";s:16:\"Operating System\";s:17:\"hardware_platform\";s:17:\"Hardware Platform\";s:12:\"time_on_site\";s:12:\"Time on site\";s:27:\"visited_pages_before_number\";s:22:\"Visited n-pages before\";s:6:\"number\";s:6:\"Number\";s:19:\"visited_page_before\";s:19:\"Visited page before\";s:12:\"searchengine\";s:13:\"Search Engine\";s:8:\"referrer\";s:8:\"Referrer\";s:14:\"referring_site\";s:14:\"Referring Site\";s:3:\"AND\";s:3:\"AND\";s:2:\"OR\";s:2:\"OR\";s:7:\"AND_NOT\";s:7:\"AND NOT\";s:12:\"radius_in_km\";s:11:\"Radius (km)\";s:8:\"redirect\";s:8:\"Redirect\";s:12:\"code_snippet\";s:12:\"Code-Snippet\";s:7:\"browser\";s:7:\"Browser\";s:10:\"conditions\";s:10:\"Conditions\";s:10:\"save_order\";s:10:\"Save Order\";s:24:\"debug_admin_translations\";s:39:\"Debug Admin-Translations (wrapped in +)\";s:9:\"short_url\";s:9:\"Short URL\";s:39:\"width_and_height_must_be_an_even_number\";s:39:\"width and height must be an even number\";s:14:\"server_api_key\";s:14:\"Server API-Key\";s:15:\"browser_api_key\";s:15:\"Browser API-Key\";s:11:\"source_site\";s:11:\"Source-Site\";s:11:\"target_site\";s:11:\"Target-Site\";s:17:\"source_entire_url\";s:20:\"Entire URL as Source\";s:20:\"analytics_internalid\";s:14:\"GA Internal ID\";s:30:\"analytics_settings_description\";s:116:\"To use the complete Google Analytics integration, please configure the Google API Service Account in System Settings\";s:22:\"google_api_key_missing\";s:106:\"Google API private key is missing (JSON file from API Console), please put it into the following location:\";s:32:\"google_api_private_key_installed\";s:50:\"Your Google API private key is installed correctly\";s:29:\"google_api_access_description\";s:110:\"This is required for the Google API integrations. Only use a `Service Account´ from the Google Cloud Console.\";s:32:\"absolute_path_to_icc_rgb_profile\";s:32:\"Absolute path to ICC RGB profile\";s:33:\"absolute_path_to_icc_cmyk_profile\";s:33:\"Absolute path to ICC CMYK profile\";s:11:\"upload_path\";s:11:\"Upload Path\";s:17:\"selection_options\";s:17:\"Selection Options\";s:6:\"expiry\";s:6:\"Expiry\";s:6:\"mobile\";s:6:\"Mobile\";s:13:\"group_by_path\";s:13:\"Group by path\";s:5:\"flush\";s:5:\"Flush\";s:27:\"errors_from_the_last_7_days\";s:27:\"Errors from the last 7 days\";s:18:\"show_close_warning\";s:18:\"Show close warning\";s:13:\"matching_text\";s:13:\"Matching Text\";s:3:\"any\";s:3:\"Any\";s:11:\"http_method\";s:11:\"HTTP Method\";s:11:\"url_pattern\";s:40:\"URL Pattern<br />(RegExp eg. @success@i)\";s:9:\"beginning\";s:9:\"Beginning\";s:20:\"element_css_selector\";s:22:\"Element (CSS Selector)\";s:15:\"insert_position\";s:15:\"Insert Position\";s:31:\"robots_txt_exists_on_filesystem\";s:68:\"The robots.txt exists already in the document-root on the filesystem\";s:67:\"only_required_for_reporting_in_pimcore_but_not_for_code_integration\";s:143:\"The following is only required if you want to use the reporting functionalities in pimcore, but this is not required for the code integration. \";s:10:\"save_error\";s:16:\"Cannot save data\";s:9:\"all_roles\";s:9:\"All Roles\";s:8:\"add_role\";s:8:\"Add Role\";s:19:\"role_creation_error\";s:21:\"Could not create role\";s:10:\"workspaces\";s:10:\"Workspaces\";s:8:\"Username\";s:8:\"Username\";s:13:\"video_bitrate\";s:20:\"Video Bitrate (kB/s)\";s:13:\"audio_bitrate\";s:20:\"Audio Bitrate (kB/s)\";s:13:\"rasterize_svg\";s:14:\"Rasterize SVGs\";s:23:\"rasterize_svg_info_text\";s:107:\"SVGs get automatically rasterized when a transformation other than resize or scale by width/height is used.\";s:36:\"valid_languages_frontend_description\";s:323:\"These settings are used in documents to specify the content language (in properties tab), for objects in localized-fields, for shared translations, ... simply everywhere the editor can choose or use a language for the content.<br />Fallback languages are currently used in object\'s localized fields and shared translations.\";s:20:\"delete_language_note\";s:152:\"Note: Removing language from the list will not delete its respective data. Please use console command \'pimcore:locale:delete-unused-tables\' for cleanup.\";s:13:\"maximum_items\";s:10:\"max. items\";s:9:\"collapsed\";s:9:\"Collapsed\";s:35:\"url_to_custom_image_on_login_screen\";s:40:\"URL to custom image for the login screen\";s:5:\"sepia\";s:5:\"Sepia\";s:7:\"sharpen\";s:7:\"Sharpen\";s:12:\"gaussianBlur\";s:13:\"Gaussian Blur\";s:6:\"radius\";s:6:\"Radius\";s:5:\"sigma\";s:5:\"Sigma\";s:9:\"threshold\";s:9:\"Threshold\";s:9:\"tolerance\";s:9:\"Tolerance\";s:9:\"grayscale\";s:9:\"Grayscale\";s:20:\"nothing_to_configure\";s:20:\"Nothing to configure\";s:11:\"preview_url\";s:11:\"Preview URL\";s:7:\"opacity\";s:7:\"Opacity\";s:9:\"applymask\";s:10:\"Apply Mask\";s:10:\"addoverlay\";s:11:\"Add Overlay\";s:15:\"transformations\";s:15:\"Transformations\";s:50:\"you_can_drag_the_tabs_to_reorder_the_media_queries\";s:66:\"You can drag the tabs to reorder the priority of the media queries\";s:5:\"frame\";s:5:\"Frame\";s:18:\"setbackgroundcolor\";s:19:\"Set Backgroundcolor\";s:18:\"setbackgroundimage\";s:20:\"Set Background Image\";s:12:\"roundcorners\";s:13:\"Round Corners\";s:6:\"rotate\";s:6:\"Rotate\";s:5:\"color\";s:5:\"Color\";s:5:\"angle\";s:5:\"Angle\";s:11:\"label_width\";s:11:\"Label Width\";s:16:\"label_first_cell\";s:16:\"Label First Cell\";s:21:\"cache_disable_cookies\";s:33:\"Disable Cookies (comma separated)\";s:11:\"only_for_ip\";s:22:\"Only for IP (optional)\";s:56:\"please_dont_forget_to_reload_pimcore_after_modifications\";s:82:\"Please don\'t forget to clear the cache and reload pimcore after your modifications\";s:22:\"clear_cache_and_reload\";s:22:\"Clear cache and reload\";s:42:\"extension_manager_state_change_not_allowed\";s:49:\"State changes are not allowed for this extension.\";s:6:\"enable\";s:6:\"Enable\";s:7:\"disable\";s:7:\"Disable\";s:9:\"configure\";s:9:\"Configure\";s:17:\"manage_extensions\";s:17:\"Manage Extensions\";s:14:\"beginning_with\";s:14:\"Beginning with\";s:14:\"matching_exact\";s:16:\"Matching exactly\";s:15:\"add_expert_mode\";s:17:\"Add (Expert Mode)\";s:17:\"add_beginner_mode\";s:14:\"Add (Beginner)\";s:6:\"lowest\";s:6:\"lowest\";s:7:\"highest\";s:7:\"highest\";s:12:\"override_all\";s:12:\"override all\";s:10:\"deactivate\";s:10:\"Deactivate\";s:18:\"countrymultiselect\";s:23:\"Countries (Multiselect)\";s:19:\"languagemultiselect\";s:23:\"Languages (Multiselect)\";s:3:\"yes\";s:3:\"Yes\";s:2:\"no\";s:2:\"No\";s:34:\"allow_trailing_slash_for_documents\";s:27:\"Allow trailing Slash in URL\";s:15:\"localizedfields\";s:16:\"Localized Fields\";s:10:\"new_folder\";s:10:\"New Folder\";s:8:\"new_file\";s:8:\"New File\";s:10:\"proxy_host\";s:10:\"Proxy Host\";s:10:\"proxy_port\";s:10:\"Proxy Port\";s:10:\"proxy_user\";s:10:\"Proxy User\";s:10:\"proxy_pass\";s:10:\"Proxy Pass\";s:14:\"proxy_settings\";s:14:\"Proxy Settings\";s:24:\"select_connectivity_type\";s:24:\"Select Connectivity Type\";s:5:\"proxy\";s:5:\"Proxy\";s:13:\"direct_socket\";s:15:\"Direct (Socket)\";s:30:\"http_connectivity_direct_proxy\";s:38:\"HTTP Connectivity (direct, proxy, ...)\";s:8:\"gridview\";s:9:\"Grid View\";s:31:\"visibility_of_system_properties\";s:31:\"Visibility of system properties\";s:9:\"translate\";s:9:\"translate\";s:23:\"translations_admin_hint\";s:52:\"HINT: Please Reload UI to apply translation changes!\";s:13:\"allowed_types\";s:13:\"Allowed Types\";s:12:\"columnlength\";s:12:\"Columnlength\";s:23:\"visible_in_searchresult\";s:24:\"Visible in Search Result\";s:19:\"visible_in_gridview\";s:20:\"Visible in Grid View\";s:16:\"fieldcollections\";s:17:\"Field-Collections\";s:5:\"block\";s:5:\"Block\";s:7:\"tooltip\";s:7:\"Tooltip\";s:16:\"decimalPrecision\";s:17:\"Decimal-Precision\";s:9:\"css_style\";s:9:\"CSS Style\";s:11:\"add_setting\";s:11:\"Add Setting\";s:7:\"reverse\";s:7:\"Reverse\";s:10:\"geopolygon\";s:18:\"Geographic Polygon\";s:11:\"geopolyline\";s:19:\"Geographic Polyline\";s:9:\"geobounds\";s:17:\"Geographic Bounds\";s:31:\"sure_to_install_unstable_update\";s:70:\"Are you sure that you want to install a potential not working version?\";s:19:\"analytics_accountid\";s:24:\"Account-ID (eg. 1234567)\";s:26:\"verification_filename_text\";s:67:\"Verification Filename<br /><small>required for verification</small>\";s:16:\"analytics_notice\";s:147:\"Please read the documentation about the Google Analytics integration first, for the advanced mode you have to modify the Google Analytics settings.\";s:32:\"outputcache_lifetime_description\";s:180:\"Optional output-cache lifetime (in seconds) after the cache expires, if not defined the cache will be cleaned on every action inside the CMS, otherwise not (for high traffic sites)\";s:28:\"exclude_patterns_description\";s:45:\"Regular Expressions like: /^\\/dir\\/toexclude/\";s:22:\"analytics_trackid_code\";s:75:\"Track-ID (eg. UA-XXXXX-X)<br /><small>required for code integration</small>\";s:11:\"multiselect\";s:14:\"Multiselection\";s:7:\"handler\";s:7:\"Handler\";s:9:\"invisible\";s:9:\"Invisible\";s:25:\"only_configured_languages\";s:49:\"Show only in system settings configured languages\";s:11:\"permissions\";s:11:\"Permissions\";s:41:\"you_are_not_allowed_to_manage_admin_users\";s:41:\"You are not allowed to manage admin users\";s:12:\"content_type\";s:12:\"Content-Type\";s:12:\"new_property\";s:12:\"New Property\";s:9:\"all_users\";s:9:\"All Users\";s:5:\"admin\";s:5:\"Admin\";s:17:\"new_document_type\";s:17:\"New Document Type\";s:8:\"timezone\";s:8:\"Timezone\";s:4:\"host\";s:4:\"Host\";s:9:\"client_id\";s:9:\"Client ID\";s:29:\"store_version_history_in_days\";s:32:\"Store version history for x Days\";s:30:\"store_version_history_in_steps\";s:33:\"Store version history for x Steps\";s:6:\"layout\";s:6:\"Layout\";s:20:\"add_layout_component\";s:20:\"Add Layout Component\";s:18:\"add_data_component\";s:18:\"Add Data Component\";s:9:\"accordion\";s:9:\"Accordion\";s:6:\"iframe\";s:16:\"Preview / Iframe\";s:8:\"fieldset\";s:8:\"Fieldset\";s:5:\"panel\";s:5:\"Panel\";s:8:\"tabpanel\";s:8:\"Tabpanel\";s:12:\"tab_position\";s:12:\"Tab Position\";s:7:\"pattern\";s:7:\"Pattern\";s:9:\"variables\";s:9:\"Variables\";s:8:\"defaults\";s:8:\"Defaults\";s:7:\"wysiwyg\";s:7:\"WYSIWYG\";s:7:\"objects\";s:7:\"Objects\";s:13:\"allow_inherit\";s:17:\"Allow inheritance\";s:16:\"parent_php_class\";s:16:\"Parent PHP Class\";s:21:\"implements_interfaces\";s:23:\"Implements interface(s)\";s:10:\"use_traits\";s:12:\"Use (traits)\";s:16:\"general_settings\";s:16:\"General Settings\";s:15:\"layout_settings\";s:31:\"Layout Settings (Pimcore Admin)\";s:6:\"region\";s:6:\"Region\";s:11:\"collapsible\";s:11:\"Collapsible\";s:15:\"allowed_classes\";s:15:\"Allowed classes\";s:12:\"display_name\";s:12:\"Display name\";s:12:\"not_editable\";s:12:\"Not editable\";s:5:\"index\";s:7:\"Indexed\";s:14:\"mandatoryfield\";s:15:\"Mandatory field\";s:7:\"install\";s:7:\"Install\";s:9:\"uninstall\";s:9:\"Uninstall\";s:27:\"some_fields_cannot_be_saved\";s:28:\"Some fields cannot be saved.\";s:17:\"debug_description\";s:302:\"With debug-mode on errors and warnings are displayed directly in the browser, otherwise they are deactivated and the error-controller is active (Error Page). Multiple IP addresses can be specified by separating them with a comma. You can also specify IP ranges by specifying a mask, e.g. 192.168.1.0/24\";s:22:\"debug_override_warning\";s:102:\"<strong>WARNING:</strong> If the debug mode is explicitely set via code, this setting will be ignored.\";s:4:\"icon\";s:4:\"Icon\";s:6:\"slider\";s:6:\"Slider\";s:6:\"domain\";s:24:\"Domain (eg. example.org)\";s:8:\"datetime\";s:11:\"Date & Time\";s:31:\"google_credentials_and_api_keys\";s:29:\"Google Credentials & API Keys\";s:13:\"default_value\";s:13:\"Default value\";s:6:\"button\";s:6:\"Button\";s:8:\"priority\";s:8:\"Priority\";s:3:\"end\";s:3:\"End\";s:13:\"select_update\";s:13:\"Select update\";s:14:\"stable_updates\";s:24:\"Available stable updates\";s:18:\"non_stable_updates\";s:28:\"Available non-stable updates\";s:40:\"latest_pimcore_version_already_installed\";s:49:\"You have installed the latest version of pimcore.\";s:5:\"table\";s:5:\"Table\";s:4:\"rows\";s:4:\"Rows\";s:14:\"language_admin\";s:35:\"Default-Language in Admin-Interface\";s:16:\"exclude_patterns\";s:16:\"Exclude Patterns\";s:5:\"cover\";s:5:\"Cover\";s:7:\"contain\";s:7:\"Contain\";s:9:\"min_value\";s:10:\"min. Value\";s:9:\"max_value\";s:10:\"max. Value\";s:9:\"increment\";s:14:\"Increment Step\";s:8:\"vertical\";s:8:\"Vertical\";s:8:\"lifetime\";s:8:\"Lifetime\";s:7:\"country\";s:7:\"Country\";s:10:\"zoom_level\";s:10:\"Zoom level\";s:8:\"map_type\";s:8:\"Map type\";s:7:\"roadmap\";s:7:\"Roadmap\";s:9:\"satellite\";s:9:\"Satellite\";s:6:\"hybrid\";s:6:\"Hybrid\";s:21:\"google_api_key_simple\";s:53:\"Google API Key (Simple API Access for Maps, CSE, ...)\";s:22:\"google_api_key_service\";s:69:\"Google API Credentials (Service Account Client ID for Analytics, ...)\";s:21:\"document_restrictions\";s:21:\"Document Restrictions\";s:18:\"asset_restrictions\";s:18:\"Asset Restrictions\";s:19:\"object_restrictions\";s:19:\"Object Restrictions\";s:15:\"allow_documents\";s:15:\"allow Documents\";s:12:\"allow_assets\";s:12:\"allow Assets\";s:13:\"allow_objects\";s:13:\"allow Objects\";s:18:\"allowed_types_hint\";s:19:\"(empty = allow all)\";s:22:\"allowed_document_types\";s:22:\"Allowed Document Types\";s:19:\"allowed_asset_types\";s:19:\"Allowed Asset Types\";s:7:\"website\";s:7:\"Website\";s:19:\"user_creation_error\";s:21:\"Could not create user\";s:17:\"email_senderemail\";s:12:\"Sender Email\";s:16:\"email_sendername\";s:11:\"Sender Name\";s:17:\"email_returnemail\";s:12:\"Return Email\";s:16:\"email_returnname\";s:11:\"Return Name\";s:12:\"email_method\";s:12:\"Email Method\";s:15:\"email_smtp_host\";s:9:\"SMTP Host\";s:15:\"email_smtp_port\";s:9:\"SMTP Port\";s:15:\"email_smtp_name\";s:9:\"SMTP Name\";s:22:\"email_smtp_auth_method\";s:26:\"SMTP Authentication Method\";s:17:\"no_authentication\";s:17:\"No Authentication\";s:24:\"email_smtp_auth_username\";s:13:\"SMTP Username\";s:24:\"email_smtp_auth_password\";s:13:\"SMTP Password\";s:14:\"email_smtp_ssl\";s:23:\"SMTP Transport Security\";s:21:\"email_debug_addresses\";s:21:\"Debug Email Addresses\";s:6:\"no_ssl\";s:1:\"-\";s:36:\"user_object_dependencies_description\";s:49:\"This user is referenced in the following objects:\";s:10:\"webservice\";s:15:\"Web Service API\";s:18:\"webservice_enabled\";s:23:\"Web Service API enabled\";s:22:\"webservice_description\";s:158:\"Enabling the web service allows all admin users to access the pimcore REST API. Please check the pimcore wiki to find out how the token needs to be generated.\";s:22:\"user_admin_description\";s:176:\"Admin users do not only automatically gain all permissions listed below, they are also allowed to perform all actions on documents, assets and objects without any restrictions.\";s:23:\"user_apikey_description\";s:52:\"API key required for web service access by this user\";s:6:\"apikey\";s:7:\"API Key\";s:12:\"lazy_loading\";s:12:\"lazy loading\";s:21:\"non_owner_description\";s:309:\"Non owner objects represent relations to an other object just in the same way as objects do. The difference is, that a non-owner object field is not the owner of the relation data, it is merely a view on data stored in other objects. Please choose the owner and field name where the data is originally stored.\";s:14:\"allow_variants\";s:14:\"Allow variants\";s:13:\"show_variants\";s:21:\"Show variants in tree\";s:19:\"allowed_class_field\";s:19:\"Allowed class/field\";s:15:\"structuredTable\";s:16:\"Structured Table\";s:8:\"position\";s:8:\"Position\";s:29:\"objectsMetadata_allowed_class\";s:13:\"Allowed Class\";s:30:\"objectsMetadata_visible_fields\";s:14:\"Visible Fields\";s:31:\"objectsMetadata_type_columnbool\";s:11:\"Column Bool\";s:32:\"objectsMetadata_type_multiselect\";s:11:\"Multiselect\";s:30:\"file_explorer_saved_file_error\";s:16:\"Cannot save file\";s:26:\"reserved_field_names_error\";s:54:\"Please do not use the following reserved field names: \";s:16:\"use_current_date\";s:16:\"Use current date\";s:31:\"inherited_default_value_warning\";s:94:\"The default value is used if either inheritance is deactivated or if the parent value is empty\";s:19:\"instance_identifier\";s:19:\"Instance identifier\";s:24:\"instance_identifier_info\";s:245:\"The instance identifier has to be unique throughout multiple Pimcore instances. UUID generation will be automatically enabled if a Instance identifier is provided (do not change the instance identifier afterwards - this will cause invalid UUIDs)\";s:21:\"restrict_selection_to\";s:21:\"Restrict Selection To\";s:12:\"maximum_tabs\";s:22:\"Maximum number of tabs\";s:9:\"algorithm\";s:9:\"Algorithm\";s:4:\"salt\";s:4:\"Salt\";s:12:\"saltlocation\";s:13:\"Salt location\";s:13:\"custom_layout\";s:13:\"Custom Layout\";s:24:\"custom_layout_definition\";s:24:\"Custom Layout Definition\";s:24:\"configure_custom_layouts\";s:24:\"Configure Custom Layouts\";s:10:\"add_layout\";s:10:\"Add Layout\";s:13:\"delete_layout\";s:13:\"Delete Layout\";s:16:\"special_settings\";s:16:\"Special Settings\";s:14:\"custom_layouts\";s:14:\"Custom Layouts\";s:14:\"new_definition\";s:14:\"New Definition\";s:14:\"target_subtype\";s:11:\"Target Type\";s:9:\"mandatory\";s:9:\"Mandatory\";s:18:\"disallow_addremove\";s:19:\"Disallow Add/Remove\";s:16:\"disallow_reorder\";s:20:\"Dissallow Reordering\";s:17:\"reload_definition\";s:17:\"Reload Definition\";s:6:\"saving\";s:6:\"Saving\";s:10:\"definition\";s:10:\"Definition\";s:11:\"objectbrick\";s:12:\"Object Brick\";s:10:\"select_all\";s:10:\"Select All\";s:12:\"deselect_all\";s:12:\"Deselect All\";s:17:\"definitions_saved\";s:17:\"Definitions saved\";s:31:\"predefined_metadata_definitions\";s:31:\"Predefined Metadata Definitions\";s:14:\"default_layout\";s:21:\"Use as default layout\";s:19:\"hide_edit_image_tab\";s:19:\"Hide Edit Image Tab\";s:22:\"are_you_sure_recursive\";s:62:\"There child nodes which will be deleted as well! Are you sure?\";s:17:\"log_relatedobject\";s:14:\"Related object\";s:13:\"log_component\";s:9:\"Component\";s:15:\"log_search_form\";s:16:\"Search parameter\";s:15:\"log_search_type\";s:12:\"Logging type\";s:24:\"log_search_relatedobject\";s:19:\"Related object (id)\";s:13:\"log_timestamp\";s:9:\"Timestamp\";s:14:\"log_fileobject\";s:11:\"File object\";s:21:\"log_detailinformation\";s:18:\"Detail information\";s:32:\"log_config_send_summary_per_mail\";s:26:\"Send log summary via email\";s:26:\"log_config_filter_priority\";s:34:\"Mail log summary - filter priority\";s:24:\"log_config_mail_receiver\";s:26:\"Mail log summary receivers\";s:36:\"log_config_mail_receiver_description\";s:50:\"Separate multiple email receivers separated by \';\'\";s:27:\"log_config_archive_treshold\";s:26:\"Archive treshold (in days)\";s:39:\"log_config_archive_alternative_database\";s:32:\"Archive database name (optional)\";s:30:\"log_config_archive_description\";s:87:\"Use of an alternative database recommended when huge amounts of logs will be generated.\";s:36:\"classificationstore_group_definition\";s:6:\"Groups\";s:36:\"classificationstore_group_limitation\";s:16:\"Max. group items\";s:40:\"classificationstore_mbx_entergroup_title\";s:9:\"New Group\";s:41:\"classificationstore_mbx_entergroup_prompt\";s:10:\"Enter name\";s:38:\"classificationstore_error_addgroup_msg\";s:18:\"Error adding group\";s:31:\"classificationstore_invalidname\";s:12:\"Invalid name\";s:42:\"classificationstore_error_group_exists_msg\";s:35:\"Group with this name already exists\";s:30:\"classificationstore_properties\";s:15:\"Key Definitions\";s:38:\"classificationstore_mbx_enterkey_title\";s:7:\"New Key\";s:42:\"classificationstore_detailed_configuration\";s:22:\"Detailed Configuration\";s:35:\"classificationstore_detailed_config\";s:15:\"Detailed Config\";s:9:\"relations\";s:9:\"Relations\";s:9:\"localized\";s:9:\"Localized\";s:17:\"allowed_group_ids\";s:23:\"Allowed Group Ids (csv)\";s:6:\"key_id\";s:6:\"Key ID\";s:6:\"sorter\";s:6:\"Sorter\";s:34:\"classificationstore_tooltip_sorter\";s:43:\"Items with lower value will be listed first\";s:41:\"classificationstore_collection_definition\";s:17:\"Group Collections\";s:8:\"group_id\";s:8:\"Group ID\";s:10:\"collection\";s:10:\"Collection\";s:45:\"classificationstore_mbx_entercollection_title\";s:14:\"New Collection\";s:22:\"class_field_name_error\";s:33:\"Following field name has an error\";s:24:\"inputQuantityValue_field\";s:20:\"Input Quantity Value\";s:12:\"abbreviation\";s:12:\"Abbreviation\";s:8:\"longname\";s:8:\"Longname\";s:8:\"baseunit\";s:9:\"Base Unit\";s:19:\"quantityValue_units\";s:29:\"QuantityValue Unit Definition\";s:25:\"valid_quantityValue_units\";s:11:\"Valid units\";s:31:\"calculatedValue_calculatorclass\";s:16:\"Calculator class\";s:27:\"calculatedValue_explanation\";s:87:\"See the official documentation to learn more about which methods need to be implemented\";s:21:\"calculatedValue_field\";s:16:\"Calculated Value\";s:16:\"conversionFactor\";s:17:\"Conversion Factor\";s:16:\"conversionOffset\";s:17:\"Conversion Offset\";s:12:\"default_unit\";s:12:\"Default Unit\";s:13:\"min_max_times\";s:15:\"Min / Max Times\";s:5:\"reset\";s:5:\"Reset\";s:13:\"password_hint\";s:135:\"Password must contain at least 10 characters, one lowercase letter, one uppercase letter, one numeric digit, and one special character!\";s:15:\"editor_settings\";s:15:\"Editor Settings\";s:14:\"language_order\";s:14:\"Language Order\";s:13:\"preview_width\";s:13:\"Preview Width\";s:14:\"preview_height\";s:14:\"Preview Height\";s:9:\"url_width\";s:9:\"URL Width\";s:13:\"externalImage\";s:14:\"External Image\";s:7:\"log_pid\";s:3:\"PID\";s:35:\"search_console_settings_description\";s:112:\"To use the Google Search Console integration, please configure the Google API Service Account in System Settings\";s:14:\"fieldcontainer\";s:15:\"Field Container\";s:5:\"store\";s:5:\"Store\";s:18:\"edit_configuration\";s:24:\"Edit Store Configuration\";s:40:\"classificationstore_mbx_enterstore_title\";s:9:\"New Store\";s:41:\"classificationstore_mbx_enterstore_prompt\";s:16:\"Enter store name\";s:38:\"classificationstore_error_addstore_msg\";s:20:\"Error creating store\";s:14:\"search_for_key\";s:10:\"Search Key\";s:32:\"web2print_enable_in_default_view\";s:52:\"Enable Web2Print documents in default documents view\";s:36:\"web2print_enable_in_default_view_txt\";s:172:\"Enables Web2Print documents in default documents view in default perspective. Either activate this or create custom views and perspectives for managing Web2Print documents.\";s:14:\"web2print_tool\";s:4:\"Tool\";s:19:\"web2print_save_mode\";s:18:\"Document Save Mode\";s:23:\"web2print_save_mode_txt\";s:152:\"Document Save Mode = cleanup deletes all not used document elements for current document. This might be necessary for useage reports in print documents.\";s:29:\"web2print_pdfreactor_settings\";s:19:\"PDFreactor Settings\";s:16:\"web2print_server\";s:6:\"Server\";s:17:\"web2print_baseURL\";s:7:\"BaseURL\";s:21:\"web2print_baseURL_txt\";s:100:\"BaseURL for PDFreactor. This is prefixed to each relative url in print templates when creating PDFs.\";s:20:\"web2print_apiKey_txt\";s:80:\"If the PDFreactor instance is set up to require API keys, you can enter it here.\";s:17:\"web2print_licence\";s:7:\"Licence\";s:30:\"web2print_wkhtmltopdf_settings\";s:20:\"Wkhtmltopdf Settings\";s:28:\"web2print_wkhtmltopdf_binary\";s:18:\"wkhtmltopdf Binary\";s:29:\"web2print_wkhtmltopdf_options\";s:7:\"Options\";s:33:\"web2print_wkhtmltopdf_options_txt\";s:78:\"One per line with \'--\' and whitespace between key and value (e.g. --key value)\";s:18:\"web2print_hostname\";s:8:\"Hostname\";s:20:\"disable_tree_preview\";s:20:\"Disable Tree Preview\";s:14:\"PHP Class Name\";s:14:\"PHP Class Name\";s:20:\"editor_configuration\";s:20:\"Editor Configuration\";s:17:\"allow_dirty_close\";s:31:\"Disable unsaved content warning\";s:25:\"high_resolution_info_text\";s:173:\"eg. for Web-to-Print or everywhere where srcset is not possible/sufficient, not necessary for normal web-thumbnails, they automatically get a srcset attribute with 1x and 2x\";s:17:\"advanced_settings\";s:17:\"Advanced settings\";s:18:\"preserve_meta_data\";s:32:\"Preserve meta data (don\'t strip)\";s:14:\"preserve_color\";s:31:\"Preserve color (profile, space)\";s:28:\"thumbnail_preserve_info_text\";s:168:\"\'Preserve meta data\' and \'preserve color\' only works for transitions without compositions (frame, background color, ...) and color modifications (greyscale, sepia, ...)\";s:22:\"path_formatter_service\";s:25:\"Formatter Service / Class\";s:9:\"separated\";s:9:\"separated\";s:24:\"additional_path_variable\";s:25:\"Additional $PATH variable\";s:17:\"log_refresh_label\";s:13:\"Refresh every\";s:28:\"website_translation_settings\";s:27:\"Shared Translation Settings\";s:20:\"language_permissions\";s:51:\"Language Permissions (no view permission means all)\";s:15:\"rendering_class\";s:21:\"Custom Renderer class\";s:14:\"rendering_data\";s:23:\"Data passed to renderer\";s:18:\"web2print_protocol\";s:8:\"Protocol\";s:10:\"rows_fixed\";s:10:\"Rows fixed\";s:10:\"cols_fixed\";s:10:\"Cols fixed\";s:12:\"force_resize\";s:12:\"Force resize\";s:8:\"site_ids\";s:8:\"Site IDs\";s:16:\"site_ids_tooltip\";s:42:\"Provide a comma-seperated list of site IDs\";s:33:\"predefined_hotspot_data_templates\";s:25:\"Predefined data templates\";s:36:\"hide_locale_labels_when_tabs_reached\";s:39:\"Hide locale labels after number of tabs\";s:36:\"classificationstore_error_addkey_msg\";s:16:\"Error adding Key\";s:42:\"classificationstore_dialog_keygroup_search\";s:16:\"Key/Group Search\";s:22:\"options_provider_class\";s:38:\"Options Provider Class or Service Name\";s:21:\"options_provider_data\";s:21:\"Options Provider Data\";s:18:\"show_applogger_tab\";s:19:\"Show App Logger Tab\";s:7:\"analyze\";s:7:\"Analyze\";s:24:\"link_generator_reference\";s:35:\"Link Provider Class or Service Name\";s:11:\"unique_qtip\";s:62:\"Unique constraint will added. No need to check \'index\' as well\";s:20:\"temporarily_disabled\";s:20:\"Temporarily disabled\";s:19:\"enabled_in_editmode\";s:19:\"Enabled in Editmode\";s:14:\"boolean_select\";s:14:\"Boolean Select\";s:9:\"yes_label\";s:16:\"Yes Display Name\";s:8:\"no_label\";s:15:\"No Display Name\";s:11:\"empty_label\";s:18:\"Empty Display Name\";s:19:\"piwik_config_notice\";s:159:\"Please read the documentation about the Matomo/Piwik integration first as you may need to configure your Matomo/Piwik installation to make use of all features.\";s:9:\"piwik_url\";s:37:\"Matomo/Piwik URL (including protocol)\";s:18:\"piwik_api_settings\";s:15:\"API Integration\";s:24:\"piwik_api_client_options\";s:18:\"API Client Options\";s:36:\"piwik_api_client_options_description\";s:216:\"You can define custom Guzzle client options as JSON string which will be used when issuing API requests. Please see the <a target=\'_blank\' href=\'{guzzleLink}\'>Guzzle Documentation</a> for a list of available options.\";s:12:\"piwik_tokens\";s:21:\"Authentication Tokens\";s:15:\"piwik_api_token\";s:9:\"API Token\";s:20:\"piwik_api_token_info\";s:168:\"Authentication token used send API requests (e.g. when updating site settings). If this token is not set, Matomo/Piwik updates from within Pimcore will not be possible.\";s:21:\"piwik_api_create_site\";s:14:\"Create via API\";s:29:\"piwik_api_create_site_tooltip\";s:33:\"Create a new site in Matomo/Piwik\";s:29:\"piwik_api_create_site_success\";s:47:\"Successfully created site via Matomo/Piwik API.\";s:29:\"piwik_api_create_site_failure\";s:43:\"Failed to create site via Matomo/Piwik API.\";s:21:\"piwik_api_update_site\";s:14:\"Update via API\";s:29:\"piwik_api_update_site_tooltip\";s:57:\"Update site config (list of domains) via Matomo/Piwik API\";s:29:\"piwik_api_update_site_success\";s:54:\"Successfully updated site config via Matomo/Piwik API.\";s:29:\"piwik_api_update_site_failure\";s:50:\"Failed to update site config via Matomo/Piwik API.\";s:18:\"piwik_report_token\";s:12:\"Report Token\";s:23:\"piwik_report_token_info\";s:207:\"Authentication token used to integrate report widgets and dashboards. If this token is not set, reporting from within Pimcore will not be possible. It\'s recommended to use a token with read only rights here.\";s:24:\"piwik_iframe_integration\";s:18:\"Iframe Integration\";s:29:\"piwik_iframe_integration_info\";s:450:\"You can embed the whole Matomo/Piwik application as iframe by letting Pimcore generate a \'logme\' URL which automatically logs the selected user into Matomo/Piwik. To authenticate a user, Matomo/Piwik expects a username and the user\'s password as MD5 hash. Please make sure to read the Matomo/Piwik integration documentation as you need to update your Matomo/Piwik settings for this feature (see <a target=\"_blank\" href=\"{matomoLink}\">Matomo FAQ</a>).\";s:21:\"piwik_iframe_username\";s:21:\"Matomo/Piwik Username\";s:21:\"piwik_iframe_password\";s:27:\"Matomo/Piwik Password (MD5)\";s:26:\"piwik_iframe_password_info\";s:73:\"The password needs to be an MD5 hash of the actual Matomo/Piwik password.\";s:35:\"gdpr_dataSource_sentMail_only_email\";s:27:\"Search only based on E-Mail\";s:12:\"imageGallery\";s:13:\"Image Gallery\";s:11:\"column_type\";s:11:\"Column Type\";s:14:\"encryptedField\";s:15:\"Encrypted Field\";s:8:\"datatype\";s:8:\"Datatype\";s:13:\"used_by_class\";s:14:\"Used by class:\";s:17:\"uses_these_bricks\";s:18:\"Uses these bricks:\";s:10:\"last_login\";s:10:\"Last Login\";s:23:\"multiselect_render_type\";s:11:\"Render Type\";s:36:\"please_dont_forget_to_reload_pimcore\";s:69:\"<b>Please don\'t forget to reload pimcore after your modification!</b>\";s:12:\"2fa_required\";s:34:\"Two Factor Authentication required\";s:16:\"2fa_reset_secret\";s:16:\"Reset 2FA Secret\";s:14:\"2fa_reset_done\";s:91:\"The 2FA secret was reset, the user can generate a new one after login (My Profile section).\";s:19:\"focal_point_support\";s:19:\"Focal Point Support\";s:19:\"default_positioning\";s:19:\"Default Positioning\";s:28:\"thumbnail_focal_point_notice\";s:161:\"The image is cropped automatically based on the focal point set on the source image. If no focal point is present, the default positioning setting below is used.\";s:10:\"iframe_url\";s:10:\"IFrame URL\";s:22:\"deactivate_maintenance\";s:22:\"Deactivate Maintenance\";s:16:\"maintenance_mode\";s:16:\"Maintenance Mode\";s:22:\"maintenance_not_active\";s:51:\"It seems that the maintenance isn\'t set up properly\";s:24:\"mail_settings_incomplete\";s:46:\"It seems that the mail settings are incomplete\";s:11:\"bulk_export\";s:11:\"Bulk Export\";s:11:\"bulk_import\";s:11:\"Bulk Import\";s:19:\"warning_bulk_import\";s:123:\"The Bulk Import will overwrite your class/fieldcollection/objectbrick definitions without warning! Do you want to continue?\";s:11:\"environment\";s:11:\"Environment\";s:5:\"local\";s:5:\"Local\";s:7:\"example\";s:7:\"Example\";s:17:\"send_as_html_mime\";s:17:\"Send as HTML/Mime\";s:18:\"send_as_plain_text\";s:18:\"Send as plain text\";s:15:\"send_test_email\";s:15:\"Send Test-Email\";s:11:\"main_domain\";s:11:\"Main Domain\";s:10:\"error_page\";s:10:\"Error Page\";s:18:\"additional_domains\";s:40:\"Additional Domains (one domain per line)\";s:23:\"redirect_to_main_domain\";s:42:\"Redirect additional domains to main domain\";s:13:\"debug_mode_on\";s:10:\"DEBUG MODE\";s:5:\"scope\";s:5:\"Scope\";s:10:\"icon_class\";s:10:\"Icon Class\";s:9:\"nice_name\";s:9:\"Nice Name\";s:20:\"create_menu_shortcut\";s:23:\"Create Shortcut in Menu\";s:7:\"display\";s:7:\"Display\";s:5:\"order\";s:5:\"Order\";s:11:\"filter_type\";s:11:\"Filter Type\";s:22:\"generate_page_previews\";s:22:\"Generate Page Previews\";s:28:\"custom_report_chart_settings\";s:14:\"Chart Settings\";s:23:\"custom_report_charttype\";s:10:\"Chart Type\";s:28:\"custom_report_charttype_none\";s:4:\"None\";s:27:\"custom_report_charttype_pie\";s:9:\"Pie Chart\";s:28:\"custom_report_charttype_line\";s:10:\"Line Chart\";s:27:\"custom_report_charttype_bar\";s:9:\"Bar Chart\";s:27:\"custom_report_chart_options\";s:27:\"Type specific Chart Options\";s:20:\"custom_report_x_axis\";s:6:\"X-Axis\";s:20:\"custom_report_y_axis\";s:6:\"Y-Axis\";s:24:\"custom_report_datacolumn\";s:11:\"Data Column\";s:25:\"custom_report_labelcolumn\";s:12:\"Label Column\";s:25:\"custom_report_only_filter\";s:11:\"Only Filter\";s:29:\"custom_report_filter_and_show\";s:15:\"Filter and Show\";s:30:\"custom_report_filter_drilldown\";s:16:\"Filter Drilldown\";s:26:\"no_further_sources_allowed\";s:31:\"No further data sources allowed\";s:20:\"column_configuration\";s:35:\"Manage & Share Column Configuration\";s:23:\"show_in_google_anaytics\";s:24:\"Show in Google Analytics\";s:5:\"style\";s:5:\"Style\";s:16:\"foreground_color\";s:16:\"Foreground Color\";s:16:\"background_color\";s:16:\"Background Color\";s:22:\"system_infos_and_tools\";s:19:\"System Info & Tools\";s:8:\"php_info\";s:8:\"PHP Info\";s:18:\"php_opcache_status\";s:18:\"PHP OPcache Status\";s:25:\"system_requirements_check\";s:25:\"System-Requirements Check\";s:11:\"server_info\";s:11:\"Server Info\";s:23:\"database_administration\";s:23:\"Database Administration\";s:94:\"important_use_imagick_pecl_extensions_for_best_results_gd_is_just_a_fallback_with_less_quality\";s:125:\"IMPORTANT: Use imagick PECL extension for best results, GDlib is just a fallback with limited functionality and less quality!\";s:4:\"trim\";s:4:\"Trim\";s:19:\"server_fileexplorer\";s:20:\"Server File Explorer\";s:8:\"add_user\";s:8:\"Add User\";s:16:\"direct_sql_query\";s:16:\"Direct SQL query\";s:11:\"use_as_site\";s:11:\"Use as site\";s:11:\"remove_site\";s:11:\"Remove Site\";s:9:\"edit_site\";s:9:\"Edit Site\";s:7:\"site_id\";s:7:\"Site ID\";s:16:\"website_settings\";s:16:\"Website Settings\";s:11:\"clear_cache\";s:11:\"Clear Cache\";s:10:\"extensions\";s:10:\"Extensions\";s:6:\"update\";s:6:\"Update\";s:15:\"system_settings\";s:15:\"System Settings\";s:16:\"image_thumbnails\";s:16:\"Image Thumbnails\";s:10:\"thumbnails\";s:10:\"Thumbnails\";s:5:\"cache\";s:5:\"Cache\";s:7:\"classes\";s:7:\"Classes\";s:13:\"static_routes\";s:13:\"Static Routes\";s:10:\"structured\";s:10:\"Structured\";s:3:\"geo\";s:10:\"Geographic\";s:7:\"loading\";s:7:\"Loading\";s:5:\"steps\";s:5:\"Steps\";s:8:\"database\";s:8:\"Database\";s:8:\"location\";s:8:\"Location\";s:5:\"every\";s:5:\"Every\";s:10:\"categories\";s:10:\"Categories\";s:8:\"revision\";s:5:\"Build\";s:12:\"objectbricks\";s:12:\"Objectbricks\";s:17:\"class_definitions\";s:17:\"Class Definitions\";s:21:\"custom_layout_changed\";s:74:\"Layout was changed in the meantime. Please reload the layout and try again\";s:14:\"rule_violation\";s:14:\"Rule Violation\";s:6:\"emails\";s:6:\"Emails\";s:18:\"log_applicationlog\";s:18:\"Application Logger\";s:20:\"classification_store\";s:20:\"Classification Store\";s:19:\"quantityValue_field\";s:14:\"Quantity Value\";s:8:\"expanded\";s:8:\"Expanded\";s:12:\"display_type\";s:12:\"Display Type\";s:19:\"custom_report_class\";s:12:\"Report class\";s:4:\"hide\";s:4:\"Hide\";s:15:\"full_page_cache\";s:15:\"Full Page Cache\";s:21:\"clear_full_page_cache\";s:21:\"Clear Full Page Cache\";s:10:\"all_caches\";s:10:\"All Caches\";s:18:\"web2print_settings\";s:21:\"Web-to-Print Settings\";s:18:\"admin_translations\";s:18:\"Admin Translations\";s:4:\"lock\";s:4:\"Lock\";s:6:\"unlock\";s:6:\"Unlock\";s:28:\"lock_and_propagate_to_childs\";s:30:\"Lock and propagate to children\";s:32:\"unlock_and_propagate_to_children\";s:32:\"Unlock and propagate to children\";s:10:\"data_cache\";s:10:\"Data Cache\";s:18:\"listing_use_traits\";s:20:\"Listing Use (traits)\";s:24:\"listing_parent_php_class\";s:24:\"Listing Parent PHP Class\";s:15:\"expand_cs_group\";s:63:\"There are empty features not displayed here. Click to show them\";s:15:\"hide_empty_data\";s:15:\"Hide empty data\";s:16:\"class_attributes\";s:16:\"Class Attributes\";s:20:\"operator_group_other\";s:6:\"Others\";s:26:\"operator_group_transformer\";s:12:\"Transformers\";s:24:\"operator_group_extractor\";s:10:\"Extractors\";s:24:\"operator_group_formatter\";s:10:\"Formatters\";s:23:\"operator_group_renderer\";s:8:\"Renderer\";s:26:\"operator_renderer_settings\";s:17:\"Renderer Settings\";s:15:\"refresh_preview\";s:15:\"Refresh Preview\";s:14:\"show_charcount\";s:20:\"Show Character Count\";s:10:\"max_length\";s:10:\"Max Length\";s:14:\"reports_config\";s:14:\"Reports Config\";s:25:\"exclude_from_search_index\";s:37:\"Exclude from Backend Full-Text Search\";s:4:\"left\";s:4:\"left\";s:5:\"right\";s:5:\"right\";s:18:\"provide_split_view\";s:18:\"Provide Split View\";s:26:\"allow_multiple_assignments\";s:26:\"Allow Multiple Assignments\";s:23:\"enable_admin_async_load\";s:26:\"Enable Async Load in Admin\";s:27:\"async_loading_warning_block\";s:73:\"WARNING: Async Loading is NOT possible within Localized Fields and Blocks\";s:29:\"activate_column_configuration\";s:29:\"Activate Column Configuration\";s:26:\"table_column_configuration\";s:20:\"Column Configuration\";s:20:\"send_invitation_link\";s:20:\"Send Invitation Link\";s:15:\"invitation_sent\";s:21:\"Login Invitation sent\";s:20:\"invitation_link_sent\";s:60:\"A temporary login link has been sent to email address: \"%s\" \";s:32:\"classificationstore_group_by_key\";s:12:\"Group by key\";s:26:\"allow_to_create_new_object\";s:46:\"Allow to create a new object in relation field\";s:1:\":\";s:0:\"\";s:12:\"Advertisment\";s:0:\"\";s:11:\"Afghanistan\";s:0:\"\";s:7:\"Albania\";s:0:\"\";s:7:\"Algeria\";s:0:\"\";s:14:\"American Samoa\";s:0:\"\";s:14:\"Anarkali Suite\";s:0:\"\";s:7:\"Andorra\";s:0:\"\";s:6:\"Angola\";s:0:\"\";s:8:\"Anguilla\";s:0:\"\";s:10:\"Antarctica\";s:0:\"\";s:17:\"Antigua & Barbuda\";s:0:\"\";s:9:\"Argentina\";s:0:\"\";s:7:\"Armenia\";s:0:\"\";s:5:\"Aruba\";s:0:\"\";s:9:\"Australia\";s:0:\"\";s:7:\"Austria\";s:0:\"\";s:10:\"Azerbaijan\";s:0:\"\";s:7:\"Bahamas\";s:0:\"\";s:7:\"Bahrain\";s:0:\"\";s:6:\"Bangla\";s:0:\"\";s:10:\"Bangladesh\";s:0:\"\";s:8:\"Barbados\";s:0:\"\";s:7:\"Belarus\";s:0:\"\";s:7:\"Belgium\";s:0:\"\";s:6:\"Belize\";s:0:\"\";s:5:\"Benin\";s:0:\"\";s:7:\"Bermuda\";s:0:\"\";s:6:\"Bhutan\";s:0:\"\";s:11:\"Bleach Wash\";s:0:\"\";s:9:\"Boat Neck\";s:0:\"\";s:7:\"Bolivia\";s:0:\"\";s:20:\"Bosnia & Herzegovina\";s:0:\"\";s:8:\"Botswana\";s:0:\"\";s:13:\"Bouvet Island\";s:0:\"\";s:5:\"Brand\";s:0:\"\";s:10:\"Brand Logo\";s:0:\"\";s:6:\"Brazil\";s:0:\"\";s:30:\"British Indian Ocean Territory\";s:0:\"\";s:22:\"British Virgin Islands\";s:0:\"\";s:6:\"Brunei\";s:0:\"\";s:8:\"Bulgaria\";s:0:\"\";s:12:\"Burkina Faso\";s:0:\"\";s:7:\"Burundi\";s:0:\"\";s:8:\"Cambodia\";s:0:\"\";s:8:\"Cameroon\";s:0:\"\";s:6:\"Canada\";s:0:\"\";s:10:\"Cape Verde\";s:0:\"\";s:21:\"Caribbean Netherlands\";s:0:\"\";s:12:\"Caustic Wash\";s:0:\"\";s:14:\"Cayman Islands\";s:0:\"\";s:24:\"Central African Republic\";s:0:\"\";s:4:\"Chad\";s:0:\"\";s:6:\"Checks\";s:0:\"\";s:5:\"Chile\";s:0:\"\";s:5:\"China\";s:0:\"\";s:16:\"Christmas Island\";s:0:\"\";s:14:\"Classification\";s:0:\"\";s:23:\"Cocos (Keeling) Islands\";s:0:\"\";s:8:\"Colombia\";s:0:\"\";s:5:\"Color\";s:0:\"\";s:7:\"Comoros\";s:0:\"\";s:19:\"Congo - Brazzaville\";s:0:\"\";s:16:\"Congo - Kinshasa\";s:0:\"\";s:12:\"Cook Islands\";s:0:\"\";s:10:\"Costa Rica\";s:0:\"\";s:7:\"Croatia\";s:0:\"\";s:4:\"Cuba\";s:0:\"\";s:8:\"Curaçao\";s:0:\"\";s:6:\"Cyprus\";s:0:\"\";s:7:\"Czechia\";s:0:\"\";s:16:\"Côte d’Ivoire\";s:0:\"\";s:9:\"Deep Neck\";s:0:\"\";s:7:\"Denmark\";s:0:\"\";s:11:\"Description\";s:0:\"\";s:6:\"Detail\";s:0:\"\";s:8:\"Discount\";s:0:\"\";s:8:\"Djibouti\";s:0:\"\";s:8:\"Dominica\";s:0:\"\";s:18:\"Dominican Republic\";s:0:\"\";s:9:\"Dry Clean\";s:0:\"\";s:7:\"Ecuador\";s:0:\"\";s:5:\"Egypt\";s:0:\"\";s:11:\"El Salvador\";s:0:\"\";s:7:\"English\";s:0:\"\";s:17:\"Equatorial Guinea\";s:0:\"\";s:7:\"Eritrea\";s:0:\"\";s:7:\"Estonia\";s:0:\"\";s:8:\"Eswatini\";s:0:\"\";s:8:\"Ethiopia\";s:0:\"\";s:6:\"Fabric\";s:0:\"\";s:11:\"Fabric Used\";s:0:\"\";s:16:\"Falkland Islands\";s:0:\"\";s:13:\"Faroe Islands\";s:0:\"\";s:4:\"Fiji\";s:0:\"\";s:7:\"Finland\";s:0:\"\";s:6:\"France\";s:0:\"\";s:13:\"French Guiana\";s:0:\"\";s:16:\"French Polynesia\";s:0:\"\";s:27:\"French Southern Territories\";s:0:\"\";s:11:\"Full Sleeve\";s:0:\"\";s:5:\"Gabon\";s:0:\"\";s:6:\"Gambia\";s:0:\"\";s:7:\"Georgia\";s:0:\"\";s:7:\"Germany\";s:0:\"\";s:5:\"Ghana\";s:0:\"\";s:9:\"Gibraltar\";s:0:\"\";s:6:\"Greece\";s:0:\"\";s:9:\"Greenland\";s:0:\"\";s:7:\"Grenada\";s:0:\"\";s:10:\"Guadeloupe\";s:0:\"\";s:4:\"Guam\";s:0:\"\";s:9:\"Guatemala\";s:0:\"\";s:8:\"Guernsey\";s:0:\"\";s:6:\"Guinea\";s:0:\"\";s:13:\"Guinea-Bissau\";s:0:\"\";s:6:\"Guyana\";s:0:\"\";s:5:\"Haiti\";s:0:\"\";s:24:\"Heard & McDonald Islands\";s:0:\"\";s:8:\"Honduras\";s:0:\"\";s:19:\"Hong Kong SAR China\";s:0:\"\";s:7:\"Hungary\";s:0:\"\";s:7:\"Iceland\";s:0:\"\";s:5:\"Image\";s:0:\"\";s:5:\"India\";s:0:\"\";s:9:\"Indonesia\";s:0:\"\";s:4:\"Iran\";s:0:\"\";s:4:\"Iraq\";s:0:\"\";s:7:\"Ireland\";s:0:\"\";s:11:\"Isle of Man\";s:0:\"\";s:6:\"Israel\";s:0:\"\";s:5:\"Italy\";s:0:\"\";s:7:\"Jamaica\";s:0:\"\";s:5:\"Japan\";s:0:\"\";s:6:\"Jersey\";s:0:\"\";s:6:\"Jordan\";s:0:\"\";s:10:\"Kazakhstan\";s:0:\"\";s:5:\"Kenya\";s:0:\"\";s:8:\"Kiribati\";s:0:\"\";s:6:\"Kuwait\";s:0:\"\";s:10:\"Kyrgyzstan\";s:0:\"\";s:1:\"L\";s:0:\"\";s:14:\"Lantern Sleeve\";s:0:\"\";s:4:\"Laos\";s:0:\"\";s:6:\"Latvia\";s:0:\"\";s:7:\"Lebanon\";s:0:\"\";s:7:\"Lesotho\";s:0:\"\";s:7:\"Liberia\";s:0:\"\";s:5:\"Libya\";s:0:\"\";s:13:\"Liechtenstein\";s:0:\"\";s:9:\"Lithuania\";s:0:\"\";s:10:\"Luxembourg\";s:0:\"\";s:1:\"M\";s:0:\"\";s:15:\"Macao SAR China\";s:0:\"\";s:10:\"Madagascar\";s:0:\"\";s:7:\"Made In\";s:0:\"\";s:6:\"Malawi\";s:0:\"\";s:8:\"Malaysia\";s:0:\"\";s:8:\"Maldives\";s:0:\"\";s:4:\"Mali\";s:0:\"\";s:5:\"Malta\";s:0:\"\";s:16:\"Marshall Islands\";s:0:\"\";s:10:\"Martinique\";s:0:\"\";s:6:\"Master\";s:0:\"\";s:19:\"Master (Admin Mode)\";s:0:\"\";s:10:\"Mauritania\";s:0:\"\";s:9:\"Mauritius\";s:0:\"\";s:7:\"Mayotte\";s:0:\"\";s:6:\"Mexico\";s:0:\"\";s:10:\"Micronesia\";s:0:\"\";s:7:\"Moldova\";s:0:\"\";s:6:\"Monaco\";s:0:\"\";s:8:\"Mongolia\";s:0:\"\";s:10:\"Montenegro\";s:0:\"\";s:10:\"Montserrat\";s:0:\"\";s:7:\"Morocco\";s:0:\"\";s:10:\"Mozambique\";s:0:\"\";s:15:\"Myanmar (Burma)\";s:0:\"\";s:4:\"Name\";s:0:\"\";s:7:\"Namibia\";s:0:\"\";s:5:\"Nauru\";s:0:\"\";s:5:\"Nepal\";s:0:\"\";s:11:\"Netherlands\";s:0:\"\";s:13:\"New Caledonia\";s:0:\"\";s:11:\"New Zealand\";s:0:\"\";s:9:\"Nicaragua\";s:0:\"\";s:5:\"Niger\";s:0:\"\";s:7:\"Nigeria\";s:0:\"\";s:4:\"Niue\";s:0:\"\";s:14:\"Norfolk Island\";s:0:\"\";s:11:\"Normal Wash\";s:0:\"\";s:11:\"North Korea\";s:0:\"\";s:15:\"North Macedonia\";s:0:\"\";s:24:\"Northern Mariana Islands\";s:0:\"\";s:6:\"Norway\";s:0:\"\";s:4:\"Oman\";s:0:\"\";s:12:\"Other Fields\";s:0:\"\";s:8:\"Pakistan\";s:0:\"\";s:5:\"Palau\";s:0:\"\";s:23:\"Palestinian Territories\";s:0:\"\";s:6:\"Panama\";s:0:\"\";s:16:\"Papua New Guinea\";s:0:\"\";s:8:\"Paraguay\";s:0:\"\";s:4:\"Peru\";s:0:\"\";s:11:\"Philippines\";s:0:\"\";s:16:\"Pitcairn Islands\";s:0:\"\";s:12:\"Plazzo Suite\";s:0:\"\";s:6:\"Poland\";s:0:\"\";s:8:\"Portugal\";s:0:\"\";s:5:\"Price\";s:0:\"\";s:7:\"Printed\";s:0:\"\";s:11:\"Puerto Rico\";s:0:\"\";s:5:\"Qatar\";s:0:\"\";s:10:\"Returnable\";s:0:\"\";s:7:\"Romania\";s:0:\"\";s:10:\"Round Neck\";s:0:\"\";s:6:\"Russia\";s:0:\"\";s:6:\"Rwanda\";s:0:\"\";s:8:\"Réunion\";s:0:\"\";s:1:\"S\";s:0:\"\";s:3:\"SKU\";s:0:\"\";s:5:\"Samoa\";s:0:\"\";s:10:\"San Marino\";s:0:\"\";s:12:\"Saudi Arabia\";s:0:\"\";s:7:\"Senegal\";s:0:\"\";s:6:\"Serbia\";s:0:\"\";s:10:\"Seychelles\";s:0:\"\";s:12:\"Sierra Leone\";s:0:\"\";s:9:\"Singapore\";s:0:\"\";s:12:\"Sint Maarten\";s:0:\"\";s:4:\"Size\";s:0:\"\";s:10:\"Sleeveless\";s:0:\"\";s:8:\"Slovakia\";s:0:\"\";s:8:\"Slovenia\";s:0:\"\";s:5:\"Solid\";s:0:\"\";s:15:\"Solomon Islands\";s:0:\"\";s:7:\"Somalia\";s:0:\"\";s:12:\"South Africa\";s:0:\"\";s:38:\"South Georgia & South Sandwich Islands\";s:0:\"\";s:11:\"South Korea\";s:0:\"\";s:11:\"South Sudan\";s:0:\"\";s:5:\"Spain\";s:0:\"\";s:9:\"Sri Lanka\";s:0:\"\";s:15:\"St. Barthélemy\";s:0:\"\";s:10:\"St. Helena\";s:0:\"\";s:17:\"St. Kitts & Nevis\";s:0:\"\";s:9:\"St. Lucia\";s:0:\"\";s:10:\"St. Martin\";s:0:\"\";s:21:\"St. Pierre & Miquelon\";s:0:\"\";s:24:\"St. Vincent & Grenadines\";s:0:\"\";s:7:\"Stripes\";s:0:\"\";s:5:\"Sudan\";s:0:\"\";s:8:\"Suriname\";s:0:\"\";s:20:\"Svalbard & Jan Mayen\";s:0:\"\";s:6:\"Sweden\";s:0:\"\";s:11:\"Switzerland\";s:0:\"\";s:5:\"Syria\";s:0:\"\";s:22:\"São Tomé & Príncipe\";s:0:\"\";s:6:\"Taiwan\";s:0:\"\";s:10:\"Tajikistan\";s:0:\"\";s:8:\"Tanzania\";s:0:\"\";s:8:\"Thailand\";s:0:\"\";s:11:\"Timor-Leste\";s:0:\"\";s:4:\"Togo\";s:0:\"\";s:7:\"Tokelau\";s:0:\"\";s:5:\"Tonga\";s:0:\"\";s:17:\"Trinidad & Tobago\";s:0:\"\";s:7:\"Tunisia\";s:0:\"\";s:6:\"Turkey\";s:0:\"\";s:12:\"Turkmenistan\";s:0:\"\";s:22:\"Turks & Caicos Islands\";s:0:\"\";s:6:\"Tuvalu\";s:0:\"\";s:21:\"U.S. Outlying Islands\";s:0:\"\";s:19:\"U.S. Virgin Islands\";s:0:\"\";s:6:\"Uganda\";s:0:\"\";s:7:\"Ukraine\";s:0:\"\";s:20:\"United Arab Emirates\";s:0:\"\";s:14:\"United Kingdom\";s:0:\"\";s:13:\"United States\";s:0:\"\";s:7:\"Uruguay\";s:0:\"\";s:10:\"Uzbekistan\";s:0:\"\";s:6:\"V Neck\";s:0:\"\";s:7:\"Vanuatu\";s:0:\"\";s:12:\"Vatican City\";s:0:\"\";s:9:\"Venezuela\";s:0:\"\";s:7:\"Vietnam\";s:0:\"\";s:15:\"Wallis & Futuna\";s:0:\"\";s:8:\"Washable\";s:0:\"\";s:14:\"Western Sahara\";s:0:\"\";s:5:\"Yemen\";s:0:\"\";s:6:\"Zambia\";s:0:\"\";s:8:\"Zimbabwe\";s:0:\"\";s:6:\"bottom\";s:0:\"\";s:5:\"brand\";s:0:\"\";s:21:\"default_value_warning\";s:0:\"\";s:4:\"down\";s:0:\"\";s:6:\"fabric\";s:0:\"\";s:5:\"false\";s:0:\"\";s:5:\"jeans\";s:0:\"\";s:5:\"month\";s:0:\"\";s:4:\"neck\";s:0:\"\";s:4:\"null\";s:0:\"\";s:35:\"object_add_dialog_custom_text.brand\";s:0:\"\";s:38:\"object_add_dialog_custom_text.category\";s:0:\"\";s:36:\"object_add_dialog_custom_text.fabric\";s:0:\"\";s:37:\"object_add_dialog_custom_text.product\";s:0:\"\";s:36:\"object_add_dialog_custom_title.brand\";s:0:\"\";s:39:\"object_add_dialog_custom_title.category\";s:0:\"\";s:37:\"object_add_dialog_custom_title.fabric\";s:0:\"\";s:38:\"object_add_dialog_custom_title.product\";s:0:\"\";s:5:\"shirt\";s:0:\"\";s:7:\"sleeves\";s:0:\"\";s:5:\"suite\";s:0:\"\";s:3:\"top\";s:0:\"\";s:4:\"true\";s:0:\"\";s:5:\"types\";s:0:\"\";s:2:\"up\";s:0:\"\";s:8:\"warranty\";s:0:\"\";s:5:\"years\";s:0:\"\";s:14:\"Åland Islands\";s:0:\"\";s:27:\"gdpr_dataSource_dataObjects\";s:12:\"Data Objects\";s:38:\"keybinding_searchAndReplaceAssignments\";s:28:\"Search & Replace Assignments\";s:9:\"parent_id\";s:9:\"Parent ID\";s:16:\"modificationDate\";s:17:\"Modification Date\";s:12:\"creationDate\";s:13:\"Creation Date\";s:29:\"keybinding_sharedTranslations\";s:19:\"Shared Translations\";s:25:\"classificationstore_group\";s:5:\"Group\";s:33:\"classificationstore_tag_col_group\";s:5:\"Group\";s:40:\"classificationstore_col_groupdescription\";s:5:\"Group\";s:24:\"keybinding_customReports\";s:14:\"Custom Reports\";s:4:\"none\";s:4:\"None\";s:19:\"redirects_type_path\";s:4:\"Path\";s:17:\"keybinding_robots\";s:10:\"robots.txt\";s:14:\"web2print_port\";s:4:\"Port\";s:13:\"email_subject\";s:7:\"Subject\";s:24:\"gdpr_dataSource_sentMail\";s:11:\"Sent Emails\";s:17:\"email_log_subject\";s:7:\"Subject\";s:31:\"gdpr_data_extractor_label_email\";s:13:\"Email Address\";s:20:\"web2print_colorspace\";s:10:\"Colorspace\";s:7:\"numeric\";s:6:\"Number\";s:17:\"newsletter_report\";s:13:\"Custom Report\";s:27:\"structuredtable_type_number\";s:6:\"Number\";s:27:\"objectsMetadata_type_number\";s:6:\"Number\";s:30:\"overwrite_object_with_same_key\";s:9:\"Overwrite\";s:23:\"keybinding_openDocument\";s:13:\"Open Document\";s:20:\"keybinding_openAsset\";s:10:\"Open Asset\";s:21:\"keybinding_openObject\";s:11:\"Open Object\";s:12:\"save_success\";s:19:\"Saved successfully!\";s:32:\"file_explorer_saved_file_success\";s:19:\"Saved successfully!\";s:14:\"workflow_notes\";s:5:\"Notes\";s:21:\"keybinding_openInTree\";s:12:\"Show in Tree\";s:8:\"2fa_code\";s:4:\"Code\";s:14:\"web2print_tags\";s:4:\"Tags\";s:15:\"web2print_links\";s:5:\"Links\";s:28:\"keybinding_seoDocumentEditor\";s:19:\"SEO Document Editor\";s:16:\"clear_temp_files\";s:21:\"Clear temporary files\";s:18:\"keybinding_reports\";s:7:\"Reports\";s:16:\"keybinding_roles\";s:5:\"Roles\";s:8:\"username\";s:8:\"Username\";s:8:\"password\";s:8:\"Password\";s:6:\"submit\";s:6:\"Submit\";s:13:\"cache_enabled\";s:6:\"Enable\";s:16:\"localized_fields\";s:16:\"Localized Fields\";s:17:\"field_collections\";s:17:\"Field-Collections\";s:9:\"col_label\";s:5:\"Label\";s:17:\"piwik_widget_site\";s:4:\"Site\";s:21:\"keybinding_recycleBin\";s:11:\"Recycle Bin\";s:14:\"email_log_data\";s:4:\"Data\";s:13:\"show_metainfo\";s:4:\"Info\";s:15:\"keybinding_save\";s:4:\"Save\";s:18:\"keybinding_publish\";s:7:\"Publish\";s:17:\"keybinding_rename\";s:6:\"Rename\";s:14:\"email_log_from\";s:4:\"From\";s:10:\"email_from\";s:4:\"From\";s:15:\"log_search_from\";s:4:\"From\";s:12:\"email_log_to\";s:2:\"To\";s:8:\"email_to\";s:2:\"To\";s:13:\"log_search_to\";s:2:\"To\";s:14:\"email_log_text\";s:4:\"Text\";s:25:\"structuredtable_type_text\";s:4:\"Text\";s:25:\"objectsMetadata_type_text\";s:4:\"Text\";s:18:\"pimcore_lable_text\";s:4:\"Text\";s:35:\"classificationstore_tag_col_keyName\";s:3:\"Key\";s:28:\"gdpr_data_extractor_label_id\";s:2:\"ID\";s:15:\"web2print_title\";s:5:\"Title\";s:12:\"config_title\";s:5:\"Title\";s:20:\"keybinding_unpublish\";s:9:\"Unpublish\";s:17:\"navigation_target\";s:6:\"Target\";s:8:\"log_type\";s:4:\"Type\";s:22:\"gdpr_dataSource_export\";s:6:\"Export\";s:19:\"keybinding_glossary\";s:8:\"Glossary\";s:16:\"keybinding_users\";s:5:\"Users\";s:33:\"classificationstore_configuration\";s:13:\"Configuration\";s:33:\"classificationstore_tag_col_value\";s:5:\"Value\";s:22:\"gdpr_dataSource_assets\";s:6:\"Assets\";s:25:\"structuredtable_type_bool\";s:8:\"Checkbox\";s:27:\"objectsMetadata_type_select\";s:6:\"Select\";s:7:\"boolean\";s:4:\"Bool\";s:25:\"objectsMetadata_type_bool\";s:4:\"Bool\";s:18:\"keybinding_refresh\";s:6:\"Reload\";s:17:\"web2print_version\";s:7:\"Version\";s:35:\"gdpr_data_extractor_label_firstname\";s:9:\"Firstname\";s:34:\"gdpr_data_extractor_label_lastname\";s:8:\"Lastname\";s:20:\"keybinding_redirects\";s:9:\"Redirects\";s:10:\"log_source\";s:6:\"Source\";s:40:\"classificationstore_error_addgroup_title\";s:5:\"Error\";s:38:\"classificationstore_error_addkey_title\";s:5:\"Error\";s:20:\"element_lock_message\";s:58:\"The desired element is currently opened by another person:\";s:16:\"web2print_apiKey\";s:7:\"API Key\";s:12:\"customlayout\";s:13:\"Custom Layout\";s:24:\"special_settings_tooltip\";s:16:\"Special Settings\";s:19:\"application_logging\";s:18:\"Application Logger\";s:28:\"keybinding_applicationLogger\";s:18:\"Application Logger\";s:20:\"log_search_component\";s:9:\"Component\";s:11:\"log_message\";s:7:\"Message\";s:31:\"classificationstore_menu_config\";s:20:\"Classification Store\";s:19:\"classificationstore\";s:20:\"Classification Store\";s:39:\"classificationstore_mbx_enterkey_prompt\";s:10:\"Enter name\";s:43:\"classificationstore_error_addcollection_msg\";s:18:\"Error adding group\";s:13:\"quantityValue\";s:14:\"Quantity Value\";s:18:\"inputQuantityValue\";s:20:\"Input Quantity Value\";s:15:\"calculatedValue\";s:16:\"Calculated Value\";s:27:\"keybinding_tagConfiguration\";s:17:\"Tag Configuration\";s:14:\"log_search_pid\";s:3:\"PID\";s:20:\"clear_fullpage_cache\";s:15:\"Full Page Cache\";s:13:\"piwik_site_id\";s:7:\"Site ID\";s:27:\"substring_operator_settings\";s:8:\"Settings\";s:27:\"operator_substring_settings\";s:8:\"Settings\";s:28:\"delete_importconfig_dblcheck\";s:39:\"Do you really want to delete this item?\";s:26:\"delete_gridconfig_dblcheck\";s:39:\"Do you really want to delete this item?\";s:17:\"piwik_widget_date\";s:8:\"End date\";s:19:\"log_refresh_seconds\";s:7:\"Seconds\";s:12:\"email_log_cc\";s:2:\"Cc\";s:13:\"email_log_bcc\";s:3:\"Bcc\";s:23:\"keybinding_closeAllTabs\";s:14:\"Close all tabs\";s:10:\"log_search\";s:6:\"Search\";s:4:\"cols\";s:7:\"Columns\";s:16:\"log_reset_search\";s:5:\"Reset\";s:29:\"keybinding_showElementHistory\";s:24:\"Recently Opened Elements\";s:22:\"keybinding_quickSearch\";s:12:\"Quick Search\";s:23:\"keybinding_httpErrorLog\";s:11:\"HTTP Errors\";s:21:\"keybinding_tagManager\";s:24:\"Tag & Snippet Management\";s:22:\"keybinding_notesEvents\";s:18:\"Notes &amp; Events\";s:22:\"keybinding_searchAsset\";s:13:\"Search Assets\";s:25:\"keybinding_searchDocument\";s:16:\"Search Documents\";s:23:\"keybinding_searchObject\";s:14:\"Search Objects\";s:6:\"routes\";s:13:\"Static Routes\";s:7:\"plugins\";s:10:\"Extensions\";s:18:\"log_search_message\";s:7:\"Message\";s:9:\"rgbaColor\";s:5:\"Color\";s:9:\"multihref\";s:21:\"Many-To-Many Relation\";s:17:\"multihrefMetadata\";s:30:\"Advanced Many-To-Many Relation\";s:15:\"objectsMetadata\";s:37:\"Advanced Many-To-Many Object Relation\";s:15:\"nonownerobjects\";s:36:\"Reverse Many-To-Many Object Relation\";s:4:\"href\";s:20:\"Many-To-One Relation\";}}s:56:\"\0Symfony\\Component\\Translation\\MessageCatalogue\0metadata\";a:0:{}s:57:\"\0Symfony\\Component\\Translation\\MessageCatalogue\0resources\";a:0:{}s:54:\"\0Symfony\\Component\\Translation\\MessageCatalogue\0locale\";s:2:\"en\";s:65:\"\0Symfony\\Component\\Translation\\MessageCatalogue\0fallbackCatalogue\";N;s:54:\"\0Symfony\\Component\\Translation\\MessageCatalogue\0parent\";N;}\";',1614107892,1616527092);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_tags`
--

DROP TABLE IF EXISTS `cache_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_tags` (
  `id` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `tag` varchar(165) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`tag`),
  KEY `tag` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=ascii;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_tags`
--

LOCK TABLES `cache_tags` WRITE;
/*!40000 ALTER TABLE `cache_tags` DISABLE KEYS */;
INSERT INTO `cache_tags` VALUES ('asset_1','asset_1'),('asset_2','asset_2'),('asset_3','asset_3'),('object_5','asset_3'),('asset_4','asset_4'),('asset_5','asset_5'),('object_10','asset_5'),('asset_6','asset_6'),('object_11','class_1'),('object_4','class_1'),('object_10','class_2'),('object_5','class_2'),('object_7','class_3'),('document_1','document_1'),('document_properties_1','document_1'),('document_properties_1','document_properties'),('object_1','object_1'),('object_10','object_10'),('object_11','object_11'),('object_2','object_2'),('object_3','object_3'),('object_4','object_4'),('object_5','object_5'),('object_6','object_6'),('object_7','object_7'),('object_8','object_8'),('system_route_redirect','redirect'),('system_resource_columns_edit_lock','resource'),('system_route_redirect','route'),('site_domain_499060da37cf08189e7cfe06256714c8','site'),('site_domain_499060da37cf08189e7cfe06256714c8','system'),('system_resource_columns_edit_lock','system'),('system_route_redirect','system'),('system_supported_locales_en','system'),('translation_data_admin_en','translate'),('translation_data_admin_en','translator'),('translation_data_admin_en','translator_website');
/*!40000 ALTER TABLE `cache_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` varchar(50) NOT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES ('2','brand'),('1','category'),('3','fabric'),('4','product');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collectionrelations`
--

DROP TABLE IF EXISTS `classificationstore_collectionrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collectionrelations` (
  `colId` int unsigned NOT NULL,
  `groupId` int unsigned NOT NULL,
  `sorter` int DEFAULT '0',
  PRIMARY KEY (`colId`,`groupId`),
  KEY `FK_classificationstore_collectionrelations_groups` (`groupId`),
  CONSTRAINT `FK_classificationstore_collectionrelations_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collectionrelations`
--

LOCK TABLES `classificationstore_collectionrelations` WRITE;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collectionrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_collections`
--

DROP TABLE IF EXISTS `classificationstore_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_collections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_collections`
--

LOCK TABLES `classificationstore_collections` WRITE;
/*!40000 ALTER TABLE `classificationstore_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_groups`
--

DROP TABLE IF EXISTS `classificationstore_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `parentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(190) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `storeId` (`storeId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_groups`
--

LOCK TABLES `classificationstore_groups` WRITE;
/*!40000 ALTER TABLE `classificationstore_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_keys`
--

DROP TABLE IF EXISTS `classificationstore_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_keys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `storeId` int DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `type` varchar(190) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `definition` longtext,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `enabled` (`enabled`),
  KEY `type` (`type`),
  KEY `storeId` (`storeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_keys`
--

LOCK TABLES `classificationstore_keys` WRITE;
/*!40000 ALTER TABLE `classificationstore_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_relations`
--

DROP TABLE IF EXISTS `classificationstore_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_relations` (
  `groupId` int unsigned NOT NULL,
  `keyId` int unsigned NOT NULL,
  `sorter` int DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`groupId`,`keyId`),
  KEY `FK_classificationstore_relations_classificationstore_keys` (`keyId`),
  KEY `mandatory` (`mandatory`),
  CONSTRAINT `FK_classificationstore_relations_classificationstore_groups` FOREIGN KEY (`groupId`) REFERENCES `classificationstore_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_classificationstore_relations_classificationstore_keys` FOREIGN KEY (`keyId`) REFERENCES `classificationstore_keys` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_relations`
--

LOCK TABLES `classificationstore_relations` WRITE;
/*!40000 ALTER TABLE `classificationstore_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classificationstore_stores`
--

DROP TABLE IF EXISTS `classificationstore_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificationstore_stores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classificationstore_stores`
--

LOCK TABLES `classificationstore_stores` WRITE;
/*!40000 ALTER TABLE `classificationstore_stores` DISABLE KEYS */;
/*!40000 ALTER TABLE `classificationstore_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_layouts`
--

DROP TABLE IF EXISTS `custom_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_layouts` (
  `id` varchar(64) NOT NULL,
  `classId` varchar(50) NOT NULL,
  `name` varchar(190) DEFAULT NULL,
  `description` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_layouts`
--

LOCK TABLES `custom_layouts` WRITE;
/*!40000 ALTER TABLE `custom_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sourcetype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `sourceid` int unsigned NOT NULL DEFAULT '0',
  `targettype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `targetid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `combi` (`sourcetype`,`sourceid`,`targettype`,`targetid`),
  KEY `targettype_targetid` (`targettype`,`targetid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES (1,'object',5,'asset',3),(6,'object',9,'asset',6),(3,'object',9,'object',7),(4,'object',9,'object',10),(5,'object',9,'object',11),(2,'object',10,'asset',5);
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('page','link','snippet','folder','hardlink','email','newsletter','printpage','printcontainer') DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `index` int unsigned DEFAULT '0',
  `published` tinyint unsigned DEFAULT '1',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `fullpath` (`path`,`key`),
  KEY `parentId` (`parentId`),
  KEY `key` (`key`),
  KEY `published` (`published`),
  KEY `modificationDate` (`modificationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,0,'page','','/',999999,1,1613976326,1613976326,1,1,0);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_elements`
--

DROP TABLE IF EXISTS `documents_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_elements` (
  `documentId` int unsigned NOT NULL DEFAULT '0',
  `name` varchar(750) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `type` varchar(50) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`documentId`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_elements`
--

LOCK TABLES `documents_elements` WRITE;
/*!40000 ALTER TABLE `documents_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_email`
--

DROP TABLE IF EXISTS `documents_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_email` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_email`
--

LOCK TABLES `documents_email` WRITE;
/*!40000 ALTER TABLE `documents_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_hardlink`
--

DROP TABLE IF EXISTS `documents_hardlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_hardlink` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int DEFAULT NULL,
  `propertiesFromSource` tinyint(1) DEFAULT NULL,
  `childrenFromSource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sourceId` (`sourceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_hardlink`
--

LOCK TABLES `documents_hardlink` WRITE;
/*!40000 ALTER TABLE `documents_hardlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_hardlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_link`
--

DROP TABLE IF EXISTS `documents_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_link` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `internalType` enum('document','asset','object') DEFAULT NULL,
  `internal` int unsigned DEFAULT NULL,
  `direct` varchar(1000) DEFAULT NULL,
  `linktype` enum('direct','internal') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_link`
--

LOCK TABLES `documents_link` WRITE;
/*!40000 ALTER TABLE `documents_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_newsletter`
--

DROP TABLE IF EXISTS `documents_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_newsletter` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `trackingParameterSource` varchar(255) DEFAULT NULL,
  `trackingParameterMedium` varchar(255) DEFAULT NULL,
  `trackingParameterName` varchar(255) DEFAULT NULL,
  `enableTrackingParameters` tinyint unsigned DEFAULT NULL,
  `sendingMode` varchar(20) DEFAULT NULL,
  `plaintext` longtext,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_newsletter`
--

LOCK TABLES `documents_newsletter` WRITE;
/*!40000 ALTER TABLE `documents_newsletter` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_page`
--

DROP TABLE IF EXISTS `documents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_page` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(383) DEFAULT NULL,
  `metaData` text,
  `prettyUrl` varchar(190) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `targetGroupIds` varchar(255) DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prettyUrl` (`prettyUrl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_page`
--

LOCK TABLES `documents_page` WRITE;
/*!40000 ALTER TABLE `documents_page` DISABLE KEYS */;
INSERT INTO `documents_page` VALUES (1,NULL,'default','default','','','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `documents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_printpage`
--

DROP TABLE IF EXISTS `documents_printpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_printpage` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `lastGenerated` int DEFAULT NULL,
  `lastGenerateMessage` text,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_printpage`
--

LOCK TABLES `documents_printpage` WRITE;
/*!40000 ALTER TABLE `documents_printpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_printpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_snippet`
--

DROP TABLE IF EXISTS `documents_snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_snippet` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `module` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `contentMasterDocumentId` int DEFAULT NULL,
  `missingRequiredEditable` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_snippet`
--

LOCK TABLES `documents_snippet` WRITE;
/*!40000 ALTER TABLE `documents_snippet` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_translations`
--

DROP TABLE IF EXISTS `documents_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents_translations` (
  `id` int unsigned NOT NULL DEFAULT '0',
  `sourceId` int unsigned NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`sourceId`,`language`),
  KEY `id` (`id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_translations`
--

LOCK TABLES `documents_translations` WRITE;
/*!40000 ALTER TABLE `documents_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edit_lock`
--

DROP TABLE IF EXISTS `edit_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edit_lock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned NOT NULL DEFAULT '0',
  `sessionId` varchar(255) DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctype` (`ctype`),
  KEY `cidtype` (`cid`,`ctype`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (3,7,'object',2,'fullmtgb226kvphb3jdijg6qd8',1614088764),(11,5,'object',2,'g21oqidt3v7efmi5c843i4c5v0',1614107665),(12,4,'object',2,'g21oqidt3v7efmi5c843i4c5v0',1614107665),(13,11,'object',2,'g21oqidt3v7efmi5c843i4c5v0',1614107666),(15,10,'object',2,'g21oqidt3v7efmi5c843i4c5v0',1614107666),(16,9,'object',2,'g21oqidt3v7efmi5c843i4c5v0',1614107723);
/*!40000 ALTER TABLE `edit_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element_workflow_state`
--

DROP TABLE IF EXISTS `element_workflow_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `element_workflow_state` (
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  `place` text,
  `workflow` varchar(100) NOT NULL,
  PRIMARY KEY (`cid`,`ctype`,`workflow`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element_workflow_state`
--

LOCK TABLES `element_workflow_state` WRITE;
/*!40000 ALTER TABLE `element_workflow_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `element_workflow_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_blacklist`
--

DROP TABLE IF EXISTS `email_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_blacklist` (
  `address` varchar(190) NOT NULL DEFAULT '',
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_blacklist`
--

LOCK TABLES `email_blacklist` WRITE;
/*!40000 ALTER TABLE `email_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_log`
--

DROP TABLE IF EXISTS `email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `documentId` int DEFAULT NULL,
  `requestUri` varchar(500) DEFAULT NULL,
  `params` text,
  `from` varchar(500) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `to` longtext,
  `cc` longtext,
  `bcc` longtext,
  `sentDate` int unsigned DEFAULT NULL,
  `subject` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sentDate` (`sentDate`,`id`),
  FULLTEXT KEY `fulltext` (`from`,`to`,`cc`,`bcc`,`subject`,`params`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_log`
--

LOCK TABLES `email_log` WRITE;
/*!40000 ALTER TABLE `email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glossary`
--

DROP TABLE IF EXISTS `glossary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glossary` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(10) DEFAULT NULL,
  `casesensitive` tinyint(1) DEFAULT NULL,
  `exactmatch` tinyint(1) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `site` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `language` (`language`),
  KEY `site` (`site`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glossary`
--

LOCK TABLES `glossary` WRITE;
/*!40000 ALTER TABLE `glossary` DISABLE KEYS */;
/*!40000 ALTER TABLE `glossary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_favourites`
--

DROP TABLE IF EXISTS `gridconfig_favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_favourites` (
  `ownerId` int NOT NULL,
  `classId` varchar(50) NOT NULL,
  `objectId` int NOT NULL DEFAULT '0',
  `gridConfigId` int DEFAULT NULL,
  `searchType` varchar(50) NOT NULL DEFAULT '',
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  PRIMARY KEY (`ownerId`,`classId`,`searchType`,`objectId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_favourites`
--

LOCK TABLES `gridconfig_favourites` WRITE;
/*!40000 ALTER TABLE `gridconfig_favourites` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfig_shares`
--

DROP TABLE IF EXISTS `gridconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfig_shares` (
  `gridConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`gridConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfig_shares`
--

LOCK TABLES `gridconfig_shares` WRITE;
/*!40000 ALTER TABLE `gridconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gridconfigs`
--

DROP TABLE IF EXISTS `gridconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gridconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `searchType` varchar(50) DEFAULT NULL,
  `type` enum('asset','object') NOT NULL DEFAULT 'object',
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `searchType` (`searchType`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gridconfigs`
--

LOCK TABLES `gridconfigs` WRITE;
/*!40000 ALTER TABLE `gridconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `gridconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `http_error_log`
--

DROP TABLE IF EXISTS `http_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `http_error_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `code` int DEFAULT NULL,
  `parametersGet` longtext,
  `parametersPost` longtext,
  `cookies` longtext,
  `serverVars` longtext,
  `date` int unsigned DEFAULT NULL,
  `count` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uri` (`uri`),
  KEY `code` (`code`),
  KEY `date` (`date`),
  KEY `count` (`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `http_error_log`
--

LOCK TABLES `http_error_log` WRITE;
/*!40000 ALTER TABLE `http_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `http_error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfig_shares`
--

DROP TABLE IF EXISTS `importconfig_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfig_shares` (
  `importConfigId` int NOT NULL,
  `sharedWithUserId` int NOT NULL,
  PRIMARY KEY (`importConfigId`,`sharedWithUserId`),
  KEY `sharedWithUserId` (`sharedWithUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfig_shares`
--

LOCK TABLES `importconfig_shares` WRITE;
/*!40000 ALTER TABLE `importconfig_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfig_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importconfigs`
--

DROP TABLE IF EXISTS `importconfigs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importconfigs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ownerId` int DEFAULT NULL,
  `classId` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `config` longtext,
  `description` longtext,
  `creationDate` int DEFAULT NULL,
  `modificationDate` int DEFAULT NULL,
  `shareGlobally` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`),
  KEY `classId` (`classId`),
  KEY `shareGlobally` (`shareGlobally`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importconfigs`
--

LOCK TABLES `importconfigs` WRITE;
/*!40000 ALTER TABLE `importconfigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `importconfigs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_keys`
--

DROP TABLE IF EXISTS `lock_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_keys` (
  `key_id` varchar(64) NOT NULL,
  `key_token` varchar(44) NOT NULL,
  `key_expiration` int unsigned NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_keys`
--

LOCK TABLES `lock_keys` WRITE;
/*!40000 ALTER TABLE `lock_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locks`
--

DROP TABLE IF EXISTS `locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locks` (
  `id` varchar(150) NOT NULL DEFAULT '',
  `date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locks`
--

LOCK TABLES `locks` WRITE;
/*!40000 ALTER TABLE `locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `cid` int DEFAULT NULL,
  `ctype` enum('asset','document','object') DEFAULT NULL,
  `date` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `cid_ctype` (`cid`,`ctype`),
  KEY `date` (`date`),
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notes_data`
--

DROP TABLE IF EXISTS `notes_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notes_data` (
  `id` int NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` enum('text','date','document','asset','object','bool') DEFAULT NULL,
  `data` text,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes_data`
--

LOCK TABLES `notes_data` WRITE;
/*!40000 ALTER TABLE `notes_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `notes_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'info',
  `title` varchar(250) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `sender` int DEFAULT NULL,
  `recipient` int NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modificationDate` timestamp NULL DEFAULT NULL,
  `linkedElementType` enum('document','asset','object') DEFAULT NULL,
  `linkedElement` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `recipient` (`recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_1`
--

DROP TABLE IF EXISTS `object_1`;
/*!50001 DROP VIEW IF EXISTS `object_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_1` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `description`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_2`
--

DROP TABLE IF EXISTS `object_2`;
/*!50001 DROP VIEW IF EXISTS `object_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_2` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `details`,
 1 AS `brandLogo`,
 1 AS `fabricUsed`,
 1 AS `advertisment`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_3`
--

DROP TABLE IF EXISTS `object_3`;
/*!50001 DROP VIEW IF EXISTS `object_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_3` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `description`,
 1 AS `washable`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_4`
--

DROP TABLE IF EXISTS `object_4`;
/*!50001 DROP VIEW IF EXISTS `object_4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_4` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `price`,
 1 AS `sku`,
 1 AS `size`,
 1 AS `color__rgb`,
 1 AS `color__a`,
 1 AS `fabric__id`,
 1 AS `fabric__type`,
 1 AS `discount`,
 1 AS `brand__id`,
 1 AS `brand__type`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `image`,
 1 AS `madeIn`,
 1 AS `returnable`,
 1 AS `pattern`,
 1 AS `warranty__value`,
 1 AS `warranty__unit`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_brick_query_jeans_4`
--

DROP TABLE IF EXISTS `object_brick_query_jeans_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_jeans_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `pockets` varchar(190) DEFAULT NULL,
  `waistSize` double DEFAULT NULL,
  `fittings` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_jeans_4`
--

LOCK TABLES `object_brick_query_jeans_4` WRITE;
/*!40000 ALTER TABLE `object_brick_query_jeans_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_jeans_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_shirt_4`
--

DROP TABLE IF EXISTS `object_brick_query_shirt_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_shirt_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `neck` varchar(190) DEFAULT NULL,
  `sleeves` varchar(190) DEFAULT NULL,
  `suitableFor` varchar(190) DEFAULT NULL,
  `pockets` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_shirt_4`
--

LOCK TABLES `object_brick_query_shirt_4` WRITE;
/*!40000 ALTER TABLE `object_brick_query_shirt_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_query_shirt_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_query_suite_4`
--

DROP TABLE IF EXISTS `object_brick_query_suite_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_suite_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `neck` varchar(190) DEFAULT NULL,
  `sleeves` varchar(190) DEFAULT NULL,
  `types` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_query_suite_4`
--

LOCK TABLES `object_brick_query_suite_4` WRITE;
/*!40000 ALTER TABLE `object_brick_query_suite_4` DISABLE KEYS */;
INSERT INTO `object_brick_query_suite_4` VALUES (9,'classification','Round Neck','Lantern Sleeve','Anarkali Suite');
/*!40000 ALTER TABLE `object_brick_query_suite_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_jeans_4`
--

DROP TABLE IF EXISTS `object_brick_store_jeans_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_jeans_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `pockets` varchar(190) DEFAULT NULL,
  `waistSize` double DEFAULT NULL,
  `fittings` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_jeans_4`
--

LOCK TABLES `object_brick_store_jeans_4` WRITE;
/*!40000 ALTER TABLE `object_brick_store_jeans_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_jeans_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_shirt_4`
--

DROP TABLE IF EXISTS `object_brick_store_shirt_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_shirt_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `neck` varchar(190) DEFAULT NULL,
  `sleeves` varchar(190) DEFAULT NULL,
  `suitableFor` varchar(190) DEFAULT NULL,
  `pockets` double DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_shirt_4`
--

LOCK TABLES `object_brick_store_shirt_4` WRITE;
/*!40000 ALTER TABLE `object_brick_store_shirt_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_brick_store_shirt_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_brick_store_suite_4`
--

DROP TABLE IF EXISTS `object_brick_store_suite_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_suite_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `neck` varchar(190) DEFAULT NULL,
  `sleeves` varchar(190) DEFAULT NULL,
  `types` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`o_id`,`fieldname`),
  KEY `o_id` (`o_id`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_brick_store_suite_4`
--

LOCK TABLES `object_brick_store_suite_4` WRITE;
/*!40000 ALTER TABLE `object_brick_store_suite_4` DISABLE KEYS */;
INSERT INTO `object_brick_store_suite_4` VALUES (9,'classification','Round Neck','Lantern Sleeve','Anarkali Suite');
/*!40000 ALTER TABLE `object_brick_store_suite_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `object_localized_4_bn`
--

DROP TABLE IF EXISTS `object_localized_4_bn`;
/*!50001 DROP VIEW IF EXISTS `object_localized_4_bn`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_localized_4_bn` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `price`,
 1 AS `sku`,
 1 AS `size`,
 1 AS `color__rgb`,
 1 AS `color__a`,
 1 AS `fabric__id`,
 1 AS `fabric__type`,
 1 AS `discount`,
 1 AS `brand__id`,
 1 AS `brand__type`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `image`,
 1 AS `madeIn`,
 1 AS `returnable`,
 1 AS `pattern`,
 1 AS `warranty__value`,
 1 AS `warranty__unit`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`,
 1 AS `ooo_id`,
 1 AS `language`,
 1 AS `localName`,
 1 AS `localDetail`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `object_localized_4_en`
--

DROP TABLE IF EXISTS `object_localized_4_en`;
/*!50001 DROP VIEW IF EXISTS `object_localized_4_en`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_localized_4_en` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
 1 AS `name`,
 1 AS `price`,
 1 AS `sku`,
 1 AS `size`,
 1 AS `color__rgb`,
 1 AS `color__a`,
 1 AS `fabric__id`,
 1 AS `fabric__type`,
 1 AS `discount`,
 1 AS `brand__id`,
 1 AS `brand__type`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `image`,
 1 AS `madeIn`,
 1 AS `returnable`,
 1 AS `pattern`,
 1 AS `warranty__value`,
 1 AS `warranty__unit`,
 1 AS `o_id`,
 1 AS `o_parentId`,
 1 AS `o_type`,
 1 AS `o_key`,
 1 AS `o_path`,
 1 AS `o_index`,
 1 AS `o_published`,
 1 AS `o_creationDate`,
 1 AS `o_modificationDate`,
 1 AS `o_userOwner`,
 1 AS `o_userModification`,
 1 AS `o_classId`,
 1 AS `o_className`,
 1 AS `o_childrenSortBy`,
 1 AS `o_childrenSortOrder`,
 1 AS `o_versionCount`,
 1 AS `ooo_id`,
 1 AS `language`,
 1 AS `localName`,
 1 AS `localDetail`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `object_localized_data_4`
--

DROP TABLE IF EXISTS `object_localized_data_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_localized_data_4` (
  `ooo_id` int NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `localName` varchar(190) DEFAULT NULL,
  `localDetail` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_localized_data_4`
--

LOCK TABLES `object_localized_data_4` WRITE;
/*!40000 ALTER TABLE `object_localized_data_4` DISABLE KEYS */;
INSERT INTO `object_localized_data_4` VALUES (9,'bn','কুর্তি','<pre style=\"text-align:left\">\nকুর্তি বা কুর্তা এমন একটি পোশাক যা ভারতীয় সীমানা ছাড়িয়ে প্রসারিত হয়েছে এবং ফ্যাশন ফরোয়ার্ড বিশ্বের চির-পরিবর্তিত দাবী অনুসারে যুগে যুগে বিবর্তিত হয়েছে। একটি দীর্ঘ শীর্ষ, সাধারণত হাঁটু দৈর্ঘ্যের, সালোয়ার বা চুড়িদার এবং দুপত্তের সাথে জুড়ে তৈরি সালোয়ার-কুর্তি-দুপট্টার সমন্বয়ে গঠিত।</pre>\n'),(9,'en','Kurti','<p>The <strong>Kurti</strong> or Kurta is an outfit that has stretched beyond the <strong>Indian</strong> borders, and has evolved down the ages to suit the ever-changing demands of the fashion forward world. A long top, generally of knee-length, paired with Salwar or Churidar and Dupatta is what comprises the Salwar-<strong>Kurti</strong>-Dupatta get-up.</p>\n');
/*!40000 ALTER TABLE `object_localized_data_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_localized_query_4_bn`
--

DROP TABLE IF EXISTS `object_localized_query_4_bn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_localized_query_4_bn` (
  `ooo_id` int NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `localName` varchar(190) DEFAULT NULL,
  `localDetail` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_localized_query_4_bn`
--

LOCK TABLES `object_localized_query_4_bn` WRITE;
/*!40000 ALTER TABLE `object_localized_query_4_bn` DISABLE KEYS */;
INSERT INTO `object_localized_query_4_bn` VALUES (9,'bn','কুর্তি',' কুর্তি বা কুর্তা এমন একটি পোশাক যা ভারতীয় সীমানা ছাড়িয়ে প্রসারিত হয়েছে এবং ফ্যাশন ফরোয়ার্ড বিশ্বের চির-পরিবর্তিত দাবী অনুসারে যুগে যুগে বিবর্তিত হয়েছে। একটি দীর্ঘ শীর্ষ, সাধারণত হাঁটু দৈর্ঘ্যের, সালোয়ার বা চুড়িদার এবং দুপত্তের সাথে জুড়ে তৈরি সালোয়ার-কুর্তি-দুপট্টার সমন্বয়ে গঠিত। ');
/*!40000 ALTER TABLE `object_localized_query_4_bn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_localized_query_4_en`
--

DROP TABLE IF EXISTS `object_localized_query_4_en`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_localized_query_4_en` (
  `ooo_id` int NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL DEFAULT '',
  `localName` varchar(190) DEFAULT NULL,
  `localDetail` longtext,
  PRIMARY KEY (`ooo_id`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_localized_query_4_en`
--

LOCK TABLES `object_localized_query_4_en` WRITE;
/*!40000 ALTER TABLE `object_localized_query_4_en` DISABLE KEYS */;
INSERT INTO `object_localized_query_4_en` VALUES (9,'en','Kurti','The Kurti or Kurta is an outfit that has stretched beyond the Indian borders, and has evolved down the ages to suit the ever-changing demands of the fashion forward world. A long top, generally of knee-length, paired with Salwar or Churidar and Dupatta is what comprises the Salwar-Kurti-Dupatta get-up. ');
/*!40000 ALTER TABLE `object_localized_query_4_en` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_1`
--

DROP TABLE IF EXISTS `object_query_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_1` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '1',
  `oo_className` varchar(255) DEFAULT 'category',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_1`
--

LOCK TABLES `object_query_1` WRITE;
/*!40000 ALTER TABLE `object_query_1` DISABLE KEYS */;
INSERT INTO `object_query_1` VALUES (4,'1','category','Jeans','Used for Bottom wear.'),(11,'1','category','Kurti','The Kurti or Kurta is an outfit that has stretched beyond the Indian borders, and has evolved down the ages to suit the ever-changing demands of the fashion forward world. A long top, generally of knee-length, paired with Salwar or Churidar and Dupatta is what comprises the Salwar-Kurti-Dupatta get-up.');
/*!40000 ALTER TABLE `object_query_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_2`
--

DROP TABLE IF EXISTS `object_query_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_2` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '2',
  `oo_className` varchar(255) DEFAULT 'brand',
  `name` varchar(190) DEFAULT NULL,
  `details` longtext,
  `brandLogo` int DEFAULT NULL,
  `fabricUsed` text,
  `advertisment` text,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_2`
--

LOCK TABLES `object_query_2` WRITE;
/*!40000 ALTER TABLE `object_query_2` DISABLE KEYS */;
INSERT INTO `object_query_2` VALUES (5,'2','brand','Levis','Levi Strauss &amp; Co. is an American clothing company known worldwide for its Levi\'s brand of denim jeans. It was founded in May 1853 when German immigrant Levi Strauss moved from Buttenheim, Bavaria, to San Francisco, California to open a west coast branch of his brothers\' New York dry goods business. ',3,NULL,NULL),(10,'2','brand','Libas','Young stylish modern defines Libas a fashion brand that tells the story of a new age Indian woman who is free spirited, independent and aware. Our constant endeavour is to provide fashionable, stylish, upbeat collection of ethnic and fusion wear carefully curated in line with fashion trends worldwide. ',5,NULL,NULL);
/*!40000 ALTER TABLE `object_query_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_3`
--

DROP TABLE IF EXISTS `object_query_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_3` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '3',
  `oo_className` varchar(255) DEFAULT 'fabric',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `washable` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_3`
--

LOCK TABLES `object_query_3` WRITE;
/*!40000 ALTER TABLE `object_query_3` DISABLE KEYS */;
INSERT INTO `object_query_3` VALUES (7,'3','fabric','Cotton','Cotton fabric is one of the most commonly used types of fabrics in the world. This textile is chemically organic, which means that it does not contain any synthetic compounds. Cotton fabric is derived from the fibers surrounding the seeds of cotton plants, which emerge in a round, fluffy formation once the seeds are mature.','Normal Wash');
/*!40000 ALTER TABLE `object_query_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_4`
--

DROP TABLE IF EXISTS `object_query_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_4` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '4',
  `oo_className` varchar(255) DEFAULT 'product',
  `name` varchar(190) DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `sku` double DEFAULT NULL,
  `size` varchar(190) DEFAULT NULL,
  `color__rgb` varchar(6) DEFAULT NULL,
  `color__a` varchar(2) DEFAULT NULL,
  `fabric__id` int DEFAULT NULL,
  `fabric__type` enum('document','asset','object') DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `brand__id` int DEFAULT NULL,
  `brand__type` enum('document','asset','object') DEFAULT NULL,
  `category__id` int DEFAULT NULL,
  `category__type` enum('document','asset','object') DEFAULT NULL,
  `image` int DEFAULT NULL,
  `madeIn` varchar(190) DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT NULL,
  `pattern` varchar(190) DEFAULT NULL,
  `warranty__value` double DEFAULT NULL,
  `warranty__unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_4`
--

LOCK TABLES `object_query_4` WRITE;
/*!40000 ALTER TABLE `object_query_4` DISABLE KEYS */;
INSERT INTO `object_query_4` VALUES (9,'4','product','Kurti',999.00,1,'L','eb1616','ff',7,'object',NULL,10,'object',11,'object',6,'IN',0,'Printed',1,'1');
/*!40000 ALTER TABLE `object_query_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_1`
--

DROP TABLE IF EXISTS `object_relations_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_1`
--

LOCK TABLES `object_relations_1` WRITE;
/*!40000 ALTER TABLE `object_relations_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_2`
--

DROP TABLE IF EXISTS `object_relations_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_2` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_2`
--

LOCK TABLES `object_relations_2` WRITE;
/*!40000 ALTER TABLE `object_relations_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_3`
--

DROP TABLE IF EXISTS `object_relations_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_3` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_3`
--

LOCK TABLES `object_relations_3` WRITE;
/*!40000 ALTER TABLE `object_relations_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_4`
--

DROP TABLE IF EXISTS `object_relations_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_4` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `src_id` int NOT NULL DEFAULT '0',
  `dest_id` int NOT NULL DEFAULT '0',
  `type` varchar(50) NOT NULL DEFAULT '',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `forward_lookup` (`src_id`,`ownertype`,`ownername`,`position`),
  KEY `reverse_lookup` (`dest_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_relations_4`
--

LOCK TABLES `object_relations_4` WRITE;
/*!40000 ALTER TABLE `object_relations_4` DISABLE KEYS */;
INSERT INTO `object_relations_4` VALUES (7,9,7,'object','fabric',0,'object','','0'),(8,9,10,'object','brand',0,'object','','0'),(9,9,11,'object','category',0,'object','','0');
/*!40000 ALTER TABLE `object_relations_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_1`
--

DROP TABLE IF EXISTS `object_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_1` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_1`
--

LOCK TABLES `object_store_1` WRITE;
/*!40000 ALTER TABLE `object_store_1` DISABLE KEYS */;
INSERT INTO `object_store_1` VALUES (4,'Jeans','Used for Bottom wear.'),(11,'Kurti','The Kurti or Kurta is an outfit that has stretched beyond the Indian borders, and has evolved down the ages to suit the ever-changing demands of the fashion forward world. A long top, generally of knee-length, paired with Salwar or Churidar and Dupatta is what comprises the Salwar-Kurti-Dupatta get-up.');
/*!40000 ALTER TABLE `object_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_2`
--

DROP TABLE IF EXISTS `object_store_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_2` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `details` longtext,
  `brandLogo` int DEFAULT NULL,
  `advertisment` text,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_2`
--

LOCK TABLES `object_store_2` WRITE;
/*!40000 ALTER TABLE `object_store_2` DISABLE KEYS */;
INSERT INTO `object_store_2` VALUES (5,'Levis','<p>Levi Strauss &amp; Co. is an American clothing company known worldwide for its Levi\'s brand of denim jeans. It was founded in May 1853 when German immigrant Levi Strauss moved from Buttenheim, Bavaria, to San Francisco, California to open a west coast branch of his brothers\' New York dry goods business.</p>\n',3,NULL),(10,'Libas','<p>Young stylish modern defines Libas a fashion brand that tells the story of a new age Indian woman who is free spirited, independent and aware. Our constant endeavour is to provide fashionable, stylish, upbeat collection of ethnic and fusion wear carefully curated in line with fashion trends worldwide.</p>\n',5,NULL);
/*!40000 ALTER TABLE `object_store_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_3`
--

DROP TABLE IF EXISTS `object_store_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_3` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `description` longtext,
  `washable` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_3`
--

LOCK TABLES `object_store_3` WRITE;
/*!40000 ALTER TABLE `object_store_3` DISABLE KEYS */;
INSERT INTO `object_store_3` VALUES (7,'Cotton','Cotton fabric is one of the most commonly used types of fabrics in the world. This textile is chemically organic, which means that it does not contain any synthetic compounds. Cotton fabric is derived from the fibers surrounding the seeds of cotton plants, which emerge in a round, fluffy formation once the seeds are mature.','Normal Wash');
/*!40000 ALTER TABLE `object_store_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_4`
--

DROP TABLE IF EXISTS `object_store_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_4` (
  `oo_id` int NOT NULL DEFAULT '0',
  `name` varchar(190) DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `sku` double DEFAULT NULL,
  `size` varchar(190) DEFAULT NULL,
  `color__rgb` varchar(6) DEFAULT NULL,
  `color__a` varchar(2) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `image` int DEFAULT NULL,
  `madeIn` varchar(190) DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT NULL,
  `pattern` varchar(190) DEFAULT NULL,
  `warranty__value` double DEFAULT NULL,
  `warranty__unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_4`
--

LOCK TABLES `object_store_4` WRITE;
/*!40000 ALTER TABLE `object_store_4` DISABLE KEYS */;
INSERT INTO `object_store_4` VALUES (9,'Kurti',999.00,1,'L','eb1616','ff',NULL,6,'IN',0,'Printed',1,'1');
/*!40000 ALTER TABLE `object_store_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_url_slugs`
--

DROP TABLE IF EXISTS `object_url_slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_url_slugs` (
  `objectId` int NOT NULL DEFAULT '0',
  `classId` varchar(50) NOT NULL DEFAULT '0',
  `fieldname` varchar(70) NOT NULL DEFAULT '0',
  `index` int unsigned NOT NULL DEFAULT '0',
  `ownertype` enum('object','fieldcollection','localizedfield','objectbrick') NOT NULL DEFAULT 'object',
  `ownername` varchar(70) NOT NULL DEFAULT '',
  `position` varchar(70) NOT NULL DEFAULT '0',
  `slug` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `siteId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`slug`,`siteId`),
  KEY `index` (`index`),
  KEY `objectId` (`objectId`),
  KEY `classId` (`classId`),
  KEY `fieldname` (`fieldname`),
  KEY `position` (`position`),
  KEY `ownertype` (`ownertype`),
  KEY `ownername` (`ownername`),
  KEY `slug` (`slug`),
  KEY `siteId` (`siteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_url_slugs`
--

LOCK TABLES `object_url_slugs` WRITE;
/*!40000 ALTER TABLE `object_url_slugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_url_slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objects`
--

DROP TABLE IF EXISTS `objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objects` (
  `o_id` int unsigned NOT NULL AUTO_INCREMENT,
  `o_parentId` int unsigned DEFAULT NULL,
  `o_type` enum('object','folder','variant') DEFAULT NULL,
  `o_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `o_path` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `o_index` int unsigned DEFAULT '0',
  `o_published` tinyint unsigned DEFAULT '1',
  `o_creationDate` int unsigned DEFAULT NULL,
  `o_modificationDate` int unsigned DEFAULT NULL,
  `o_userOwner` int unsigned DEFAULT NULL,
  `o_userModification` int unsigned DEFAULT NULL,
  `o_classId` varchar(50) DEFAULT NULL,
  `o_className` varchar(255) DEFAULT NULL,
  `o_childrenSortBy` enum('key','index') DEFAULT NULL,
  `o_childrenSortOrder` enum('ASC','DESC') DEFAULT NULL,
  `o_versionCount` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`o_id`),
  UNIQUE KEY `fullpath` (`o_path`,`o_key`),
  KEY `key` (`o_key`),
  KEY `index` (`o_index`),
  KEY `published` (`o_published`),
  KEY `parentId` (`o_parentId`),
  KEY `type` (`o_type`),
  KEY `o_modificationDate` (`o_modificationDate`),
  KEY `o_classId` (`o_classId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1613976326,1613976326,1,1,NULL,NULL,NULL,NULL,0),(2,1,'folder','category','/',NULL,1,1614075329,1614075328,2,2,NULL,NULL,NULL,NULL,2),(3,1,'folder','brand','/',NULL,1,1614075343,1614075343,2,2,NULL,NULL,NULL,NULL,2),(4,2,'object','000C1','/category/',0,1,1614075383,1614075441,2,2,'1','category',NULL,NULL,2),(5,3,'object','000B1','/brand/',0,1,1614075454,1614075792,2,2,'2','brand',NULL,NULL,2),(6,1,'folder','fabric','/',NULL,1,1614088751,1614088751,2,2,NULL,NULL,NULL,NULL,2),(7,6,'object','Cotton','/fabric/',0,1,1614088764,1614088837,2,2,'3','fabric',NULL,NULL,2),(8,1,'folder','product','/',NULL,1,1614099713,1614099712,2,2,NULL,NULL,NULL,NULL,2),(9,8,'object','000P1','/product/',0,1,1614106886,1614107882,2,2,'4','product',NULL,NULL,4),(10,3,'object','Libas','/brand/',0,1,1614106977,1614107238,2,2,'2','brand',NULL,NULL,2),(11,2,'object','kurti','/category/',0,1,1614107276,1614107331,2,2,'1','category',NULL,NULL,2);
/*!40000 ALTER TABLE `objects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pimcore_migrations`
--

DROP TABLE IF EXISTS `pimcore_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pimcore_migrations` (
  `migration_set` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `migrated_at` datetime NOT NULL,
  PRIMARY KEY (`migration_set`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pimcore_migrations`
--

LOCK TABLES `pimcore_migrations` WRITE;
/*!40000 ALTER TABLE `pimcore_migrations` DISABLE KEYS */;
INSERT INTO `pimcore_migrations` VALUES ('pimcore_core','20180724144005','2021-02-22 12:15:30'),('pimcore_core','20180830113528','2021-02-22 12:15:31'),('pimcore_core','20180830122128','2021-02-22 12:15:31'),('pimcore_core','20180904201947','2021-02-22 12:15:31'),('pimcore_core','20180906142115','2021-02-22 12:15:31'),('pimcore_core','20180907115436','2021-02-22 12:15:31'),('pimcore_core','20180912140913','2021-02-22 12:15:31'),('pimcore_core','20180913132106','2021-02-22 12:15:31'),('pimcore_core','20180924111736','2021-02-22 12:15:31'),('pimcore_core','20181008132414','2021-02-22 12:15:31'),('pimcore_core','20181009135158','2021-02-22 12:15:31'),('pimcore_core','20181115114003','2021-02-22 12:15:31'),('pimcore_core','20181126094412','2021-02-22 12:15:31'),('pimcore_core','20181126144341','2021-02-22 12:15:31'),('pimcore_core','20181128074035','2021-02-22 12:15:31'),('pimcore_core','20181128112320','2021-02-22 12:15:31'),('pimcore_core','20181214145532','2021-02-22 12:15:31'),('pimcore_core','20190102143436','2021-02-22 12:15:31'),('pimcore_core','20190102153226','2021-02-22 12:15:31'),('pimcore_core','20190108131401','2021-02-22 12:15:31'),('pimcore_core','20190124105627','2021-02-22 12:15:31'),('pimcore_core','20190131074054','2021-02-22 12:15:31'),('pimcore_core','20190131095936','2021-02-22 12:15:31'),('pimcore_core','20190320133439','2021-02-22 12:15:31'),('pimcore_core','20190402073052','2021-02-22 12:15:31'),('pimcore_core','20190403120728','2021-02-22 12:15:31'),('pimcore_core','20190405112707','2021-02-22 12:15:31'),('pimcore_core','20190408084129','2021-02-22 12:15:31'),('pimcore_core','20190508074339','2021-02-22 12:15:31'),('pimcore_core','20190515130651','2021-02-22 12:15:31'),('pimcore_core','20190520151448','2021-02-22 12:15:31'),('pimcore_core','20190522130545','2021-02-22 12:15:31'),('pimcore_core','20190527121800','2021-02-22 12:15:31'),('pimcore_core','20190618154000','2021-02-22 12:15:31'),('pimcore_core','20190701141857','2021-02-22 12:15:31'),('pimcore_core','20190708175236','2021-02-22 12:15:31'),('pimcore_core','20190729085052','2021-02-22 12:15:31'),('pimcore_core','20190802090149','2021-02-22 12:15:31'),('pimcore_core','20190806160450','2021-02-22 12:15:31'),('pimcore_core','20190807121356','2021-02-22 12:15:31'),('pimcore_core','20190828142756','2021-02-22 12:15:31'),('pimcore_core','20190902085052','2021-02-22 12:15:31'),('pimcore_core','20190904154339','2021-02-22 12:15:31'),('pimcore_core','20191015131700','2021-02-22 12:15:31'),('pimcore_core','20191107141816','2021-02-22 12:15:31'),('pimcore_core','20191114123638','2021-02-22 12:15:31'),('pimcore_core','20191114132014','2021-02-22 12:15:31'),('pimcore_core','20191121150326','2021-02-22 12:15:31'),('pimcore_core','20191125135853','2021-02-22 12:15:31'),('pimcore_core','20191125200416','2021-02-22 12:15:32'),('pimcore_core','20191126130004','2021-02-22 12:15:32'),('pimcore_core','20191208175348','2021-02-22 12:15:32'),('pimcore_core','20191213115045','2021-02-22 12:15:32'),('pimcore_core','20191218073528','2021-02-22 12:15:32'),('pimcore_core','20191230103524','2021-02-22 12:15:32'),('pimcore_core','20191230104529','2021-02-22 12:15:32'),('pimcore_core','20200113120101','2021-02-22 12:15:32'),('pimcore_core','20200116181758','2021-02-22 12:15:32'),('pimcore_core','20200121095650','2021-02-22 12:15:32'),('pimcore_core','20200121131304','2021-02-22 12:15:32'),('pimcore_core','20200127102432','2021-02-22 12:15:32'),('pimcore_core','20200129102132','2021-02-22 12:15:32'),('pimcore_core','20200210101048','2021-02-22 12:15:32'),('pimcore_core','20200210164037','2021-02-22 12:15:32'),('pimcore_core','20200211115044','2021-02-22 12:15:32'),('pimcore_core','20200212130011','2021-02-22 12:15:32'),('pimcore_core','20200218104052','2021-02-22 12:15:32'),('pimcore_core','20200226102938','2021-02-22 12:15:32'),('pimcore_core','20200310122412','2021-02-22 12:15:32'),('pimcore_core','20200313092019','2021-02-22 12:15:32'),('pimcore_core','20200317163018','2021-02-22 12:15:32'),('pimcore_core','20200318100042','2021-02-22 12:15:32'),('pimcore_core','20200324141723','2021-02-22 12:15:32'),('pimcore_core','20200407120641','2021-02-22 12:15:32'),('pimcore_core','20200407132737','2021-02-22 12:15:32'),('pimcore_core','20200407145422','2021-02-22 12:15:32'),('pimcore_core','20200410112354','2021-02-22 12:15:32'),('pimcore_core','20200421142950','2021-02-22 12:15:32'),('pimcore_core','20200422090352','2021-02-22 12:15:32'),('pimcore_core','20200428082346','2021-02-22 12:15:32'),('pimcore_core','20200428111313','2021-02-22 12:15:32'),('pimcore_core','20200529121630','2021-02-22 12:15:32'),('pimcore_core','20200604110336','2021-02-22 12:15:32'),('pimcore_core','20200619071650','2021-02-22 12:15:32'),('pimcore_core','20200703093410','2021-02-22 12:15:32'),('pimcore_core','20200721123847','2021-02-22 12:15:32'),('pimcore_core','20200807105448','2021-02-22 12:15:32'),('pimcore_core','20200812160035','2021-02-22 12:15:32'),('pimcore_core','20200817133132','2021-02-22 12:15:32'),('pimcore_core','20200820151104','2021-02-22 12:15:32'),('pimcore_core','20200828091305','2021-02-22 12:15:32'),('pimcore_core','20200902111642','2021-02-22 12:15:32'),('pimcore_core','20201001133558','2021-02-22 12:15:32'),('pimcore_core','20201207132025','2021-02-22 12:15:32'),('pimcore_core','20210211152319','2021-02-22 12:15:32');
/*!40000 ALTER TABLE `pimcore_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL DEFAULT 'document',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `name` varchar(190) NOT NULL DEFAULT '',
  `type` enum('text','document','asset','object','bool','select') DEFAULT NULL,
  `data` text,
  `inheritable` tinyint unsigned DEFAULT '1',
  PRIMARY KEY (`cid`,`ctype`,`name`),
  KEY `getall` (`cpath`,`ctype`,`inheritable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quantityvalue_units`
--

DROP TABLE IF EXISTS `quantityvalue_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quantityvalue_units` (
  `id` varchar(50) NOT NULL,
  `group` varchar(50) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  `longname` varchar(250) DEFAULT NULL,
  `baseunit` varchar(50) DEFAULT NULL,
  `factor` double DEFAULT NULL,
  `conversionOffset` double DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `converter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_baseunit` (`baseunit`),
  CONSTRAINT `fk_baseunit` FOREIGN KEY (`baseunit`) REFERENCES `quantityvalue_units` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quantityvalue_units`
--

LOCK TABLES `quantityvalue_units` WRITE;
/*!40000 ALTER TABLE `quantityvalue_units` DISABLE KEYS */;
INSERT INTO `quantityvalue_units` VALUES ('1',NULL,'month',NULL,NULL,NULL,NULL,NULL,''),('2',NULL,'years',NULL,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `quantityvalue_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recyclebin`
--

DROP TABLE IF EXISTS `recyclebin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recyclebin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(20) DEFAULT NULL,
  `path` varchar(765) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `deletedby` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recyclebin`
--

LOCK TABLES `recyclebin` WRITE;
/*!40000 ALTER TABLE `recyclebin` DISABLE KEYS */;
/*!40000 ALTER TABLE `recyclebin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirects`
--

DROP TABLE IF EXISTS `redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirects` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('entire_uri','path_query','path','auto_create') NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `sourceSite` int DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `targetSite` int DEFAULT NULL,
  `statusCode` varchar(3) DEFAULT NULL,
  `priority` int DEFAULT '0',
  `regex` tinyint(1) DEFAULT NULL,
  `passThroughParameters` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `expiry` int unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  `userOwner` int unsigned DEFAULT NULL,
  `userModification` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `priority` (`priority`),
  KEY `routing_lookup` (`active`,`regex`,`sourceSite`,`source`,`type`,`expiry`,`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirects`
--

LOCK TABLES `redirects` WRITE;
/*!40000 ALTER TABLE `redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanitycheck`
--

DROP TABLE IF EXISTS `sanitycheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sanitycheck` (
  `id` int unsigned NOT NULL,
  `type` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanitycheck`
--

LOCK TABLES `sanitycheck` WRITE;
/*!40000 ALTER TABLE `sanitycheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanitycheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_tasks`
--

DROP TABLE IF EXISTS `schedule_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `date` int unsigned DEFAULT NULL,
  `action` enum('publish','unpublish','delete','publish-version') DEFAULT NULL,
  `version` bigint unsigned DEFAULT NULL,
  `active` tinyint unsigned DEFAULT '0',
  `userId` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype` (`ctype`),
  KEY `active` (`active`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_tasks`
--

LOCK TABLES `schedule_tasks` WRITE;
/*!40000 ALTER TABLE `schedule_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_backend_data`
--

DROP TABLE IF EXISTS `search_backend_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_backend_data` (
  `id` int NOT NULL,
  `fullpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `maintype` varchar(8) NOT NULL DEFAULT '',
  `type` varchar(20) DEFAULT NULL,
  `subtype` varchar(190) DEFAULT NULL,
  `published` tinyint unsigned DEFAULT NULL,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  `userOwner` int DEFAULT NULL,
  `userModification` int DEFAULT NULL,
  `data` longtext,
  `properties` text,
  PRIMARY KEY (`id`,`maintype`),
  KEY `fullpath` (`fullpath`),
  KEY `maintype` (`maintype`),
  KEY `type` (`type`),
  KEY `subtype` (`subtype`),
  KEY `published` (`published`),
  FULLTEXT KEY `fulltext` (`data`,`properties`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_backend_data`
--

LOCK TABLES `search_backend_data` WRITE;
/*!40000 ALTER TABLE `search_backend_data` DISABLE KEYS */;
INSERT INTO `search_backend_data` VALUES (2,'/brandLogo','asset','folder','folder',1,1614075740,1614075740,2,2,'ID: 2  \nPath: /brandLogo  \nbrandLogo brandLogo',''),(2,'/category','object','folder','folder',1,1614075329,1614075328,2,2,'ID: 2  \nPath: /category  \ncategory category',''),(3,'/brandLogo/levi.png','asset','image','image',1,1614075781,1614075781,2,2,'ID: 3  \nPath: /brandLogo/levi.png  \nlevi.png brandLogo levi png',''),(3,'/brand','object','folder','folder',1,1614075343,1614075343,2,2,'ID: 3  \nPath: /brand  \nbrand brand',''),(4,'/_default_upload_bucket','asset','folder','folder',1,1614107224,1614107224,1,0,'ID: 4  \nPath: /_default_upload_bucket  \n_default_upload_bucket default upload bucket',''),(4,'/category/000C1','object','object','category',1,1614075383,1614075441,2,2,'ID: 4  \nPath: /category/000C1  \n000C1 Jeans Used for Bottom wear. category 000C1',''),(5,'/_default_upload_bucket/kurti 6.jpeg','asset','image','image',1,1614107224,1614107224,2,2,'ID: 5  \nPath: /_default_upload_bucket/kurti 6.jpeg  \nkurti 6.jpeg FileName kurti 6.jpeg FileDateTime 1614107224 FileSize 53635 FileType MimeType image/jpeg SectionsFound default upload bucket kurti jpeg',''),(5,'/brand/000B1','object','object','brand',1,1614075454,1614075792,2,2,'ID: 5  \nPath: /brand/000B1  \n000B1 Levis Levi Strauss Co. American clothing company known worldwide for its Levi brand denim jeans. was founded May 1853 when German immigrant Levi Strauss moved from Buttenheim Bavaria San Francisco California open west coast branch his brothers New York dry goods business. brand 000B1',''),(6,'/_default_upload_bucket/kurti 6_1.jpeg','asset','image','image',1,1614107380,1614107380,2,2,'ID: 6  \nPath: /_default_upload_bucket/kurti 6_1.jpeg  \nkurti 6_1.jpeg FileName kurti 6_1.jpeg FileDateTime 1614107380 FileSize 53635 FileType MimeType image/jpeg SectionsFound default upload bucket kurti jpeg',''),(6,'/fabric','object','folder','folder',1,1614088751,1614088751,2,2,'ID: 6  \nPath: /fabric  \nfabric fabric',''),(7,'/fabric/Cotton','object','object','fabric',1,1614088764,1614088837,2,2,'ID: 7  \nPath: /fabric/Cotton  \nCotton Cotton Cotton fabric one the most commonly used types fabrics the world. This textile chemically organic which means that does not contain any synthetic compounds. fabric derived from the fibers surrounding seeds cotton plants which emerge round fluffy formation once seeds are mature. Normal Wash fabric',''),(8,'/product','object','folder','folder',1,1614099713,1614099712,2,2,'ID: 8  \nPath: /product  \nproduct product',''),(9,'/product/000P1','object','object','product',1,1614106886,1614107882,2,2,'ID: 9  \nPath: /product/000P1  \n000P1 Kurti 999 #eb1616ff Round Neck Lantern Sleeve Anarkali Suite কুর্তি কুর্তি কুর্তা এমন একটি পোশাক ভারতীয় সীমানা ছাড়িয়ে প্রসারিত হয়েছে এবং ফ্যাশন ফরোয়ার্ড বিশ্বের চির-পরিবর্তিত দাবী অনুসারে যুগে যুগে বিবর্তিত হয়েছে। একটি দীর্ঘ শীর্ষ সাধারণত হাঁটু দৈর্ঘ্যের সালোয়ার চুড়িদার এবং দুপত্তের সাথে জুড়ে তৈরি সালোয়ার-কুর্তি-দুপট্টার সমন্বয়ে গঠিত। Kurti The Kurti Kurta outfit that has stretched beyond the Indian borders and has evolved down the ages suit the ever-changing demands fashion forward world. long top generally knee-length paired with Salwar Churidar and Dupatta what comprises Salwar-Kurti-Dupatta get-up. Printed month product 000P1',''),(10,'/brand/Libas','object','object','brand',1,1614106977,1614107238,2,2,'ID: 10  \nPath: /brand/Libas  \nLibas Libas Young stylish modern defines Libas fashion brand that tells the story new age Indian woman who free spirited independent and aware. Our constant endeavour provide fashionable stylish upbeat collection ethnic and fusion wear carefully curated line with fashion trends worldwide. brand',''),(11,'/category/kurti','object','object','category',1,1614107276,1614107331,2,2,'ID: 11  \nPath: /category/kurti  \nkurti Kurti The Kurti Kurta outfit that has stretched beyond the Indian borders and has evolved down the ages suit the ever-changing demands fashion forward world. long top generally knee-length paired with Salwar Churidar and Dupatta what comprises Salwar-Kurti-Dupatta get-up. category kurti','');
/*!40000 ALTER TABLE `search_backend_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mainDomain` varchar(255) DEFAULT NULL,
  `domains` text,
  `rootId` int unsigned DEFAULT NULL,
  `errorDocument` varchar(255) DEFAULT NULL,
  `redirectToMainDomain` tinyint(1) DEFAULT NULL,
  `creationDate` int unsigned DEFAULT '0',
  `modificationDate` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rootId` (`rootId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `idPath` varchar(190) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idPath_name` (`idPath`,`name`),
  KEY `idpath` (`idPath`),
  KEY `parentid` (`parentId`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_assignment`
--

DROP TABLE IF EXISTS `tags_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_assignment` (
  `tagid` int unsigned NOT NULL DEFAULT '0',
  `cid` int NOT NULL DEFAULT '0',
  `ctype` enum('document','asset','object') NOT NULL,
  PRIMARY KEY (`tagid`,`cid`,`ctype`),
  KEY `ctype` (`ctype`),
  KEY `ctype_cid` (`cid`,`ctype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_assignment`
--

LOCK TABLES `tags_assignment` WRITE;
/*!40000 ALTER TABLE `tags_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_rules`
--

DROP TABLE IF EXISTS `targeting_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_rules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `scope` varchar(50) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `prio` smallint unsigned NOT NULL DEFAULT '0',
  `conditions` longtext,
  `actions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_rules`
--

LOCK TABLES `targeting_rules` WRITE;
/*!40000 ALTER TABLE `targeting_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_storage`
--

DROP TABLE IF EXISTS `targeting_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_storage` (
  `visitorId` varchar(100) NOT NULL,
  `scope` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  `creationDate` datetime DEFAULT NULL,
  `modificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`visitorId`,`scope`,`name`),
  KEY `targeting_storage_scope_index` (`scope`),
  KEY `targeting_storage_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_storage`
--

LOCK TABLES `targeting_storage` WRITE;
/*!40000 ALTER TABLE `targeting_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `targeting_target_groups`
--

DROP TABLE IF EXISTS `targeting_target_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `targeting_target_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `threshold` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `targeting_target_groups`
--

LOCK TABLES `targeting_target_groups` WRITE;
/*!40000 ALTER TABLE `targeting_target_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `targeting_target_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmp_store`
--

DROP TABLE IF EXISTS `tmp_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_store` (
  `id` varchar(190) NOT NULL DEFAULT '',
  `tag` varchar(190) DEFAULT NULL,
  `data` longtext,
  `serialized` tinyint NOT NULL DEFAULT '0',
  `date` int unsigned DEFAULT NULL,
  `expiryDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tag` (`tag`),
  KEY `date` (`date`),
  KEY `expiryDate` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_store`
--

LOCK TABLES `tmp_store` WRITE;
/*!40000 ALTER TABLE `tmp_store` DISABLE KEYS */;
INSERT INTO `tmp_store` VALUES ('thumb_3__2449ad7fa0cb229053b628f1e43c1a56','image-optimize-queue','image-thumbnails/brandLogo/image-thumb__3__auto_6eff904a1a9a57680d726da3d5459ac7/levi.png',0,1614075788,1614680588),('thumb_3__f97a0546f982576db6f910d58ee81a96','image-optimize-queue','image-thumbnails/brandLogo/image-thumb__3__pimcore-system-treepreview/levi.jpg',0,1614075781,1614680581),('thumb_5__93fb6f96a9d21aa1f895e60996b5649d','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__5__pimcore-system-treepreview/kurti 6.jpg',0,1614107224,1614712024),('thumb_5__b30d405964a6c4e8d79c1863d7883a4e','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__5__auto_6eff904a1a9a57680d726da3d5459ac7/kurti 6.png',0,1614107226,1614712026),('thumb_6__7b0e9bc3f4bafdfb101d45cb31a8b118','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__6__auto_6eff904a1a9a57680d726da3d5459ac7/kurti 6_1.png',0,1614107381,1614712181),('thumb_6__92a1c139788963cacdd69c3a3c6dcb3b','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__6__pimcore-system-treepreview/kurti 6_1.jpg',0,1614107380,1614712180);
/*!40000 ALTER TABLE `tmp_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking_events`
--

DROP TABLE IF EXISTS `tracking_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(190) DEFAULT NULL,
  `action` varchar(190) DEFAULT NULL,
  `label` varchar(190) DEFAULT NULL,
  `data` varchar(190) DEFAULT NULL,
  `timestamp` int unsigned DEFAULT NULL,
  `year` int unsigned DEFAULT NULL,
  `month` int unsigned DEFAULT NULL,
  `day` int unsigned DEFAULT NULL,
  `dayOfWeek` int unsigned DEFAULT NULL,
  `dayOfYear` int unsigned DEFAULT NULL,
  `weekOfYear` int unsigned DEFAULT NULL,
  `hour` int unsigned DEFAULT NULL,
  `minute` int unsigned DEFAULT NULL,
  `second` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `year` (`year`),
  KEY `month` (`month`),
  KEY `day` (`day`),
  KEY `dayOfWeek` (`dayOfWeek`),
  KEY `dayOfYear` (`dayOfYear`),
  KEY `weekOfYear` (`weekOfYear`),
  KEY `hour` (`hour`),
  KEY `minute` (`minute`),
  KEY `second` (`second`),
  KEY `category` (`category`),
  KEY `action` (`action`),
  KEY `label` (`label`),
  KEY `data` (`data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking_events`
--

LOCK TABLES `tracking_events` WRITE;
/*!40000 ALTER TABLE `tracking_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `tracking_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_admin`
--

DROP TABLE IF EXISTS `translations_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_admin` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_admin`
--

LOCK TABLES `translations_admin` WRITE;
/*!40000 ALTER TABLE `translations_admin` DISABLE KEYS */;
INSERT INTO `translations_admin` VALUES (':','cs','',1614104818,1614104818),(':','de','',1614104818,1614104818),(':','en','',1614104818,1614104818),(':','es','',1614104818,1614104818),(':','fa','',1614104818,1614104818),(':','fr','',1614104818,1614104818),(':','hu','',1614104818,1614104818),(':','it','',1614104818,1614104818),(':','ja','',1614104818,1614104818),(':','nl','',1614104818,1614104818),(':','pl','',1614104818,1614104818),(':','pt_BR','',1614104818,1614104818),(':','ru','',1614104818,1614104818),(':','sk','',1614104818,1614104818),(':','sv','',1614104818,1614104818),(':','sv_FI','',1614104818,1614104818),(':','th','',1614104818,1614104818),(':','tr','',1614104818,1614104818),(':','uk','',1614104818,1614104818),(':','zh_Hans','',1614104818,1614104818),('Advertisment','cs','',1614106973,1614106973),('Advertisment','de','',1614106973,1614106973),('Advertisment','en','',1614106973,1614106973),('Advertisment','es','',1614106973,1614106973),('Advertisment','fa','',1614106973,1614106973),('Advertisment','fr','',1614106973,1614106973),('Advertisment','hu','',1614106973,1614106973),('Advertisment','it','',1614106973,1614106973),('Advertisment','ja','',1614106973,1614106973),('Advertisment','nl','',1614106973,1614106973),('Advertisment','pl','',1614106973,1614106973),('Advertisment','pt_BR','',1614106973,1614106973),('Advertisment','ru','',1614106973,1614106973),('Advertisment','sk','',1614106973,1614106973),('Advertisment','sv','',1614106973,1614106973),('Advertisment','sv_FI','',1614106973,1614106973),('Advertisment','th','',1614106973,1614106973),('Advertisment','tr','',1614106973,1614106973),('Advertisment','uk','',1614106973,1614106973),('Advertisment','zh_Hans','',1614106973,1614106973),('Afghanistan','cs','',1614107580,1614107580),('Afghanistan','de','',1614107580,1614107580),('Afghanistan','en','',1614107580,1614107580),('Afghanistan','es','',1614107580,1614107580),('Afghanistan','fa','',1614107580,1614107580),('Afghanistan','fr','',1614107580,1614107580),('Afghanistan','hu','',1614107580,1614107580),('Afghanistan','it','',1614107580,1614107580),('Afghanistan','ja','',1614107580,1614107580),('Afghanistan','nl','',1614107580,1614107580),('Afghanistan','pl','',1614107580,1614107580),('Afghanistan','pt_BR','',1614107580,1614107580),('Afghanistan','ru','',1614107580,1614107580),('Afghanistan','sk','',1614107580,1614107580),('Afghanistan','sv','',1614107580,1614107580),('Afghanistan','sv_FI','',1614107580,1614107580),('Afghanistan','th','',1614107580,1614107580),('Afghanistan','tr','',1614107580,1614107580),('Afghanistan','uk','',1614107580,1614107580),('Afghanistan','zh_Hans','',1614107580,1614107580),('Albania','cs','',1614107580,1614107580),('Albania','de','',1614107580,1614107580),('Albania','en','',1614107580,1614107580),('Albania','es','',1614107580,1614107580),('Albania','fa','',1614107580,1614107580),('Albania','fr','',1614107580,1614107580),('Albania','hu','',1614107580,1614107580),('Albania','it','',1614107580,1614107580),('Albania','ja','',1614107580,1614107580),('Albania','nl','',1614107580,1614107580),('Albania','pl','',1614107580,1614107580),('Albania','pt_BR','',1614107580,1614107580),('Albania','ru','',1614107580,1614107580),('Albania','sk','',1614107580,1614107580),('Albania','sv','',1614107580,1614107580),('Albania','sv_FI','',1614107580,1614107580),('Albania','th','',1614107580,1614107580),('Albania','tr','',1614107580,1614107580),('Albania','uk','',1614107580,1614107580),('Albania','zh_Hans','',1614107580,1614107580),('Algeria','cs','',1614107581,1614107581),('Algeria','de','',1614107581,1614107581),('Algeria','en','',1614107581,1614107581),('Algeria','es','',1614107581,1614107581),('Algeria','fa','',1614107581,1614107581),('Algeria','fr','',1614107581,1614107581),('Algeria','hu','',1614107581,1614107581),('Algeria','it','',1614107581,1614107581),('Algeria','ja','',1614107581,1614107581),('Algeria','nl','',1614107581,1614107581),('Algeria','pl','',1614107581,1614107581),('Algeria','pt_BR','',1614107581,1614107581),('Algeria','ru','',1614107581,1614107581),('Algeria','sk','',1614107581,1614107581),('Algeria','sv','',1614107581,1614107581),('Algeria','sv_FI','',1614107581,1614107581),('Algeria','th','',1614107581,1614107581),('Algeria','tr','',1614107581,1614107581),('Algeria','uk','',1614107581,1614107581),('Algeria','zh_Hans','',1614107581,1614107581),('American Samoa','cs','',1614107581,1614107581),('American Samoa','de','',1614107581,1614107581),('American Samoa','en','',1614107581,1614107581),('American Samoa','es','',1614107581,1614107581),('American Samoa','fa','',1614107581,1614107581),('American Samoa','fr','',1614107581,1614107581),('American Samoa','hu','',1614107581,1614107581),('American Samoa','it','',1614107581,1614107581),('American Samoa','ja','',1614107581,1614107581),('American Samoa','nl','',1614107581,1614107581),('American Samoa','pl','',1614107581,1614107581),('American Samoa','pt_BR','',1614107581,1614107581),('American Samoa','ru','',1614107581,1614107581),('American Samoa','sk','',1614107581,1614107581),('American Samoa','sv','',1614107581,1614107581),('American Samoa','sv_FI','',1614107581,1614107581),('American Samoa','th','',1614107581,1614107581),('American Samoa','tr','',1614107581,1614107581),('American Samoa','uk','',1614107581,1614107581),('American Samoa','zh_Hans','',1614107581,1614107581),('Anarkali Suite','cs','',1614107400,1614107400),('Anarkali Suite','de','',1614107400,1614107400),('Anarkali Suite','en','',1614107400,1614107400),('Anarkali Suite','es','',1614107400,1614107400),('Anarkali Suite','fa','',1614107400,1614107400),('Anarkali Suite','fr','',1614107400,1614107400),('Anarkali Suite','hu','',1614107400,1614107400),('Anarkali Suite','it','',1614107400,1614107400),('Anarkali Suite','ja','',1614107400,1614107400),('Anarkali Suite','nl','',1614107400,1614107400),('Anarkali Suite','pl','',1614107400,1614107400),('Anarkali Suite','pt_BR','',1614107400,1614107400),('Anarkali Suite','ru','',1614107400,1614107400),('Anarkali Suite','sk','',1614107400,1614107400),('Anarkali Suite','sv','',1614107400,1614107400),('Anarkali Suite','sv_FI','',1614107400,1614107400),('Anarkali Suite','th','',1614107400,1614107400),('Anarkali Suite','tr','',1614107400,1614107400),('Anarkali Suite','uk','',1614107400,1614107400),('Anarkali Suite','zh_Hans','',1614107400,1614107400),('Andorra','cs','',1614107581,1614107581),('Andorra','de','',1614107581,1614107581),('Andorra','en','',1614107581,1614107581),('Andorra','es','',1614107581,1614107581),('Andorra','fa','',1614107581,1614107581),('Andorra','fr','',1614107581,1614107581),('Andorra','hu','',1614107581,1614107581),('Andorra','it','',1614107581,1614107581),('Andorra','ja','',1614107581,1614107581),('Andorra','nl','',1614107581,1614107581),('Andorra','pl','',1614107581,1614107581),('Andorra','pt_BR','',1614107581,1614107581),('Andorra','ru','',1614107581,1614107581),('Andorra','sk','',1614107581,1614107581),('Andorra','sv','',1614107581,1614107581),('Andorra','sv_FI','',1614107581,1614107581),('Andorra','th','',1614107581,1614107581),('Andorra','tr','',1614107581,1614107581),('Andorra','uk','',1614107581,1614107581),('Andorra','zh_Hans','',1614107581,1614107581),('Angola','cs','',1614107581,1614107581),('Angola','de','',1614107581,1614107581),('Angola','en','',1614107581,1614107581),('Angola','es','',1614107581,1614107581),('Angola','fa','',1614107581,1614107581),('Angola','fr','',1614107581,1614107581),('Angola','hu','',1614107581,1614107581),('Angola','it','',1614107581,1614107581),('Angola','ja','',1614107581,1614107581),('Angola','nl','',1614107581,1614107581),('Angola','pl','',1614107581,1614107581),('Angola','pt_BR','',1614107581,1614107581),('Angola','ru','',1614107581,1614107581),('Angola','sk','',1614107581,1614107581),('Angola','sv','',1614107581,1614107581),('Angola','sv_FI','',1614107581,1614107581),('Angola','th','',1614107581,1614107581),('Angola','tr','',1614107581,1614107581),('Angola','uk','',1614107581,1614107581),('Angola','zh_Hans','',1614107581,1614107581),('Anguilla','cs','',1614107581,1614107581),('Anguilla','de','',1614107581,1614107581),('Anguilla','en','',1614107581,1614107581),('Anguilla','es','',1614107581,1614107581),('Anguilla','fa','',1614107581,1614107581),('Anguilla','fr','',1614107581,1614107581),('Anguilla','hu','',1614107581,1614107581),('Anguilla','it','',1614107581,1614107581),('Anguilla','ja','',1614107581,1614107581),('Anguilla','nl','',1614107581,1614107581),('Anguilla','pl','',1614107581,1614107581),('Anguilla','pt_BR','',1614107581,1614107581),('Anguilla','ru','',1614107581,1614107581),('Anguilla','sk','',1614107581,1614107581),('Anguilla','sv','',1614107581,1614107581),('Anguilla','sv_FI','',1614107581,1614107581),('Anguilla','th','',1614107581,1614107581),('Anguilla','tr','',1614107581,1614107581),('Anguilla','uk','',1614107581,1614107581),('Anguilla','zh_Hans','',1614107581,1614107581),('Antarctica','cs','',1614107581,1614107581),('Antarctica','de','',1614107581,1614107581),('Antarctica','en','',1614107581,1614107581),('Antarctica','es','',1614107581,1614107581),('Antarctica','fa','',1614107581,1614107581),('Antarctica','fr','',1614107581,1614107581),('Antarctica','hu','',1614107581,1614107581),('Antarctica','it','',1614107581,1614107581),('Antarctica','ja','',1614107581,1614107581),('Antarctica','nl','',1614107581,1614107581),('Antarctica','pl','',1614107581,1614107581),('Antarctica','pt_BR','',1614107581,1614107581),('Antarctica','ru','',1614107581,1614107581),('Antarctica','sk','',1614107581,1614107581),('Antarctica','sv','',1614107581,1614107581),('Antarctica','sv_FI','',1614107581,1614107581),('Antarctica','th','',1614107581,1614107581),('Antarctica','tr','',1614107581,1614107581),('Antarctica','uk','',1614107581,1614107581),('Antarctica','zh_Hans','',1614107581,1614107581),('Antigua & Barbuda','cs','',1614107581,1614107581),('Antigua & Barbuda','de','',1614107581,1614107581),('Antigua & Barbuda','en','',1614107581,1614107581),('Antigua & Barbuda','es','',1614107581,1614107581),('Antigua & Barbuda','fa','',1614107581,1614107581),('Antigua & Barbuda','fr','',1614107581,1614107581),('Antigua & Barbuda','hu','',1614107581,1614107581),('Antigua & Barbuda','it','',1614107581,1614107581),('Antigua & Barbuda','ja','',1614107581,1614107581),('Antigua & Barbuda','nl','',1614107581,1614107581),('Antigua & Barbuda','pl','',1614107581,1614107581),('Antigua & Barbuda','pt_BR','',1614107581,1614107581),('Antigua & Barbuda','ru','',1614107581,1614107581),('Antigua & Barbuda','sk','',1614107581,1614107581),('Antigua & Barbuda','sv','',1614107581,1614107581),('Antigua & Barbuda','sv_FI','',1614107581,1614107581),('Antigua & Barbuda','th','',1614107581,1614107581),('Antigua & Barbuda','tr','',1614107581,1614107581),('Antigua & Barbuda','uk','',1614107581,1614107581),('Antigua & Barbuda','zh_Hans','',1614107581,1614107581),('Argentina','cs','',1614107581,1614107581),('Argentina','de','',1614107581,1614107581),('Argentina','en','',1614107581,1614107581),('Argentina','es','',1614107581,1614107581),('Argentina','fa','',1614107581,1614107581),('Argentina','fr','',1614107581,1614107581),('Argentina','hu','',1614107581,1614107581),('Argentina','it','',1614107581,1614107581),('Argentina','ja','',1614107581,1614107581),('Argentina','nl','',1614107581,1614107581),('Argentina','pl','',1614107581,1614107581),('Argentina','pt_BR','',1614107581,1614107581),('Argentina','ru','',1614107581,1614107581),('Argentina','sk','',1614107581,1614107581),('Argentina','sv','',1614107581,1614107581),('Argentina','sv_FI','',1614107581,1614107581),('Argentina','th','',1614107581,1614107581),('Argentina','tr','',1614107581,1614107581),('Argentina','uk','',1614107581,1614107581),('Argentina','zh_Hans','',1614107581,1614107581),('Armenia','cs','',1614107582,1614107582),('Armenia','de','',1614107582,1614107582),('Armenia','en','',1614107582,1614107582),('Armenia','es','',1614107582,1614107582),('Armenia','fa','',1614107582,1614107582),('Armenia','fr','',1614107582,1614107582),('Armenia','hu','',1614107582,1614107582),('Armenia','it','',1614107582,1614107582),('Armenia','ja','',1614107582,1614107582),('Armenia','nl','',1614107582,1614107582),('Armenia','pl','',1614107582,1614107582),('Armenia','pt_BR','',1614107582,1614107582),('Armenia','ru','',1614107582,1614107582),('Armenia','sk','',1614107582,1614107582),('Armenia','sv','',1614107582,1614107582),('Armenia','sv_FI','',1614107582,1614107582),('Armenia','th','',1614107582,1614107582),('Armenia','tr','',1614107582,1614107582),('Armenia','uk','',1614107582,1614107582),('Armenia','zh_Hans','',1614107582,1614107582),('Aruba','cs','',1614107582,1614107582),('Aruba','de','',1614107582,1614107582),('Aruba','en','',1614107582,1614107582),('Aruba','es','',1614107582,1614107582),('Aruba','fa','',1614107582,1614107582),('Aruba','fr','',1614107582,1614107582),('Aruba','hu','',1614107582,1614107582),('Aruba','it','',1614107582,1614107582),('Aruba','ja','',1614107582,1614107582),('Aruba','nl','',1614107582,1614107582),('Aruba','pl','',1614107582,1614107582),('Aruba','pt_BR','',1614107582,1614107582),('Aruba','ru','',1614107582,1614107582),('Aruba','sk','',1614107582,1614107582),('Aruba','sv','',1614107582,1614107582),('Aruba','sv_FI','',1614107582,1614107582),('Aruba','th','',1614107582,1614107582),('Aruba','tr','',1614107582,1614107582),('Aruba','uk','',1614107582,1614107582),('Aruba','zh_Hans','',1614107582,1614107582),('Australia','cs','',1614107582,1614107582),('Australia','de','',1614107582,1614107582),('Australia','en','',1614107582,1614107582),('Australia','es','',1614107582,1614107582),('Australia','fa','',1614107582,1614107582),('Australia','fr','',1614107582,1614107582),('Australia','hu','',1614107582,1614107582),('Australia','it','',1614107582,1614107582),('Australia','ja','',1614107582,1614107582),('Australia','nl','',1614107582,1614107582),('Australia','pl','',1614107582,1614107582),('Australia','pt_BR','',1614107582,1614107582),('Australia','ru','',1614107582,1614107582),('Australia','sk','',1614107582,1614107582),('Australia','sv','',1614107582,1614107582),('Australia','sv_FI','',1614107582,1614107582),('Australia','th','',1614107582,1614107582),('Australia','tr','',1614107582,1614107582),('Australia','uk','',1614107582,1614107582),('Australia','zh_Hans','',1614107582,1614107582),('Austria','cs','',1614107582,1614107582),('Austria','de','',1614107582,1614107582),('Austria','en','',1614107582,1614107582),('Austria','es','',1614107582,1614107582),('Austria','fa','',1614107582,1614107582),('Austria','fr','',1614107582,1614107582),('Austria','hu','',1614107582,1614107582),('Austria','it','',1614107582,1614107582),('Austria','ja','',1614107582,1614107582),('Austria','nl','',1614107582,1614107582),('Austria','pl','',1614107582,1614107582),('Austria','pt_BR','',1614107582,1614107582),('Austria','ru','',1614107582,1614107582),('Austria','sk','',1614107582,1614107582),('Austria','sv','',1614107582,1614107582),('Austria','sv_FI','',1614107582,1614107582),('Austria','th','',1614107582,1614107582),('Austria','tr','',1614107582,1614107582),('Austria','uk','',1614107582,1614107582),('Austria','zh_Hans','',1614107582,1614107582),('Azerbaijan','cs','',1614107582,1614107582),('Azerbaijan','de','',1614107582,1614107582),('Azerbaijan','en','',1614107582,1614107582),('Azerbaijan','es','',1614107582,1614107582),('Azerbaijan','fa','',1614107582,1614107582),('Azerbaijan','fr','',1614107582,1614107582),('Azerbaijan','hu','',1614107582,1614107582),('Azerbaijan','it','',1614107582,1614107582),('Azerbaijan','ja','',1614107582,1614107582),('Azerbaijan','nl','',1614107582,1614107582),('Azerbaijan','pl','',1614107582,1614107582),('Azerbaijan','pt_BR','',1614107582,1614107582),('Azerbaijan','ru','',1614107582,1614107582),('Azerbaijan','sk','',1614107582,1614107582),('Azerbaijan','sv','',1614107582,1614107582),('Azerbaijan','sv_FI','',1614107582,1614107582),('Azerbaijan','th','',1614107582,1614107582),('Azerbaijan','tr','',1614107582,1614107582),('Azerbaijan','uk','',1614107582,1614107582),('Azerbaijan','zh_Hans','',1614107582,1614107582),('Bahamas','cs','',1614107582,1614107582),('Bahamas','de','',1614107582,1614107582),('Bahamas','en','',1614107582,1614107582),('Bahamas','es','',1614107582,1614107582),('Bahamas','fa','',1614107582,1614107582),('Bahamas','fr','',1614107582,1614107582),('Bahamas','hu','',1614107582,1614107582),('Bahamas','it','',1614107582,1614107582),('Bahamas','ja','',1614107582,1614107582),('Bahamas','nl','',1614107582,1614107582),('Bahamas','pl','',1614107582,1614107582),('Bahamas','pt_BR','',1614107582,1614107582),('Bahamas','ru','',1614107582,1614107582),('Bahamas','sk','',1614107582,1614107582),('Bahamas','sv','',1614107582,1614107582),('Bahamas','sv_FI','',1614107582,1614107582),('Bahamas','th','',1614107582,1614107582),('Bahamas','tr','',1614107582,1614107582),('Bahamas','uk','',1614107582,1614107582),('Bahamas','zh_Hans','',1614107582,1614107582),('Bahrain','cs','',1614107582,1614107582),('Bahrain','de','',1614107582,1614107582),('Bahrain','en','',1614107582,1614107582),('Bahrain','es','',1614107582,1614107582),('Bahrain','fa','',1614107582,1614107582),('Bahrain','fr','',1614107582,1614107582),('Bahrain','hu','',1614107582,1614107582),('Bahrain','it','',1614107582,1614107582),('Bahrain','ja','',1614107582,1614107582),('Bahrain','nl','',1614107582,1614107582),('Bahrain','pl','',1614107582,1614107582),('Bahrain','pt_BR','',1614107582,1614107582),('Bahrain','ru','',1614107582,1614107582),('Bahrain','sk','',1614107582,1614107582),('Bahrain','sv','',1614107582,1614107582),('Bahrain','sv_FI','',1614107582,1614107582),('Bahrain','th','',1614107582,1614107582),('Bahrain','tr','',1614107582,1614107582),('Bahrain','uk','',1614107582,1614107582),('Bahrain','zh_Hans','',1614107582,1614107582),('Bangla','cs','',1614107615,1614107615),('Bangla','de','',1614107615,1614107615),('Bangla','en','',1614107615,1614107615),('Bangla','es','',1614107615,1614107615),('Bangla','fa','',1614107615,1614107615),('Bangla','fr','',1614107615,1614107615),('Bangla','hu','',1614107615,1614107615),('Bangla','it','',1614107615,1614107615),('Bangla','ja','',1614107615,1614107615),('Bangla','nl','',1614107615,1614107615),('Bangla','pl','',1614107615,1614107615),('Bangla','pt_BR','',1614107615,1614107615),('Bangla','ru','',1614107615,1614107615),('Bangla','sk','',1614107615,1614107615),('Bangla','sv','',1614107615,1614107615),('Bangla','sv_FI','',1614107615,1614107615),('Bangla','th','',1614107615,1614107615),('Bangla','tr','',1614107615,1614107615),('Bangla','uk','',1614107615,1614107615),('Bangla','zh_Hans','',1614107615,1614107615),('Bangladesh','cs','',1614107582,1614107582),('Bangladesh','de','',1614107582,1614107582),('Bangladesh','en','',1614107582,1614107582),('Bangladesh','es','',1614107582,1614107582),('Bangladesh','fa','',1614107582,1614107582),('Bangladesh','fr','',1614107582,1614107582),('Bangladesh','hu','',1614107582,1614107582),('Bangladesh','it','',1614107582,1614107582),('Bangladesh','ja','',1614107582,1614107582),('Bangladesh','nl','',1614107582,1614107582),('Bangladesh','pl','',1614107582,1614107582),('Bangladesh','pt_BR','',1614107582,1614107582),('Bangladesh','ru','',1614107582,1614107582),('Bangladesh','sk','',1614107582,1614107582),('Bangladesh','sv','',1614107582,1614107582),('Bangladesh','sv_FI','',1614107582,1614107582),('Bangladesh','th','',1614107582,1614107582),('Bangladesh','tr','',1614107582,1614107582),('Bangladesh','uk','',1614107582,1614107582),('Bangladesh','zh_Hans','',1614107582,1614107582),('Barbados','cs','',1614107582,1614107582),('Barbados','de','',1614107582,1614107582),('Barbados','en','',1614107582,1614107582),('Barbados','es','',1614107582,1614107582),('Barbados','fa','',1614107582,1614107582),('Barbados','fr','',1614107582,1614107582),('Barbados','hu','',1614107582,1614107582),('Barbados','it','',1614107582,1614107582),('Barbados','ja','',1614107582,1614107582),('Barbados','nl','',1614107582,1614107582),('Barbados','pl','',1614107582,1614107582),('Barbados','pt_BR','',1614107582,1614107582),('Barbados','ru','',1614107582,1614107582),('Barbados','sk','',1614107582,1614107582),('Barbados','sv','',1614107582,1614107582),('Barbados','sv_FI','',1614107582,1614107582),('Barbados','th','',1614107582,1614107582),('Barbados','tr','',1614107582,1614107582),('Barbados','uk','',1614107582,1614107582),('Barbados','zh_Hans','',1614107582,1614107582),('Belarus','cs','',1614107582,1614107582),('Belarus','de','',1614107582,1614107582),('Belarus','en','',1614107582,1614107582),('Belarus','es','',1614107582,1614107582),('Belarus','fa','',1614107582,1614107582),('Belarus','fr','',1614107582,1614107582),('Belarus','hu','',1614107582,1614107582),('Belarus','it','',1614107582,1614107582),('Belarus','ja','',1614107582,1614107582),('Belarus','nl','',1614107582,1614107582),('Belarus','pl','',1614107582,1614107582),('Belarus','pt_BR','',1614107582,1614107582),('Belarus','ru','',1614107582,1614107582),('Belarus','sk','',1614107582,1614107582),('Belarus','sv','',1614107582,1614107582),('Belarus','sv_FI','',1614107582,1614107582),('Belarus','th','',1614107582,1614107582),('Belarus','tr','',1614107582,1614107582),('Belarus','uk','',1614107582,1614107582),('Belarus','zh_Hans','',1614107582,1614107582),('Belgium','cs','',1614107583,1614107583),('Belgium','de','',1614107583,1614107583),('Belgium','en','',1614107583,1614107583),('Belgium','es','',1614107583,1614107583),('Belgium','fa','',1614107583,1614107583),('Belgium','fr','',1614107583,1614107583),('Belgium','hu','',1614107583,1614107583),('Belgium','it','',1614107583,1614107583),('Belgium','ja','',1614107583,1614107583),('Belgium','nl','',1614107583,1614107583),('Belgium','pl','',1614107583,1614107583),('Belgium','pt_BR','',1614107583,1614107583),('Belgium','ru','',1614107583,1614107583),('Belgium','sk','',1614107583,1614107583),('Belgium','sv','',1614107583,1614107583),('Belgium','sv_FI','',1614107583,1614107583),('Belgium','th','',1614107583,1614107583),('Belgium','tr','',1614107583,1614107583),('Belgium','uk','',1614107583,1614107583),('Belgium','zh_Hans','',1614107583,1614107583),('Belize','cs','',1614107583,1614107583),('Belize','de','',1614107583,1614107583),('Belize','en','',1614107583,1614107583),('Belize','es','',1614107583,1614107583),('Belize','fa','',1614107583,1614107583),('Belize','fr','',1614107583,1614107583),('Belize','hu','',1614107583,1614107583),('Belize','it','',1614107583,1614107583),('Belize','ja','',1614107583,1614107583),('Belize','nl','',1614107583,1614107583),('Belize','pl','',1614107583,1614107583),('Belize','pt_BR','',1614107583,1614107583),('Belize','ru','',1614107583,1614107583),('Belize','sk','',1614107583,1614107583),('Belize','sv','',1614107583,1614107583),('Belize','sv_FI','',1614107583,1614107583),('Belize','th','',1614107583,1614107583),('Belize','tr','',1614107583,1614107583),('Belize','uk','',1614107583,1614107583),('Belize','zh_Hans','',1614107583,1614107583),('Benin','cs','',1614107583,1614107583),('Benin','de','',1614107583,1614107583),('Benin','en','',1614107583,1614107583),('Benin','es','',1614107583,1614107583),('Benin','fa','',1614107583,1614107583),('Benin','fr','',1614107583,1614107583),('Benin','hu','',1614107583,1614107583),('Benin','it','',1614107583,1614107583),('Benin','ja','',1614107583,1614107583),('Benin','nl','',1614107583,1614107583),('Benin','pl','',1614107583,1614107583),('Benin','pt_BR','',1614107583,1614107583),('Benin','ru','',1614107583,1614107583),('Benin','sk','',1614107583,1614107583),('Benin','sv','',1614107583,1614107583),('Benin','sv_FI','',1614107583,1614107583),('Benin','th','',1614107583,1614107583),('Benin','tr','',1614107583,1614107583),('Benin','uk','',1614107583,1614107583),('Benin','zh_Hans','',1614107583,1614107583),('Bermuda','cs','',1614107583,1614107583),('Bermuda','de','',1614107583,1614107583),('Bermuda','en','',1614107583,1614107583),('Bermuda','es','',1614107583,1614107583),('Bermuda','fa','',1614107583,1614107583),('Bermuda','fr','',1614107583,1614107583),('Bermuda','hu','',1614107583,1614107583),('Bermuda','it','',1614107583,1614107583),('Bermuda','ja','',1614107583,1614107583),('Bermuda','nl','',1614107583,1614107583),('Bermuda','pl','',1614107583,1614107583),('Bermuda','pt_BR','',1614107583,1614107583),('Bermuda','ru','',1614107583,1614107583),('Bermuda','sk','',1614107583,1614107583),('Bermuda','sv','',1614107583,1614107583),('Bermuda','sv_FI','',1614107583,1614107583),('Bermuda','th','',1614107583,1614107583),('Bermuda','tr','',1614107583,1614107583),('Bermuda','uk','',1614107583,1614107583),('Bermuda','zh_Hans','',1614107583,1614107583),('Bhutan','cs','',1614107583,1614107583),('Bhutan','de','',1614107583,1614107583),('Bhutan','en','',1614107583,1614107583),('Bhutan','es','',1614107583,1614107583),('Bhutan','fa','',1614107583,1614107583),('Bhutan','fr','',1614107583,1614107583),('Bhutan','hu','',1614107583,1614107583),('Bhutan','it','',1614107583,1614107583),('Bhutan','ja','',1614107583,1614107583),('Bhutan','nl','',1614107583,1614107583),('Bhutan','pl','',1614107583,1614107583),('Bhutan','pt_BR','',1614107583,1614107583),('Bhutan','ru','',1614107583,1614107583),('Bhutan','sk','',1614107583,1614107583),('Bhutan','sv','',1614107583,1614107583),('Bhutan','sv_FI','',1614107583,1614107583),('Bhutan','th','',1614107583,1614107583),('Bhutan','tr','',1614107583,1614107583),('Bhutan','uk','',1614107583,1614107583),('Bhutan','zh_Hans','',1614107583,1614107583),('Bleach Wash','cs','',1614088789,1614088789),('Bleach Wash','de','',1614088789,1614088789),('Bleach Wash','en','',1614088789,1614088789),('Bleach Wash','es','',1614088789,1614088789),('Bleach Wash','fa','',1614088789,1614088789),('Bleach Wash','fr','',1614088789,1614088789),('Bleach Wash','hu','',1614088789,1614088789),('Bleach Wash','it','',1614088789,1614088789),('Bleach Wash','ja','',1614088789,1614088789),('Bleach Wash','nl','',1614088789,1614088789),('Bleach Wash','pl','',1614088789,1614088789),('Bleach Wash','pt_BR','',1614088789,1614088789),('Bleach Wash','ru','',1614088789,1614088789),('Bleach Wash','sk','',1614088789,1614088789),('Bleach Wash','sv','',1614088789,1614088789),('Bleach Wash','sv_FI','',1614088789,1614088789),('Bleach Wash','th','',1614088789,1614088789),('Bleach Wash','tr','',1614088789,1614088789),('Bleach Wash','uk','',1614088789,1614088789),('Bleach Wash','zh_Hans','',1614088789,1614088789),('Boat Neck','cs','',1614107399,1614107399),('Boat Neck','de','',1614107399,1614107399),('Boat Neck','en','',1614107399,1614107399),('Boat Neck','es','',1614107399,1614107399),('Boat Neck','fa','',1614107399,1614107399),('Boat Neck','fr','',1614107399,1614107399),('Boat Neck','hu','',1614107399,1614107399),('Boat Neck','it','',1614107399,1614107399),('Boat Neck','ja','',1614107399,1614107399),('Boat Neck','nl','',1614107399,1614107399),('Boat Neck','pl','',1614107399,1614107399),('Boat Neck','pt_BR','',1614107399,1614107399),('Boat Neck','ru','',1614107399,1614107399),('Boat Neck','sk','',1614107399,1614107399),('Boat Neck','sv','',1614107399,1614107399),('Boat Neck','sv_FI','',1614107399,1614107399),('Boat Neck','th','',1614107399,1614107399),('Boat Neck','tr','',1614107399,1614107399),('Boat Neck','uk','',1614107399,1614107399),('Boat Neck','zh_Hans','',1614107399,1614107399),('Bolivia','cs','',1614107583,1614107583),('Bolivia','de','',1614107583,1614107583),('Bolivia','en','',1614107583,1614107583),('Bolivia','es','',1614107583,1614107583),('Bolivia','fa','',1614107583,1614107583),('Bolivia','fr','',1614107583,1614107583),('Bolivia','hu','',1614107583,1614107583),('Bolivia','it','',1614107583,1614107583),('Bolivia','ja','',1614107583,1614107583),('Bolivia','nl','',1614107583,1614107583),('Bolivia','pl','',1614107583,1614107583),('Bolivia','pt_BR','',1614107583,1614107583),('Bolivia','ru','',1614107583,1614107583),('Bolivia','sk','',1614107583,1614107583),('Bolivia','sv','',1614107583,1614107583),('Bolivia','sv_FI','',1614107583,1614107583),('Bolivia','th','',1614107583,1614107583),('Bolivia','tr','',1614107583,1614107583),('Bolivia','uk','',1614107583,1614107583),('Bolivia','zh_Hans','',1614107583,1614107583),('Bosnia & Herzegovina','cs','',1614107583,1614107583),('Bosnia & Herzegovina','de','',1614107583,1614107583),('Bosnia & Herzegovina','en','',1614107583,1614107583),('Bosnia & Herzegovina','es','',1614107583,1614107583),('Bosnia & Herzegovina','fa','',1614107583,1614107583),('Bosnia & Herzegovina','fr','',1614107583,1614107583),('Bosnia & Herzegovina','hu','',1614107583,1614107583),('Bosnia & Herzegovina','it','',1614107583,1614107583),('Bosnia & Herzegovina','ja','',1614107583,1614107583),('Bosnia & Herzegovina','nl','',1614107583,1614107583),('Bosnia & Herzegovina','pl','',1614107583,1614107583),('Bosnia & Herzegovina','pt_BR','',1614107583,1614107583),('Bosnia & Herzegovina','ru','',1614107583,1614107583),('Bosnia & Herzegovina','sk','',1614107583,1614107583),('Bosnia & Herzegovina','sv','',1614107583,1614107583),('Bosnia & Herzegovina','sv_FI','',1614107583,1614107583),('Bosnia & Herzegovina','th','',1614107583,1614107583),('Bosnia & Herzegovina','tr','',1614107583,1614107583),('Bosnia & Herzegovina','uk','',1614107583,1614107583),('Bosnia & Herzegovina','zh_Hans','',1614107583,1614107583),('Botswana','cs','',1614107583,1614107583),('Botswana','de','',1614107583,1614107583),('Botswana','en','',1614107583,1614107583),('Botswana','es','',1614107583,1614107583),('Botswana','fa','',1614107583,1614107583),('Botswana','fr','',1614107583,1614107583),('Botswana','hu','',1614107583,1614107583),('Botswana','it','',1614107583,1614107583),('Botswana','ja','',1614107583,1614107583),('Botswana','nl','',1614107583,1614107583),('Botswana','pl','',1614107583,1614107583),('Botswana','pt_BR','',1614107583,1614107583),('Botswana','ru','',1614107583,1614107583),('Botswana','sk','',1614107583,1614107583),('Botswana','sv','',1614107583,1614107583),('Botswana','sv_FI','',1614107583,1614107583),('Botswana','th','',1614107583,1614107583),('Botswana','tr','',1614107583,1614107583),('Botswana','uk','',1614107583,1614107583),('Botswana','zh_Hans','',1614107583,1614107583),('Bouvet Island','cs','',1614107583,1614107583),('Bouvet Island','de','',1614107583,1614107583),('Bouvet Island','en','',1614107583,1614107583),('Bouvet Island','es','',1614107583,1614107583),('Bouvet Island','fa','',1614107583,1614107583),('Bouvet Island','fr','',1614107583,1614107583),('Bouvet Island','hu','',1614107583,1614107583),('Bouvet Island','it','',1614107583,1614107583),('Bouvet Island','ja','',1614107583,1614107583),('Bouvet Island','nl','',1614107583,1614107583),('Bouvet Island','pl','',1614107583,1614107583),('Bouvet Island','pt_BR','',1614107583,1614107583),('Bouvet Island','ru','',1614107583,1614107583),('Bouvet Island','sk','',1614107583,1614107583),('Bouvet Island','sv','',1614107583,1614107583),('Bouvet Island','sv_FI','',1614107583,1614107583),('Bouvet Island','th','',1614107583,1614107583),('Bouvet Island','tr','',1614107583,1614107583),('Bouvet Island','uk','',1614107583,1614107583),('Bouvet Island','zh_Hans','',1614107583,1614107583),('Brand','cs','',1614106914,1614106914),('Brand','de','',1614106914,1614106914),('Brand','en','',1614106914,1614106914),('Brand','es','',1614106914,1614106914),('Brand','fa','',1614106914,1614106914),('Brand','fr','',1614106914,1614106914),('Brand','hu','',1614106914,1614106914),('Brand','it','',1614106914,1614106914),('Brand','ja','',1614106914,1614106914),('Brand','nl','',1614106914,1614106914),('Brand','pl','',1614106914,1614106914),('Brand','pt_BR','',1614106914,1614106914),('Brand','ru','',1614106914,1614106914),('Brand','sk','',1614106914,1614106914),('Brand','sv','',1614106914,1614106914),('Brand','sv_FI','',1614106914,1614106914),('Brand','th','',1614106914,1614106914),('Brand','tr','',1614106914,1614106914),('Brand','uk','',1614106914,1614106914),('Brand','zh_Hans','',1614106914,1614106914),('Brand Logo','cs','',1614075467,1614075467),('Brand Logo','de','',1614075467,1614075467),('Brand Logo','en','',1614075467,1614075467),('Brand Logo','es','',1614075467,1614075467),('Brand Logo','fa','',1614075467,1614075467),('Brand Logo','fr','',1614075467,1614075467),('Brand Logo','hu','',1614075467,1614075467),('Brand Logo','it','',1614075467,1614075467),('Brand Logo','ja','',1614075467,1614075467),('Brand Logo','nl','',1614075467,1614075467),('Brand Logo','pl','',1614075467,1614075467),('Brand Logo','pt_BR','',1614075467,1614075467),('Brand Logo','ru','',1614075467,1614075467),('Brand Logo','sk','',1614075467,1614075467),('Brand Logo','sv','',1614075467,1614075467),('Brand Logo','sv_FI','',1614075467,1614075467),('Brand Logo','th','',1614075467,1614075467),('Brand Logo','tr','',1614075467,1614075467),('Brand Logo','uk','',1614075467,1614075467),('Brand Logo','zh_Hans','',1614075467,1614075467),('Brazil','cs','',1614107584,1614107584),('Brazil','de','',1614107584,1614107584),('Brazil','en','',1614107584,1614107584),('Brazil','es','',1614107584,1614107584),('Brazil','fa','',1614107584,1614107584),('Brazil','fr','',1614107584,1614107584),('Brazil','hu','',1614107584,1614107584),('Brazil','it','',1614107584,1614107584),('Brazil','ja','',1614107584,1614107584),('Brazil','nl','',1614107584,1614107584),('Brazil','pl','',1614107584,1614107584),('Brazil','pt_BR','',1614107584,1614107584),('Brazil','ru','',1614107584,1614107584),('Brazil','sk','',1614107584,1614107584),('Brazil','sv','',1614107584,1614107584),('Brazil','sv_FI','',1614107584,1614107584),('Brazil','th','',1614107584,1614107584),('Brazil','tr','',1614107584,1614107584),('Brazil','uk','',1614107584,1614107584),('Brazil','zh_Hans','',1614107584,1614107584),('British Indian Ocean Territory','cs','',1614107584,1614107584),('British Indian Ocean Territory','de','',1614107584,1614107584),('British Indian Ocean Territory','en','',1614107584,1614107584),('British Indian Ocean Territory','es','',1614107584,1614107584),('British Indian Ocean Territory','fa','',1614107584,1614107584),('British Indian Ocean Territory','fr','',1614107584,1614107584),('British Indian Ocean Territory','hu','',1614107584,1614107584),('British Indian Ocean Territory','it','',1614107584,1614107584),('British Indian Ocean Territory','ja','',1614107584,1614107584),('British Indian Ocean Territory','nl','',1614107584,1614107584),('British Indian Ocean Territory','pl','',1614107584,1614107584),('British Indian Ocean Territory','pt_BR','',1614107584,1614107584),('British Indian Ocean Territory','ru','',1614107584,1614107584),('British Indian Ocean Territory','sk','',1614107584,1614107584),('British Indian Ocean Territory','sv','',1614107584,1614107584),('British Indian Ocean Territory','sv_FI','',1614107584,1614107584),('British Indian Ocean Territory','th','',1614107584,1614107584),('British Indian Ocean Territory','tr','',1614107584,1614107584),('British Indian Ocean Territory','uk','',1614107584,1614107584),('British Indian Ocean Territory','zh_Hans','',1614107584,1614107584),('British Virgin Islands','cs','',1614107584,1614107584),('British Virgin Islands','de','',1614107584,1614107584),('British Virgin Islands','en','',1614107584,1614107584),('British Virgin Islands','es','',1614107584,1614107584),('British Virgin Islands','fa','',1614107584,1614107584),('British Virgin Islands','fr','',1614107584,1614107584),('British Virgin Islands','hu','',1614107584,1614107584),('British Virgin Islands','it','',1614107584,1614107584),('British Virgin Islands','ja','',1614107584,1614107584),('British Virgin Islands','nl','',1614107584,1614107584),('British Virgin Islands','pl','',1614107584,1614107584),('British Virgin Islands','pt_BR','',1614107584,1614107584),('British Virgin Islands','ru','',1614107584,1614107584),('British Virgin Islands','sk','',1614107584,1614107584),('British Virgin Islands','sv','',1614107584,1614107584),('British Virgin Islands','sv_FI','',1614107584,1614107584),('British Virgin Islands','th','',1614107584,1614107584),('British Virgin Islands','tr','',1614107584,1614107584),('British Virgin Islands','uk','',1614107584,1614107584),('British Virgin Islands','zh_Hans','',1614107584,1614107584),('Brunei','cs','',1614107584,1614107584),('Brunei','de','',1614107584,1614107584),('Brunei','en','',1614107584,1614107584),('Brunei','es','',1614107584,1614107584),('Brunei','fa','',1614107584,1614107584),('Brunei','fr','',1614107584,1614107584),('Brunei','hu','',1614107584,1614107584),('Brunei','it','',1614107584,1614107584),('Brunei','ja','',1614107584,1614107584),('Brunei','nl','',1614107584,1614107584),('Brunei','pl','',1614107584,1614107584),('Brunei','pt_BR','',1614107584,1614107584),('Brunei','ru','',1614107584,1614107584),('Brunei','sk','',1614107584,1614107584),('Brunei','sv','',1614107584,1614107584),('Brunei','sv_FI','',1614107584,1614107584),('Brunei','th','',1614107584,1614107584),('Brunei','tr','',1614107584,1614107584),('Brunei','uk','',1614107584,1614107584),('Brunei','zh_Hans','',1614107584,1614107584),('Bulgaria','cs','',1614107584,1614107584),('Bulgaria','de','',1614107584,1614107584),('Bulgaria','en','',1614107584,1614107584),('Bulgaria','es','',1614107584,1614107584),('Bulgaria','fa','',1614107584,1614107584),('Bulgaria','fr','',1614107584,1614107584),('Bulgaria','hu','',1614107584,1614107584),('Bulgaria','it','',1614107584,1614107584),('Bulgaria','ja','',1614107584,1614107584),('Bulgaria','nl','',1614107584,1614107584),('Bulgaria','pl','',1614107584,1614107584),('Bulgaria','pt_BR','',1614107584,1614107584),('Bulgaria','ru','',1614107584,1614107584),('Bulgaria','sk','',1614107584,1614107584),('Bulgaria','sv','',1614107584,1614107584),('Bulgaria','sv_FI','',1614107584,1614107584),('Bulgaria','th','',1614107584,1614107584),('Bulgaria','tr','',1614107584,1614107584),('Bulgaria','uk','',1614107584,1614107584),('Bulgaria','zh_Hans','',1614107584,1614107584),('Burkina Faso','cs','',1614107584,1614107584),('Burkina Faso','de','',1614107584,1614107584),('Burkina Faso','en','',1614107584,1614107584),('Burkina Faso','es','',1614107584,1614107584),('Burkina Faso','fa','',1614107584,1614107584),('Burkina Faso','fr','',1614107584,1614107584),('Burkina Faso','hu','',1614107584,1614107584),('Burkina Faso','it','',1614107584,1614107584),('Burkina Faso','ja','',1614107584,1614107584),('Burkina Faso','nl','',1614107584,1614107584),('Burkina Faso','pl','',1614107584,1614107584),('Burkina Faso','pt_BR','',1614107584,1614107584),('Burkina Faso','ru','',1614107584,1614107584),('Burkina Faso','sk','',1614107584,1614107584),('Burkina Faso','sv','',1614107584,1614107584),('Burkina Faso','sv_FI','',1614107584,1614107584),('Burkina Faso','th','',1614107584,1614107584),('Burkina Faso','tr','',1614107584,1614107584),('Burkina Faso','uk','',1614107584,1614107584),('Burkina Faso','zh_Hans','',1614107584,1614107584),('Burundi','cs','',1614107584,1614107584),('Burundi','de','',1614107584,1614107584),('Burundi','en','',1614107584,1614107584),('Burundi','es','',1614107584,1614107584),('Burundi','fa','',1614107584,1614107584),('Burundi','fr','',1614107584,1614107584),('Burundi','hu','',1614107584,1614107584),('Burundi','it','',1614107584,1614107584),('Burundi','ja','',1614107584,1614107584),('Burundi','nl','',1614107584,1614107584),('Burundi','pl','',1614107584,1614107584),('Burundi','pt_BR','',1614107584,1614107584),('Burundi','ru','',1614107584,1614107584),('Burundi','sk','',1614107584,1614107584),('Burundi','sv','',1614107584,1614107584),('Burundi','sv_FI','',1614107584,1614107584),('Burundi','th','',1614107584,1614107584),('Burundi','tr','',1614107584,1614107584),('Burundi','uk','',1614107584,1614107584),('Burundi','zh_Hans','',1614107584,1614107584),('Cambodia','cs','',1614107585,1614107585),('Cambodia','de','',1614107585,1614107585),('Cambodia','en','',1614107585,1614107585),('Cambodia','es','',1614107585,1614107585),('Cambodia','fa','',1614107585,1614107585),('Cambodia','fr','',1614107585,1614107585),('Cambodia','hu','',1614107585,1614107585),('Cambodia','it','',1614107585,1614107585),('Cambodia','ja','',1614107585,1614107585),('Cambodia','nl','',1614107585,1614107585),('Cambodia','pl','',1614107585,1614107585),('Cambodia','pt_BR','',1614107585,1614107585),('Cambodia','ru','',1614107585,1614107585),('Cambodia','sk','',1614107585,1614107585),('Cambodia','sv','',1614107585,1614107585),('Cambodia','sv_FI','',1614107585,1614107585),('Cambodia','th','',1614107585,1614107585),('Cambodia','tr','',1614107585,1614107585),('Cambodia','uk','',1614107585,1614107585),('Cambodia','zh_Hans','',1614107585,1614107585),('Cameroon','cs','',1614107585,1614107585),('Cameroon','de','',1614107585,1614107585),('Cameroon','en','',1614107585,1614107585),('Cameroon','es','',1614107585,1614107585),('Cameroon','fa','',1614107585,1614107585),('Cameroon','fr','',1614107585,1614107585),('Cameroon','hu','',1614107585,1614107585),('Cameroon','it','',1614107585,1614107585),('Cameroon','ja','',1614107585,1614107585),('Cameroon','nl','',1614107585,1614107585),('Cameroon','pl','',1614107585,1614107585),('Cameroon','pt_BR','',1614107585,1614107585),('Cameroon','ru','',1614107585,1614107585),('Cameroon','sk','',1614107585,1614107585),('Cameroon','sv','',1614107585,1614107585),('Cameroon','sv_FI','',1614107585,1614107585),('Cameroon','th','',1614107585,1614107585),('Cameroon','tr','',1614107585,1614107585),('Cameroon','uk','',1614107585,1614107585),('Cameroon','zh_Hans','',1614107585,1614107585),('Canada','cs','',1614107585,1614107585),('Canada','de','',1614107585,1614107585),('Canada','en','',1614107585,1614107585),('Canada','es','',1614107585,1614107585),('Canada','fa','',1614107585,1614107585),('Canada','fr','',1614107585,1614107585),('Canada','hu','',1614107585,1614107585),('Canada','it','',1614107585,1614107585),('Canada','ja','',1614107585,1614107585),('Canada','nl','',1614107585,1614107585),('Canada','pl','',1614107585,1614107585),('Canada','pt_BR','',1614107585,1614107585),('Canada','ru','',1614107585,1614107585),('Canada','sk','',1614107585,1614107585),('Canada','sv','',1614107585,1614107585),('Canada','sv_FI','',1614107585,1614107585),('Canada','th','',1614107585,1614107585),('Canada','tr','',1614107585,1614107585),('Canada','uk','',1614107585,1614107585),('Canada','zh_Hans','',1614107585,1614107585),('Cape Verde','cs','',1614107585,1614107585),('Cape Verde','de','',1614107585,1614107585),('Cape Verde','en','',1614107585,1614107585),('Cape Verde','es','',1614107585,1614107585),('Cape Verde','fa','',1614107585,1614107585),('Cape Verde','fr','',1614107585,1614107585),('Cape Verde','hu','',1614107585,1614107585),('Cape Verde','it','',1614107585,1614107585),('Cape Verde','ja','',1614107585,1614107585),('Cape Verde','nl','',1614107585,1614107585),('Cape Verde','pl','',1614107585,1614107585),('Cape Verde','pt_BR','',1614107585,1614107585),('Cape Verde','ru','',1614107585,1614107585),('Cape Verde','sk','',1614107585,1614107585),('Cape Verde','sv','',1614107585,1614107585),('Cape Verde','sv_FI','',1614107585,1614107585),('Cape Verde','th','',1614107585,1614107585),('Cape Verde','tr','',1614107585,1614107585),('Cape Verde','uk','',1614107585,1614107585),('Cape Verde','zh_Hans','',1614107585,1614107585),('Caribbean Netherlands','cs','',1614107585,1614107585),('Caribbean Netherlands','de','',1614107585,1614107585),('Caribbean Netherlands','en','',1614107585,1614107585),('Caribbean Netherlands','es','',1614107585,1614107585),('Caribbean Netherlands','fa','',1614107585,1614107585),('Caribbean Netherlands','fr','',1614107585,1614107585),('Caribbean Netherlands','hu','',1614107585,1614107585),('Caribbean Netherlands','it','',1614107585,1614107585),('Caribbean Netherlands','ja','',1614107585,1614107585),('Caribbean Netherlands','nl','',1614107585,1614107585),('Caribbean Netherlands','pl','',1614107585,1614107585),('Caribbean Netherlands','pt_BR','',1614107585,1614107585),('Caribbean Netherlands','ru','',1614107585,1614107585),('Caribbean Netherlands','sk','',1614107585,1614107585),('Caribbean Netherlands','sv','',1614107585,1614107585),('Caribbean Netherlands','sv_FI','',1614107585,1614107585),('Caribbean Netherlands','th','',1614107585,1614107585),('Caribbean Netherlands','tr','',1614107585,1614107585),('Caribbean Netherlands','uk','',1614107585,1614107585),('Caribbean Netherlands','zh_Hans','',1614107585,1614107585),('Caustic Wash','cs','',1614088789,1614088789),('Caustic Wash','de','',1614088789,1614088789),('Caustic Wash','en','',1614088789,1614088789),('Caustic Wash','es','',1614088789,1614088789),('Caustic Wash','fa','',1614088789,1614088789),('Caustic Wash','fr','',1614088789,1614088789),('Caustic Wash','hu','',1614088789,1614088789),('Caustic Wash','it','',1614088789,1614088789),('Caustic Wash','ja','',1614088789,1614088789),('Caustic Wash','nl','',1614088789,1614088789),('Caustic Wash','pl','',1614088789,1614088789),('Caustic Wash','pt_BR','',1614088789,1614088789),('Caustic Wash','ru','',1614088789,1614088789),('Caustic Wash','sk','',1614088789,1614088789),('Caustic Wash','sv','',1614088789,1614088789),('Caustic Wash','sv_FI','',1614088789,1614088789),('Caustic Wash','th','',1614088789,1614088789),('Caustic Wash','tr','',1614088789,1614088789),('Caustic Wash','uk','',1614088789,1614088789),('Caustic Wash','zh_Hans','',1614088789,1614088789),('Cayman Islands','cs','',1614107585,1614107585),('Cayman Islands','de','',1614107585,1614107585),('Cayman Islands','en','',1614107585,1614107585),('Cayman Islands','es','',1614107585,1614107585),('Cayman Islands','fa','',1614107585,1614107585),('Cayman Islands','fr','',1614107585,1614107585),('Cayman Islands','hu','',1614107585,1614107585),('Cayman Islands','it','',1614107585,1614107585),('Cayman Islands','ja','',1614107585,1614107585),('Cayman Islands','nl','',1614107585,1614107585),('Cayman Islands','pl','',1614107585,1614107585),('Cayman Islands','pt_BR','',1614107585,1614107585),('Cayman Islands','ru','',1614107585,1614107585),('Cayman Islands','sk','',1614107585,1614107585),('Cayman Islands','sv','',1614107585,1614107585),('Cayman Islands','sv_FI','',1614107585,1614107585),('Cayman Islands','th','',1614107585,1614107585),('Cayman Islands','tr','',1614107585,1614107585),('Cayman Islands','uk','',1614107585,1614107585),('Cayman Islands','zh_Hans','',1614107585,1614107585),('Central African Republic','cs','',1614107585,1614107585),('Central African Republic','de','',1614107585,1614107585),('Central African Republic','en','',1614107585,1614107585),('Central African Republic','es','',1614107585,1614107585),('Central African Republic','fa','',1614107585,1614107585),('Central African Republic','fr','',1614107585,1614107585),('Central African Republic','hu','',1614107585,1614107585),('Central African Republic','it','',1614107585,1614107585),('Central African Republic','ja','',1614107585,1614107585),('Central African Republic','nl','',1614107585,1614107585),('Central African Republic','pl','',1614107585,1614107585),('Central African Republic','pt_BR','',1614107585,1614107585),('Central African Republic','ru','',1614107585,1614107585),('Central African Republic','sk','',1614107585,1614107585),('Central African Republic','sv','',1614107585,1614107585),('Central African Republic','sv_FI','',1614107585,1614107585),('Central African Republic','th','',1614107585,1614107585),('Central African Republic','tr','',1614107585,1614107585),('Central African Republic','uk','',1614107585,1614107585),('Central African Republic','zh_Hans','',1614107585,1614107585),('Chad','cs','',1614107586,1614107586),('Chad','de','',1614107586,1614107586),('Chad','en','',1614107586,1614107586),('Chad','es','',1614107586,1614107586),('Chad','fa','',1614107586,1614107586),('Chad','fr','',1614107586,1614107586),('Chad','hu','',1614107586,1614107586),('Chad','it','',1614107586,1614107586),('Chad','ja','',1614107586,1614107586),('Chad','nl','',1614107586,1614107586),('Chad','pl','',1614107586,1614107586),('Chad','pt_BR','',1614107586,1614107586),('Chad','ru','',1614107586,1614107586),('Chad','sk','',1614107586,1614107586),('Chad','sv','',1614107586,1614107586),('Chad','sv_FI','',1614107586,1614107586),('Chad','th','',1614107586,1614107586),('Chad','tr','',1614107586,1614107586),('Chad','uk','',1614107586,1614107586),('Chad','zh_Hans','',1614107586,1614107586),('Checks','cs','',1614107615,1614107615),('Checks','de','',1614107615,1614107615),('Checks','en','',1614107615,1614107615),('Checks','es','',1614107615,1614107615),('Checks','fa','',1614107615,1614107615),('Checks','fr','',1614107615,1614107615),('Checks','hu','',1614107615,1614107615),('Checks','it','',1614107615,1614107615),('Checks','ja','',1614107615,1614107615),('Checks','nl','',1614107615,1614107615),('Checks','pl','',1614107615,1614107615),('Checks','pt_BR','',1614107615,1614107615),('Checks','ru','',1614107615,1614107615),('Checks','sk','',1614107615,1614107615),('Checks','sv','',1614107615,1614107615),('Checks','sv_FI','',1614107615,1614107615),('Checks','th','',1614107615,1614107615),('Checks','tr','',1614107615,1614107615),('Checks','uk','',1614107615,1614107615),('Checks','zh_Hans','',1614107615,1614107615),('Chile','cs','',1614107586,1614107586),('Chile','de','',1614107586,1614107586),('Chile','en','',1614107586,1614107586),('Chile','es','',1614107586,1614107586),('Chile','fa','',1614107586,1614107586),('Chile','fr','',1614107586,1614107586),('Chile','hu','',1614107586,1614107586),('Chile','it','',1614107586,1614107586),('Chile','ja','',1614107586,1614107586),('Chile','nl','',1614107586,1614107586),('Chile','pl','',1614107586,1614107586),('Chile','pt_BR','',1614107586,1614107586),('Chile','ru','',1614107586,1614107586),('Chile','sk','',1614107586,1614107586),('Chile','sv','',1614107586,1614107586),('Chile','sv_FI','',1614107586,1614107586),('Chile','th','',1614107586,1614107586),('Chile','tr','',1614107586,1614107586),('Chile','uk','',1614107586,1614107586),('Chile','zh_Hans','',1614107586,1614107586),('China','cs','',1614107586,1614107586),('China','de','',1614107586,1614107586),('China','en','',1614107586,1614107586),('China','es','',1614107586,1614107586),('China','fa','',1614107586,1614107586),('China','fr','',1614107586,1614107586),('China','hu','',1614107586,1614107586),('China','it','',1614107586,1614107586),('China','ja','',1614107586,1614107586),('China','nl','',1614107586,1614107586),('China','pl','',1614107586,1614107586),('China','pt_BR','',1614107586,1614107586),('China','ru','',1614107586,1614107586),('China','sk','',1614107586,1614107586),('China','sv','',1614107586,1614107586),('China','sv_FI','',1614107586,1614107586),('China','th','',1614107586,1614107586),('China','tr','',1614107586,1614107586),('China','uk','',1614107586,1614107586),('China','zh_Hans','',1614107586,1614107586),('Christmas Island','cs','',1614107586,1614107586),('Christmas Island','de','',1614107586,1614107586),('Christmas Island','en','',1614107586,1614107586),('Christmas Island','es','',1614107586,1614107586),('Christmas Island','fa','',1614107586,1614107586),('Christmas Island','fr','',1614107586,1614107586),('Christmas Island','hu','',1614107586,1614107586),('Christmas Island','it','',1614107586,1614107586),('Christmas Island','ja','',1614107586,1614107586),('Christmas Island','nl','',1614107586,1614107586),('Christmas Island','pl','',1614107586,1614107586),('Christmas Island','pt_BR','',1614107586,1614107586),('Christmas Island','ru','',1614107586,1614107586),('Christmas Island','sk','',1614107586,1614107586),('Christmas Island','sv','',1614107586,1614107586),('Christmas Island','sv_FI','',1614107586,1614107586),('Christmas Island','th','',1614107586,1614107586),('Christmas Island','tr','',1614107586,1614107586),('Christmas Island','uk','',1614107586,1614107586),('Christmas Island','zh_Hans','',1614107586,1614107586),('Classification','cs','',1614106914,1614106914),('Classification','de','',1614106914,1614106914),('Classification','en','',1614106914,1614106914),('Classification','es','',1614106914,1614106914),('Classification','fa','',1614106914,1614106914),('Classification','fr','',1614106914,1614106914),('Classification','hu','',1614106914,1614106914),('Classification','it','',1614106914,1614106914),('Classification','ja','',1614106914,1614106914),('Classification','nl','',1614106914,1614106914),('Classification','pl','',1614106914,1614106914),('Classification','pt_BR','',1614106914,1614106914),('Classification','ru','',1614106914,1614106914),('Classification','sk','',1614106914,1614106914),('Classification','sv','',1614106914,1614106914),('Classification','sv_FI','',1614106914,1614106914),('Classification','th','',1614106914,1614106914),('Classification','tr','',1614106914,1614106914),('Classification','uk','',1614106914,1614106914),('Classification','zh_Hans','',1614106914,1614106914),('Cocos (Keeling) Islands','cs','',1614107586,1614107586),('Cocos (Keeling) Islands','de','',1614107586,1614107586),('Cocos (Keeling) Islands','en','',1614107586,1614107586),('Cocos (Keeling) Islands','es','',1614107586,1614107586),('Cocos (Keeling) Islands','fa','',1614107586,1614107586),('Cocos (Keeling) Islands','fr','',1614107586,1614107586),('Cocos (Keeling) Islands','hu','',1614107586,1614107586),('Cocos (Keeling) Islands','it','',1614107586,1614107586),('Cocos (Keeling) Islands','ja','',1614107586,1614107586),('Cocos (Keeling) Islands','nl','',1614107586,1614107586),('Cocos (Keeling) Islands','pl','',1614107586,1614107586),('Cocos (Keeling) Islands','pt_BR','',1614107586,1614107586),('Cocos (Keeling) Islands','ru','',1614107586,1614107586),('Cocos (Keeling) Islands','sk','',1614107586,1614107586),('Cocos (Keeling) Islands','sv','',1614107586,1614107586),('Cocos (Keeling) Islands','sv_FI','',1614107586,1614107586),('Cocos (Keeling) Islands','th','',1614107586,1614107586),('Cocos (Keeling) Islands','tr','',1614107586,1614107586),('Cocos (Keeling) Islands','uk','',1614107586,1614107586),('Cocos (Keeling) Islands','zh_Hans','',1614107586,1614107586),('Colombia','cs','',1614107586,1614107586),('Colombia','de','',1614107586,1614107586),('Colombia','en','',1614107586,1614107586),('Colombia','es','',1614107586,1614107586),('Colombia','fa','',1614107586,1614107586),('Colombia','fr','',1614107586,1614107586),('Colombia','hu','',1614107586,1614107586),('Colombia','it','',1614107586,1614107586),('Colombia','ja','',1614107586,1614107586),('Colombia','nl','',1614107586,1614107586),('Colombia','pl','',1614107586,1614107586),('Colombia','pt_BR','',1614107586,1614107586),('Colombia','ru','',1614107586,1614107586),('Colombia','sk','',1614107586,1614107586),('Colombia','sv','',1614107586,1614107586),('Colombia','sv_FI','',1614107586,1614107586),('Colombia','th','',1614107586,1614107586),('Colombia','tr','',1614107586,1614107586),('Colombia','uk','',1614107586,1614107586),('Colombia','zh_Hans','',1614107586,1614107586),('Color','cs','',1614107692,1614107692),('Color','de','',1614107692,1614107692),('Color','en','',1614107692,1614107692),('Color','es','',1614107692,1614107692),('Color','fa','',1614107692,1614107692),('Color','fr','',1614107692,1614107692),('Color','hu','',1614107692,1614107692),('Color','it','',1614107692,1614107692),('Color','ja','',1614107692,1614107692),('Color','nl','',1614107692,1614107692),('Color','pl','',1614107692,1614107692),('Color','pt_BR','',1614107692,1614107692),('Color','ru','',1614107692,1614107692),('Color','sk','',1614107692,1614107692),('Color','sv','',1614107692,1614107692),('Color','sv_FI','',1614107692,1614107692),('Color','th','',1614107692,1614107692),('Color','tr','',1614107692,1614107692),('Color','uk','',1614107692,1614107692),('Color','zh_Hans','',1614107692,1614107692),('Comoros','cs','',1614107586,1614107586),('Comoros','de','',1614107586,1614107586),('Comoros','en','',1614107586,1614107586),('Comoros','es','',1614107586,1614107586),('Comoros','fa','',1614107586,1614107586),('Comoros','fr','',1614107586,1614107586),('Comoros','hu','',1614107586,1614107586),('Comoros','it','',1614107586,1614107586),('Comoros','ja','',1614107586,1614107586),('Comoros','nl','',1614107586,1614107586),('Comoros','pl','',1614107586,1614107586),('Comoros','pt_BR','',1614107586,1614107586),('Comoros','ru','',1614107586,1614107586),('Comoros','sk','',1614107586,1614107586),('Comoros','sv','',1614107586,1614107586),('Comoros','sv_FI','',1614107586,1614107586),('Comoros','th','',1614107586,1614107586),('Comoros','tr','',1614107586,1614107586),('Comoros','uk','',1614107586,1614107586),('Comoros','zh_Hans','',1614107586,1614107586),('Congo - Brazzaville','cs','',1614107587,1614107587),('Congo - Brazzaville','de','',1614107587,1614107587),('Congo - Brazzaville','en','',1614107587,1614107587),('Congo - Brazzaville','es','',1614107587,1614107587),('Congo - Brazzaville','fa','',1614107587,1614107587),('Congo - Brazzaville','fr','',1614107587,1614107587),('Congo - Brazzaville','hu','',1614107587,1614107587),('Congo - Brazzaville','it','',1614107587,1614107587),('Congo - Brazzaville','ja','',1614107587,1614107587),('Congo - Brazzaville','nl','',1614107587,1614107587),('Congo - Brazzaville','pl','',1614107587,1614107587),('Congo - Brazzaville','pt_BR','',1614107587,1614107587),('Congo - Brazzaville','ru','',1614107587,1614107587),('Congo - Brazzaville','sk','',1614107587,1614107587),('Congo - Brazzaville','sv','',1614107587,1614107587),('Congo - Brazzaville','sv_FI','',1614107587,1614107587),('Congo - Brazzaville','th','',1614107587,1614107587),('Congo - Brazzaville','tr','',1614107587,1614107587),('Congo - Brazzaville','uk','',1614107587,1614107587),('Congo - Brazzaville','zh_Hans','',1614107587,1614107587),('Congo - Kinshasa','cs','',1614107587,1614107587),('Congo - Kinshasa','de','',1614107587,1614107587),('Congo - Kinshasa','en','',1614107587,1614107587),('Congo - Kinshasa','es','',1614107587,1614107587),('Congo - Kinshasa','fa','',1614107587,1614107587),('Congo - Kinshasa','fr','',1614107587,1614107587),('Congo - Kinshasa','hu','',1614107587,1614107587),('Congo - Kinshasa','it','',1614107587,1614107587),('Congo - Kinshasa','ja','',1614107587,1614107587),('Congo - Kinshasa','nl','',1614107587,1614107587),('Congo - Kinshasa','pl','',1614107587,1614107587),('Congo - Kinshasa','pt_BR','',1614107587,1614107587),('Congo - Kinshasa','ru','',1614107587,1614107587),('Congo - Kinshasa','sk','',1614107587,1614107587),('Congo - Kinshasa','sv','',1614107587,1614107587),('Congo - Kinshasa','sv_FI','',1614107587,1614107587),('Congo - Kinshasa','th','',1614107587,1614107587),('Congo - Kinshasa','tr','',1614107587,1614107587),('Congo - Kinshasa','uk','',1614107587,1614107587),('Congo - Kinshasa','zh_Hans','',1614107587,1614107587),('Cook Islands','cs','',1614107587,1614107587),('Cook Islands','de','',1614107587,1614107587),('Cook Islands','en','',1614107587,1614107587),('Cook Islands','es','',1614107587,1614107587),('Cook Islands','fa','',1614107587,1614107587),('Cook Islands','fr','',1614107587,1614107587),('Cook Islands','hu','',1614107587,1614107587),('Cook Islands','it','',1614107587,1614107587),('Cook Islands','ja','',1614107587,1614107587),('Cook Islands','nl','',1614107587,1614107587),('Cook Islands','pl','',1614107587,1614107587),('Cook Islands','pt_BR','',1614107587,1614107587),('Cook Islands','ru','',1614107587,1614107587),('Cook Islands','sk','',1614107587,1614107587),('Cook Islands','sv','',1614107587,1614107587),('Cook Islands','sv_FI','',1614107587,1614107587),('Cook Islands','th','',1614107587,1614107587),('Cook Islands','tr','',1614107587,1614107587),('Cook Islands','uk','',1614107587,1614107587),('Cook Islands','zh_Hans','',1614107587,1614107587),('Costa Rica','cs','',1614107587,1614107587),('Costa Rica','de','',1614107587,1614107587),('Costa Rica','en','',1614107587,1614107587),('Costa Rica','es','',1614107587,1614107587),('Costa Rica','fa','',1614107587,1614107587),('Costa Rica','fr','',1614107587,1614107587),('Costa Rica','hu','',1614107587,1614107587),('Costa Rica','it','',1614107587,1614107587),('Costa Rica','ja','',1614107587,1614107587),('Costa Rica','nl','',1614107587,1614107587),('Costa Rica','pl','',1614107587,1614107587),('Costa Rica','pt_BR','',1614107587,1614107587),('Costa Rica','ru','',1614107587,1614107587),('Costa Rica','sk','',1614107587,1614107587),('Costa Rica','sv','',1614107587,1614107587),('Costa Rica','sv_FI','',1614107587,1614107587),('Costa Rica','th','',1614107587,1614107587),('Costa Rica','tr','',1614107587,1614107587),('Costa Rica','uk','',1614107587,1614107587),('Costa Rica','zh_Hans','',1614107587,1614107587),('Croatia','cs','',1614107587,1614107587),('Croatia','de','',1614107587,1614107587),('Croatia','en','',1614107587,1614107587),('Croatia','es','',1614107587,1614107587),('Croatia','fa','',1614107587,1614107587),('Croatia','fr','',1614107587,1614107587),('Croatia','hu','',1614107587,1614107587),('Croatia','it','',1614107587,1614107587),('Croatia','ja','',1614107587,1614107587),('Croatia','nl','',1614107587,1614107587),('Croatia','pl','',1614107587,1614107587),('Croatia','pt_BR','',1614107587,1614107587),('Croatia','ru','',1614107587,1614107587),('Croatia','sk','',1614107587,1614107587),('Croatia','sv','',1614107587,1614107587),('Croatia','sv_FI','',1614107587,1614107587),('Croatia','th','',1614107587,1614107587),('Croatia','tr','',1614107587,1614107587),('Croatia','uk','',1614107587,1614107587),('Croatia','zh_Hans','',1614107587,1614107587),('Cuba','cs','',1614107587,1614107587),('Cuba','de','',1614107587,1614107587),('Cuba','en','',1614107587,1614107587),('Cuba','es','',1614107587,1614107587),('Cuba','fa','',1614107587,1614107587),('Cuba','fr','',1614107587,1614107587),('Cuba','hu','',1614107587,1614107587),('Cuba','it','',1614107587,1614107587),('Cuba','ja','',1614107587,1614107587),('Cuba','nl','',1614107587,1614107587),('Cuba','pl','',1614107587,1614107587),('Cuba','pt_BR','',1614107587,1614107587),('Cuba','ru','',1614107587,1614107587),('Cuba','sk','',1614107587,1614107587),('Cuba','sv','',1614107587,1614107587),('Cuba','sv_FI','',1614107587,1614107587),('Cuba','th','',1614107587,1614107587),('Cuba','tr','',1614107587,1614107587),('Cuba','uk','',1614107587,1614107587),('Cuba','zh_Hans','',1614107587,1614107587),('Curaçao','cs','',1614107587,1614107587),('Curaçao','de','',1614107587,1614107587),('Curaçao','en','',1614107587,1614107587),('Curaçao','es','',1614107587,1614107587),('Curaçao','fa','',1614107587,1614107587),('Curaçao','fr','',1614107587,1614107587),('Curaçao','hu','',1614107587,1614107587),('Curaçao','it','',1614107587,1614107587),('Curaçao','ja','',1614107587,1614107587),('Curaçao','nl','',1614107587,1614107587),('Curaçao','pl','',1614107587,1614107587),('Curaçao','pt_BR','',1614107587,1614107587),('Curaçao','ru','',1614107587,1614107587),('Curaçao','sk','',1614107587,1614107587),('Curaçao','sv','',1614107587,1614107587),('Curaçao','sv_FI','',1614107587,1614107587),('Curaçao','th','',1614107587,1614107587),('Curaçao','tr','',1614107587,1614107587),('Curaçao','uk','',1614107587,1614107587),('Curaçao','zh_Hans','',1614107587,1614107587),('Cyprus','cs','',1614107587,1614107587),('Cyprus','de','',1614107587,1614107587),('Cyprus','en','',1614107587,1614107587),('Cyprus','es','',1614107587,1614107587),('Cyprus','fa','',1614107587,1614107587),('Cyprus','fr','',1614107587,1614107587),('Cyprus','hu','',1614107587,1614107587),('Cyprus','it','',1614107587,1614107587),('Cyprus','ja','',1614107587,1614107587),('Cyprus','nl','',1614107587,1614107587),('Cyprus','pl','',1614107587,1614107587),('Cyprus','pt_BR','',1614107587,1614107587),('Cyprus','ru','',1614107587,1614107587),('Cyprus','sk','',1614107587,1614107587),('Cyprus','sv','',1614107587,1614107587),('Cyprus','sv_FI','',1614107587,1614107587),('Cyprus','th','',1614107587,1614107587),('Cyprus','tr','',1614107587,1614107587),('Cyprus','uk','',1614107587,1614107587),('Cyprus','zh_Hans','',1614107587,1614107587),('Czechia','cs','',1614107587,1614107587),('Czechia','de','',1614107587,1614107587),('Czechia','en','',1614107587,1614107587),('Czechia','es','',1614107587,1614107587),('Czechia','fa','',1614107587,1614107587),('Czechia','fr','',1614107587,1614107587),('Czechia','hu','',1614107587,1614107587),('Czechia','it','',1614107587,1614107587),('Czechia','ja','',1614107587,1614107587),('Czechia','nl','',1614107587,1614107587),('Czechia','pl','',1614107587,1614107587),('Czechia','pt_BR','',1614107587,1614107587),('Czechia','ru','',1614107587,1614107587),('Czechia','sk','',1614107587,1614107587),('Czechia','sv','',1614107587,1614107587),('Czechia','sv_FI','',1614107587,1614107587),('Czechia','th','',1614107587,1614107587),('Czechia','tr','',1614107587,1614107587),('Czechia','uk','',1614107587,1614107587),('Czechia','zh_Hans','',1614107587,1614107587),('Côte d’Ivoire','cs','',1614107587,1614107587),('Côte d’Ivoire','de','',1614107587,1614107587),('Côte d’Ivoire','en','',1614107587,1614107587),('Côte d’Ivoire','es','',1614107587,1614107587),('Côte d’Ivoire','fa','',1614107587,1614107587),('Côte d’Ivoire','fr','',1614107587,1614107587),('Côte d’Ivoire','hu','',1614107587,1614107587),('Côte d’Ivoire','it','',1614107587,1614107587),('Côte d’Ivoire','ja','',1614107587,1614107587),('Côte d’Ivoire','nl','',1614107587,1614107587),('Côte d’Ivoire','pl','',1614107587,1614107587),('Côte d’Ivoire','pt_BR','',1614107587,1614107587),('Côte d’Ivoire','ru','',1614107587,1614107587),('Côte d’Ivoire','sk','',1614107587,1614107587),('Côte d’Ivoire','sv','',1614107587,1614107587),('Côte d’Ivoire','sv_FI','',1614107587,1614107587),('Côte d’Ivoire','th','',1614107587,1614107587),('Côte d’Ivoire','tr','',1614107587,1614107587),('Côte d’Ivoire','uk','',1614107587,1614107587),('Côte d’Ivoire','zh_Hans','',1614107587,1614107587),('Deep Neck','cs','',1614107399,1614107399),('Deep Neck','de','',1614107399,1614107399),('Deep Neck','en','',1614107399,1614107399),('Deep Neck','es','',1614107399,1614107399),('Deep Neck','fa','',1614107399,1614107399),('Deep Neck','fr','',1614107399,1614107399),('Deep Neck','hu','',1614107399,1614107399),('Deep Neck','it','',1614107399,1614107399),('Deep Neck','ja','',1614107399,1614107399),('Deep Neck','nl','',1614107399,1614107399),('Deep Neck','pl','',1614107399,1614107399),('Deep Neck','pt_BR','',1614107399,1614107399),('Deep Neck','ru','',1614107399,1614107399),('Deep Neck','sk','',1614107399,1614107399),('Deep Neck','sv','',1614107399,1614107399),('Deep Neck','sv_FI','',1614107399,1614107399),('Deep Neck','th','',1614107399,1614107399),('Deep Neck','tr','',1614107399,1614107399),('Deep Neck','uk','',1614107399,1614107399),('Deep Neck','zh_Hans','',1614107399,1614107399),('Denmark','cs','',1614107588,1614107588),('Denmark','de','',1614107588,1614107588),('Denmark','en','',1614107588,1614107588),('Denmark','es','',1614107588,1614107588),('Denmark','fa','',1614107588,1614107588),('Denmark','fr','',1614107588,1614107588),('Denmark','hu','',1614107588,1614107588),('Denmark','it','',1614107588,1614107588),('Denmark','ja','',1614107588,1614107588),('Denmark','nl','',1614107588,1614107588),('Denmark','pl','',1614107588,1614107588),('Denmark','pt_BR','',1614107588,1614107588),('Denmark','ru','',1614107588,1614107588),('Denmark','sk','',1614107588,1614107588),('Denmark','sv','',1614107588,1614107588),('Denmark','sv_FI','',1614107588,1614107588),('Denmark','th','',1614107588,1614107588),('Denmark','tr','',1614107588,1614107588),('Denmark','uk','',1614107588,1614107588),('Denmark','zh_Hans','',1614107588,1614107588),('Description','cs','',1614107692,1614107692),('Description','de','',1614107692,1614107692),('Description','en','',1614107692,1614107692),('Description','es','',1614107692,1614107692),('Description','fa','',1614107692,1614107692),('Description','fr','',1614107692,1614107692),('Description','hu','',1614107692,1614107692),('Description','it','',1614107692,1614107692),('Description','ja','',1614107692,1614107692),('Description','nl','',1614107692,1614107692),('Description','pl','',1614107692,1614107692),('Description','pt_BR','',1614107692,1614107692),('Description','ru','',1614107692,1614107692),('Description','sk','',1614107692,1614107692),('Description','sv','',1614107692,1614107692),('Description','sv_FI','',1614107692,1614107692),('Description','th','',1614107692,1614107692),('Description','tr','',1614107692,1614107692),('Description','uk','',1614107692,1614107692),('Description','zh_Hans','',1614107692,1614107692),('Detail','cs','',1614107580,1614107580),('Detail','de','',1614107580,1614107580),('Detail','en','',1614107580,1614107580),('Detail','es','',1614107580,1614107580),('Detail','fa','',1614107580,1614107580),('Detail','fr','',1614107580,1614107580),('Detail','hu','',1614107580,1614107580),('Detail','it','',1614107580,1614107580),('Detail','ja','',1614107580,1614107580),('Detail','nl','',1614107580,1614107580),('Detail','pl','',1614107580,1614107580),('Detail','pt_BR','',1614107580,1614107580),('Detail','ru','',1614107580,1614107580),('Detail','sk','',1614107580,1614107580),('Detail','sv','',1614107580,1614107580),('Detail','sv_FI','',1614107580,1614107580),('Detail','th','',1614107580,1614107580),('Detail','tr','',1614107580,1614107580),('Detail','uk','',1614107580,1614107580),('Detail','zh_Hans','',1614107580,1614107580),('Discount','cs','',1614106914,1614106914),('Discount','de','',1614106914,1614106914),('Discount','en','',1614106914,1614106914),('Discount','es','',1614106914,1614106914),('Discount','fa','',1614106914,1614106914),('Discount','fr','',1614106914,1614106914),('Discount','hu','',1614106914,1614106914),('Discount','it','',1614106914,1614106914),('Discount','ja','',1614106914,1614106914),('Discount','nl','',1614106914,1614106914),('Discount','pl','',1614106914,1614106914),('Discount','pt_BR','',1614106914,1614106914),('Discount','ru','',1614106914,1614106914),('Discount','sk','',1614106914,1614106914),('Discount','sv','',1614106914,1614106914),('Discount','sv_FI','',1614106914,1614106914),('Discount','th','',1614106914,1614106914),('Discount','tr','',1614106914,1614106914),('Discount','uk','',1614106914,1614106914),('Discount','zh_Hans','',1614106914,1614106914),('Djibouti','cs','',1614107588,1614107588),('Djibouti','de','',1614107588,1614107588),('Djibouti','en','',1614107588,1614107588),('Djibouti','es','',1614107588,1614107588),('Djibouti','fa','',1614107588,1614107588),('Djibouti','fr','',1614107588,1614107588),('Djibouti','hu','',1614107588,1614107588),('Djibouti','it','',1614107588,1614107588),('Djibouti','ja','',1614107588,1614107588),('Djibouti','nl','',1614107588,1614107588),('Djibouti','pl','',1614107588,1614107588),('Djibouti','pt_BR','',1614107588,1614107588),('Djibouti','ru','',1614107588,1614107588),('Djibouti','sk','',1614107588,1614107588),('Djibouti','sv','',1614107588,1614107588),('Djibouti','sv_FI','',1614107588,1614107588),('Djibouti','th','',1614107588,1614107588),('Djibouti','tr','',1614107588,1614107588),('Djibouti','uk','',1614107588,1614107588),('Djibouti','zh_Hans','',1614107588,1614107588),('Dominica','cs','',1614107588,1614107588),('Dominica','de','',1614107588,1614107588),('Dominica','en','',1614107588,1614107588),('Dominica','es','',1614107588,1614107588),('Dominica','fa','',1614107588,1614107588),('Dominica','fr','',1614107588,1614107588),('Dominica','hu','',1614107588,1614107588),('Dominica','it','',1614107588,1614107588),('Dominica','ja','',1614107588,1614107588),('Dominica','nl','',1614107588,1614107588),('Dominica','pl','',1614107588,1614107588),('Dominica','pt_BR','',1614107588,1614107588),('Dominica','ru','',1614107588,1614107588),('Dominica','sk','',1614107588,1614107588),('Dominica','sv','',1614107588,1614107588),('Dominica','sv_FI','',1614107588,1614107588),('Dominica','th','',1614107588,1614107588),('Dominica','tr','',1614107588,1614107588),('Dominica','uk','',1614107588,1614107588),('Dominica','zh_Hans','',1614107588,1614107588),('Dominican Republic','cs','',1614107588,1614107588),('Dominican Republic','de','',1614107588,1614107588),('Dominican Republic','en','',1614107588,1614107588),('Dominican Republic','es','',1614107588,1614107588),('Dominican Republic','fa','',1614107588,1614107588),('Dominican Republic','fr','',1614107588,1614107588),('Dominican Republic','hu','',1614107588,1614107588),('Dominican Republic','it','',1614107588,1614107588),('Dominican Republic','ja','',1614107588,1614107588),('Dominican Republic','nl','',1614107588,1614107588),('Dominican Republic','pl','',1614107588,1614107588),('Dominican Republic','pt_BR','',1614107588,1614107588),('Dominican Republic','ru','',1614107588,1614107588),('Dominican Republic','sk','',1614107588,1614107588),('Dominican Republic','sv','',1614107588,1614107588),('Dominican Republic','sv_FI','',1614107588,1614107588),('Dominican Republic','th','',1614107588,1614107588),('Dominican Republic','tr','',1614107588,1614107588),('Dominican Republic','uk','',1614107588,1614107588),('Dominican Republic','zh_Hans','',1614107588,1614107588),('Dry Clean','cs','',1614088789,1614088789),('Dry Clean','de','',1614088789,1614088789),('Dry Clean','en','',1614088789,1614088789),('Dry Clean','es','',1614088789,1614088789),('Dry Clean','fa','',1614088789,1614088789),('Dry Clean','fr','',1614088789,1614088789),('Dry Clean','hu','',1614088789,1614088789),('Dry Clean','it','',1614088789,1614088789),('Dry Clean','ja','',1614088789,1614088789),('Dry Clean','nl','',1614088789,1614088789),('Dry Clean','pl','',1614088789,1614088789),('Dry Clean','pt_BR','',1614088789,1614088789),('Dry Clean','ru','',1614088789,1614088789),('Dry Clean','sk','',1614088789,1614088789),('Dry Clean','sv','',1614088789,1614088789),('Dry Clean','sv_FI','',1614088789,1614088789),('Dry Clean','th','',1614088789,1614088789),('Dry Clean','tr','',1614088789,1614088789),('Dry Clean','uk','',1614088789,1614088789),('Dry Clean','zh_Hans','',1614088789,1614088789),('Ecuador','cs','',1614107588,1614107588),('Ecuador','de','',1614107588,1614107588),('Ecuador','en','',1614107588,1614107588),('Ecuador','es','',1614107588,1614107588),('Ecuador','fa','',1614107588,1614107588),('Ecuador','fr','',1614107588,1614107588),('Ecuador','hu','',1614107588,1614107588),('Ecuador','it','',1614107588,1614107588),('Ecuador','ja','',1614107588,1614107588),('Ecuador','nl','',1614107588,1614107588),('Ecuador','pl','',1614107588,1614107588),('Ecuador','pt_BR','',1614107588,1614107588),('Ecuador','ru','',1614107588,1614107588),('Ecuador','sk','',1614107588,1614107588),('Ecuador','sv','',1614107588,1614107588),('Ecuador','sv_FI','',1614107588,1614107588),('Ecuador','th','',1614107588,1614107588),('Ecuador','tr','',1614107588,1614107588),('Ecuador','uk','',1614107588,1614107588),('Ecuador','zh_Hans','',1614107588,1614107588),('Egypt','cs','',1614107588,1614107588),('Egypt','de','',1614107588,1614107588),('Egypt','en','',1614107588,1614107588),('Egypt','es','',1614107588,1614107588),('Egypt','fa','',1614107588,1614107588),('Egypt','fr','',1614107588,1614107588),('Egypt','hu','',1614107588,1614107588),('Egypt','it','',1614107588,1614107588),('Egypt','ja','',1614107588,1614107588),('Egypt','nl','',1614107588,1614107588),('Egypt','pl','',1614107588,1614107588),('Egypt','pt_BR','',1614107588,1614107588),('Egypt','ru','',1614107588,1614107588),('Egypt','sk','',1614107588,1614107588),('Egypt','sv','',1614107588,1614107588),('Egypt','sv_FI','',1614107588,1614107588),('Egypt','th','',1614107588,1614107588),('Egypt','tr','',1614107588,1614107588),('Egypt','uk','',1614107588,1614107588),('Egypt','zh_Hans','',1614107588,1614107588),('El Salvador','cs','',1614107588,1614107588),('El Salvador','de','',1614107588,1614107588),('El Salvador','en','',1614107588,1614107588),('El Salvador','es','',1614107588,1614107588),('El Salvador','fa','',1614107588,1614107588),('El Salvador','fr','',1614107588,1614107588),('El Salvador','hu','',1614107588,1614107588),('El Salvador','it','',1614107588,1614107588),('El Salvador','ja','',1614107588,1614107588),('El Salvador','nl','',1614107588,1614107588),('El Salvador','pl','',1614107588,1614107588),('El Salvador','pt_BR','',1614107588,1614107588),('El Salvador','ru','',1614107588,1614107588),('El Salvador','sk','',1614107588,1614107588),('El Salvador','sv','',1614107588,1614107588),('El Salvador','sv_FI','',1614107588,1614107588),('El Salvador','th','',1614107588,1614107588),('El Salvador','tr','',1614107588,1614107588),('El Salvador','uk','',1614107588,1614107588),('El Salvador','zh_Hans','',1614107588,1614107588),('English','cs','',1614107614,1614107614),('English','de','',1614107614,1614107614),('English','en','',1614107614,1614107614),('English','es','',1614107614,1614107614),('English','fa','',1614107614,1614107614),('English','fr','',1614107614,1614107614),('English','hu','',1614107614,1614107614),('English','it','',1614107614,1614107614),('English','ja','',1614107614,1614107614),('English','nl','',1614107614,1614107614),('English','pl','',1614107614,1614107614),('English','pt_BR','',1614107614,1614107614),('English','ru','',1614107614,1614107614),('English','sk','',1614107614,1614107614),('English','sv','',1614107614,1614107614),('English','sv_FI','',1614107614,1614107614),('English','th','',1614107614,1614107614),('English','tr','',1614107614,1614107614),('English','uk','',1614107614,1614107614),('English','zh_Hans','',1614107614,1614107614),('Equatorial Guinea','cs','',1614107588,1614107588),('Equatorial Guinea','de','',1614107588,1614107588),('Equatorial Guinea','en','',1614107588,1614107588),('Equatorial Guinea','es','',1614107588,1614107588),('Equatorial Guinea','fa','',1614107588,1614107588),('Equatorial Guinea','fr','',1614107588,1614107588),('Equatorial Guinea','hu','',1614107588,1614107588),('Equatorial Guinea','it','',1614107588,1614107588),('Equatorial Guinea','ja','',1614107588,1614107588),('Equatorial Guinea','nl','',1614107588,1614107588),('Equatorial Guinea','pl','',1614107588,1614107588),('Equatorial Guinea','pt_BR','',1614107588,1614107588),('Equatorial Guinea','ru','',1614107588,1614107588),('Equatorial Guinea','sk','',1614107588,1614107588),('Equatorial Guinea','sv','',1614107588,1614107588),('Equatorial Guinea','sv_FI','',1614107588,1614107588),('Equatorial Guinea','th','',1614107588,1614107588),('Equatorial Guinea','tr','',1614107588,1614107588),('Equatorial Guinea','uk','',1614107588,1614107588),('Equatorial Guinea','zh_Hans','',1614107588,1614107588),('Eritrea','cs','',1614107588,1614107588),('Eritrea','de','',1614107588,1614107588),('Eritrea','en','',1614107588,1614107588),('Eritrea','es','',1614107588,1614107588),('Eritrea','fa','',1614107588,1614107588),('Eritrea','fr','',1614107588,1614107588),('Eritrea','hu','',1614107588,1614107588),('Eritrea','it','',1614107588,1614107588),('Eritrea','ja','',1614107588,1614107588),('Eritrea','nl','',1614107588,1614107588),('Eritrea','pl','',1614107588,1614107588),('Eritrea','pt_BR','',1614107588,1614107588),('Eritrea','ru','',1614107588,1614107588),('Eritrea','sk','',1614107588,1614107588),('Eritrea','sv','',1614107588,1614107588),('Eritrea','sv_FI','',1614107588,1614107588),('Eritrea','th','',1614107588,1614107588),('Eritrea','tr','',1614107588,1614107588),('Eritrea','uk','',1614107588,1614107588),('Eritrea','zh_Hans','',1614107588,1614107588),('Estonia','cs','',1614107588,1614107588),('Estonia','de','',1614107588,1614107588),('Estonia','en','',1614107588,1614107588),('Estonia','es','',1614107588,1614107588),('Estonia','fa','',1614107588,1614107588),('Estonia','fr','',1614107588,1614107588),('Estonia','hu','',1614107588,1614107588),('Estonia','it','',1614107588,1614107588),('Estonia','ja','',1614107588,1614107588),('Estonia','nl','',1614107588,1614107588),('Estonia','pl','',1614107588,1614107588),('Estonia','pt_BR','',1614107588,1614107588),('Estonia','ru','',1614107588,1614107588),('Estonia','sk','',1614107588,1614107588),('Estonia','sv','',1614107588,1614107588),('Estonia','sv_FI','',1614107588,1614107588),('Estonia','th','',1614107588,1614107588),('Estonia','tr','',1614107588,1614107588),('Estonia','uk','',1614107588,1614107588),('Estonia','zh_Hans','',1614107588,1614107588),('Eswatini','cs','',1614107589,1614107589),('Eswatini','de','',1614107589,1614107589),('Eswatini','en','',1614107589,1614107589),('Eswatini','es','',1614107589,1614107589),('Eswatini','fa','',1614107589,1614107589),('Eswatini','fr','',1614107589,1614107589),('Eswatini','hu','',1614107589,1614107589),('Eswatini','it','',1614107589,1614107589),('Eswatini','ja','',1614107589,1614107589),('Eswatini','nl','',1614107589,1614107589),('Eswatini','pl','',1614107589,1614107589),('Eswatini','pt_BR','',1614107589,1614107589),('Eswatini','ru','',1614107589,1614107589),('Eswatini','sk','',1614107589,1614107589),('Eswatini','sv','',1614107589,1614107589),('Eswatini','sv_FI','',1614107589,1614107589),('Eswatini','th','',1614107589,1614107589),('Eswatini','tr','',1614107589,1614107589),('Eswatini','uk','',1614107589,1614107589),('Eswatini','zh_Hans','',1614107589,1614107589),('Ethiopia','cs','',1614107589,1614107589),('Ethiopia','de','',1614107589,1614107589),('Ethiopia','en','',1614107589,1614107589),('Ethiopia','es','',1614107589,1614107589),('Ethiopia','fa','',1614107589,1614107589),('Ethiopia','fr','',1614107589,1614107589),('Ethiopia','hu','',1614107589,1614107589),('Ethiopia','it','',1614107589,1614107589),('Ethiopia','ja','',1614107589,1614107589),('Ethiopia','nl','',1614107589,1614107589),('Ethiopia','pl','',1614107589,1614107589),('Ethiopia','pt_BR','',1614107589,1614107589),('Ethiopia','ru','',1614107589,1614107589),('Ethiopia','sk','',1614107589,1614107589),('Ethiopia','sv','',1614107589,1614107589),('Ethiopia','sv_FI','',1614107589,1614107589),('Ethiopia','th','',1614107589,1614107589),('Ethiopia','tr','',1614107589,1614107589),('Ethiopia','uk','',1614107589,1614107589),('Ethiopia','zh_Hans','',1614107589,1614107589),('Fabric','cs','',1614106914,1614106914),('Fabric','de','',1614106914,1614106914),('Fabric','en','',1614106914,1614106914),('Fabric','es','',1614106914,1614106914),('Fabric','fa','',1614106914,1614106914),('Fabric','fr','',1614106914,1614106914),('Fabric','hu','',1614106914,1614106914),('Fabric','it','',1614106914,1614106914),('Fabric','ja','',1614106914,1614106914),('Fabric','nl','',1614106914,1614106914),('Fabric','pl','',1614106914,1614106914),('Fabric','pt_BR','',1614106914,1614106914),('Fabric','ru','',1614106914,1614106914),('Fabric','sk','',1614106914,1614106914),('Fabric','sv','',1614106914,1614106914),('Fabric','sv_FI','',1614106914,1614106914),('Fabric','th','',1614106914,1614106914),('Fabric','tr','',1614106914,1614106914),('Fabric','uk','',1614106914,1614106914),('Fabric','zh_Hans','',1614106914,1614106914),('Fabric Used','cs','',1614106973,1614106973),('Fabric Used','de','',1614106973,1614106973),('Fabric Used','en','',1614106973,1614106973),('Fabric Used','es','',1614106973,1614106973),('Fabric Used','fa','',1614106973,1614106973),('Fabric Used','fr','',1614106973,1614106973),('Fabric Used','hu','',1614106973,1614106973),('Fabric Used','it','',1614106973,1614106973),('Fabric Used','ja','',1614106973,1614106973),('Fabric Used','nl','',1614106973,1614106973),('Fabric Used','pl','',1614106973,1614106973),('Fabric Used','pt_BR','',1614106973,1614106973),('Fabric Used','ru','',1614106973,1614106973),('Fabric Used','sk','',1614106973,1614106973),('Fabric Used','sv','',1614106973,1614106973),('Fabric Used','sv_FI','',1614106973,1614106973),('Fabric Used','th','',1614106973,1614106973),('Fabric Used','tr','',1614106973,1614106973),('Fabric Used','uk','',1614106973,1614106973),('Fabric Used','zh_Hans','',1614106973,1614106973),('Falkland Islands','cs','',1614107589,1614107589),('Falkland Islands','de','',1614107589,1614107589),('Falkland Islands','en','',1614107589,1614107589),('Falkland Islands','es','',1614107589,1614107589),('Falkland Islands','fa','',1614107589,1614107589),('Falkland Islands','fr','',1614107589,1614107589),('Falkland Islands','hu','',1614107589,1614107589),('Falkland Islands','it','',1614107589,1614107589),('Falkland Islands','ja','',1614107589,1614107589),('Falkland Islands','nl','',1614107589,1614107589),('Falkland Islands','pl','',1614107589,1614107589),('Falkland Islands','pt_BR','',1614107589,1614107589),('Falkland Islands','ru','',1614107589,1614107589),('Falkland Islands','sk','',1614107589,1614107589),('Falkland Islands','sv','',1614107589,1614107589),('Falkland Islands','sv_FI','',1614107589,1614107589),('Falkland Islands','th','',1614107589,1614107589),('Falkland Islands','tr','',1614107589,1614107589),('Falkland Islands','uk','',1614107589,1614107589),('Falkland Islands','zh_Hans','',1614107589,1614107589),('Faroe Islands','cs','',1614107589,1614107589),('Faroe Islands','de','',1614107589,1614107589),('Faroe Islands','en','',1614107589,1614107589),('Faroe Islands','es','',1614107589,1614107589),('Faroe Islands','fa','',1614107589,1614107589),('Faroe Islands','fr','',1614107589,1614107589),('Faroe Islands','hu','',1614107589,1614107589),('Faroe Islands','it','',1614107589,1614107589),('Faroe Islands','ja','',1614107589,1614107589),('Faroe Islands','nl','',1614107589,1614107589),('Faroe Islands','pl','',1614107589,1614107589),('Faroe Islands','pt_BR','',1614107589,1614107589),('Faroe Islands','ru','',1614107589,1614107589),('Faroe Islands','sk','',1614107589,1614107589),('Faroe Islands','sv','',1614107589,1614107589),('Faroe Islands','sv_FI','',1614107589,1614107589),('Faroe Islands','th','',1614107589,1614107589),('Faroe Islands','tr','',1614107589,1614107589),('Faroe Islands','uk','',1614107589,1614107589),('Faroe Islands','zh_Hans','',1614107589,1614107589),('Fiji','cs','',1614107589,1614107589),('Fiji','de','',1614107589,1614107589),('Fiji','en','',1614107589,1614107589),('Fiji','es','',1614107589,1614107589),('Fiji','fa','',1614107589,1614107589),('Fiji','fr','',1614107589,1614107589),('Fiji','hu','',1614107589,1614107589),('Fiji','it','',1614107589,1614107589),('Fiji','ja','',1614107589,1614107589),('Fiji','nl','',1614107589,1614107589),('Fiji','pl','',1614107589,1614107589),('Fiji','pt_BR','',1614107589,1614107589),('Fiji','ru','',1614107589,1614107589),('Fiji','sk','',1614107589,1614107589),('Fiji','sv','',1614107589,1614107589),('Fiji','sv_FI','',1614107589,1614107589),('Fiji','th','',1614107589,1614107589),('Fiji','tr','',1614107589,1614107589),('Fiji','uk','',1614107589,1614107589),('Fiji','zh_Hans','',1614107589,1614107589),('Finland','cs','',1614107589,1614107589),('Finland','de','',1614107589,1614107589),('Finland','en','',1614107589,1614107589),('Finland','es','',1614107589,1614107589),('Finland','fa','',1614107589,1614107589),('Finland','fr','',1614107589,1614107589),('Finland','hu','',1614107589,1614107589),('Finland','it','',1614107589,1614107589),('Finland','ja','',1614107589,1614107589),('Finland','nl','',1614107589,1614107589),('Finland','pl','',1614107589,1614107589),('Finland','pt_BR','',1614107589,1614107589),('Finland','ru','',1614107589,1614107589),('Finland','sk','',1614107589,1614107589),('Finland','sv','',1614107589,1614107589),('Finland','sv_FI','',1614107589,1614107589),('Finland','th','',1614107589,1614107589),('Finland','tr','',1614107589,1614107589),('Finland','uk','',1614107589,1614107589),('Finland','zh_Hans','',1614107589,1614107589),('France','cs','',1614107590,1614107590),('France','de','',1614107590,1614107590),('France','en','',1614107590,1614107590),('France','es','',1614107590,1614107590),('France','fa','',1614107590,1614107590),('France','fr','',1614107590,1614107590),('France','hu','',1614107590,1614107590),('France','it','',1614107590,1614107590),('France','ja','',1614107590,1614107590),('France','nl','',1614107590,1614107590),('France','pl','',1614107590,1614107590),('France','pt_BR','',1614107590,1614107590),('France','ru','',1614107590,1614107590),('France','sk','',1614107590,1614107590),('France','sv','',1614107590,1614107590),('France','sv_FI','',1614107590,1614107590),('France','th','',1614107590,1614107590),('France','tr','',1614107590,1614107590),('France','uk','',1614107590,1614107590),('France','zh_Hans','',1614107590,1614107590),('French Guiana','cs','',1614107590,1614107590),('French Guiana','de','',1614107590,1614107590),('French Guiana','en','',1614107590,1614107590),('French Guiana','es','',1614107590,1614107590),('French Guiana','fa','',1614107590,1614107590),('French Guiana','fr','',1614107590,1614107590),('French Guiana','hu','',1614107590,1614107590),('French Guiana','it','',1614107590,1614107590),('French Guiana','ja','',1614107590,1614107590),('French Guiana','nl','',1614107590,1614107590),('French Guiana','pl','',1614107590,1614107590),('French Guiana','pt_BR','',1614107590,1614107590),('French Guiana','ru','',1614107590,1614107590),('French Guiana','sk','',1614107590,1614107590),('French Guiana','sv','',1614107590,1614107590),('French Guiana','sv_FI','',1614107590,1614107590),('French Guiana','th','',1614107590,1614107590),('French Guiana','tr','',1614107590,1614107590),('French Guiana','uk','',1614107590,1614107590),('French Guiana','zh_Hans','',1614107590,1614107590),('French Polynesia','cs','',1614107590,1614107590),('French Polynesia','de','',1614107590,1614107590),('French Polynesia','en','',1614107590,1614107590),('French Polynesia','es','',1614107590,1614107590),('French Polynesia','fa','',1614107590,1614107590),('French Polynesia','fr','',1614107590,1614107590),('French Polynesia','hu','',1614107590,1614107590),('French Polynesia','it','',1614107590,1614107590),('French Polynesia','ja','',1614107590,1614107590),('French Polynesia','nl','',1614107590,1614107590),('French Polynesia','pl','',1614107590,1614107590),('French Polynesia','pt_BR','',1614107590,1614107590),('French Polynesia','ru','',1614107590,1614107590),('French Polynesia','sk','',1614107590,1614107590),('French Polynesia','sv','',1614107590,1614107590),('French Polynesia','sv_FI','',1614107590,1614107590),('French Polynesia','th','',1614107590,1614107590),('French Polynesia','tr','',1614107590,1614107590),('French Polynesia','uk','',1614107590,1614107590),('French Polynesia','zh_Hans','',1614107590,1614107590),('French Southern Territories','cs','',1614107590,1614107590),('French Southern Territories','de','',1614107590,1614107590),('French Southern Territories','en','',1614107590,1614107590),('French Southern Territories','es','',1614107590,1614107590),('French Southern Territories','fa','',1614107590,1614107590),('French Southern Territories','fr','',1614107590,1614107590),('French Southern Territories','hu','',1614107590,1614107590),('French Southern Territories','it','',1614107590,1614107590),('French Southern Territories','ja','',1614107590,1614107590),('French Southern Territories','nl','',1614107590,1614107590),('French Southern Territories','pl','',1614107590,1614107590),('French Southern Territories','pt_BR','',1614107590,1614107590),('French Southern Territories','ru','',1614107590,1614107590),('French Southern Territories','sk','',1614107590,1614107590),('French Southern Territories','sv','',1614107590,1614107590),('French Southern Territories','sv_FI','',1614107590,1614107590),('French Southern Territories','th','',1614107590,1614107590),('French Southern Territories','tr','',1614107590,1614107590),('French Southern Territories','uk','',1614107590,1614107590),('French Southern Territories','zh_Hans','',1614107590,1614107590),('Full Sleeve','cs','',1614107400,1614107400),('Full Sleeve','de','',1614107400,1614107400),('Full Sleeve','en','',1614107400,1614107400),('Full Sleeve','es','',1614107400,1614107400),('Full Sleeve','fa','',1614107400,1614107400),('Full Sleeve','fr','',1614107400,1614107400),('Full Sleeve','hu','',1614107400,1614107400),('Full Sleeve','it','',1614107400,1614107400),('Full Sleeve','ja','',1614107400,1614107400),('Full Sleeve','nl','',1614107400,1614107400),('Full Sleeve','pl','',1614107400,1614107400),('Full Sleeve','pt_BR','',1614107400,1614107400),('Full Sleeve','ru','',1614107400,1614107400),('Full Sleeve','sk','',1614107400,1614107400),('Full Sleeve','sv','',1614107400,1614107400),('Full Sleeve','sv_FI','',1614107400,1614107400),('Full Sleeve','th','',1614107400,1614107400),('Full Sleeve','tr','',1614107400,1614107400),('Full Sleeve','uk','',1614107400,1614107400),('Full Sleeve','zh_Hans','',1614107400,1614107400),('Gabon','cs','',1614107590,1614107590),('Gabon','de','',1614107590,1614107590),('Gabon','en','',1614107590,1614107590),('Gabon','es','',1614107590,1614107590),('Gabon','fa','',1614107590,1614107590),('Gabon','fr','',1614107590,1614107590),('Gabon','hu','',1614107590,1614107590),('Gabon','it','',1614107590,1614107590),('Gabon','ja','',1614107590,1614107590),('Gabon','nl','',1614107590,1614107590),('Gabon','pl','',1614107590,1614107590),('Gabon','pt_BR','',1614107590,1614107590),('Gabon','ru','',1614107590,1614107590),('Gabon','sk','',1614107590,1614107590),('Gabon','sv','',1614107590,1614107590),('Gabon','sv_FI','',1614107590,1614107590),('Gabon','th','',1614107590,1614107590),('Gabon','tr','',1614107590,1614107590),('Gabon','uk','',1614107590,1614107590),('Gabon','zh_Hans','',1614107590,1614107590),('Gambia','cs','',1614107590,1614107590),('Gambia','de','',1614107590,1614107590),('Gambia','en','',1614107590,1614107590),('Gambia','es','',1614107590,1614107590),('Gambia','fa','',1614107590,1614107590),('Gambia','fr','',1614107590,1614107590),('Gambia','hu','',1614107590,1614107590),('Gambia','it','',1614107590,1614107590),('Gambia','ja','',1614107590,1614107590),('Gambia','nl','',1614107590,1614107590),('Gambia','pl','',1614107590,1614107590),('Gambia','pt_BR','',1614107590,1614107590),('Gambia','ru','',1614107590,1614107590),('Gambia','sk','',1614107590,1614107590),('Gambia','sv','',1614107590,1614107590),('Gambia','sv_FI','',1614107590,1614107590),('Gambia','th','',1614107590,1614107590),('Gambia','tr','',1614107590,1614107590),('Gambia','uk','',1614107590,1614107590),('Gambia','zh_Hans','',1614107590,1614107590),('Georgia','cs','',1614107591,1614107591),('Georgia','de','',1614107591,1614107591),('Georgia','en','',1614107591,1614107591),('Georgia','es','',1614107591,1614107591),('Georgia','fa','',1614107591,1614107591),('Georgia','fr','',1614107591,1614107591),('Georgia','hu','',1614107591,1614107591),('Georgia','it','',1614107591,1614107591),('Georgia','ja','',1614107591,1614107591),('Georgia','nl','',1614107591,1614107591),('Georgia','pl','',1614107591,1614107591),('Georgia','pt_BR','',1614107591,1614107591),('Georgia','ru','',1614107591,1614107591),('Georgia','sk','',1614107591,1614107591),('Georgia','sv','',1614107591,1614107591),('Georgia','sv_FI','',1614107591,1614107591),('Georgia','th','',1614107591,1614107591),('Georgia','tr','',1614107591,1614107591),('Georgia','uk','',1614107591,1614107591),('Georgia','zh_Hans','',1614107591,1614107591),('Germany','cs','',1614107591,1614107591),('Germany','de','',1614107591,1614107591),('Germany','en','',1614107591,1614107591),('Germany','es','',1614107591,1614107591),('Germany','fa','',1614107591,1614107591),('Germany','fr','',1614107591,1614107591),('Germany','hu','',1614107591,1614107591),('Germany','it','',1614107591,1614107591),('Germany','ja','',1614107591,1614107591),('Germany','nl','',1614107591,1614107591),('Germany','pl','',1614107591,1614107591),('Germany','pt_BR','',1614107591,1614107591),('Germany','ru','',1614107591,1614107591),('Germany','sk','',1614107591,1614107591),('Germany','sv','',1614107591,1614107591),('Germany','sv_FI','',1614107591,1614107591),('Germany','th','',1614107591,1614107591),('Germany','tr','',1614107591,1614107591),('Germany','uk','',1614107591,1614107591),('Germany','zh_Hans','',1614107591,1614107591),('Ghana','cs','',1614107591,1614107591),('Ghana','de','',1614107591,1614107591),('Ghana','en','',1614107591,1614107591),('Ghana','es','',1614107591,1614107591),('Ghana','fa','',1614107591,1614107591),('Ghana','fr','',1614107591,1614107591),('Ghana','hu','',1614107591,1614107591),('Ghana','it','',1614107591,1614107591),('Ghana','ja','',1614107591,1614107591),('Ghana','nl','',1614107591,1614107591),('Ghana','pl','',1614107591,1614107591),('Ghana','pt_BR','',1614107591,1614107591),('Ghana','ru','',1614107591,1614107591),('Ghana','sk','',1614107591,1614107591),('Ghana','sv','',1614107591,1614107591),('Ghana','sv_FI','',1614107591,1614107591),('Ghana','th','',1614107591,1614107591),('Ghana','tr','',1614107591,1614107591),('Ghana','uk','',1614107591,1614107591),('Ghana','zh_Hans','',1614107591,1614107591),('Gibraltar','cs','',1614107591,1614107591),('Gibraltar','de','',1614107591,1614107591),('Gibraltar','en','',1614107591,1614107591),('Gibraltar','es','',1614107591,1614107591),('Gibraltar','fa','',1614107591,1614107591),('Gibraltar','fr','',1614107591,1614107591),('Gibraltar','hu','',1614107591,1614107591),('Gibraltar','it','',1614107591,1614107591),('Gibraltar','ja','',1614107591,1614107591),('Gibraltar','nl','',1614107591,1614107591),('Gibraltar','pl','',1614107591,1614107591),('Gibraltar','pt_BR','',1614107591,1614107591),('Gibraltar','ru','',1614107591,1614107591),('Gibraltar','sk','',1614107591,1614107591),('Gibraltar','sv','',1614107591,1614107591),('Gibraltar','sv_FI','',1614107591,1614107591),('Gibraltar','th','',1614107591,1614107591),('Gibraltar','tr','',1614107591,1614107591),('Gibraltar','uk','',1614107591,1614107591),('Gibraltar','zh_Hans','',1614107591,1614107591),('Greece','cs','',1614107591,1614107591),('Greece','de','',1614107591,1614107591),('Greece','en','',1614107591,1614107591),('Greece','es','',1614107591,1614107591),('Greece','fa','',1614107591,1614107591),('Greece','fr','',1614107591,1614107591),('Greece','hu','',1614107591,1614107591),('Greece','it','',1614107591,1614107591),('Greece','ja','',1614107591,1614107591),('Greece','nl','',1614107591,1614107591),('Greece','pl','',1614107591,1614107591),('Greece','pt_BR','',1614107591,1614107591),('Greece','ru','',1614107591,1614107591),('Greece','sk','',1614107591,1614107591),('Greece','sv','',1614107591,1614107591),('Greece','sv_FI','',1614107591,1614107591),('Greece','th','',1614107591,1614107591),('Greece','tr','',1614107591,1614107591),('Greece','uk','',1614107591,1614107591),('Greece','zh_Hans','',1614107591,1614107591),('Greenland','cs','',1614107591,1614107591),('Greenland','de','',1614107591,1614107591),('Greenland','en','',1614107591,1614107591),('Greenland','es','',1614107591,1614107591),('Greenland','fa','',1614107591,1614107591),('Greenland','fr','',1614107591,1614107591),('Greenland','hu','',1614107591,1614107591),('Greenland','it','',1614107591,1614107591),('Greenland','ja','',1614107591,1614107591),('Greenland','nl','',1614107591,1614107591),('Greenland','pl','',1614107591,1614107591),('Greenland','pt_BR','',1614107591,1614107591),('Greenland','ru','',1614107591,1614107591),('Greenland','sk','',1614107591,1614107591),('Greenland','sv','',1614107591,1614107591),('Greenland','sv_FI','',1614107591,1614107591),('Greenland','th','',1614107591,1614107591),('Greenland','tr','',1614107591,1614107591),('Greenland','uk','',1614107591,1614107591),('Greenland','zh_Hans','',1614107591,1614107591),('Grenada','cs','',1614107591,1614107591),('Grenada','de','',1614107591,1614107591),('Grenada','en','',1614107591,1614107591),('Grenada','es','',1614107591,1614107591),('Grenada','fa','',1614107591,1614107591),('Grenada','fr','',1614107591,1614107591),('Grenada','hu','',1614107591,1614107591),('Grenada','it','',1614107591,1614107591),('Grenada','ja','',1614107591,1614107591),('Grenada','nl','',1614107591,1614107591),('Grenada','pl','',1614107591,1614107591),('Grenada','pt_BR','',1614107591,1614107591),('Grenada','ru','',1614107591,1614107591),('Grenada','sk','',1614107591,1614107591),('Grenada','sv','',1614107591,1614107591),('Grenada','sv_FI','',1614107591,1614107591),('Grenada','th','',1614107591,1614107591),('Grenada','tr','',1614107591,1614107591),('Grenada','uk','',1614107591,1614107591),('Grenada','zh_Hans','',1614107591,1614107591),('Guadeloupe','cs','',1614107591,1614107591),('Guadeloupe','de','',1614107591,1614107591),('Guadeloupe','en','',1614107591,1614107591),('Guadeloupe','es','',1614107591,1614107591),('Guadeloupe','fa','',1614107591,1614107591),('Guadeloupe','fr','',1614107591,1614107591),('Guadeloupe','hu','',1614107591,1614107591),('Guadeloupe','it','',1614107591,1614107591),('Guadeloupe','ja','',1614107591,1614107591),('Guadeloupe','nl','',1614107591,1614107591),('Guadeloupe','pl','',1614107591,1614107591),('Guadeloupe','pt_BR','',1614107591,1614107591),('Guadeloupe','ru','',1614107591,1614107591),('Guadeloupe','sk','',1614107591,1614107591),('Guadeloupe','sv','',1614107591,1614107591),('Guadeloupe','sv_FI','',1614107591,1614107591),('Guadeloupe','th','',1614107591,1614107591),('Guadeloupe','tr','',1614107591,1614107591),('Guadeloupe','uk','',1614107591,1614107591),('Guadeloupe','zh_Hans','',1614107591,1614107591),('Guam','cs','',1614107592,1614107592),('Guam','de','',1614107592,1614107592),('Guam','en','',1614107592,1614107592),('Guam','es','',1614107592,1614107592),('Guam','fa','',1614107592,1614107592),('Guam','fr','',1614107592,1614107592),('Guam','hu','',1614107592,1614107592),('Guam','it','',1614107592,1614107592),('Guam','ja','',1614107592,1614107592),('Guam','nl','',1614107592,1614107592),('Guam','pl','',1614107592,1614107592),('Guam','pt_BR','',1614107592,1614107592),('Guam','ru','',1614107592,1614107592),('Guam','sk','',1614107592,1614107592),('Guam','sv','',1614107592,1614107592),('Guam','sv_FI','',1614107592,1614107592),('Guam','th','',1614107592,1614107592),('Guam','tr','',1614107592,1614107592),('Guam','uk','',1614107592,1614107592),('Guam','zh_Hans','',1614107592,1614107592),('Guatemala','cs','',1614107592,1614107592),('Guatemala','de','',1614107592,1614107592),('Guatemala','en','',1614107592,1614107592),('Guatemala','es','',1614107592,1614107592),('Guatemala','fa','',1614107592,1614107592),('Guatemala','fr','',1614107592,1614107592),('Guatemala','hu','',1614107592,1614107592),('Guatemala','it','',1614107592,1614107592),('Guatemala','ja','',1614107592,1614107592),('Guatemala','nl','',1614107592,1614107592),('Guatemala','pl','',1614107592,1614107592),('Guatemala','pt_BR','',1614107592,1614107592),('Guatemala','ru','',1614107592,1614107592),('Guatemala','sk','',1614107592,1614107592),('Guatemala','sv','',1614107592,1614107592),('Guatemala','sv_FI','',1614107592,1614107592),('Guatemala','th','',1614107592,1614107592),('Guatemala','tr','',1614107592,1614107592),('Guatemala','uk','',1614107592,1614107592),('Guatemala','zh_Hans','',1614107592,1614107592),('Guernsey','cs','',1614107592,1614107592),('Guernsey','de','',1614107592,1614107592),('Guernsey','en','',1614107592,1614107592),('Guernsey','es','',1614107592,1614107592),('Guernsey','fa','',1614107592,1614107592),('Guernsey','fr','',1614107592,1614107592),('Guernsey','hu','',1614107592,1614107592),('Guernsey','it','',1614107592,1614107592),('Guernsey','ja','',1614107592,1614107592),('Guernsey','nl','',1614107592,1614107592),('Guernsey','pl','',1614107592,1614107592),('Guernsey','pt_BR','',1614107592,1614107592),('Guernsey','ru','',1614107592,1614107592),('Guernsey','sk','',1614107592,1614107592),('Guernsey','sv','',1614107592,1614107592),('Guernsey','sv_FI','',1614107592,1614107592),('Guernsey','th','',1614107592,1614107592),('Guernsey','tr','',1614107592,1614107592),('Guernsey','uk','',1614107592,1614107592),('Guernsey','zh_Hans','',1614107592,1614107592),('Guinea','cs','',1614107592,1614107592),('Guinea','de','',1614107592,1614107592),('Guinea','en','',1614107592,1614107592),('Guinea','es','',1614107592,1614107592),('Guinea','fa','',1614107592,1614107592),('Guinea','fr','',1614107592,1614107592),('Guinea','hu','',1614107592,1614107592),('Guinea','it','',1614107592,1614107592),('Guinea','ja','',1614107592,1614107592),('Guinea','nl','',1614107592,1614107592),('Guinea','pl','',1614107592,1614107592),('Guinea','pt_BR','',1614107592,1614107592),('Guinea','ru','',1614107592,1614107592),('Guinea','sk','',1614107592,1614107592),('Guinea','sv','',1614107592,1614107592),('Guinea','sv_FI','',1614107592,1614107592),('Guinea','th','',1614107592,1614107592),('Guinea','tr','',1614107592,1614107592),('Guinea','uk','',1614107592,1614107592),('Guinea','zh_Hans','',1614107592,1614107592),('Guinea-Bissau','cs','',1614107592,1614107592),('Guinea-Bissau','de','',1614107592,1614107592),('Guinea-Bissau','en','',1614107592,1614107592),('Guinea-Bissau','es','',1614107592,1614107592),('Guinea-Bissau','fa','',1614107592,1614107592),('Guinea-Bissau','fr','',1614107592,1614107592),('Guinea-Bissau','hu','',1614107592,1614107592),('Guinea-Bissau','it','',1614107592,1614107592),('Guinea-Bissau','ja','',1614107592,1614107592),('Guinea-Bissau','nl','',1614107592,1614107592),('Guinea-Bissau','pl','',1614107592,1614107592),('Guinea-Bissau','pt_BR','',1614107592,1614107592),('Guinea-Bissau','ru','',1614107592,1614107592),('Guinea-Bissau','sk','',1614107592,1614107592),('Guinea-Bissau','sv','',1614107592,1614107592),('Guinea-Bissau','sv_FI','',1614107592,1614107592),('Guinea-Bissau','th','',1614107592,1614107592),('Guinea-Bissau','tr','',1614107592,1614107592),('Guinea-Bissau','uk','',1614107592,1614107592),('Guinea-Bissau','zh_Hans','',1614107592,1614107592),('Guyana','cs','',1614107592,1614107592),('Guyana','de','',1614107592,1614107592),('Guyana','en','',1614107592,1614107592),('Guyana','es','',1614107592,1614107592),('Guyana','fa','',1614107592,1614107592),('Guyana','fr','',1614107592,1614107592),('Guyana','hu','',1614107592,1614107592),('Guyana','it','',1614107592,1614107592),('Guyana','ja','',1614107592,1614107592),('Guyana','nl','',1614107592,1614107592),('Guyana','pl','',1614107592,1614107592),('Guyana','pt_BR','',1614107592,1614107592),('Guyana','ru','',1614107592,1614107592),('Guyana','sk','',1614107592,1614107592),('Guyana','sv','',1614107592,1614107592),('Guyana','sv_FI','',1614107592,1614107592),('Guyana','th','',1614107592,1614107592),('Guyana','tr','',1614107592,1614107592),('Guyana','uk','',1614107592,1614107592),('Guyana','zh_Hans','',1614107592,1614107592),('Haiti','cs','',1614107592,1614107592),('Haiti','de','',1614107592,1614107592),('Haiti','en','',1614107592,1614107592),('Haiti','es','',1614107592,1614107592),('Haiti','fa','',1614107592,1614107592),('Haiti','fr','',1614107592,1614107592),('Haiti','hu','',1614107592,1614107592),('Haiti','it','',1614107592,1614107592),('Haiti','ja','',1614107592,1614107592),('Haiti','nl','',1614107592,1614107592),('Haiti','pl','',1614107592,1614107592),('Haiti','pt_BR','',1614107592,1614107592),('Haiti','ru','',1614107592,1614107592),('Haiti','sk','',1614107592,1614107592),('Haiti','sv','',1614107592,1614107592),('Haiti','sv_FI','',1614107592,1614107592),('Haiti','th','',1614107592,1614107592),('Haiti','tr','',1614107592,1614107592),('Haiti','uk','',1614107592,1614107592),('Haiti','zh_Hans','',1614107592,1614107592),('Heard & McDonald Islands','cs','',1614107592,1614107592),('Heard & McDonald Islands','de','',1614107592,1614107592),('Heard & McDonald Islands','en','',1614107592,1614107592),('Heard & McDonald Islands','es','',1614107592,1614107592),('Heard & McDonald Islands','fa','',1614107592,1614107592),('Heard & McDonald Islands','fr','',1614107592,1614107592),('Heard & McDonald Islands','hu','',1614107592,1614107592),('Heard & McDonald Islands','it','',1614107592,1614107592),('Heard & McDonald Islands','ja','',1614107592,1614107592),('Heard & McDonald Islands','nl','',1614107592,1614107592),('Heard & McDonald Islands','pl','',1614107592,1614107592),('Heard & McDonald Islands','pt_BR','',1614107592,1614107592),('Heard & McDonald Islands','ru','',1614107592,1614107592),('Heard & McDonald Islands','sk','',1614107592,1614107592),('Heard & McDonald Islands','sv','',1614107592,1614107592),('Heard & McDonald Islands','sv_FI','',1614107592,1614107592),('Heard & McDonald Islands','th','',1614107592,1614107592),('Heard & McDonald Islands','tr','',1614107592,1614107592),('Heard & McDonald Islands','uk','',1614107592,1614107592),('Heard & McDonald Islands','zh_Hans','',1614107592,1614107592),('Honduras','cs','',1614107593,1614107593),('Honduras','de','',1614107593,1614107593),('Honduras','en','',1614107593,1614107593),('Honduras','es','',1614107593,1614107593),('Honduras','fa','',1614107593,1614107593),('Honduras','fr','',1614107593,1614107593),('Honduras','hu','',1614107593,1614107593),('Honduras','it','',1614107593,1614107593),('Honduras','ja','',1614107593,1614107593),('Honduras','nl','',1614107593,1614107593),('Honduras','pl','',1614107593,1614107593),('Honduras','pt_BR','',1614107593,1614107593),('Honduras','ru','',1614107593,1614107593),('Honduras','sk','',1614107593,1614107593),('Honduras','sv','',1614107593,1614107593),('Honduras','sv_FI','',1614107593,1614107593),('Honduras','th','',1614107593,1614107593),('Honduras','tr','',1614107593,1614107593),('Honduras','uk','',1614107593,1614107593),('Honduras','zh_Hans','',1614107593,1614107593),('Hong Kong SAR China','cs','',1614107593,1614107593),('Hong Kong SAR China','de','',1614107593,1614107593),('Hong Kong SAR China','en','',1614107593,1614107593),('Hong Kong SAR China','es','',1614107593,1614107593),('Hong Kong SAR China','fa','',1614107593,1614107593),('Hong Kong SAR China','fr','',1614107593,1614107593),('Hong Kong SAR China','hu','',1614107593,1614107593),('Hong Kong SAR China','it','',1614107593,1614107593),('Hong Kong SAR China','ja','',1614107593,1614107593),('Hong Kong SAR China','nl','',1614107593,1614107593),('Hong Kong SAR China','pl','',1614107593,1614107593),('Hong Kong SAR China','pt_BR','',1614107593,1614107593),('Hong Kong SAR China','ru','',1614107593,1614107593),('Hong Kong SAR China','sk','',1614107593,1614107593),('Hong Kong SAR China','sv','',1614107593,1614107593),('Hong Kong SAR China','sv_FI','',1614107593,1614107593),('Hong Kong SAR China','th','',1614107593,1614107593),('Hong Kong SAR China','tr','',1614107593,1614107593),('Hong Kong SAR China','uk','',1614107593,1614107593),('Hong Kong SAR China','zh_Hans','',1614107593,1614107593),('Hungary','cs','',1614107593,1614107593),('Hungary','de','',1614107593,1614107593),('Hungary','en','',1614107593,1614107593),('Hungary','es','',1614107593,1614107593),('Hungary','fa','',1614107593,1614107593),('Hungary','fr','',1614107593,1614107593),('Hungary','hu','',1614107593,1614107593),('Hungary','it','',1614107593,1614107593),('Hungary','ja','',1614107593,1614107593),('Hungary','nl','',1614107593,1614107593),('Hungary','pl','',1614107593,1614107593),('Hungary','pt_BR','',1614107593,1614107593),('Hungary','ru','',1614107593,1614107593),('Hungary','sk','',1614107593,1614107593),('Hungary','sv','',1614107593,1614107593),('Hungary','sv_FI','',1614107593,1614107593),('Hungary','th','',1614107593,1614107593),('Hungary','tr','',1614107593,1614107593),('Hungary','uk','',1614107593,1614107593),('Hungary','zh_Hans','',1614107593,1614107593),('Iceland','cs','',1614107593,1614107593),('Iceland','de','',1614107593,1614107593),('Iceland','en','',1614107593,1614107593),('Iceland','es','',1614107593,1614107593),('Iceland','fa','',1614107593,1614107593),('Iceland','fr','',1614107593,1614107593),('Iceland','hu','',1614107593,1614107593),('Iceland','it','',1614107593,1614107593),('Iceland','ja','',1614107593,1614107593),('Iceland','nl','',1614107593,1614107593),('Iceland','pl','',1614107593,1614107593),('Iceland','pt_BR','',1614107593,1614107593),('Iceland','ru','',1614107593,1614107593),('Iceland','sk','',1614107593,1614107593),('Iceland','sv','',1614107593,1614107593),('Iceland','sv_FI','',1614107593,1614107593),('Iceland','th','',1614107593,1614107593),('Iceland','tr','',1614107593,1614107593),('Iceland','uk','',1614107593,1614107593),('Iceland','zh_Hans','',1614107593,1614107593),('Image','cs','',1614107692,1614107692),('Image','de','',1614107692,1614107692),('Image','en','',1614107692,1614107692),('Image','es','',1614107692,1614107692),('Image','fa','',1614107692,1614107692),('Image','fr','',1614107692,1614107692),('Image','hu','',1614107692,1614107692),('Image','it','',1614107692,1614107692),('Image','ja','',1614107692,1614107692),('Image','nl','',1614107692,1614107692),('Image','pl','',1614107692,1614107692),('Image','pt_BR','',1614107692,1614107692),('Image','ru','',1614107692,1614107692),('Image','sk','',1614107692,1614107692),('Image','sv','',1614107692,1614107692),('Image','sv_FI','',1614107692,1614107692),('Image','th','',1614107692,1614107692),('Image','tr','',1614107692,1614107692),('Image','uk','',1614107692,1614107692),('Image','zh_Hans','',1614107692,1614107692),('India','cs','',1614107593,1614107593),('India','de','',1614107593,1614107593),('India','en','',1614107593,1614107593),('India','es','',1614107593,1614107593),('India','fa','',1614107593,1614107593),('India','fr','',1614107593,1614107593),('India','hu','',1614107593,1614107593),('India','it','',1614107593,1614107593),('India','ja','',1614107593,1614107593),('India','nl','',1614107593,1614107593),('India','pl','',1614107593,1614107593),('India','pt_BR','',1614107593,1614107593),('India','ru','',1614107593,1614107593),('India','sk','',1614107593,1614107593),('India','sv','',1614107593,1614107593),('India','sv_FI','',1614107593,1614107593),('India','th','',1614107593,1614107593),('India','tr','',1614107593,1614107593),('India','uk','',1614107593,1614107593),('India','zh_Hans','',1614107593,1614107593),('Indonesia','cs','',1614107593,1614107593),('Indonesia','de','',1614107593,1614107593),('Indonesia','en','',1614107593,1614107593),('Indonesia','es','',1614107593,1614107593),('Indonesia','fa','',1614107593,1614107593),('Indonesia','fr','',1614107593,1614107593),('Indonesia','hu','',1614107593,1614107593),('Indonesia','it','',1614107593,1614107593),('Indonesia','ja','',1614107593,1614107593),('Indonesia','nl','',1614107593,1614107593),('Indonesia','pl','',1614107593,1614107593),('Indonesia','pt_BR','',1614107593,1614107593),('Indonesia','ru','',1614107593,1614107593),('Indonesia','sk','',1614107593,1614107593),('Indonesia','sv','',1614107593,1614107593),('Indonesia','sv_FI','',1614107593,1614107593),('Indonesia','th','',1614107593,1614107593),('Indonesia','tr','',1614107593,1614107593),('Indonesia','uk','',1614107593,1614107593),('Indonesia','zh_Hans','',1614107593,1614107593),('Iran','cs','',1614107594,1614107594),('Iran','de','',1614107594,1614107594),('Iran','en','',1614107594,1614107594),('Iran','es','',1614107594,1614107594),('Iran','fa','',1614107594,1614107594),('Iran','fr','',1614107594,1614107594),('Iran','hu','',1614107594,1614107594),('Iran','it','',1614107594,1614107594),('Iran','ja','',1614107594,1614107594),('Iran','nl','',1614107594,1614107594),('Iran','pl','',1614107594,1614107594),('Iran','pt_BR','',1614107594,1614107594),('Iran','ru','',1614107594,1614107594),('Iran','sk','',1614107594,1614107594),('Iran','sv','',1614107594,1614107594),('Iran','sv_FI','',1614107594,1614107594),('Iran','th','',1614107594,1614107594),('Iran','tr','',1614107594,1614107594),('Iran','uk','',1614107594,1614107594),('Iran','zh_Hans','',1614107594,1614107594),('Iraq','cs','',1614107594,1614107594),('Iraq','de','',1614107594,1614107594),('Iraq','en','',1614107594,1614107594),('Iraq','es','',1614107594,1614107594),('Iraq','fa','',1614107594,1614107594),('Iraq','fr','',1614107594,1614107594),('Iraq','hu','',1614107594,1614107594),('Iraq','it','',1614107594,1614107594),('Iraq','ja','',1614107594,1614107594),('Iraq','nl','',1614107594,1614107594),('Iraq','pl','',1614107594,1614107594),('Iraq','pt_BR','',1614107594,1614107594),('Iraq','ru','',1614107594,1614107594),('Iraq','sk','',1614107594,1614107594),('Iraq','sv','',1614107594,1614107594),('Iraq','sv_FI','',1614107594,1614107594),('Iraq','th','',1614107594,1614107594),('Iraq','tr','',1614107594,1614107594),('Iraq','uk','',1614107594,1614107594),('Iraq','zh_Hans','',1614107594,1614107594),('Ireland','cs','',1614107594,1614107594),('Ireland','de','',1614107594,1614107594),('Ireland','en','',1614107594,1614107594),('Ireland','es','',1614107594,1614107594),('Ireland','fa','',1614107594,1614107594),('Ireland','fr','',1614107594,1614107594),('Ireland','hu','',1614107594,1614107594),('Ireland','it','',1614107594,1614107594),('Ireland','ja','',1614107594,1614107594),('Ireland','nl','',1614107594,1614107594),('Ireland','pl','',1614107594,1614107594),('Ireland','pt_BR','',1614107594,1614107594),('Ireland','ru','',1614107594,1614107594),('Ireland','sk','',1614107594,1614107594),('Ireland','sv','',1614107594,1614107594),('Ireland','sv_FI','',1614107594,1614107594),('Ireland','th','',1614107594,1614107594),('Ireland','tr','',1614107594,1614107594),('Ireland','uk','',1614107594,1614107594),('Ireland','zh_Hans','',1614107594,1614107594),('Isle of Man','cs','',1614107594,1614107594),('Isle of Man','de','',1614107594,1614107594),('Isle of Man','en','',1614107594,1614107594),('Isle of Man','es','',1614107594,1614107594),('Isle of Man','fa','',1614107594,1614107594),('Isle of Man','fr','',1614107594,1614107594),('Isle of Man','hu','',1614107594,1614107594),('Isle of Man','it','',1614107594,1614107594),('Isle of Man','ja','',1614107594,1614107594),('Isle of Man','nl','',1614107594,1614107594),('Isle of Man','pl','',1614107594,1614107594),('Isle of Man','pt_BR','',1614107594,1614107594),('Isle of Man','ru','',1614107594,1614107594),('Isle of Man','sk','',1614107594,1614107594),('Isle of Man','sv','',1614107594,1614107594),('Isle of Man','sv_FI','',1614107594,1614107594),('Isle of Man','th','',1614107594,1614107594),('Isle of Man','tr','',1614107594,1614107594),('Isle of Man','uk','',1614107594,1614107594),('Isle of Man','zh_Hans','',1614107594,1614107594),('Israel','cs','',1614107594,1614107594),('Israel','de','',1614107594,1614107594),('Israel','en','',1614107594,1614107594),('Israel','es','',1614107594,1614107594),('Israel','fa','',1614107594,1614107594),('Israel','fr','',1614107594,1614107594),('Israel','hu','',1614107594,1614107594),('Israel','it','',1614107594,1614107594),('Israel','ja','',1614107594,1614107594),('Israel','nl','',1614107594,1614107594),('Israel','pl','',1614107594,1614107594),('Israel','pt_BR','',1614107594,1614107594),('Israel','ru','',1614107594,1614107594),('Israel','sk','',1614107594,1614107594),('Israel','sv','',1614107594,1614107594),('Israel','sv_FI','',1614107594,1614107594),('Israel','th','',1614107594,1614107594),('Israel','tr','',1614107594,1614107594),('Israel','uk','',1614107594,1614107594),('Israel','zh_Hans','',1614107594,1614107594),('Italy','cs','',1614107594,1614107594),('Italy','de','',1614107594,1614107594),('Italy','en','',1614107594,1614107594),('Italy','es','',1614107594,1614107594),('Italy','fa','',1614107594,1614107594),('Italy','fr','',1614107594,1614107594),('Italy','hu','',1614107594,1614107594),('Italy','it','',1614107594,1614107594),('Italy','ja','',1614107594,1614107594),('Italy','nl','',1614107594,1614107594),('Italy','pl','',1614107594,1614107594),('Italy','pt_BR','',1614107594,1614107594),('Italy','ru','',1614107594,1614107594),('Italy','sk','',1614107594,1614107594),('Italy','sv','',1614107594,1614107594),('Italy','sv_FI','',1614107594,1614107594),('Italy','th','',1614107594,1614107594),('Italy','tr','',1614107594,1614107594),('Italy','uk','',1614107594,1614107594),('Italy','zh_Hans','',1614107594,1614107594),('Jamaica','cs','',1614107594,1614107594),('Jamaica','de','',1614107594,1614107594),('Jamaica','en','',1614107594,1614107594),('Jamaica','es','',1614107594,1614107594),('Jamaica','fa','',1614107594,1614107594),('Jamaica','fr','',1614107594,1614107594),('Jamaica','hu','',1614107594,1614107594),('Jamaica','it','',1614107594,1614107594),('Jamaica','ja','',1614107594,1614107594),('Jamaica','nl','',1614107594,1614107594),('Jamaica','pl','',1614107594,1614107594),('Jamaica','pt_BR','',1614107594,1614107594),('Jamaica','ru','',1614107594,1614107594),('Jamaica','sk','',1614107594,1614107594),('Jamaica','sv','',1614107594,1614107594),('Jamaica','sv_FI','',1614107594,1614107594),('Jamaica','th','',1614107594,1614107594),('Jamaica','tr','',1614107594,1614107594),('Jamaica','uk','',1614107594,1614107594),('Jamaica','zh_Hans','',1614107594,1614107594),('Japan','cs','',1614107595,1614107595),('Japan','de','',1614107595,1614107595),('Japan','en','',1614107595,1614107595),('Japan','es','',1614107595,1614107595),('Japan','fa','',1614107595,1614107595),('Japan','fr','',1614107595,1614107595),('Japan','hu','',1614107595,1614107595),('Japan','it','',1614107595,1614107595),('Japan','ja','',1614107595,1614107595),('Japan','nl','',1614107595,1614107595),('Japan','pl','',1614107595,1614107595),('Japan','pt_BR','',1614107595,1614107595),('Japan','ru','',1614107595,1614107595),('Japan','sk','',1614107595,1614107595),('Japan','sv','',1614107595,1614107595),('Japan','sv_FI','',1614107595,1614107595),('Japan','th','',1614107595,1614107595),('Japan','tr','',1614107595,1614107595),('Japan','uk','',1614107595,1614107595),('Japan','zh_Hans','',1614107595,1614107595),('Jersey','cs','',1614107595,1614107595),('Jersey','de','',1614107595,1614107595),('Jersey','en','',1614107595,1614107595),('Jersey','es','',1614107595,1614107595),('Jersey','fa','',1614107595,1614107595),('Jersey','fr','',1614107595,1614107595),('Jersey','hu','',1614107595,1614107595),('Jersey','it','',1614107595,1614107595),('Jersey','ja','',1614107595,1614107595),('Jersey','nl','',1614107595,1614107595),('Jersey','pl','',1614107595,1614107595),('Jersey','pt_BR','',1614107595,1614107595),('Jersey','ru','',1614107595,1614107595),('Jersey','sk','',1614107595,1614107595),('Jersey','sv','',1614107595,1614107595),('Jersey','sv_FI','',1614107595,1614107595),('Jersey','th','',1614107595,1614107595),('Jersey','tr','',1614107595,1614107595),('Jersey','uk','',1614107595,1614107595),('Jersey','zh_Hans','',1614107595,1614107595),('Jordan','cs','',1614107595,1614107595),('Jordan','de','',1614107595,1614107595),('Jordan','en','',1614107595,1614107595),('Jordan','es','',1614107595,1614107595),('Jordan','fa','',1614107595,1614107595),('Jordan','fr','',1614107595,1614107595),('Jordan','hu','',1614107595,1614107595),('Jordan','it','',1614107595,1614107595),('Jordan','ja','',1614107595,1614107595),('Jordan','nl','',1614107595,1614107595),('Jordan','pl','',1614107595,1614107595),('Jordan','pt_BR','',1614107595,1614107595),('Jordan','ru','',1614107595,1614107595),('Jordan','sk','',1614107595,1614107595),('Jordan','sv','',1614107595,1614107595),('Jordan','sv_FI','',1614107595,1614107595),('Jordan','th','',1614107595,1614107595),('Jordan','tr','',1614107595,1614107595),('Jordan','uk','',1614107595,1614107595),('Jordan','zh_Hans','',1614107595,1614107595),('Kazakhstan','cs','',1614107595,1614107595),('Kazakhstan','de','',1614107595,1614107595),('Kazakhstan','en','',1614107595,1614107595),('Kazakhstan','es','',1614107595,1614107595),('Kazakhstan','fa','',1614107595,1614107595),('Kazakhstan','fr','',1614107595,1614107595),('Kazakhstan','hu','',1614107595,1614107595),('Kazakhstan','it','',1614107595,1614107595),('Kazakhstan','ja','',1614107595,1614107595),('Kazakhstan','nl','',1614107595,1614107595),('Kazakhstan','pl','',1614107595,1614107595),('Kazakhstan','pt_BR','',1614107595,1614107595),('Kazakhstan','ru','',1614107595,1614107595),('Kazakhstan','sk','',1614107595,1614107595),('Kazakhstan','sv','',1614107595,1614107595),('Kazakhstan','sv_FI','',1614107595,1614107595),('Kazakhstan','th','',1614107595,1614107595),('Kazakhstan','tr','',1614107595,1614107595),('Kazakhstan','uk','',1614107595,1614107595),('Kazakhstan','zh_Hans','',1614107595,1614107595),('Kenya','cs','',1614107595,1614107595),('Kenya','de','',1614107595,1614107595),('Kenya','en','',1614107595,1614107595),('Kenya','es','',1614107595,1614107595),('Kenya','fa','',1614107595,1614107595),('Kenya','fr','',1614107595,1614107595),('Kenya','hu','',1614107595,1614107595),('Kenya','it','',1614107595,1614107595),('Kenya','ja','',1614107595,1614107595),('Kenya','nl','',1614107595,1614107595),('Kenya','pl','',1614107595,1614107595),('Kenya','pt_BR','',1614107595,1614107595),('Kenya','ru','',1614107595,1614107595),('Kenya','sk','',1614107595,1614107595),('Kenya','sv','',1614107595,1614107595),('Kenya','sv_FI','',1614107595,1614107595),('Kenya','th','',1614107595,1614107595),('Kenya','tr','',1614107595,1614107595),('Kenya','uk','',1614107595,1614107595),('Kenya','zh_Hans','',1614107595,1614107595),('Kiribati','cs','',1614107595,1614107595),('Kiribati','de','',1614107595,1614107595),('Kiribati','en','',1614107595,1614107595),('Kiribati','es','',1614107595,1614107595),('Kiribati','fa','',1614107595,1614107595),('Kiribati','fr','',1614107595,1614107595),('Kiribati','hu','',1614107595,1614107595),('Kiribati','it','',1614107595,1614107595),('Kiribati','ja','',1614107595,1614107595),('Kiribati','nl','',1614107595,1614107595),('Kiribati','pl','',1614107595,1614107595),('Kiribati','pt_BR','',1614107595,1614107595),('Kiribati','ru','',1614107595,1614107595),('Kiribati','sk','',1614107595,1614107595),('Kiribati','sv','',1614107595,1614107595),('Kiribati','sv_FI','',1614107595,1614107595),('Kiribati','th','',1614107595,1614107595),('Kiribati','tr','',1614107595,1614107595),('Kiribati','uk','',1614107595,1614107595),('Kiribati','zh_Hans','',1614107595,1614107595),('Kuwait','cs','',1614107596,1614107596),('Kuwait','de','',1614107596,1614107596),('Kuwait','en','',1614107596,1614107596),('Kuwait','es','',1614107596,1614107596),('Kuwait','fa','',1614107596,1614107596),('Kuwait','fr','',1614107596,1614107596),('Kuwait','hu','',1614107596,1614107596),('Kuwait','it','',1614107596,1614107596),('Kuwait','ja','',1614107596,1614107596),('Kuwait','nl','',1614107596,1614107596),('Kuwait','pl','',1614107596,1614107596),('Kuwait','pt_BR','',1614107596,1614107596),('Kuwait','ru','',1614107596,1614107596),('Kuwait','sk','',1614107596,1614107596),('Kuwait','sv','',1614107596,1614107596),('Kuwait','sv_FI','',1614107596,1614107596),('Kuwait','th','',1614107596,1614107596),('Kuwait','tr','',1614107596,1614107596),('Kuwait','uk','',1614107596,1614107596),('Kuwait','zh_Hans','',1614107596,1614107596),('Kyrgyzstan','cs','',1614107596,1614107596),('Kyrgyzstan','de','',1614107596,1614107596),('Kyrgyzstan','en','',1614107596,1614107596),('Kyrgyzstan','es','',1614107596,1614107596),('Kyrgyzstan','fa','',1614107596,1614107596),('Kyrgyzstan','fr','',1614107596,1614107596),('Kyrgyzstan','hu','',1614107596,1614107596),('Kyrgyzstan','it','',1614107596,1614107596),('Kyrgyzstan','ja','',1614107596,1614107596),('Kyrgyzstan','nl','',1614107596,1614107596),('Kyrgyzstan','pl','',1614107596,1614107596),('Kyrgyzstan','pt_BR','',1614107596,1614107596),('Kyrgyzstan','ru','',1614107596,1614107596),('Kyrgyzstan','sk','',1614107596,1614107596),('Kyrgyzstan','sv','',1614107596,1614107596),('Kyrgyzstan','sv_FI','',1614107596,1614107596),('Kyrgyzstan','th','',1614107596,1614107596),('Kyrgyzstan','tr','',1614107596,1614107596),('Kyrgyzstan','uk','',1614107596,1614107596),('Kyrgyzstan','zh_Hans','',1614107596,1614107596),('L','cs','',1614106914,1614106914),('L','de','',1614106914,1614106914),('L','en','',1614106914,1614106914),('L','es','',1614106914,1614106914),('L','fa','',1614106914,1614106914),('L','fr','',1614106914,1614106914),('L','hu','',1614106914,1614106914),('L','it','',1614106914,1614106914),('L','ja','',1614106914,1614106914),('L','nl','',1614106914,1614106914),('L','pl','',1614106914,1614106914),('L','pt_BR','',1614106914,1614106914),('L','ru','',1614106914,1614106914),('L','sk','',1614106914,1614106914),('L','sv','',1614106914,1614106914),('L','sv_FI','',1614106914,1614106914),('L','th','',1614106914,1614106914),('L','tr','',1614106914,1614106914),('L','uk','',1614106914,1614106914),('L','zh_Hans','',1614106914,1614106914),('Lantern Sleeve','cs','',1614107400,1614107400),('Lantern Sleeve','de','',1614107400,1614107400),('Lantern Sleeve','en','',1614107400,1614107400),('Lantern Sleeve','es','',1614107400,1614107400),('Lantern Sleeve','fa','',1614107400,1614107400),('Lantern Sleeve','fr','',1614107400,1614107400),('Lantern Sleeve','hu','',1614107400,1614107400),('Lantern Sleeve','it','',1614107400,1614107400),('Lantern Sleeve','ja','',1614107400,1614107400),('Lantern Sleeve','nl','',1614107400,1614107400),('Lantern Sleeve','pl','',1614107400,1614107400),('Lantern Sleeve','pt_BR','',1614107400,1614107400),('Lantern Sleeve','ru','',1614107400,1614107400),('Lantern Sleeve','sk','',1614107400,1614107400),('Lantern Sleeve','sv','',1614107400,1614107400),('Lantern Sleeve','sv_FI','',1614107400,1614107400),('Lantern Sleeve','th','',1614107400,1614107400),('Lantern Sleeve','tr','',1614107400,1614107400),('Lantern Sleeve','uk','',1614107400,1614107400),('Lantern Sleeve','zh_Hans','',1614107400,1614107400),('Laos','cs','',1614107596,1614107596),('Laos','de','',1614107596,1614107596),('Laos','en','',1614107596,1614107596),('Laos','es','',1614107596,1614107596),('Laos','fa','',1614107596,1614107596),('Laos','fr','',1614107596,1614107596),('Laos','hu','',1614107596,1614107596),('Laos','it','',1614107596,1614107596),('Laos','ja','',1614107596,1614107596),('Laos','nl','',1614107596,1614107596),('Laos','pl','',1614107596,1614107596),('Laos','pt_BR','',1614107596,1614107596),('Laos','ru','',1614107596,1614107596),('Laos','sk','',1614107596,1614107596),('Laos','sv','',1614107596,1614107596),('Laos','sv_FI','',1614107596,1614107596),('Laos','th','',1614107596,1614107596),('Laos','tr','',1614107596,1614107596),('Laos','uk','',1614107596,1614107596),('Laos','zh_Hans','',1614107596,1614107596),('Latvia','cs','',1614107596,1614107596),('Latvia','de','',1614107596,1614107596),('Latvia','en','',1614107596,1614107596),('Latvia','es','',1614107596,1614107596),('Latvia','fa','',1614107596,1614107596),('Latvia','fr','',1614107596,1614107596),('Latvia','hu','',1614107596,1614107596),('Latvia','it','',1614107596,1614107596),('Latvia','ja','',1614107596,1614107596),('Latvia','nl','',1614107596,1614107596),('Latvia','pl','',1614107596,1614107596),('Latvia','pt_BR','',1614107596,1614107596),('Latvia','ru','',1614107596,1614107596),('Latvia','sk','',1614107596,1614107596),('Latvia','sv','',1614107596,1614107596),('Latvia','sv_FI','',1614107596,1614107596),('Latvia','th','',1614107596,1614107596),('Latvia','tr','',1614107596,1614107596),('Latvia','uk','',1614107596,1614107596),('Latvia','zh_Hans','',1614107596,1614107596),('Lebanon','cs','',1614107596,1614107596),('Lebanon','de','',1614107596,1614107596),('Lebanon','en','',1614107596,1614107596),('Lebanon','es','',1614107596,1614107596),('Lebanon','fa','',1614107596,1614107596),('Lebanon','fr','',1614107596,1614107596),('Lebanon','hu','',1614107596,1614107596),('Lebanon','it','',1614107596,1614107596),('Lebanon','ja','',1614107596,1614107596),('Lebanon','nl','',1614107596,1614107596),('Lebanon','pl','',1614107596,1614107596),('Lebanon','pt_BR','',1614107596,1614107596),('Lebanon','ru','',1614107596,1614107596),('Lebanon','sk','',1614107596,1614107596),('Lebanon','sv','',1614107596,1614107596),('Lebanon','sv_FI','',1614107596,1614107596),('Lebanon','th','',1614107596,1614107596),('Lebanon','tr','',1614107596,1614107596),('Lebanon','uk','',1614107596,1614107596),('Lebanon','zh_Hans','',1614107596,1614107596),('Lesotho','cs','',1614107596,1614107596),('Lesotho','de','',1614107596,1614107596),('Lesotho','en','',1614107596,1614107596),('Lesotho','es','',1614107596,1614107596),('Lesotho','fa','',1614107596,1614107596),('Lesotho','fr','',1614107596,1614107596),('Lesotho','hu','',1614107596,1614107596),('Lesotho','it','',1614107596,1614107596),('Lesotho','ja','',1614107596,1614107596),('Lesotho','nl','',1614107596,1614107596),('Lesotho','pl','',1614107596,1614107596),('Lesotho','pt_BR','',1614107596,1614107596),('Lesotho','ru','',1614107596,1614107596),('Lesotho','sk','',1614107596,1614107596),('Lesotho','sv','',1614107596,1614107596),('Lesotho','sv_FI','',1614107596,1614107596),('Lesotho','th','',1614107596,1614107596),('Lesotho','tr','',1614107596,1614107596),('Lesotho','uk','',1614107596,1614107596),('Lesotho','zh_Hans','',1614107596,1614107596),('Liberia','cs','',1614107596,1614107596),('Liberia','de','',1614107596,1614107596),('Liberia','en','',1614107596,1614107596),('Liberia','es','',1614107596,1614107596),('Liberia','fa','',1614107596,1614107596),('Liberia','fr','',1614107596,1614107596),('Liberia','hu','',1614107596,1614107596),('Liberia','it','',1614107596,1614107596),('Liberia','ja','',1614107596,1614107596),('Liberia','nl','',1614107596,1614107596),('Liberia','pl','',1614107596,1614107596),('Liberia','pt_BR','',1614107596,1614107596),('Liberia','ru','',1614107596,1614107596),('Liberia','sk','',1614107596,1614107596),('Liberia','sv','',1614107596,1614107596),('Liberia','sv_FI','',1614107596,1614107596),('Liberia','th','',1614107596,1614107596),('Liberia','tr','',1614107596,1614107596),('Liberia','uk','',1614107596,1614107596),('Liberia','zh_Hans','',1614107596,1614107596),('Libya','cs','',1614107596,1614107596),('Libya','de','',1614107596,1614107596),('Libya','en','',1614107596,1614107596),('Libya','es','',1614107596,1614107596),('Libya','fa','',1614107596,1614107596),('Libya','fr','',1614107596,1614107596),('Libya','hu','',1614107596,1614107596),('Libya','it','',1614107596,1614107596),('Libya','ja','',1614107596,1614107596),('Libya','nl','',1614107596,1614107596),('Libya','pl','',1614107596,1614107596),('Libya','pt_BR','',1614107596,1614107596),('Libya','ru','',1614107596,1614107596),('Libya','sk','',1614107596,1614107596),('Libya','sv','',1614107596,1614107596),('Libya','sv_FI','',1614107596,1614107596),('Libya','th','',1614107596,1614107596),('Libya','tr','',1614107596,1614107596),('Libya','uk','',1614107596,1614107596),('Libya','zh_Hans','',1614107596,1614107596),('Liechtenstein','cs','',1614107596,1614107596),('Liechtenstein','de','',1614107596,1614107596),('Liechtenstein','en','',1614107596,1614107596),('Liechtenstein','es','',1614107596,1614107596),('Liechtenstein','fa','',1614107596,1614107596),('Liechtenstein','fr','',1614107596,1614107596),('Liechtenstein','hu','',1614107596,1614107596),('Liechtenstein','it','',1614107596,1614107596),('Liechtenstein','ja','',1614107596,1614107596),('Liechtenstein','nl','',1614107596,1614107596),('Liechtenstein','pl','',1614107596,1614107596),('Liechtenstein','pt_BR','',1614107596,1614107596),('Liechtenstein','ru','',1614107596,1614107596),('Liechtenstein','sk','',1614107596,1614107596),('Liechtenstein','sv','',1614107596,1614107596),('Liechtenstein','sv_FI','',1614107596,1614107596),('Liechtenstein','th','',1614107596,1614107596),('Liechtenstein','tr','',1614107596,1614107596),('Liechtenstein','uk','',1614107596,1614107596),('Liechtenstein','zh_Hans','',1614107596,1614107596),('Lithuania','cs','',1614107597,1614107597),('Lithuania','de','',1614107597,1614107597),('Lithuania','en','',1614107597,1614107597),('Lithuania','es','',1614107597,1614107597),('Lithuania','fa','',1614107597,1614107597),('Lithuania','fr','',1614107597,1614107597),('Lithuania','hu','',1614107597,1614107597),('Lithuania','it','',1614107597,1614107597),('Lithuania','ja','',1614107597,1614107597),('Lithuania','nl','',1614107597,1614107597),('Lithuania','pl','',1614107597,1614107597),('Lithuania','pt_BR','',1614107597,1614107597),('Lithuania','ru','',1614107597,1614107597),('Lithuania','sk','',1614107597,1614107597),('Lithuania','sv','',1614107597,1614107597),('Lithuania','sv_FI','',1614107597,1614107597),('Lithuania','th','',1614107597,1614107597),('Lithuania','tr','',1614107597,1614107597),('Lithuania','uk','',1614107597,1614107597),('Lithuania','zh_Hans','',1614107597,1614107597),('Luxembourg','cs','',1614107597,1614107597),('Luxembourg','de','',1614107597,1614107597),('Luxembourg','en','',1614107597,1614107597),('Luxembourg','es','',1614107597,1614107597),('Luxembourg','fa','',1614107597,1614107597),('Luxembourg','fr','',1614107597,1614107597),('Luxembourg','hu','',1614107597,1614107597),('Luxembourg','it','',1614107597,1614107597),('Luxembourg','ja','',1614107597,1614107597),('Luxembourg','nl','',1614107597,1614107597),('Luxembourg','pl','',1614107597,1614107597),('Luxembourg','pt_BR','',1614107597,1614107597),('Luxembourg','ru','',1614107597,1614107597),('Luxembourg','sk','',1614107597,1614107597),('Luxembourg','sv','',1614107597,1614107597),('Luxembourg','sv_FI','',1614107597,1614107597),('Luxembourg','th','',1614107597,1614107597),('Luxembourg','tr','',1614107597,1614107597),('Luxembourg','uk','',1614107597,1614107597),('Luxembourg','zh_Hans','',1614107597,1614107597),('M','cs','',1614106914,1614106914),('M','de','',1614106914,1614106914),('M','en','',1614106914,1614106914),('M','es','',1614106914,1614106914),('M','fa','',1614106914,1614106914),('M','fr','',1614106914,1614106914),('M','hu','',1614106914,1614106914),('M','it','',1614106914,1614106914),('M','ja','',1614106914,1614106914),('M','nl','',1614106914,1614106914),('M','pl','',1614106914,1614106914),('M','pt_BR','',1614106914,1614106914),('M','ru','',1614106914,1614106914),('M','sk','',1614106914,1614106914),('M','sv','',1614106914,1614106914),('M','sv_FI','',1614106914,1614106914),('M','th','',1614106914,1614106914),('M','tr','',1614106914,1614106914),('M','uk','',1614106914,1614106914),('M','zh_Hans','',1614106914,1614106914),('Macao SAR China','cs','',1614107597,1614107597),('Macao SAR China','de','',1614107597,1614107597),('Macao SAR China','en','',1614107597,1614107597),('Macao SAR China','es','',1614107597,1614107597),('Macao SAR China','fa','',1614107597,1614107597),('Macao SAR China','fr','',1614107597,1614107597),('Macao SAR China','hu','',1614107597,1614107597),('Macao SAR China','it','',1614107597,1614107597),('Macao SAR China','ja','',1614107597,1614107597),('Macao SAR China','nl','',1614107597,1614107597),('Macao SAR China','pl','',1614107597,1614107597),('Macao SAR China','pt_BR','',1614107597,1614107597),('Macao SAR China','ru','',1614107597,1614107597),('Macao SAR China','sk','',1614107597,1614107597),('Macao SAR China','sv','',1614107597,1614107597),('Macao SAR China','sv_FI','',1614107597,1614107597),('Macao SAR China','th','',1614107597,1614107597),('Macao SAR China','tr','',1614107597,1614107597),('Macao SAR China','uk','',1614107597,1614107597),('Macao SAR China','zh_Hans','',1614107597,1614107597),('Madagascar','cs','',1614107597,1614107597),('Madagascar','de','',1614107597,1614107597),('Madagascar','en','',1614107597,1614107597),('Madagascar','es','',1614107597,1614107597),('Madagascar','fa','',1614107597,1614107597),('Madagascar','fr','',1614107597,1614107597),('Madagascar','hu','',1614107597,1614107597),('Madagascar','it','',1614107597,1614107597),('Madagascar','ja','',1614107597,1614107597),('Madagascar','nl','',1614107597,1614107597),('Madagascar','pl','',1614107597,1614107597),('Madagascar','pt_BR','',1614107597,1614107597),('Madagascar','ru','',1614107597,1614107597),('Madagascar','sk','',1614107597,1614107597),('Madagascar','sv','',1614107597,1614107597),('Madagascar','sv_FI','',1614107597,1614107597),('Madagascar','th','',1614107597,1614107597),('Madagascar','tr','',1614107597,1614107597),('Madagascar','uk','',1614107597,1614107597),('Madagascar','zh_Hans','',1614107597,1614107597),('Made In','cs','',1614107580,1614107580),('Made In','de','',1614107580,1614107580),('Made In','en','',1614107580,1614107580),('Made In','es','',1614107580,1614107580),('Made In','fa','',1614107580,1614107580),('Made In','fr','',1614107580,1614107580),('Made In','hu','',1614107580,1614107580),('Made In','it','',1614107580,1614107580),('Made In','ja','',1614107580,1614107580),('Made In','nl','',1614107580,1614107580),('Made In','pl','',1614107580,1614107580),('Made In','pt_BR','',1614107580,1614107580),('Made In','ru','',1614107580,1614107580),('Made In','sk','',1614107580,1614107580),('Made In','sv','',1614107580,1614107580),('Made In','sv_FI','',1614107580,1614107580),('Made In','th','',1614107580,1614107580),('Made In','tr','',1614107580,1614107580),('Made In','uk','',1614107580,1614107580),('Made In','zh_Hans','',1614107580,1614107580),('Malawi','cs','',1614107597,1614107597),('Malawi','de','',1614107597,1614107597),('Malawi','en','',1614107597,1614107597),('Malawi','es','',1614107597,1614107597),('Malawi','fa','',1614107597,1614107597),('Malawi','fr','',1614107597,1614107597),('Malawi','hu','',1614107597,1614107597),('Malawi','it','',1614107597,1614107597),('Malawi','ja','',1614107597,1614107597),('Malawi','nl','',1614107597,1614107597),('Malawi','pl','',1614107597,1614107597),('Malawi','pt_BR','',1614107597,1614107597),('Malawi','ru','',1614107597,1614107597),('Malawi','sk','',1614107597,1614107597),('Malawi','sv','',1614107597,1614107597),('Malawi','sv_FI','',1614107597,1614107597),('Malawi','th','',1614107597,1614107597),('Malawi','tr','',1614107597,1614107597),('Malawi','uk','',1614107597,1614107597),('Malawi','zh_Hans','',1614107597,1614107597),('Malaysia','cs','',1614107597,1614107597),('Malaysia','de','',1614107597,1614107597),('Malaysia','en','',1614107597,1614107597),('Malaysia','es','',1614107597,1614107597),('Malaysia','fa','',1614107597,1614107597),('Malaysia','fr','',1614107597,1614107597),('Malaysia','hu','',1614107597,1614107597),('Malaysia','it','',1614107597,1614107597),('Malaysia','ja','',1614107597,1614107597),('Malaysia','nl','',1614107597,1614107597),('Malaysia','pl','',1614107597,1614107597),('Malaysia','pt_BR','',1614107597,1614107597),('Malaysia','ru','',1614107597,1614107597),('Malaysia','sk','',1614107597,1614107597),('Malaysia','sv','',1614107597,1614107597),('Malaysia','sv_FI','',1614107597,1614107597),('Malaysia','th','',1614107597,1614107597),('Malaysia','tr','',1614107597,1614107597),('Malaysia','uk','',1614107597,1614107597),('Malaysia','zh_Hans','',1614107597,1614107597),('Maldives','cs','',1614107597,1614107597),('Maldives','de','',1614107597,1614107597),('Maldives','en','',1614107597,1614107597),('Maldives','es','',1614107597,1614107597),('Maldives','fa','',1614107597,1614107597),('Maldives','fr','',1614107597,1614107597),('Maldives','hu','',1614107597,1614107597),('Maldives','it','',1614107597,1614107597),('Maldives','ja','',1614107597,1614107597),('Maldives','nl','',1614107597,1614107597),('Maldives','pl','',1614107597,1614107597),('Maldives','pt_BR','',1614107597,1614107597),('Maldives','ru','',1614107597,1614107597),('Maldives','sk','',1614107597,1614107597),('Maldives','sv','',1614107597,1614107597),('Maldives','sv_FI','',1614107597,1614107597),('Maldives','th','',1614107597,1614107597),('Maldives','tr','',1614107597,1614107597),('Maldives','uk','',1614107597,1614107597),('Maldives','zh_Hans','',1614107597,1614107597),('Mali','cs','',1614107597,1614107597),('Mali','de','',1614107597,1614107597),('Mali','en','',1614107597,1614107597),('Mali','es','',1614107597,1614107597),('Mali','fa','',1614107597,1614107597),('Mali','fr','',1614107597,1614107597),('Mali','hu','',1614107597,1614107597),('Mali','it','',1614107597,1614107597),('Mali','ja','',1614107597,1614107597),('Mali','nl','',1614107597,1614107597),('Mali','pl','',1614107597,1614107597),('Mali','pt_BR','',1614107597,1614107597),('Mali','ru','',1614107597,1614107597),('Mali','sk','',1614107597,1614107597),('Mali','sv','',1614107597,1614107597),('Mali','sv_FI','',1614107597,1614107597),('Mali','th','',1614107597,1614107597),('Mali','tr','',1614107597,1614107597),('Mali','uk','',1614107597,1614107597),('Mali','zh_Hans','',1614107597,1614107597),('Malta','cs','',1614107597,1614107597),('Malta','de','',1614107597,1614107597),('Malta','en','',1614107597,1614107597),('Malta','es','',1614107597,1614107597),('Malta','fa','',1614107597,1614107597),('Malta','fr','',1614107597,1614107597),('Malta','hu','',1614107597,1614107597),('Malta','it','',1614107597,1614107597),('Malta','ja','',1614107597,1614107597),('Malta','nl','',1614107597,1614107597),('Malta','pl','',1614107597,1614107597),('Malta','pt_BR','',1614107597,1614107597),('Malta','ru','',1614107597,1614107597),('Malta','sk','',1614107597,1614107597),('Malta','sv','',1614107597,1614107597),('Malta','sv_FI','',1614107597,1614107597),('Malta','th','',1614107597,1614107597),('Malta','tr','',1614107597,1614107597),('Malta','uk','',1614107597,1614107597),('Malta','zh_Hans','',1614107597,1614107597),('Marshall Islands','cs','',1614107598,1614107598),('Marshall Islands','de','',1614107598,1614107598),('Marshall Islands','en','',1614107598,1614107598),('Marshall Islands','es','',1614107598,1614107598),('Marshall Islands','fa','',1614107598,1614107598),('Marshall Islands','fr','',1614107598,1614107598),('Marshall Islands','hu','',1614107598,1614107598),('Marshall Islands','it','',1614107598,1614107598),('Marshall Islands','ja','',1614107598,1614107598),('Marshall Islands','nl','',1614107598,1614107598),('Marshall Islands','pl','',1614107598,1614107598),('Marshall Islands','pt_BR','',1614107598,1614107598),('Marshall Islands','ru','',1614107598,1614107598),('Marshall Islands','sk','',1614107598,1614107598),('Marshall Islands','sv','',1614107598,1614107598),('Marshall Islands','sv_FI','',1614107598,1614107598),('Marshall Islands','th','',1614107598,1614107598),('Marshall Islands','tr','',1614107598,1614107598),('Marshall Islands','uk','',1614107598,1614107598),('Marshall Islands','zh_Hans','',1614107598,1614107598),('Martinique','cs','',1614107598,1614107598),('Martinique','de','',1614107598,1614107598),('Martinique','en','',1614107598,1614107598),('Martinique','es','',1614107598,1614107598),('Martinique','fa','',1614107598,1614107598),('Martinique','fr','',1614107598,1614107598),('Martinique','hu','',1614107598,1614107598),('Martinique','it','',1614107598,1614107598),('Martinique','ja','',1614107598,1614107598),('Martinique','nl','',1614107598,1614107598),('Martinique','pl','',1614107598,1614107598),('Martinique','pt_BR','',1614107598,1614107598),('Martinique','ru','',1614107598,1614107598),('Martinique','sk','',1614107598,1614107598),('Martinique','sv','',1614107598,1614107598),('Martinique','sv_FI','',1614107598,1614107598),('Martinique','th','',1614107598,1614107598),('Martinique','tr','',1614107598,1614107598),('Martinique','uk','',1614107598,1614107598),('Martinique','zh_Hans','',1614107598,1614107598),('Master','cs','',1614075406,1614075406),('Master','de','',1614075406,1614075406),('Master','en','',1614075406,1614075406),('Master','es','',1614075406,1614075406),('Master','fa','',1614075406,1614075406),('Master','fr','',1614075406,1614075406),('Master','hu','',1614075406,1614075406),('Master','it','',1614075406,1614075406),('Master','ja','',1614075406,1614075406),('Master','nl','',1614075406,1614075406),('Master','pl','',1614075406,1614075406),('Master','pt_BR','',1614075406,1614075406),('Master','ru','',1614075406,1614075406),('Master','sk','',1614075406,1614075406),('Master','sv','',1614075406,1614075406),('Master','sv_FI','',1614075406,1614075406),('Master','th','',1614075406,1614075406),('Master','tr','',1614075406,1614075406),('Master','uk','',1614075406,1614075406),('Master','zh_Hans','',1614075406,1614075406),('Master (Admin Mode)','cs','',1614075406,1614075406),('Master (Admin Mode)','de','',1614075406,1614075406),('Master (Admin Mode)','en','',1614075406,1614075406),('Master (Admin Mode)','es','',1614075406,1614075406),('Master (Admin Mode)','fa','',1614075406,1614075406),('Master (Admin Mode)','fr','',1614075406,1614075406),('Master (Admin Mode)','hu','',1614075406,1614075406),('Master (Admin Mode)','it','',1614075406,1614075406),('Master (Admin Mode)','ja','',1614075406,1614075406),('Master (Admin Mode)','nl','',1614075406,1614075406),('Master (Admin Mode)','pl','',1614075406,1614075406),('Master (Admin Mode)','pt_BR','',1614075406,1614075406),('Master (Admin Mode)','ru','',1614075406,1614075406),('Master (Admin Mode)','sk','',1614075406,1614075406),('Master (Admin Mode)','sv','',1614075406,1614075406),('Master (Admin Mode)','sv_FI','',1614075406,1614075406),('Master (Admin Mode)','th','',1614075406,1614075406),('Master (Admin Mode)','tr','',1614075406,1614075406),('Master (Admin Mode)','uk','',1614075406,1614075406),('Master (Admin Mode)','zh_Hans','',1614075406,1614075406),('Mauritania','cs','',1614107598,1614107598),('Mauritania','de','',1614107598,1614107598),('Mauritania','en','',1614107598,1614107598),('Mauritania','es','',1614107598,1614107598),('Mauritania','fa','',1614107598,1614107598),('Mauritania','fr','',1614107598,1614107598),('Mauritania','hu','',1614107598,1614107598),('Mauritania','it','',1614107598,1614107598),('Mauritania','ja','',1614107598,1614107598),('Mauritania','nl','',1614107598,1614107598),('Mauritania','pl','',1614107598,1614107598),('Mauritania','pt_BR','',1614107598,1614107598),('Mauritania','ru','',1614107598,1614107598),('Mauritania','sk','',1614107598,1614107598),('Mauritania','sv','',1614107598,1614107598),('Mauritania','sv_FI','',1614107598,1614107598),('Mauritania','th','',1614107598,1614107598),('Mauritania','tr','',1614107598,1614107598),('Mauritania','uk','',1614107598,1614107598),('Mauritania','zh_Hans','',1614107598,1614107598),('Mauritius','cs','',1614107598,1614107598),('Mauritius','de','',1614107598,1614107598),('Mauritius','en','',1614107598,1614107598),('Mauritius','es','',1614107598,1614107598),('Mauritius','fa','',1614107598,1614107598),('Mauritius','fr','',1614107598,1614107598),('Mauritius','hu','',1614107598,1614107598),('Mauritius','it','',1614107598,1614107598),('Mauritius','ja','',1614107598,1614107598),('Mauritius','nl','',1614107598,1614107598),('Mauritius','pl','',1614107598,1614107598),('Mauritius','pt_BR','',1614107598,1614107598),('Mauritius','ru','',1614107598,1614107598),('Mauritius','sk','',1614107598,1614107598),('Mauritius','sv','',1614107598,1614107598),('Mauritius','sv_FI','',1614107598,1614107598),('Mauritius','th','',1614107598,1614107598),('Mauritius','tr','',1614107598,1614107598),('Mauritius','uk','',1614107598,1614107598),('Mauritius','zh_Hans','',1614107598,1614107598),('Mayotte','cs','',1614107598,1614107598),('Mayotte','de','',1614107598,1614107598),('Mayotte','en','',1614107598,1614107598),('Mayotte','es','',1614107598,1614107598),('Mayotte','fa','',1614107598,1614107598),('Mayotte','fr','',1614107598,1614107598),('Mayotte','hu','',1614107598,1614107598),('Mayotte','it','',1614107598,1614107598),('Mayotte','ja','',1614107598,1614107598),('Mayotte','nl','',1614107598,1614107598),('Mayotte','pl','',1614107598,1614107598),('Mayotte','pt_BR','',1614107598,1614107598),('Mayotte','ru','',1614107598,1614107598),('Mayotte','sk','',1614107598,1614107598),('Mayotte','sv','',1614107598,1614107598),('Mayotte','sv_FI','',1614107598,1614107598),('Mayotte','th','',1614107598,1614107598),('Mayotte','tr','',1614107598,1614107598),('Mayotte','uk','',1614107598,1614107598),('Mayotte','zh_Hans','',1614107598,1614107598),('Mexico','cs','',1614107598,1614107598),('Mexico','de','',1614107598,1614107598),('Mexico','en','',1614107598,1614107598),('Mexico','es','',1614107598,1614107598),('Mexico','fa','',1614107598,1614107598),('Mexico','fr','',1614107598,1614107598),('Mexico','hu','',1614107598,1614107598),('Mexico','it','',1614107598,1614107598),('Mexico','ja','',1614107598,1614107598),('Mexico','nl','',1614107598,1614107598),('Mexico','pl','',1614107598,1614107598),('Mexico','pt_BR','',1614107598,1614107598),('Mexico','ru','',1614107598,1614107598),('Mexico','sk','',1614107598,1614107598),('Mexico','sv','',1614107598,1614107598),('Mexico','sv_FI','',1614107598,1614107598),('Mexico','th','',1614107598,1614107598),('Mexico','tr','',1614107598,1614107598),('Mexico','uk','',1614107598,1614107598),('Mexico','zh_Hans','',1614107598,1614107598),('Micronesia','cs','',1614107598,1614107598),('Micronesia','de','',1614107598,1614107598),('Micronesia','en','',1614107598,1614107598),('Micronesia','es','',1614107598,1614107598),('Micronesia','fa','',1614107598,1614107598),('Micronesia','fr','',1614107598,1614107598),('Micronesia','hu','',1614107598,1614107598),('Micronesia','it','',1614107598,1614107598),('Micronesia','ja','',1614107598,1614107598),('Micronesia','nl','',1614107598,1614107598),('Micronesia','pl','',1614107598,1614107598),('Micronesia','pt_BR','',1614107598,1614107598),('Micronesia','ru','',1614107598,1614107598),('Micronesia','sk','',1614107598,1614107598),('Micronesia','sv','',1614107598,1614107598),('Micronesia','sv_FI','',1614107598,1614107598),('Micronesia','th','',1614107598,1614107598),('Micronesia','tr','',1614107598,1614107598),('Micronesia','uk','',1614107598,1614107598),('Micronesia','zh_Hans','',1614107598,1614107598),('Moldova','cs','',1614107599,1614107599),('Moldova','de','',1614107599,1614107599),('Moldova','en','',1614107599,1614107599),('Moldova','es','',1614107599,1614107599),('Moldova','fa','',1614107599,1614107599),('Moldova','fr','',1614107599,1614107599),('Moldova','hu','',1614107599,1614107599),('Moldova','it','',1614107599,1614107599),('Moldova','ja','',1614107599,1614107599),('Moldova','nl','',1614107599,1614107599),('Moldova','pl','',1614107599,1614107599),('Moldova','pt_BR','',1614107599,1614107599),('Moldova','ru','',1614107599,1614107599),('Moldova','sk','',1614107599,1614107599),('Moldova','sv','',1614107599,1614107599),('Moldova','sv_FI','',1614107599,1614107599),('Moldova','th','',1614107599,1614107599),('Moldova','tr','',1614107599,1614107599),('Moldova','uk','',1614107599,1614107599),('Moldova','zh_Hans','',1614107599,1614107599),('Monaco','cs','',1614107599,1614107599),('Monaco','de','',1614107599,1614107599),('Monaco','en','',1614107599,1614107599),('Monaco','es','',1614107599,1614107599),('Monaco','fa','',1614107599,1614107599),('Monaco','fr','',1614107599,1614107599),('Monaco','hu','',1614107599,1614107599),('Monaco','it','',1614107599,1614107599),('Monaco','ja','',1614107599,1614107599),('Monaco','nl','',1614107599,1614107599),('Monaco','pl','',1614107599,1614107599),('Monaco','pt_BR','',1614107599,1614107599),('Monaco','ru','',1614107599,1614107599),('Monaco','sk','',1614107599,1614107599),('Monaco','sv','',1614107599,1614107599),('Monaco','sv_FI','',1614107599,1614107599),('Monaco','th','',1614107599,1614107599),('Monaco','tr','',1614107599,1614107599),('Monaco','uk','',1614107599,1614107599),('Monaco','zh_Hans','',1614107599,1614107599),('Mongolia','cs','',1614107599,1614107599),('Mongolia','de','',1614107599,1614107599),('Mongolia','en','',1614107599,1614107599),('Mongolia','es','',1614107599,1614107599),('Mongolia','fa','',1614107599,1614107599),('Mongolia','fr','',1614107599,1614107599),('Mongolia','hu','',1614107599,1614107599),('Mongolia','it','',1614107599,1614107599),('Mongolia','ja','',1614107599,1614107599),('Mongolia','nl','',1614107599,1614107599),('Mongolia','pl','',1614107599,1614107599),('Mongolia','pt_BR','',1614107599,1614107599),('Mongolia','ru','',1614107599,1614107599),('Mongolia','sk','',1614107599,1614107599),('Mongolia','sv','',1614107599,1614107599),('Mongolia','sv_FI','',1614107599,1614107599),('Mongolia','th','',1614107599,1614107599),('Mongolia','tr','',1614107599,1614107599),('Mongolia','uk','',1614107599,1614107599),('Mongolia','zh_Hans','',1614107599,1614107599),('Montenegro','cs','',1614107599,1614107599),('Montenegro','de','',1614107599,1614107599),('Montenegro','en','',1614107599,1614107599),('Montenegro','es','',1614107599,1614107599),('Montenegro','fa','',1614107599,1614107599),('Montenegro','fr','',1614107599,1614107599),('Montenegro','hu','',1614107599,1614107599),('Montenegro','it','',1614107599,1614107599),('Montenegro','ja','',1614107599,1614107599),('Montenegro','nl','',1614107599,1614107599),('Montenegro','pl','',1614107599,1614107599),('Montenegro','pt_BR','',1614107599,1614107599),('Montenegro','ru','',1614107599,1614107599),('Montenegro','sk','',1614107599,1614107599),('Montenegro','sv','',1614107599,1614107599),('Montenegro','sv_FI','',1614107599,1614107599),('Montenegro','th','',1614107599,1614107599),('Montenegro','tr','',1614107599,1614107599),('Montenegro','uk','',1614107599,1614107599),('Montenegro','zh_Hans','',1614107599,1614107599),('Montserrat','cs','',1614107599,1614107599),('Montserrat','de','',1614107599,1614107599),('Montserrat','en','',1614107599,1614107599),('Montserrat','es','',1614107599,1614107599),('Montserrat','fa','',1614107599,1614107599),('Montserrat','fr','',1614107599,1614107599),('Montserrat','hu','',1614107599,1614107599),('Montserrat','it','',1614107599,1614107599),('Montserrat','ja','',1614107599,1614107599),('Montserrat','nl','',1614107599,1614107599),('Montserrat','pl','',1614107599,1614107599),('Montserrat','pt_BR','',1614107599,1614107599),('Montserrat','ru','',1614107599,1614107599),('Montserrat','sk','',1614107599,1614107599),('Montserrat','sv','',1614107599,1614107599),('Montserrat','sv_FI','',1614107599,1614107599),('Montserrat','th','',1614107599,1614107599),('Montserrat','tr','',1614107599,1614107599),('Montserrat','uk','',1614107599,1614107599),('Montserrat','zh_Hans','',1614107599,1614107599),('Morocco','cs','',1614107599,1614107599),('Morocco','de','',1614107599,1614107599),('Morocco','en','',1614107599,1614107599),('Morocco','es','',1614107599,1614107599),('Morocco','fa','',1614107599,1614107599),('Morocco','fr','',1614107599,1614107599),('Morocco','hu','',1614107599,1614107599),('Morocco','it','',1614107599,1614107599),('Morocco','ja','',1614107599,1614107599),('Morocco','nl','',1614107599,1614107599),('Morocco','pl','',1614107599,1614107599),('Morocco','pt_BR','',1614107599,1614107599),('Morocco','ru','',1614107599,1614107599),('Morocco','sk','',1614107599,1614107599),('Morocco','sv','',1614107599,1614107599),('Morocco','sv_FI','',1614107599,1614107599),('Morocco','th','',1614107599,1614107599),('Morocco','tr','',1614107599,1614107599),('Morocco','uk','',1614107599,1614107599),('Morocco','zh_Hans','',1614107599,1614107599),('Mozambique','cs','',1614107599,1614107599),('Mozambique','de','',1614107599,1614107599),('Mozambique','en','',1614107599,1614107599),('Mozambique','es','',1614107599,1614107599),('Mozambique','fa','',1614107599,1614107599),('Mozambique','fr','',1614107599,1614107599),('Mozambique','hu','',1614107599,1614107599),('Mozambique','it','',1614107599,1614107599),('Mozambique','ja','',1614107599,1614107599),('Mozambique','nl','',1614107599,1614107599),('Mozambique','pl','',1614107599,1614107599),('Mozambique','pt_BR','',1614107599,1614107599),('Mozambique','ru','',1614107599,1614107599),('Mozambique','sk','',1614107599,1614107599),('Mozambique','sv','',1614107599,1614107599),('Mozambique','sv_FI','',1614107599,1614107599),('Mozambique','th','',1614107599,1614107599),('Mozambique','tr','',1614107599,1614107599),('Mozambique','uk','',1614107599,1614107599),('Mozambique','zh_Hans','',1614107599,1614107599),('Myanmar (Burma)','cs','',1614107600,1614107600),('Myanmar (Burma)','de','',1614107600,1614107600),('Myanmar (Burma)','en','',1614107600,1614107600),('Myanmar (Burma)','es','',1614107600,1614107600),('Myanmar (Burma)','fa','',1614107600,1614107600),('Myanmar (Burma)','fr','',1614107600,1614107600),('Myanmar (Burma)','hu','',1614107600,1614107600),('Myanmar (Burma)','it','',1614107600,1614107600),('Myanmar (Burma)','ja','',1614107600,1614107600),('Myanmar (Burma)','nl','',1614107600,1614107600),('Myanmar (Burma)','pl','',1614107600,1614107600),('Myanmar (Burma)','pt_BR','',1614107600,1614107600),('Myanmar (Burma)','ru','',1614107600,1614107600),('Myanmar (Burma)','sk','',1614107600,1614107600),('Myanmar (Burma)','sv','',1614107600,1614107600),('Myanmar (Burma)','sv_FI','',1614107600,1614107600),('Myanmar (Burma)','th','',1614107600,1614107600),('Myanmar (Burma)','tr','',1614107600,1614107600),('Myanmar (Burma)','uk','',1614107600,1614107600),('Myanmar (Burma)','zh_Hans','',1614107600,1614107600),('Name','cs','',1614107692,1614107692),('Name','de','',1614107692,1614107692),('Name','en','',1614107692,1614107692),('Name','es','',1614107692,1614107692),('Name','fa','',1614107692,1614107692),('Name','fr','',1614107692,1614107692),('Name','hu','',1614107692,1614107692),('Name','it','',1614107692,1614107692),('Name','ja','',1614107692,1614107692),('Name','nl','',1614107692,1614107692),('Name','pl','',1614107692,1614107692),('Name','pt_BR','',1614107692,1614107692),('Name','ru','',1614107692,1614107692),('Name','sk','',1614107692,1614107692),('Name','sv','',1614107692,1614107692),('Name','sv_FI','',1614107692,1614107692),('Name','th','',1614107692,1614107692),('Name','tr','',1614107692,1614107692),('Name','uk','',1614107692,1614107692),('Name','zh_Hans','',1614107692,1614107692),('Namibia','cs','',1614107600,1614107600),('Namibia','de','',1614107600,1614107600),('Namibia','en','',1614107600,1614107600),('Namibia','es','',1614107600,1614107600),('Namibia','fa','',1614107600,1614107600),('Namibia','fr','',1614107600,1614107600),('Namibia','hu','',1614107600,1614107600),('Namibia','it','',1614107600,1614107600),('Namibia','ja','',1614107600,1614107600),('Namibia','nl','',1614107600,1614107600),('Namibia','pl','',1614107600,1614107600),('Namibia','pt_BR','',1614107600,1614107600),('Namibia','ru','',1614107600,1614107600),('Namibia','sk','',1614107600,1614107600),('Namibia','sv','',1614107600,1614107600),('Namibia','sv_FI','',1614107600,1614107600),('Namibia','th','',1614107600,1614107600),('Namibia','tr','',1614107600,1614107600),('Namibia','uk','',1614107600,1614107600),('Namibia','zh_Hans','',1614107600,1614107600),('Nauru','cs','',1614107600,1614107600),('Nauru','de','',1614107600,1614107600),('Nauru','en','',1614107600,1614107600),('Nauru','es','',1614107600,1614107600),('Nauru','fa','',1614107600,1614107600),('Nauru','fr','',1614107600,1614107600),('Nauru','hu','',1614107600,1614107600),('Nauru','it','',1614107600,1614107600),('Nauru','ja','',1614107600,1614107600),('Nauru','nl','',1614107600,1614107600),('Nauru','pl','',1614107600,1614107600),('Nauru','pt_BR','',1614107600,1614107600),('Nauru','ru','',1614107600,1614107600),('Nauru','sk','',1614107600,1614107600),('Nauru','sv','',1614107600,1614107600),('Nauru','sv_FI','',1614107600,1614107600),('Nauru','th','',1614107600,1614107600),('Nauru','tr','',1614107600,1614107600),('Nauru','uk','',1614107600,1614107600),('Nauru','zh_Hans','',1614107600,1614107600),('Nepal','cs','',1614107600,1614107600),('Nepal','de','',1614107600,1614107600),('Nepal','en','',1614107600,1614107600),('Nepal','es','',1614107600,1614107600),('Nepal','fa','',1614107600,1614107600),('Nepal','fr','',1614107600,1614107600),('Nepal','hu','',1614107600,1614107600),('Nepal','it','',1614107600,1614107600),('Nepal','ja','',1614107600,1614107600),('Nepal','nl','',1614107600,1614107600),('Nepal','pl','',1614107600,1614107600),('Nepal','pt_BR','',1614107600,1614107600),('Nepal','ru','',1614107600,1614107600),('Nepal','sk','',1614107600,1614107600),('Nepal','sv','',1614107600,1614107600),('Nepal','sv_FI','',1614107600,1614107600),('Nepal','th','',1614107600,1614107600),('Nepal','tr','',1614107600,1614107600),('Nepal','uk','',1614107600,1614107600),('Nepal','zh_Hans','',1614107600,1614107600),('Netherlands','cs','',1614107600,1614107600),('Netherlands','de','',1614107600,1614107600),('Netherlands','en','',1614107600,1614107600),('Netherlands','es','',1614107600,1614107600),('Netherlands','fa','',1614107600,1614107600),('Netherlands','fr','',1614107600,1614107600),('Netherlands','hu','',1614107600,1614107600),('Netherlands','it','',1614107600,1614107600),('Netherlands','ja','',1614107600,1614107600),('Netherlands','nl','',1614107600,1614107600),('Netherlands','pl','',1614107600,1614107600),('Netherlands','pt_BR','',1614107600,1614107600),('Netherlands','ru','',1614107600,1614107600),('Netherlands','sk','',1614107600,1614107600),('Netherlands','sv','',1614107600,1614107600),('Netherlands','sv_FI','',1614107600,1614107600),('Netherlands','th','',1614107600,1614107600),('Netherlands','tr','',1614107600,1614107600),('Netherlands','uk','',1614107600,1614107600),('Netherlands','zh_Hans','',1614107600,1614107600),('New Caledonia','cs','',1614107600,1614107600),('New Caledonia','de','',1614107600,1614107600),('New Caledonia','en','',1614107600,1614107600),('New Caledonia','es','',1614107600,1614107600),('New Caledonia','fa','',1614107600,1614107600),('New Caledonia','fr','',1614107600,1614107600),('New Caledonia','hu','',1614107600,1614107600),('New Caledonia','it','',1614107600,1614107600),('New Caledonia','ja','',1614107600,1614107600),('New Caledonia','nl','',1614107600,1614107600),('New Caledonia','pl','',1614107600,1614107600),('New Caledonia','pt_BR','',1614107600,1614107600),('New Caledonia','ru','',1614107600,1614107600),('New Caledonia','sk','',1614107600,1614107600),('New Caledonia','sv','',1614107600,1614107600),('New Caledonia','sv_FI','',1614107600,1614107600),('New Caledonia','th','',1614107600,1614107600),('New Caledonia','tr','',1614107600,1614107600),('New Caledonia','uk','',1614107600,1614107600),('New Caledonia','zh_Hans','',1614107600,1614107600),('New Zealand','cs','',1614107600,1614107600),('New Zealand','de','',1614107600,1614107600),('New Zealand','en','',1614107600,1614107600),('New Zealand','es','',1614107600,1614107600),('New Zealand','fa','',1614107600,1614107600),('New Zealand','fr','',1614107600,1614107600),('New Zealand','hu','',1614107600,1614107600),('New Zealand','it','',1614107600,1614107600),('New Zealand','ja','',1614107600,1614107600),('New Zealand','nl','',1614107600,1614107600),('New Zealand','pl','',1614107600,1614107600),('New Zealand','pt_BR','',1614107600,1614107600),('New Zealand','ru','',1614107600,1614107600),('New Zealand','sk','',1614107600,1614107600),('New Zealand','sv','',1614107600,1614107600),('New Zealand','sv_FI','',1614107600,1614107600),('New Zealand','th','',1614107600,1614107600),('New Zealand','tr','',1614107600,1614107600),('New Zealand','uk','',1614107600,1614107600),('New Zealand','zh_Hans','',1614107600,1614107600),('Nicaragua','cs','',1614107600,1614107600),('Nicaragua','de','',1614107600,1614107600),('Nicaragua','en','',1614107600,1614107600),('Nicaragua','es','',1614107600,1614107600),('Nicaragua','fa','',1614107600,1614107600),('Nicaragua','fr','',1614107600,1614107600),('Nicaragua','hu','',1614107600,1614107600),('Nicaragua','it','',1614107600,1614107600),('Nicaragua','ja','',1614107600,1614107600),('Nicaragua','nl','',1614107600,1614107600),('Nicaragua','pl','',1614107600,1614107600),('Nicaragua','pt_BR','',1614107600,1614107600),('Nicaragua','ru','',1614107600,1614107600),('Nicaragua','sk','',1614107600,1614107600),('Nicaragua','sv','',1614107600,1614107600),('Nicaragua','sv_FI','',1614107600,1614107600),('Nicaragua','th','',1614107600,1614107600),('Nicaragua','tr','',1614107600,1614107600),('Nicaragua','uk','',1614107600,1614107600),('Nicaragua','zh_Hans','',1614107600,1614107600),('Niger','cs','',1614107601,1614107601),('Niger','de','',1614107601,1614107601),('Niger','en','',1614107601,1614107601),('Niger','es','',1614107601,1614107601),('Niger','fa','',1614107601,1614107601),('Niger','fr','',1614107601,1614107601),('Niger','hu','',1614107601,1614107601),('Niger','it','',1614107601,1614107601),('Niger','ja','',1614107601,1614107601),('Niger','nl','',1614107601,1614107601),('Niger','pl','',1614107601,1614107601),('Niger','pt_BR','',1614107601,1614107601),('Niger','ru','',1614107601,1614107601),('Niger','sk','',1614107601,1614107601),('Niger','sv','',1614107601,1614107601),('Niger','sv_FI','',1614107601,1614107601),('Niger','th','',1614107601,1614107601),('Niger','tr','',1614107601,1614107601),('Niger','uk','',1614107601,1614107601),('Niger','zh_Hans','',1614107601,1614107601),('Nigeria','cs','',1614107601,1614107601),('Nigeria','de','',1614107601,1614107601),('Nigeria','en','',1614107601,1614107601),('Nigeria','es','',1614107601,1614107601),('Nigeria','fa','',1614107601,1614107601),('Nigeria','fr','',1614107601,1614107601),('Nigeria','hu','',1614107601,1614107601),('Nigeria','it','',1614107601,1614107601),('Nigeria','ja','',1614107601,1614107601),('Nigeria','nl','',1614107601,1614107601),('Nigeria','pl','',1614107601,1614107601),('Nigeria','pt_BR','',1614107601,1614107601),('Nigeria','ru','',1614107601,1614107601),('Nigeria','sk','',1614107601,1614107601),('Nigeria','sv','',1614107601,1614107601),('Nigeria','sv_FI','',1614107601,1614107601),('Nigeria','th','',1614107601,1614107601),('Nigeria','tr','',1614107601,1614107601),('Nigeria','uk','',1614107601,1614107601),('Nigeria','zh_Hans','',1614107601,1614107601),('Niue','cs','',1614107601,1614107601),('Niue','de','',1614107601,1614107601),('Niue','en','',1614107601,1614107601),('Niue','es','',1614107601,1614107601),('Niue','fa','',1614107601,1614107601),('Niue','fr','',1614107601,1614107601),('Niue','hu','',1614107601,1614107601),('Niue','it','',1614107601,1614107601),('Niue','ja','',1614107601,1614107601),('Niue','nl','',1614107601,1614107601),('Niue','pl','',1614107601,1614107601),('Niue','pt_BR','',1614107601,1614107601),('Niue','ru','',1614107601,1614107601),('Niue','sk','',1614107601,1614107601),('Niue','sv','',1614107601,1614107601),('Niue','sv_FI','',1614107601,1614107601),('Niue','th','',1614107601,1614107601),('Niue','tr','',1614107601,1614107601),('Niue','uk','',1614107601,1614107601),('Niue','zh_Hans','',1614107601,1614107601),('Norfolk Island','cs','',1614107601,1614107601),('Norfolk Island','de','',1614107601,1614107601),('Norfolk Island','en','',1614107601,1614107601),('Norfolk Island','es','',1614107601,1614107601),('Norfolk Island','fa','',1614107601,1614107601),('Norfolk Island','fr','',1614107601,1614107601),('Norfolk Island','hu','',1614107601,1614107601),('Norfolk Island','it','',1614107601,1614107601),('Norfolk Island','ja','',1614107601,1614107601),('Norfolk Island','nl','',1614107601,1614107601),('Norfolk Island','pl','',1614107601,1614107601),('Norfolk Island','pt_BR','',1614107601,1614107601),('Norfolk Island','ru','',1614107601,1614107601),('Norfolk Island','sk','',1614107601,1614107601),('Norfolk Island','sv','',1614107601,1614107601),('Norfolk Island','sv_FI','',1614107601,1614107601),('Norfolk Island','th','',1614107601,1614107601),('Norfolk Island','tr','',1614107601,1614107601),('Norfolk Island','uk','',1614107601,1614107601),('Norfolk Island','zh_Hans','',1614107601,1614107601),('Normal Wash','cs','',1614088789,1614088789),('Normal Wash','de','',1614088789,1614088789),('Normal Wash','en','',1614088789,1614088789),('Normal Wash','es','',1614088789,1614088789),('Normal Wash','fa','',1614088789,1614088789),('Normal Wash','fr','',1614088789,1614088789),('Normal Wash','hu','',1614088789,1614088789),('Normal Wash','it','',1614088789,1614088789),('Normal Wash','ja','',1614088789,1614088789),('Normal Wash','nl','',1614088789,1614088789),('Normal Wash','pl','',1614088789,1614088789),('Normal Wash','pt_BR','',1614088789,1614088789),('Normal Wash','ru','',1614088789,1614088789),('Normal Wash','sk','',1614088789,1614088789),('Normal Wash','sv','',1614088789,1614088789),('Normal Wash','sv_FI','',1614088789,1614088789),('Normal Wash','th','',1614088789,1614088789),('Normal Wash','tr','',1614088789,1614088789),('Normal Wash','uk','',1614088789,1614088789),('Normal Wash','zh_Hans','',1614088789,1614088789),('North Korea','cs','',1614107601,1614107601),('North Korea','de','',1614107601,1614107601),('North Korea','en','',1614107601,1614107601),('North Korea','es','',1614107601,1614107601),('North Korea','fa','',1614107601,1614107601),('North Korea','fr','',1614107601,1614107601),('North Korea','hu','',1614107601,1614107601),('North Korea','it','',1614107601,1614107601),('North Korea','ja','',1614107601,1614107601),('North Korea','nl','',1614107601,1614107601),('North Korea','pl','',1614107601,1614107601),('North Korea','pt_BR','',1614107601,1614107601),('North Korea','ru','',1614107601,1614107601),('North Korea','sk','',1614107601,1614107601),('North Korea','sv','',1614107601,1614107601),('North Korea','sv_FI','',1614107601,1614107601),('North Korea','th','',1614107601,1614107601),('North Korea','tr','',1614107601,1614107601),('North Korea','uk','',1614107601,1614107601),('North Korea','zh_Hans','',1614107601,1614107601),('North Macedonia','cs','',1614107601,1614107601),('North Macedonia','de','',1614107601,1614107601),('North Macedonia','en','',1614107601,1614107601),('North Macedonia','es','',1614107601,1614107601),('North Macedonia','fa','',1614107601,1614107601),('North Macedonia','fr','',1614107601,1614107601),('North Macedonia','hu','',1614107601,1614107601),('North Macedonia','it','',1614107601,1614107601),('North Macedonia','ja','',1614107601,1614107601),('North Macedonia','nl','',1614107601,1614107601),('North Macedonia','pl','',1614107601,1614107601),('North Macedonia','pt_BR','',1614107601,1614107601),('North Macedonia','ru','',1614107601,1614107601),('North Macedonia','sk','',1614107601,1614107601),('North Macedonia','sv','',1614107601,1614107601),('North Macedonia','sv_FI','',1614107601,1614107601),('North Macedonia','th','',1614107601,1614107601),('North Macedonia','tr','',1614107601,1614107601),('North Macedonia','uk','',1614107601,1614107601),('North Macedonia','zh_Hans','',1614107601,1614107601),('Northern Mariana Islands','cs','',1614107601,1614107601),('Northern Mariana Islands','de','',1614107601,1614107601),('Northern Mariana Islands','en','',1614107601,1614107601),('Northern Mariana Islands','es','',1614107601,1614107601),('Northern Mariana Islands','fa','',1614107601,1614107601),('Northern Mariana Islands','fr','',1614107601,1614107601),('Northern Mariana Islands','hu','',1614107601,1614107601),('Northern Mariana Islands','it','',1614107601,1614107601),('Northern Mariana Islands','ja','',1614107601,1614107601),('Northern Mariana Islands','nl','',1614107601,1614107601),('Northern Mariana Islands','pl','',1614107601,1614107601),('Northern Mariana Islands','pt_BR','',1614107601,1614107601),('Northern Mariana Islands','ru','',1614107601,1614107601),('Northern Mariana Islands','sk','',1614107601,1614107601),('Northern Mariana Islands','sv','',1614107601,1614107601),('Northern Mariana Islands','sv_FI','',1614107601,1614107601),('Northern Mariana Islands','th','',1614107601,1614107601),('Northern Mariana Islands','tr','',1614107601,1614107601),('Northern Mariana Islands','uk','',1614107601,1614107601),('Northern Mariana Islands','zh_Hans','',1614107601,1614107601),('Norway','cs','',1614107601,1614107601),('Norway','de','',1614107601,1614107601),('Norway','en','',1614107601,1614107601),('Norway','es','',1614107601,1614107601),('Norway','fa','',1614107601,1614107601),('Norway','fr','',1614107601,1614107601),('Norway','hu','',1614107601,1614107601),('Norway','it','',1614107601,1614107601),('Norway','ja','',1614107601,1614107601),('Norway','nl','',1614107601,1614107601),('Norway','pl','',1614107601,1614107601),('Norway','pt_BR','',1614107601,1614107601),('Norway','ru','',1614107601,1614107601),('Norway','sk','',1614107601,1614107601),('Norway','sv','',1614107601,1614107601),('Norway','sv_FI','',1614107601,1614107601),('Norway','th','',1614107601,1614107601),('Norway','tr','',1614107601,1614107601),('Norway','uk','',1614107601,1614107601),('Norway','zh_Hans','',1614107601,1614107601),('Oman','cs','',1614107601,1614107601),('Oman','de','',1614107601,1614107601),('Oman','en','',1614107601,1614107601),('Oman','es','',1614107601,1614107601),('Oman','fa','',1614107601,1614107601),('Oman','fr','',1614107601,1614107601),('Oman','hu','',1614107601,1614107601),('Oman','it','',1614107601,1614107601),('Oman','ja','',1614107601,1614107601),('Oman','nl','',1614107601,1614107601),('Oman','pl','',1614107601,1614107601),('Oman','pt_BR','',1614107601,1614107601),('Oman','ru','',1614107601,1614107601),('Oman','sk','',1614107601,1614107601),('Oman','sv','',1614107601,1614107601),('Oman','sv_FI','',1614107601,1614107601),('Oman','th','',1614107601,1614107601),('Oman','tr','',1614107601,1614107601),('Oman','uk','',1614107601,1614107601),('Oman','zh_Hans','',1614107601,1614107601),('Other Fields','cs','',1614106913,1614106913),('Other Fields','de','',1614106913,1614106913),('Other Fields','en','',1614106913,1614106913),('Other Fields','es','',1614106913,1614106913),('Other Fields','fa','',1614106913,1614106913),('Other Fields','fr','',1614106913,1614106913),('Other Fields','hu','',1614106913,1614106913),('Other Fields','it','',1614106913,1614106913),('Other Fields','ja','',1614106913,1614106913),('Other Fields','nl','',1614106913,1614106913),('Other Fields','pl','',1614106913,1614106913),('Other Fields','pt_BR','',1614106913,1614106913),('Other Fields','ru','',1614106913,1614106913),('Other Fields','sk','',1614106913,1614106913),('Other Fields','sv','',1614106913,1614106913),('Other Fields','sv_FI','',1614106913,1614106913),('Other Fields','th','',1614106913,1614106913),('Other Fields','tr','',1614106913,1614106913),('Other Fields','uk','',1614106913,1614106913),('Other Fields','zh_Hans','',1614106913,1614106913),('Pakistan','cs','',1614107602,1614107602),('Pakistan','de','',1614107602,1614107602),('Pakistan','en','',1614107602,1614107602),('Pakistan','es','',1614107602,1614107602),('Pakistan','fa','',1614107602,1614107602),('Pakistan','fr','',1614107602,1614107602),('Pakistan','hu','',1614107602,1614107602),('Pakistan','it','',1614107602,1614107602),('Pakistan','ja','',1614107602,1614107602),('Pakistan','nl','',1614107602,1614107602),('Pakistan','pl','',1614107602,1614107602),('Pakistan','pt_BR','',1614107602,1614107602),('Pakistan','ru','',1614107602,1614107602),('Pakistan','sk','',1614107602,1614107602),('Pakistan','sv','',1614107602,1614107602),('Pakistan','sv_FI','',1614107602,1614107602),('Pakistan','th','',1614107602,1614107602),('Pakistan','tr','',1614107602,1614107602),('Pakistan','uk','',1614107602,1614107602),('Pakistan','zh_Hans','',1614107602,1614107602),('Palau','cs','',1614107602,1614107602),('Palau','de','',1614107602,1614107602),('Palau','en','',1614107602,1614107602),('Palau','es','',1614107602,1614107602),('Palau','fa','',1614107602,1614107602),('Palau','fr','',1614107602,1614107602),('Palau','hu','',1614107602,1614107602),('Palau','it','',1614107602,1614107602),('Palau','ja','',1614107602,1614107602),('Palau','nl','',1614107602,1614107602),('Palau','pl','',1614107602,1614107602),('Palau','pt_BR','',1614107602,1614107602),('Palau','ru','',1614107602,1614107602),('Palau','sk','',1614107602,1614107602),('Palau','sv','',1614107602,1614107602),('Palau','sv_FI','',1614107602,1614107602),('Palau','th','',1614107602,1614107602),('Palau','tr','',1614107602,1614107602),('Palau','uk','',1614107602,1614107602),('Palau','zh_Hans','',1614107602,1614107602),('Palestinian Territories','cs','',1614107602,1614107602),('Palestinian Territories','de','',1614107602,1614107602),('Palestinian Territories','en','',1614107602,1614107602),('Palestinian Territories','es','',1614107602,1614107602),('Palestinian Territories','fa','',1614107602,1614107602),('Palestinian Territories','fr','',1614107602,1614107602),('Palestinian Territories','hu','',1614107602,1614107602),('Palestinian Territories','it','',1614107602,1614107602),('Palestinian Territories','ja','',1614107602,1614107602),('Palestinian Territories','nl','',1614107602,1614107602),('Palestinian Territories','pl','',1614107602,1614107602),('Palestinian Territories','pt_BR','',1614107602,1614107602),('Palestinian Territories','ru','',1614107602,1614107602),('Palestinian Territories','sk','',1614107602,1614107602),('Palestinian Territories','sv','',1614107602,1614107602),('Palestinian Territories','sv_FI','',1614107602,1614107602),('Palestinian Territories','th','',1614107602,1614107602),('Palestinian Territories','tr','',1614107602,1614107602),('Palestinian Territories','uk','',1614107602,1614107602),('Palestinian Territories','zh_Hans','',1614107602,1614107602),('Panama','cs','',1614107602,1614107602),('Panama','de','',1614107602,1614107602),('Panama','en','',1614107602,1614107602),('Panama','es','',1614107602,1614107602),('Panama','fa','',1614107602,1614107602),('Panama','fr','',1614107602,1614107602),('Panama','hu','',1614107602,1614107602),('Panama','it','',1614107602,1614107602),('Panama','ja','',1614107602,1614107602),('Panama','nl','',1614107602,1614107602),('Panama','pl','',1614107602,1614107602),('Panama','pt_BR','',1614107602,1614107602),('Panama','ru','',1614107602,1614107602),('Panama','sk','',1614107602,1614107602),('Panama','sv','',1614107602,1614107602),('Panama','sv_FI','',1614107602,1614107602),('Panama','th','',1614107602,1614107602),('Panama','tr','',1614107602,1614107602),('Panama','uk','',1614107602,1614107602),('Panama','zh_Hans','',1614107602,1614107602),('Papua New Guinea','cs','',1614107602,1614107602),('Papua New Guinea','de','',1614107602,1614107602),('Papua New Guinea','en','',1614107602,1614107602),('Papua New Guinea','es','',1614107602,1614107602),('Papua New Guinea','fa','',1614107602,1614107602),('Papua New Guinea','fr','',1614107602,1614107602),('Papua New Guinea','hu','',1614107602,1614107602),('Papua New Guinea','it','',1614107602,1614107602),('Papua New Guinea','ja','',1614107602,1614107602),('Papua New Guinea','nl','',1614107602,1614107602),('Papua New Guinea','pl','',1614107602,1614107602),('Papua New Guinea','pt_BR','',1614107602,1614107602),('Papua New Guinea','ru','',1614107602,1614107602),('Papua New Guinea','sk','',1614107602,1614107602),('Papua New Guinea','sv','',1614107602,1614107602),('Papua New Guinea','sv_FI','',1614107602,1614107602),('Papua New Guinea','th','',1614107602,1614107602),('Papua New Guinea','tr','',1614107602,1614107602),('Papua New Guinea','uk','',1614107602,1614107602),('Papua New Guinea','zh_Hans','',1614107602,1614107602),('Paraguay','cs','',1614107602,1614107602),('Paraguay','de','',1614107602,1614107602),('Paraguay','en','',1614107602,1614107602),('Paraguay','es','',1614107602,1614107602),('Paraguay','fa','',1614107602,1614107602),('Paraguay','fr','',1614107602,1614107602),('Paraguay','hu','',1614107602,1614107602),('Paraguay','it','',1614107602,1614107602),('Paraguay','ja','',1614107602,1614107602),('Paraguay','nl','',1614107602,1614107602),('Paraguay','pl','',1614107602,1614107602),('Paraguay','pt_BR','',1614107602,1614107602),('Paraguay','ru','',1614107602,1614107602),('Paraguay','sk','',1614107602,1614107602),('Paraguay','sv','',1614107602,1614107602),('Paraguay','sv_FI','',1614107602,1614107602),('Paraguay','th','',1614107602,1614107602),('Paraguay','tr','',1614107602,1614107602),('Paraguay','uk','',1614107602,1614107602),('Paraguay','zh_Hans','',1614107602,1614107602),('Peru','cs','',1614107602,1614107602),('Peru','de','',1614107602,1614107602),('Peru','en','',1614107602,1614107602),('Peru','es','',1614107602,1614107602),('Peru','fa','',1614107602,1614107602),('Peru','fr','',1614107602,1614107602),('Peru','hu','',1614107602,1614107602),('Peru','it','',1614107602,1614107602),('Peru','ja','',1614107602,1614107602),('Peru','nl','',1614107602,1614107602),('Peru','pl','',1614107602,1614107602),('Peru','pt_BR','',1614107602,1614107602),('Peru','ru','',1614107602,1614107602),('Peru','sk','',1614107602,1614107602),('Peru','sv','',1614107602,1614107602),('Peru','sv_FI','',1614107602,1614107602),('Peru','th','',1614107602,1614107602),('Peru','tr','',1614107602,1614107602),('Peru','uk','',1614107602,1614107602),('Peru','zh_Hans','',1614107602,1614107602),('Philippines','cs','',1614107602,1614107602),('Philippines','de','',1614107602,1614107602),('Philippines','en','',1614107602,1614107602),('Philippines','es','',1614107602,1614107602),('Philippines','fa','',1614107602,1614107602),('Philippines','fr','',1614107602,1614107602),('Philippines','hu','',1614107602,1614107602),('Philippines','it','',1614107602,1614107602),('Philippines','ja','',1614107602,1614107602),('Philippines','nl','',1614107602,1614107602),('Philippines','pl','',1614107602,1614107602),('Philippines','pt_BR','',1614107602,1614107602),('Philippines','ru','',1614107602,1614107602),('Philippines','sk','',1614107602,1614107602),('Philippines','sv','',1614107602,1614107602),('Philippines','sv_FI','',1614107602,1614107602),('Philippines','th','',1614107602,1614107602),('Philippines','tr','',1614107602,1614107602),('Philippines','uk','',1614107602,1614107602),('Philippines','zh_Hans','',1614107602,1614107602),('Pitcairn Islands','cs','',1614107603,1614107603),('Pitcairn Islands','de','',1614107603,1614107603),('Pitcairn Islands','en','',1614107603,1614107603),('Pitcairn Islands','es','',1614107603,1614107603),('Pitcairn Islands','fa','',1614107603,1614107603),('Pitcairn Islands','fr','',1614107603,1614107603),('Pitcairn Islands','hu','',1614107603,1614107603),('Pitcairn Islands','it','',1614107603,1614107603),('Pitcairn Islands','ja','',1614107603,1614107603),('Pitcairn Islands','nl','',1614107603,1614107603),('Pitcairn Islands','pl','',1614107603,1614107603),('Pitcairn Islands','pt_BR','',1614107603,1614107603),('Pitcairn Islands','ru','',1614107603,1614107603),('Pitcairn Islands','sk','',1614107603,1614107603),('Pitcairn Islands','sv','',1614107603,1614107603),('Pitcairn Islands','sv_FI','',1614107603,1614107603),('Pitcairn Islands','th','',1614107603,1614107603),('Pitcairn Islands','tr','',1614107603,1614107603),('Pitcairn Islands','uk','',1614107603,1614107603),('Pitcairn Islands','zh_Hans','',1614107603,1614107603),('Plazzo Suite','cs','',1614107400,1614107400),('Plazzo Suite','de','',1614107400,1614107400),('Plazzo Suite','en','',1614107400,1614107400),('Plazzo Suite','es','',1614107400,1614107400),('Plazzo Suite','fa','',1614107400,1614107400),('Plazzo Suite','fr','',1614107400,1614107400),('Plazzo Suite','hu','',1614107400,1614107400),('Plazzo Suite','it','',1614107400,1614107400),('Plazzo Suite','ja','',1614107400,1614107400),('Plazzo Suite','nl','',1614107400,1614107400),('Plazzo Suite','pl','',1614107400,1614107400),('Plazzo Suite','pt_BR','',1614107400,1614107400),('Plazzo Suite','ru','',1614107400,1614107400),('Plazzo Suite','sk','',1614107400,1614107400),('Plazzo Suite','sv','',1614107400,1614107400),('Plazzo Suite','sv_FI','',1614107400,1614107400),('Plazzo Suite','th','',1614107400,1614107400),('Plazzo Suite','tr','',1614107400,1614107400),('Plazzo Suite','uk','',1614107400,1614107400),('Plazzo Suite','zh_Hans','',1614107400,1614107400),('Poland','cs','',1614107603,1614107603),('Poland','de','',1614107603,1614107603),('Poland','en','',1614107603,1614107603),('Poland','es','',1614107603,1614107603),('Poland','fa','',1614107603,1614107603),('Poland','fr','',1614107603,1614107603),('Poland','hu','',1614107603,1614107603),('Poland','it','',1614107603,1614107603),('Poland','ja','',1614107603,1614107603),('Poland','nl','',1614107603,1614107603),('Poland','pl','',1614107603,1614107603),('Poland','pt_BR','',1614107603,1614107603),('Poland','ru','',1614107603,1614107603),('Poland','sk','',1614107603,1614107603),('Poland','sv','',1614107603,1614107603),('Poland','sv_FI','',1614107603,1614107603),('Poland','th','',1614107603,1614107603),('Poland','tr','',1614107603,1614107603),('Poland','uk','',1614107603,1614107603),('Poland','zh_Hans','',1614107603,1614107603),('Portugal','cs','',1614107603,1614107603),('Portugal','de','',1614107603,1614107603),('Portugal','en','',1614107603,1614107603),('Portugal','es','',1614107603,1614107603),('Portugal','fa','',1614107603,1614107603),('Portugal','fr','',1614107603,1614107603),('Portugal','hu','',1614107603,1614107603),('Portugal','it','',1614107603,1614107603),('Portugal','ja','',1614107603,1614107603),('Portugal','nl','',1614107603,1614107603),('Portugal','pl','',1614107603,1614107603),('Portugal','pt_BR','',1614107603,1614107603),('Portugal','ru','',1614107603,1614107603),('Portugal','sk','',1614107603,1614107603),('Portugal','sv','',1614107603,1614107603),('Portugal','sv_FI','',1614107603,1614107603),('Portugal','th','',1614107603,1614107603),('Portugal','tr','',1614107603,1614107603),('Portugal','uk','',1614107603,1614107603),('Portugal','zh_Hans','',1614107603,1614107603),('Price','cs','',1614106913,1614106913),('Price','de','',1614106913,1614106913),('Price','en','',1614106913,1614106913),('Price','es','',1614106913,1614106913),('Price','fa','',1614106913,1614106913),('Price','fr','',1614106913,1614106913),('Price','hu','',1614106913,1614106913),('Price','it','',1614106913,1614106913),('Price','ja','',1614106913,1614106913),('Price','nl','',1614106913,1614106913),('Price','pl','',1614106913,1614106913),('Price','pt_BR','',1614106913,1614106913),('Price','ru','',1614106913,1614106913),('Price','sk','',1614106913,1614106913),('Price','sv','',1614106913,1614106913),('Price','sv_FI','',1614106913,1614106913),('Price','th','',1614106913,1614106913),('Price','tr','',1614106913,1614106913),('Price','uk','',1614106913,1614106913),('Price','zh_Hans','',1614106913,1614106913),('Printed','cs','',1614107615,1614107615),('Printed','de','',1614107615,1614107615),('Printed','en','',1614107615,1614107615),('Printed','es','',1614107615,1614107615),('Printed','fa','',1614107615,1614107615),('Printed','fr','',1614107615,1614107615),('Printed','hu','',1614107615,1614107615),('Printed','it','',1614107615,1614107615),('Printed','ja','',1614107615,1614107615),('Printed','nl','',1614107615,1614107615),('Printed','pl','',1614107615,1614107615),('Printed','pt_BR','',1614107615,1614107615),('Printed','ru','',1614107615,1614107615),('Printed','sk','',1614107615,1614107615),('Printed','sv','',1614107615,1614107615),('Printed','sv_FI','',1614107615,1614107615),('Printed','th','',1614107615,1614107615),('Printed','tr','',1614107615,1614107615),('Printed','uk','',1614107615,1614107615),('Printed','zh_Hans','',1614107615,1614107615),('Puerto Rico','cs','',1614107603,1614107603),('Puerto Rico','de','',1614107603,1614107603),('Puerto Rico','en','',1614107603,1614107603),('Puerto Rico','es','',1614107603,1614107603),('Puerto Rico','fa','',1614107603,1614107603),('Puerto Rico','fr','',1614107603,1614107603),('Puerto Rico','hu','',1614107603,1614107603),('Puerto Rico','it','',1614107603,1614107603),('Puerto Rico','ja','',1614107603,1614107603),('Puerto Rico','nl','',1614107603,1614107603),('Puerto Rico','pl','',1614107603,1614107603),('Puerto Rico','pt_BR','',1614107603,1614107603),('Puerto Rico','ru','',1614107603,1614107603),('Puerto Rico','sk','',1614107603,1614107603),('Puerto Rico','sv','',1614107603,1614107603),('Puerto Rico','sv_FI','',1614107603,1614107603),('Puerto Rico','th','',1614107603,1614107603),('Puerto Rico','tr','',1614107603,1614107603),('Puerto Rico','uk','',1614107603,1614107603),('Puerto Rico','zh_Hans','',1614107603,1614107603),('Qatar','cs','',1614107603,1614107603),('Qatar','de','',1614107603,1614107603),('Qatar','en','',1614107603,1614107603),('Qatar','es','',1614107603,1614107603),('Qatar','fa','',1614107603,1614107603),('Qatar','fr','',1614107603,1614107603),('Qatar','hu','',1614107603,1614107603),('Qatar','it','',1614107603,1614107603),('Qatar','ja','',1614107603,1614107603),('Qatar','nl','',1614107603,1614107603),('Qatar','pl','',1614107603,1614107603),('Qatar','pt_BR','',1614107603,1614107603),('Qatar','ru','',1614107603,1614107603),('Qatar','sk','',1614107603,1614107603),('Qatar','sv','',1614107603,1614107603),('Qatar','sv_FI','',1614107603,1614107603),('Qatar','th','',1614107603,1614107603),('Qatar','tr','',1614107603,1614107603),('Qatar','uk','',1614107603,1614107603),('Qatar','zh_Hans','',1614107603,1614107603),('Returnable','cs','',1614107615,1614107615),('Returnable','de','',1614107615,1614107615),('Returnable','en','',1614107615,1614107615),('Returnable','es','',1614107615,1614107615),('Returnable','fa','',1614107615,1614107615),('Returnable','fr','',1614107615,1614107615),('Returnable','hu','',1614107615,1614107615),('Returnable','it','',1614107615,1614107615),('Returnable','ja','',1614107615,1614107615),('Returnable','nl','',1614107615,1614107615),('Returnable','pl','',1614107615,1614107615),('Returnable','pt_BR','',1614107615,1614107615),('Returnable','ru','',1614107615,1614107615),('Returnable','sk','',1614107615,1614107615),('Returnable','sv','',1614107615,1614107615),('Returnable','sv_FI','',1614107615,1614107615),('Returnable','th','',1614107615,1614107615),('Returnable','tr','',1614107615,1614107615),('Returnable','uk','',1614107615,1614107615),('Returnable','zh_Hans','',1614107615,1614107615),('Romania','cs','',1614107603,1614107603),('Romania','de','',1614107603,1614107603),('Romania','en','',1614107603,1614107603),('Romania','es','',1614107603,1614107603),('Romania','fa','',1614107603,1614107603),('Romania','fr','',1614107603,1614107603),('Romania','hu','',1614107603,1614107603),('Romania','it','',1614107603,1614107603),('Romania','ja','',1614107603,1614107603),('Romania','nl','',1614107603,1614107603),('Romania','pl','',1614107603,1614107603),('Romania','pt_BR','',1614107603,1614107603),('Romania','ru','',1614107603,1614107603),('Romania','sk','',1614107603,1614107603),('Romania','sv','',1614107603,1614107603),('Romania','sv_FI','',1614107603,1614107603),('Romania','th','',1614107603,1614107603),('Romania','tr','',1614107603,1614107603),('Romania','uk','',1614107603,1614107603),('Romania','zh_Hans','',1614107603,1614107603),('Round Neck','cs','',1614107399,1614107399),('Round Neck','de','',1614107399,1614107399),('Round Neck','en','',1614107399,1614107399),('Round Neck','es','',1614107399,1614107399),('Round Neck','fa','',1614107399,1614107399),('Round Neck','fr','',1614107399,1614107399),('Round Neck','hu','',1614107399,1614107399),('Round Neck','it','',1614107399,1614107399),('Round Neck','ja','',1614107399,1614107399),('Round Neck','nl','',1614107399,1614107399),('Round Neck','pl','',1614107399,1614107399),('Round Neck','pt_BR','',1614107399,1614107399),('Round Neck','ru','',1614107399,1614107399),('Round Neck','sk','',1614107399,1614107399),('Round Neck','sv','',1614107399,1614107399),('Round Neck','sv_FI','',1614107399,1614107399),('Round Neck','th','',1614107399,1614107399),('Round Neck','tr','',1614107399,1614107399),('Round Neck','uk','',1614107399,1614107399),('Round Neck','zh_Hans','',1614107399,1614107399),('Russia','cs','',1614107603,1614107603),('Russia','de','',1614107603,1614107603),('Russia','en','',1614107603,1614107603),('Russia','es','',1614107603,1614107603),('Russia','fa','',1614107603,1614107603),('Russia','fr','',1614107603,1614107603),('Russia','hu','',1614107603,1614107603),('Russia','it','',1614107603,1614107603),('Russia','ja','',1614107603,1614107603),('Russia','nl','',1614107603,1614107603),('Russia','pl','',1614107603,1614107603),('Russia','pt_BR','',1614107603,1614107603),('Russia','ru','',1614107603,1614107603),('Russia','sk','',1614107603,1614107603),('Russia','sv','',1614107603,1614107603),('Russia','sv_FI','',1614107603,1614107603),('Russia','th','',1614107603,1614107603),('Russia','tr','',1614107603,1614107603),('Russia','uk','',1614107603,1614107603),('Russia','zh_Hans','',1614107603,1614107603),('Rwanda','cs','',1614107603,1614107603),('Rwanda','de','',1614107603,1614107603),('Rwanda','en','',1614107603,1614107603),('Rwanda','es','',1614107603,1614107603),('Rwanda','fa','',1614107603,1614107603),('Rwanda','fr','',1614107603,1614107603),('Rwanda','hu','',1614107603,1614107603),('Rwanda','it','',1614107603,1614107603),('Rwanda','ja','',1614107603,1614107603),('Rwanda','nl','',1614107603,1614107603),('Rwanda','pl','',1614107603,1614107603),('Rwanda','pt_BR','',1614107603,1614107603),('Rwanda','ru','',1614107603,1614107603),('Rwanda','sk','',1614107603,1614107603),('Rwanda','sv','',1614107603,1614107603),('Rwanda','sv_FI','',1614107603,1614107603),('Rwanda','th','',1614107603,1614107603),('Rwanda','tr','',1614107603,1614107603),('Rwanda','uk','',1614107603,1614107603),('Rwanda','zh_Hans','',1614107603,1614107603),('Réunion','cs','',1614107603,1614107603),('Réunion','de','',1614107603,1614107603),('Réunion','en','',1614107603,1614107603),('Réunion','es','',1614107603,1614107603),('Réunion','fa','',1614107603,1614107603),('Réunion','fr','',1614107603,1614107603),('Réunion','hu','',1614107603,1614107603),('Réunion','it','',1614107603,1614107603),('Réunion','ja','',1614107603,1614107603),('Réunion','nl','',1614107603,1614107603),('Réunion','pl','',1614107603,1614107603),('Réunion','pt_BR','',1614107603,1614107603),('Réunion','ru','',1614107603,1614107603),('Réunion','sk','',1614107603,1614107603),('Réunion','sv','',1614107603,1614107603),('Réunion','sv_FI','',1614107603,1614107603),('Réunion','th','',1614107603,1614107603),('Réunion','tr','',1614107603,1614107603),('Réunion','uk','',1614107603,1614107603),('Réunion','zh_Hans','',1614107603,1614107603),('S','cs','',1614106914,1614106914),('S','de','',1614106914,1614106914),('S','en','',1614106914,1614106914),('S','es','',1614106914,1614106914),('S','fa','',1614106914,1614106914),('S','fr','',1614106914,1614106914),('S','hu','',1614106914,1614106914),('S','it','',1614106914,1614106914),('S','ja','',1614106914,1614106914),('S','nl','',1614106914,1614106914),('S','pl','',1614106914,1614106914),('S','pt_BR','',1614106914,1614106914),('S','ru','',1614106914,1614106914),('S','sk','',1614106914,1614106914),('S','sv','',1614106914,1614106914),('S','sv_FI','',1614106914,1614106914),('S','th','',1614106914,1614106914),('S','tr','',1614106914,1614106914),('S','uk','',1614106914,1614106914),('S','zh_Hans','',1614106914,1614106914),('SKU','cs','',1614106913,1614106913),('SKU','de','',1614106913,1614106913),('SKU','en','',1614106913,1614106913),('SKU','es','',1614106913,1614106913),('SKU','fa','',1614106913,1614106913),('SKU','fr','',1614106913,1614106913),('SKU','hu','',1614106913,1614106913),('SKU','it','',1614106913,1614106913),('SKU','ja','',1614106913,1614106913),('SKU','nl','',1614106913,1614106913),('SKU','pl','',1614106913,1614106913),('SKU','pt_BR','',1614106913,1614106913),('SKU','ru','',1614106913,1614106913),('SKU','sk','',1614106913,1614106913),('SKU','sv','',1614106913,1614106913),('SKU','sv_FI','',1614106913,1614106913),('SKU','th','',1614106913,1614106913),('SKU','tr','',1614106913,1614106913),('SKU','uk','',1614106913,1614106913),('SKU','zh_Hans','',1614106913,1614106913),('Samoa','cs','',1614107604,1614107604),('Samoa','de','',1614107604,1614107604),('Samoa','en','',1614107604,1614107604),('Samoa','es','',1614107604,1614107604),('Samoa','fa','',1614107604,1614107604),('Samoa','fr','',1614107604,1614107604),('Samoa','hu','',1614107604,1614107604),('Samoa','it','',1614107604,1614107604),('Samoa','ja','',1614107604,1614107604),('Samoa','nl','',1614107604,1614107604),('Samoa','pl','',1614107604,1614107604),('Samoa','pt_BR','',1614107604,1614107604),('Samoa','ru','',1614107604,1614107604),('Samoa','sk','',1614107604,1614107604),('Samoa','sv','',1614107604,1614107604),('Samoa','sv_FI','',1614107604,1614107604),('Samoa','th','',1614107604,1614107604),('Samoa','tr','',1614107604,1614107604),('Samoa','uk','',1614107604,1614107604),('Samoa','zh_Hans','',1614107604,1614107604),('San Marino','cs','',1614107604,1614107604),('San Marino','de','',1614107604,1614107604),('San Marino','en','',1614107604,1614107604),('San Marino','es','',1614107604,1614107604),('San Marino','fa','',1614107604,1614107604),('San Marino','fr','',1614107604,1614107604),('San Marino','hu','',1614107604,1614107604),('San Marino','it','',1614107604,1614107604),('San Marino','ja','',1614107604,1614107604),('San Marino','nl','',1614107604,1614107604),('San Marino','pl','',1614107604,1614107604),('San Marino','pt_BR','',1614107604,1614107604),('San Marino','ru','',1614107604,1614107604),('San Marino','sk','',1614107604,1614107604),('San Marino','sv','',1614107604,1614107604),('San Marino','sv_FI','',1614107604,1614107604),('San Marino','th','',1614107604,1614107604),('San Marino','tr','',1614107604,1614107604),('San Marino','uk','',1614107604,1614107604),('San Marino','zh_Hans','',1614107604,1614107604),('Saudi Arabia','cs','',1614107604,1614107604),('Saudi Arabia','de','',1614107604,1614107604),('Saudi Arabia','en','',1614107604,1614107604),('Saudi Arabia','es','',1614107604,1614107604),('Saudi Arabia','fa','',1614107604,1614107604),('Saudi Arabia','fr','',1614107604,1614107604),('Saudi Arabia','hu','',1614107604,1614107604),('Saudi Arabia','it','',1614107604,1614107604),('Saudi Arabia','ja','',1614107604,1614107604),('Saudi Arabia','nl','',1614107604,1614107604),('Saudi Arabia','pl','',1614107604,1614107604),('Saudi Arabia','pt_BR','',1614107604,1614107604),('Saudi Arabia','ru','',1614107604,1614107604),('Saudi Arabia','sk','',1614107604,1614107604),('Saudi Arabia','sv','',1614107604,1614107604),('Saudi Arabia','sv_FI','',1614107604,1614107604),('Saudi Arabia','th','',1614107604,1614107604),('Saudi Arabia','tr','',1614107604,1614107604),('Saudi Arabia','uk','',1614107604,1614107604),('Saudi Arabia','zh_Hans','',1614107604,1614107604),('Senegal','cs','',1614107604,1614107604),('Senegal','de','',1614107604,1614107604),('Senegal','en','',1614107604,1614107604),('Senegal','es','',1614107604,1614107604),('Senegal','fa','',1614107604,1614107604),('Senegal','fr','',1614107604,1614107604),('Senegal','hu','',1614107604,1614107604),('Senegal','it','',1614107604,1614107604),('Senegal','ja','',1614107604,1614107604),('Senegal','nl','',1614107604,1614107604),('Senegal','pl','',1614107604,1614107604),('Senegal','pt_BR','',1614107604,1614107604),('Senegal','ru','',1614107604,1614107604),('Senegal','sk','',1614107604,1614107604),('Senegal','sv','',1614107604,1614107604),('Senegal','sv_FI','',1614107604,1614107604),('Senegal','th','',1614107604,1614107604),('Senegal','tr','',1614107604,1614107604),('Senegal','uk','',1614107604,1614107604),('Senegal','zh_Hans','',1614107604,1614107604),('Serbia','cs','',1614107604,1614107604),('Serbia','de','',1614107604,1614107604),('Serbia','en','',1614107604,1614107604),('Serbia','es','',1614107604,1614107604),('Serbia','fa','',1614107604,1614107604),('Serbia','fr','',1614107604,1614107604),('Serbia','hu','',1614107604,1614107604),('Serbia','it','',1614107604,1614107604),('Serbia','ja','',1614107604,1614107604),('Serbia','nl','',1614107604,1614107604),('Serbia','pl','',1614107604,1614107604),('Serbia','pt_BR','',1614107604,1614107604),('Serbia','ru','',1614107604,1614107604),('Serbia','sk','',1614107604,1614107604),('Serbia','sv','',1614107604,1614107604),('Serbia','sv_FI','',1614107604,1614107604),('Serbia','th','',1614107604,1614107604),('Serbia','tr','',1614107604,1614107604),('Serbia','uk','',1614107604,1614107604),('Serbia','zh_Hans','',1614107604,1614107604),('Seychelles','cs','',1614107604,1614107604),('Seychelles','de','',1614107604,1614107604),('Seychelles','en','',1614107604,1614107604),('Seychelles','es','',1614107604,1614107604),('Seychelles','fa','',1614107604,1614107604),('Seychelles','fr','',1614107604,1614107604),('Seychelles','hu','',1614107604,1614107604),('Seychelles','it','',1614107604,1614107604),('Seychelles','ja','',1614107604,1614107604),('Seychelles','nl','',1614107604,1614107604),('Seychelles','pl','',1614107604,1614107604),('Seychelles','pt_BR','',1614107604,1614107604),('Seychelles','ru','',1614107604,1614107604),('Seychelles','sk','',1614107604,1614107604),('Seychelles','sv','',1614107604,1614107604),('Seychelles','sv_FI','',1614107604,1614107604),('Seychelles','th','',1614107604,1614107604),('Seychelles','tr','',1614107604,1614107604),('Seychelles','uk','',1614107604,1614107604),('Seychelles','zh_Hans','',1614107604,1614107604),('Sierra Leone','cs','',1614107604,1614107604),('Sierra Leone','de','',1614107604,1614107604),('Sierra Leone','en','',1614107604,1614107604),('Sierra Leone','es','',1614107604,1614107604),('Sierra Leone','fa','',1614107604,1614107604),('Sierra Leone','fr','',1614107604,1614107604),('Sierra Leone','hu','',1614107604,1614107604),('Sierra Leone','it','',1614107604,1614107604),('Sierra Leone','ja','',1614107604,1614107604),('Sierra Leone','nl','',1614107604,1614107604),('Sierra Leone','pl','',1614107604,1614107604),('Sierra Leone','pt_BR','',1614107604,1614107604),('Sierra Leone','ru','',1614107604,1614107604),('Sierra Leone','sk','',1614107604,1614107604),('Sierra Leone','sv','',1614107604,1614107604),('Sierra Leone','sv_FI','',1614107604,1614107604),('Sierra Leone','th','',1614107604,1614107604),('Sierra Leone','tr','',1614107604,1614107604),('Sierra Leone','uk','',1614107604,1614107604),('Sierra Leone','zh_Hans','',1614107604,1614107604),('Singapore','cs','',1614107605,1614107605),('Singapore','de','',1614107605,1614107605),('Singapore','en','',1614107605,1614107605),('Singapore','es','',1614107605,1614107605),('Singapore','fa','',1614107605,1614107605),('Singapore','fr','',1614107605,1614107605),('Singapore','hu','',1614107605,1614107605),('Singapore','it','',1614107605,1614107605),('Singapore','ja','',1614107605,1614107605),('Singapore','nl','',1614107605,1614107605),('Singapore','pl','',1614107605,1614107605),('Singapore','pt_BR','',1614107605,1614107605),('Singapore','ru','',1614107605,1614107605),('Singapore','sk','',1614107605,1614107605),('Singapore','sv','',1614107605,1614107605),('Singapore','sv_FI','',1614107605,1614107605),('Singapore','th','',1614107605,1614107605),('Singapore','tr','',1614107605,1614107605),('Singapore','uk','',1614107605,1614107605),('Singapore','zh_Hans','',1614107605,1614107605),('Sint Maarten','cs','',1614107605,1614107605),('Sint Maarten','de','',1614107605,1614107605),('Sint Maarten','en','',1614107605,1614107605),('Sint Maarten','es','',1614107605,1614107605),('Sint Maarten','fa','',1614107605,1614107605),('Sint Maarten','fr','',1614107605,1614107605),('Sint Maarten','hu','',1614107605,1614107605),('Sint Maarten','it','',1614107605,1614107605),('Sint Maarten','ja','',1614107605,1614107605),('Sint Maarten','nl','',1614107605,1614107605),('Sint Maarten','pl','',1614107605,1614107605),('Sint Maarten','pt_BR','',1614107605,1614107605),('Sint Maarten','ru','',1614107605,1614107605),('Sint Maarten','sk','',1614107605,1614107605),('Sint Maarten','sv','',1614107605,1614107605),('Sint Maarten','sv_FI','',1614107605,1614107605),('Sint Maarten','th','',1614107605,1614107605),('Sint Maarten','tr','',1614107605,1614107605),('Sint Maarten','uk','',1614107605,1614107605),('Sint Maarten','zh_Hans','',1614107605,1614107605),('Size','cs','',1614106913,1614106913),('Size','de','',1614106913,1614106913),('Size','en','',1614106913,1614106913),('Size','es','',1614106913,1614106913),('Size','fa','',1614106913,1614106913),('Size','fr','',1614106913,1614106913),('Size','hu','',1614106913,1614106913),('Size','it','',1614106913,1614106913),('Size','ja','',1614106913,1614106913),('Size','nl','',1614106913,1614106913),('Size','pl','',1614106913,1614106913),('Size','pt_BR','',1614106913,1614106913),('Size','ru','',1614106913,1614106913),('Size','sk','',1614106913,1614106913),('Size','sv','',1614106913,1614106913),('Size','sv_FI','',1614106913,1614106913),('Size','th','',1614106913,1614106913),('Size','tr','',1614106913,1614106913),('Size','uk','',1614106913,1614106913),('Size','zh_Hans','',1614106913,1614106913),('Sleeveless','cs','',1614107399,1614107399),('Sleeveless','de','',1614107399,1614107399),('Sleeveless','en','',1614107399,1614107399),('Sleeveless','es','',1614107399,1614107399),('Sleeveless','fa','',1614107399,1614107399),('Sleeveless','fr','',1614107399,1614107399),('Sleeveless','hu','',1614107399,1614107399),('Sleeveless','it','',1614107399,1614107399),('Sleeveless','ja','',1614107399,1614107399),('Sleeveless','nl','',1614107399,1614107399),('Sleeveless','pl','',1614107399,1614107399),('Sleeveless','pt_BR','',1614107399,1614107399),('Sleeveless','ru','',1614107399,1614107399),('Sleeveless','sk','',1614107399,1614107399),('Sleeveless','sv','',1614107399,1614107399),('Sleeveless','sv_FI','',1614107399,1614107399),('Sleeveless','th','',1614107399,1614107399),('Sleeveless','tr','',1614107399,1614107399),('Sleeveless','uk','',1614107399,1614107399),('Sleeveless','zh_Hans','',1614107399,1614107399),('Slovakia','cs','',1614107605,1614107605),('Slovakia','de','',1614107605,1614107605),('Slovakia','en','',1614107605,1614107605),('Slovakia','es','',1614107605,1614107605),('Slovakia','fa','',1614107605,1614107605),('Slovakia','fr','',1614107605,1614107605),('Slovakia','hu','',1614107605,1614107605),('Slovakia','it','',1614107605,1614107605),('Slovakia','ja','',1614107605,1614107605),('Slovakia','nl','',1614107605,1614107605),('Slovakia','pl','',1614107605,1614107605),('Slovakia','pt_BR','',1614107605,1614107605),('Slovakia','ru','',1614107605,1614107605),('Slovakia','sk','',1614107605,1614107605),('Slovakia','sv','',1614107605,1614107605),('Slovakia','sv_FI','',1614107605,1614107605),('Slovakia','th','',1614107605,1614107605),('Slovakia','tr','',1614107605,1614107605),('Slovakia','uk','',1614107605,1614107605),('Slovakia','zh_Hans','',1614107605,1614107605),('Slovenia','cs','',1614107605,1614107605),('Slovenia','de','',1614107605,1614107605),('Slovenia','en','',1614107605,1614107605),('Slovenia','es','',1614107605,1614107605),('Slovenia','fa','',1614107605,1614107605),('Slovenia','fr','',1614107605,1614107605),('Slovenia','hu','',1614107605,1614107605),('Slovenia','it','',1614107605,1614107605),('Slovenia','ja','',1614107605,1614107605),('Slovenia','nl','',1614107605,1614107605),('Slovenia','pl','',1614107605,1614107605),('Slovenia','pt_BR','',1614107605,1614107605),('Slovenia','ru','',1614107605,1614107605),('Slovenia','sk','',1614107605,1614107605),('Slovenia','sv','',1614107605,1614107605),('Slovenia','sv_FI','',1614107605,1614107605),('Slovenia','th','',1614107605,1614107605),('Slovenia','tr','',1614107605,1614107605),('Slovenia','uk','',1614107605,1614107605),('Slovenia','zh_Hans','',1614107605,1614107605),('Solid','cs','',1614107615,1614107615),('Solid','de','',1614107615,1614107615),('Solid','en','',1614107615,1614107615),('Solid','es','',1614107615,1614107615),('Solid','fa','',1614107615,1614107615),('Solid','fr','',1614107615,1614107615),('Solid','hu','',1614107615,1614107615),('Solid','it','',1614107615,1614107615),('Solid','ja','',1614107615,1614107615),('Solid','nl','',1614107615,1614107615),('Solid','pl','',1614107615,1614107615),('Solid','pt_BR','',1614107615,1614107615),('Solid','ru','',1614107615,1614107615),('Solid','sk','',1614107615,1614107615),('Solid','sv','',1614107615,1614107615),('Solid','sv_FI','',1614107615,1614107615),('Solid','th','',1614107615,1614107615),('Solid','tr','',1614107615,1614107615),('Solid','uk','',1614107615,1614107615),('Solid','zh_Hans','',1614107615,1614107615),('Solomon Islands','cs','',1614107605,1614107605),('Solomon Islands','de','',1614107605,1614107605),('Solomon Islands','en','',1614107605,1614107605),('Solomon Islands','es','',1614107605,1614107605),('Solomon Islands','fa','',1614107605,1614107605),('Solomon Islands','fr','',1614107605,1614107605),('Solomon Islands','hu','',1614107605,1614107605),('Solomon Islands','it','',1614107605,1614107605),('Solomon Islands','ja','',1614107605,1614107605),('Solomon Islands','nl','',1614107605,1614107605),('Solomon Islands','pl','',1614107605,1614107605),('Solomon Islands','pt_BR','',1614107605,1614107605),('Solomon Islands','ru','',1614107605,1614107605),('Solomon Islands','sk','',1614107605,1614107605),('Solomon Islands','sv','',1614107605,1614107605),('Solomon Islands','sv_FI','',1614107605,1614107605),('Solomon Islands','th','',1614107605,1614107605),('Solomon Islands','tr','',1614107605,1614107605),('Solomon Islands','uk','',1614107605,1614107605),('Solomon Islands','zh_Hans','',1614107605,1614107605),('Somalia','cs','',1614107605,1614107605),('Somalia','de','',1614107605,1614107605),('Somalia','en','',1614107605,1614107605),('Somalia','es','',1614107605,1614107605),('Somalia','fa','',1614107605,1614107605),('Somalia','fr','',1614107605,1614107605),('Somalia','hu','',1614107605,1614107605),('Somalia','it','',1614107605,1614107605),('Somalia','ja','',1614107605,1614107605),('Somalia','nl','',1614107605,1614107605),('Somalia','pl','',1614107605,1614107605),('Somalia','pt_BR','',1614107605,1614107605),('Somalia','ru','',1614107605,1614107605),('Somalia','sk','',1614107605,1614107605),('Somalia','sv','',1614107605,1614107605),('Somalia','sv_FI','',1614107605,1614107605),('Somalia','th','',1614107605,1614107605),('Somalia','tr','',1614107605,1614107605),('Somalia','uk','',1614107605,1614107605),('Somalia','zh_Hans','',1614107605,1614107605),('South Africa','cs','',1614107605,1614107605),('South Africa','de','',1614107605,1614107605),('South Africa','en','',1614107605,1614107605),('South Africa','es','',1614107605,1614107605),('South Africa','fa','',1614107605,1614107605),('South Africa','fr','',1614107605,1614107605),('South Africa','hu','',1614107605,1614107605),('South Africa','it','',1614107605,1614107605),('South Africa','ja','',1614107605,1614107605),('South Africa','nl','',1614107605,1614107605),('South Africa','pl','',1614107605,1614107605),('South Africa','pt_BR','',1614107605,1614107605),('South Africa','ru','',1614107605,1614107605),('South Africa','sk','',1614107605,1614107605),('South Africa','sv','',1614107605,1614107605),('South Africa','sv_FI','',1614107605,1614107605),('South Africa','th','',1614107605,1614107605),('South Africa','tr','',1614107605,1614107605),('South Africa','uk','',1614107605,1614107605),('South Africa','zh_Hans','',1614107605,1614107605),('South Georgia & South Sandwich Islands','cs','',1614107606,1614107606),('South Georgia & South Sandwich Islands','de','',1614107606,1614107606),('South Georgia & South Sandwich Islands','en','',1614107606,1614107606),('South Georgia & South Sandwich Islands','es','',1614107606,1614107606),('South Georgia & South Sandwich Islands','fa','',1614107606,1614107606),('South Georgia & South Sandwich Islands','fr','',1614107606,1614107606),('South Georgia & South Sandwich Islands','hu','',1614107606,1614107606),('South Georgia & South Sandwich Islands','it','',1614107606,1614107606),('South Georgia & South Sandwich Islands','ja','',1614107606,1614107606),('South Georgia & South Sandwich Islands','nl','',1614107606,1614107606),('South Georgia & South Sandwich Islands','pl','',1614107606,1614107606),('South Georgia & South Sandwich Islands','pt_BR','',1614107606,1614107606),('South Georgia & South Sandwich Islands','ru','',1614107606,1614107606),('South Georgia & South Sandwich Islands','sk','',1614107606,1614107606),('South Georgia & South Sandwich Islands','sv','',1614107606,1614107606),('South Georgia & South Sandwich Islands','sv_FI','',1614107606,1614107606),('South Georgia & South Sandwich Islands','th','',1614107606,1614107606),('South Georgia & South Sandwich Islands','tr','',1614107606,1614107606),('South Georgia & South Sandwich Islands','uk','',1614107606,1614107606),('South Georgia & South Sandwich Islands','zh_Hans','',1614107606,1614107606),('South Korea','cs','',1614107606,1614107606),('South Korea','de','',1614107606,1614107606),('South Korea','en','',1614107606,1614107606),('South Korea','es','',1614107606,1614107606),('South Korea','fa','',1614107606,1614107606),('South Korea','fr','',1614107606,1614107606),('South Korea','hu','',1614107606,1614107606),('South Korea','it','',1614107606,1614107606),('South Korea','ja','',1614107606,1614107606),('South Korea','nl','',1614107606,1614107606),('South Korea','pl','',1614107606,1614107606),('South Korea','pt_BR','',1614107606,1614107606),('South Korea','ru','',1614107606,1614107606),('South Korea','sk','',1614107606,1614107606),('South Korea','sv','',1614107606,1614107606),('South Korea','sv_FI','',1614107606,1614107606),('South Korea','th','',1614107606,1614107606),('South Korea','tr','',1614107606,1614107606),('South Korea','uk','',1614107606,1614107606),('South Korea','zh_Hans','',1614107606,1614107606),('South Sudan','cs','',1614107606,1614107606),('South Sudan','de','',1614107606,1614107606),('South Sudan','en','',1614107606,1614107606),('South Sudan','es','',1614107606,1614107606),('South Sudan','fa','',1614107606,1614107606),('South Sudan','fr','',1614107606,1614107606),('South Sudan','hu','',1614107606,1614107606),('South Sudan','it','',1614107606,1614107606),('South Sudan','ja','',1614107606,1614107606),('South Sudan','nl','',1614107606,1614107606),('South Sudan','pl','',1614107606,1614107606),('South Sudan','pt_BR','',1614107606,1614107606),('South Sudan','ru','',1614107606,1614107606),('South Sudan','sk','',1614107606,1614107606),('South Sudan','sv','',1614107606,1614107606),('South Sudan','sv_FI','',1614107606,1614107606),('South Sudan','th','',1614107606,1614107606),('South Sudan','tr','',1614107606,1614107606),('South Sudan','uk','',1614107606,1614107606),('South Sudan','zh_Hans','',1614107606,1614107606),('Spain','cs','',1614107606,1614107606),('Spain','de','',1614107606,1614107606),('Spain','en','',1614107606,1614107606),('Spain','es','',1614107606,1614107606),('Spain','fa','',1614107606,1614107606),('Spain','fr','',1614107606,1614107606),('Spain','hu','',1614107606,1614107606),('Spain','it','',1614107606,1614107606),('Spain','ja','',1614107606,1614107606),('Spain','nl','',1614107606,1614107606),('Spain','pl','',1614107606,1614107606),('Spain','pt_BR','',1614107606,1614107606),('Spain','ru','',1614107606,1614107606),('Spain','sk','',1614107606,1614107606),('Spain','sv','',1614107606,1614107606),('Spain','sv_FI','',1614107606,1614107606),('Spain','th','',1614107606,1614107606),('Spain','tr','',1614107606,1614107606),('Spain','uk','',1614107606,1614107606),('Spain','zh_Hans','',1614107606,1614107606),('Sri Lanka','cs','',1614107606,1614107606),('Sri Lanka','de','',1614107606,1614107606),('Sri Lanka','en','',1614107606,1614107606),('Sri Lanka','es','',1614107606,1614107606),('Sri Lanka','fa','',1614107606,1614107606),('Sri Lanka','fr','',1614107606,1614107606),('Sri Lanka','hu','',1614107606,1614107606),('Sri Lanka','it','',1614107606,1614107606),('Sri Lanka','ja','',1614107606,1614107606),('Sri Lanka','nl','',1614107606,1614107606),('Sri Lanka','pl','',1614107606,1614107606),('Sri Lanka','pt_BR','',1614107606,1614107606),('Sri Lanka','ru','',1614107606,1614107606),('Sri Lanka','sk','',1614107606,1614107606),('Sri Lanka','sv','',1614107606,1614107606),('Sri Lanka','sv_FI','',1614107606,1614107606),('Sri Lanka','th','',1614107606,1614107606),('Sri Lanka','tr','',1614107606,1614107606),('Sri Lanka','uk','',1614107606,1614107606),('Sri Lanka','zh_Hans','',1614107606,1614107606),('St. Barthélemy','cs','',1614107606,1614107606),('St. Barthélemy','de','',1614107606,1614107606),('St. Barthélemy','en','',1614107606,1614107606),('St. Barthélemy','es','',1614107606,1614107606),('St. Barthélemy','fa','',1614107606,1614107606),('St. Barthélemy','fr','',1614107606,1614107606),('St. Barthélemy','hu','',1614107606,1614107606),('St. Barthélemy','it','',1614107606,1614107606),('St. Barthélemy','ja','',1614107606,1614107606),('St. Barthélemy','nl','',1614107606,1614107606),('St. Barthélemy','pl','',1614107606,1614107606),('St. Barthélemy','pt_BR','',1614107606,1614107606),('St. Barthélemy','ru','',1614107606,1614107606),('St. Barthélemy','sk','',1614107606,1614107606),('St. Barthélemy','sv','',1614107606,1614107606),('St. Barthélemy','sv_FI','',1614107606,1614107606),('St. Barthélemy','th','',1614107606,1614107606),('St. Barthélemy','tr','',1614107606,1614107606),('St. Barthélemy','uk','',1614107606,1614107606),('St. Barthélemy','zh_Hans','',1614107606,1614107606),('St. Helena','cs','',1614107606,1614107606),('St. Helena','de','',1614107606,1614107606),('St. Helena','en','',1614107606,1614107606),('St. Helena','es','',1614107606,1614107606),('St. Helena','fa','',1614107606,1614107606),('St. Helena','fr','',1614107606,1614107606),('St. Helena','hu','',1614107606,1614107606),('St. Helena','it','',1614107606,1614107606),('St. Helena','ja','',1614107606,1614107606),('St. Helena','nl','',1614107606,1614107606),('St. Helena','pl','',1614107606,1614107606),('St. Helena','pt_BR','',1614107606,1614107606),('St. Helena','ru','',1614107606,1614107606),('St. Helena','sk','',1614107606,1614107606),('St. Helena','sv','',1614107606,1614107606),('St. Helena','sv_FI','',1614107606,1614107606),('St. Helena','th','',1614107606,1614107606),('St. Helena','tr','',1614107606,1614107606),('St. Helena','uk','',1614107606,1614107606),('St. Helena','zh_Hans','',1614107606,1614107606),('St. Kitts & Nevis','cs','',1614107606,1614107606),('St. Kitts & Nevis','de','',1614107606,1614107606),('St. Kitts & Nevis','en','',1614107606,1614107606),('St. Kitts & Nevis','es','',1614107606,1614107606),('St. Kitts & Nevis','fa','',1614107606,1614107606),('St. Kitts & Nevis','fr','',1614107606,1614107606),('St. Kitts & Nevis','hu','',1614107606,1614107606),('St. Kitts & Nevis','it','',1614107606,1614107606),('St. Kitts & Nevis','ja','',1614107606,1614107606),('St. Kitts & Nevis','nl','',1614107606,1614107606),('St. Kitts & Nevis','pl','',1614107606,1614107606),('St. Kitts & Nevis','pt_BR','',1614107606,1614107606),('St. Kitts & Nevis','ru','',1614107606,1614107606),('St. Kitts & Nevis','sk','',1614107606,1614107606),('St. Kitts & Nevis','sv','',1614107606,1614107606),('St. Kitts & Nevis','sv_FI','',1614107606,1614107606),('St. Kitts & Nevis','th','',1614107606,1614107606),('St. Kitts & Nevis','tr','',1614107606,1614107606),('St. Kitts & Nevis','uk','',1614107606,1614107606),('St. Kitts & Nevis','zh_Hans','',1614107606,1614107606),('St. Lucia','cs','',1614107606,1614107606),('St. Lucia','de','',1614107606,1614107606),('St. Lucia','en','',1614107606,1614107606),('St. Lucia','es','',1614107606,1614107606),('St. Lucia','fa','',1614107606,1614107606),('St. Lucia','fr','',1614107606,1614107606),('St. Lucia','hu','',1614107606,1614107606),('St. Lucia','it','',1614107606,1614107606),('St. Lucia','ja','',1614107606,1614107606),('St. Lucia','nl','',1614107606,1614107606),('St. Lucia','pl','',1614107606,1614107606),('St. Lucia','pt_BR','',1614107606,1614107606),('St. Lucia','ru','',1614107606,1614107606),('St. Lucia','sk','',1614107606,1614107606),('St. Lucia','sv','',1614107606,1614107606),('St. Lucia','sv_FI','',1614107606,1614107606),('St. Lucia','th','',1614107606,1614107606),('St. Lucia','tr','',1614107606,1614107606),('St. Lucia','uk','',1614107606,1614107606),('St. Lucia','zh_Hans','',1614107606,1614107606),('St. Martin','cs','',1614107607,1614107607),('St. Martin','de','',1614107607,1614107607),('St. Martin','en','',1614107607,1614107607),('St. Martin','es','',1614107607,1614107607),('St. Martin','fa','',1614107607,1614107607),('St. Martin','fr','',1614107607,1614107607),('St. Martin','hu','',1614107607,1614107607),('St. Martin','it','',1614107607,1614107607),('St. Martin','ja','',1614107607,1614107607),('St. Martin','nl','',1614107607,1614107607),('St. Martin','pl','',1614107607,1614107607),('St. Martin','pt_BR','',1614107607,1614107607),('St. Martin','ru','',1614107607,1614107607),('St. Martin','sk','',1614107607,1614107607),('St. Martin','sv','',1614107607,1614107607),('St. Martin','sv_FI','',1614107607,1614107607),('St. Martin','th','',1614107607,1614107607),('St. Martin','tr','',1614107607,1614107607),('St. Martin','uk','',1614107607,1614107607),('St. Martin','zh_Hans','',1614107607,1614107607),('St. Pierre & Miquelon','cs','',1614107607,1614107607),('St. Pierre & Miquelon','de','',1614107607,1614107607),('St. Pierre & Miquelon','en','',1614107607,1614107607),('St. Pierre & Miquelon','es','',1614107607,1614107607),('St. Pierre & Miquelon','fa','',1614107607,1614107607),('St. Pierre & Miquelon','fr','',1614107607,1614107607),('St. Pierre & Miquelon','hu','',1614107607,1614107607),('St. Pierre & Miquelon','it','',1614107607,1614107607),('St. Pierre & Miquelon','ja','',1614107607,1614107607),('St. Pierre & Miquelon','nl','',1614107607,1614107607),('St. Pierre & Miquelon','pl','',1614107607,1614107607),('St. Pierre & Miquelon','pt_BR','',1614107607,1614107607),('St. Pierre & Miquelon','ru','',1614107607,1614107607),('St. Pierre & Miquelon','sk','',1614107607,1614107607),('St. Pierre & Miquelon','sv','',1614107607,1614107607),('St. Pierre & Miquelon','sv_FI','',1614107607,1614107607),('St. Pierre & Miquelon','th','',1614107607,1614107607),('St. Pierre & Miquelon','tr','',1614107607,1614107607),('St. Pierre & Miquelon','uk','',1614107607,1614107607),('St. Pierre & Miquelon','zh_Hans','',1614107607,1614107607),('St. Vincent & Grenadines','cs','',1614107607,1614107607),('St. Vincent & Grenadines','de','',1614107607,1614107607),('St. Vincent & Grenadines','en','',1614107607,1614107607),('St. Vincent & Grenadines','es','',1614107607,1614107607),('St. Vincent & Grenadines','fa','',1614107607,1614107607),('St. Vincent & Grenadines','fr','',1614107607,1614107607),('St. Vincent & Grenadines','hu','',1614107607,1614107607),('St. Vincent & Grenadines','it','',1614107607,1614107607),('St. Vincent & Grenadines','ja','',1614107607,1614107607),('St. Vincent & Grenadines','nl','',1614107607,1614107607),('St. Vincent & Grenadines','pl','',1614107607,1614107607),('St. Vincent & Grenadines','pt_BR','',1614107607,1614107607),('St. Vincent & Grenadines','ru','',1614107607,1614107607),('St. Vincent & Grenadines','sk','',1614107607,1614107607),('St. Vincent & Grenadines','sv','',1614107607,1614107607),('St. Vincent & Grenadines','sv_FI','',1614107607,1614107607),('St. Vincent & Grenadines','th','',1614107607,1614107607),('St. Vincent & Grenadines','tr','',1614107607,1614107607),('St. Vincent & Grenadines','uk','',1614107607,1614107607),('St. Vincent & Grenadines','zh_Hans','',1614107607,1614107607),('Stripes','cs','',1614107615,1614107615),('Stripes','de','',1614107615,1614107615),('Stripes','en','',1614107615,1614107615),('Stripes','es','',1614107615,1614107615),('Stripes','fa','',1614107615,1614107615),('Stripes','fr','',1614107615,1614107615),('Stripes','hu','',1614107615,1614107615),('Stripes','it','',1614107615,1614107615),('Stripes','ja','',1614107615,1614107615),('Stripes','nl','',1614107615,1614107615),('Stripes','pl','',1614107615,1614107615),('Stripes','pt_BR','',1614107615,1614107615),('Stripes','ru','',1614107615,1614107615),('Stripes','sk','',1614107615,1614107615),('Stripes','sv','',1614107615,1614107615),('Stripes','sv_FI','',1614107615,1614107615),('Stripes','th','',1614107615,1614107615),('Stripes','tr','',1614107615,1614107615),('Stripes','uk','',1614107615,1614107615),('Stripes','zh_Hans','',1614107615,1614107615),('Sudan','cs','',1614107607,1614107607),('Sudan','de','',1614107607,1614107607),('Sudan','en','',1614107607,1614107607),('Sudan','es','',1614107607,1614107607),('Sudan','fa','',1614107607,1614107607),('Sudan','fr','',1614107607,1614107607),('Sudan','hu','',1614107607,1614107607),('Sudan','it','',1614107607,1614107607),('Sudan','ja','',1614107607,1614107607),('Sudan','nl','',1614107607,1614107607),('Sudan','pl','',1614107607,1614107607),('Sudan','pt_BR','',1614107607,1614107607),('Sudan','ru','',1614107607,1614107607),('Sudan','sk','',1614107607,1614107607),('Sudan','sv','',1614107607,1614107607),('Sudan','sv_FI','',1614107607,1614107607),('Sudan','th','',1614107607,1614107607),('Sudan','tr','',1614107607,1614107607),('Sudan','uk','',1614107607,1614107607),('Sudan','zh_Hans','',1614107607,1614107607),('Suriname','cs','',1614107607,1614107607),('Suriname','de','',1614107607,1614107607),('Suriname','en','',1614107607,1614107607),('Suriname','es','',1614107607,1614107607),('Suriname','fa','',1614107607,1614107607),('Suriname','fr','',1614107607,1614107607),('Suriname','hu','',1614107607,1614107607),('Suriname','it','',1614107607,1614107607),('Suriname','ja','',1614107607,1614107607),('Suriname','nl','',1614107607,1614107607),('Suriname','pl','',1614107607,1614107607),('Suriname','pt_BR','',1614107607,1614107607),('Suriname','ru','',1614107607,1614107607),('Suriname','sk','',1614107607,1614107607),('Suriname','sv','',1614107607,1614107607),('Suriname','sv_FI','',1614107607,1614107607),('Suriname','th','',1614107607,1614107607),('Suriname','tr','',1614107607,1614107607),('Suriname','uk','',1614107607,1614107607),('Suriname','zh_Hans','',1614107607,1614107607),('Svalbard & Jan Mayen','cs','',1614107607,1614107607),('Svalbard & Jan Mayen','de','',1614107607,1614107607),('Svalbard & Jan Mayen','en','',1614107607,1614107607),('Svalbard & Jan Mayen','es','',1614107607,1614107607),('Svalbard & Jan Mayen','fa','',1614107607,1614107607),('Svalbard & Jan Mayen','fr','',1614107607,1614107607),('Svalbard & Jan Mayen','hu','',1614107607,1614107607),('Svalbard & Jan Mayen','it','',1614107607,1614107607),('Svalbard & Jan Mayen','ja','',1614107607,1614107607),('Svalbard & Jan Mayen','nl','',1614107607,1614107607),('Svalbard & Jan Mayen','pl','',1614107607,1614107607),('Svalbard & Jan Mayen','pt_BR','',1614107607,1614107607),('Svalbard & Jan Mayen','ru','',1614107607,1614107607),('Svalbard & Jan Mayen','sk','',1614107607,1614107607),('Svalbard & Jan Mayen','sv','',1614107607,1614107607),('Svalbard & Jan Mayen','sv_FI','',1614107607,1614107607),('Svalbard & Jan Mayen','th','',1614107607,1614107607),('Svalbard & Jan Mayen','tr','',1614107607,1614107607),('Svalbard & Jan Mayen','uk','',1614107607,1614107607),('Svalbard & Jan Mayen','zh_Hans','',1614107607,1614107607),('Sweden','cs','',1614107607,1614107607),('Sweden','de','',1614107607,1614107607),('Sweden','en','',1614107607,1614107607),('Sweden','es','',1614107607,1614107607),('Sweden','fa','',1614107607,1614107607),('Sweden','fr','',1614107607,1614107607),('Sweden','hu','',1614107607,1614107607),('Sweden','it','',1614107607,1614107607),('Sweden','ja','',1614107607,1614107607),('Sweden','nl','',1614107607,1614107607),('Sweden','pl','',1614107607,1614107607),('Sweden','pt_BR','',1614107607,1614107607),('Sweden','ru','',1614107607,1614107607),('Sweden','sk','',1614107607,1614107607),('Sweden','sv','',1614107607,1614107607),('Sweden','sv_FI','',1614107607,1614107607),('Sweden','th','',1614107607,1614107607),('Sweden','tr','',1614107607,1614107607),('Sweden','uk','',1614107607,1614107607),('Sweden','zh_Hans','',1614107607,1614107607),('Switzerland','cs','',1614107607,1614107607),('Switzerland','de','',1614107607,1614107607),('Switzerland','en','',1614107607,1614107607),('Switzerland','es','',1614107607,1614107607),('Switzerland','fa','',1614107607,1614107607),('Switzerland','fr','',1614107607,1614107607),('Switzerland','hu','',1614107607,1614107607),('Switzerland','it','',1614107607,1614107607),('Switzerland','ja','',1614107607,1614107607),('Switzerland','nl','',1614107607,1614107607),('Switzerland','pl','',1614107607,1614107607),('Switzerland','pt_BR','',1614107607,1614107607),('Switzerland','ru','',1614107607,1614107607),('Switzerland','sk','',1614107607,1614107607),('Switzerland','sv','',1614107607,1614107607),('Switzerland','sv_FI','',1614107607,1614107607),('Switzerland','th','',1614107607,1614107607),('Switzerland','tr','',1614107607,1614107607),('Switzerland','uk','',1614107607,1614107607),('Switzerland','zh_Hans','',1614107607,1614107607),('Syria','cs','',1614107607,1614107607),('Syria','de','',1614107607,1614107607),('Syria','en','',1614107607,1614107607),('Syria','es','',1614107607,1614107607),('Syria','fa','',1614107607,1614107607),('Syria','fr','',1614107607,1614107607),('Syria','hu','',1614107607,1614107607),('Syria','it','',1614107607,1614107607),('Syria','ja','',1614107607,1614107607),('Syria','nl','',1614107607,1614107607),('Syria','pl','',1614107607,1614107607),('Syria','pt_BR','',1614107607,1614107607),('Syria','ru','',1614107607,1614107607),('Syria','sk','',1614107607,1614107607),('Syria','sv','',1614107607,1614107607),('Syria','sv_FI','',1614107607,1614107607),('Syria','th','',1614107607,1614107607),('Syria','tr','',1614107607,1614107607),('Syria','uk','',1614107607,1614107607),('Syria','zh_Hans','',1614107607,1614107607),('São Tomé & Príncipe','cs','',1614107607,1614107607),('São Tomé & Príncipe','de','',1614107607,1614107607),('São Tomé & Príncipe','en','',1614107607,1614107607),('São Tomé & Príncipe','es','',1614107607,1614107607),('São Tomé & Príncipe','fa','',1614107607,1614107607),('São Tomé & Príncipe','fr','',1614107607,1614107607),('São Tomé & Príncipe','hu','',1614107607,1614107607),('São Tomé & Príncipe','it','',1614107607,1614107607),('São Tomé & Príncipe','ja','',1614107607,1614107607),('São Tomé & Príncipe','nl','',1614107607,1614107607),('São Tomé & Príncipe','pl','',1614107607,1614107607),('São Tomé & Príncipe','pt_BR','',1614107607,1614107607),('São Tomé & Príncipe','ru','',1614107607,1614107607),('São Tomé & Príncipe','sk','',1614107607,1614107607),('São Tomé & Príncipe','sv','',1614107607,1614107607),('São Tomé & Príncipe','sv_FI','',1614107607,1614107607),('São Tomé & Príncipe','th','',1614107607,1614107607),('São Tomé & Príncipe','tr','',1614107607,1614107607),('São Tomé & Príncipe','uk','',1614107607,1614107607),('São Tomé & Príncipe','zh_Hans','',1614107607,1614107607),('Taiwan','cs','',1614107608,1614107608),('Taiwan','de','',1614107608,1614107608),('Taiwan','en','',1614107608,1614107608),('Taiwan','es','',1614107608,1614107608),('Taiwan','fa','',1614107608,1614107608),('Taiwan','fr','',1614107608,1614107608),('Taiwan','hu','',1614107608,1614107608),('Taiwan','it','',1614107608,1614107608),('Taiwan','ja','',1614107608,1614107608),('Taiwan','nl','',1614107608,1614107608),('Taiwan','pl','',1614107608,1614107608),('Taiwan','pt_BR','',1614107608,1614107608),('Taiwan','ru','',1614107608,1614107608),('Taiwan','sk','',1614107608,1614107608),('Taiwan','sv','',1614107608,1614107608),('Taiwan','sv_FI','',1614107608,1614107608),('Taiwan','th','',1614107608,1614107608),('Taiwan','tr','',1614107608,1614107608),('Taiwan','uk','',1614107608,1614107608),('Taiwan','zh_Hans','',1614107608,1614107608),('Tajikistan','cs','',1614107608,1614107608),('Tajikistan','de','',1614107608,1614107608),('Tajikistan','en','',1614107608,1614107608),('Tajikistan','es','',1614107608,1614107608),('Tajikistan','fa','',1614107608,1614107608),('Tajikistan','fr','',1614107608,1614107608),('Tajikistan','hu','',1614107608,1614107608),('Tajikistan','it','',1614107608,1614107608),('Tajikistan','ja','',1614107608,1614107608),('Tajikistan','nl','',1614107608,1614107608),('Tajikistan','pl','',1614107608,1614107608),('Tajikistan','pt_BR','',1614107608,1614107608),('Tajikistan','ru','',1614107608,1614107608),('Tajikistan','sk','',1614107608,1614107608),('Tajikistan','sv','',1614107608,1614107608),('Tajikistan','sv_FI','',1614107608,1614107608),('Tajikistan','th','',1614107608,1614107608),('Tajikistan','tr','',1614107608,1614107608),('Tajikistan','uk','',1614107608,1614107608),('Tajikistan','zh_Hans','',1614107608,1614107608),('Tanzania','cs','',1614107608,1614107608),('Tanzania','de','',1614107608,1614107608),('Tanzania','en','',1614107608,1614107608),('Tanzania','es','',1614107608,1614107608),('Tanzania','fa','',1614107608,1614107608),('Tanzania','fr','',1614107608,1614107608),('Tanzania','hu','',1614107608,1614107608),('Tanzania','it','',1614107608,1614107608),('Tanzania','ja','',1614107608,1614107608),('Tanzania','nl','',1614107608,1614107608),('Tanzania','pl','',1614107608,1614107608),('Tanzania','pt_BR','',1614107608,1614107608),('Tanzania','ru','',1614107608,1614107608),('Tanzania','sk','',1614107608,1614107608),('Tanzania','sv','',1614107608,1614107608),('Tanzania','sv_FI','',1614107608,1614107608),('Tanzania','th','',1614107608,1614107608),('Tanzania','tr','',1614107608,1614107608),('Tanzania','uk','',1614107608,1614107608),('Tanzania','zh_Hans','',1614107608,1614107608),('Thailand','cs','',1614107608,1614107608),('Thailand','de','',1614107608,1614107608),('Thailand','en','',1614107608,1614107608),('Thailand','es','',1614107608,1614107608),('Thailand','fa','',1614107608,1614107608),('Thailand','fr','',1614107608,1614107608),('Thailand','hu','',1614107608,1614107608),('Thailand','it','',1614107608,1614107608),('Thailand','ja','',1614107608,1614107608),('Thailand','nl','',1614107608,1614107608),('Thailand','pl','',1614107608,1614107608),('Thailand','pt_BR','',1614107608,1614107608),('Thailand','ru','',1614107608,1614107608),('Thailand','sk','',1614107608,1614107608),('Thailand','sv','',1614107608,1614107608),('Thailand','sv_FI','',1614107608,1614107608),('Thailand','th','',1614107608,1614107608),('Thailand','tr','',1614107608,1614107608),('Thailand','uk','',1614107608,1614107608),('Thailand','zh_Hans','',1614107608,1614107608),('Timor-Leste','cs','',1614107608,1614107608),('Timor-Leste','de','',1614107608,1614107608),('Timor-Leste','en','',1614107608,1614107608),('Timor-Leste','es','',1614107608,1614107608),('Timor-Leste','fa','',1614107608,1614107608),('Timor-Leste','fr','',1614107608,1614107608),('Timor-Leste','hu','',1614107608,1614107608),('Timor-Leste','it','',1614107608,1614107608),('Timor-Leste','ja','',1614107608,1614107608),('Timor-Leste','nl','',1614107608,1614107608),('Timor-Leste','pl','',1614107608,1614107608),('Timor-Leste','pt_BR','',1614107608,1614107608),('Timor-Leste','ru','',1614107608,1614107608),('Timor-Leste','sk','',1614107608,1614107608),('Timor-Leste','sv','',1614107608,1614107608),('Timor-Leste','sv_FI','',1614107608,1614107608),('Timor-Leste','th','',1614107608,1614107608),('Timor-Leste','tr','',1614107608,1614107608),('Timor-Leste','uk','',1614107608,1614107608),('Timor-Leste','zh_Hans','',1614107608,1614107608),('Togo','cs','',1614107608,1614107608),('Togo','de','',1614107608,1614107608),('Togo','en','',1614107608,1614107608),('Togo','es','',1614107608,1614107608),('Togo','fa','',1614107608,1614107608),('Togo','fr','',1614107608,1614107608),('Togo','hu','',1614107608,1614107608),('Togo','it','',1614107608,1614107608),('Togo','ja','',1614107608,1614107608),('Togo','nl','',1614107608,1614107608),('Togo','pl','',1614107608,1614107608),('Togo','pt_BR','',1614107608,1614107608),('Togo','ru','',1614107608,1614107608),('Togo','sk','',1614107608,1614107608),('Togo','sv','',1614107608,1614107608),('Togo','sv_FI','',1614107608,1614107608),('Togo','th','',1614107608,1614107608),('Togo','tr','',1614107608,1614107608),('Togo','uk','',1614107608,1614107608),('Togo','zh_Hans','',1614107608,1614107608),('Tokelau','cs','',1614107608,1614107608),('Tokelau','de','',1614107608,1614107608),('Tokelau','en','',1614107608,1614107608),('Tokelau','es','',1614107608,1614107608),('Tokelau','fa','',1614107608,1614107608),('Tokelau','fr','',1614107608,1614107608),('Tokelau','hu','',1614107608,1614107608),('Tokelau','it','',1614107608,1614107608),('Tokelau','ja','',1614107608,1614107608),('Tokelau','nl','',1614107608,1614107608),('Tokelau','pl','',1614107608,1614107608),('Tokelau','pt_BR','',1614107608,1614107608),('Tokelau','ru','',1614107608,1614107608),('Tokelau','sk','',1614107608,1614107608),('Tokelau','sv','',1614107608,1614107608),('Tokelau','sv_FI','',1614107608,1614107608),('Tokelau','th','',1614107608,1614107608),('Tokelau','tr','',1614107608,1614107608),('Tokelau','uk','',1614107608,1614107608),('Tokelau','zh_Hans','',1614107608,1614107608),('Tonga','cs','',1614107608,1614107608),('Tonga','de','',1614107608,1614107608),('Tonga','en','',1614107608,1614107608),('Tonga','es','',1614107608,1614107608),('Tonga','fa','',1614107608,1614107608),('Tonga','fr','',1614107608,1614107608),('Tonga','hu','',1614107608,1614107608),('Tonga','it','',1614107608,1614107608),('Tonga','ja','',1614107608,1614107608),('Tonga','nl','',1614107608,1614107608),('Tonga','pl','',1614107608,1614107608),('Tonga','pt_BR','',1614107608,1614107608),('Tonga','ru','',1614107608,1614107608),('Tonga','sk','',1614107608,1614107608),('Tonga','sv','',1614107608,1614107608),('Tonga','sv_FI','',1614107608,1614107608),('Tonga','th','',1614107608,1614107608),('Tonga','tr','',1614107608,1614107608),('Tonga','uk','',1614107608,1614107608),('Tonga','zh_Hans','',1614107608,1614107608),('Trinidad & Tobago','cs','',1614107608,1614107608),('Trinidad & Tobago','de','',1614107608,1614107608),('Trinidad & Tobago','en','',1614107608,1614107608),('Trinidad & Tobago','es','',1614107608,1614107608),('Trinidad & Tobago','fa','',1614107608,1614107608),('Trinidad & Tobago','fr','',1614107608,1614107608),('Trinidad & Tobago','hu','',1614107608,1614107608),('Trinidad & Tobago','it','',1614107608,1614107608),('Trinidad & Tobago','ja','',1614107608,1614107608),('Trinidad & Tobago','nl','',1614107608,1614107608),('Trinidad & Tobago','pl','',1614107608,1614107608),('Trinidad & Tobago','pt_BR','',1614107608,1614107608),('Trinidad & Tobago','ru','',1614107608,1614107608),('Trinidad & Tobago','sk','',1614107608,1614107608),('Trinidad & Tobago','sv','',1614107608,1614107608),('Trinidad & Tobago','sv_FI','',1614107608,1614107608),('Trinidad & Tobago','th','',1614107608,1614107608),('Trinidad & Tobago','tr','',1614107608,1614107608),('Trinidad & Tobago','uk','',1614107608,1614107608),('Trinidad & Tobago','zh_Hans','',1614107608,1614107608),('Tunisia','cs','',1614107608,1614107608),('Tunisia','de','',1614107608,1614107608),('Tunisia','en','',1614107608,1614107608),('Tunisia','es','',1614107608,1614107608),('Tunisia','fa','',1614107608,1614107608),('Tunisia','fr','',1614107608,1614107608),('Tunisia','hu','',1614107608,1614107608),('Tunisia','it','',1614107608,1614107608),('Tunisia','ja','',1614107608,1614107608),('Tunisia','nl','',1614107608,1614107608),('Tunisia','pl','',1614107608,1614107608),('Tunisia','pt_BR','',1614107608,1614107608),('Tunisia','ru','',1614107608,1614107608),('Tunisia','sk','',1614107608,1614107608),('Tunisia','sv','',1614107608,1614107608),('Tunisia','sv_FI','',1614107608,1614107608),('Tunisia','th','',1614107608,1614107608),('Tunisia','tr','',1614107608,1614107608),('Tunisia','uk','',1614107608,1614107608),('Tunisia','zh_Hans','',1614107608,1614107608),('Turkey','cs','',1614107609,1614107609),('Turkey','de','',1614107609,1614107609),('Turkey','en','',1614107609,1614107609),('Turkey','es','',1614107609,1614107609),('Turkey','fa','',1614107609,1614107609),('Turkey','fr','',1614107609,1614107609),('Turkey','hu','',1614107609,1614107609),('Turkey','it','',1614107609,1614107609),('Turkey','ja','',1614107609,1614107609),('Turkey','nl','',1614107609,1614107609),('Turkey','pl','',1614107609,1614107609),('Turkey','pt_BR','',1614107609,1614107609),('Turkey','ru','',1614107609,1614107609),('Turkey','sk','',1614107609,1614107609),('Turkey','sv','',1614107609,1614107609),('Turkey','sv_FI','',1614107609,1614107609),('Turkey','th','',1614107609,1614107609),('Turkey','tr','',1614107609,1614107609),('Turkey','uk','',1614107609,1614107609),('Turkey','zh_Hans','',1614107609,1614107609),('Turkmenistan','cs','',1614107609,1614107609),('Turkmenistan','de','',1614107609,1614107609),('Turkmenistan','en','',1614107609,1614107609),('Turkmenistan','es','',1614107609,1614107609),('Turkmenistan','fa','',1614107609,1614107609),('Turkmenistan','fr','',1614107609,1614107609),('Turkmenistan','hu','',1614107609,1614107609),('Turkmenistan','it','',1614107609,1614107609),('Turkmenistan','ja','',1614107609,1614107609),('Turkmenistan','nl','',1614107609,1614107609),('Turkmenistan','pl','',1614107609,1614107609),('Turkmenistan','pt_BR','',1614107609,1614107609),('Turkmenistan','ru','',1614107609,1614107609),('Turkmenistan','sk','',1614107609,1614107609),('Turkmenistan','sv','',1614107609,1614107609),('Turkmenistan','sv_FI','',1614107609,1614107609),('Turkmenistan','th','',1614107609,1614107609),('Turkmenistan','tr','',1614107609,1614107609),('Turkmenistan','uk','',1614107609,1614107609),('Turkmenistan','zh_Hans','',1614107609,1614107609),('Turks & Caicos Islands','cs','',1614107609,1614107609),('Turks & Caicos Islands','de','',1614107609,1614107609),('Turks & Caicos Islands','en','',1614107609,1614107609),('Turks & Caicos Islands','es','',1614107609,1614107609),('Turks & Caicos Islands','fa','',1614107609,1614107609),('Turks & Caicos Islands','fr','',1614107609,1614107609),('Turks & Caicos Islands','hu','',1614107609,1614107609),('Turks & Caicos Islands','it','',1614107609,1614107609),('Turks & Caicos Islands','ja','',1614107609,1614107609),('Turks & Caicos Islands','nl','',1614107609,1614107609),('Turks & Caicos Islands','pl','',1614107609,1614107609),('Turks & Caicos Islands','pt_BR','',1614107609,1614107609),('Turks & Caicos Islands','ru','',1614107609,1614107609),('Turks & Caicos Islands','sk','',1614107609,1614107609),('Turks & Caicos Islands','sv','',1614107609,1614107609),('Turks & Caicos Islands','sv_FI','',1614107609,1614107609),('Turks & Caicos Islands','th','',1614107609,1614107609),('Turks & Caicos Islands','tr','',1614107609,1614107609),('Turks & Caicos Islands','uk','',1614107609,1614107609),('Turks & Caicos Islands','zh_Hans','',1614107609,1614107609),('Tuvalu','cs','',1614107609,1614107609),('Tuvalu','de','',1614107609,1614107609),('Tuvalu','en','',1614107609,1614107609),('Tuvalu','es','',1614107609,1614107609),('Tuvalu','fa','',1614107609,1614107609),('Tuvalu','fr','',1614107609,1614107609),('Tuvalu','hu','',1614107609,1614107609),('Tuvalu','it','',1614107609,1614107609),('Tuvalu','ja','',1614107609,1614107609),('Tuvalu','nl','',1614107609,1614107609),('Tuvalu','pl','',1614107609,1614107609),('Tuvalu','pt_BR','',1614107609,1614107609),('Tuvalu','ru','',1614107609,1614107609),('Tuvalu','sk','',1614107609,1614107609),('Tuvalu','sv','',1614107609,1614107609),('Tuvalu','sv_FI','',1614107609,1614107609),('Tuvalu','th','',1614107609,1614107609),('Tuvalu','tr','',1614107609,1614107609),('Tuvalu','uk','',1614107609,1614107609),('Tuvalu','zh_Hans','',1614107609,1614107609),('U.S. Outlying Islands','cs','',1614107609,1614107609),('U.S. Outlying Islands','de','',1614107609,1614107609),('U.S. Outlying Islands','en','',1614107609,1614107609),('U.S. Outlying Islands','es','',1614107609,1614107609),('U.S. Outlying Islands','fa','',1614107609,1614107609),('U.S. Outlying Islands','fr','',1614107609,1614107609),('U.S. Outlying Islands','hu','',1614107609,1614107609),('U.S. Outlying Islands','it','',1614107609,1614107609),('U.S. Outlying Islands','ja','',1614107609,1614107609),('U.S. Outlying Islands','nl','',1614107609,1614107609),('U.S. Outlying Islands','pl','',1614107609,1614107609),('U.S. Outlying Islands','pt_BR','',1614107609,1614107609),('U.S. Outlying Islands','ru','',1614107609,1614107609),('U.S. Outlying Islands','sk','',1614107609,1614107609),('U.S. Outlying Islands','sv','',1614107609,1614107609),('U.S. Outlying Islands','sv_FI','',1614107609,1614107609),('U.S. Outlying Islands','th','',1614107609,1614107609),('U.S. Outlying Islands','tr','',1614107609,1614107609),('U.S. Outlying Islands','uk','',1614107609,1614107609),('U.S. Outlying Islands','zh_Hans','',1614107609,1614107609),('U.S. Virgin Islands','cs','',1614107609,1614107609),('U.S. Virgin Islands','de','',1614107609,1614107609),('U.S. Virgin Islands','en','',1614107609,1614107609),('U.S. Virgin Islands','es','',1614107609,1614107609),('U.S. Virgin Islands','fa','',1614107609,1614107609),('U.S. Virgin Islands','fr','',1614107609,1614107609),('U.S. Virgin Islands','hu','',1614107609,1614107609),('U.S. Virgin Islands','it','',1614107609,1614107609),('U.S. Virgin Islands','ja','',1614107609,1614107609),('U.S. Virgin Islands','nl','',1614107609,1614107609),('U.S. Virgin Islands','pl','',1614107609,1614107609),('U.S. Virgin Islands','pt_BR','',1614107609,1614107609),('U.S. Virgin Islands','ru','',1614107609,1614107609),('U.S. Virgin Islands','sk','',1614107609,1614107609),('U.S. Virgin Islands','sv','',1614107609,1614107609),('U.S. Virgin Islands','sv_FI','',1614107609,1614107609),('U.S. Virgin Islands','th','',1614107609,1614107609),('U.S. Virgin Islands','tr','',1614107609,1614107609),('U.S. Virgin Islands','uk','',1614107609,1614107609),('U.S. Virgin Islands','zh_Hans','',1614107609,1614107609),('Uganda','cs','',1614107610,1614107610),('Uganda','de','',1614107610,1614107610),('Uganda','en','',1614107610,1614107610),('Uganda','es','',1614107610,1614107610),('Uganda','fa','',1614107610,1614107610),('Uganda','fr','',1614107610,1614107610),('Uganda','hu','',1614107610,1614107610),('Uganda','it','',1614107610,1614107610),('Uganda','ja','',1614107610,1614107610),('Uganda','nl','',1614107610,1614107610),('Uganda','pl','',1614107610,1614107610),('Uganda','pt_BR','',1614107610,1614107610),('Uganda','ru','',1614107610,1614107610),('Uganda','sk','',1614107610,1614107610),('Uganda','sv','',1614107610,1614107610),('Uganda','sv_FI','',1614107610,1614107610),('Uganda','th','',1614107610,1614107610),('Uganda','tr','',1614107610,1614107610),('Uganda','uk','',1614107610,1614107610),('Uganda','zh_Hans','',1614107610,1614107610),('Ukraine','cs','',1614107610,1614107610),('Ukraine','de','',1614107610,1614107610),('Ukraine','en','',1614107610,1614107610),('Ukraine','es','',1614107610,1614107610),('Ukraine','fa','',1614107610,1614107610),('Ukraine','fr','',1614107610,1614107610),('Ukraine','hu','',1614107610,1614107610),('Ukraine','it','',1614107610,1614107610),('Ukraine','ja','',1614107610,1614107610),('Ukraine','nl','',1614107610,1614107610),('Ukraine','pl','',1614107610,1614107610),('Ukraine','pt_BR','',1614107610,1614107610),('Ukraine','ru','',1614107610,1614107610),('Ukraine','sk','',1614107610,1614107610),('Ukraine','sv','',1614107610,1614107610),('Ukraine','sv_FI','',1614107610,1614107610),('Ukraine','th','',1614107610,1614107610),('Ukraine','tr','',1614107610,1614107610),('Ukraine','uk','',1614107610,1614107610),('Ukraine','zh_Hans','',1614107610,1614107610),('United Arab Emirates','cs','',1614107610,1614107610),('United Arab Emirates','de','',1614107610,1614107610),('United Arab Emirates','en','',1614107610,1614107610),('United Arab Emirates','es','',1614107610,1614107610),('United Arab Emirates','fa','',1614107610,1614107610),('United Arab Emirates','fr','',1614107610,1614107610),('United Arab Emirates','hu','',1614107610,1614107610),('United Arab Emirates','it','',1614107610,1614107610),('United Arab Emirates','ja','',1614107610,1614107610),('United Arab Emirates','nl','',1614107610,1614107610),('United Arab Emirates','pl','',1614107610,1614107610),('United Arab Emirates','pt_BR','',1614107610,1614107610),('United Arab Emirates','ru','',1614107610,1614107610),('United Arab Emirates','sk','',1614107610,1614107610),('United Arab Emirates','sv','',1614107610,1614107610),('United Arab Emirates','sv_FI','',1614107610,1614107610),('United Arab Emirates','th','',1614107610,1614107610),('United Arab Emirates','tr','',1614107610,1614107610),('United Arab Emirates','uk','',1614107610,1614107610),('United Arab Emirates','zh_Hans','',1614107610,1614107610),('United Kingdom','cs','',1614107610,1614107610),('United Kingdom','de','',1614107610,1614107610),('United Kingdom','en','',1614107610,1614107610),('United Kingdom','es','',1614107610,1614107610),('United Kingdom','fa','',1614107610,1614107610),('United Kingdom','fr','',1614107610,1614107610),('United Kingdom','hu','',1614107610,1614107610),('United Kingdom','it','',1614107610,1614107610),('United Kingdom','ja','',1614107610,1614107610),('United Kingdom','nl','',1614107610,1614107610),('United Kingdom','pl','',1614107610,1614107610),('United Kingdom','pt_BR','',1614107610,1614107610),('United Kingdom','ru','',1614107610,1614107610),('United Kingdom','sk','',1614107610,1614107610),('United Kingdom','sv','',1614107610,1614107610),('United Kingdom','sv_FI','',1614107610,1614107610),('United Kingdom','th','',1614107610,1614107610),('United Kingdom','tr','',1614107610,1614107610),('United Kingdom','uk','',1614107610,1614107610),('United Kingdom','zh_Hans','',1614107610,1614107610),('United States','cs','',1614107611,1614107611),('United States','de','',1614107611,1614107611),('United States','en','',1614107611,1614107611),('United States','es','',1614107611,1614107611),('United States','fa','',1614107611,1614107611),('United States','fr','',1614107611,1614107611),('United States','hu','',1614107611,1614107611),('United States','it','',1614107611,1614107611),('United States','ja','',1614107611,1614107611),('United States','nl','',1614107611,1614107611),('United States','pl','',1614107611,1614107611),('United States','pt_BR','',1614107611,1614107611),('United States','ru','',1614107611,1614107611),('United States','sk','',1614107611,1614107611),('United States','sv','',1614107611,1614107611),('United States','sv_FI','',1614107611,1614107611),('United States','th','',1614107611,1614107611),('United States','tr','',1614107611,1614107611),('United States','uk','',1614107611,1614107611),('United States','zh_Hans','',1614107611,1614107611),('Uruguay','cs','',1614107611,1614107611),('Uruguay','de','',1614107611,1614107611),('Uruguay','en','',1614107611,1614107611),('Uruguay','es','',1614107611,1614107611),('Uruguay','fa','',1614107611,1614107611),('Uruguay','fr','',1614107611,1614107611),('Uruguay','hu','',1614107611,1614107611),('Uruguay','it','',1614107611,1614107611),('Uruguay','ja','',1614107611,1614107611),('Uruguay','nl','',1614107611,1614107611),('Uruguay','pl','',1614107611,1614107611),('Uruguay','pt_BR','',1614107611,1614107611),('Uruguay','ru','',1614107611,1614107611),('Uruguay','sk','',1614107611,1614107611),('Uruguay','sv','',1614107611,1614107611),('Uruguay','sv_FI','',1614107611,1614107611),('Uruguay','th','',1614107611,1614107611),('Uruguay','tr','',1614107611,1614107611),('Uruguay','uk','',1614107611,1614107611),('Uruguay','zh_Hans','',1614107611,1614107611),('Uzbekistan','cs','',1614107612,1614107612),('Uzbekistan','de','',1614107612,1614107612),('Uzbekistan','en','',1614107612,1614107612),('Uzbekistan','es','',1614107612,1614107612),('Uzbekistan','fa','',1614107612,1614107612),('Uzbekistan','fr','',1614107612,1614107612),('Uzbekistan','hu','',1614107612,1614107612),('Uzbekistan','it','',1614107612,1614107612),('Uzbekistan','ja','',1614107612,1614107612),('Uzbekistan','nl','',1614107612,1614107612),('Uzbekistan','pl','',1614107612,1614107612),('Uzbekistan','pt_BR','',1614107612,1614107612),('Uzbekistan','ru','',1614107612,1614107612),('Uzbekistan','sk','',1614107612,1614107612),('Uzbekistan','sv','',1614107612,1614107612),('Uzbekistan','sv_FI','',1614107612,1614107612),('Uzbekistan','th','',1614107612,1614107612),('Uzbekistan','tr','',1614107612,1614107612),('Uzbekistan','uk','',1614107612,1614107612),('Uzbekistan','zh_Hans','',1614107612,1614107612),('V Neck','cs','',1614107399,1614107399),('V Neck','de','',1614107399,1614107399),('V Neck','en','',1614107399,1614107399),('V Neck','es','',1614107399,1614107399),('V Neck','fa','',1614107399,1614107399),('V Neck','fr','',1614107399,1614107399),('V Neck','hu','',1614107399,1614107399),('V Neck','it','',1614107399,1614107399),('V Neck','ja','',1614107399,1614107399),('V Neck','nl','',1614107399,1614107399),('V Neck','pl','',1614107399,1614107399),('V Neck','pt_BR','',1614107399,1614107399),('V Neck','ru','',1614107399,1614107399),('V Neck','sk','',1614107399,1614107399),('V Neck','sv','',1614107399,1614107399),('V Neck','sv_FI','',1614107399,1614107399),('V Neck','th','',1614107399,1614107399),('V Neck','tr','',1614107399,1614107399),('V Neck','uk','',1614107399,1614107399),('V Neck','zh_Hans','',1614107399,1614107399),('Vanuatu','cs','',1614107612,1614107612),('Vanuatu','de','',1614107612,1614107612),('Vanuatu','en','',1614107612,1614107612),('Vanuatu','es','',1614107612,1614107612),('Vanuatu','fa','',1614107612,1614107612),('Vanuatu','fr','',1614107612,1614107612),('Vanuatu','hu','',1614107612,1614107612),('Vanuatu','it','',1614107612,1614107612),('Vanuatu','ja','',1614107612,1614107612),('Vanuatu','nl','',1614107612,1614107612),('Vanuatu','pl','',1614107612,1614107612),('Vanuatu','pt_BR','',1614107612,1614107612),('Vanuatu','ru','',1614107612,1614107612),('Vanuatu','sk','',1614107612,1614107612),('Vanuatu','sv','',1614107612,1614107612),('Vanuatu','sv_FI','',1614107612,1614107612),('Vanuatu','th','',1614107612,1614107612),('Vanuatu','tr','',1614107612,1614107612),('Vanuatu','uk','',1614107612,1614107612),('Vanuatu','zh_Hans','',1614107612,1614107612),('Vatican City','cs','',1614107613,1614107613),('Vatican City','de','',1614107613,1614107613),('Vatican City','en','',1614107613,1614107613),('Vatican City','es','',1614107613,1614107613),('Vatican City','fa','',1614107613,1614107613),('Vatican City','fr','',1614107613,1614107613),('Vatican City','hu','',1614107613,1614107613),('Vatican City','it','',1614107613,1614107613),('Vatican City','ja','',1614107613,1614107613),('Vatican City','nl','',1614107613,1614107613),('Vatican City','pl','',1614107613,1614107613),('Vatican City','pt_BR','',1614107613,1614107613),('Vatican City','ru','',1614107613,1614107613),('Vatican City','sk','',1614107613,1614107613),('Vatican City','sv','',1614107613,1614107613),('Vatican City','sv_FI','',1614107613,1614107613),('Vatican City','th','',1614107613,1614107613),('Vatican City','tr','',1614107613,1614107613),('Vatican City','uk','',1614107613,1614107613),('Vatican City','zh_Hans','',1614107613,1614107613),('Venezuela','cs','',1614107613,1614107613),('Venezuela','de','',1614107613,1614107613),('Venezuela','en','',1614107613,1614107613),('Venezuela','es','',1614107613,1614107613),('Venezuela','fa','',1614107613,1614107613),('Venezuela','fr','',1614107613,1614107613),('Venezuela','hu','',1614107613,1614107613),('Venezuela','it','',1614107613,1614107613),('Venezuela','ja','',1614107613,1614107613),('Venezuela','nl','',1614107613,1614107613),('Venezuela','pl','',1614107613,1614107613),('Venezuela','pt_BR','',1614107613,1614107613),('Venezuela','ru','',1614107613,1614107613),('Venezuela','sk','',1614107613,1614107613),('Venezuela','sv','',1614107613,1614107613),('Venezuela','sv_FI','',1614107613,1614107613),('Venezuela','th','',1614107613,1614107613),('Venezuela','tr','',1614107613,1614107613),('Venezuela','uk','',1614107613,1614107613),('Venezuela','zh_Hans','',1614107613,1614107613),('Vietnam','cs','',1614107613,1614107613),('Vietnam','de','',1614107613,1614107613),('Vietnam','en','',1614107613,1614107613),('Vietnam','es','',1614107613,1614107613),('Vietnam','fa','',1614107613,1614107613),('Vietnam','fr','',1614107613,1614107613),('Vietnam','hu','',1614107613,1614107613),('Vietnam','it','',1614107613,1614107613),('Vietnam','ja','',1614107613,1614107613),('Vietnam','nl','',1614107613,1614107613),('Vietnam','pl','',1614107613,1614107613),('Vietnam','pt_BR','',1614107613,1614107613),('Vietnam','ru','',1614107613,1614107613),('Vietnam','sk','',1614107613,1614107613),('Vietnam','sv','',1614107613,1614107613),('Vietnam','sv_FI','',1614107613,1614107613),('Vietnam','th','',1614107613,1614107613),('Vietnam','tr','',1614107613,1614107613),('Vietnam','uk','',1614107613,1614107613),('Vietnam','zh_Hans','',1614107613,1614107613),('Wallis & Futuna','cs','',1614107614,1614107614),('Wallis & Futuna','de','',1614107614,1614107614),('Wallis & Futuna','en','',1614107614,1614107614),('Wallis & Futuna','es','',1614107614,1614107614),('Wallis & Futuna','fa','',1614107614,1614107614),('Wallis & Futuna','fr','',1614107614,1614107614),('Wallis & Futuna','hu','',1614107614,1614107614),('Wallis & Futuna','it','',1614107614,1614107614),('Wallis & Futuna','ja','',1614107614,1614107614),('Wallis & Futuna','nl','',1614107614,1614107614),('Wallis & Futuna','pl','',1614107614,1614107614),('Wallis & Futuna','pt_BR','',1614107614,1614107614),('Wallis & Futuna','ru','',1614107614,1614107614),('Wallis & Futuna','sk','',1614107614,1614107614),('Wallis & Futuna','sv','',1614107614,1614107614),('Wallis & Futuna','sv_FI','',1614107614,1614107614),('Wallis & Futuna','th','',1614107614,1614107614),('Wallis & Futuna','tr','',1614107614,1614107614),('Wallis & Futuna','uk','',1614107614,1614107614),('Wallis & Futuna','zh_Hans','',1614107614,1614107614),('Washable','cs','',1614088788,1614088788),('Washable','de','',1614088788,1614088788),('Washable','en','',1614088788,1614088788),('Washable','es','',1614088788,1614088788),('Washable','fa','',1614088788,1614088788),('Washable','fr','',1614088788,1614088788),('Washable','hu','',1614088788,1614088788),('Washable','it','',1614088788,1614088788),('Washable','ja','',1614088788,1614088788),('Washable','nl','',1614088788,1614088788),('Washable','pl','',1614088788,1614088788),('Washable','pt_BR','',1614088788,1614088788),('Washable','ru','',1614088788,1614088788),('Washable','sk','',1614088788,1614088788),('Washable','sv','',1614088788,1614088788),('Washable','sv_FI','',1614088788,1614088788),('Washable','th','',1614088788,1614088788),('Washable','tr','',1614088788,1614088788),('Washable','uk','',1614088788,1614088788),('Washable','zh_Hans','',1614088788,1614088788),('Western Sahara','cs','',1614107614,1614107614),('Western Sahara','de','',1614107614,1614107614),('Western Sahara','en','',1614107614,1614107614),('Western Sahara','es','',1614107614,1614107614),('Western Sahara','fa','',1614107614,1614107614),('Western Sahara','fr','',1614107614,1614107614),('Western Sahara','hu','',1614107614,1614107614),('Western Sahara','it','',1614107614,1614107614),('Western Sahara','ja','',1614107614,1614107614),('Western Sahara','nl','',1614107614,1614107614),('Western Sahara','pl','',1614107614,1614107614),('Western Sahara','pt_BR','',1614107614,1614107614),('Western Sahara','ru','',1614107614,1614107614),('Western Sahara','sk','',1614107614,1614107614),('Western Sahara','sv','',1614107614,1614107614),('Western Sahara','sv_FI','',1614107614,1614107614),('Western Sahara','th','',1614107614,1614107614),('Western Sahara','tr','',1614107614,1614107614),('Western Sahara','uk','',1614107614,1614107614),('Western Sahara','zh_Hans','',1614107614,1614107614),('Yemen','cs','',1614107614,1614107614),('Yemen','de','',1614107614,1614107614),('Yemen','en','',1614107614,1614107614),('Yemen','es','',1614107614,1614107614),('Yemen','fa','',1614107614,1614107614),('Yemen','fr','',1614107614,1614107614),('Yemen','hu','',1614107614,1614107614),('Yemen','it','',1614107614,1614107614),('Yemen','ja','',1614107614,1614107614),('Yemen','nl','',1614107614,1614107614),('Yemen','pl','',1614107614,1614107614),('Yemen','pt_BR','',1614107614,1614107614),('Yemen','ru','',1614107614,1614107614),('Yemen','sk','',1614107614,1614107614),('Yemen','sv','',1614107614,1614107614),('Yemen','sv_FI','',1614107614,1614107614),('Yemen','th','',1614107614,1614107614),('Yemen','tr','',1614107614,1614107614),('Yemen','uk','',1614107614,1614107614),('Yemen','zh_Hans','',1614107614,1614107614),('Zambia','cs','',1614107614,1614107614),('Zambia','de','',1614107614,1614107614),('Zambia','en','',1614107614,1614107614),('Zambia','es','',1614107614,1614107614),('Zambia','fa','',1614107614,1614107614),('Zambia','fr','',1614107614,1614107614),('Zambia','hu','',1614107614,1614107614),('Zambia','it','',1614107614,1614107614),('Zambia','ja','',1614107614,1614107614),('Zambia','nl','',1614107614,1614107614),('Zambia','pl','',1614107614,1614107614),('Zambia','pt_BR','',1614107614,1614107614),('Zambia','ru','',1614107614,1614107614),('Zambia','sk','',1614107614,1614107614),('Zambia','sv','',1614107614,1614107614),('Zambia','sv_FI','',1614107614,1614107614),('Zambia','th','',1614107614,1614107614),('Zambia','tr','',1614107614,1614107614),('Zambia','uk','',1614107614,1614107614),('Zambia','zh_Hans','',1614107614,1614107614),('Zimbabwe','cs','',1614107614,1614107614),('Zimbabwe','de','',1614107614,1614107614),('Zimbabwe','en','',1614107614,1614107614),('Zimbabwe','es','',1614107614,1614107614),('Zimbabwe','fa','',1614107614,1614107614),('Zimbabwe','fr','',1614107614,1614107614),('Zimbabwe','hu','',1614107614,1614107614),('Zimbabwe','it','',1614107614,1614107614),('Zimbabwe','ja','',1614107614,1614107614),('Zimbabwe','nl','',1614107614,1614107614),('Zimbabwe','pl','',1614107614,1614107614),('Zimbabwe','pt_BR','',1614107614,1614107614),('Zimbabwe','ru','',1614107614,1614107614),('Zimbabwe','sk','',1614107614,1614107614),('Zimbabwe','sv','',1614107614,1614107614),('Zimbabwe','sv_FI','',1614107614,1614107614),('Zimbabwe','th','',1614107614,1614107614),('Zimbabwe','tr','',1614107614,1614107614),('Zimbabwe','uk','',1614107614,1614107614),('Zimbabwe','zh_Hans','',1614107614,1614107614),('bottom','cs','',1614098741,1614098741),('bottom','de','',1614098741,1614098741),('bottom','en','',1614098741,1614098741),('bottom','es','',1614098741,1614098741),('bottom','fa','',1614098741,1614098741),('bottom','fr','',1614098741,1614098741),('bottom','hu','',1614098741,1614098741),('bottom','it','',1614098741,1614098741),('bottom','ja','',1614098741,1614098741),('bottom','nl','',1614098741,1614098741),('bottom','pl','',1614098741,1614098741),('bottom','pt_BR','',1614098741,1614098741),('bottom','ru','',1614098741,1614098741),('bottom','sk','',1614098741,1614098741),('bottom','sv','',1614098741,1614098741),('bottom','sv_FI','',1614098741,1614098741),('bottom','th','',1614098741,1614098741),('bottom','tr','',1614098741,1614098741),('bottom','uk','',1614098741,1614098741),('bottom','zh_Hans','',1614098741,1614098741),('brand','cs','',1614075137,1614075137),('brand','de','',1614075137,1614075137),('brand','en','',1614075137,1614075137),('brand','es','',1614075137,1614075137),('brand','fa','',1614075137,1614075137),('brand','fr','',1614075137,1614075137),('brand','hu','',1614075137,1614075137),('brand','it','',1614075137,1614075137),('brand','ja','',1614075137,1614075137),('brand','nl','',1614075137,1614075137),('brand','pl','',1614075137,1614075137),('brand','pt_BR','',1614075137,1614075137),('brand','ru','',1614075137,1614075137),('brand','sk','',1614075137,1614075137),('brand','sv','',1614075137,1614075137),('brand','sv_FI','',1614075137,1614075137),('brand','th','',1614075137,1614075137),('brand','tr','',1614075137,1614075137),('brand','uk','',1614075137,1614075137),('brand','zh_Hans','',1614075137,1614075137),('category','cs','',1614074994,1614074994),('category','de','',1614074994,1614074994),('category','en','',1614074994,1614074994),('category','es','',1614074994,1614074994),('category','fa','',1614074994,1614074994),('category','fr','',1614074994,1614074994),('category','hu','',1614074994,1614074994),('category','it','',1614074994,1614074994),('category','ja','',1614074994,1614074994),('category','nl','',1614074994,1614074994),('category','pl','',1614074994,1614074994),('category','pt_BR','',1614074994,1614074994),('category','ru','',1614074994,1614074994),('category','sk','',1614074994,1614074994),('category','sv','',1614074994,1614074994),('category','sv_FI','',1614074994,1614074994),('category','th','',1614074994,1614074994),('category','tr','',1614074994,1614074994),('category','uk','',1614074994,1614074994),('category','zh_Hans','',1614074994,1614074994),('default_value_warning','cs','',1614099161,1614099161),('default_value_warning','de','',1614099161,1614099161),('default_value_warning','en','',1614099161,1614099161),('default_value_warning','es','',1614099161,1614099161),('default_value_warning','fa','',1614099161,1614099161),('default_value_warning','fr','',1614099161,1614099161),('default_value_warning','hu','',1614099161,1614099161),('default_value_warning','it','',1614099161,1614099161),('default_value_warning','ja','',1614099161,1614099161),('default_value_warning','nl','',1614099161,1614099161),('default_value_warning','pl','',1614099161,1614099161),('default_value_warning','pt_BR','',1614099161,1614099161),('default_value_warning','ru','',1614099161,1614099161),('default_value_warning','sk','',1614099161,1614099161),('default_value_warning','sv','',1614099161,1614099161),('default_value_warning','sv_FI','',1614099161,1614099161),('default_value_warning','th','',1614099161,1614099161),('default_value_warning','tr','',1614099161,1614099161),('default_value_warning','uk','',1614099161,1614099161),('default_value_warning','zh_Hans','',1614099161,1614099161),('down','cs','',1614088609,1614088609),('down','de','',1614088609,1614088609),('down','en','',1614088609,1614088609),('down','es','',1614088609,1614088609),('down','fa','',1614088609,1614088609),('down','fr','',1614088609,1614088609),('down','hu','',1614088609,1614088609),('down','it','',1614088609,1614088609),('down','ja','',1614088609,1614088609),('down','nl','',1614088609,1614088609),('down','pl','',1614088609,1614088609),('down','pt_BR','',1614088609,1614088609),('down','ru','',1614088609,1614088609),('down','sk','',1614088609,1614088609),('down','sv','',1614088609,1614088609),('down','sv_FI','',1614088609,1614088609),('down','th','',1614088609,1614088609),('down','tr','',1614088609,1614088609),('down','uk','',1614088609,1614088609),('down','zh_Hans','',1614088609,1614088609),('fabric','cs','',1614088522,1614088522),('fabric','de','',1614088522,1614088522),('fabric','en','',1614088522,1614088522),('fabric','es','',1614088522,1614088522),('fabric','fa','',1614088522,1614088522),('fabric','fr','',1614088522,1614088522),('fabric','hu','',1614088522,1614088522),('fabric','it','',1614088522,1614088522),('fabric','ja','',1614088522,1614088522),('fabric','nl','',1614088522,1614088522),('fabric','pl','',1614088522,1614088522),('fabric','pt_BR','',1614088522,1614088522),('fabric','ru','',1614088522,1614088522),('fabric','sk','',1614088522,1614088522),('fabric','sv','',1614088522,1614088522),('fabric','sv_FI','',1614088522,1614088522),('fabric','th','',1614088522,1614088522),('fabric','tr','',1614088522,1614088522),('fabric','uk','',1614088522,1614088522),('fabric','zh_Hans','',1614088522,1614088522),('false','cs','',1614099161,1614099161),('false','de','',1614099161,1614099161),('false','en','',1614099161,1614099161),('false','es','',1614099161,1614099161),('false','fa','',1614099161,1614099161),('false','fr','',1614099161,1614099161),('false','hu','',1614099161,1614099161),('false','it','',1614099161,1614099161),('false','ja','',1614099161,1614099161),('false','nl','',1614099161,1614099161),('false','pl','',1614099161,1614099161),('false','pt_BR','',1614099161,1614099161),('false','ru','',1614099161,1614099161),('false','sk','',1614099161,1614099161),('false','sv','',1614099161,1614099161),('false','sv_FI','',1614099161,1614099161),('false','th','',1614099161,1614099161),('false','tr','',1614099161,1614099161),('false','uk','',1614099161,1614099161),('false','zh_Hans','',1614099161,1614099161),('jeans','cs','',1614107520,1614107520),('jeans','de','',1614107520,1614107520),('jeans','en','',1614107520,1614107520),('jeans','es','',1614107520,1614107520),('jeans','fa','',1614107520,1614107520),('jeans','fr','',1614107520,1614107520),('jeans','hu','',1614107520,1614107520),('jeans','it','',1614107520,1614107520),('jeans','ja','',1614107520,1614107520),('jeans','nl','',1614107520,1614107520),('jeans','pl','',1614107520,1614107520),('jeans','pt_BR','',1614107520,1614107520),('jeans','ru','',1614107520,1614107520),('jeans','sk','',1614107520,1614107520),('jeans','sv','',1614107520,1614107520),('jeans','sv_FI','',1614107520,1614107520),('jeans','th','',1614107520,1614107520),('jeans','tr','',1614107520,1614107520),('jeans','uk','',1614107520,1614107520),('jeans','zh_Hans','',1614107520,1614107520),('month','cs','',1614099269,1614099269),('month','de','',1614099269,1614099269),('month','en','',1614099269,1614099269),('month','es','',1614099269,1614099269),('month','fa','',1614099269,1614099269),('month','fr','',1614099269,1614099269),('month','hu','',1614099269,1614099269),('month','it','',1614099269,1614099269),('month','ja','',1614099269,1614099269),('month','nl','',1614099269,1614099269),('month','pl','',1614099269,1614099269),('month','pt_BR','',1614099269,1614099269),('month','ru','',1614099269,1614099269),('month','sk','',1614099269,1614099269),('month','sv','',1614099269,1614099269),('month','sv_FI','',1614099269,1614099269),('month','th','',1614099269,1614099269),('month','tr','',1614099269,1614099269),('month','uk','',1614099269,1614099269),('month','zh_Hans','',1614099269,1614099269),('neck','cs','',1614107399,1614107399),('neck','de','',1614107399,1614107399),('neck','en','',1614107399,1614107399),('neck','es','',1614107399,1614107399),('neck','fa','',1614107399,1614107399),('neck','fr','',1614107399,1614107399),('neck','hu','',1614107399,1614107399),('neck','it','',1614107399,1614107399),('neck','ja','',1614107399,1614107399),('neck','nl','',1614107399,1614107399),('neck','pl','',1614107399,1614107399),('neck','pt_BR','',1614107399,1614107399),('neck','ru','',1614107399,1614107399),('neck','sk','',1614107399,1614107399),('neck','sv','',1614107399,1614107399),('neck','sv_FI','',1614107399,1614107399),('neck','th','',1614107399,1614107399),('neck','tr','',1614107399,1614107399),('neck','uk','',1614107399,1614107399),('neck','zh_Hans','',1614107399,1614107399),('null','cs','',1614099161,1614099161),('null','de','',1614099161,1614099161),('null','en','',1614099161,1614099161),('null','es','',1614099161,1614099161),('null','fa','',1614099161,1614099161),('null','fr','',1614099161,1614099161),('null','hu','',1614099161,1614099161),('null','it','',1614099161,1614099161),('null','ja','',1614099161,1614099161),('null','nl','',1614099161,1614099161),('null','pl','',1614099161,1614099161),('null','pt_BR','',1614099161,1614099161),('null','ru','',1614099161,1614099161),('null','sk','',1614099161,1614099161),('null','sv','',1614099161,1614099161),('null','sv_FI','',1614099161,1614099161),('null','th','',1614099161,1614099161),('null','tr','',1614099161,1614099161),('null','uk','',1614099161,1614099161),('null','zh_Hans','',1614099161,1614099161),('object_add_dialog_custom_text.brand','cs','',1614075466,1614075466),('object_add_dialog_custom_text.brand','de','',1614075466,1614075466),('object_add_dialog_custom_text.brand','en','',1614075466,1614075466),('object_add_dialog_custom_text.brand','es','',1614075466,1614075466),('object_add_dialog_custom_text.brand','fa','',1614075466,1614075466),('object_add_dialog_custom_text.brand','fr','',1614075466,1614075466),('object_add_dialog_custom_text.brand','hu','',1614075466,1614075466),('object_add_dialog_custom_text.brand','it','',1614075466,1614075466),('object_add_dialog_custom_text.brand','ja','',1614075466,1614075466),('object_add_dialog_custom_text.brand','nl','',1614075466,1614075466),('object_add_dialog_custom_text.brand','pl','',1614075466,1614075466),('object_add_dialog_custom_text.brand','pt_BR','',1614075466,1614075466),('object_add_dialog_custom_text.brand','ru','',1614075466,1614075466),('object_add_dialog_custom_text.brand','sk','',1614075466,1614075466),('object_add_dialog_custom_text.brand','sv','',1614075466,1614075466),('object_add_dialog_custom_text.brand','sv_FI','',1614075466,1614075466),('object_add_dialog_custom_text.brand','th','',1614075466,1614075466),('object_add_dialog_custom_text.brand','tr','',1614075466,1614075466),('object_add_dialog_custom_text.brand','uk','',1614075466,1614075466),('object_add_dialog_custom_text.brand','zh_Hans','',1614075466,1614075466),('object_add_dialog_custom_text.category','cs','',1614075376,1614075376),('object_add_dialog_custom_text.category','de','',1614075376,1614075376),('object_add_dialog_custom_text.category','en','',1614075376,1614075376),('object_add_dialog_custom_text.category','es','',1614075376,1614075376),('object_add_dialog_custom_text.category','fa','',1614075376,1614075376),('object_add_dialog_custom_text.category','fr','',1614075376,1614075376),('object_add_dialog_custom_text.category','hu','',1614075376,1614075376),('object_add_dialog_custom_text.category','it','',1614075376,1614075376),('object_add_dialog_custom_text.category','ja','',1614075376,1614075376),('object_add_dialog_custom_text.category','nl','',1614075376,1614075376),('object_add_dialog_custom_text.category','pl','',1614075376,1614075376),('object_add_dialog_custom_text.category','pt_BR','',1614075376,1614075376),('object_add_dialog_custom_text.category','ru','',1614075376,1614075376),('object_add_dialog_custom_text.category','sk','',1614075376,1614075376),('object_add_dialog_custom_text.category','sv','',1614075376,1614075376),('object_add_dialog_custom_text.category','sv_FI','',1614075376,1614075376),('object_add_dialog_custom_text.category','th','',1614075376,1614075376),('object_add_dialog_custom_text.category','tr','',1614075376,1614075376),('object_add_dialog_custom_text.category','uk','',1614075376,1614075376),('object_add_dialog_custom_text.category','zh_Hans','',1614075376,1614075376),('object_add_dialog_custom_text.fabric','cs','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','de','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','en','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','es','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','fa','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','fr','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','hu','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','it','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','ja','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','nl','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','pl','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','pt_BR','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','ru','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','sk','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','sv','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','sv_FI','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','th','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','tr','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','uk','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','zh_Hans','',1614088759,1614088759),('object_add_dialog_custom_text.product','cs','',1614106883,1614106883),('object_add_dialog_custom_text.product','de','',1614106883,1614106883),('object_add_dialog_custom_text.product','en','',1614106883,1614106883),('object_add_dialog_custom_text.product','es','',1614106883,1614106883),('object_add_dialog_custom_text.product','fa','',1614106883,1614106883),('object_add_dialog_custom_text.product','fr','',1614106883,1614106883),('object_add_dialog_custom_text.product','hu','',1614106883,1614106883),('object_add_dialog_custom_text.product','it','',1614106883,1614106883),('object_add_dialog_custom_text.product','ja','',1614106883,1614106883),('object_add_dialog_custom_text.product','nl','',1614106883,1614106883),('object_add_dialog_custom_text.product','pl','',1614106883,1614106883),('object_add_dialog_custom_text.product','pt_BR','',1614106883,1614106883),('object_add_dialog_custom_text.product','ru','',1614106883,1614106883),('object_add_dialog_custom_text.product','sk','',1614106883,1614106883),('object_add_dialog_custom_text.product','sv','',1614106883,1614106883),('object_add_dialog_custom_text.product','sv_FI','',1614106883,1614106883),('object_add_dialog_custom_text.product','th','',1614106883,1614106883),('object_add_dialog_custom_text.product','tr','',1614106883,1614106883),('object_add_dialog_custom_text.product','uk','',1614106883,1614106883),('object_add_dialog_custom_text.product','zh_Hans','',1614106883,1614106883),('object_add_dialog_custom_title.brand','cs','',1614075466,1614075466),('object_add_dialog_custom_title.brand','de','',1614075466,1614075466),('object_add_dialog_custom_title.brand','en','',1614075466,1614075466),('object_add_dialog_custom_title.brand','es','',1614075466,1614075466),('object_add_dialog_custom_title.brand','fa','',1614075466,1614075466),('object_add_dialog_custom_title.brand','fr','',1614075466,1614075466),('object_add_dialog_custom_title.brand','hu','',1614075466,1614075466),('object_add_dialog_custom_title.brand','it','',1614075466,1614075466),('object_add_dialog_custom_title.brand','ja','',1614075466,1614075466),('object_add_dialog_custom_title.brand','nl','',1614075466,1614075466),('object_add_dialog_custom_title.brand','pl','',1614075466,1614075466),('object_add_dialog_custom_title.brand','pt_BR','',1614075466,1614075466),('object_add_dialog_custom_title.brand','ru','',1614075466,1614075466),('object_add_dialog_custom_title.brand','sk','',1614075466,1614075466),('object_add_dialog_custom_title.brand','sv','',1614075466,1614075466),('object_add_dialog_custom_title.brand','sv_FI','',1614075466,1614075466),('object_add_dialog_custom_title.brand','th','',1614075466,1614075466),('object_add_dialog_custom_title.brand','tr','',1614075466,1614075466),('object_add_dialog_custom_title.brand','uk','',1614075466,1614075466),('object_add_dialog_custom_title.brand','zh_Hans','',1614075466,1614075466),('object_add_dialog_custom_title.category','cs','',1614075376,1614075376),('object_add_dialog_custom_title.category','de','',1614075376,1614075376),('object_add_dialog_custom_title.category','en','',1614075376,1614075376),('object_add_dialog_custom_title.category','es','',1614075376,1614075376),('object_add_dialog_custom_title.category','fa','',1614075376,1614075376),('object_add_dialog_custom_title.category','fr','',1614075376,1614075376),('object_add_dialog_custom_title.category','hu','',1614075376,1614075376),('object_add_dialog_custom_title.category','it','',1614075376,1614075376),('object_add_dialog_custom_title.category','ja','',1614075376,1614075376),('object_add_dialog_custom_title.category','nl','',1614075376,1614075376),('object_add_dialog_custom_title.category','pl','',1614075376,1614075376),('object_add_dialog_custom_title.category','pt_BR','',1614075376,1614075376),('object_add_dialog_custom_title.category','ru','',1614075376,1614075376),('object_add_dialog_custom_title.category','sk','',1614075376,1614075376),('object_add_dialog_custom_title.category','sv','',1614075376,1614075376),('object_add_dialog_custom_title.category','sv_FI','',1614075376,1614075376),('object_add_dialog_custom_title.category','th','',1614075376,1614075376),('object_add_dialog_custom_title.category','tr','',1614075376,1614075376),('object_add_dialog_custom_title.category','uk','',1614075376,1614075376),('object_add_dialog_custom_title.category','zh_Hans','',1614075376,1614075376),('object_add_dialog_custom_title.fabric','cs','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','de','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','en','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','es','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','fa','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','fr','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','hu','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','it','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','ja','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','nl','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','pl','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','pt_BR','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','ru','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','sk','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','sv','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','sv_FI','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','th','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','tr','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','uk','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','zh_Hans','',1614088759,1614088759),('object_add_dialog_custom_title.product','cs','',1614106883,1614106883),('object_add_dialog_custom_title.product','de','',1614106883,1614106883),('object_add_dialog_custom_title.product','en','',1614106883,1614106883),('object_add_dialog_custom_title.product','es','',1614106883,1614106883),('object_add_dialog_custom_title.product','fa','',1614106883,1614106883),('object_add_dialog_custom_title.product','fr','',1614106883,1614106883),('object_add_dialog_custom_title.product','hu','',1614106883,1614106883),('object_add_dialog_custom_title.product','it','',1614106883,1614106883),('object_add_dialog_custom_title.product','ja','',1614106883,1614106883),('object_add_dialog_custom_title.product','nl','',1614106883,1614106883),('object_add_dialog_custom_title.product','pl','',1614106883,1614106883),('object_add_dialog_custom_title.product','pt_BR','',1614106883,1614106883),('object_add_dialog_custom_title.product','ru','',1614106883,1614106883),('object_add_dialog_custom_title.product','sk','',1614106883,1614106883),('object_add_dialog_custom_title.product','sv','',1614106883,1614106883),('object_add_dialog_custom_title.product','sv_FI','',1614106883,1614106883),('object_add_dialog_custom_title.product','th','',1614106883,1614106883),('object_add_dialog_custom_title.product','tr','',1614106883,1614106883),('object_add_dialog_custom_title.product','uk','',1614106883,1614106883),('object_add_dialog_custom_title.product','zh_Hans','',1614106883,1614106883),('product','cs','',1614098725,1614098725),('product','de','',1614098725,1614098725),('product','en','',1614098725,1614098725),('product','es','',1614098725,1614098725),('product','fa','',1614098725,1614098725),('product','fr','',1614098725,1614098725),('product','hu','',1614098725,1614098725),('product','it','',1614098725,1614098725),('product','ja','',1614098725,1614098725),('product','nl','',1614098725,1614098725),('product','pl','',1614098725,1614098725),('product','pt_BR','',1614098725,1614098725),('product','ru','',1614098725,1614098725),('product','sk','',1614098725,1614098725),('product','sv','',1614098725,1614098725),('product','sv_FI','',1614098725,1614098725),('product','th','',1614098725,1614098725),('product','tr','',1614098725,1614098725),('product','uk','',1614098725,1614098725),('product','zh_Hans','',1614098725,1614098725),('shirt','cs','',1614107520,1614107520),('shirt','de','',1614107520,1614107520),('shirt','en','',1614107520,1614107520),('shirt','es','',1614107520,1614107520),('shirt','fa','',1614107520,1614107520),('shirt','fr','',1614107520,1614107520),('shirt','hu','',1614107520,1614107520),('shirt','it','',1614107520,1614107520),('shirt','ja','',1614107520,1614107520),('shirt','nl','',1614107520,1614107520),('shirt','pl','',1614107520,1614107520),('shirt','pt_BR','',1614107520,1614107520),('shirt','ru','',1614107520,1614107520),('shirt','sk','',1614107520,1614107520),('shirt','sv','',1614107520,1614107520),('shirt','sv_FI','',1614107520,1614107520),('shirt','th','',1614107520,1614107520),('shirt','tr','',1614107520,1614107520),('shirt','uk','',1614107520,1614107520),('shirt','zh_Hans','',1614107520,1614107520),('sleeves','cs','',1614107399,1614107399),('sleeves','de','',1614107399,1614107399),('sleeves','en','',1614107399,1614107399),('sleeves','es','',1614107399,1614107399),('sleeves','fa','',1614107399,1614107399),('sleeves','fr','',1614107399,1614107399),('sleeves','hu','',1614107399,1614107399),('sleeves','it','',1614107399,1614107399),('sleeves','ja','',1614107399,1614107399),('sleeves','nl','',1614107399,1614107399),('sleeves','pl','',1614107399,1614107399),('sleeves','pt_BR','',1614107399,1614107399),('sleeves','ru','',1614107399,1614107399),('sleeves','sk','',1614107399,1614107399),('sleeves','sv','',1614107399,1614107399),('sleeves','sv_FI','',1614107399,1614107399),('sleeves','th','',1614107399,1614107399),('sleeves','tr','',1614107399,1614107399),('sleeves','uk','',1614107399,1614107399),('sleeves','zh_Hans','',1614107399,1614107399),('suite','cs','',1614106914,1614106914),('suite','de','',1614106914,1614106914),('suite','en','',1614106914,1614106914),('suite','es','',1614106914,1614106914),('suite','fa','',1614106914,1614106914),('suite','fr','',1614106914,1614106914),('suite','hu','',1614106914,1614106914),('suite','it','',1614106914,1614106914),('suite','ja','',1614106914,1614106914),('suite','nl','',1614106914,1614106914),('suite','pl','',1614106914,1614106914),('suite','pt_BR','',1614106914,1614106914),('suite','ru','',1614106914,1614106914),('suite','sk','',1614106914,1614106914),('suite','sv','',1614106914,1614106914),('suite','sv_FI','',1614106914,1614106914),('suite','th','',1614106914,1614106914),('suite','tr','',1614106914,1614106914),('suite','uk','',1614106914,1614106914),('suite','zh_Hans','',1614106914,1614106914),('top','cs','',1614098741,1614098741),('top','de','',1614098741,1614098741),('top','en','',1614098741,1614098741),('top','es','',1614098741,1614098741),('top','fa','',1614098741,1614098741),('top','fr','',1614098741,1614098741),('top','hu','',1614098741,1614098741),('top','it','',1614098741,1614098741),('top','ja','',1614098741,1614098741),('top','nl','',1614098741,1614098741),('top','pl','',1614098741,1614098741),('top','pt_BR','',1614098741,1614098741),('top','ru','',1614098741,1614098741),('top','sk','',1614098741,1614098741),('top','sv','',1614098741,1614098741),('top','sv_FI','',1614098741,1614098741),('top','th','',1614098741,1614098741),('top','tr','',1614098741,1614098741),('top','uk','',1614098741,1614098741),('top','zh_Hans','',1614098741,1614098741),('true','cs','',1614099161,1614099161),('true','de','',1614099161,1614099161),('true','en','',1614099161,1614099161),('true','es','',1614099161,1614099161),('true','fa','',1614099161,1614099161),('true','fr','',1614099161,1614099161),('true','hu','',1614099161,1614099161),('true','it','',1614099161,1614099161),('true','ja','',1614099161,1614099161),('true','nl','',1614099161,1614099161),('true','pl','',1614099161,1614099161),('true','pt_BR','',1614099161,1614099161),('true','ru','',1614099161,1614099161),('true','sk','',1614099161,1614099161),('true','sv','',1614099161,1614099161),('true','sv_FI','',1614099161,1614099161),('true','th','',1614099161,1614099161),('true','tr','',1614099161,1614099161),('true','uk','',1614099161,1614099161),('true','zh_Hans','',1614099161,1614099161),('types','cs','',1614107400,1614107400),('types','de','',1614107400,1614107400),('types','en','',1614107400,1614107400),('types','es','',1614107400,1614107400),('types','fa','',1614107400,1614107400),('types','fr','',1614107400,1614107400),('types','hu','',1614107400,1614107400),('types','it','',1614107400,1614107400),('types','ja','',1614107400,1614107400),('types','nl','',1614107400,1614107400),('types','pl','',1614107400,1614107400),('types','pt_BR','',1614107400,1614107400),('types','ru','',1614107400,1614107400),('types','sk','',1614107400,1614107400),('types','sv','',1614107400,1614107400),('types','sv_FI','',1614107400,1614107400),('types','th','',1614107400,1614107400),('types','tr','',1614107400,1614107400),('types','uk','',1614107400,1614107400),('types','zh_Hans','',1614107400,1614107400),('up','cs','',1614088609,1614088609),('up','de','',1614088609,1614088609),('up','en','',1614088609,1614088609),('up','es','',1614088609,1614088609),('up','fa','',1614088609,1614088609),('up','fr','',1614088609,1614088609),('up','hu','',1614088609,1614088609),('up','it','',1614088609,1614088609),('up','ja','',1614088609,1614088609),('up','nl','',1614088609,1614088609),('up','pl','',1614088609,1614088609),('up','pt_BR','',1614088609,1614088609),('up','ru','',1614088609,1614088609),('up','sk','',1614088609,1614088609),('up','sv','',1614088609,1614088609),('up','sv_FI','',1614088609,1614088609),('up','th','',1614088609,1614088609),('up','tr','',1614088609,1614088609),('up','uk','',1614088609,1614088609),('up','zh_Hans','',1614088609,1614088609),('warranty','cs','',1614107616,1614107616),('warranty','de','',1614107616,1614107616),('warranty','en','',1614107616,1614107616),('warranty','es','',1614107616,1614107616),('warranty','fa','',1614107616,1614107616),('warranty','fr','',1614107616,1614107616),('warranty','hu','',1614107616,1614107616),('warranty','it','',1614107616,1614107616),('warranty','ja','',1614107616,1614107616),('warranty','nl','',1614107616,1614107616),('warranty','pl','',1614107616,1614107616),('warranty','pt_BR','',1614107616,1614107616),('warranty','ru','',1614107616,1614107616),('warranty','sk','',1614107616,1614107616),('warranty','sv','',1614107616,1614107616),('warranty','sv_FI','',1614107616,1614107616),('warranty','th','',1614107616,1614107616),('warranty','tr','',1614107616,1614107616),('warranty','uk','',1614107616,1614107616),('warranty','zh_Hans','',1614107616,1614107616),('years','cs','',1614099283,1614099283),('years','de','',1614099283,1614099283),('years','en','',1614099283,1614099283),('years','es','',1614099283,1614099283),('years','fa','',1614099283,1614099283),('years','fr','',1614099283,1614099283),('years','hu','',1614099283,1614099283),('years','it','',1614099283,1614099283),('years','ja','',1614099283,1614099283),('years','nl','',1614099283,1614099283),('years','pl','',1614099283,1614099283),('years','pt_BR','',1614099283,1614099283),('years','ru','',1614099283,1614099283),('years','sk','',1614099283,1614099283),('years','sv','',1614099283,1614099283),('years','sv_FI','',1614099283,1614099283),('years','th','',1614099283,1614099283),('years','tr','',1614099283,1614099283),('years','uk','',1614099283,1614099283),('years','zh_Hans','',1614099283,1614099283),('Åland Islands','cs','',1614107614,1614107614),('Åland Islands','de','',1614107614,1614107614),('Åland Islands','en','',1614107614,1614107614),('Åland Islands','es','',1614107614,1614107614),('Åland Islands','fa','',1614107614,1614107614),('Åland Islands','fr','',1614107614,1614107614),('Åland Islands','hu','',1614107614,1614107614),('Åland Islands','it','',1614107614,1614107614),('Åland Islands','ja','',1614107614,1614107614),('Åland Islands','nl','',1614107614,1614107614),('Åland Islands','pl','',1614107614,1614107614),('Åland Islands','pt_BR','',1614107614,1614107614),('Åland Islands','ru','',1614107614,1614107614),('Åland Islands','sk','',1614107614,1614107614),('Åland Islands','sv','',1614107614,1614107614),('Åland Islands','sv_FI','',1614107614,1614107614),('Åland Islands','th','',1614107614,1614107614),('Åland Islands','tr','',1614107614,1614107614),('Åland Islands','uk','',1614107614,1614107614),('Åland Islands','zh_Hans','',1614107614,1614107614);
/*!40000 ALTER TABLE `translations_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations_website`
--

DROP TABLE IF EXISTS `translations_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations_website` (
  `key` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `text` text,
  `creationDate` int unsigned DEFAULT NULL,
  `modificationDate` int unsigned DEFAULT NULL,
  PRIMARY KEY (`key`,`language`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations_website`
--

LOCK TABLES `translations_website` WRITE;
/*!40000 ALTER TABLE `translations_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tree_locks`
--

DROP TABLE IF EXISTS `tree_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tree_locks` (
  `id` int NOT NULL DEFAULT '0',
  `type` enum('asset','document','object') NOT NULL DEFAULT 'asset',
  `locked` enum('self','propagate') DEFAULT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `type` (`type`),
  KEY `locked` (`locked`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tree_locks`
--

LOCK TABLES `tree_locks` WRITE;
/*!40000 ALTER TABLE `tree_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tree_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int unsigned DEFAULT NULL,
  `type` enum('user','userfolder','role','rolefolder') NOT NULL DEFAULT 'user',
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(190) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `contentLanguages` longtext,
  `admin` tinyint unsigned DEFAULT '0',
  `active` tinyint unsigned DEFAULT '1',
  `permissions` text,
  `roles` varchar(1000) DEFAULT NULL,
  `welcomescreen` tinyint(1) DEFAULT NULL,
  `closeWarning` tinyint(1) DEFAULT NULL,
  `memorizeTabs` tinyint(1) DEFAULT NULL,
  `allowDirtyClose` tinyint unsigned DEFAULT '1',
  `docTypes` varchar(255) DEFAULT NULL,
  `classes` text,
  `apiKey` varchar(255) DEFAULT NULL,
  `twoFactorAuthentication` varchar(255) DEFAULT NULL,
  `activePerspective` varchar(255) DEFAULT NULL,
  `perspectives` longtext,
  `websiteTranslationLanguagesEdit` longtext,
  `websiteTranslationLanguagesView` longtext,
  `lastLogin` int unsigned DEFAULT NULL,
  `keyBindings` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_name` (`type`,`name`),
  KEY `parentId` (`parentId`),
  KEY `name` (`name`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,0,'user','system',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,0,'user','admin','$2y$10$jwKvI4jg4DaSYu03wZH5DekcuIHHgoxydlWk2.Oj.QDjGfWVJk2FW',NULL,NULL,NULL,'en',NULL,1,1,'','',0,1,1,0,'','',NULL,'null',NULL,'','','',1614074936,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_permission_definitions`
--

DROP TABLE IF EXISTS `users_permission_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_permission_definitions` (
  `key` varchar(50) NOT NULL DEFAULT '',
  `category` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_permission_definitions`
--

LOCK TABLES `users_permission_definitions` WRITE;
/*!40000 ALTER TABLE `users_permission_definitions` DISABLE KEYS */;
INSERT INTO `users_permission_definitions` VALUES ('admin_translations',''),('application_logging',''),('asset_metadata',''),('assets',''),('classes',''),('clear_cache',''),('clear_fullpage_cache',''),('clear_temp_files',''),('dashboards',''),('document_types',''),('documents',''),('emails',''),('gdpr_data_extractor',''),('glossary',''),('http_errors',''),('notes_events',''),('notifications',''),('notifications_send',''),('objects',''),('piwik_reports',''),('piwik_settings',''),('plugins',''),('predefined_properties',''),('qr_codes',''),('recyclebin',''),('redirects',''),('reports',''),('reports_config',''),('robots.txt',''),('routes',''),('seemode',''),('seo_document_editor',''),('share_configurations',''),('system_settings',''),('tag_snippet_management',''),('tags_assignment',''),('tags_configuration',''),('tags_search',''),('targeting',''),('thumbnails',''),('translations',''),('users',''),('web2print_settings',''),('website_settings',''),('workflow_details','');
/*!40000 ALTER TABLE `users_permission_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_asset`
--

DROP TABLE IF EXISTS `users_workspaces_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_asset` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint(1) DEFAULT '0',
  `view` tinyint(1) DEFAULT '0',
  `publish` tinyint(1) DEFAULT '0',
  `delete` tinyint(1) DEFAULT '0',
  `rename` tinyint(1) DEFAULT '0',
  `create` tinyint(1) DEFAULT '0',
  `settings` tinyint(1) DEFAULT '0',
  `versions` tinyint(1) DEFAULT '0',
  `properties` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_asset`
--

LOCK TABLES `users_workspaces_asset` WRITE;
/*!40000 ALTER TABLE `users_workspaces_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_document`
--

DROP TABLE IF EXISTS `users_workspaces_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_document` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_document`
--

LOCK TABLES `users_workspaces_document` WRITE;
/*!40000 ALTER TABLE `users_workspaces_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_workspaces_object`
--

DROP TABLE IF EXISTS `users_workspaces_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_workspaces_object` (
  `cid` int unsigned NOT NULL DEFAULT '0',
  `cpath` varchar(765) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `userId` int NOT NULL DEFAULT '0',
  `list` tinyint unsigned DEFAULT '0',
  `view` tinyint unsigned DEFAULT '0',
  `save` tinyint unsigned DEFAULT '0',
  `publish` tinyint unsigned DEFAULT '0',
  `unpublish` tinyint unsigned DEFAULT '0',
  `delete` tinyint unsigned DEFAULT '0',
  `rename` tinyint unsigned DEFAULT '0',
  `create` tinyint unsigned DEFAULT '0',
  `settings` tinyint unsigned DEFAULT '0',
  `versions` tinyint unsigned DEFAULT '0',
  `properties` tinyint unsigned DEFAULT '0',
  `lEdit` text,
  `lView` text,
  `layouts` text,
  PRIMARY KEY (`cid`,`userId`),
  UNIQUE KEY `cpath_userId` (`cpath`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_workspaces_object`
--

LOCK TABLES `users_workspaces_object` WRITE;
/*!40000 ALTER TABLE `users_workspaces_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_workspaces_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuids` (
  `uuid` char(36) NOT NULL,
  `itemId` int unsigned NOT NULL,
  `type` varchar(25) NOT NULL,
  `instanceIdentifier` varchar(50) NOT NULL,
  PRIMARY KEY (`uuid`,`itemId`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `versions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cid` int unsigned DEFAULT NULL,
  `ctype` enum('document','asset','object') DEFAULT NULL,
  `userId` int unsigned DEFAULT NULL,
  `note` text,
  `stackTrace` text,
  `date` int unsigned DEFAULT NULL,
  `public` tinyint unsigned NOT NULL DEFAULT '0',
  `serialized` tinyint unsigned DEFAULT '0',
  `versionCount` int unsigned NOT NULL DEFAULT '0',
  `binaryFileHash` varchar(128) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `binaryFileId` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `ctype_cid` (`ctype`,`cid`),
  KEY `date` (`date`),
  KEY `binaryFileHash` (`binaryFileHash`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,4,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075383,0,1,1,NULL,NULL),(2,4,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075441,0,1,2,NULL,NULL),(3,5,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075454,0,1,1,NULL,NULL),(4,3,'asset',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(852): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(539): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(373): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(491): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(333): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075781,0,1,1,'2782f681741fd959ab45bcc85f5f08a0844218a0327eabaa5caab18b8e735763e8f4d0e988bdb16d01c8a8149ba527b04b7b53bfd51dd57b478344a8e151029d',NULL),(5,5,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075792,0,1,2,NULL,NULL),(6,7,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614088764,0,1,1,NULL,NULL),(7,7,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614088837,0,1,2,NULL,NULL),(8,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614106886,0,1,1,NULL,NULL),(9,10,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614106977,0,1,1,NULL,NULL),(10,5,'asset',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(852): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(539): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(373): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(491): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(368): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107224,0,1,1,'57659802d9a3f37029564f7af17d75fef485f9956e7ab0a261067cd5b9d02b73b280fadae416f026e382a695df98200247ff370b3a20420600837097d2ce1d43',NULL),(11,10,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107238,0,1,2,NULL,NULL),(12,11,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107276,0,1,1,NULL,NULL),(13,11,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107331,0,1,2,NULL,NULL),(14,6,'asset',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(852): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(539): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(373): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(491): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(368): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107380,0,1,1,'57659802d9a3f37029564f7af17d75fef485f9956e7ab0a261067cd5b9d02b73b280fadae416f026e382a695df98200247ff370b3a20420600837097d2ce1d43',NULL),(15,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107421,0,1,2,NULL,NULL),(16,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107551,0,1,3,NULL,NULL),(17,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614107882,0,1,4,NULL,NULL);
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `object_1`
--

/*!50001 DROP VIEW IF EXISTS `object_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_1` AS select `object_query_1`.`oo_id` AS `oo_id`,`object_query_1`.`oo_classId` AS `oo_classId`,`object_query_1`.`oo_className` AS `oo_className`,`object_query_1`.`name` AS `name`,`object_query_1`.`description` AS `description`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_1` join `objects` on((`objects`.`o_id` = `object_query_1`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_2`
--

/*!50001 DROP VIEW IF EXISTS `object_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_2` AS select `object_query_2`.`oo_id` AS `oo_id`,`object_query_2`.`oo_classId` AS `oo_classId`,`object_query_2`.`oo_className` AS `oo_className`,`object_query_2`.`name` AS `name`,`object_query_2`.`details` AS `details`,`object_query_2`.`brandLogo` AS `brandLogo`,`object_query_2`.`fabricUsed` AS `fabricUsed`,`object_query_2`.`advertisment` AS `advertisment`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_2` join `objects` on((`objects`.`o_id` = `object_query_2`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_3`
--

/*!50001 DROP VIEW IF EXISTS `object_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_3` AS select `object_query_3`.`oo_id` AS `oo_id`,`object_query_3`.`oo_classId` AS `oo_classId`,`object_query_3`.`oo_className` AS `oo_className`,`object_query_3`.`name` AS `name`,`object_query_3`.`description` AS `description`,`object_query_3`.`washable` AS `washable`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_3` join `objects` on((`objects`.`o_id` = `object_query_3`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_4`
--

/*!50001 DROP VIEW IF EXISTS `object_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_4` AS select `object_query_4`.`oo_id` AS `oo_id`,`object_query_4`.`oo_classId` AS `oo_classId`,`object_query_4`.`oo_className` AS `oo_className`,`object_query_4`.`name` AS `name`,`object_query_4`.`price` AS `price`,`object_query_4`.`sku` AS `sku`,`object_query_4`.`size` AS `size`,`object_query_4`.`color__rgb` AS `color__rgb`,`object_query_4`.`color__a` AS `color__a`,`object_query_4`.`fabric__id` AS `fabric__id`,`object_query_4`.`fabric__type` AS `fabric__type`,`object_query_4`.`discount` AS `discount`,`object_query_4`.`brand__id` AS `brand__id`,`object_query_4`.`brand__type` AS `brand__type`,`object_query_4`.`category__id` AS `category__id`,`object_query_4`.`category__type` AS `category__type`,`object_query_4`.`image` AS `image`,`object_query_4`.`madeIn` AS `madeIn`,`object_query_4`.`returnable` AS `returnable`,`object_query_4`.`pattern` AS `pattern`,`object_query_4`.`warranty__value` AS `warranty__value`,`object_query_4`.`warranty__unit` AS `warranty__unit`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_4` join `objects` on((`objects`.`o_id` = `object_query_4`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_localized_4_bn`
--

/*!50001 DROP VIEW IF EXISTS `object_localized_4_bn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_localized_4_bn` AS select `object_query_4`.`oo_id` AS `oo_id`,`object_query_4`.`oo_classId` AS `oo_classId`,`object_query_4`.`oo_className` AS `oo_className`,`object_query_4`.`name` AS `name`,`object_query_4`.`price` AS `price`,`object_query_4`.`sku` AS `sku`,`object_query_4`.`size` AS `size`,`object_query_4`.`color__rgb` AS `color__rgb`,`object_query_4`.`color__a` AS `color__a`,`object_query_4`.`fabric__id` AS `fabric__id`,`object_query_4`.`fabric__type` AS `fabric__type`,`object_query_4`.`discount` AS `discount`,`object_query_4`.`brand__id` AS `brand__id`,`object_query_4`.`brand__type` AS `brand__type`,`object_query_4`.`category__id` AS `category__id`,`object_query_4`.`category__type` AS `category__type`,`object_query_4`.`image` AS `image`,`object_query_4`.`madeIn` AS `madeIn`,`object_query_4`.`returnable` AS `returnable`,`object_query_4`.`pattern` AS `pattern`,`object_query_4`.`warranty__value` AS `warranty__value`,`object_query_4`.`warranty__unit` AS `warranty__unit`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount`,`bn`.`ooo_id` AS `ooo_id`,`bn`.`language` AS `language`,`bn`.`localName` AS `localName`,`bn`.`localDetail` AS `localDetail` from ((`object_query_4` join `objects` on((`objects`.`o_id` = `object_query_4`.`oo_id`))) left join `object_localized_query_4_bn` `bn` on(((0 <> 1) and (`object_query_4`.`oo_id` = `bn`.`ooo_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_localized_4_en`
--

/*!50001 DROP VIEW IF EXISTS `object_localized_4_en`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`demo`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_localized_4_en` AS select `object_query_4`.`oo_id` AS `oo_id`,`object_query_4`.`oo_classId` AS `oo_classId`,`object_query_4`.`oo_className` AS `oo_className`,`object_query_4`.`name` AS `name`,`object_query_4`.`price` AS `price`,`object_query_4`.`sku` AS `sku`,`object_query_4`.`size` AS `size`,`object_query_4`.`color__rgb` AS `color__rgb`,`object_query_4`.`color__a` AS `color__a`,`object_query_4`.`fabric__id` AS `fabric__id`,`object_query_4`.`fabric__type` AS `fabric__type`,`object_query_4`.`discount` AS `discount`,`object_query_4`.`brand__id` AS `brand__id`,`object_query_4`.`brand__type` AS `brand__type`,`object_query_4`.`category__id` AS `category__id`,`object_query_4`.`category__type` AS `category__type`,`object_query_4`.`image` AS `image`,`object_query_4`.`madeIn` AS `madeIn`,`object_query_4`.`returnable` AS `returnable`,`object_query_4`.`pattern` AS `pattern`,`object_query_4`.`warranty__value` AS `warranty__value`,`object_query_4`.`warranty__unit` AS `warranty__unit`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount`,`en`.`ooo_id` AS `ooo_id`,`en`.`language` AS `language`,`en`.`localName` AS `localName`,`en`.`localDetail` AS `localDetail` from ((`object_query_4` join `objects` on((`objects`.`o_id` = `object_query_4`.`oo_id`))) left join `object_localized_query_4_en` `en` on(((0 <> 1) and (`object_query_4`.`oo_id` = `en`.`ooo_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24  0:50:31
