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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,0,'folder','','/',NULL,1613976326,1613976326,1,1,NULL,0,0),(2,1,'folder','brandLogo','/',NULL,1614075740,1614075740,2,2,'a:0:{}',0,1),(3,2,'image','levi.png','/brandLogo/','image/png',1614075781,1614075781,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:300;s:11:\"imageHeight\";i:168;s:16:\"embeddedMetaData\";a:0:{}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1),(4,1,'folder','_default_upload_bucket','/',NULL,1614095825,1614095825,1,0,'a:0:{}',0,1),(5,4,'image','kurti6.jpeg','/_default_upload_bucket/','image/jpeg',1614095825,1614095825,2,2,'a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614095825;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}',0,1);
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
INSERT INTO `cache` VALUES ('asset_5',_binary 's:914:\"O:25:\"Pimcore\\Model\\Asset\\Image\":20:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:5;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:11:\"kurti6.jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1614095825;s:19:\"\0*\0modificationDate\";i:1614095825;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614095825;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614095825;s:12:\"\0*\0_fulldump\";b:0;}\";',1614096488,1616515688),('object_1',_binary 's:598:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:1;s:13:\"\0*\0o_parentId\";i:0;s:8:\"\0*\0o_key\";s:0:\"\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:999999;s:17:\"\0*\0o_creationDate\";i:1613976326;s:21:\"\0*\0o_modificationDate\";i:1613976326;s:14:\"\0*\0o_userOwner\";i:1;s:21:\"\0*\0o_userModification\";i:1;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:0;s:25:\"\0*\0__dataVersionTimestamp\";i:1613976326;s:12:\"\0*\0_fulldump\";b:0;}\";',1614096489,1616515689),('object_8',_binary 's:600:\"O:31:\"Pimcore\\Model\\DataObject\\Folder\":19:{s:9:\"\0*\0o_type\";s:6:\"folder\";s:7:\"\0*\0o_id\";i:8;s:13:\"\0*\0o_parentId\";i:1;s:8:\"\0*\0o_key\";s:7:\"product\";s:9:\"\0*\0o_path\";s:1:\"/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614095537;s:21:\"\0*\0o_modificationDate\";i:1614095537;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:2;s:25:\"\0*\0__dataVersionTimestamp\";i:1614095537;s:12:\"\0*\0_fulldump\";b:0;}\";',1614096489,1616515689),('object_9',_binary 's:6346:\"O:32:\"Pimcore\\Model\\DataObject\\Product\":38:{s:12:\"\0*\0o_classId\";s:1:\"4\";s:14:\"\0*\0o_className\";s:7:\"product\";s:6:\"\0*\0sku\";i:1;s:7:\"\0*\0name\";s:5:\"Kurti\";s:7:\"\0*\0size\";s:1:\"L\";s:8:\"\0*\0color\";O:39:\"Pimcore\\Model\\DataObject\\Data\\RgbaColor\":7:{s:4:\"\0*\0r\";i:229;s:4:\"\0*\0g\";i:14;s:4:\"\0*\0b\";i:14;s:4:\"\0*\0a\";i:255;s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:8:\"\0*\0price\";d:999;s:11:\"\0*\0discount\";N;s:9:\"\0*\0gender\";s:6:\"Female\";s:8:\"\0*\0image\";O:25:\"Pimcore\\Model\\Asset\\Image\":21:{s:7:\"\0*\0type\";s:5:\"image\";s:5:\"\0*\0id\";i:5;s:11:\"\0*\0parentId\";i:4;s:11:\"\0*\0filename\";s:11:\"kurti6.jpeg\";s:7:\"\0*\0path\";s:24:\"/_default_upload_bucket/\";s:11:\"\0*\0mimetype\";s:10:\"image/jpeg\";s:15:\"\0*\0creationDate\";i:1614095825;s:19:\"\0*\0modificationDate\";i:1614095825;s:12:\"\0*\0userOwner\";i:2;s:19:\"\0*\0userModification\";i:2;s:11:\"\0*\0metadata\";a:0:{}s:9:\"\0*\0locked\";N;s:17:\"\0*\0customSettings\";a:5:{s:25:\"imageDimensionsCalculated\";b:1;s:10:\"imageWidth\";i:704;s:11:\"imageHeight\";i:1056;s:16:\"embeddedMetaData\";a:5:{s:12:\"FileDateTime\";i:1614095825;s:8:\"FileSize\";i:53635;s:8:\"FileType\";i:2;s:8:\"MimeType\";s:10:\"image/jpeg\";s:13:\"SectionsFound\";s:0:\"\";}s:25:\"embeddedMetaDataExtracted\";b:1;}s:14:\"\0*\0hasMetaData\";b:0;s:11:\"\0*\0siblings\";N;s:14:\"\0*\0hasSiblings\";N;s:15:\"\0*\0_dataChanged\";b:0;s:15:\"\0*\0versionCount\";i:1;s:25:\"\0*\0__dataVersionTimestamp\";i:1614095825;s:12:\"\0*\0_fulldump\";b:0;s:24:\"____pimcore_cache_item__\";s:7:\"asset_5\";}s:11:\"\0*\0warranty\";O:43:\"Pimcore\\Model\\DataObject\\Data\\QuantityValue\":6:{s:8:\"\0*\0value\";d:1;s:9:\"\0*\0unitId\";s:1:\"2\";s:7:\"\0*\0unit\";O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"2\";s:12:\"abbreviation\";s:6:\"months\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}s:9:\"\0*\0_owner\";N;s:13:\"\0*\0_fieldname\";N;s:12:\"\0*\0_language\";N;}s:17:\"\0*\0classification\";O:47:\"Pimcore\\Model\\DataObject\\Product\\Classification\":7:{s:15:\"\0*\0brickGetters\";a:3:{i:0;s:5:\"suits\";i:1;s:5:\"jeans\";i:2;s:5:\"shirt\";}s:8:\"\0*\0suits\";O:47:\"Pimcore\\Model\\DataObject\\Objectbrick\\Data\\Suits\":8:{s:7:\"\0*\0type\";s:5:\"suits\";s:7:\"\0*\0neck\";s:10:\"Round Neck\";s:10:\"\0*\0sleeves\";s:12:\"Half Sleeves\";s:8:\"\0*\0types\";s:14:\"Anarkali suits\";s:12:\"\0*\0fieldname\";s:14:\"classification\";s:11:\"\0*\0doDelete\";N;s:11:\"\0*\0objectId\";i:9;s:12:\"\0*\0_fulldump\";b:0;}s:8:\"\0*\0jeans\";N;s:8:\"\0*\0shirt\";N;s:8:\"\0*\0items\";a:0:{}s:12:\"\0*\0fieldname\";s:14:\"classification\";s:11:\"\0*\0objectId\";i:9;}s:16:\"\0*\0productDetail\";s:694:\"<p>This red suit set by Bunaai is crafted in cotton and comes with a printed dupatta. The kurta features a V-neck, 3/4th sheer sleeves, a keyhole back accented with dori tie-up detail and a regular fit. The pants feature a mid-rise waist, tapered ankles and a comfortable fit. Style this suit set with a pair of high heels and statement accessories to complete the look. Buy this set online. Please note: This piece is handmade with love and care by various artisans and therefore slight differences of design and colour may occur from piece-to-piece which allows for a signature one-of-a-kind aesthetic.<br />\nDue to the handmade nature of our products there can be variations in colours.</p>\n\";s:9:\"\0*\0madeIn\";s:2:\"IN\";s:18:\"\0*\0localizedfields\";O:39:\"Pimcore\\Model\\DataObject\\Localizedfield\":3:{s:8:\"\0*\0items\";a:2:{s:2:\"bn\";a:2:{s:9:\"localName\";s:19:\" কুর্তি\";s:11:\"localDetail\";s:804:\"<pre>\nবুনাইয়ের সেট করা এই লাল স্যুটটি সুতিতে কারুকাজ করা হয়েছে এবং এটি একটি মুদ্রিত দুপট্টা নিয়ে আসে। কুর্তায় একটি ভি-ঘাড়, 3/4 র্থ নিবিড় হাতা, একটি কী-হোল ফিরে ডোরি টাই-আপ বিশদ এবং নিয়মিত ফিটের সাথে যুক্ত রয়েছে। প্যান্টগুলিতে একটি মাঝারি উত্থিত কোমর, সুতাযুক্ত গোড়ালি এবং একটি আরামদায়ক ফিট রয়েছে।</pre>\n\";}s:2:\"en\";a:2:{s:9:\"localName\";s:5:\"Kurti\";s:11:\"localDetail\";s:694:\"<p>This red suit set by Bunaai is crafted in cotton and comes with a printed dupatta. The kurta features a V-neck, 3/4th sheer sleeves, a keyhole back accented with dori tie-up detail and a regular fit. The pants feature a mid-rise waist, tapered ankles and a comfortable fit. Style this suit set with a pair of high heels and statement accessories to complete the look. Buy this set online. Please note: This piece is handmade with love and care by various artisans and therefore slight differences of design and colour may occur from piece-to-piece which allows for a signature one-of-a-kind aesthetic.<br />\nDue to the handmade nature of our products there can be variations in colours.</p>\n\";}}s:10:\"\0*\0context\";a:1:{s:6:\"object\";r:1;}s:11:\"\0*\0objectId\";i:9;}s:13:\"\0*\0returnable\";b:0;s:10:\"\0*\0pattern\";s:7:\"Printed\";s:20:\"\0*\0__rawRelationData\";a:3:{i:0;a:9:{s:2:\"id\";s:1:\"7\";s:6:\"src_id\";s:1:\"9\";s:7:\"dest_id\";s:1:\"7\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:6:\"fabric\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}i:1;a:9:{s:2:\"id\";s:1:\"8\";s:6:\"src_id\";s:1:\"9\";s:7:\"dest_id\";s:1:\"5\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:5:\"brand\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}i:2;a:9:{s:2:\"id\";s:1:\"9\";s:6:\"src_id\";s:1:\"9\";s:7:\"dest_id\";s:2:\"10\";s:4:\"type\";s:6:\"object\";s:9:\"fieldname\";s:8:\"category\";s:5:\"index\";s:1:\"0\";s:9:\"ownertype\";s:6:\"object\";s:9:\"ownername\";s:0:\"\";s:8:\"position\";s:1:\"0\";}}s:14:\"\0*\0o_published\";b:1;s:7:\"\0*\0o_id\";i:9;s:13:\"\0*\0o_parentId\";i:8;s:9:\"\0*\0o_type\";s:6:\"object\";s:8:\"\0*\0o_key\";s:5:\"000P1\";s:9:\"\0*\0o_path\";s:9:\"/product/\";s:10:\"\0*\0o_index\";i:0;s:17:\"\0*\0o_creationDate\";i:1614095551;s:21:\"\0*\0o_modificationDate\";i:1614096662;s:14:\"\0*\0o_userOwner\";i:2;s:21:\"\0*\0o_userModification\";i:2;s:13:\"\0*\0o_siblings\";a:0:{}s:16:\"\0*\0o_hasSiblings\";a:0:{}s:11:\"\0*\0o_locked\";N;s:22:\"\0*\0o_elementAdminStyle\";N;s:19:\"\0*\0o_childrenSortBy\";N;s:22:\"\0*\0o_childrenSortOrder\";N;s:17:\"\0*\0o_versionCount\";i:4;s:25:\"\0*\0__dataVersionTimestamp\";i:1614096662;s:12:\"\0*\0_fulldump\";b:0;}\";',1614096662,1616515862),('quantityvalue_units_table',_binary 's:721:\"a:3:{i:1;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"1\";s:12:\"abbreviation\";s:5:\"weeks\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:2;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"2\";s:12:\"abbreviation\";s:6:\"months\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}i:3;O:43:\"Pimcore\\Model\\DataObject\\QuantityValue\\Unit\":9:{s:2:\"id\";s:1:\"3\";s:12:\"abbreviation\";s:5:\"years\";s:5:\"group\";N;s:8:\"longname\";N;s:8:\"baseunit\";N;s:9:\"reference\";N;s:6:\"factor\";N;s:16:\"conversionOffset\";N;s:9:\"converter\";s:0:\"\";}}\";',1614096488,1616515688),('system_resource_columns_edit_lock',_binary 's:101:\"a:6:{i:0;s:2:\"id\";i:1;s:3:\"cid\";i:2;s:5:\"ctype\";i:3;s:6:\"userId\";i:4;s:9:\"sessionId\";i:5;s:4:\"date\";}\";',1614096642,1616515842);
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
INSERT INTO `cache_tags` VALUES ('asset_5','asset_5'),('object_9','asset_5'),('object_9','class_4'),('object_1','object_1'),('object_8','object_8'),('object_9','object_9'),('system_resource_columns_edit_lock','resource'),('system_resource_columns_edit_lock','system');
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
INSERT INTO `classes` VALUES ('2','brand'),('1','category'),('3','fabric'),('5','faqs'),('4','product');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES (1,'object',5,'asset',3),(5,'object',9,'asset',5),(3,'object',9,'object',5),(2,'object',9,'object',7),(4,'object',9,'object',10);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edit_lock`
--

LOCK TABLES `edit_lock` WRITE;
/*!40000 ALTER TABLE `edit_lock` DISABLE KEYS */;
INSERT INTO `edit_lock` VALUES (2,5,'object',2,'frpu49mq4qsc9hlglmpkrnmjhe',1614075454),(7,6,'object',2,'fullmtgb226kvphb3jdijg6qd8',1614094606),(8,7,'object',2,'fullmtgb226kvphb3jdijg6qd8',1614094606),(11,4,'object',2,'fullmtgb226kvphb3jdijg6qd8',1614095756),(12,10,'object',2,'fullmtgb226kvphb3jdijg6qd8',1614095770),(18,9,'object',2,'fullmtgb226kvphb3jdijg6qd8',1614096642);
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
 1 AS `sku`,
 1 AS `name`,
 1 AS `size`,
 1 AS `color__rgb`,
 1 AS `color__a`,
 1 AS `price`,
 1 AS `fabric__id`,
 1 AS `fabric__type`,
 1 AS `discount`,
 1 AS `gender`,
 1 AS `brand__id`,
 1 AS `brand__type`,
 1 AS `productDetail`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `madeIn`,
 1 AS `image`,
 1 AS `warranty__value`,
 1 AS `warranty__unit`,
 1 AS `returnable`,
 1 AS `pattern`,
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
-- Temporary view structure for view `object_5`
--

DROP TABLE IF EXISTS `object_5`;
/*!50001 DROP VIEW IF EXISTS `object_5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `object_5` AS SELECT 
 1 AS `oo_id`,
 1 AS `oo_classId`,
 1 AS `oo_className`,
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
  `collarType` varchar(190) DEFAULT NULL,
  `pockets` double DEFAULT NULL,
  `sleeves` varchar(190) DEFAULT NULL,
  `suitableFor` varchar(190) DEFAULT NULL,
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
-- Table structure for table `object_brick_query_suits_4`
--

DROP TABLE IF EXISTS `object_brick_query_suits_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_query_suits_4` (
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
-- Dumping data for table `object_brick_query_suits_4`
--

LOCK TABLES `object_brick_query_suits_4` WRITE;
/*!40000 ALTER TABLE `object_brick_query_suits_4` DISABLE KEYS */;
INSERT INTO `object_brick_query_suits_4` VALUES (9,'classification','Round Neck','Half Sleeves','Anarkali suits');
/*!40000 ALTER TABLE `object_brick_query_suits_4` ENABLE KEYS */;
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
  `collarType` varchar(190) DEFAULT NULL,
  `pockets` double DEFAULT NULL,
  `sleeves` varchar(190) DEFAULT NULL,
  `suitableFor` varchar(190) DEFAULT NULL,
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
-- Table structure for table `object_brick_store_suits_4`
--

DROP TABLE IF EXISTS `object_brick_store_suits_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_brick_store_suits_4` (
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
-- Dumping data for table `object_brick_store_suits_4`
--

LOCK TABLES `object_brick_store_suits_4` WRITE;
/*!40000 ALTER TABLE `object_brick_store_suits_4` DISABLE KEYS */;
INSERT INTO `object_brick_store_suits_4` VALUES (9,'classification','Round Neck','Half Sleeves','Anarkali suits');
/*!40000 ALTER TABLE `object_brick_store_suits_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_collection_faqs_4`
--

DROP TABLE IF EXISTS `object_collection_faqs_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_collection_faqs_4` (
  `o_id` int NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `question` longtext,
  `answer` longtext,
  PRIMARY KEY (`o_id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_collection_faqs_4`
--

LOCK TABLES `object_collection_faqs_4` WRITE;
/*!40000 ALTER TABLE `object_collection_faqs_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_collection_faqs_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_collection_faqs_5`
--

DROP TABLE IF EXISTS `object_collection_faqs_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_collection_faqs_5` (
  `o_id` int NOT NULL DEFAULT '0',
  `index` int NOT NULL DEFAULT '0',
  `fieldname` varchar(190) NOT NULL DEFAULT '',
  `firstname` varchar(190) DEFAULT NULL,
  `lastname` varchar(190) DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `question` longtext,
  `answer` longtext,
  PRIMARY KEY (`o_id`,`index`,`fieldname`),
  KEY `index` (`index`),
  KEY `fieldname` (`fieldname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_collection_faqs_5`
--

LOCK TABLES `object_collection_faqs_5` WRITE;
/*!40000 ALTER TABLE `object_collection_faqs_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_collection_faqs_5` ENABLE KEYS */;
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
 1 AS `sku`,
 1 AS `name`,
 1 AS `size`,
 1 AS `color__rgb`,
 1 AS `color__a`,
 1 AS `price`,
 1 AS `fabric__id`,
 1 AS `fabric__type`,
 1 AS `discount`,
 1 AS `gender`,
 1 AS `brand__id`,
 1 AS `brand__type`,
 1 AS `productDetail`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `madeIn`,
 1 AS `image`,
 1 AS `warranty__value`,
 1 AS `warranty__unit`,
 1 AS `returnable`,
 1 AS `pattern`,
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
 1 AS `sku`,
 1 AS `name`,
 1 AS `size`,
 1 AS `color__rgb`,
 1 AS `color__a`,
 1 AS `price`,
 1 AS `fabric__id`,
 1 AS `fabric__type`,
 1 AS `discount`,
 1 AS `gender`,
 1 AS `brand__id`,
 1 AS `brand__type`,
 1 AS `productDetail`,
 1 AS `category__id`,
 1 AS `category__type`,
 1 AS `madeIn`,
 1 AS `image`,
 1 AS `warranty__value`,
 1 AS `warranty__unit`,
 1 AS `returnable`,
 1 AS `pattern`,
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
INSERT INTO `object_localized_data_4` VALUES (9,'bn',' কুর্তি','<pre>\nবুনাইয়ের সেট করা এই লাল স্যুটটি সুতিতে কারুকাজ করা হয়েছে এবং এটি একটি মুদ্রিত দুপট্টা নিয়ে আসে। কুর্তায় একটি ভি-ঘাড়, 3/4 র্থ নিবিড় হাতা, একটি কী-হোল ফিরে ডোরি টাই-আপ বিশদ এবং নিয়মিত ফিটের সাথে যুক্ত রয়েছে। প্যান্টগুলিতে একটি মাঝারি উত্থিত কোমর, সুতাযুক্ত গোড়ালি এবং একটি আরামদায়ক ফিট রয়েছে।</pre>\n'),(9,'en','Kurti','<p>This red suit set by Bunaai is crafted in cotton and comes with a printed dupatta. The kurta features a V-neck, 3/4th sheer sleeves, a keyhole back accented with dori tie-up detail and a regular fit. The pants feature a mid-rise waist, tapered ankles and a comfortable fit. Style this suit set with a pair of high heels and statement accessories to complete the look. Buy this set online. Please note: This piece is handmade with love and care by various artisans and therefore slight differences of design and colour may occur from piece-to-piece which allows for a signature one-of-a-kind aesthetic.<br />\nDue to the handmade nature of our products there can be variations in colours.</p>\n');
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
INSERT INTO `object_localized_query_4_bn` VALUES (9,'bn',' কুর্তি',' বুনাইয়ের সেট করা এই লাল স্যুটটি সুতিতে কারুকাজ করা হয়েছে এবং এটি একটি মুদ্রিত দুপট্টা নিয়ে আসে। কুর্তায় একটি ভি-ঘাড়, 3/4 র্থ নিবিড় হাতা, একটি কী-হোল ফিরে ডোরি টাই-আপ বিশদ এবং নিয়মিত ফিটের সাথে যুক্ত রয়েছে। প্যান্টগুলিতে একটি মাঝারি উত্থিত কোমর, সুতাযুক্ত গোড়ালি এবং একটি আরামদায়ক ফিট রয়েছে। ');
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
INSERT INTO `object_localized_query_4_en` VALUES (9,'en','Kurti','This red suit set by Bunaai is crafted in cotton and comes with a printed dupatta. The kurta features a V-neck, 3/4th sheer sleeves, a keyhole back accented with dori tie-up detail and a regular fit. The pants feature a mid-rise waist, tapered ankles and a comfortable fit. Style this suit set with a pair of high heels and statement accessories to complete the look. Buy this set online. Please note: This piece is handmade with love and care by various artisans and therefore slight differences of design and colour may occur from piece-to-piece which allows for a signature one-of-a-kind aesthetic. Due to the handmade nature of our products there can be variations in colours. ');
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
INSERT INTO `object_query_1` VALUES (4,'1','category','Jeans','Used for Bottom wear.'),(10,'1','category','Suits','desc');
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
INSERT INTO `object_query_2` VALUES (5,'2','brand','Levis','Levi Strauss &amp; Co. is an American clothing company known worldwide for its Levi\'s brand of denim jeans. It was founded in May 1853 when German immigrant Levi Strauss moved from Buttenheim, Bavaria, to San Francisco, California to open a west coast branch of his brothers\' New York dry goods business. ',3,NULL,NULL);
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
  `sku` double DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `size` varchar(190) DEFAULT NULL,
  `color__rgb` varchar(6) DEFAULT NULL,
  `color__a` varchar(2) DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `fabric__id` int DEFAULT NULL,
  `fabric__type` enum('document','asset','object') DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `gender` varchar(190) DEFAULT NULL,
  `brand__id` int DEFAULT NULL,
  `brand__type` enum('document','asset','object') DEFAULT NULL,
  `productDetail` longtext,
  `category__id` int DEFAULT NULL,
  `category__type` enum('document','asset','object') DEFAULT NULL,
  `madeIn` varchar(190) DEFAULT NULL,
  `image` int DEFAULT NULL,
  `warranty__value` double DEFAULT NULL,
  `warranty__unit` varchar(50) DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT NULL,
  `pattern` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_4`
--

LOCK TABLES `object_query_4` WRITE;
/*!40000 ALTER TABLE `object_query_4` DISABLE KEYS */;
INSERT INTO `object_query_4` VALUES (9,'4','product',1,'Kurti','L','e50e0e','ff',999.00,7,'object',NULL,'Female',5,'object','This red suit set by Bunaai is crafted in cotton and comes with a printed dupatta. The kurta features a V-neck, 3/4th sheer sleeves, a keyhole back accented with dori tie-up detail and a regular fit. The pants feature a mid-rise waist, tapered ankles and a comfortable fit. Style this suit set with a pair of high heels and statement accessories to complete the look. Buy this set online. Please note: This piece is handmade with love and care by various artisans and therefore slight differences of design and colour may occur from piece-to-piece which allows for a signature one-of-a-kind aesthetic. Due to the handmade nature of our products there can be variations in colours. ',10,'object','IN',5,1,'2',0,'Printed');
/*!40000 ALTER TABLE `object_query_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_query_5`
--

DROP TABLE IF EXISTS `object_query_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_query_5` (
  `oo_id` int NOT NULL DEFAULT '0',
  `oo_classId` varchar(50) DEFAULT '5',
  `oo_className` varchar(255) DEFAULT 'faqs',
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_query_5`
--

LOCK TABLES `object_query_5` WRITE;
/*!40000 ALTER TABLE `object_query_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_query_5` ENABLE KEYS */;
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
INSERT INTO `object_relations_4` VALUES (7,9,7,'object','fabric',0,'object','','0'),(8,9,5,'object','brand',0,'object','','0'),(9,9,10,'object','category',0,'object','','0');
/*!40000 ALTER TABLE `object_relations_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_relations_5`
--

DROP TABLE IF EXISTS `object_relations_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_relations_5` (
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
-- Dumping data for table `object_relations_5`
--

LOCK TABLES `object_relations_5` WRITE;
/*!40000 ALTER TABLE `object_relations_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_relations_5` ENABLE KEYS */;
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
INSERT INTO `object_store_1` VALUES (4,'Jeans','Used for Bottom wear.'),(10,'Suits','desc');
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
INSERT INTO `object_store_2` VALUES (5,'Levis','<p>Levi Strauss &amp; Co. is an American clothing company known worldwide for its Levi\'s brand of denim jeans. It was founded in May 1853 when German immigrant Levi Strauss moved from Buttenheim, Bavaria, to San Francisco, California to open a west coast branch of his brothers\' New York dry goods business.</p>\n',3,NULL);
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
  `sku` double DEFAULT NULL,
  `name` varchar(190) DEFAULT NULL,
  `size` varchar(190) DEFAULT NULL,
  `color__rgb` varchar(6) DEFAULT NULL,
  `color__a` varchar(2) DEFAULT NULL,
  `price` decimal(64,2) DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `gender` varchar(190) DEFAULT NULL,
  `productDetail` longtext,
  `madeIn` varchar(190) DEFAULT NULL,
  `image` int DEFAULT NULL,
  `warranty__value` double DEFAULT NULL,
  `warranty__unit` varchar(50) DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT NULL,
  `pattern` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_4`
--

LOCK TABLES `object_store_4` WRITE;
/*!40000 ALTER TABLE `object_store_4` DISABLE KEYS */;
INSERT INTO `object_store_4` VALUES (9,1,'Kurti','L','e50e0e','ff',999.00,NULL,'Female','<p>This red suit set by Bunaai is crafted in cotton and comes with a printed dupatta. The kurta features a V-neck, 3/4th sheer sleeves, a keyhole back accented with dori tie-up detail and a regular fit. The pants feature a mid-rise waist, tapered ankles and a comfortable fit. Style this suit set with a pair of high heels and statement accessories to complete the look. Buy this set online. Please note: This piece is handmade with love and care by various artisans and therefore slight differences of design and colour may occur from piece-to-piece which allows for a signature one-of-a-kind aesthetic.<br />\nDue to the handmade nature of our products there can be variations in colours.</p>\n','IN',5,1,'2',0,'Printed');
/*!40000 ALTER TABLE `object_store_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_store_5`
--

DROP TABLE IF EXISTS `object_store_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `object_store_5` (
  `oo_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`oo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_store_5`
--

LOCK TABLES `object_store_5` WRITE;
/*!40000 ALTER TABLE `object_store_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_store_5` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objects`
--

LOCK TABLES `objects` WRITE;
/*!40000 ALTER TABLE `objects` DISABLE KEYS */;
INSERT INTO `objects` VALUES (1,0,'folder','','/',999999,1,1613976326,1613976326,1,1,NULL,NULL,NULL,NULL,0),(2,1,'folder','category','/',NULL,1,1614075329,1614075328,2,2,NULL,NULL,NULL,NULL,2),(3,1,'folder','brand','/',NULL,1,1614075343,1614075343,2,2,NULL,NULL,NULL,NULL,2),(4,2,'object','000C1','/category/',0,1,1614075383,1614075441,2,2,'1','category',NULL,NULL,2),(5,3,'object','000B1','/brand/',0,1,1614075454,1614075792,2,2,'2','brand',NULL,NULL,2),(6,1,'folder','fabric','/',NULL,1,1614088751,1614088751,2,2,NULL,NULL,NULL,NULL,2),(7,6,'object','Cotton','/fabric/',0,1,1614088764,1614088837,2,2,'3','fabric',NULL,NULL,2),(8,1,'folder','product','/',NULL,1,1614095537,1614095537,2,2,NULL,NULL,NULL,NULL,2),(9,8,'object','000P1','/product/',0,1,1614095551,1614096662,2,2,'4','product',NULL,NULL,4),(10,2,'object','suit','/category/',0,1,1614095770,1614095777,2,2,'1','category',NULL,NULL,2);
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
INSERT INTO `quantityvalue_units` VALUES ('1',NULL,'weeks',NULL,NULL,NULL,NULL,NULL,''),('2',NULL,'months',NULL,NULL,NULL,NULL,NULL,''),('3',NULL,'years',NULL,NULL,NULL,NULL,NULL,'');
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
INSERT INTO `search_backend_data` VALUES (2,'/brandLogo','asset','folder','folder',1,1614075740,1614075740,2,2,'ID: 2  \nPath: /brandLogo  \nbrandLogo brandLogo',''),(2,'/category','object','folder','folder',1,1614075329,1614075328,2,2,'ID: 2  \nPath: /category  \ncategory category',''),(3,'/brandLogo/levi.png','asset','image','image',1,1614075781,1614075781,2,2,'ID: 3  \nPath: /brandLogo/levi.png  \nlevi.png brandLogo levi png',''),(3,'/brand','object','folder','folder',1,1614075343,1614075343,2,2,'ID: 3  \nPath: /brand  \nbrand brand',''),(4,'/_default_upload_bucket','asset','folder','folder',1,1614095825,1614095825,1,0,'ID: 4  \nPath: /_default_upload_bucket  \n_default_upload_bucket default upload bucket',''),(4,'/category/000C1','object','object','category',1,1614075383,1614075441,2,2,'ID: 4  \nPath: /category/000C1  \n000C1 Jeans Used for Bottom wear. category 000C1',''),(5,'/_default_upload_bucket/kurti6.jpeg','asset','image','image',1,1614095825,1614095825,2,2,'ID: 5  \nPath: /_default_upload_bucket/kurti6.jpeg  \nkurti6.jpeg FileName kurti6.jpeg FileDateTime 1614095825 FileSize 53635 FileType MimeType image/jpeg SectionsFound default upload bucket kurti6 jpeg',''),(5,'/brand/000B1','object','object','brand',1,1614075454,1614075792,2,2,'ID: 5  \nPath: /brand/000B1  \n000B1 Levis Levi Strauss Co. American clothing company known worldwide for its Levi brand denim jeans. was founded May 1853 when German immigrant Levi Strauss moved from Buttenheim Bavaria San Francisco California open west coast branch his brothers New York dry goods business. brand 000B1',''),(6,'/fabric','object','folder','folder',1,1614088751,1614088751,2,2,'ID: 6  \nPath: /fabric  \nfabric fabric',''),(7,'/fabric/Cotton','object','object','fabric',1,1614088764,1614088837,2,2,'ID: 7  \nPath: /fabric/Cotton  \nCotton Cotton Cotton fabric one the most commonly used types fabrics the world. This textile chemically organic which means that does not contain any synthetic compounds. fabric derived from the fibers surrounding seeds cotton plants which emerge round fluffy formation once seeds are mature. Normal Wash fabric',''),(8,'/product','object','folder','folder',1,1614095537,1614095537,2,2,'ID: 8  \nPath: /product  \nproduct product',''),(9,'/product/000P1','object','object','product',1,1614095551,1614096662,2,2,'ID: 9  \nPath: /product/000P1  \n000P1 Kurti #e50e0eff 999 Female months Round Neck Half Sleeves Anarkali suits This red suit set Bunaai crafted cotton and comes with printed dupatta. The kurta features V-neck 3/4th sheer sleeves keyhole back accented with dori tie-up detail and regular fit. The pants feature mid-rise waist tapered ankles and comfortable fit. Style this suit set with pair high heels statement accessories complete the look. Buy this set online. Please note This piece handmade love care various artisans therefore slight differences design colour may occur from piece-to-piece which allows for signature one-of-a-kind aesthetic. Due the handmade nature our products there can variations colours. কুর্তি বুনাইয়ের সেট করা লাল স্যুটটি সুতিতে কারুকাজ করা হয়েছে এবং এটি একটি মুদ্রিত দুপট্টা নিয়ে আসে। কুর্তায় একটি ভি-ঘাড় 3/4 র্থ নিবিড় হাতা একটি কী-হোল ফিরে ডোরি টাই-আপ বিশদ এবং নিয়মিত ফিটের সাথে যুক্ত রয়েছে। প্যান্টগুলিতে মাঝারি উত্থিত কোমর সুতাযুক্ত গোড়ালি এবং আরামদায়ক ফিট রয়েছে। Kurti This red suit Bunaai crafted cotton comes printed dupatta. The kurta features V-neck 3/4th sheer sleeves keyhole back accented dori tie-up detail regular fit. pants feature mid-rise waist tapered ankles comfortable Style this pair high heels statement accessories complete the look. Buy online. Please note piece handmade love care various artisans therefore slight differences design colour may occur from piece-to-piece which allows for signature one-of-a-kind aesthetic. Due nature our products there can variations colours. Printed product 000P1',''),(10,'/category/suit','object','object','category',1,1614095770,1614095777,2,2,'ID: 10  \nPath: /category/suit  \nsuit Suits desc category suit','');
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
INSERT INTO `tmp_store` VALUES ('thumb_3__2449ad7fa0cb229053b628f1e43c1a56','image-optimize-queue','image-thumbnails/brandLogo/image-thumb__3__auto_6eff904a1a9a57680d726da3d5459ac7/levi.png',0,1614075788,1614680588),('thumb_3__f97a0546f982576db6f910d58ee81a96','image-optimize-queue','image-thumbnails/brandLogo/image-thumb__3__pimcore-system-treepreview/levi.jpg',0,1614075781,1614680581),('thumb_5__41057175062a96f79edc60e1b5a78806','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__5__pimcore-system-treepreview/kurti6.jpg',0,1614095825,1614700625),('thumb_5__67b819ec527bc8ab66ecb54f52d97628','image-optimize-queue','image-thumbnails/_default_upload_bucket/image-thumb__5__auto_6eff904a1a9a57680d726da3d5459ac7/kurti6.png',0,1614095825,1614700625);
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
INSERT INTO `translations_admin` VALUES (':','cs','',1614094501,1614094501),(':','de','',1614094501,1614094501),(':','en','',1614094501,1614094501),(':','es','',1614094501,1614094501),(':','fa','',1614094501,1614094501),(':','fr','',1614094501,1614094501),(':','hu','',1614094501,1614094501),(':','it','',1614094501,1614094501),(':','ja','',1614094501,1614094501),(':','nl','',1614094501,1614094501),(':','pl','',1614094501,1614094501),(':','pt_BR','',1614094501,1614094501),(':','ru','',1614094501,1614094501),(':','sk','',1614094501,1614094501),(':','sv','',1614094501,1614094501),(':','sv_FI','',1614094501,1614094501),(':','th','',1614094501,1614094501),(':','tr','',1614094501,1614094501),(':','uk','',1614094501,1614094501),(':','zh_Hans','',1614094501,1614094501),('Afghanistan','cs','',1614095566,1614095566),('Afghanistan','de','',1614095566,1614095566),('Afghanistan','en','',1614095566,1614095566),('Afghanistan','es','',1614095566,1614095566),('Afghanistan','fa','',1614095566,1614095566),('Afghanistan','fr','',1614095566,1614095566),('Afghanistan','hu','',1614095566,1614095566),('Afghanistan','it','',1614095566,1614095566),('Afghanistan','ja','',1614095566,1614095566),('Afghanistan','nl','',1614095566,1614095566),('Afghanistan','pl','',1614095566,1614095566),('Afghanistan','pt_BR','',1614095566,1614095566),('Afghanistan','ru','',1614095566,1614095566),('Afghanistan','sk','',1614095566,1614095566),('Afghanistan','sv','',1614095566,1614095566),('Afghanistan','sv_FI','',1614095566,1614095566),('Afghanistan','th','',1614095566,1614095566),('Afghanistan','tr','',1614095566,1614095566),('Afghanistan','uk','',1614095566,1614095566),('Afghanistan','zh_Hans','',1614095566,1614095566),('Albania','cs','',1614095566,1614095566),('Albania','de','',1614095566,1614095566),('Albania','en','',1614095566,1614095566),('Albania','es','',1614095566,1614095566),('Albania','fa','',1614095566,1614095566),('Albania','fr','',1614095566,1614095566),('Albania','hu','',1614095566,1614095566),('Albania','it','',1614095566,1614095566),('Albania','ja','',1614095566,1614095566),('Albania','nl','',1614095566,1614095566),('Albania','pl','',1614095566,1614095566),('Albania','pt_BR','',1614095566,1614095566),('Albania','ru','',1614095566,1614095566),('Albania','sk','',1614095566,1614095566),('Albania','sv','',1614095566,1614095566),('Albania','sv_FI','',1614095566,1614095566),('Albania','th','',1614095566,1614095566),('Albania','tr','',1614095566,1614095566),('Albania','uk','',1614095566,1614095566),('Albania','zh_Hans','',1614095566,1614095566),('Algeria','cs','',1614095566,1614095566),('Algeria','de','',1614095566,1614095566),('Algeria','en','',1614095566,1614095566),('Algeria','es','',1614095566,1614095566),('Algeria','fa','',1614095566,1614095566),('Algeria','fr','',1614095566,1614095566),('Algeria','hu','',1614095566,1614095566),('Algeria','it','',1614095566,1614095566),('Algeria','ja','',1614095566,1614095566),('Algeria','nl','',1614095566,1614095566),('Algeria','pl','',1614095566,1614095566),('Algeria','pt_BR','',1614095566,1614095566),('Algeria','ru','',1614095566,1614095566),('Algeria','sk','',1614095566,1614095566),('Algeria','sv','',1614095566,1614095566),('Algeria','sv_FI','',1614095566,1614095566),('Algeria','th','',1614095566,1614095566),('Algeria','tr','',1614095566,1614095566),('Algeria','uk','',1614095566,1614095566),('Algeria','zh_Hans','',1614095566,1614095566),('American Samoa','cs','',1614095566,1614095566),('American Samoa','de','',1614095566,1614095566),('American Samoa','en','',1614095566,1614095566),('American Samoa','es','',1614095566,1614095566),('American Samoa','fa','',1614095566,1614095566),('American Samoa','fr','',1614095566,1614095566),('American Samoa','hu','',1614095566,1614095566),('American Samoa','it','',1614095566,1614095566),('American Samoa','ja','',1614095566,1614095566),('American Samoa','nl','',1614095566,1614095566),('American Samoa','pl','',1614095566,1614095566),('American Samoa','pt_BR','',1614095566,1614095566),('American Samoa','ru','',1614095566,1614095566),('American Samoa','sk','',1614095566,1614095566),('American Samoa','sv','',1614095566,1614095566),('American Samoa','sv_FI','',1614095566,1614095566),('American Samoa','th','',1614095566,1614095566),('American Samoa','tr','',1614095566,1614095566),('American Samoa','uk','',1614095566,1614095566),('American Samoa','zh_Hans','',1614095566,1614095566),('Anarkali suits','cs','',1614096676,1614096676),('Anarkali suits','de','',1614096676,1614096676),('Anarkali suits','en','',1614096676,1614096676),('Anarkali suits','es','',1614096676,1614096676),('Anarkali suits','fa','',1614096676,1614096676),('Anarkali suits','fr','',1614096676,1614096676),('Anarkali suits','hu','',1614096676,1614096676),('Anarkali suits','it','',1614096676,1614096676),('Anarkali suits','ja','',1614096676,1614096676),('Anarkali suits','nl','',1614096676,1614096676),('Anarkali suits','pl','',1614096676,1614096676),('Anarkali suits','pt_BR','',1614096676,1614096676),('Anarkali suits','ru','',1614096676,1614096676),('Anarkali suits','sk','',1614096676,1614096676),('Anarkali suits','sv','',1614096676,1614096676),('Anarkali suits','sv_FI','',1614096676,1614096676),('Anarkali suits','th','',1614096676,1614096676),('Anarkali suits','tr','',1614096676,1614096676),('Anarkali suits','uk','',1614096676,1614096676),('Anarkali suits','zh_Hans','',1614096676,1614096676),('Andorra','cs','',1614095566,1614095566),('Andorra','de','',1614095566,1614095566),('Andorra','en','',1614095566,1614095566),('Andorra','es','',1614095566,1614095566),('Andorra','fa','',1614095566,1614095566),('Andorra','fr','',1614095566,1614095566),('Andorra','hu','',1614095566,1614095566),('Andorra','it','',1614095566,1614095566),('Andorra','ja','',1614095566,1614095566),('Andorra','nl','',1614095566,1614095566),('Andorra','pl','',1614095566,1614095566),('Andorra','pt_BR','',1614095566,1614095566),('Andorra','ru','',1614095566,1614095566),('Andorra','sk','',1614095566,1614095566),('Andorra','sv','',1614095566,1614095566),('Andorra','sv_FI','',1614095566,1614095566),('Andorra','th','',1614095566,1614095566),('Andorra','tr','',1614095566,1614095566),('Andorra','uk','',1614095566,1614095566),('Andorra','zh_Hans','',1614095566,1614095566),('Angola','cs','',1614095567,1614095567),('Angola','de','',1614095567,1614095567),('Angola','en','',1614095567,1614095567),('Angola','es','',1614095567,1614095567),('Angola','fa','',1614095567,1614095567),('Angola','fr','',1614095567,1614095567),('Angola','hu','',1614095567,1614095567),('Angola','it','',1614095567,1614095567),('Angola','ja','',1614095567,1614095567),('Angola','nl','',1614095567,1614095567),('Angola','pl','',1614095567,1614095567),('Angola','pt_BR','',1614095567,1614095567),('Angola','ru','',1614095567,1614095567),('Angola','sk','',1614095567,1614095567),('Angola','sv','',1614095567,1614095567),('Angola','sv_FI','',1614095567,1614095567),('Angola','th','',1614095567,1614095567),('Angola','tr','',1614095567,1614095567),('Angola','uk','',1614095567,1614095567),('Angola','zh_Hans','',1614095567,1614095567),('Anguilla','cs','',1614095567,1614095567),('Anguilla','de','',1614095567,1614095567),('Anguilla','en','',1614095567,1614095567),('Anguilla','es','',1614095567,1614095567),('Anguilla','fa','',1614095567,1614095567),('Anguilla','fr','',1614095567,1614095567),('Anguilla','hu','',1614095567,1614095567),('Anguilla','it','',1614095567,1614095567),('Anguilla','ja','',1614095567,1614095567),('Anguilla','nl','',1614095567,1614095567),('Anguilla','pl','',1614095567,1614095567),('Anguilla','pt_BR','',1614095567,1614095567),('Anguilla','ru','',1614095567,1614095567),('Anguilla','sk','',1614095567,1614095567),('Anguilla','sv','',1614095567,1614095567),('Anguilla','sv_FI','',1614095567,1614095567),('Anguilla','th','',1614095567,1614095567),('Anguilla','tr','',1614095567,1614095567),('Anguilla','uk','',1614095567,1614095567),('Anguilla','zh_Hans','',1614095567,1614095567),('Antarctica','cs','',1614095567,1614095567),('Antarctica','de','',1614095567,1614095567),('Antarctica','en','',1614095567,1614095567),('Antarctica','es','',1614095567,1614095567),('Antarctica','fa','',1614095567,1614095567),('Antarctica','fr','',1614095567,1614095567),('Antarctica','hu','',1614095567,1614095567),('Antarctica','it','',1614095567,1614095567),('Antarctica','ja','',1614095567,1614095567),('Antarctica','nl','',1614095567,1614095567),('Antarctica','pl','',1614095567,1614095567),('Antarctica','pt_BR','',1614095567,1614095567),('Antarctica','ru','',1614095567,1614095567),('Antarctica','sk','',1614095567,1614095567),('Antarctica','sv','',1614095567,1614095567),('Antarctica','sv_FI','',1614095567,1614095567),('Antarctica','th','',1614095567,1614095567),('Antarctica','tr','',1614095567,1614095567),('Antarctica','uk','',1614095567,1614095567),('Antarctica','zh_Hans','',1614095567,1614095567),('Antigua & Barbuda','cs','',1614095567,1614095567),('Antigua & Barbuda','de','',1614095567,1614095567),('Antigua & Barbuda','en','',1614095567,1614095567),('Antigua & Barbuda','es','',1614095567,1614095567),('Antigua & Barbuda','fa','',1614095567,1614095567),('Antigua & Barbuda','fr','',1614095567,1614095567),('Antigua & Barbuda','hu','',1614095567,1614095567),('Antigua & Barbuda','it','',1614095567,1614095567),('Antigua & Barbuda','ja','',1614095567,1614095567),('Antigua & Barbuda','nl','',1614095567,1614095567),('Antigua & Barbuda','pl','',1614095567,1614095567),('Antigua & Barbuda','pt_BR','',1614095567,1614095567),('Antigua & Barbuda','ru','',1614095567,1614095567),('Antigua & Barbuda','sk','',1614095567,1614095567),('Antigua & Barbuda','sv','',1614095567,1614095567),('Antigua & Barbuda','sv_FI','',1614095567,1614095567),('Antigua & Barbuda','th','',1614095567,1614095567),('Antigua & Barbuda','tr','',1614095567,1614095567),('Antigua & Barbuda','uk','',1614095567,1614095567),('Antigua & Barbuda','zh_Hans','',1614095567,1614095567),('Argentina','cs','',1614095567,1614095567),('Argentina','de','',1614095567,1614095567),('Argentina','en','',1614095567,1614095567),('Argentina','es','',1614095567,1614095567),('Argentina','fa','',1614095567,1614095567),('Argentina','fr','',1614095567,1614095567),('Argentina','hu','',1614095567,1614095567),('Argentina','it','',1614095567,1614095567),('Argentina','ja','',1614095567,1614095567),('Argentina','nl','',1614095567,1614095567),('Argentina','pl','',1614095567,1614095567),('Argentina','pt_BR','',1614095567,1614095567),('Argentina','ru','',1614095567,1614095567),('Argentina','sk','',1614095567,1614095567),('Argentina','sv','',1614095567,1614095567),('Argentina','sv_FI','',1614095567,1614095567),('Argentina','th','',1614095567,1614095567),('Argentina','tr','',1614095567,1614095567),('Argentina','uk','',1614095567,1614095567),('Argentina','zh_Hans','',1614095567,1614095567),('Armenia','cs','',1614095567,1614095567),('Armenia','de','',1614095567,1614095567),('Armenia','en','',1614095567,1614095567),('Armenia','es','',1614095567,1614095567),('Armenia','fa','',1614095567,1614095567),('Armenia','fr','',1614095567,1614095567),('Armenia','hu','',1614095567,1614095567),('Armenia','it','',1614095567,1614095567),('Armenia','ja','',1614095567,1614095567),('Armenia','nl','',1614095567,1614095567),('Armenia','pl','',1614095567,1614095567),('Armenia','pt_BR','',1614095567,1614095567),('Armenia','ru','',1614095567,1614095567),('Armenia','sk','',1614095567,1614095567),('Armenia','sv','',1614095567,1614095567),('Armenia','sv_FI','',1614095567,1614095567),('Armenia','th','',1614095567,1614095567),('Armenia','tr','',1614095567,1614095567),('Armenia','uk','',1614095567,1614095567),('Armenia','zh_Hans','',1614095567,1614095567),('Aruba','cs','',1614095567,1614095567),('Aruba','de','',1614095567,1614095567),('Aruba','en','',1614095567,1614095567),('Aruba','es','',1614095567,1614095567),('Aruba','fa','',1614095567,1614095567),('Aruba','fr','',1614095567,1614095567),('Aruba','hu','',1614095567,1614095567),('Aruba','it','',1614095567,1614095567),('Aruba','ja','',1614095567,1614095567),('Aruba','nl','',1614095567,1614095567),('Aruba','pl','',1614095567,1614095567),('Aruba','pt_BR','',1614095567,1614095567),('Aruba','ru','',1614095567,1614095567),('Aruba','sk','',1614095567,1614095567),('Aruba','sv','',1614095567,1614095567),('Aruba','sv_FI','',1614095567,1614095567),('Aruba','th','',1614095567,1614095567),('Aruba','tr','',1614095567,1614095567),('Aruba','uk','',1614095567,1614095567),('Aruba','zh_Hans','',1614095567,1614095567),('Australia','cs','',1614095567,1614095567),('Australia','de','',1614095567,1614095567),('Australia','en','',1614095567,1614095567),('Australia','es','',1614095567,1614095567),('Australia','fa','',1614095567,1614095567),('Australia','fr','',1614095567,1614095567),('Australia','hu','',1614095567,1614095567),('Australia','it','',1614095567,1614095567),('Australia','ja','',1614095567,1614095567),('Australia','nl','',1614095567,1614095567),('Australia','pl','',1614095567,1614095567),('Australia','pt_BR','',1614095567,1614095567),('Australia','ru','',1614095567,1614095567),('Australia','sk','',1614095567,1614095567),('Australia','sv','',1614095567,1614095567),('Australia','sv_FI','',1614095567,1614095567),('Australia','th','',1614095567,1614095567),('Australia','tr','',1614095567,1614095567),('Australia','uk','',1614095567,1614095567),('Australia','zh_Hans','',1614095567,1614095567),('Austria','cs','',1614095567,1614095567),('Austria','de','',1614095567,1614095567),('Austria','en','',1614095567,1614095567),('Austria','es','',1614095567,1614095567),('Austria','fa','',1614095567,1614095567),('Austria','fr','',1614095567,1614095567),('Austria','hu','',1614095567,1614095567),('Austria','it','',1614095567,1614095567),('Austria','ja','',1614095567,1614095567),('Austria','nl','',1614095567,1614095567),('Austria','pl','',1614095567,1614095567),('Austria','pt_BR','',1614095567,1614095567),('Austria','ru','',1614095567,1614095567),('Austria','sk','',1614095567,1614095567),('Austria','sv','',1614095567,1614095567),('Austria','sv_FI','',1614095567,1614095567),('Austria','th','',1614095567,1614095567),('Austria','tr','',1614095567,1614095567),('Austria','uk','',1614095567,1614095567),('Austria','zh_Hans','',1614095567,1614095567),('Azerbaijan','cs','',1614095567,1614095567),('Azerbaijan','de','',1614095567,1614095567),('Azerbaijan','en','',1614095567,1614095567),('Azerbaijan','es','',1614095567,1614095567),('Azerbaijan','fa','',1614095567,1614095567),('Azerbaijan','fr','',1614095567,1614095567),('Azerbaijan','hu','',1614095567,1614095567),('Azerbaijan','it','',1614095567,1614095567),('Azerbaijan','ja','',1614095567,1614095567),('Azerbaijan','nl','',1614095567,1614095567),('Azerbaijan','pl','',1614095567,1614095567),('Azerbaijan','pt_BR','',1614095567,1614095567),('Azerbaijan','ru','',1614095567,1614095567),('Azerbaijan','sk','',1614095567,1614095567),('Azerbaijan','sv','',1614095567,1614095567),('Azerbaijan','sv_FI','',1614095567,1614095567),('Azerbaijan','th','',1614095567,1614095567),('Azerbaijan','tr','',1614095567,1614095567),('Azerbaijan','uk','',1614095567,1614095567),('Azerbaijan','zh_Hans','',1614095567,1614095567),('Bahamas','cs','',1614095568,1614095568),('Bahamas','de','',1614095568,1614095568),('Bahamas','en','',1614095568,1614095568),('Bahamas','es','',1614095568,1614095568),('Bahamas','fa','',1614095568,1614095568),('Bahamas','fr','',1614095568,1614095568),('Bahamas','hu','',1614095568,1614095568),('Bahamas','it','',1614095568,1614095568),('Bahamas','ja','',1614095568,1614095568),('Bahamas','nl','',1614095568,1614095568),('Bahamas','pl','',1614095568,1614095568),('Bahamas','pt_BR','',1614095568,1614095568),('Bahamas','ru','',1614095568,1614095568),('Bahamas','sk','',1614095568,1614095568),('Bahamas','sv','',1614095568,1614095568),('Bahamas','sv_FI','',1614095568,1614095568),('Bahamas','th','',1614095568,1614095568),('Bahamas','tr','',1614095568,1614095568),('Bahamas','uk','',1614095568,1614095568),('Bahamas','zh_Hans','',1614095568,1614095568),('Bahrain','cs','',1614095568,1614095568),('Bahrain','de','',1614095568,1614095568),('Bahrain','en','',1614095568,1614095568),('Bahrain','es','',1614095568,1614095568),('Bahrain','fa','',1614095568,1614095568),('Bahrain','fr','',1614095568,1614095568),('Bahrain','hu','',1614095568,1614095568),('Bahrain','it','',1614095568,1614095568),('Bahrain','ja','',1614095568,1614095568),('Bahrain','nl','',1614095568,1614095568),('Bahrain','pl','',1614095568,1614095568),('Bahrain','pt_BR','',1614095568,1614095568),('Bahrain','ru','',1614095568,1614095568),('Bahrain','sk','',1614095568,1614095568),('Bahrain','sv','',1614095568,1614095568),('Bahrain','sv_FI','',1614095568,1614095568),('Bahrain','th','',1614095568,1614095568),('Bahrain','tr','',1614095568,1614095568),('Bahrain','uk','',1614095568,1614095568),('Bahrain','zh_Hans','',1614095568,1614095568),('Bangla','cs','',1614095591,1614095591),('Bangla','de','',1614095591,1614095591),('Bangla','en','',1614095591,1614095591),('Bangla','es','',1614095591,1614095591),('Bangla','fa','',1614095591,1614095591),('Bangla','fr','',1614095591,1614095591),('Bangla','hu','',1614095591,1614095591),('Bangla','it','',1614095591,1614095591),('Bangla','ja','',1614095591,1614095591),('Bangla','nl','',1614095591,1614095591),('Bangla','pl','',1614095591,1614095591),('Bangla','pt_BR','',1614095591,1614095591),('Bangla','ru','',1614095591,1614095591),('Bangla','sk','',1614095591,1614095591),('Bangla','sv','',1614095591,1614095591),('Bangla','sv_FI','',1614095591,1614095591),('Bangla','th','',1614095591,1614095591),('Bangla','tr','',1614095591,1614095591),('Bangla','uk','',1614095591,1614095591),('Bangla','zh_Hans','',1614095591,1614095591),('Bangladesh','cs','',1614095568,1614095568),('Bangladesh','de','',1614095568,1614095568),('Bangladesh','en','',1614095568,1614095568),('Bangladesh','es','',1614095568,1614095568),('Bangladesh','fa','',1614095568,1614095568),('Bangladesh','fr','',1614095568,1614095568),('Bangladesh','hu','',1614095568,1614095568),('Bangladesh','it','',1614095568,1614095568),('Bangladesh','ja','',1614095568,1614095568),('Bangladesh','nl','',1614095568,1614095568),('Bangladesh','pl','',1614095568,1614095568),('Bangladesh','pt_BR','',1614095568,1614095568),('Bangladesh','ru','',1614095568,1614095568),('Bangladesh','sk','',1614095568,1614095568),('Bangladesh','sv','',1614095568,1614095568),('Bangladesh','sv_FI','',1614095568,1614095568),('Bangladesh','th','',1614095568,1614095568),('Bangladesh','tr','',1614095568,1614095568),('Bangladesh','uk','',1614095568,1614095568),('Bangladesh','zh_Hans','',1614095568,1614095568),('Barbados','cs','',1614095568,1614095568),('Barbados','de','',1614095568,1614095568),('Barbados','en','',1614095568,1614095568),('Barbados','es','',1614095568,1614095568),('Barbados','fa','',1614095568,1614095568),('Barbados','fr','',1614095568,1614095568),('Barbados','hu','',1614095568,1614095568),('Barbados','it','',1614095568,1614095568),('Barbados','ja','',1614095568,1614095568),('Barbados','nl','',1614095568,1614095568),('Barbados','pl','',1614095568,1614095568),('Barbados','pt_BR','',1614095568,1614095568),('Barbados','ru','',1614095568,1614095568),('Barbados','sk','',1614095568,1614095568),('Barbados','sv','',1614095568,1614095568),('Barbados','sv_FI','',1614095568,1614095568),('Barbados','th','',1614095568,1614095568),('Barbados','tr','',1614095568,1614095568),('Barbados','uk','',1614095568,1614095568),('Barbados','zh_Hans','',1614095568,1614095568),('Belarus','cs','',1614095568,1614095568),('Belarus','de','',1614095568,1614095568),('Belarus','en','',1614095568,1614095568),('Belarus','es','',1614095568,1614095568),('Belarus','fa','',1614095568,1614095568),('Belarus','fr','',1614095568,1614095568),('Belarus','hu','',1614095568,1614095568),('Belarus','it','',1614095568,1614095568),('Belarus','ja','',1614095568,1614095568),('Belarus','nl','',1614095568,1614095568),('Belarus','pl','',1614095568,1614095568),('Belarus','pt_BR','',1614095568,1614095568),('Belarus','ru','',1614095568,1614095568),('Belarus','sk','',1614095568,1614095568),('Belarus','sv','',1614095568,1614095568),('Belarus','sv_FI','',1614095568,1614095568),('Belarus','th','',1614095568,1614095568),('Belarus','tr','',1614095568,1614095568),('Belarus','uk','',1614095568,1614095568),('Belarus','zh_Hans','',1614095568,1614095568),('Belgium','cs','',1614095568,1614095568),('Belgium','de','',1614095568,1614095568),('Belgium','en','',1614095568,1614095568),('Belgium','es','',1614095568,1614095568),('Belgium','fa','',1614095568,1614095568),('Belgium','fr','',1614095568,1614095568),('Belgium','hu','',1614095568,1614095568),('Belgium','it','',1614095568,1614095568),('Belgium','ja','',1614095568,1614095568),('Belgium','nl','',1614095568,1614095568),('Belgium','pl','',1614095568,1614095568),('Belgium','pt_BR','',1614095568,1614095568),('Belgium','ru','',1614095568,1614095568),('Belgium','sk','',1614095568,1614095568),('Belgium','sv','',1614095568,1614095568),('Belgium','sv_FI','',1614095568,1614095568),('Belgium','th','',1614095568,1614095568),('Belgium','tr','',1614095568,1614095568),('Belgium','uk','',1614095568,1614095568),('Belgium','zh_Hans','',1614095568,1614095568),('Belize','cs','',1614095568,1614095568),('Belize','de','',1614095568,1614095568),('Belize','en','',1614095568,1614095568),('Belize','es','',1614095568,1614095568),('Belize','fa','',1614095568,1614095568),('Belize','fr','',1614095568,1614095568),('Belize','hu','',1614095568,1614095568),('Belize','it','',1614095568,1614095568),('Belize','ja','',1614095568,1614095568),('Belize','nl','',1614095568,1614095568),('Belize','pl','',1614095568,1614095568),('Belize','pt_BR','',1614095568,1614095568),('Belize','ru','',1614095568,1614095568),('Belize','sk','',1614095568,1614095568),('Belize','sv','',1614095568,1614095568),('Belize','sv_FI','',1614095568,1614095568),('Belize','th','',1614095568,1614095568),('Belize','tr','',1614095568,1614095568),('Belize','uk','',1614095568,1614095568),('Belize','zh_Hans','',1614095568,1614095568),('Benin','cs','',1614095568,1614095568),('Benin','de','',1614095568,1614095568),('Benin','en','',1614095568,1614095568),('Benin','es','',1614095568,1614095568),('Benin','fa','',1614095568,1614095568),('Benin','fr','',1614095568,1614095568),('Benin','hu','',1614095568,1614095568),('Benin','it','',1614095568,1614095568),('Benin','ja','',1614095568,1614095568),('Benin','nl','',1614095568,1614095568),('Benin','pl','',1614095568,1614095568),('Benin','pt_BR','',1614095568,1614095568),('Benin','ru','',1614095568,1614095568),('Benin','sk','',1614095568,1614095568),('Benin','sv','',1614095568,1614095568),('Benin','sv_FI','',1614095568,1614095568),('Benin','th','',1614095568,1614095568),('Benin','tr','',1614095568,1614095568),('Benin','uk','',1614095568,1614095568),('Benin','zh_Hans','',1614095568,1614095568),('Bermuda','cs','',1614095568,1614095568),('Bermuda','de','',1614095568,1614095568),('Bermuda','en','',1614095568,1614095568),('Bermuda','es','',1614095568,1614095568),('Bermuda','fa','',1614095568,1614095568),('Bermuda','fr','',1614095568,1614095568),('Bermuda','hu','',1614095568,1614095568),('Bermuda','it','',1614095568,1614095568),('Bermuda','ja','',1614095568,1614095568),('Bermuda','nl','',1614095568,1614095568),('Bermuda','pl','',1614095568,1614095568),('Bermuda','pt_BR','',1614095568,1614095568),('Bermuda','ru','',1614095568,1614095568),('Bermuda','sk','',1614095568,1614095568),('Bermuda','sv','',1614095568,1614095568),('Bermuda','sv_FI','',1614095568,1614095568),('Bermuda','th','',1614095568,1614095568),('Bermuda','tr','',1614095568,1614095568),('Bermuda','uk','',1614095568,1614095568),('Bermuda','zh_Hans','',1614095568,1614095568),('Bhutan','cs','',1614095568,1614095568),('Bhutan','de','',1614095568,1614095568),('Bhutan','en','',1614095568,1614095568),('Bhutan','es','',1614095568,1614095568),('Bhutan','fa','',1614095568,1614095568),('Bhutan','fr','',1614095568,1614095568),('Bhutan','hu','',1614095568,1614095568),('Bhutan','it','',1614095568,1614095568),('Bhutan','ja','',1614095568,1614095568),('Bhutan','nl','',1614095568,1614095568),('Bhutan','pl','',1614095568,1614095568),('Bhutan','pt_BR','',1614095568,1614095568),('Bhutan','ru','',1614095568,1614095568),('Bhutan','sk','',1614095568,1614095568),('Bhutan','sv','',1614095568,1614095568),('Bhutan','sv_FI','',1614095568,1614095568),('Bhutan','th','',1614095568,1614095568),('Bhutan','tr','',1614095568,1614095568),('Bhutan','uk','',1614095568,1614095568),('Bhutan','zh_Hans','',1614095568,1614095568),('Bleach Wash','cs','',1614088789,1614088789),('Bleach Wash','de','',1614088789,1614088789),('Bleach Wash','en','',1614088789,1614088789),('Bleach Wash','es','',1614088789,1614088789),('Bleach Wash','fa','',1614088789,1614088789),('Bleach Wash','fr','',1614088789,1614088789),('Bleach Wash','hu','',1614088789,1614088789),('Bleach Wash','it','',1614088789,1614088789),('Bleach Wash','ja','',1614088789,1614088789),('Bleach Wash','nl','',1614088789,1614088789),('Bleach Wash','pl','',1614088789,1614088789),('Bleach Wash','pt_BR','',1614088789,1614088789),('Bleach Wash','ru','',1614088789,1614088789),('Bleach Wash','sk','',1614088789,1614088789),('Bleach Wash','sv','',1614088789,1614088789),('Bleach Wash','sv_FI','',1614088789,1614088789),('Bleach Wash','th','',1614088789,1614088789),('Bleach Wash','tr','',1614088789,1614088789),('Bleach Wash','uk','',1614088789,1614088789),('Bleach Wash','zh_Hans','',1614088789,1614088789),('Boat Neck','cs','',1614096674,1614096674),('Boat Neck','de','',1614096674,1614096674),('Boat Neck','en','',1614096674,1614096674),('Boat Neck','es','',1614096674,1614096674),('Boat Neck','fa','',1614096674,1614096674),('Boat Neck','fr','',1614096674,1614096674),('Boat Neck','hu','',1614096674,1614096674),('Boat Neck','it','',1614096674,1614096674),('Boat Neck','ja','',1614096674,1614096674),('Boat Neck','nl','',1614096674,1614096674),('Boat Neck','pl','',1614096674,1614096674),('Boat Neck','pt_BR','',1614096674,1614096674),('Boat Neck','ru','',1614096674,1614096674),('Boat Neck','sk','',1614096674,1614096674),('Boat Neck','sv','',1614096674,1614096674),('Boat Neck','sv_FI','',1614096674,1614096674),('Boat Neck','th','',1614096674,1614096674),('Boat Neck','tr','',1614096674,1614096674),('Boat Neck','uk','',1614096674,1614096674),('Boat Neck','zh_Hans','',1614096674,1614096674),('Bolivia','cs','',1614095569,1614095569),('Bolivia','de','',1614095569,1614095569),('Bolivia','en','',1614095569,1614095569),('Bolivia','es','',1614095569,1614095569),('Bolivia','fa','',1614095569,1614095569),('Bolivia','fr','',1614095569,1614095569),('Bolivia','hu','',1614095569,1614095569),('Bolivia','it','',1614095569,1614095569),('Bolivia','ja','',1614095569,1614095569),('Bolivia','nl','',1614095569,1614095569),('Bolivia','pl','',1614095569,1614095569),('Bolivia','pt_BR','',1614095569,1614095569),('Bolivia','ru','',1614095569,1614095569),('Bolivia','sk','',1614095569,1614095569),('Bolivia','sv','',1614095569,1614095569),('Bolivia','sv_FI','',1614095569,1614095569),('Bolivia','th','',1614095569,1614095569),('Bolivia','tr','',1614095569,1614095569),('Bolivia','uk','',1614095569,1614095569),('Bolivia','zh_Hans','',1614095569,1614095569),('Bosnia & Herzegovina','cs','',1614095569,1614095569),('Bosnia & Herzegovina','de','',1614095569,1614095569),('Bosnia & Herzegovina','en','',1614095569,1614095569),('Bosnia & Herzegovina','es','',1614095569,1614095569),('Bosnia & Herzegovina','fa','',1614095569,1614095569),('Bosnia & Herzegovina','fr','',1614095569,1614095569),('Bosnia & Herzegovina','hu','',1614095569,1614095569),('Bosnia & Herzegovina','it','',1614095569,1614095569),('Bosnia & Herzegovina','ja','',1614095569,1614095569),('Bosnia & Herzegovina','nl','',1614095569,1614095569),('Bosnia & Herzegovina','pl','',1614095569,1614095569),('Bosnia & Herzegovina','pt_BR','',1614095569,1614095569),('Bosnia & Herzegovina','ru','',1614095569,1614095569),('Bosnia & Herzegovina','sk','',1614095569,1614095569),('Bosnia & Herzegovina','sv','',1614095569,1614095569),('Bosnia & Herzegovina','sv_FI','',1614095569,1614095569),('Bosnia & Herzegovina','th','',1614095569,1614095569),('Bosnia & Herzegovina','tr','',1614095569,1614095569),('Bosnia & Herzegovina','uk','',1614095569,1614095569),('Bosnia & Herzegovina','zh_Hans','',1614095569,1614095569),('Botswana','cs','',1614095569,1614095569),('Botswana','de','',1614095569,1614095569),('Botswana','en','',1614095569,1614095569),('Botswana','es','',1614095569,1614095569),('Botswana','fa','',1614095569,1614095569),('Botswana','fr','',1614095569,1614095569),('Botswana','hu','',1614095569,1614095569),('Botswana','it','',1614095569,1614095569),('Botswana','ja','',1614095569,1614095569),('Botswana','nl','',1614095569,1614095569),('Botswana','pl','',1614095569,1614095569),('Botswana','pt_BR','',1614095569,1614095569),('Botswana','ru','',1614095569,1614095569),('Botswana','sk','',1614095569,1614095569),('Botswana','sv','',1614095569,1614095569),('Botswana','sv_FI','',1614095569,1614095569),('Botswana','th','',1614095569,1614095569),('Botswana','tr','',1614095569,1614095569),('Botswana','uk','',1614095569,1614095569),('Botswana','zh_Hans','',1614095569,1614095569),('Bouvet Island','cs','',1614095569,1614095569),('Bouvet Island','de','',1614095569,1614095569),('Bouvet Island','en','',1614095569,1614095569),('Bouvet Island','es','',1614095569,1614095569),('Bouvet Island','fa','',1614095569,1614095569),('Bouvet Island','fr','',1614095569,1614095569),('Bouvet Island','hu','',1614095569,1614095569),('Bouvet Island','it','',1614095569,1614095569),('Bouvet Island','ja','',1614095569,1614095569),('Bouvet Island','nl','',1614095569,1614095569),('Bouvet Island','pl','',1614095569,1614095569),('Bouvet Island','pt_BR','',1614095569,1614095569),('Bouvet Island','ru','',1614095569,1614095569),('Bouvet Island','sk','',1614095569,1614095569),('Bouvet Island','sv','',1614095569,1614095569),('Bouvet Island','sv_FI','',1614095569,1614095569),('Bouvet Island','th','',1614095569,1614095569),('Bouvet Island','tr','',1614095569,1614095569),('Bouvet Island','uk','',1614095569,1614095569),('Bouvet Island','zh_Hans','',1614095569,1614095569),('Brand','cs','',1614095566,1614095566),('Brand','de','',1614095566,1614095566),('Brand','en','',1614095566,1614095566),('Brand','es','',1614095566,1614095566),('Brand','fa','',1614095566,1614095566),('Brand','fr','',1614095566,1614095566),('Brand','hu','',1614095566,1614095566),('Brand','it','',1614095566,1614095566),('Brand','ja','',1614095566,1614095566),('Brand','nl','',1614095566,1614095566),('Brand','pl','',1614095566,1614095566),('Brand','pt_BR','',1614095566,1614095566),('Brand','ru','',1614095566,1614095566),('Brand','sk','',1614095566,1614095566),('Brand','sv','',1614095566,1614095566),('Brand','sv_FI','',1614095566,1614095566),('Brand','th','',1614095566,1614095566),('Brand','tr','',1614095566,1614095566),('Brand','uk','',1614095566,1614095566),('Brand','zh_Hans','',1614095566,1614095566),('Brand Logo','cs','',1614075467,1614075467),('Brand Logo','de','',1614075467,1614075467),('Brand Logo','en','',1614075467,1614075467),('Brand Logo','es','',1614075467,1614075467),('Brand Logo','fa','',1614075467,1614075467),('Brand Logo','fr','',1614075467,1614075467),('Brand Logo','hu','',1614075467,1614075467),('Brand Logo','it','',1614075467,1614075467),('Brand Logo','ja','',1614075467,1614075467),('Brand Logo','nl','',1614075467,1614075467),('Brand Logo','pl','',1614075467,1614075467),('Brand Logo','pt_BR','',1614075467,1614075467),('Brand Logo','ru','',1614075467,1614075467),('Brand Logo','sk','',1614075467,1614075467),('Brand Logo','sv','',1614075467,1614075467),('Brand Logo','sv_FI','',1614075467,1614075467),('Brand Logo','th','',1614075467,1614075467),('Brand Logo','tr','',1614075467,1614075467),('Brand Logo','uk','',1614075467,1614075467),('Brand Logo','zh_Hans','',1614075467,1614075467),('Brazil','cs','',1614095569,1614095569),('Brazil','de','',1614095569,1614095569),('Brazil','en','',1614095569,1614095569),('Brazil','es','',1614095569,1614095569),('Brazil','fa','',1614095569,1614095569),('Brazil','fr','',1614095569,1614095569),('Brazil','hu','',1614095569,1614095569),('Brazil','it','',1614095569,1614095569),('Brazil','ja','',1614095569,1614095569),('Brazil','nl','',1614095569,1614095569),('Brazil','pl','',1614095569,1614095569),('Brazil','pt_BR','',1614095569,1614095569),('Brazil','ru','',1614095569,1614095569),('Brazil','sk','',1614095569,1614095569),('Brazil','sv','',1614095569,1614095569),('Brazil','sv_FI','',1614095569,1614095569),('Brazil','th','',1614095569,1614095569),('Brazil','tr','',1614095569,1614095569),('Brazil','uk','',1614095569,1614095569),('Brazil','zh_Hans','',1614095569,1614095569),('British Indian Ocean Territory','cs','',1614095569,1614095569),('British Indian Ocean Territory','de','',1614095569,1614095569),('British Indian Ocean Territory','en','',1614095569,1614095569),('British Indian Ocean Territory','es','',1614095569,1614095569),('British Indian Ocean Territory','fa','',1614095569,1614095569),('British Indian Ocean Territory','fr','',1614095569,1614095569),('British Indian Ocean Territory','hu','',1614095569,1614095569),('British Indian Ocean Territory','it','',1614095569,1614095569),('British Indian Ocean Territory','ja','',1614095569,1614095569),('British Indian Ocean Territory','nl','',1614095569,1614095569),('British Indian Ocean Territory','pl','',1614095569,1614095569),('British Indian Ocean Territory','pt_BR','',1614095569,1614095569),('British Indian Ocean Territory','ru','',1614095569,1614095569),('British Indian Ocean Territory','sk','',1614095569,1614095569),('British Indian Ocean Territory','sv','',1614095569,1614095569),('British Indian Ocean Territory','sv_FI','',1614095569,1614095569),('British Indian Ocean Territory','th','',1614095569,1614095569),('British Indian Ocean Territory','tr','',1614095569,1614095569),('British Indian Ocean Territory','uk','',1614095569,1614095569),('British Indian Ocean Territory','zh_Hans','',1614095569,1614095569),('British Virgin Islands','cs','',1614095569,1614095569),('British Virgin Islands','de','',1614095569,1614095569),('British Virgin Islands','en','',1614095569,1614095569),('British Virgin Islands','es','',1614095569,1614095569),('British Virgin Islands','fa','',1614095569,1614095569),('British Virgin Islands','fr','',1614095569,1614095569),('British Virgin Islands','hu','',1614095569,1614095569),('British Virgin Islands','it','',1614095569,1614095569),('British Virgin Islands','ja','',1614095569,1614095569),('British Virgin Islands','nl','',1614095569,1614095569),('British Virgin Islands','pl','',1614095569,1614095569),('British Virgin Islands','pt_BR','',1614095569,1614095569),('British Virgin Islands','ru','',1614095569,1614095569),('British Virgin Islands','sk','',1614095569,1614095569),('British Virgin Islands','sv','',1614095569,1614095569),('British Virgin Islands','sv_FI','',1614095569,1614095569),('British Virgin Islands','th','',1614095569,1614095569),('British Virgin Islands','tr','',1614095569,1614095569),('British Virgin Islands','uk','',1614095569,1614095569),('British Virgin Islands','zh_Hans','',1614095569,1614095569),('Brunei','cs','',1614095569,1614095569),('Brunei','de','',1614095569,1614095569),('Brunei','en','',1614095569,1614095569),('Brunei','es','',1614095569,1614095569),('Brunei','fa','',1614095569,1614095569),('Brunei','fr','',1614095569,1614095569),('Brunei','hu','',1614095569,1614095569),('Brunei','it','',1614095569,1614095569),('Brunei','ja','',1614095569,1614095569),('Brunei','nl','',1614095569,1614095569),('Brunei','pl','',1614095569,1614095569),('Brunei','pt_BR','',1614095569,1614095569),('Brunei','ru','',1614095569,1614095569),('Brunei','sk','',1614095569,1614095569),('Brunei','sv','',1614095569,1614095569),('Brunei','sv_FI','',1614095569,1614095569),('Brunei','th','',1614095569,1614095569),('Brunei','tr','',1614095569,1614095569),('Brunei','uk','',1614095569,1614095569),('Brunei','zh_Hans','',1614095569,1614095569),('Bulgaria','cs','',1614095569,1614095569),('Bulgaria','de','',1614095569,1614095569),('Bulgaria','en','',1614095569,1614095569),('Bulgaria','es','',1614095569,1614095569),('Bulgaria','fa','',1614095569,1614095569),('Bulgaria','fr','',1614095569,1614095569),('Bulgaria','hu','',1614095569,1614095569),('Bulgaria','it','',1614095569,1614095569),('Bulgaria','ja','',1614095569,1614095569),('Bulgaria','nl','',1614095569,1614095569),('Bulgaria','pl','',1614095569,1614095569),('Bulgaria','pt_BR','',1614095569,1614095569),('Bulgaria','ru','',1614095569,1614095569),('Bulgaria','sk','',1614095569,1614095569),('Bulgaria','sv','',1614095569,1614095569),('Bulgaria','sv_FI','',1614095569,1614095569),('Bulgaria','th','',1614095569,1614095569),('Bulgaria','tr','',1614095569,1614095569),('Bulgaria','uk','',1614095569,1614095569),('Bulgaria','zh_Hans','',1614095569,1614095569),('Burkina Faso','cs','',1614095570,1614095570),('Burkina Faso','de','',1614095570,1614095570),('Burkina Faso','en','',1614095570,1614095570),('Burkina Faso','es','',1614095570,1614095570),('Burkina Faso','fa','',1614095570,1614095570),('Burkina Faso','fr','',1614095570,1614095570),('Burkina Faso','hu','',1614095570,1614095570),('Burkina Faso','it','',1614095570,1614095570),('Burkina Faso','ja','',1614095570,1614095570),('Burkina Faso','nl','',1614095570,1614095570),('Burkina Faso','pl','',1614095570,1614095570),('Burkina Faso','pt_BR','',1614095570,1614095570),('Burkina Faso','ru','',1614095570,1614095570),('Burkina Faso','sk','',1614095570,1614095570),('Burkina Faso','sv','',1614095570,1614095570),('Burkina Faso','sv_FI','',1614095570,1614095570),('Burkina Faso','th','',1614095570,1614095570),('Burkina Faso','tr','',1614095570,1614095570),('Burkina Faso','uk','',1614095570,1614095570),('Burkina Faso','zh_Hans','',1614095570,1614095570),('Burundi','cs','',1614095570,1614095570),('Burundi','de','',1614095570,1614095570),('Burundi','en','',1614095570,1614095570),('Burundi','es','',1614095570,1614095570),('Burundi','fa','',1614095570,1614095570),('Burundi','fr','',1614095570,1614095570),('Burundi','hu','',1614095570,1614095570),('Burundi','it','',1614095570,1614095570),('Burundi','ja','',1614095570,1614095570),('Burundi','nl','',1614095570,1614095570),('Burundi','pl','',1614095570,1614095570),('Burundi','pt_BR','',1614095570,1614095570),('Burundi','ru','',1614095570,1614095570),('Burundi','sk','',1614095570,1614095570),('Burundi','sv','',1614095570,1614095570),('Burundi','sv_FI','',1614095570,1614095570),('Burundi','th','',1614095570,1614095570),('Burundi','tr','',1614095570,1614095570),('Burundi','uk','',1614095570,1614095570),('Burundi','zh_Hans','',1614095570,1614095570),('CSV Export','cs','',1614093259,1614093259),('CSV Export','de','',1614093259,1614093259),('CSV Export','en','',1614093259,1614093259),('CSV Export','es','',1614093259,1614093259),('CSV Export','fa','',1614093259,1614093259),('CSV Export','fr','',1614093259,1614093259),('CSV Export','hu','',1614093259,1614093259),('CSV Export','it','',1614093259,1614093259),('CSV Export','ja','',1614093259,1614093259),('CSV Export','nl','',1614093259,1614093259),('CSV Export','pl','',1614093259,1614093259),('CSV Export','pt_BR','',1614093259,1614093259),('CSV Export','ru','',1614093259,1614093259),('CSV Export','sk','',1614093259,1614093259),('CSV Export','sv','',1614093259,1614093259),('CSV Export','sv_FI','',1614093259,1614093259),('CSV Export','th','',1614093259,1614093259),('CSV Export','tr','',1614093259,1614093259),('CSV Export','uk','',1614093259,1614093259),('CSV Export','zh_Hans','',1614093259,1614093259),('Cambodia','cs','',1614095570,1614095570),('Cambodia','de','',1614095570,1614095570),('Cambodia','en','',1614095570,1614095570),('Cambodia','es','',1614095570,1614095570),('Cambodia','fa','',1614095570,1614095570),('Cambodia','fr','',1614095570,1614095570),('Cambodia','hu','',1614095570,1614095570),('Cambodia','it','',1614095570,1614095570),('Cambodia','ja','',1614095570,1614095570),('Cambodia','nl','',1614095570,1614095570),('Cambodia','pl','',1614095570,1614095570),('Cambodia','pt_BR','',1614095570,1614095570),('Cambodia','ru','',1614095570,1614095570),('Cambodia','sk','',1614095570,1614095570),('Cambodia','sv','',1614095570,1614095570),('Cambodia','sv_FI','',1614095570,1614095570),('Cambodia','th','',1614095570,1614095570),('Cambodia','tr','',1614095570,1614095570),('Cambodia','uk','',1614095570,1614095570),('Cambodia','zh_Hans','',1614095570,1614095570),('Cameroon','cs','',1614095570,1614095570),('Cameroon','de','',1614095570,1614095570),('Cameroon','en','',1614095570,1614095570),('Cameroon','es','',1614095570,1614095570),('Cameroon','fa','',1614095570,1614095570),('Cameroon','fr','',1614095570,1614095570),('Cameroon','hu','',1614095570,1614095570),('Cameroon','it','',1614095570,1614095570),('Cameroon','ja','',1614095570,1614095570),('Cameroon','nl','',1614095570,1614095570),('Cameroon','pl','',1614095570,1614095570),('Cameroon','pt_BR','',1614095570,1614095570),('Cameroon','ru','',1614095570,1614095570),('Cameroon','sk','',1614095570,1614095570),('Cameroon','sv','',1614095570,1614095570),('Cameroon','sv_FI','',1614095570,1614095570),('Cameroon','th','',1614095570,1614095570),('Cameroon','tr','',1614095570,1614095570),('Cameroon','uk','',1614095570,1614095570),('Cameroon','zh_Hans','',1614095570,1614095570),('Canada','cs','',1614095570,1614095570),('Canada','de','',1614095570,1614095570),('Canada','en','',1614095570,1614095570),('Canada','es','',1614095570,1614095570),('Canada','fa','',1614095570,1614095570),('Canada','fr','',1614095570,1614095570),('Canada','hu','',1614095570,1614095570),('Canada','it','',1614095570,1614095570),('Canada','ja','',1614095570,1614095570),('Canada','nl','',1614095570,1614095570),('Canada','pl','',1614095570,1614095570),('Canada','pt_BR','',1614095570,1614095570),('Canada','ru','',1614095570,1614095570),('Canada','sk','',1614095570,1614095570),('Canada','sv','',1614095570,1614095570),('Canada','sv_FI','',1614095570,1614095570),('Canada','th','',1614095570,1614095570),('Canada','tr','',1614095570,1614095570),('Canada','uk','',1614095570,1614095570),('Canada','zh_Hans','',1614095570,1614095570),('Cape Verde','cs','',1614095570,1614095570),('Cape Verde','de','',1614095570,1614095570),('Cape Verde','en','',1614095570,1614095570),('Cape Verde','es','',1614095570,1614095570),('Cape Verde','fa','',1614095570,1614095570),('Cape Verde','fr','',1614095570,1614095570),('Cape Verde','hu','',1614095570,1614095570),('Cape Verde','it','',1614095570,1614095570),('Cape Verde','ja','',1614095570,1614095570),('Cape Verde','nl','',1614095570,1614095570),('Cape Verde','pl','',1614095570,1614095570),('Cape Verde','pt_BR','',1614095570,1614095570),('Cape Verde','ru','',1614095570,1614095570),('Cape Verde','sk','',1614095570,1614095570),('Cape Verde','sv','',1614095570,1614095570),('Cape Verde','sv_FI','',1614095570,1614095570),('Cape Verde','th','',1614095570,1614095570),('Cape Verde','tr','',1614095570,1614095570),('Cape Verde','uk','',1614095570,1614095570),('Cape Verde','zh_Hans','',1614095570,1614095570),('Caribbean Netherlands','cs','',1614095570,1614095570),('Caribbean Netherlands','de','',1614095570,1614095570),('Caribbean Netherlands','en','',1614095570,1614095570),('Caribbean Netherlands','es','',1614095570,1614095570),('Caribbean Netherlands','fa','',1614095570,1614095570),('Caribbean Netherlands','fr','',1614095570,1614095570),('Caribbean Netherlands','hu','',1614095570,1614095570),('Caribbean Netherlands','it','',1614095570,1614095570),('Caribbean Netherlands','ja','',1614095570,1614095570),('Caribbean Netherlands','nl','',1614095570,1614095570),('Caribbean Netherlands','pl','',1614095570,1614095570),('Caribbean Netherlands','pt_BR','',1614095570,1614095570),('Caribbean Netherlands','ru','',1614095570,1614095570),('Caribbean Netherlands','sk','',1614095570,1614095570),('Caribbean Netherlands','sv','',1614095570,1614095570),('Caribbean Netherlands','sv_FI','',1614095570,1614095570),('Caribbean Netherlands','th','',1614095570,1614095570),('Caribbean Netherlands','tr','',1614095570,1614095570),('Caribbean Netherlands','uk','',1614095570,1614095570),('Caribbean Netherlands','zh_Hans','',1614095570,1614095570),('Caustic Wash','cs','',1614088789,1614088789),('Caustic Wash','de','',1614088789,1614088789),('Caustic Wash','en','',1614088789,1614088789),('Caustic Wash','es','',1614088789,1614088789),('Caustic Wash','fa','',1614088789,1614088789),('Caustic Wash','fr','',1614088789,1614088789),('Caustic Wash','hu','',1614088789,1614088789),('Caustic Wash','it','',1614088789,1614088789),('Caustic Wash','ja','',1614088789,1614088789),('Caustic Wash','nl','',1614088789,1614088789),('Caustic Wash','pl','',1614088789,1614088789),('Caustic Wash','pt_BR','',1614088789,1614088789),('Caustic Wash','ru','',1614088789,1614088789),('Caustic Wash','sk','',1614088789,1614088789),('Caustic Wash','sv','',1614088789,1614088789),('Caustic Wash','sv_FI','',1614088789,1614088789),('Caustic Wash','th','',1614088789,1614088789),('Caustic Wash','tr','',1614088789,1614088789),('Caustic Wash','uk','',1614088789,1614088789),('Caustic Wash','zh_Hans','',1614088789,1614088789),('Cayman Islands','cs','',1614095570,1614095570),('Cayman Islands','de','',1614095570,1614095570),('Cayman Islands','en','',1614095570,1614095570),('Cayman Islands','es','',1614095570,1614095570),('Cayman Islands','fa','',1614095570,1614095570),('Cayman Islands','fr','',1614095570,1614095570),('Cayman Islands','hu','',1614095570,1614095570),('Cayman Islands','it','',1614095570,1614095570),('Cayman Islands','ja','',1614095570,1614095570),('Cayman Islands','nl','',1614095570,1614095570),('Cayman Islands','pl','',1614095570,1614095570),('Cayman Islands','pt_BR','',1614095570,1614095570),('Cayman Islands','ru','',1614095570,1614095570),('Cayman Islands','sk','',1614095570,1614095570),('Cayman Islands','sv','',1614095570,1614095570),('Cayman Islands','sv_FI','',1614095570,1614095570),('Cayman Islands','th','',1614095570,1614095570),('Cayman Islands','tr','',1614095570,1614095570),('Cayman Islands','uk','',1614095570,1614095570),('Cayman Islands','zh_Hans','',1614095570,1614095570),('Central African Republic','cs','',1614095570,1614095570),('Central African Republic','de','',1614095570,1614095570),('Central African Republic','en','',1614095570,1614095570),('Central African Republic','es','',1614095570,1614095570),('Central African Republic','fa','',1614095570,1614095570),('Central African Republic','fr','',1614095570,1614095570),('Central African Republic','hu','',1614095570,1614095570),('Central African Republic','it','',1614095570,1614095570),('Central African Republic','ja','',1614095570,1614095570),('Central African Republic','nl','',1614095570,1614095570),('Central African Republic','pl','',1614095570,1614095570),('Central African Republic','pt_BR','',1614095570,1614095570),('Central African Republic','ru','',1614095570,1614095570),('Central African Republic','sk','',1614095570,1614095570),('Central African Republic','sv','',1614095570,1614095570),('Central African Republic','sv_FI','',1614095570,1614095570),('Central African Republic','th','',1614095570,1614095570),('Central African Republic','tr','',1614095570,1614095570),('Central African Republic','uk','',1614095570,1614095570),('Central African Republic','zh_Hans','',1614095570,1614095570),('Chad','cs','',1614095570,1614095570),('Chad','de','',1614095570,1614095570),('Chad','en','',1614095570,1614095570),('Chad','es','',1614095570,1614095570),('Chad','fa','',1614095570,1614095570),('Chad','fr','',1614095570,1614095570),('Chad','hu','',1614095570,1614095570),('Chad','it','',1614095570,1614095570),('Chad','ja','',1614095570,1614095570),('Chad','nl','',1614095570,1614095570),('Chad','pl','',1614095570,1614095570),('Chad','pt_BR','',1614095570,1614095570),('Chad','ru','',1614095570,1614095570),('Chad','sk','',1614095570,1614095570),('Chad','sv','',1614095570,1614095570),('Chad','sv_FI','',1614095570,1614095570),('Chad','th','',1614095570,1614095570),('Chad','tr','',1614095570,1614095570),('Chad','uk','',1614095570,1614095570),('Chad','zh_Hans','',1614095570,1614095570),('Checks','cs','',1614095592,1614095592),('Checks','de','',1614095592,1614095592),('Checks','en','',1614095592,1614095592),('Checks','es','',1614095592,1614095592),('Checks','fa','',1614095592,1614095592),('Checks','fr','',1614095592,1614095592),('Checks','hu','',1614095592,1614095592),('Checks','it','',1614095592,1614095592),('Checks','ja','',1614095592,1614095592),('Checks','nl','',1614095592,1614095592),('Checks','pl','',1614095592,1614095592),('Checks','pt_BR','',1614095592,1614095592),('Checks','ru','',1614095592,1614095592),('Checks','sk','',1614095592,1614095592),('Checks','sv','',1614095592,1614095592),('Checks','sv_FI','',1614095592,1614095592),('Checks','th','',1614095592,1614095592),('Checks','tr','',1614095592,1614095592),('Checks','uk','',1614095592,1614095592),('Checks','zh_Hans','',1614095592,1614095592),('Chile','cs','',1614095571,1614095571),('Chile','de','',1614095571,1614095571),('Chile','en','',1614095571,1614095571),('Chile','es','',1614095571,1614095571),('Chile','fa','',1614095571,1614095571),('Chile','fr','',1614095571,1614095571),('Chile','hu','',1614095571,1614095571),('Chile','it','',1614095571,1614095571),('Chile','ja','',1614095571,1614095571),('Chile','nl','',1614095571,1614095571),('Chile','pl','',1614095571,1614095571),('Chile','pt_BR','',1614095571,1614095571),('Chile','ru','',1614095571,1614095571),('Chile','sk','',1614095571,1614095571),('Chile','sv','',1614095571,1614095571),('Chile','sv_FI','',1614095571,1614095571),('Chile','th','',1614095571,1614095571),('Chile','tr','',1614095571,1614095571),('Chile','uk','',1614095571,1614095571),('Chile','zh_Hans','',1614095571,1614095571),('China','cs','',1614095571,1614095571),('China','de','',1614095571,1614095571),('China','en','',1614095571,1614095571),('China','es','',1614095571,1614095571),('China','fa','',1614095571,1614095571),('China','fr','',1614095571,1614095571),('China','hu','',1614095571,1614095571),('China','it','',1614095571,1614095571),('China','ja','',1614095571,1614095571),('China','nl','',1614095571,1614095571),('China','pl','',1614095571,1614095571),('China','pt_BR','',1614095571,1614095571),('China','ru','',1614095571,1614095571),('China','sk','',1614095571,1614095571),('China','sv','',1614095571,1614095571),('China','sv_FI','',1614095571,1614095571),('China','th','',1614095571,1614095571),('China','tr','',1614095571,1614095571),('China','uk','',1614095571,1614095571),('China','zh_Hans','',1614095571,1614095571),('Christmas Island','cs','',1614095571,1614095571),('Christmas Island','de','',1614095571,1614095571),('Christmas Island','en','',1614095571,1614095571),('Christmas Island','es','',1614095571,1614095571),('Christmas Island','fa','',1614095571,1614095571),('Christmas Island','fr','',1614095571,1614095571),('Christmas Island','hu','',1614095571,1614095571),('Christmas Island','it','',1614095571,1614095571),('Christmas Island','ja','',1614095571,1614095571),('Christmas Island','nl','',1614095571,1614095571),('Christmas Island','pl','',1614095571,1614095571),('Christmas Island','pt_BR','',1614095571,1614095571),('Christmas Island','ru','',1614095571,1614095571),('Christmas Island','sk','',1614095571,1614095571),('Christmas Island','sv','',1614095571,1614095571),('Christmas Island','sv_FI','',1614095571,1614095571),('Christmas Island','th','',1614095571,1614095571),('Christmas Island','tr','',1614095571,1614095571),('Christmas Island','uk','',1614095571,1614095571),('Christmas Island','zh_Hans','',1614095571,1614095571),('Classification','cs','',1614096494,1614096494),('Classification','de','',1614096494,1614096494),('Classification','en','',1614096494,1614096494),('Classification','es','',1614096494,1614096494),('Classification','fa','',1614096494,1614096494),('Classification','fr','',1614096494,1614096494),('Classification','hu','',1614096494,1614096494),('Classification','it','',1614096494,1614096494),('Classification','ja','',1614096494,1614096494),('Classification','nl','',1614096494,1614096494),('Classification','pl','',1614096494,1614096494),('Classification','pt_BR','',1614096494,1614096494),('Classification','ru','',1614096494,1614096494),('Classification','sk','',1614096494,1614096494),('Classification','sv','',1614096494,1614096494),('Classification','sv_FI','',1614096494,1614096494),('Classification','th','',1614096494,1614096494),('Classification','tr','',1614096494,1614096494),('Classification','uk','',1614096494,1614096494),('Classification','zh_Hans','',1614096494,1614096494),('Cocos (Keeling) Islands','cs','',1614095571,1614095571),('Cocos (Keeling) Islands','de','',1614095571,1614095571),('Cocos (Keeling) Islands','en','',1614095571,1614095571),('Cocos (Keeling) Islands','es','',1614095571,1614095571),('Cocos (Keeling) Islands','fa','',1614095571,1614095571),('Cocos (Keeling) Islands','fr','',1614095571,1614095571),('Cocos (Keeling) Islands','hu','',1614095571,1614095571),('Cocos (Keeling) Islands','it','',1614095571,1614095571),('Cocos (Keeling) Islands','ja','',1614095571,1614095571),('Cocos (Keeling) Islands','nl','',1614095571,1614095571),('Cocos (Keeling) Islands','pl','',1614095571,1614095571),('Cocos (Keeling) Islands','pt_BR','',1614095571,1614095571),('Cocos (Keeling) Islands','ru','',1614095571,1614095571),('Cocos (Keeling) Islands','sk','',1614095571,1614095571),('Cocos (Keeling) Islands','sv','',1614095571,1614095571),('Cocos (Keeling) Islands','sv_FI','',1614095571,1614095571),('Cocos (Keeling) Islands','th','',1614095571,1614095571),('Cocos (Keeling) Islands','tr','',1614095571,1614095571),('Cocos (Keeling) Islands','uk','',1614095571,1614095571),('Cocos (Keeling) Islands','zh_Hans','',1614095571,1614095571),('Colombia','cs','',1614095571,1614095571),('Colombia','de','',1614095571,1614095571),('Colombia','en','',1614095571,1614095571),('Colombia','es','',1614095571,1614095571),('Colombia','fa','',1614095571,1614095571),('Colombia','fr','',1614095571,1614095571),('Colombia','hu','',1614095571,1614095571),('Colombia','it','',1614095571,1614095571),('Colombia','ja','',1614095571,1614095571),('Colombia','nl','',1614095571,1614095571),('Colombia','pl','',1614095571,1614095571),('Colombia','pt_BR','',1614095571,1614095571),('Colombia','ru','',1614095571,1614095571),('Colombia','sk','',1614095571,1614095571),('Colombia','sv','',1614095571,1614095571),('Colombia','sv_FI','',1614095571,1614095571),('Colombia','th','',1614095571,1614095571),('Colombia','tr','',1614095571,1614095571),('Colombia','uk','',1614095571,1614095571),('Colombia','zh_Hans','',1614095571,1614095571),('Comoros','cs','',1614095571,1614095571),('Comoros','de','',1614095571,1614095571),('Comoros','en','',1614095571,1614095571),('Comoros','es','',1614095571,1614095571),('Comoros','fa','',1614095571,1614095571),('Comoros','fr','',1614095571,1614095571),('Comoros','hu','',1614095571,1614095571),('Comoros','it','',1614095571,1614095571),('Comoros','ja','',1614095571,1614095571),('Comoros','nl','',1614095571,1614095571),('Comoros','pl','',1614095571,1614095571),('Comoros','pt_BR','',1614095571,1614095571),('Comoros','ru','',1614095571,1614095571),('Comoros','sk','',1614095571,1614095571),('Comoros','sv','',1614095571,1614095571),('Comoros','sv_FI','',1614095571,1614095571),('Comoros','th','',1614095571,1614095571),('Comoros','tr','',1614095571,1614095571),('Comoros','uk','',1614095571,1614095571),('Comoros','zh_Hans','',1614095571,1614095571),('Congo - Brazzaville','cs','',1614095571,1614095571),('Congo - Brazzaville','de','',1614095571,1614095571),('Congo - Brazzaville','en','',1614095571,1614095571),('Congo - Brazzaville','es','',1614095571,1614095571),('Congo - Brazzaville','fa','',1614095571,1614095571),('Congo - Brazzaville','fr','',1614095571,1614095571),('Congo - Brazzaville','hu','',1614095571,1614095571),('Congo - Brazzaville','it','',1614095571,1614095571),('Congo - Brazzaville','ja','',1614095571,1614095571),('Congo - Brazzaville','nl','',1614095571,1614095571),('Congo - Brazzaville','pl','',1614095571,1614095571),('Congo - Brazzaville','pt_BR','',1614095571,1614095571),('Congo - Brazzaville','ru','',1614095571,1614095571),('Congo - Brazzaville','sk','',1614095571,1614095571),('Congo - Brazzaville','sv','',1614095571,1614095571),('Congo - Brazzaville','sv_FI','',1614095571,1614095571),('Congo - Brazzaville','th','',1614095571,1614095571),('Congo - Brazzaville','tr','',1614095571,1614095571),('Congo - Brazzaville','uk','',1614095571,1614095571),('Congo - Brazzaville','zh_Hans','',1614095571,1614095571),('Congo - Kinshasa','cs','',1614095571,1614095571),('Congo - Kinshasa','de','',1614095571,1614095571),('Congo - Kinshasa','en','',1614095571,1614095571),('Congo - Kinshasa','es','',1614095571,1614095571),('Congo - Kinshasa','fa','',1614095571,1614095571),('Congo - Kinshasa','fr','',1614095571,1614095571),('Congo - Kinshasa','hu','',1614095571,1614095571),('Congo - Kinshasa','it','',1614095571,1614095571),('Congo - Kinshasa','ja','',1614095571,1614095571),('Congo - Kinshasa','nl','',1614095571,1614095571),('Congo - Kinshasa','pl','',1614095571,1614095571),('Congo - Kinshasa','pt_BR','',1614095571,1614095571),('Congo - Kinshasa','ru','',1614095571,1614095571),('Congo - Kinshasa','sk','',1614095571,1614095571),('Congo - Kinshasa','sv','',1614095571,1614095571),('Congo - Kinshasa','sv_FI','',1614095571,1614095571),('Congo - Kinshasa','th','',1614095571,1614095571),('Congo - Kinshasa','tr','',1614095571,1614095571),('Congo - Kinshasa','uk','',1614095571,1614095571),('Congo - Kinshasa','zh_Hans','',1614095571,1614095571),('Cook Islands','cs','',1614095571,1614095571),('Cook Islands','de','',1614095571,1614095571),('Cook Islands','en','',1614095571,1614095571),('Cook Islands','es','',1614095571,1614095571),('Cook Islands','fa','',1614095571,1614095571),('Cook Islands','fr','',1614095571,1614095571),('Cook Islands','hu','',1614095571,1614095571),('Cook Islands','it','',1614095571,1614095571),('Cook Islands','ja','',1614095571,1614095571),('Cook Islands','nl','',1614095571,1614095571),('Cook Islands','pl','',1614095571,1614095571),('Cook Islands','pt_BR','',1614095571,1614095571),('Cook Islands','ru','',1614095571,1614095571),('Cook Islands','sk','',1614095571,1614095571),('Cook Islands','sv','',1614095571,1614095571),('Cook Islands','sv_FI','',1614095571,1614095571),('Cook Islands','th','',1614095571,1614095571),('Cook Islands','tr','',1614095571,1614095571),('Cook Islands','uk','',1614095571,1614095571),('Cook Islands','zh_Hans','',1614095571,1614095571),('Costa Rica','cs','',1614095571,1614095571),('Costa Rica','de','',1614095571,1614095571),('Costa Rica','en','',1614095571,1614095571),('Costa Rica','es','',1614095571,1614095571),('Costa Rica','fa','',1614095571,1614095571),('Costa Rica','fr','',1614095571,1614095571),('Costa Rica','hu','',1614095571,1614095571),('Costa Rica','it','',1614095571,1614095571),('Costa Rica','ja','',1614095571,1614095571),('Costa Rica','nl','',1614095571,1614095571),('Costa Rica','pl','',1614095571,1614095571),('Costa Rica','pt_BR','',1614095571,1614095571),('Costa Rica','ru','',1614095571,1614095571),('Costa Rica','sk','',1614095571,1614095571),('Costa Rica','sv','',1614095571,1614095571),('Costa Rica','sv_FI','',1614095571,1614095571),('Costa Rica','th','',1614095571,1614095571),('Costa Rica','tr','',1614095571,1614095571),('Costa Rica','uk','',1614095571,1614095571),('Costa Rica','zh_Hans','',1614095571,1614095571),('Croatia','cs','',1614095572,1614095572),('Croatia','de','',1614095572,1614095572),('Croatia','en','',1614095572,1614095572),('Croatia','es','',1614095572,1614095572),('Croatia','fa','',1614095572,1614095572),('Croatia','fr','',1614095572,1614095572),('Croatia','hu','',1614095572,1614095572),('Croatia','it','',1614095572,1614095572),('Croatia','ja','',1614095572,1614095572),('Croatia','nl','',1614095572,1614095572),('Croatia','pl','',1614095572,1614095572),('Croatia','pt_BR','',1614095572,1614095572),('Croatia','ru','',1614095572,1614095572),('Croatia','sk','',1614095572,1614095572),('Croatia','sv','',1614095572,1614095572),('Croatia','sv_FI','',1614095572,1614095572),('Croatia','th','',1614095572,1614095572),('Croatia','tr','',1614095572,1614095572),('Croatia','uk','',1614095572,1614095572),('Croatia','zh_Hans','',1614095572,1614095572),('Cuba','cs','',1614095572,1614095572),('Cuba','de','',1614095572,1614095572),('Cuba','en','',1614095572,1614095572),('Cuba','es','',1614095572,1614095572),('Cuba','fa','',1614095572,1614095572),('Cuba','fr','',1614095572,1614095572),('Cuba','hu','',1614095572,1614095572),('Cuba','it','',1614095572,1614095572),('Cuba','ja','',1614095572,1614095572),('Cuba','nl','',1614095572,1614095572),('Cuba','pl','',1614095572,1614095572),('Cuba','pt_BR','',1614095572,1614095572),('Cuba','ru','',1614095572,1614095572),('Cuba','sk','',1614095572,1614095572),('Cuba','sv','',1614095572,1614095572),('Cuba','sv_FI','',1614095572,1614095572),('Cuba','th','',1614095572,1614095572),('Cuba','tr','',1614095572,1614095572),('Cuba','uk','',1614095572,1614095572),('Cuba','zh_Hans','',1614095572,1614095572),('Curaçao','cs','',1614095572,1614095572),('Curaçao','de','',1614095572,1614095572),('Curaçao','en','',1614095572,1614095572),('Curaçao','es','',1614095572,1614095572),('Curaçao','fa','',1614095572,1614095572),('Curaçao','fr','',1614095572,1614095572),('Curaçao','hu','',1614095572,1614095572),('Curaçao','it','',1614095572,1614095572),('Curaçao','ja','',1614095572,1614095572),('Curaçao','nl','',1614095572,1614095572),('Curaçao','pl','',1614095572,1614095572),('Curaçao','pt_BR','',1614095572,1614095572),('Curaçao','ru','',1614095572,1614095572),('Curaçao','sk','',1614095572,1614095572),('Curaçao','sv','',1614095572,1614095572),('Curaçao','sv_FI','',1614095572,1614095572),('Curaçao','th','',1614095572,1614095572),('Curaçao','tr','',1614095572,1614095572),('Curaçao','uk','',1614095572,1614095572),('Curaçao','zh_Hans','',1614095572,1614095572),('Cyprus','cs','',1614095572,1614095572),('Cyprus','de','',1614095572,1614095572),('Cyprus','en','',1614095572,1614095572),('Cyprus','es','',1614095572,1614095572),('Cyprus','fa','',1614095572,1614095572),('Cyprus','fr','',1614095572,1614095572),('Cyprus','hu','',1614095572,1614095572),('Cyprus','it','',1614095572,1614095572),('Cyprus','ja','',1614095572,1614095572),('Cyprus','nl','',1614095572,1614095572),('Cyprus','pl','',1614095572,1614095572),('Cyprus','pt_BR','',1614095572,1614095572),('Cyprus','ru','',1614095572,1614095572),('Cyprus','sk','',1614095572,1614095572),('Cyprus','sv','',1614095572,1614095572),('Cyprus','sv_FI','',1614095572,1614095572),('Cyprus','th','',1614095572,1614095572),('Cyprus','tr','',1614095572,1614095572),('Cyprus','uk','',1614095572,1614095572),('Cyprus','zh_Hans','',1614095572,1614095572),('Czechia','cs','',1614095572,1614095572),('Czechia','de','',1614095572,1614095572),('Czechia','en','',1614095572,1614095572),('Czechia','es','',1614095572,1614095572),('Czechia','fa','',1614095572,1614095572),('Czechia','fr','',1614095572,1614095572),('Czechia','hu','',1614095572,1614095572),('Czechia','it','',1614095572,1614095572),('Czechia','ja','',1614095572,1614095572),('Czechia','nl','',1614095572,1614095572),('Czechia','pl','',1614095572,1614095572),('Czechia','pt_BR','',1614095572,1614095572),('Czechia','ru','',1614095572,1614095572),('Czechia','sk','',1614095572,1614095572),('Czechia','sv','',1614095572,1614095572),('Czechia','sv_FI','',1614095572,1614095572),('Czechia','th','',1614095572,1614095572),('Czechia','tr','',1614095572,1614095572),('Czechia','uk','',1614095572,1614095572),('Czechia','zh_Hans','',1614095572,1614095572),('Côte d’Ivoire','cs','',1614095572,1614095572),('Côte d’Ivoire','de','',1614095572,1614095572),('Côte d’Ivoire','en','',1614095572,1614095572),('Côte d’Ivoire','es','',1614095572,1614095572),('Côte d’Ivoire','fa','',1614095572,1614095572),('Côte d’Ivoire','fr','',1614095572,1614095572),('Côte d’Ivoire','hu','',1614095572,1614095572),('Côte d’Ivoire','it','',1614095572,1614095572),('Côte d’Ivoire','ja','',1614095572,1614095572),('Côte d’Ivoire','nl','',1614095572,1614095572),('Côte d’Ivoire','pl','',1614095572,1614095572),('Côte d’Ivoire','pt_BR','',1614095572,1614095572),('Côte d’Ivoire','ru','',1614095572,1614095572),('Côte d’Ivoire','sk','',1614095572,1614095572),('Côte d’Ivoire','sv','',1614095572,1614095572),('Côte d’Ivoire','sv_FI','',1614095572,1614095572),('Côte d’Ivoire','th','',1614095572,1614095572),('Côte d’Ivoire','tr','',1614095572,1614095572),('Côte d’Ivoire','uk','',1614095572,1614095572),('Côte d’Ivoire','zh_Hans','',1614095572,1614095572),('Decolletage','cs','',1614096674,1614096674),('Decolletage','de','',1614096674,1614096674),('Decolletage','en','',1614096674,1614096674),('Decolletage','es','',1614096674,1614096674),('Decolletage','fa','',1614096674,1614096674),('Decolletage','fr','',1614096674,1614096674),('Decolletage','hu','',1614096674,1614096674),('Decolletage','it','',1614096674,1614096674),('Decolletage','ja','',1614096674,1614096674),('Decolletage','nl','',1614096674,1614096674),('Decolletage','pl','',1614096674,1614096674),('Decolletage','pt_BR','',1614096674,1614096674),('Decolletage','ru','',1614096674,1614096674),('Decolletage','sk','',1614096674,1614096674),('Decolletage','sv','',1614096674,1614096674),('Decolletage','sv_FI','',1614096674,1614096674),('Decolletage','th','',1614096674,1614096674),('Decolletage','tr','',1614096674,1614096674),('Decolletage','uk','',1614096674,1614096674),('Decolletage','zh_Hans','',1614096674,1614096674),('Deep Neck','cs','',1614096674,1614096674),('Deep Neck','de','',1614096674,1614096674),('Deep Neck','en','',1614096674,1614096674),('Deep Neck','es','',1614096674,1614096674),('Deep Neck','fa','',1614096674,1614096674),('Deep Neck','fr','',1614096674,1614096674),('Deep Neck','hu','',1614096674,1614096674),('Deep Neck','it','',1614096674,1614096674),('Deep Neck','ja','',1614096674,1614096674),('Deep Neck','nl','',1614096674,1614096674),('Deep Neck','pl','',1614096674,1614096674),('Deep Neck','pt_BR','',1614096674,1614096674),('Deep Neck','ru','',1614096674,1614096674),('Deep Neck','sk','',1614096674,1614096674),('Deep Neck','sv','',1614096674,1614096674),('Deep Neck','sv_FI','',1614096674,1614096674),('Deep Neck','th','',1614096674,1614096674),('Deep Neck','tr','',1614096674,1614096674),('Deep Neck','uk','',1614096674,1614096674),('Deep Neck','zh_Hans','',1614096674,1614096674),('Denmark','cs','',1614095572,1614095572),('Denmark','de','',1614095572,1614095572),('Denmark','en','',1614095572,1614095572),('Denmark','es','',1614095572,1614095572),('Denmark','fa','',1614095572,1614095572),('Denmark','fr','',1614095572,1614095572),('Denmark','hu','',1614095572,1614095572),('Denmark','it','',1614095572,1614095572),('Denmark','ja','',1614095572,1614095572),('Denmark','nl','',1614095572,1614095572),('Denmark','pl','',1614095572,1614095572),('Denmark','pt_BR','',1614095572,1614095572),('Denmark','ru','',1614095572,1614095572),('Denmark','sk','',1614095572,1614095572),('Denmark','sv','',1614095572,1614095572),('Denmark','sv_FI','',1614095572,1614095572),('Denmark','th','',1614095572,1614095572),('Denmark','tr','',1614095572,1614095572),('Denmark','uk','',1614095572,1614095572),('Denmark','zh_Hans','',1614095572,1614095572),('Discount','cs','',1614095565,1614095565),('Discount','de','',1614095565,1614095565),('Discount','en','',1614095565,1614095565),('Discount','es','',1614095565,1614095565),('Discount','fa','',1614095565,1614095565),('Discount','fr','',1614095565,1614095565),('Discount','hu','',1614095565,1614095565),('Discount','it','',1614095565,1614095565),('Discount','ja','',1614095565,1614095565),('Discount','nl','',1614095565,1614095565),('Discount','pl','',1614095565,1614095565),('Discount','pt_BR','',1614095565,1614095565),('Discount','ru','',1614095565,1614095565),('Discount','sk','',1614095565,1614095565),('Discount','sv','',1614095565,1614095565),('Discount','sv_FI','',1614095565,1614095565),('Discount','th','',1614095565,1614095565),('Discount','tr','',1614095565,1614095565),('Discount','uk','',1614095565,1614095565),('Discount','zh_Hans','',1614095565,1614095565),('Djibouti','cs','',1614095572,1614095572),('Djibouti','de','',1614095572,1614095572),('Djibouti','en','',1614095572,1614095572),('Djibouti','es','',1614095572,1614095572),('Djibouti','fa','',1614095572,1614095572),('Djibouti','fr','',1614095572,1614095572),('Djibouti','hu','',1614095572,1614095572),('Djibouti','it','',1614095572,1614095572),('Djibouti','ja','',1614095572,1614095572),('Djibouti','nl','',1614095572,1614095572),('Djibouti','pl','',1614095572,1614095572),('Djibouti','pt_BR','',1614095572,1614095572),('Djibouti','ru','',1614095572,1614095572),('Djibouti','sk','',1614095572,1614095572),('Djibouti','sv','',1614095572,1614095572),('Djibouti','sv_FI','',1614095572,1614095572),('Djibouti','th','',1614095572,1614095572),('Djibouti','tr','',1614095572,1614095572),('Djibouti','uk','',1614095572,1614095572),('Djibouti','zh_Hans','',1614095572,1614095572),('Dominica','cs','',1614095572,1614095572),('Dominica','de','',1614095572,1614095572),('Dominica','en','',1614095572,1614095572),('Dominica','es','',1614095572,1614095572),('Dominica','fa','',1614095572,1614095572),('Dominica','fr','',1614095572,1614095572),('Dominica','hu','',1614095572,1614095572),('Dominica','it','',1614095572,1614095572),('Dominica','ja','',1614095572,1614095572),('Dominica','nl','',1614095572,1614095572),('Dominica','pl','',1614095572,1614095572),('Dominica','pt_BR','',1614095572,1614095572),('Dominica','ru','',1614095572,1614095572),('Dominica','sk','',1614095572,1614095572),('Dominica','sv','',1614095572,1614095572),('Dominica','sv_FI','',1614095572,1614095572),('Dominica','th','',1614095572,1614095572),('Dominica','tr','',1614095572,1614095572),('Dominica','uk','',1614095572,1614095572),('Dominica','zh_Hans','',1614095572,1614095572),('Dominican Republic','cs','',1614095572,1614095572),('Dominican Republic','de','',1614095572,1614095572),('Dominican Republic','en','',1614095572,1614095572),('Dominican Republic','es','',1614095572,1614095572),('Dominican Republic','fa','',1614095572,1614095572),('Dominican Republic','fr','',1614095572,1614095572),('Dominican Republic','hu','',1614095572,1614095572),('Dominican Republic','it','',1614095572,1614095572),('Dominican Republic','ja','',1614095572,1614095572),('Dominican Republic','nl','',1614095572,1614095572),('Dominican Republic','pl','',1614095572,1614095572),('Dominican Republic','pt_BR','',1614095572,1614095572),('Dominican Republic','ru','',1614095572,1614095572),('Dominican Republic','sk','',1614095572,1614095572),('Dominican Republic','sv','',1614095572,1614095572),('Dominican Republic','sv_FI','',1614095572,1614095572),('Dominican Republic','th','',1614095572,1614095572),('Dominican Republic','tr','',1614095572,1614095572),('Dominican Republic','uk','',1614095572,1614095572),('Dominican Republic','zh_Hans','',1614095572,1614095572),('Dry Clean','cs','',1614088789,1614088789),('Dry Clean','de','',1614088789,1614088789),('Dry Clean','en','',1614088789,1614088789),('Dry Clean','es','',1614088789,1614088789),('Dry Clean','fa','',1614088789,1614088789),('Dry Clean','fr','',1614088789,1614088789),('Dry Clean','hu','',1614088789,1614088789),('Dry Clean','it','',1614088789,1614088789),('Dry Clean','ja','',1614088789,1614088789),('Dry Clean','nl','',1614088789,1614088789),('Dry Clean','pl','',1614088789,1614088789),('Dry Clean','pt_BR','',1614088789,1614088789),('Dry Clean','ru','',1614088789,1614088789),('Dry Clean','sk','',1614088789,1614088789),('Dry Clean','sv','',1614088789,1614088789),('Dry Clean','sv_FI','',1614088789,1614088789),('Dry Clean','th','',1614088789,1614088789),('Dry Clean','tr','',1614088789,1614088789),('Dry Clean','uk','',1614088789,1614088789),('Dry Clean','zh_Hans','',1614088789,1614088789),('Ecuador','cs','',1614095573,1614095573),('Ecuador','de','',1614095573,1614095573),('Ecuador','en','',1614095573,1614095573),('Ecuador','es','',1614095573,1614095573),('Ecuador','fa','',1614095573,1614095573),('Ecuador','fr','',1614095573,1614095573),('Ecuador','hu','',1614095573,1614095573),('Ecuador','it','',1614095573,1614095573),('Ecuador','ja','',1614095573,1614095573),('Ecuador','nl','',1614095573,1614095573),('Ecuador','pl','',1614095573,1614095573),('Ecuador','pt_BR','',1614095573,1614095573),('Ecuador','ru','',1614095573,1614095573),('Ecuador','sk','',1614095573,1614095573),('Ecuador','sv','',1614095573,1614095573),('Ecuador','sv_FI','',1614095573,1614095573),('Ecuador','th','',1614095573,1614095573),('Ecuador','tr','',1614095573,1614095573),('Ecuador','uk','',1614095573,1614095573),('Ecuador','zh_Hans','',1614095573,1614095573),('Egypt','cs','',1614095573,1614095573),('Egypt','de','',1614095573,1614095573),('Egypt','en','',1614095573,1614095573),('Egypt','es','',1614095573,1614095573),('Egypt','fa','',1614095573,1614095573),('Egypt','fr','',1614095573,1614095573),('Egypt','hu','',1614095573,1614095573),('Egypt','it','',1614095573,1614095573),('Egypt','ja','',1614095573,1614095573),('Egypt','nl','',1614095573,1614095573),('Egypt','pl','',1614095573,1614095573),('Egypt','pt_BR','',1614095573,1614095573),('Egypt','ru','',1614095573,1614095573),('Egypt','sk','',1614095573,1614095573),('Egypt','sv','',1614095573,1614095573),('Egypt','sv_FI','',1614095573,1614095573),('Egypt','th','',1614095573,1614095573),('Egypt','tr','',1614095573,1614095573),('Egypt','uk','',1614095573,1614095573),('Egypt','zh_Hans','',1614095573,1614095573),('El Salvador','cs','',1614095573,1614095573),('El Salvador','de','',1614095573,1614095573),('El Salvador','en','',1614095573,1614095573),('El Salvador','es','',1614095573,1614095573),('El Salvador','fa','',1614095573,1614095573),('El Salvador','fr','',1614095573,1614095573),('El Salvador','hu','',1614095573,1614095573),('El Salvador','it','',1614095573,1614095573),('El Salvador','ja','',1614095573,1614095573),('El Salvador','nl','',1614095573,1614095573),('El Salvador','pl','',1614095573,1614095573),('El Salvador','pt_BR','',1614095573,1614095573),('El Salvador','ru','',1614095573,1614095573),('El Salvador','sk','',1614095573,1614095573),('El Salvador','sv','',1614095573,1614095573),('El Salvador','sv_FI','',1614095573,1614095573),('El Salvador','th','',1614095573,1614095573),('El Salvador','tr','',1614095573,1614095573),('El Salvador','uk','',1614095573,1614095573),('El Salvador','zh_Hans','',1614095573,1614095573),('English','cs','',1614095591,1614095591),('English','de','',1614095591,1614095591),('English','en','',1614095591,1614095591),('English','es','',1614095591,1614095591),('English','fa','',1614095591,1614095591),('English','fr','',1614095591,1614095591),('English','hu','',1614095591,1614095591),('English','it','',1614095591,1614095591),('English','ja','',1614095591,1614095591),('English','nl','',1614095591,1614095591),('English','pl','',1614095591,1614095591),('English','pt_BR','',1614095591,1614095591),('English','ru','',1614095591,1614095591),('English','sk','',1614095591,1614095591),('English','sv','',1614095591,1614095591),('English','sv_FI','',1614095591,1614095591),('English','th','',1614095591,1614095591),('English','tr','',1614095591,1614095591),('English','uk','',1614095591,1614095591),('English','zh_Hans','',1614095591,1614095591),('Equatorial Guinea','cs','',1614095573,1614095573),('Equatorial Guinea','de','',1614095573,1614095573),('Equatorial Guinea','en','',1614095573,1614095573),('Equatorial Guinea','es','',1614095573,1614095573),('Equatorial Guinea','fa','',1614095573,1614095573),('Equatorial Guinea','fr','',1614095573,1614095573),('Equatorial Guinea','hu','',1614095573,1614095573),('Equatorial Guinea','it','',1614095573,1614095573),('Equatorial Guinea','ja','',1614095573,1614095573),('Equatorial Guinea','nl','',1614095573,1614095573),('Equatorial Guinea','pl','',1614095573,1614095573),('Equatorial Guinea','pt_BR','',1614095573,1614095573),('Equatorial Guinea','ru','',1614095573,1614095573),('Equatorial Guinea','sk','',1614095573,1614095573),('Equatorial Guinea','sv','',1614095573,1614095573),('Equatorial Guinea','sv_FI','',1614095573,1614095573),('Equatorial Guinea','th','',1614095573,1614095573),('Equatorial Guinea','tr','',1614095573,1614095573),('Equatorial Guinea','uk','',1614095573,1614095573),('Equatorial Guinea','zh_Hans','',1614095573,1614095573),('Eritrea','cs','',1614095573,1614095573),('Eritrea','de','',1614095573,1614095573),('Eritrea','en','',1614095573,1614095573),('Eritrea','es','',1614095573,1614095573),('Eritrea','fa','',1614095573,1614095573),('Eritrea','fr','',1614095573,1614095573),('Eritrea','hu','',1614095573,1614095573),('Eritrea','it','',1614095573,1614095573),('Eritrea','ja','',1614095573,1614095573),('Eritrea','nl','',1614095573,1614095573),('Eritrea','pl','',1614095573,1614095573),('Eritrea','pt_BR','',1614095573,1614095573),('Eritrea','ru','',1614095573,1614095573),('Eritrea','sk','',1614095573,1614095573),('Eritrea','sv','',1614095573,1614095573),('Eritrea','sv_FI','',1614095573,1614095573),('Eritrea','th','',1614095573,1614095573),('Eritrea','tr','',1614095573,1614095573),('Eritrea','uk','',1614095573,1614095573),('Eritrea','zh_Hans','',1614095573,1614095573),('Estonia','cs','',1614095573,1614095573),('Estonia','de','',1614095573,1614095573),('Estonia','en','',1614095573,1614095573),('Estonia','es','',1614095573,1614095573),('Estonia','fa','',1614095573,1614095573),('Estonia','fr','',1614095573,1614095573),('Estonia','hu','',1614095573,1614095573),('Estonia','it','',1614095573,1614095573),('Estonia','ja','',1614095573,1614095573),('Estonia','nl','',1614095573,1614095573),('Estonia','pl','',1614095573,1614095573),('Estonia','pt_BR','',1614095573,1614095573),('Estonia','ru','',1614095573,1614095573),('Estonia','sk','',1614095573,1614095573),('Estonia','sv','',1614095573,1614095573),('Estonia','sv_FI','',1614095573,1614095573),('Estonia','th','',1614095573,1614095573),('Estonia','tr','',1614095573,1614095573),('Estonia','uk','',1614095573,1614095573),('Estonia','zh_Hans','',1614095573,1614095573),('Eswatini','cs','',1614095573,1614095573),('Eswatini','de','',1614095573,1614095573),('Eswatini','en','',1614095573,1614095573),('Eswatini','es','',1614095573,1614095573),('Eswatini','fa','',1614095573,1614095573),('Eswatini','fr','',1614095573,1614095573),('Eswatini','hu','',1614095573,1614095573),('Eswatini','it','',1614095573,1614095573),('Eswatini','ja','',1614095573,1614095573),('Eswatini','nl','',1614095573,1614095573),('Eswatini','pl','',1614095573,1614095573),('Eswatini','pt_BR','',1614095573,1614095573),('Eswatini','ru','',1614095573,1614095573),('Eswatini','sk','',1614095573,1614095573),('Eswatini','sv','',1614095573,1614095573),('Eswatini','sv_FI','',1614095573,1614095573),('Eswatini','th','',1614095573,1614095573),('Eswatini','tr','',1614095573,1614095573),('Eswatini','uk','',1614095573,1614095573),('Eswatini','zh_Hans','',1614095573,1614095573),('Ethiopia','cs','',1614095573,1614095573),('Ethiopia','de','',1614095573,1614095573),('Ethiopia','en','',1614095573,1614095573),('Ethiopia','es','',1614095573,1614095573),('Ethiopia','fa','',1614095573,1614095573),('Ethiopia','fr','',1614095573,1614095573),('Ethiopia','hu','',1614095573,1614095573),('Ethiopia','it','',1614095573,1614095573),('Ethiopia','ja','',1614095573,1614095573),('Ethiopia','nl','',1614095573,1614095573),('Ethiopia','pl','',1614095573,1614095573),('Ethiopia','pt_BR','',1614095573,1614095573),('Ethiopia','ru','',1614095573,1614095573),('Ethiopia','sk','',1614095573,1614095573),('Ethiopia','sv','',1614095573,1614095573),('Ethiopia','sv_FI','',1614095573,1614095573),('Ethiopia','th','',1614095573,1614095573),('Ethiopia','tr','',1614095573,1614095573),('Ethiopia','uk','',1614095573,1614095573),('Ethiopia','zh_Hans','',1614095573,1614095573),('FAQs','cs','',1614095566,1614095566),('FAQs','de','',1614095566,1614095566),('FAQs','en','',1614095566,1614095566),('FAQs','es','',1614095566,1614095566),('FAQs','fa','',1614095566,1614095566),('FAQs','fr','',1614095566,1614095566),('FAQs','hu','',1614095566,1614095566),('FAQs','it','',1614095566,1614095566),('FAQs','ja','',1614095566,1614095566),('FAQs','nl','',1614095566,1614095566),('FAQs','pl','',1614095566,1614095566),('FAQs','pt_BR','',1614095566,1614095566),('FAQs','ru','',1614095566,1614095566),('FAQs','sk','',1614095566,1614095566),('FAQs','sv','',1614095566,1614095566),('FAQs','sv_FI','',1614095566,1614095566),('FAQs','th','',1614095566,1614095566),('FAQs','tr','',1614095566,1614095566),('FAQs','uk','',1614095566,1614095566),('FAQs','zh_Hans','',1614095566,1614095566),('Fabric','cs','',1614095565,1614095565),('Fabric','de','',1614095565,1614095565),('Fabric','en','',1614095565,1614095565),('Fabric','es','',1614095565,1614095565),('Fabric','fa','',1614095565,1614095565),('Fabric','fr','',1614095565,1614095565),('Fabric','hu','',1614095565,1614095565),('Fabric','it','',1614095565,1614095565),('Fabric','ja','',1614095565,1614095565),('Fabric','nl','',1614095565,1614095565),('Fabric','pl','',1614095565,1614095565),('Fabric','pt_BR','',1614095565,1614095565),('Fabric','ru','',1614095565,1614095565),('Fabric','sk','',1614095565,1614095565),('Fabric','sv','',1614095565,1614095565),('Fabric','sv_FI','',1614095565,1614095565),('Fabric','th','',1614095565,1614095565),('Fabric','tr','',1614095565,1614095565),('Fabric','uk','',1614095565,1614095565),('Fabric','zh_Hans','',1614095565,1614095565),('Falkland Islands','cs','',1614095573,1614095573),('Falkland Islands','de','',1614095573,1614095573),('Falkland Islands','en','',1614095573,1614095573),('Falkland Islands','es','',1614095573,1614095573),('Falkland Islands','fa','',1614095573,1614095573),('Falkland Islands','fr','',1614095573,1614095573),('Falkland Islands','hu','',1614095573,1614095573),('Falkland Islands','it','',1614095573,1614095573),('Falkland Islands','ja','',1614095573,1614095573),('Falkland Islands','nl','',1614095573,1614095573),('Falkland Islands','pl','',1614095573,1614095573),('Falkland Islands','pt_BR','',1614095573,1614095573),('Falkland Islands','ru','',1614095573,1614095573),('Falkland Islands','sk','',1614095573,1614095573),('Falkland Islands','sv','',1614095573,1614095573),('Falkland Islands','sv_FI','',1614095573,1614095573),('Falkland Islands','th','',1614095573,1614095573),('Falkland Islands','tr','',1614095573,1614095573),('Falkland Islands','uk','',1614095573,1614095573),('Falkland Islands','zh_Hans','',1614095573,1614095573),('Faroe Islands','cs','',1614095573,1614095573),('Faroe Islands','de','',1614095573,1614095573),('Faroe Islands','en','',1614095573,1614095573),('Faroe Islands','es','',1614095573,1614095573),('Faroe Islands','fa','',1614095573,1614095573),('Faroe Islands','fr','',1614095573,1614095573),('Faroe Islands','hu','',1614095573,1614095573),('Faroe Islands','it','',1614095573,1614095573),('Faroe Islands','ja','',1614095573,1614095573),('Faroe Islands','nl','',1614095573,1614095573),('Faroe Islands','pl','',1614095573,1614095573),('Faroe Islands','pt_BR','',1614095573,1614095573),('Faroe Islands','ru','',1614095573,1614095573),('Faroe Islands','sk','',1614095573,1614095573),('Faroe Islands','sv','',1614095573,1614095573),('Faroe Islands','sv_FI','',1614095573,1614095573),('Faroe Islands','th','',1614095573,1614095573),('Faroe Islands','tr','',1614095573,1614095573),('Faroe Islands','uk','',1614095573,1614095573),('Faroe Islands','zh_Hans','',1614095573,1614095573),('Female','cs','',1614095714,1614095714),('Female','de','',1614095714,1614095714),('Female','en','',1614095714,1614095714),('Female','es','',1614095714,1614095714),('Female','fa','',1614095714,1614095714),('Female','fr','',1614095714,1614095714),('Female','hu','',1614095714,1614095714),('Female','it','',1614095714,1614095714),('Female','ja','',1614095714,1614095714),('Female','nl','',1614095714,1614095714),('Female','pl','',1614095714,1614095714),('Female','pt_BR','',1614095714,1614095714),('Female','ru','',1614095714,1614095714),('Female','sk','',1614095714,1614095714),('Female','sv','',1614095714,1614095714),('Female','sv_FI','',1614095714,1614095714),('Female','th','',1614095714,1614095714),('Female','tr','',1614095714,1614095714),('Female','uk','',1614095714,1614095714),('Female','zh_Hans','',1614095714,1614095714),('Fiji','cs','',1614095574,1614095574),('Fiji','de','',1614095574,1614095574),('Fiji','en','',1614095574,1614095574),('Fiji','es','',1614095574,1614095574),('Fiji','fa','',1614095574,1614095574),('Fiji','fr','',1614095574,1614095574),('Fiji','hu','',1614095574,1614095574),('Fiji','it','',1614095574,1614095574),('Fiji','ja','',1614095574,1614095574),('Fiji','nl','',1614095574,1614095574),('Fiji','pl','',1614095574,1614095574),('Fiji','pt_BR','',1614095574,1614095574),('Fiji','ru','',1614095574,1614095574),('Fiji','sk','',1614095574,1614095574),('Fiji','sv','',1614095574,1614095574),('Fiji','sv_FI','',1614095574,1614095574),('Fiji','th','',1614095574,1614095574),('Fiji','tr','',1614095574,1614095574),('Fiji','uk','',1614095574,1614095574),('Fiji','zh_Hans','',1614095574,1614095574),('Finland','cs','',1614095574,1614095574),('Finland','de','',1614095574,1614095574),('Finland','en','',1614095574,1614095574),('Finland','es','',1614095574,1614095574),('Finland','fa','',1614095574,1614095574),('Finland','fr','',1614095574,1614095574),('Finland','hu','',1614095574,1614095574),('Finland','it','',1614095574,1614095574),('Finland','ja','',1614095574,1614095574),('Finland','nl','',1614095574,1614095574),('Finland','pl','',1614095574,1614095574),('Finland','pt_BR','',1614095574,1614095574),('Finland','ru','',1614095574,1614095574),('Finland','sk','',1614095574,1614095574),('Finland','sv','',1614095574,1614095574),('Finland','sv_FI','',1614095574,1614095574),('Finland','th','',1614095574,1614095574),('Finland','tr','',1614095574,1614095574),('Finland','uk','',1614095574,1614095574),('Finland','zh_Hans','',1614095574,1614095574),('France','cs','',1614095574,1614095574),('France','de','',1614095574,1614095574),('France','en','',1614095574,1614095574),('France','es','',1614095574,1614095574),('France','fa','',1614095574,1614095574),('France','fr','',1614095574,1614095574),('France','hu','',1614095574,1614095574),('France','it','',1614095574,1614095574),('France','ja','',1614095574,1614095574),('France','nl','',1614095574,1614095574),('France','pl','',1614095574,1614095574),('France','pt_BR','',1614095574,1614095574),('France','ru','',1614095574,1614095574),('France','sk','',1614095574,1614095574),('France','sv','',1614095574,1614095574),('France','sv_FI','',1614095574,1614095574),('France','th','',1614095574,1614095574),('France','tr','',1614095574,1614095574),('France','uk','',1614095574,1614095574),('France','zh_Hans','',1614095574,1614095574),('French Guiana','cs','',1614095574,1614095574),('French Guiana','de','',1614095574,1614095574),('French Guiana','en','',1614095574,1614095574),('French Guiana','es','',1614095574,1614095574),('French Guiana','fa','',1614095574,1614095574),('French Guiana','fr','',1614095574,1614095574),('French Guiana','hu','',1614095574,1614095574),('French Guiana','it','',1614095574,1614095574),('French Guiana','ja','',1614095574,1614095574),('French Guiana','nl','',1614095574,1614095574),('French Guiana','pl','',1614095574,1614095574),('French Guiana','pt_BR','',1614095574,1614095574),('French Guiana','ru','',1614095574,1614095574),('French Guiana','sk','',1614095574,1614095574),('French Guiana','sv','',1614095574,1614095574),('French Guiana','sv_FI','',1614095574,1614095574),('French Guiana','th','',1614095574,1614095574),('French Guiana','tr','',1614095574,1614095574),('French Guiana','uk','',1614095574,1614095574),('French Guiana','zh_Hans','',1614095574,1614095574),('French Polynesia','cs','',1614095574,1614095574),('French Polynesia','de','',1614095574,1614095574),('French Polynesia','en','',1614095574,1614095574),('French Polynesia','es','',1614095574,1614095574),('French Polynesia','fa','',1614095574,1614095574),('French Polynesia','fr','',1614095574,1614095574),('French Polynesia','hu','',1614095574,1614095574),('French Polynesia','it','',1614095574,1614095574),('French Polynesia','ja','',1614095574,1614095574),('French Polynesia','nl','',1614095574,1614095574),('French Polynesia','pl','',1614095574,1614095574),('French Polynesia','pt_BR','',1614095574,1614095574),('French Polynesia','ru','',1614095574,1614095574),('French Polynesia','sk','',1614095574,1614095574),('French Polynesia','sv','',1614095574,1614095574),('French Polynesia','sv_FI','',1614095574,1614095574),('French Polynesia','th','',1614095574,1614095574),('French Polynesia','tr','',1614095574,1614095574),('French Polynesia','uk','',1614095574,1614095574),('French Polynesia','zh_Hans','',1614095574,1614095574),('French Southern Territories','cs','',1614095574,1614095574),('French Southern Territories','de','',1614095574,1614095574),('French Southern Territories','en','',1614095574,1614095574),('French Southern Territories','es','',1614095574,1614095574),('French Southern Territories','fa','',1614095574,1614095574),('French Southern Territories','fr','',1614095574,1614095574),('French Southern Territories','hu','',1614095574,1614095574),('French Southern Territories','it','',1614095574,1614095574),('French Southern Territories','ja','',1614095574,1614095574),('French Southern Territories','nl','',1614095574,1614095574),('French Southern Territories','pl','',1614095574,1614095574),('French Southern Territories','pt_BR','',1614095574,1614095574),('French Southern Territories','ru','',1614095574,1614095574),('French Southern Territories','sk','',1614095574,1614095574),('French Southern Territories','sv','',1614095574,1614095574),('French Southern Territories','sv_FI','',1614095574,1614095574),('French Southern Territories','th','',1614095574,1614095574),('French Southern Territories','tr','',1614095574,1614095574),('French Southern Territories','uk','',1614095574,1614095574),('French Southern Territories','zh_Hans','',1614095574,1614095574),('Full Sleeves','cs','',1614096675,1614096675),('Full Sleeves','de','',1614096675,1614096675),('Full Sleeves','en','',1614096675,1614096675),('Full Sleeves','es','',1614096675,1614096675),('Full Sleeves','fa','',1614096675,1614096675),('Full Sleeves','fr','',1614096675,1614096675),('Full Sleeves','hu','',1614096675,1614096675),('Full Sleeves','it','',1614096675,1614096675),('Full Sleeves','ja','',1614096675,1614096675),('Full Sleeves','nl','',1614096675,1614096675),('Full Sleeves','pl','',1614096675,1614096675),('Full Sleeves','pt_BR','',1614096675,1614096675),('Full Sleeves','ru','',1614096675,1614096675),('Full Sleeves','sk','',1614096675,1614096675),('Full Sleeves','sv','',1614096675,1614096675),('Full Sleeves','sv_FI','',1614096675,1614096675),('Full Sleeves','th','',1614096675,1614096675),('Full Sleeves','tr','',1614096675,1614096675),('Full Sleeves','uk','',1614096675,1614096675),('Full Sleeves','zh_Hans','',1614096675,1614096675),('Gabon','cs','',1614095574,1614095574),('Gabon','de','',1614095574,1614095574),('Gabon','en','',1614095574,1614095574),('Gabon','es','',1614095574,1614095574),('Gabon','fa','',1614095574,1614095574),('Gabon','fr','',1614095574,1614095574),('Gabon','hu','',1614095574,1614095574),('Gabon','it','',1614095574,1614095574),('Gabon','ja','',1614095574,1614095574),('Gabon','nl','',1614095574,1614095574),('Gabon','pl','',1614095574,1614095574),('Gabon','pt_BR','',1614095574,1614095574),('Gabon','ru','',1614095574,1614095574),('Gabon','sk','',1614095574,1614095574),('Gabon','sv','',1614095574,1614095574),('Gabon','sv_FI','',1614095574,1614095574),('Gabon','th','',1614095574,1614095574),('Gabon','tr','',1614095574,1614095574),('Gabon','uk','',1614095574,1614095574),('Gabon','zh_Hans','',1614095574,1614095574),('Gambia','cs','',1614095574,1614095574),('Gambia','de','',1614095574,1614095574),('Gambia','en','',1614095574,1614095574),('Gambia','es','',1614095574,1614095574),('Gambia','fa','',1614095574,1614095574),('Gambia','fr','',1614095574,1614095574),('Gambia','hu','',1614095574,1614095574),('Gambia','it','',1614095574,1614095574),('Gambia','ja','',1614095574,1614095574),('Gambia','nl','',1614095574,1614095574),('Gambia','pl','',1614095574,1614095574),('Gambia','pt_BR','',1614095574,1614095574),('Gambia','ru','',1614095574,1614095574),('Gambia','sk','',1614095574,1614095574),('Gambia','sv','',1614095574,1614095574),('Gambia','sv_FI','',1614095574,1614095574),('Gambia','th','',1614095574,1614095574),('Gambia','tr','',1614095574,1614095574),('Gambia','uk','',1614095574,1614095574),('Gambia','zh_Hans','',1614095574,1614095574),('Georgia','cs','',1614095574,1614095574),('Georgia','de','',1614095574,1614095574),('Georgia','en','',1614095574,1614095574),('Georgia','es','',1614095574,1614095574),('Georgia','fa','',1614095574,1614095574),('Georgia','fr','',1614095574,1614095574),('Georgia','hu','',1614095574,1614095574),('Georgia','it','',1614095574,1614095574),('Georgia','ja','',1614095574,1614095574),('Georgia','nl','',1614095574,1614095574),('Georgia','pl','',1614095574,1614095574),('Georgia','pt_BR','',1614095574,1614095574),('Georgia','ru','',1614095574,1614095574),('Georgia','sk','',1614095574,1614095574),('Georgia','sv','',1614095574,1614095574),('Georgia','sv_FI','',1614095574,1614095574),('Georgia','th','',1614095574,1614095574),('Georgia','tr','',1614095574,1614095574),('Georgia','uk','',1614095574,1614095574),('Georgia','zh_Hans','',1614095574,1614095574),('Germany','cs','',1614095574,1614095574),('Germany','de','',1614095574,1614095574),('Germany','en','',1614095574,1614095574),('Germany','es','',1614095574,1614095574),('Germany','fa','',1614095574,1614095574),('Germany','fr','',1614095574,1614095574),('Germany','hu','',1614095574,1614095574),('Germany','it','',1614095574,1614095574),('Germany','ja','',1614095574,1614095574),('Germany','nl','',1614095574,1614095574),('Germany','pl','',1614095574,1614095574),('Germany','pt_BR','',1614095574,1614095574),('Germany','ru','',1614095574,1614095574),('Germany','sk','',1614095574,1614095574),('Germany','sv','',1614095574,1614095574),('Germany','sv_FI','',1614095574,1614095574),('Germany','th','',1614095574,1614095574),('Germany','tr','',1614095574,1614095574),('Germany','uk','',1614095574,1614095574),('Germany','zh_Hans','',1614095574,1614095574),('Ghana','cs','',1614095575,1614095575),('Ghana','de','',1614095575,1614095575),('Ghana','en','',1614095575,1614095575),('Ghana','es','',1614095575,1614095575),('Ghana','fa','',1614095575,1614095575),('Ghana','fr','',1614095575,1614095575),('Ghana','hu','',1614095575,1614095575),('Ghana','it','',1614095575,1614095575),('Ghana','ja','',1614095575,1614095575),('Ghana','nl','',1614095575,1614095575),('Ghana','pl','',1614095575,1614095575),('Ghana','pt_BR','',1614095575,1614095575),('Ghana','ru','',1614095575,1614095575),('Ghana','sk','',1614095575,1614095575),('Ghana','sv','',1614095575,1614095575),('Ghana','sv_FI','',1614095575,1614095575),('Ghana','th','',1614095575,1614095575),('Ghana','tr','',1614095575,1614095575),('Ghana','uk','',1614095575,1614095575),('Ghana','zh_Hans','',1614095575,1614095575),('Gibraltar','cs','',1614095575,1614095575),('Gibraltar','de','',1614095575,1614095575),('Gibraltar','en','',1614095575,1614095575),('Gibraltar','es','',1614095575,1614095575),('Gibraltar','fa','',1614095575,1614095575),('Gibraltar','fr','',1614095575,1614095575),('Gibraltar','hu','',1614095575,1614095575),('Gibraltar','it','',1614095575,1614095575),('Gibraltar','ja','',1614095575,1614095575),('Gibraltar','nl','',1614095575,1614095575),('Gibraltar','pl','',1614095575,1614095575),('Gibraltar','pt_BR','',1614095575,1614095575),('Gibraltar','ru','',1614095575,1614095575),('Gibraltar','sk','',1614095575,1614095575),('Gibraltar','sv','',1614095575,1614095575),('Gibraltar','sv_FI','',1614095575,1614095575),('Gibraltar','th','',1614095575,1614095575),('Gibraltar','tr','',1614095575,1614095575),('Gibraltar','uk','',1614095575,1614095575),('Gibraltar','zh_Hans','',1614095575,1614095575),('Greece','cs','',1614095575,1614095575),('Greece','de','',1614095575,1614095575),('Greece','en','',1614095575,1614095575),('Greece','es','',1614095575,1614095575),('Greece','fa','',1614095575,1614095575),('Greece','fr','',1614095575,1614095575),('Greece','hu','',1614095575,1614095575),('Greece','it','',1614095575,1614095575),('Greece','ja','',1614095575,1614095575),('Greece','nl','',1614095575,1614095575),('Greece','pl','',1614095575,1614095575),('Greece','pt_BR','',1614095575,1614095575),('Greece','ru','',1614095575,1614095575),('Greece','sk','',1614095575,1614095575),('Greece','sv','',1614095575,1614095575),('Greece','sv_FI','',1614095575,1614095575),('Greece','th','',1614095575,1614095575),('Greece','tr','',1614095575,1614095575),('Greece','uk','',1614095575,1614095575),('Greece','zh_Hans','',1614095575,1614095575),('Greenland','cs','',1614095575,1614095575),('Greenland','de','',1614095575,1614095575),('Greenland','en','',1614095575,1614095575),('Greenland','es','',1614095575,1614095575),('Greenland','fa','',1614095575,1614095575),('Greenland','fr','',1614095575,1614095575),('Greenland','hu','',1614095575,1614095575),('Greenland','it','',1614095575,1614095575),('Greenland','ja','',1614095575,1614095575),('Greenland','nl','',1614095575,1614095575),('Greenland','pl','',1614095575,1614095575),('Greenland','pt_BR','',1614095575,1614095575),('Greenland','ru','',1614095575,1614095575),('Greenland','sk','',1614095575,1614095575),('Greenland','sv','',1614095575,1614095575),('Greenland','sv_FI','',1614095575,1614095575),('Greenland','th','',1614095575,1614095575),('Greenland','tr','',1614095575,1614095575),('Greenland','uk','',1614095575,1614095575),('Greenland','zh_Hans','',1614095575,1614095575),('Grenada','cs','',1614095575,1614095575),('Grenada','de','',1614095575,1614095575),('Grenada','en','',1614095575,1614095575),('Grenada','es','',1614095575,1614095575),('Grenada','fa','',1614095575,1614095575),('Grenada','fr','',1614095575,1614095575),('Grenada','hu','',1614095575,1614095575),('Grenada','it','',1614095575,1614095575),('Grenada','ja','',1614095575,1614095575),('Grenada','nl','',1614095575,1614095575),('Grenada','pl','',1614095575,1614095575),('Grenada','pt_BR','',1614095575,1614095575),('Grenada','ru','',1614095575,1614095575),('Grenada','sk','',1614095575,1614095575),('Grenada','sv','',1614095575,1614095575),('Grenada','sv_FI','',1614095575,1614095575),('Grenada','th','',1614095575,1614095575),('Grenada','tr','',1614095575,1614095575),('Grenada','uk','',1614095575,1614095575),('Grenada','zh_Hans','',1614095575,1614095575),('Guadeloupe','cs','',1614095575,1614095575),('Guadeloupe','de','',1614095575,1614095575),('Guadeloupe','en','',1614095575,1614095575),('Guadeloupe','es','',1614095575,1614095575),('Guadeloupe','fa','',1614095575,1614095575),('Guadeloupe','fr','',1614095575,1614095575),('Guadeloupe','hu','',1614095575,1614095575),('Guadeloupe','it','',1614095575,1614095575),('Guadeloupe','ja','',1614095575,1614095575),('Guadeloupe','nl','',1614095575,1614095575),('Guadeloupe','pl','',1614095575,1614095575),('Guadeloupe','pt_BR','',1614095575,1614095575),('Guadeloupe','ru','',1614095575,1614095575),('Guadeloupe','sk','',1614095575,1614095575),('Guadeloupe','sv','',1614095575,1614095575),('Guadeloupe','sv_FI','',1614095575,1614095575),('Guadeloupe','th','',1614095575,1614095575),('Guadeloupe','tr','',1614095575,1614095575),('Guadeloupe','uk','',1614095575,1614095575),('Guadeloupe','zh_Hans','',1614095575,1614095575),('Guam','cs','',1614095575,1614095575),('Guam','de','',1614095575,1614095575),('Guam','en','',1614095575,1614095575),('Guam','es','',1614095575,1614095575),('Guam','fa','',1614095575,1614095575),('Guam','fr','',1614095575,1614095575),('Guam','hu','',1614095575,1614095575),('Guam','it','',1614095575,1614095575),('Guam','ja','',1614095575,1614095575),('Guam','nl','',1614095575,1614095575),('Guam','pl','',1614095575,1614095575),('Guam','pt_BR','',1614095575,1614095575),('Guam','ru','',1614095575,1614095575),('Guam','sk','',1614095575,1614095575),('Guam','sv','',1614095575,1614095575),('Guam','sv_FI','',1614095575,1614095575),('Guam','th','',1614095575,1614095575),('Guam','tr','',1614095575,1614095575),('Guam','uk','',1614095575,1614095575),('Guam','zh_Hans','',1614095575,1614095575),('Guatemala','cs','',1614095575,1614095575),('Guatemala','de','',1614095575,1614095575),('Guatemala','en','',1614095575,1614095575),('Guatemala','es','',1614095575,1614095575),('Guatemala','fa','',1614095575,1614095575),('Guatemala','fr','',1614095575,1614095575),('Guatemala','hu','',1614095575,1614095575),('Guatemala','it','',1614095575,1614095575),('Guatemala','ja','',1614095575,1614095575),('Guatemala','nl','',1614095575,1614095575),('Guatemala','pl','',1614095575,1614095575),('Guatemala','pt_BR','',1614095575,1614095575),('Guatemala','ru','',1614095575,1614095575),('Guatemala','sk','',1614095575,1614095575),('Guatemala','sv','',1614095575,1614095575),('Guatemala','sv_FI','',1614095575,1614095575),('Guatemala','th','',1614095575,1614095575),('Guatemala','tr','',1614095575,1614095575),('Guatemala','uk','',1614095575,1614095575),('Guatemala','zh_Hans','',1614095575,1614095575),('Guernsey','cs','',1614095575,1614095575),('Guernsey','de','',1614095575,1614095575),('Guernsey','en','',1614095575,1614095575),('Guernsey','es','',1614095575,1614095575),('Guernsey','fa','',1614095575,1614095575),('Guernsey','fr','',1614095575,1614095575),('Guernsey','hu','',1614095575,1614095575),('Guernsey','it','',1614095575,1614095575),('Guernsey','ja','',1614095575,1614095575),('Guernsey','nl','',1614095575,1614095575),('Guernsey','pl','',1614095575,1614095575),('Guernsey','pt_BR','',1614095575,1614095575),('Guernsey','ru','',1614095575,1614095575),('Guernsey','sk','',1614095575,1614095575),('Guernsey','sv','',1614095575,1614095575),('Guernsey','sv_FI','',1614095575,1614095575),('Guernsey','th','',1614095575,1614095575),('Guernsey','tr','',1614095575,1614095575),('Guernsey','uk','',1614095575,1614095575),('Guernsey','zh_Hans','',1614095575,1614095575),('Guinea','cs','',1614095575,1614095575),('Guinea','de','',1614095575,1614095575),('Guinea','en','',1614095575,1614095575),('Guinea','es','',1614095575,1614095575),('Guinea','fa','',1614095575,1614095575),('Guinea','fr','',1614095575,1614095575),('Guinea','hu','',1614095575,1614095575),('Guinea','it','',1614095575,1614095575),('Guinea','ja','',1614095575,1614095575),('Guinea','nl','',1614095575,1614095575),('Guinea','pl','',1614095575,1614095575),('Guinea','pt_BR','',1614095575,1614095575),('Guinea','ru','',1614095575,1614095575),('Guinea','sk','',1614095575,1614095575),('Guinea','sv','',1614095575,1614095575),('Guinea','sv_FI','',1614095575,1614095575),('Guinea','th','',1614095575,1614095575),('Guinea','tr','',1614095575,1614095575),('Guinea','uk','',1614095575,1614095575),('Guinea','zh_Hans','',1614095575,1614095575),('Guinea-Bissau','cs','',1614095576,1614095576),('Guinea-Bissau','de','',1614095576,1614095576),('Guinea-Bissau','en','',1614095576,1614095576),('Guinea-Bissau','es','',1614095576,1614095576),('Guinea-Bissau','fa','',1614095576,1614095576),('Guinea-Bissau','fr','',1614095576,1614095576),('Guinea-Bissau','hu','',1614095576,1614095576),('Guinea-Bissau','it','',1614095576,1614095576),('Guinea-Bissau','ja','',1614095576,1614095576),('Guinea-Bissau','nl','',1614095576,1614095576),('Guinea-Bissau','pl','',1614095576,1614095576),('Guinea-Bissau','pt_BR','',1614095576,1614095576),('Guinea-Bissau','ru','',1614095576,1614095576),('Guinea-Bissau','sk','',1614095576,1614095576),('Guinea-Bissau','sv','',1614095576,1614095576),('Guinea-Bissau','sv_FI','',1614095576,1614095576),('Guinea-Bissau','th','',1614095576,1614095576),('Guinea-Bissau','tr','',1614095576,1614095576),('Guinea-Bissau','uk','',1614095576,1614095576),('Guinea-Bissau','zh_Hans','',1614095576,1614095576),('Guyana','cs','',1614095576,1614095576),('Guyana','de','',1614095576,1614095576),('Guyana','en','',1614095576,1614095576),('Guyana','es','',1614095576,1614095576),('Guyana','fa','',1614095576,1614095576),('Guyana','fr','',1614095576,1614095576),('Guyana','hu','',1614095576,1614095576),('Guyana','it','',1614095576,1614095576),('Guyana','ja','',1614095576,1614095576),('Guyana','nl','',1614095576,1614095576),('Guyana','pl','',1614095576,1614095576),('Guyana','pt_BR','',1614095576,1614095576),('Guyana','ru','',1614095576,1614095576),('Guyana','sk','',1614095576,1614095576),('Guyana','sv','',1614095576,1614095576),('Guyana','sv_FI','',1614095576,1614095576),('Guyana','th','',1614095576,1614095576),('Guyana','tr','',1614095576,1614095576),('Guyana','uk','',1614095576,1614095576),('Guyana','zh_Hans','',1614095576,1614095576),('Haiti','cs','',1614095576,1614095576),('Haiti','de','',1614095576,1614095576),('Haiti','en','',1614095576,1614095576),('Haiti','es','',1614095576,1614095576),('Haiti','fa','',1614095576,1614095576),('Haiti','fr','',1614095576,1614095576),('Haiti','hu','',1614095576,1614095576),('Haiti','it','',1614095576,1614095576),('Haiti','ja','',1614095576,1614095576),('Haiti','nl','',1614095576,1614095576),('Haiti','pl','',1614095576,1614095576),('Haiti','pt_BR','',1614095576,1614095576),('Haiti','ru','',1614095576,1614095576),('Haiti','sk','',1614095576,1614095576),('Haiti','sv','',1614095576,1614095576),('Haiti','sv_FI','',1614095576,1614095576),('Haiti','th','',1614095576,1614095576),('Haiti','tr','',1614095576,1614095576),('Haiti','uk','',1614095576,1614095576),('Haiti','zh_Hans','',1614095576,1614095576),('Half Sleeves','cs','',1614096675,1614096675),('Half Sleeves','de','',1614096675,1614096675),('Half Sleeves','en','',1614096675,1614096675),('Half Sleeves','es','',1614096675,1614096675),('Half Sleeves','fa','',1614096675,1614096675),('Half Sleeves','fr','',1614096675,1614096675),('Half Sleeves','hu','',1614096675,1614096675),('Half Sleeves','it','',1614096675,1614096675),('Half Sleeves','ja','',1614096675,1614096675),('Half Sleeves','nl','',1614096675,1614096675),('Half Sleeves','pl','',1614096675,1614096675),('Half Sleeves','pt_BR','',1614096675,1614096675),('Half Sleeves','ru','',1614096675,1614096675),('Half Sleeves','sk','',1614096675,1614096675),('Half Sleeves','sv','',1614096675,1614096675),('Half Sleeves','sv_FI','',1614096675,1614096675),('Half Sleeves','th','',1614096675,1614096675),('Half Sleeves','tr','',1614096675,1614096675),('Half Sleeves','uk','',1614096675,1614096675),('Half Sleeves','zh_Hans','',1614096675,1614096675),('Heard & McDonald Islands','cs','',1614095576,1614095576),('Heard & McDonald Islands','de','',1614095576,1614095576),('Heard & McDonald Islands','en','',1614095576,1614095576),('Heard & McDonald Islands','es','',1614095576,1614095576),('Heard & McDonald Islands','fa','',1614095576,1614095576),('Heard & McDonald Islands','fr','',1614095576,1614095576),('Heard & McDonald Islands','hu','',1614095576,1614095576),('Heard & McDonald Islands','it','',1614095576,1614095576),('Heard & McDonald Islands','ja','',1614095576,1614095576),('Heard & McDonald Islands','nl','',1614095576,1614095576),('Heard & McDonald Islands','pl','',1614095576,1614095576),('Heard & McDonald Islands','pt_BR','',1614095576,1614095576),('Heard & McDonald Islands','ru','',1614095576,1614095576),('Heard & McDonald Islands','sk','',1614095576,1614095576),('Heard & McDonald Islands','sv','',1614095576,1614095576),('Heard & McDonald Islands','sv_FI','',1614095576,1614095576),('Heard & McDonald Islands','th','',1614095576,1614095576),('Heard & McDonald Islands','tr','',1614095576,1614095576),('Heard & McDonald Islands','uk','',1614095576,1614095576),('Heard & McDonald Islands','zh_Hans','',1614095576,1614095576),('Honduras','cs','',1614095576,1614095576),('Honduras','de','',1614095576,1614095576),('Honduras','en','',1614095576,1614095576),('Honduras','es','',1614095576,1614095576),('Honduras','fa','',1614095576,1614095576),('Honduras','fr','',1614095576,1614095576),('Honduras','hu','',1614095576,1614095576),('Honduras','it','',1614095576,1614095576),('Honduras','ja','',1614095576,1614095576),('Honduras','nl','',1614095576,1614095576),('Honduras','pl','',1614095576,1614095576),('Honduras','pt_BR','',1614095576,1614095576),('Honduras','ru','',1614095576,1614095576),('Honduras','sk','',1614095576,1614095576),('Honduras','sv','',1614095576,1614095576),('Honduras','sv_FI','',1614095576,1614095576),('Honduras','th','',1614095576,1614095576),('Honduras','tr','',1614095576,1614095576),('Honduras','uk','',1614095576,1614095576),('Honduras','zh_Hans','',1614095576,1614095576),('Hong Kong SAR China','cs','',1614095576,1614095576),('Hong Kong SAR China','de','',1614095576,1614095576),('Hong Kong SAR China','en','',1614095576,1614095576),('Hong Kong SAR China','es','',1614095576,1614095576),('Hong Kong SAR China','fa','',1614095576,1614095576),('Hong Kong SAR China','fr','',1614095576,1614095576),('Hong Kong SAR China','hu','',1614095576,1614095576),('Hong Kong SAR China','it','',1614095576,1614095576),('Hong Kong SAR China','ja','',1614095576,1614095576),('Hong Kong SAR China','nl','',1614095576,1614095576),('Hong Kong SAR China','pl','',1614095576,1614095576),('Hong Kong SAR China','pt_BR','',1614095576,1614095576),('Hong Kong SAR China','ru','',1614095576,1614095576),('Hong Kong SAR China','sk','',1614095576,1614095576),('Hong Kong SAR China','sv','',1614095576,1614095576),('Hong Kong SAR China','sv_FI','',1614095576,1614095576),('Hong Kong SAR China','th','',1614095576,1614095576),('Hong Kong SAR China','tr','',1614095576,1614095576),('Hong Kong SAR China','uk','',1614095576,1614095576),('Hong Kong SAR China','zh_Hans','',1614095576,1614095576),('Hungary','cs','',1614095576,1614095576),('Hungary','de','',1614095576,1614095576),('Hungary','en','',1614095576,1614095576),('Hungary','es','',1614095576,1614095576),('Hungary','fa','',1614095576,1614095576),('Hungary','fr','',1614095576,1614095576),('Hungary','hu','',1614095576,1614095576),('Hungary','it','',1614095576,1614095576),('Hungary','ja','',1614095576,1614095576),('Hungary','nl','',1614095576,1614095576),('Hungary','pl','',1614095576,1614095576),('Hungary','pt_BR','',1614095576,1614095576),('Hungary','ru','',1614095576,1614095576),('Hungary','sk','',1614095576,1614095576),('Hungary','sv','',1614095576,1614095576),('Hungary','sv_FI','',1614095576,1614095576),('Hungary','th','',1614095576,1614095576),('Hungary','tr','',1614095576,1614095576),('Hungary','uk','',1614095576,1614095576),('Hungary','zh_Hans','',1614095576,1614095576),('Iceland','cs','',1614095576,1614095576),('Iceland','de','',1614095576,1614095576),('Iceland','en','',1614095576,1614095576),('Iceland','es','',1614095576,1614095576),('Iceland','fa','',1614095576,1614095576),('Iceland','fr','',1614095576,1614095576),('Iceland','hu','',1614095576,1614095576),('Iceland','it','',1614095576,1614095576),('Iceland','ja','',1614095576,1614095576),('Iceland','nl','',1614095576,1614095576),('Iceland','pl','',1614095576,1614095576),('Iceland','pt_BR','',1614095576,1614095576),('Iceland','ru','',1614095576,1614095576),('Iceland','sk','',1614095576,1614095576),('Iceland','sv','',1614095576,1614095576),('Iceland','sv_FI','',1614095576,1614095576),('Iceland','th','',1614095576,1614095576),('Iceland','tr','',1614095576,1614095576),('Iceland','uk','',1614095576,1614095576),('Iceland','zh_Hans','',1614095576,1614095576),('India','cs','',1614095576,1614095576),('India','de','',1614095576,1614095576),('India','en','',1614095576,1614095576),('India','es','',1614095576,1614095576),('India','fa','',1614095576,1614095576),('India','fr','',1614095576,1614095576),('India','hu','',1614095576,1614095576),('India','it','',1614095576,1614095576),('India','ja','',1614095576,1614095576),('India','nl','',1614095576,1614095576),('India','pl','',1614095576,1614095576),('India','pt_BR','',1614095576,1614095576),('India','ru','',1614095576,1614095576),('India','sk','',1614095576,1614095576),('India','sv','',1614095576,1614095576),('India','sv_FI','',1614095576,1614095576),('India','th','',1614095576,1614095576),('India','tr','',1614095576,1614095576),('India','uk','',1614095576,1614095576),('India','zh_Hans','',1614095576,1614095576),('Indonesia','cs','',1614095577,1614095577),('Indonesia','de','',1614095577,1614095577),('Indonesia','en','',1614095577,1614095577),('Indonesia','es','',1614095577,1614095577),('Indonesia','fa','',1614095577,1614095577),('Indonesia','fr','',1614095577,1614095577),('Indonesia','hu','',1614095577,1614095577),('Indonesia','it','',1614095577,1614095577),('Indonesia','ja','',1614095577,1614095577),('Indonesia','nl','',1614095577,1614095577),('Indonesia','pl','',1614095577,1614095577),('Indonesia','pt_BR','',1614095577,1614095577),('Indonesia','ru','',1614095577,1614095577),('Indonesia','sk','',1614095577,1614095577),('Indonesia','sv','',1614095577,1614095577),('Indonesia','sv_FI','',1614095577,1614095577),('Indonesia','th','',1614095577,1614095577),('Indonesia','tr','',1614095577,1614095577),('Indonesia','uk','',1614095577,1614095577),('Indonesia','zh_Hans','',1614095577,1614095577),('Iran','cs','',1614095577,1614095577),('Iran','de','',1614095577,1614095577),('Iran','en','',1614095577,1614095577),('Iran','es','',1614095577,1614095577),('Iran','fa','',1614095577,1614095577),('Iran','fr','',1614095577,1614095577),('Iran','hu','',1614095577,1614095577),('Iran','it','',1614095577,1614095577),('Iran','ja','',1614095577,1614095577),('Iran','nl','',1614095577,1614095577),('Iran','pl','',1614095577,1614095577),('Iran','pt_BR','',1614095577,1614095577),('Iran','ru','',1614095577,1614095577),('Iran','sk','',1614095577,1614095577),('Iran','sv','',1614095577,1614095577),('Iran','sv_FI','',1614095577,1614095577),('Iran','th','',1614095577,1614095577),('Iran','tr','',1614095577,1614095577),('Iran','uk','',1614095577,1614095577),('Iran','zh_Hans','',1614095577,1614095577),('Iraq','cs','',1614095577,1614095577),('Iraq','de','',1614095577,1614095577),('Iraq','en','',1614095577,1614095577),('Iraq','es','',1614095577,1614095577),('Iraq','fa','',1614095577,1614095577),('Iraq','fr','',1614095577,1614095577),('Iraq','hu','',1614095577,1614095577),('Iraq','it','',1614095577,1614095577),('Iraq','ja','',1614095577,1614095577),('Iraq','nl','',1614095577,1614095577),('Iraq','pl','',1614095577,1614095577),('Iraq','pt_BR','',1614095577,1614095577),('Iraq','ru','',1614095577,1614095577),('Iraq','sk','',1614095577,1614095577),('Iraq','sv','',1614095577,1614095577),('Iraq','sv_FI','',1614095577,1614095577),('Iraq','th','',1614095577,1614095577),('Iraq','tr','',1614095577,1614095577),('Iraq','uk','',1614095577,1614095577),('Iraq','zh_Hans','',1614095577,1614095577),('Ireland','cs','',1614095577,1614095577),('Ireland','de','',1614095577,1614095577),('Ireland','en','',1614095577,1614095577),('Ireland','es','',1614095577,1614095577),('Ireland','fa','',1614095577,1614095577),('Ireland','fr','',1614095577,1614095577),('Ireland','hu','',1614095577,1614095577),('Ireland','it','',1614095577,1614095577),('Ireland','ja','',1614095577,1614095577),('Ireland','nl','',1614095577,1614095577),('Ireland','pl','',1614095577,1614095577),('Ireland','pt_BR','',1614095577,1614095577),('Ireland','ru','',1614095577,1614095577),('Ireland','sk','',1614095577,1614095577),('Ireland','sv','',1614095577,1614095577),('Ireland','sv_FI','',1614095577,1614095577),('Ireland','th','',1614095577,1614095577),('Ireland','tr','',1614095577,1614095577),('Ireland','uk','',1614095577,1614095577),('Ireland','zh_Hans','',1614095577,1614095577),('Isle of Man','cs','',1614095577,1614095577),('Isle of Man','de','',1614095577,1614095577),('Isle of Man','en','',1614095577,1614095577),('Isle of Man','es','',1614095577,1614095577),('Isle of Man','fa','',1614095577,1614095577),('Isle of Man','fr','',1614095577,1614095577),('Isle of Man','hu','',1614095577,1614095577),('Isle of Man','it','',1614095577,1614095577),('Isle of Man','ja','',1614095577,1614095577),('Isle of Man','nl','',1614095577,1614095577),('Isle of Man','pl','',1614095577,1614095577),('Isle of Man','pt_BR','',1614095577,1614095577),('Isle of Man','ru','',1614095577,1614095577),('Isle of Man','sk','',1614095577,1614095577),('Isle of Man','sv','',1614095577,1614095577),('Isle of Man','sv_FI','',1614095577,1614095577),('Isle of Man','th','',1614095577,1614095577),('Isle of Man','tr','',1614095577,1614095577),('Isle of Man','uk','',1614095577,1614095577),('Isle of Man','zh_Hans','',1614095577,1614095577),('Israel','cs','',1614095577,1614095577),('Israel','de','',1614095577,1614095577),('Israel','en','',1614095577,1614095577),('Israel','es','',1614095577,1614095577),('Israel','fa','',1614095577,1614095577),('Israel','fr','',1614095577,1614095577),('Israel','hu','',1614095577,1614095577),('Israel','it','',1614095577,1614095577),('Israel','ja','',1614095577,1614095577),('Israel','nl','',1614095577,1614095577),('Israel','pl','',1614095577,1614095577),('Israel','pt_BR','',1614095577,1614095577),('Israel','ru','',1614095577,1614095577),('Israel','sk','',1614095577,1614095577),('Israel','sv','',1614095577,1614095577),('Israel','sv_FI','',1614095577,1614095577),('Israel','th','',1614095577,1614095577),('Israel','tr','',1614095577,1614095577),('Israel','uk','',1614095577,1614095577),('Israel','zh_Hans','',1614095577,1614095577),('Italy','cs','',1614095577,1614095577),('Italy','de','',1614095577,1614095577),('Italy','en','',1614095577,1614095577),('Italy','es','',1614095577,1614095577),('Italy','fa','',1614095577,1614095577),('Italy','fr','',1614095577,1614095577),('Italy','hu','',1614095577,1614095577),('Italy','it','',1614095577,1614095577),('Italy','ja','',1614095577,1614095577),('Italy','nl','',1614095577,1614095577),('Italy','pl','',1614095577,1614095577),('Italy','pt_BR','',1614095577,1614095577),('Italy','ru','',1614095577,1614095577),('Italy','sk','',1614095577,1614095577),('Italy','sv','',1614095577,1614095577),('Italy','sv_FI','',1614095577,1614095577),('Italy','th','',1614095577,1614095577),('Italy','tr','',1614095577,1614095577),('Italy','uk','',1614095577,1614095577),('Italy','zh_Hans','',1614095577,1614095577),('Jamaica','cs','',1614095577,1614095577),('Jamaica','de','',1614095577,1614095577),('Jamaica','en','',1614095577,1614095577),('Jamaica','es','',1614095577,1614095577),('Jamaica','fa','',1614095577,1614095577),('Jamaica','fr','',1614095577,1614095577),('Jamaica','hu','',1614095577,1614095577),('Jamaica','it','',1614095577,1614095577),('Jamaica','ja','',1614095577,1614095577),('Jamaica','nl','',1614095577,1614095577),('Jamaica','pl','',1614095577,1614095577),('Jamaica','pt_BR','',1614095577,1614095577),('Jamaica','ru','',1614095577,1614095577),('Jamaica','sk','',1614095577,1614095577),('Jamaica','sv','',1614095577,1614095577),('Jamaica','sv_FI','',1614095577,1614095577),('Jamaica','th','',1614095577,1614095577),('Jamaica','tr','',1614095577,1614095577),('Jamaica','uk','',1614095577,1614095577),('Jamaica','zh_Hans','',1614095577,1614095577),('Japan','cs','',1614095577,1614095577),('Japan','de','',1614095577,1614095577),('Japan','en','',1614095577,1614095577),('Japan','es','',1614095577,1614095577),('Japan','fa','',1614095577,1614095577),('Japan','fr','',1614095577,1614095577),('Japan','hu','',1614095577,1614095577),('Japan','it','',1614095577,1614095577),('Japan','ja','',1614095577,1614095577),('Japan','nl','',1614095577,1614095577),('Japan','pl','',1614095577,1614095577),('Japan','pt_BR','',1614095577,1614095577),('Japan','ru','',1614095577,1614095577),('Japan','sk','',1614095577,1614095577),('Japan','sv','',1614095577,1614095577),('Japan','sv_FI','',1614095577,1614095577),('Japan','th','',1614095577,1614095577),('Japan','tr','',1614095577,1614095577),('Japan','uk','',1614095577,1614095577),('Japan','zh_Hans','',1614095577,1614095577),('Jersey','cs','',1614095577,1614095577),('Jersey','de','',1614095577,1614095577),('Jersey','en','',1614095577,1614095577),('Jersey','es','',1614095577,1614095577),('Jersey','fa','',1614095577,1614095577),('Jersey','fr','',1614095577,1614095577),('Jersey','hu','',1614095577,1614095577),('Jersey','it','',1614095577,1614095577),('Jersey','ja','',1614095577,1614095577),('Jersey','nl','',1614095577,1614095577),('Jersey','pl','',1614095577,1614095577),('Jersey','pt_BR','',1614095577,1614095577),('Jersey','ru','',1614095577,1614095577),('Jersey','sk','',1614095577,1614095577),('Jersey','sv','',1614095577,1614095577),('Jersey','sv_FI','',1614095577,1614095577),('Jersey','th','',1614095577,1614095577),('Jersey','tr','',1614095577,1614095577),('Jersey','uk','',1614095577,1614095577),('Jersey','zh_Hans','',1614095577,1614095577),('Jordan','cs','',1614095578,1614095578),('Jordan','de','',1614095578,1614095578),('Jordan','en','',1614095578,1614095578),('Jordan','es','',1614095578,1614095578),('Jordan','fa','',1614095578,1614095578),('Jordan','fr','',1614095578,1614095578),('Jordan','hu','',1614095578,1614095578),('Jordan','it','',1614095578,1614095578),('Jordan','ja','',1614095578,1614095578),('Jordan','nl','',1614095578,1614095578),('Jordan','pl','',1614095578,1614095578),('Jordan','pt_BR','',1614095578,1614095578),('Jordan','ru','',1614095578,1614095578),('Jordan','sk','',1614095578,1614095578),('Jordan','sv','',1614095578,1614095578),('Jordan','sv_FI','',1614095578,1614095578),('Jordan','th','',1614095578,1614095578),('Jordan','tr','',1614095578,1614095578),('Jordan','uk','',1614095578,1614095578),('Jordan','zh_Hans','',1614095578,1614095578),('Kazakhstan','cs','',1614095578,1614095578),('Kazakhstan','de','',1614095578,1614095578),('Kazakhstan','en','',1614095578,1614095578),('Kazakhstan','es','',1614095578,1614095578),('Kazakhstan','fa','',1614095578,1614095578),('Kazakhstan','fr','',1614095578,1614095578),('Kazakhstan','hu','',1614095578,1614095578),('Kazakhstan','it','',1614095578,1614095578),('Kazakhstan','ja','',1614095578,1614095578),('Kazakhstan','nl','',1614095578,1614095578),('Kazakhstan','pl','',1614095578,1614095578),('Kazakhstan','pt_BR','',1614095578,1614095578),('Kazakhstan','ru','',1614095578,1614095578),('Kazakhstan','sk','',1614095578,1614095578),('Kazakhstan','sv','',1614095578,1614095578),('Kazakhstan','sv_FI','',1614095578,1614095578),('Kazakhstan','th','',1614095578,1614095578),('Kazakhstan','tr','',1614095578,1614095578),('Kazakhstan','uk','',1614095578,1614095578),('Kazakhstan','zh_Hans','',1614095578,1614095578),('Kenya','cs','',1614095578,1614095578),('Kenya','de','',1614095578,1614095578),('Kenya','en','',1614095578,1614095578),('Kenya','es','',1614095578,1614095578),('Kenya','fa','',1614095578,1614095578),('Kenya','fr','',1614095578,1614095578),('Kenya','hu','',1614095578,1614095578),('Kenya','it','',1614095578,1614095578),('Kenya','ja','',1614095578,1614095578),('Kenya','nl','',1614095578,1614095578),('Kenya','pl','',1614095578,1614095578),('Kenya','pt_BR','',1614095578,1614095578),('Kenya','ru','',1614095578,1614095578),('Kenya','sk','',1614095578,1614095578),('Kenya','sv','',1614095578,1614095578),('Kenya','sv_FI','',1614095578,1614095578),('Kenya','th','',1614095578,1614095578),('Kenya','tr','',1614095578,1614095578),('Kenya','uk','',1614095578,1614095578),('Kenya','zh_Hans','',1614095578,1614095578),('Kiribati','cs','',1614095578,1614095578),('Kiribati','de','',1614095578,1614095578),('Kiribati','en','',1614095578,1614095578),('Kiribati','es','',1614095578,1614095578),('Kiribati','fa','',1614095578,1614095578),('Kiribati','fr','',1614095578,1614095578),('Kiribati','hu','',1614095578,1614095578),('Kiribati','it','',1614095578,1614095578),('Kiribati','ja','',1614095578,1614095578),('Kiribati','nl','',1614095578,1614095578),('Kiribati','pl','',1614095578,1614095578),('Kiribati','pt_BR','',1614095578,1614095578),('Kiribati','ru','',1614095578,1614095578),('Kiribati','sk','',1614095578,1614095578),('Kiribati','sv','',1614095578,1614095578),('Kiribati','sv_FI','',1614095578,1614095578),('Kiribati','th','',1614095578,1614095578),('Kiribati','tr','',1614095578,1614095578),('Kiribati','uk','',1614095578,1614095578),('Kiribati','zh_Hans','',1614095578,1614095578),('Kuwait','cs','',1614095578,1614095578),('Kuwait','de','',1614095578,1614095578),('Kuwait','en','',1614095578,1614095578),('Kuwait','es','',1614095578,1614095578),('Kuwait','fa','',1614095578,1614095578),('Kuwait','fr','',1614095578,1614095578),('Kuwait','hu','',1614095578,1614095578),('Kuwait','it','',1614095578,1614095578),('Kuwait','ja','',1614095578,1614095578),('Kuwait','nl','',1614095578,1614095578),('Kuwait','pl','',1614095578,1614095578),('Kuwait','pt_BR','',1614095578,1614095578),('Kuwait','ru','',1614095578,1614095578),('Kuwait','sk','',1614095578,1614095578),('Kuwait','sv','',1614095578,1614095578),('Kuwait','sv_FI','',1614095578,1614095578),('Kuwait','th','',1614095578,1614095578),('Kuwait','tr','',1614095578,1614095578),('Kuwait','uk','',1614095578,1614095578),('Kuwait','zh_Hans','',1614095578,1614095578),('Kyrgyzstan','cs','',1614095578,1614095578),('Kyrgyzstan','de','',1614095578,1614095578),('Kyrgyzstan','en','',1614095578,1614095578),('Kyrgyzstan','es','',1614095578,1614095578),('Kyrgyzstan','fa','',1614095578,1614095578),('Kyrgyzstan','fr','',1614095578,1614095578),('Kyrgyzstan','hu','',1614095578,1614095578),('Kyrgyzstan','it','',1614095578,1614095578),('Kyrgyzstan','ja','',1614095578,1614095578),('Kyrgyzstan','nl','',1614095578,1614095578),('Kyrgyzstan','pl','',1614095578,1614095578),('Kyrgyzstan','pt_BR','',1614095578,1614095578),('Kyrgyzstan','ru','',1614095578,1614095578),('Kyrgyzstan','sk','',1614095578,1614095578),('Kyrgyzstan','sv','',1614095578,1614095578),('Kyrgyzstan','sv_FI','',1614095578,1614095578),('Kyrgyzstan','th','',1614095578,1614095578),('Kyrgyzstan','tr','',1614095578,1614095578),('Kyrgyzstan','uk','',1614095578,1614095578),('Kyrgyzstan','zh_Hans','',1614095578,1614095578),('L','cs','',1614095565,1614095565),('L','de','',1614095565,1614095565),('L','en','',1614095565,1614095565),('L','es','',1614095565,1614095565),('L','fa','',1614095565,1614095565),('L','fr','',1614095565,1614095565),('L','hu','',1614095565,1614095565),('L','it','',1614095565,1614095565),('L','ja','',1614095565,1614095565),('L','nl','',1614095565,1614095565),('L','pl','',1614095565,1614095565),('L','pt_BR','',1614095565,1614095565),('L','ru','',1614095565,1614095565),('L','sk','',1614095565,1614095565),('L','sv','',1614095565,1614095565),('L','sv_FI','',1614095565,1614095565),('L','th','',1614095565,1614095565),('L','tr','',1614095565,1614095565),('L','uk','',1614095565,1614095565),('L','zh_Hans','',1614095565,1614095565),('Laos','cs','',1614095578,1614095578),('Laos','de','',1614095578,1614095578),('Laos','en','',1614095578,1614095578),('Laos','es','',1614095578,1614095578),('Laos','fa','',1614095578,1614095578),('Laos','fr','',1614095578,1614095578),('Laos','hu','',1614095578,1614095578),('Laos','it','',1614095578,1614095578),('Laos','ja','',1614095578,1614095578),('Laos','nl','',1614095578,1614095578),('Laos','pl','',1614095578,1614095578),('Laos','pt_BR','',1614095578,1614095578),('Laos','ru','',1614095578,1614095578),('Laos','sk','',1614095578,1614095578),('Laos','sv','',1614095578,1614095578),('Laos','sv_FI','',1614095578,1614095578),('Laos','th','',1614095578,1614095578),('Laos','tr','',1614095578,1614095578),('Laos','uk','',1614095578,1614095578),('Laos','zh_Hans','',1614095578,1614095578),('Latvia','cs','',1614095578,1614095578),('Latvia','de','',1614095578,1614095578),('Latvia','en','',1614095578,1614095578),('Latvia','es','',1614095578,1614095578),('Latvia','fa','',1614095578,1614095578),('Latvia','fr','',1614095578,1614095578),('Latvia','hu','',1614095578,1614095578),('Latvia','it','',1614095578,1614095578),('Latvia','ja','',1614095578,1614095578),('Latvia','nl','',1614095578,1614095578),('Latvia','pl','',1614095578,1614095578),('Latvia','pt_BR','',1614095578,1614095578),('Latvia','ru','',1614095578,1614095578),('Latvia','sk','',1614095578,1614095578),('Latvia','sv','',1614095578,1614095578),('Latvia','sv_FI','',1614095578,1614095578),('Latvia','th','',1614095578,1614095578),('Latvia','tr','',1614095578,1614095578),('Latvia','uk','',1614095578,1614095578),('Latvia','zh_Hans','',1614095578,1614095578),('Lebanon','cs','',1614095578,1614095578),('Lebanon','de','',1614095578,1614095578),('Lebanon','en','',1614095578,1614095578),('Lebanon','es','',1614095578,1614095578),('Lebanon','fa','',1614095578,1614095578),('Lebanon','fr','',1614095578,1614095578),('Lebanon','hu','',1614095578,1614095578),('Lebanon','it','',1614095578,1614095578),('Lebanon','ja','',1614095578,1614095578),('Lebanon','nl','',1614095578,1614095578),('Lebanon','pl','',1614095578,1614095578),('Lebanon','pt_BR','',1614095578,1614095578),('Lebanon','ru','',1614095578,1614095578),('Lebanon','sk','',1614095578,1614095578),('Lebanon','sv','',1614095578,1614095578),('Lebanon','sv_FI','',1614095578,1614095578),('Lebanon','th','',1614095578,1614095578),('Lebanon','tr','',1614095578,1614095578),('Lebanon','uk','',1614095578,1614095578),('Lebanon','zh_Hans','',1614095578,1614095578),('Lesotho','cs','',1614095578,1614095578),('Lesotho','de','',1614095578,1614095578),('Lesotho','en','',1614095578,1614095578),('Lesotho','es','',1614095578,1614095578),('Lesotho','fa','',1614095578,1614095578),('Lesotho','fr','',1614095578,1614095578),('Lesotho','hu','',1614095578,1614095578),('Lesotho','it','',1614095578,1614095578),('Lesotho','ja','',1614095578,1614095578),('Lesotho','nl','',1614095578,1614095578),('Lesotho','pl','',1614095578,1614095578),('Lesotho','pt_BR','',1614095578,1614095578),('Lesotho','ru','',1614095578,1614095578),('Lesotho','sk','',1614095578,1614095578),('Lesotho','sv','',1614095578,1614095578),('Lesotho','sv_FI','',1614095578,1614095578),('Lesotho','th','',1614095578,1614095578),('Lesotho','tr','',1614095578,1614095578),('Lesotho','uk','',1614095578,1614095578),('Lesotho','zh_Hans','',1614095578,1614095578),('Liberia','cs','',1614095579,1614095579),('Liberia','de','',1614095579,1614095579),('Liberia','en','',1614095579,1614095579),('Liberia','es','',1614095579,1614095579),('Liberia','fa','',1614095579,1614095579),('Liberia','fr','',1614095579,1614095579),('Liberia','hu','',1614095579,1614095579),('Liberia','it','',1614095579,1614095579),('Liberia','ja','',1614095579,1614095579),('Liberia','nl','',1614095579,1614095579),('Liberia','pl','',1614095579,1614095579),('Liberia','pt_BR','',1614095579,1614095579),('Liberia','ru','',1614095579,1614095579),('Liberia','sk','',1614095579,1614095579),('Liberia','sv','',1614095579,1614095579),('Liberia','sv_FI','',1614095579,1614095579),('Liberia','th','',1614095579,1614095579),('Liberia','tr','',1614095579,1614095579),('Liberia','uk','',1614095579,1614095579),('Liberia','zh_Hans','',1614095579,1614095579),('Libya','cs','',1614095579,1614095579),('Libya','de','',1614095579,1614095579),('Libya','en','',1614095579,1614095579),('Libya','es','',1614095579,1614095579),('Libya','fa','',1614095579,1614095579),('Libya','fr','',1614095579,1614095579),('Libya','hu','',1614095579,1614095579),('Libya','it','',1614095579,1614095579),('Libya','ja','',1614095579,1614095579),('Libya','nl','',1614095579,1614095579),('Libya','pl','',1614095579,1614095579),('Libya','pt_BR','',1614095579,1614095579),('Libya','ru','',1614095579,1614095579),('Libya','sk','',1614095579,1614095579),('Libya','sv','',1614095579,1614095579),('Libya','sv_FI','',1614095579,1614095579),('Libya','th','',1614095579,1614095579),('Libya','tr','',1614095579,1614095579),('Libya','uk','',1614095579,1614095579),('Libya','zh_Hans','',1614095579,1614095579),('Liechtenstein','cs','',1614095579,1614095579),('Liechtenstein','de','',1614095579,1614095579),('Liechtenstein','en','',1614095579,1614095579),('Liechtenstein','es','',1614095579,1614095579),('Liechtenstein','fa','',1614095579,1614095579),('Liechtenstein','fr','',1614095579,1614095579),('Liechtenstein','hu','',1614095579,1614095579),('Liechtenstein','it','',1614095579,1614095579),('Liechtenstein','ja','',1614095579,1614095579),('Liechtenstein','nl','',1614095579,1614095579),('Liechtenstein','pl','',1614095579,1614095579),('Liechtenstein','pt_BR','',1614095579,1614095579),('Liechtenstein','ru','',1614095579,1614095579),('Liechtenstein','sk','',1614095579,1614095579),('Liechtenstein','sv','',1614095579,1614095579),('Liechtenstein','sv_FI','',1614095579,1614095579),('Liechtenstein','th','',1614095579,1614095579),('Liechtenstein','tr','',1614095579,1614095579),('Liechtenstein','uk','',1614095579,1614095579),('Liechtenstein','zh_Hans','',1614095579,1614095579),('Lithuania','cs','',1614095579,1614095579),('Lithuania','de','',1614095579,1614095579),('Lithuania','en','',1614095579,1614095579),('Lithuania','es','',1614095579,1614095579),('Lithuania','fa','',1614095579,1614095579),('Lithuania','fr','',1614095579,1614095579),('Lithuania','hu','',1614095579,1614095579),('Lithuania','it','',1614095579,1614095579),('Lithuania','ja','',1614095579,1614095579),('Lithuania','nl','',1614095579,1614095579),('Lithuania','pl','',1614095579,1614095579),('Lithuania','pt_BR','',1614095579,1614095579),('Lithuania','ru','',1614095579,1614095579),('Lithuania','sk','',1614095579,1614095579),('Lithuania','sv','',1614095579,1614095579),('Lithuania','sv_FI','',1614095579,1614095579),('Lithuania','th','',1614095579,1614095579),('Lithuania','tr','',1614095579,1614095579),('Lithuania','uk','',1614095579,1614095579),('Lithuania','zh_Hans','',1614095579,1614095579),('Luxembourg','cs','',1614095579,1614095579),('Luxembourg','de','',1614095579,1614095579),('Luxembourg','en','',1614095579,1614095579),('Luxembourg','es','',1614095579,1614095579),('Luxembourg','fa','',1614095579,1614095579),('Luxembourg','fr','',1614095579,1614095579),('Luxembourg','hu','',1614095579,1614095579),('Luxembourg','it','',1614095579,1614095579),('Luxembourg','ja','',1614095579,1614095579),('Luxembourg','nl','',1614095579,1614095579),('Luxembourg','pl','',1614095579,1614095579),('Luxembourg','pt_BR','',1614095579,1614095579),('Luxembourg','ru','',1614095579,1614095579),('Luxembourg','sk','',1614095579,1614095579),('Luxembourg','sv','',1614095579,1614095579),('Luxembourg','sv_FI','',1614095579,1614095579),('Luxembourg','th','',1614095579,1614095579),('Luxembourg','tr','',1614095579,1614095579),('Luxembourg','uk','',1614095579,1614095579),('Luxembourg','zh_Hans','',1614095579,1614095579),('M','cs','',1614095565,1614095565),('M','de','',1614095565,1614095565),('M','en','',1614095565,1614095565),('M','es','',1614095565,1614095565),('M','fa','',1614095565,1614095565),('M','fr','',1614095565,1614095565),('M','hu','',1614095565,1614095565),('M','it','',1614095565,1614095565),('M','ja','',1614095565,1614095565),('M','nl','',1614095565,1614095565),('M','pl','',1614095565,1614095565),('M','pt_BR','',1614095565,1614095565),('M','ru','',1614095565,1614095565),('M','sk','',1614095565,1614095565),('M','sv','',1614095565,1614095565),('M','sv_FI','',1614095565,1614095565),('M','th','',1614095565,1614095565),('M','tr','',1614095565,1614095565),('M','uk','',1614095565,1614095565),('M','zh_Hans','',1614095565,1614095565),('Macao SAR China','cs','',1614095579,1614095579),('Macao SAR China','de','',1614095579,1614095579),('Macao SAR China','en','',1614095579,1614095579),('Macao SAR China','es','',1614095579,1614095579),('Macao SAR China','fa','',1614095579,1614095579),('Macao SAR China','fr','',1614095579,1614095579),('Macao SAR China','hu','',1614095579,1614095579),('Macao SAR China','it','',1614095579,1614095579),('Macao SAR China','ja','',1614095579,1614095579),('Macao SAR China','nl','',1614095579,1614095579),('Macao SAR China','pl','',1614095579,1614095579),('Macao SAR China','pt_BR','',1614095579,1614095579),('Macao SAR China','ru','',1614095579,1614095579),('Macao SAR China','sk','',1614095579,1614095579),('Macao SAR China','sv','',1614095579,1614095579),('Macao SAR China','sv_FI','',1614095579,1614095579),('Macao SAR China','th','',1614095579,1614095579),('Macao SAR China','tr','',1614095579,1614095579),('Macao SAR China','uk','',1614095579,1614095579),('Macao SAR China','zh_Hans','',1614095579,1614095579),('Madagascar','cs','',1614095579,1614095579),('Madagascar','de','',1614095579,1614095579),('Madagascar','en','',1614095579,1614095579),('Madagascar','es','',1614095579,1614095579),('Madagascar','fa','',1614095579,1614095579),('Madagascar','fr','',1614095579,1614095579),('Madagascar','hu','',1614095579,1614095579),('Madagascar','it','',1614095579,1614095579),('Madagascar','ja','',1614095579,1614095579),('Madagascar','nl','',1614095579,1614095579),('Madagascar','pl','',1614095579,1614095579),('Madagascar','pt_BR','',1614095579,1614095579),('Madagascar','ru','',1614095579,1614095579),('Madagascar','sk','',1614095579,1614095579),('Madagascar','sv','',1614095579,1614095579),('Madagascar','sv_FI','',1614095579,1614095579),('Madagascar','th','',1614095579,1614095579),('Madagascar','tr','',1614095579,1614095579),('Madagascar','uk','',1614095579,1614095579),('Madagascar','zh_Hans','',1614095579,1614095579),('Made In','cs','',1614095566,1614095566),('Made In','de','',1614095566,1614095566),('Made In','en','',1614095566,1614095566),('Made In','es','',1614095566,1614095566),('Made In','fa','',1614095566,1614095566),('Made In','fr','',1614095566,1614095566),('Made In','hu','',1614095566,1614095566),('Made In','it','',1614095566,1614095566),('Made In','ja','',1614095566,1614095566),('Made In','nl','',1614095566,1614095566),('Made In','pl','',1614095566,1614095566),('Made In','pt_BR','',1614095566,1614095566),('Made In','ru','',1614095566,1614095566),('Made In','sk','',1614095566,1614095566),('Made In','sv','',1614095566,1614095566),('Made In','sv_FI','',1614095566,1614095566),('Made In','th','',1614095566,1614095566),('Made In','tr','',1614095566,1614095566),('Made In','uk','',1614095566,1614095566),('Made In','zh_Hans','',1614095566,1614095566),('Malawi','cs','',1614095579,1614095579),('Malawi','de','',1614095579,1614095579),('Malawi','en','',1614095579,1614095579),('Malawi','es','',1614095579,1614095579),('Malawi','fa','',1614095579,1614095579),('Malawi','fr','',1614095579,1614095579),('Malawi','hu','',1614095579,1614095579),('Malawi','it','',1614095579,1614095579),('Malawi','ja','',1614095579,1614095579),('Malawi','nl','',1614095579,1614095579),('Malawi','pl','',1614095579,1614095579),('Malawi','pt_BR','',1614095579,1614095579),('Malawi','ru','',1614095579,1614095579),('Malawi','sk','',1614095579,1614095579),('Malawi','sv','',1614095579,1614095579),('Malawi','sv_FI','',1614095579,1614095579),('Malawi','th','',1614095579,1614095579),('Malawi','tr','',1614095579,1614095579),('Malawi','uk','',1614095579,1614095579),('Malawi','zh_Hans','',1614095579,1614095579),('Malaysia','cs','',1614095579,1614095579),('Malaysia','de','',1614095579,1614095579),('Malaysia','en','',1614095579,1614095579),('Malaysia','es','',1614095579,1614095579),('Malaysia','fa','',1614095579,1614095579),('Malaysia','fr','',1614095579,1614095579),('Malaysia','hu','',1614095579,1614095579),('Malaysia','it','',1614095579,1614095579),('Malaysia','ja','',1614095579,1614095579),('Malaysia','nl','',1614095579,1614095579),('Malaysia','pl','',1614095579,1614095579),('Malaysia','pt_BR','',1614095579,1614095579),('Malaysia','ru','',1614095579,1614095579),('Malaysia','sk','',1614095579,1614095579),('Malaysia','sv','',1614095579,1614095579),('Malaysia','sv_FI','',1614095579,1614095579),('Malaysia','th','',1614095579,1614095579),('Malaysia','tr','',1614095579,1614095579),('Malaysia','uk','',1614095579,1614095579),('Malaysia','zh_Hans','',1614095579,1614095579),('Maldives','cs','',1614095579,1614095579),('Maldives','de','',1614095579,1614095579),('Maldives','en','',1614095579,1614095579),('Maldives','es','',1614095579,1614095579),('Maldives','fa','',1614095579,1614095579),('Maldives','fr','',1614095579,1614095579),('Maldives','hu','',1614095579,1614095579),('Maldives','it','',1614095579,1614095579),('Maldives','ja','',1614095579,1614095579),('Maldives','nl','',1614095579,1614095579),('Maldives','pl','',1614095579,1614095579),('Maldives','pt_BR','',1614095579,1614095579),('Maldives','ru','',1614095579,1614095579),('Maldives','sk','',1614095579,1614095579),('Maldives','sv','',1614095579,1614095579),('Maldives','sv_FI','',1614095579,1614095579),('Maldives','th','',1614095579,1614095579),('Maldives','tr','',1614095579,1614095579),('Maldives','uk','',1614095579,1614095579),('Maldives','zh_Hans','',1614095579,1614095579),('Male','cs','',1614095714,1614095714),('Male','de','',1614095714,1614095714),('Male','en','',1614095714,1614095714),('Male','es','',1614095714,1614095714),('Male','fa','',1614095714,1614095714),('Male','fr','',1614095714,1614095714),('Male','hu','',1614095714,1614095714),('Male','it','',1614095714,1614095714),('Male','ja','',1614095714,1614095714),('Male','nl','',1614095714,1614095714),('Male','pl','',1614095714,1614095714),('Male','pt_BR','',1614095714,1614095714),('Male','ru','',1614095714,1614095714),('Male','sk','',1614095714,1614095714),('Male','sv','',1614095714,1614095714),('Male','sv_FI','',1614095714,1614095714),('Male','th','',1614095714,1614095714),('Male','tr','',1614095714,1614095714),('Male','uk','',1614095714,1614095714),('Male','zh_Hans','',1614095714,1614095714),('Mali','cs','',1614095580,1614095580),('Mali','de','',1614095580,1614095580),('Mali','en','',1614095580,1614095580),('Mali','es','',1614095580,1614095580),('Mali','fa','',1614095580,1614095580),('Mali','fr','',1614095580,1614095580),('Mali','hu','',1614095580,1614095580),('Mali','it','',1614095580,1614095580),('Mali','ja','',1614095580,1614095580),('Mali','nl','',1614095580,1614095580),('Mali','pl','',1614095580,1614095580),('Mali','pt_BR','',1614095580,1614095580),('Mali','ru','',1614095580,1614095580),('Mali','sk','',1614095580,1614095580),('Mali','sv','',1614095580,1614095580),('Mali','sv_FI','',1614095580,1614095580),('Mali','th','',1614095580,1614095580),('Mali','tr','',1614095580,1614095580),('Mali','uk','',1614095580,1614095580),('Mali','zh_Hans','',1614095580,1614095580),('Malta','cs','',1614095580,1614095580),('Malta','de','',1614095580,1614095580),('Malta','en','',1614095580,1614095580),('Malta','es','',1614095580,1614095580),('Malta','fa','',1614095580,1614095580),('Malta','fr','',1614095580,1614095580),('Malta','hu','',1614095580,1614095580),('Malta','it','',1614095580,1614095580),('Malta','ja','',1614095580,1614095580),('Malta','nl','',1614095580,1614095580),('Malta','pl','',1614095580,1614095580),('Malta','pt_BR','',1614095580,1614095580),('Malta','ru','',1614095580,1614095580),('Malta','sk','',1614095580,1614095580),('Malta','sv','',1614095580,1614095580),('Malta','sv_FI','',1614095580,1614095580),('Malta','th','',1614095580,1614095580),('Malta','tr','',1614095580,1614095580),('Malta','uk','',1614095580,1614095580),('Malta','zh_Hans','',1614095580,1614095580),('Marshall Islands','cs','',1614095580,1614095580),('Marshall Islands','de','',1614095580,1614095580),('Marshall Islands','en','',1614095580,1614095580),('Marshall Islands','es','',1614095580,1614095580),('Marshall Islands','fa','',1614095580,1614095580),('Marshall Islands','fr','',1614095580,1614095580),('Marshall Islands','hu','',1614095580,1614095580),('Marshall Islands','it','',1614095580,1614095580),('Marshall Islands','ja','',1614095580,1614095580),('Marshall Islands','nl','',1614095580,1614095580),('Marshall Islands','pl','',1614095580,1614095580),('Marshall Islands','pt_BR','',1614095580,1614095580),('Marshall Islands','ru','',1614095580,1614095580),('Marshall Islands','sk','',1614095580,1614095580),('Marshall Islands','sv','',1614095580,1614095580),('Marshall Islands','sv_FI','',1614095580,1614095580),('Marshall Islands','th','',1614095580,1614095580),('Marshall Islands','tr','',1614095580,1614095580),('Marshall Islands','uk','',1614095580,1614095580),('Marshall Islands','zh_Hans','',1614095580,1614095580),('Martinique','cs','',1614095580,1614095580),('Martinique','de','',1614095580,1614095580),('Martinique','en','',1614095580,1614095580),('Martinique','es','',1614095580,1614095580),('Martinique','fa','',1614095580,1614095580),('Martinique','fr','',1614095580,1614095580),('Martinique','hu','',1614095580,1614095580),('Martinique','it','',1614095580,1614095580),('Martinique','ja','',1614095580,1614095580),('Martinique','nl','',1614095580,1614095580),('Martinique','pl','',1614095580,1614095580),('Martinique','pt_BR','',1614095580,1614095580),('Martinique','ru','',1614095580,1614095580),('Martinique','sk','',1614095580,1614095580),('Martinique','sv','',1614095580,1614095580),('Martinique','sv_FI','',1614095580,1614095580),('Martinique','th','',1614095580,1614095580),('Martinique','tr','',1614095580,1614095580),('Martinique','uk','',1614095580,1614095580),('Martinique','zh_Hans','',1614095580,1614095580),('Master','cs','',1614075406,1614075406),('Master','de','',1614075406,1614075406),('Master','en','',1614075406,1614075406),('Master','es','',1614075406,1614075406),('Master','fa','',1614075406,1614075406),('Master','fr','',1614075406,1614075406),('Master','hu','',1614075406,1614075406),('Master','it','',1614075406,1614075406),('Master','ja','',1614075406,1614075406),('Master','nl','',1614075406,1614075406),('Master','pl','',1614075406,1614075406),('Master','pt_BR','',1614075406,1614075406),('Master','ru','',1614075406,1614075406),('Master','sk','',1614075406,1614075406),('Master','sv','',1614075406,1614075406),('Master','sv_FI','',1614075406,1614075406),('Master','th','',1614075406,1614075406),('Master','tr','',1614075406,1614075406),('Master','uk','',1614075406,1614075406),('Master','zh_Hans','',1614075406,1614075406),('Master (Admin Mode)','cs','',1614075406,1614075406),('Master (Admin Mode)','de','',1614075406,1614075406),('Master (Admin Mode)','en','',1614075406,1614075406),('Master (Admin Mode)','es','',1614075406,1614075406),('Master (Admin Mode)','fa','',1614075406,1614075406),('Master (Admin Mode)','fr','',1614075406,1614075406),('Master (Admin Mode)','hu','',1614075406,1614075406),('Master (Admin Mode)','it','',1614075406,1614075406),('Master (Admin Mode)','ja','',1614075406,1614075406),('Master (Admin Mode)','nl','',1614075406,1614075406),('Master (Admin Mode)','pl','',1614075406,1614075406),('Master (Admin Mode)','pt_BR','',1614075406,1614075406),('Master (Admin Mode)','ru','',1614075406,1614075406),('Master (Admin Mode)','sk','',1614075406,1614075406),('Master (Admin Mode)','sv','',1614075406,1614075406),('Master (Admin Mode)','sv_FI','',1614075406,1614075406),('Master (Admin Mode)','th','',1614075406,1614075406),('Master (Admin Mode)','tr','',1614075406,1614075406),('Master (Admin Mode)','uk','',1614075406,1614075406),('Master (Admin Mode)','zh_Hans','',1614075406,1614075406),('Mauritania','cs','',1614095580,1614095580),('Mauritania','de','',1614095580,1614095580),('Mauritania','en','',1614095580,1614095580),('Mauritania','es','',1614095580,1614095580),('Mauritania','fa','',1614095580,1614095580),('Mauritania','fr','',1614095580,1614095580),('Mauritania','hu','',1614095580,1614095580),('Mauritania','it','',1614095580,1614095580),('Mauritania','ja','',1614095580,1614095580),('Mauritania','nl','',1614095580,1614095580),('Mauritania','pl','',1614095580,1614095580),('Mauritania','pt_BR','',1614095580,1614095580),('Mauritania','ru','',1614095580,1614095580),('Mauritania','sk','',1614095580,1614095580),('Mauritania','sv','',1614095580,1614095580),('Mauritania','sv_FI','',1614095580,1614095580),('Mauritania','th','',1614095580,1614095580),('Mauritania','tr','',1614095580,1614095580),('Mauritania','uk','',1614095580,1614095580),('Mauritania','zh_Hans','',1614095580,1614095580),('Mauritius','cs','',1614095580,1614095580),('Mauritius','de','',1614095580,1614095580),('Mauritius','en','',1614095580,1614095580),('Mauritius','es','',1614095580,1614095580),('Mauritius','fa','',1614095580,1614095580),('Mauritius','fr','',1614095580,1614095580),('Mauritius','hu','',1614095580,1614095580),('Mauritius','it','',1614095580,1614095580),('Mauritius','ja','',1614095580,1614095580),('Mauritius','nl','',1614095580,1614095580),('Mauritius','pl','',1614095580,1614095580),('Mauritius','pt_BR','',1614095580,1614095580),('Mauritius','ru','',1614095580,1614095580),('Mauritius','sk','',1614095580,1614095580),('Mauritius','sv','',1614095580,1614095580),('Mauritius','sv_FI','',1614095580,1614095580),('Mauritius','th','',1614095580,1614095580),('Mauritius','tr','',1614095580,1614095580),('Mauritius','uk','',1614095580,1614095580),('Mauritius','zh_Hans','',1614095580,1614095580),('Mayotte','cs','',1614095580,1614095580),('Mayotte','de','',1614095580,1614095580),('Mayotte','en','',1614095580,1614095580),('Mayotte','es','',1614095580,1614095580),('Mayotte','fa','',1614095580,1614095580),('Mayotte','fr','',1614095580,1614095580),('Mayotte','hu','',1614095580,1614095580),('Mayotte','it','',1614095580,1614095580),('Mayotte','ja','',1614095580,1614095580),('Mayotte','nl','',1614095580,1614095580),('Mayotte','pl','',1614095580,1614095580),('Mayotte','pt_BR','',1614095580,1614095580),('Mayotte','ru','',1614095580,1614095580),('Mayotte','sk','',1614095580,1614095580),('Mayotte','sv','',1614095580,1614095580),('Mayotte','sv_FI','',1614095580,1614095580),('Mayotte','th','',1614095580,1614095580),('Mayotte','tr','',1614095580,1614095580),('Mayotte','uk','',1614095580,1614095580),('Mayotte','zh_Hans','',1614095580,1614095580),('Mega Sleeves','cs','',1614096675,1614096675),('Mega Sleeves','de','',1614096675,1614096675),('Mega Sleeves','en','',1614096675,1614096675),('Mega Sleeves','es','',1614096675,1614096675),('Mega Sleeves','fa','',1614096675,1614096675),('Mega Sleeves','fr','',1614096675,1614096675),('Mega Sleeves','hu','',1614096675,1614096675),('Mega Sleeves','it','',1614096675,1614096675),('Mega Sleeves','ja','',1614096675,1614096675),('Mega Sleeves','nl','',1614096675,1614096675),('Mega Sleeves','pl','',1614096675,1614096675),('Mega Sleeves','pt_BR','',1614096675,1614096675),('Mega Sleeves','ru','',1614096675,1614096675),('Mega Sleeves','sk','',1614096675,1614096675),('Mega Sleeves','sv','',1614096675,1614096675),('Mega Sleeves','sv_FI','',1614096675,1614096675),('Mega Sleeves','th','',1614096675,1614096675),('Mega Sleeves','tr','',1614096675,1614096675),('Mega Sleeves','uk','',1614096675,1614096675),('Mega Sleeves','zh_Hans','',1614096675,1614096675),('Mexico','cs','',1614095580,1614095580),('Mexico','de','',1614095580,1614095580),('Mexico','en','',1614095580,1614095580),('Mexico','es','',1614095580,1614095580),('Mexico','fa','',1614095580,1614095580),('Mexico','fr','',1614095580,1614095580),('Mexico','hu','',1614095580,1614095580),('Mexico','it','',1614095580,1614095580),('Mexico','ja','',1614095580,1614095580),('Mexico','nl','',1614095580,1614095580),('Mexico','pl','',1614095580,1614095580),('Mexico','pt_BR','',1614095580,1614095580),('Mexico','ru','',1614095580,1614095580),('Mexico','sk','',1614095580,1614095580),('Mexico','sv','',1614095580,1614095580),('Mexico','sv_FI','',1614095580,1614095580),('Mexico','th','',1614095580,1614095580),('Mexico','tr','',1614095580,1614095580),('Mexico','uk','',1614095580,1614095580),('Mexico','zh_Hans','',1614095580,1614095580),('Micronesia','cs','',1614095580,1614095580),('Micronesia','de','',1614095580,1614095580),('Micronesia','en','',1614095580,1614095580),('Micronesia','es','',1614095580,1614095580),('Micronesia','fa','',1614095580,1614095580),('Micronesia','fr','',1614095580,1614095580),('Micronesia','hu','',1614095580,1614095580),('Micronesia','it','',1614095580,1614095580),('Micronesia','ja','',1614095580,1614095580),('Micronesia','nl','',1614095580,1614095580),('Micronesia','pl','',1614095580,1614095580),('Micronesia','pt_BR','',1614095580,1614095580),('Micronesia','ru','',1614095580,1614095580),('Micronesia','sk','',1614095580,1614095580),('Micronesia','sv','',1614095580,1614095580),('Micronesia','sv_FI','',1614095580,1614095580),('Micronesia','th','',1614095580,1614095580),('Micronesia','tr','',1614095580,1614095580),('Micronesia','uk','',1614095580,1614095580),('Micronesia','zh_Hans','',1614095580,1614095580),('Moldova','cs','',1614095580,1614095580),('Moldova','de','',1614095580,1614095580),('Moldova','en','',1614095580,1614095580),('Moldova','es','',1614095580,1614095580),('Moldova','fa','',1614095580,1614095580),('Moldova','fr','',1614095580,1614095580),('Moldova','hu','',1614095580,1614095580),('Moldova','it','',1614095580,1614095580),('Moldova','ja','',1614095580,1614095580),('Moldova','nl','',1614095580,1614095580),('Moldova','pl','',1614095580,1614095580),('Moldova','pt_BR','',1614095580,1614095580),('Moldova','ru','',1614095580,1614095580),('Moldova','sk','',1614095580,1614095580),('Moldova','sv','',1614095580,1614095580),('Moldova','sv_FI','',1614095580,1614095580),('Moldova','th','',1614095580,1614095580),('Moldova','tr','',1614095580,1614095580),('Moldova','uk','',1614095580,1614095580),('Moldova','zh_Hans','',1614095580,1614095580),('Monaco','cs','',1614095581,1614095581),('Monaco','de','',1614095581,1614095581),('Monaco','en','',1614095581,1614095581),('Monaco','es','',1614095581,1614095581),('Monaco','fa','',1614095581,1614095581),('Monaco','fr','',1614095581,1614095581),('Monaco','hu','',1614095581,1614095581),('Monaco','it','',1614095581,1614095581),('Monaco','ja','',1614095581,1614095581),('Monaco','nl','',1614095581,1614095581),('Monaco','pl','',1614095581,1614095581),('Monaco','pt_BR','',1614095581,1614095581),('Monaco','ru','',1614095581,1614095581),('Monaco','sk','',1614095581,1614095581),('Monaco','sv','',1614095581,1614095581),('Monaco','sv_FI','',1614095581,1614095581),('Monaco','th','',1614095581,1614095581),('Monaco','tr','',1614095581,1614095581),('Monaco','uk','',1614095581,1614095581),('Monaco','zh_Hans','',1614095581,1614095581),('Mongolia','cs','',1614095581,1614095581),('Mongolia','de','',1614095581,1614095581),('Mongolia','en','',1614095581,1614095581),('Mongolia','es','',1614095581,1614095581),('Mongolia','fa','',1614095581,1614095581),('Mongolia','fr','',1614095581,1614095581),('Mongolia','hu','',1614095581,1614095581),('Mongolia','it','',1614095581,1614095581),('Mongolia','ja','',1614095581,1614095581),('Mongolia','nl','',1614095581,1614095581),('Mongolia','pl','',1614095581,1614095581),('Mongolia','pt_BR','',1614095581,1614095581),('Mongolia','ru','',1614095581,1614095581),('Mongolia','sk','',1614095581,1614095581),('Mongolia','sv','',1614095581,1614095581),('Mongolia','sv_FI','',1614095581,1614095581),('Mongolia','th','',1614095581,1614095581),('Mongolia','tr','',1614095581,1614095581),('Mongolia','uk','',1614095581,1614095581),('Mongolia','zh_Hans','',1614095581,1614095581),('Montenegro','cs','',1614095581,1614095581),('Montenegro','de','',1614095581,1614095581),('Montenegro','en','',1614095581,1614095581),('Montenegro','es','',1614095581,1614095581),('Montenegro','fa','',1614095581,1614095581),('Montenegro','fr','',1614095581,1614095581),('Montenegro','hu','',1614095581,1614095581),('Montenegro','it','',1614095581,1614095581),('Montenegro','ja','',1614095581,1614095581),('Montenegro','nl','',1614095581,1614095581),('Montenegro','pl','',1614095581,1614095581),('Montenegro','pt_BR','',1614095581,1614095581),('Montenegro','ru','',1614095581,1614095581),('Montenegro','sk','',1614095581,1614095581),('Montenegro','sv','',1614095581,1614095581),('Montenegro','sv_FI','',1614095581,1614095581),('Montenegro','th','',1614095581,1614095581),('Montenegro','tr','',1614095581,1614095581),('Montenegro','uk','',1614095581,1614095581),('Montenegro','zh_Hans','',1614095581,1614095581),('Montserrat','cs','',1614095581,1614095581),('Montserrat','de','',1614095581,1614095581),('Montserrat','en','',1614095581,1614095581),('Montserrat','es','',1614095581,1614095581),('Montserrat','fa','',1614095581,1614095581),('Montserrat','fr','',1614095581,1614095581),('Montserrat','hu','',1614095581,1614095581),('Montserrat','it','',1614095581,1614095581),('Montserrat','ja','',1614095581,1614095581),('Montserrat','nl','',1614095581,1614095581),('Montserrat','pl','',1614095581,1614095581),('Montserrat','pt_BR','',1614095581,1614095581),('Montserrat','ru','',1614095581,1614095581),('Montserrat','sk','',1614095581,1614095581),('Montserrat','sv','',1614095581,1614095581),('Montserrat','sv_FI','',1614095581,1614095581),('Montserrat','th','',1614095581,1614095581),('Montserrat','tr','',1614095581,1614095581),('Montserrat','uk','',1614095581,1614095581),('Montserrat','zh_Hans','',1614095581,1614095581),('Morocco','cs','',1614095581,1614095581),('Morocco','de','',1614095581,1614095581),('Morocco','en','',1614095581,1614095581),('Morocco','es','',1614095581,1614095581),('Morocco','fa','',1614095581,1614095581),('Morocco','fr','',1614095581,1614095581),('Morocco','hu','',1614095581,1614095581),('Morocco','it','',1614095581,1614095581),('Morocco','ja','',1614095581,1614095581),('Morocco','nl','',1614095581,1614095581),('Morocco','pl','',1614095581,1614095581),('Morocco','pt_BR','',1614095581,1614095581),('Morocco','ru','',1614095581,1614095581),('Morocco','sk','',1614095581,1614095581),('Morocco','sv','',1614095581,1614095581),('Morocco','sv_FI','',1614095581,1614095581),('Morocco','th','',1614095581,1614095581),('Morocco','tr','',1614095581,1614095581),('Morocco','uk','',1614095581,1614095581),('Morocco','zh_Hans','',1614095581,1614095581),('Mozambique','cs','',1614095581,1614095581),('Mozambique','de','',1614095581,1614095581),('Mozambique','en','',1614095581,1614095581),('Mozambique','es','',1614095581,1614095581),('Mozambique','fa','',1614095581,1614095581),('Mozambique','fr','',1614095581,1614095581),('Mozambique','hu','',1614095581,1614095581),('Mozambique','it','',1614095581,1614095581),('Mozambique','ja','',1614095581,1614095581),('Mozambique','nl','',1614095581,1614095581),('Mozambique','pl','',1614095581,1614095581),('Mozambique','pt_BR','',1614095581,1614095581),('Mozambique','ru','',1614095581,1614095581),('Mozambique','sk','',1614095581,1614095581),('Mozambique','sv','',1614095581,1614095581),('Mozambique','sv_FI','',1614095581,1614095581),('Mozambique','th','',1614095581,1614095581),('Mozambique','tr','',1614095581,1614095581),('Mozambique','uk','',1614095581,1614095581),('Mozambique','zh_Hans','',1614095581,1614095581),('Myanmar (Burma)','cs','',1614095581,1614095581),('Myanmar (Burma)','de','',1614095581,1614095581),('Myanmar (Burma)','en','',1614095581,1614095581),('Myanmar (Burma)','es','',1614095581,1614095581),('Myanmar (Burma)','fa','',1614095581,1614095581),('Myanmar (Burma)','fr','',1614095581,1614095581),('Myanmar (Burma)','hu','',1614095581,1614095581),('Myanmar (Burma)','it','',1614095581,1614095581),('Myanmar (Burma)','ja','',1614095581,1614095581),('Myanmar (Burma)','nl','',1614095581,1614095581),('Myanmar (Burma)','pl','',1614095581,1614095581),('Myanmar (Burma)','pt_BR','',1614095581,1614095581),('Myanmar (Burma)','ru','',1614095581,1614095581),('Myanmar (Burma)','sk','',1614095581,1614095581),('Myanmar (Burma)','sv','',1614095581,1614095581),('Myanmar (Burma)','sv_FI','',1614095581,1614095581),('Myanmar (Burma)','th','',1614095581,1614095581),('Myanmar (Burma)','tr','',1614095581,1614095581),('Myanmar (Burma)','uk','',1614095581,1614095581),('Myanmar (Burma)','zh_Hans','',1614095581,1614095581),('Namibia','cs','',1614095581,1614095581),('Namibia','de','',1614095581,1614095581),('Namibia','en','',1614095581,1614095581),('Namibia','es','',1614095581,1614095581),('Namibia','fa','',1614095581,1614095581),('Namibia','fr','',1614095581,1614095581),('Namibia','hu','',1614095581,1614095581),('Namibia','it','',1614095581,1614095581),('Namibia','ja','',1614095581,1614095581),('Namibia','nl','',1614095581,1614095581),('Namibia','pl','',1614095581,1614095581),('Namibia','pt_BR','',1614095581,1614095581),('Namibia','ru','',1614095581,1614095581),('Namibia','sk','',1614095581,1614095581),('Namibia','sv','',1614095581,1614095581),('Namibia','sv_FI','',1614095581,1614095581),('Namibia','th','',1614095581,1614095581),('Namibia','tr','',1614095581,1614095581),('Namibia','uk','',1614095581,1614095581),('Namibia','zh_Hans','',1614095581,1614095581),('Nauru','cs','',1614095581,1614095581),('Nauru','de','',1614095581,1614095581),('Nauru','en','',1614095581,1614095581),('Nauru','es','',1614095581,1614095581),('Nauru','fa','',1614095581,1614095581),('Nauru','fr','',1614095581,1614095581),('Nauru','hu','',1614095581,1614095581),('Nauru','it','',1614095581,1614095581),('Nauru','ja','',1614095581,1614095581),('Nauru','nl','',1614095581,1614095581),('Nauru','pl','',1614095581,1614095581),('Nauru','pt_BR','',1614095581,1614095581),('Nauru','ru','',1614095581,1614095581),('Nauru','sk','',1614095581,1614095581),('Nauru','sv','',1614095581,1614095581),('Nauru','sv_FI','',1614095581,1614095581),('Nauru','th','',1614095581,1614095581),('Nauru','tr','',1614095581,1614095581),('Nauru','uk','',1614095581,1614095581),('Nauru','zh_Hans','',1614095581,1614095581),('Neck','cs','',1614096674,1614096674),('Neck','de','',1614096674,1614096674),('Neck','en','',1614096674,1614096674),('Neck','es','',1614096674,1614096674),('Neck','fa','',1614096674,1614096674),('Neck','fr','',1614096674,1614096674),('Neck','hu','',1614096674,1614096674),('Neck','it','',1614096674,1614096674),('Neck','ja','',1614096674,1614096674),('Neck','nl','',1614096674,1614096674),('Neck','pl','',1614096674,1614096674),('Neck','pt_BR','',1614096674,1614096674),('Neck','ru','',1614096674,1614096674),('Neck','sk','',1614096674,1614096674),('Neck','sv','',1614096674,1614096674),('Neck','sv_FI','',1614096674,1614096674),('Neck','th','',1614096674,1614096674),('Neck','tr','',1614096674,1614096674),('Neck','uk','',1614096674,1614096674),('Neck','zh_Hans','',1614096674,1614096674),('Nepal','cs','',1614095581,1614095581),('Nepal','de','',1614095581,1614095581),('Nepal','en','',1614095581,1614095581),('Nepal','es','',1614095581,1614095581),('Nepal','fa','',1614095581,1614095581),('Nepal','fr','',1614095581,1614095581),('Nepal','hu','',1614095581,1614095581),('Nepal','it','',1614095581,1614095581),('Nepal','ja','',1614095581,1614095581),('Nepal','nl','',1614095581,1614095581),('Nepal','pl','',1614095581,1614095581),('Nepal','pt_BR','',1614095581,1614095581),('Nepal','ru','',1614095581,1614095581),('Nepal','sk','',1614095581,1614095581),('Nepal','sv','',1614095581,1614095581),('Nepal','sv_FI','',1614095581,1614095581),('Nepal','th','',1614095581,1614095581),('Nepal','tr','',1614095581,1614095581),('Nepal','uk','',1614095581,1614095581),('Nepal','zh_Hans','',1614095581,1614095581),('Netherlands','cs','',1614095582,1614095582),('Netherlands','de','',1614095582,1614095582),('Netherlands','en','',1614095582,1614095582),('Netherlands','es','',1614095582,1614095582),('Netherlands','fa','',1614095582,1614095582),('Netherlands','fr','',1614095582,1614095582),('Netherlands','hu','',1614095582,1614095582),('Netherlands','it','',1614095582,1614095582),('Netherlands','ja','',1614095582,1614095582),('Netherlands','nl','',1614095582,1614095582),('Netherlands','pl','',1614095582,1614095582),('Netherlands','pt_BR','',1614095582,1614095582),('Netherlands','ru','',1614095582,1614095582),('Netherlands','sk','',1614095582,1614095582),('Netherlands','sv','',1614095582,1614095582),('Netherlands','sv_FI','',1614095582,1614095582),('Netherlands','th','',1614095582,1614095582),('Netherlands','tr','',1614095582,1614095582),('Netherlands','uk','',1614095582,1614095582),('Netherlands','zh_Hans','',1614095582,1614095582),('New Caledonia','cs','',1614095582,1614095582),('New Caledonia','de','',1614095582,1614095582),('New Caledonia','en','',1614095582,1614095582),('New Caledonia','es','',1614095582,1614095582),('New Caledonia','fa','',1614095582,1614095582),('New Caledonia','fr','',1614095582,1614095582),('New Caledonia','hu','',1614095582,1614095582),('New Caledonia','it','',1614095582,1614095582),('New Caledonia','ja','',1614095582,1614095582),('New Caledonia','nl','',1614095582,1614095582),('New Caledonia','pl','',1614095582,1614095582),('New Caledonia','pt_BR','',1614095582,1614095582),('New Caledonia','ru','',1614095582,1614095582),('New Caledonia','sk','',1614095582,1614095582),('New Caledonia','sv','',1614095582,1614095582),('New Caledonia','sv_FI','',1614095582,1614095582),('New Caledonia','th','',1614095582,1614095582),('New Caledonia','tr','',1614095582,1614095582),('New Caledonia','uk','',1614095582,1614095582),('New Caledonia','zh_Hans','',1614095582,1614095582),('New Zealand','cs','',1614095582,1614095582),('New Zealand','de','',1614095582,1614095582),('New Zealand','en','',1614095582,1614095582),('New Zealand','es','',1614095582,1614095582),('New Zealand','fa','',1614095582,1614095582),('New Zealand','fr','',1614095582,1614095582),('New Zealand','hu','',1614095582,1614095582),('New Zealand','it','',1614095582,1614095582),('New Zealand','ja','',1614095582,1614095582),('New Zealand','nl','',1614095582,1614095582),('New Zealand','pl','',1614095582,1614095582),('New Zealand','pt_BR','',1614095582,1614095582),('New Zealand','ru','',1614095582,1614095582),('New Zealand','sk','',1614095582,1614095582),('New Zealand','sv','',1614095582,1614095582),('New Zealand','sv_FI','',1614095582,1614095582),('New Zealand','th','',1614095582,1614095582),('New Zealand','tr','',1614095582,1614095582),('New Zealand','uk','',1614095582,1614095582),('New Zealand','zh_Hans','',1614095582,1614095582),('Nicaragua','cs','',1614095582,1614095582),('Nicaragua','de','',1614095582,1614095582),('Nicaragua','en','',1614095582,1614095582),('Nicaragua','es','',1614095582,1614095582),('Nicaragua','fa','',1614095582,1614095582),('Nicaragua','fr','',1614095582,1614095582),('Nicaragua','hu','',1614095582,1614095582),('Nicaragua','it','',1614095582,1614095582),('Nicaragua','ja','',1614095582,1614095582),('Nicaragua','nl','',1614095582,1614095582),('Nicaragua','pl','',1614095582,1614095582),('Nicaragua','pt_BR','',1614095582,1614095582),('Nicaragua','ru','',1614095582,1614095582),('Nicaragua','sk','',1614095582,1614095582),('Nicaragua','sv','',1614095582,1614095582),('Nicaragua','sv_FI','',1614095582,1614095582),('Nicaragua','th','',1614095582,1614095582),('Nicaragua','tr','',1614095582,1614095582),('Nicaragua','uk','',1614095582,1614095582),('Nicaragua','zh_Hans','',1614095582,1614095582),('Niger','cs','',1614095582,1614095582),('Niger','de','',1614095582,1614095582),('Niger','en','',1614095582,1614095582),('Niger','es','',1614095582,1614095582),('Niger','fa','',1614095582,1614095582),('Niger','fr','',1614095582,1614095582),('Niger','hu','',1614095582,1614095582),('Niger','it','',1614095582,1614095582),('Niger','ja','',1614095582,1614095582),('Niger','nl','',1614095582,1614095582),('Niger','pl','',1614095582,1614095582),('Niger','pt_BR','',1614095582,1614095582),('Niger','ru','',1614095582,1614095582),('Niger','sk','',1614095582,1614095582),('Niger','sv','',1614095582,1614095582),('Niger','sv_FI','',1614095582,1614095582),('Niger','th','',1614095582,1614095582),('Niger','tr','',1614095582,1614095582),('Niger','uk','',1614095582,1614095582),('Niger','zh_Hans','',1614095582,1614095582),('Nigeria','cs','',1614095582,1614095582),('Nigeria','de','',1614095582,1614095582),('Nigeria','en','',1614095582,1614095582),('Nigeria','es','',1614095582,1614095582),('Nigeria','fa','',1614095582,1614095582),('Nigeria','fr','',1614095582,1614095582),('Nigeria','hu','',1614095582,1614095582),('Nigeria','it','',1614095582,1614095582),('Nigeria','ja','',1614095582,1614095582),('Nigeria','nl','',1614095582,1614095582),('Nigeria','pl','',1614095582,1614095582),('Nigeria','pt_BR','',1614095582,1614095582),('Nigeria','ru','',1614095582,1614095582),('Nigeria','sk','',1614095582,1614095582),('Nigeria','sv','',1614095582,1614095582),('Nigeria','sv_FI','',1614095582,1614095582),('Nigeria','th','',1614095582,1614095582),('Nigeria','tr','',1614095582,1614095582),('Nigeria','uk','',1614095582,1614095582),('Nigeria','zh_Hans','',1614095582,1614095582),('Niue','cs','',1614095582,1614095582),('Niue','de','',1614095582,1614095582),('Niue','en','',1614095582,1614095582),('Niue','es','',1614095582,1614095582),('Niue','fa','',1614095582,1614095582),('Niue','fr','',1614095582,1614095582),('Niue','hu','',1614095582,1614095582),('Niue','it','',1614095582,1614095582),('Niue','ja','',1614095582,1614095582),('Niue','nl','',1614095582,1614095582),('Niue','pl','',1614095582,1614095582),('Niue','pt_BR','',1614095582,1614095582),('Niue','ru','',1614095582,1614095582),('Niue','sk','',1614095582,1614095582),('Niue','sv','',1614095582,1614095582),('Niue','sv_FI','',1614095582,1614095582),('Niue','th','',1614095582,1614095582),('Niue','tr','',1614095582,1614095582),('Niue','uk','',1614095582,1614095582),('Niue','zh_Hans','',1614095582,1614095582),('Norfolk Island','cs','',1614095582,1614095582),('Norfolk Island','de','',1614095582,1614095582),('Norfolk Island','en','',1614095582,1614095582),('Norfolk Island','es','',1614095582,1614095582),('Norfolk Island','fa','',1614095582,1614095582),('Norfolk Island','fr','',1614095582,1614095582),('Norfolk Island','hu','',1614095582,1614095582),('Norfolk Island','it','',1614095582,1614095582),('Norfolk Island','ja','',1614095582,1614095582),('Norfolk Island','nl','',1614095582,1614095582),('Norfolk Island','pl','',1614095582,1614095582),('Norfolk Island','pt_BR','',1614095582,1614095582),('Norfolk Island','ru','',1614095582,1614095582),('Norfolk Island','sk','',1614095582,1614095582),('Norfolk Island','sv','',1614095582,1614095582),('Norfolk Island','sv_FI','',1614095582,1614095582),('Norfolk Island','th','',1614095582,1614095582),('Norfolk Island','tr','',1614095582,1614095582),('Norfolk Island','uk','',1614095582,1614095582),('Norfolk Island','zh_Hans','',1614095582,1614095582),('Normal Wash','cs','',1614088789,1614088789),('Normal Wash','de','',1614088789,1614088789),('Normal Wash','en','',1614088789,1614088789),('Normal Wash','es','',1614088789,1614088789),('Normal Wash','fa','',1614088789,1614088789),('Normal Wash','fr','',1614088789,1614088789),('Normal Wash','hu','',1614088789,1614088789),('Normal Wash','it','',1614088789,1614088789),('Normal Wash','ja','',1614088789,1614088789),('Normal Wash','nl','',1614088789,1614088789),('Normal Wash','pl','',1614088789,1614088789),('Normal Wash','pt_BR','',1614088789,1614088789),('Normal Wash','ru','',1614088789,1614088789),('Normal Wash','sk','',1614088789,1614088789),('Normal Wash','sv','',1614088789,1614088789),('Normal Wash','sv_FI','',1614088789,1614088789),('Normal Wash','th','',1614088789,1614088789),('Normal Wash','tr','',1614088789,1614088789),('Normal Wash','uk','',1614088789,1614088789),('Normal Wash','zh_Hans','',1614088789,1614088789),('North Korea','cs','',1614095582,1614095582),('North Korea','de','',1614095582,1614095582),('North Korea','en','',1614095582,1614095582),('North Korea','es','',1614095582,1614095582),('North Korea','fa','',1614095582,1614095582),('North Korea','fr','',1614095582,1614095582),('North Korea','hu','',1614095582,1614095582),('North Korea','it','',1614095582,1614095582),('North Korea','ja','',1614095582,1614095582),('North Korea','nl','',1614095582,1614095582),('North Korea','pl','',1614095582,1614095582),('North Korea','pt_BR','',1614095582,1614095582),('North Korea','ru','',1614095582,1614095582),('North Korea','sk','',1614095582,1614095582),('North Korea','sv','',1614095582,1614095582),('North Korea','sv_FI','',1614095582,1614095582),('North Korea','th','',1614095582,1614095582),('North Korea','tr','',1614095582,1614095582),('North Korea','uk','',1614095582,1614095582),('North Korea','zh_Hans','',1614095582,1614095582),('North Macedonia','cs','',1614095582,1614095582),('North Macedonia','de','',1614095582,1614095582),('North Macedonia','en','',1614095582,1614095582),('North Macedonia','es','',1614095582,1614095582),('North Macedonia','fa','',1614095582,1614095582),('North Macedonia','fr','',1614095582,1614095582),('North Macedonia','hu','',1614095582,1614095582),('North Macedonia','it','',1614095582,1614095582),('North Macedonia','ja','',1614095582,1614095582),('North Macedonia','nl','',1614095582,1614095582),('North Macedonia','pl','',1614095582,1614095582),('North Macedonia','pt_BR','',1614095582,1614095582),('North Macedonia','ru','',1614095582,1614095582),('North Macedonia','sk','',1614095582,1614095582),('North Macedonia','sv','',1614095582,1614095582),('North Macedonia','sv_FI','',1614095582,1614095582),('North Macedonia','th','',1614095582,1614095582),('North Macedonia','tr','',1614095582,1614095582),('North Macedonia','uk','',1614095582,1614095582),('North Macedonia','zh_Hans','',1614095582,1614095582),('Northern Mariana Islands','cs','',1614095583,1614095583),('Northern Mariana Islands','de','',1614095583,1614095583),('Northern Mariana Islands','en','',1614095583,1614095583),('Northern Mariana Islands','es','',1614095583,1614095583),('Northern Mariana Islands','fa','',1614095583,1614095583),('Northern Mariana Islands','fr','',1614095583,1614095583),('Northern Mariana Islands','hu','',1614095583,1614095583),('Northern Mariana Islands','it','',1614095583,1614095583),('Northern Mariana Islands','ja','',1614095583,1614095583),('Northern Mariana Islands','nl','',1614095583,1614095583),('Northern Mariana Islands','pl','',1614095583,1614095583),('Northern Mariana Islands','pt_BR','',1614095583,1614095583),('Northern Mariana Islands','ru','',1614095583,1614095583),('Northern Mariana Islands','sk','',1614095583,1614095583),('Northern Mariana Islands','sv','',1614095583,1614095583),('Northern Mariana Islands','sv_FI','',1614095583,1614095583),('Northern Mariana Islands','th','',1614095583,1614095583),('Northern Mariana Islands','tr','',1614095583,1614095583),('Northern Mariana Islands','uk','',1614095583,1614095583),('Northern Mariana Islands','zh_Hans','',1614095583,1614095583),('Norway','cs','',1614095583,1614095583),('Norway','de','',1614095583,1614095583),('Norway','en','',1614095583,1614095583),('Norway','es','',1614095583,1614095583),('Norway','fa','',1614095583,1614095583),('Norway','fr','',1614095583,1614095583),('Norway','hu','',1614095583,1614095583),('Norway','it','',1614095583,1614095583),('Norway','ja','',1614095583,1614095583),('Norway','nl','',1614095583,1614095583),('Norway','pl','',1614095583,1614095583),('Norway','pt_BR','',1614095583,1614095583),('Norway','ru','',1614095583,1614095583),('Norway','sk','',1614095583,1614095583),('Norway','sv','',1614095583,1614095583),('Norway','sv_FI','',1614095583,1614095583),('Norway','th','',1614095583,1614095583),('Norway','tr','',1614095583,1614095583),('Norway','uk','',1614095583,1614095583),('Norway','zh_Hans','',1614095583,1614095583),('Oman','cs','',1614095583,1614095583),('Oman','de','',1614095583,1614095583),('Oman','en','',1614095583,1614095583),('Oman','es','',1614095583,1614095583),('Oman','fa','',1614095583,1614095583),('Oman','fr','',1614095583,1614095583),('Oman','hu','',1614095583,1614095583),('Oman','it','',1614095583,1614095583),('Oman','ja','',1614095583,1614095583),('Oman','nl','',1614095583,1614095583),('Oman','pl','',1614095583,1614095583),('Oman','pt_BR','',1614095583,1614095583),('Oman','ru','',1614095583,1614095583),('Oman','sk','',1614095583,1614095583),('Oman','sv','',1614095583,1614095583),('Oman','sv_FI','',1614095583,1614095583),('Oman','th','',1614095583,1614095583),('Oman','tr','',1614095583,1614095583),('Oman','uk','',1614095583,1614095583),('Oman','zh_Hans','',1614095583,1614095583),('Other Fields','cs','',1614096074,1614096074),('Other Fields','de','',1614096074,1614096074),('Other Fields','en','',1614096074,1614096074),('Other Fields','es','',1614096074,1614096074),('Other Fields','fa','',1614096074,1614096074),('Other Fields','fr','',1614096074,1614096074),('Other Fields','hu','',1614096074,1614096074),('Other Fields','it','',1614096074,1614096074),('Other Fields','ja','',1614096074,1614096074),('Other Fields','nl','',1614096074,1614096074),('Other Fields','pl','',1614096074,1614096074),('Other Fields','pt_BR','',1614096074,1614096074),('Other Fields','ru','',1614096074,1614096074),('Other Fields','sk','',1614096074,1614096074),('Other Fields','sv','',1614096074,1614096074),('Other Fields','sv_FI','',1614096074,1614096074),('Other Fields','th','',1614096074,1614096074),('Other Fields','tr','',1614096074,1614096074),('Other Fields','uk','',1614096074,1614096074),('Other Fields','zh_Hans','',1614096074,1614096074),('Pakistan','cs','',1614095583,1614095583),('Pakistan','de','',1614095583,1614095583),('Pakistan','en','',1614095583,1614095583),('Pakistan','es','',1614095583,1614095583),('Pakistan','fa','',1614095583,1614095583),('Pakistan','fr','',1614095583,1614095583),('Pakistan','hu','',1614095583,1614095583),('Pakistan','it','',1614095583,1614095583),('Pakistan','ja','',1614095583,1614095583),('Pakistan','nl','',1614095583,1614095583),('Pakistan','pl','',1614095583,1614095583),('Pakistan','pt_BR','',1614095583,1614095583),('Pakistan','ru','',1614095583,1614095583),('Pakistan','sk','',1614095583,1614095583),('Pakistan','sv','',1614095583,1614095583),('Pakistan','sv_FI','',1614095583,1614095583),('Pakistan','th','',1614095583,1614095583),('Pakistan','tr','',1614095583,1614095583),('Pakistan','uk','',1614095583,1614095583),('Pakistan','zh_Hans','',1614095583,1614095583),('Palau','cs','',1614095583,1614095583),('Palau','de','',1614095583,1614095583),('Palau','en','',1614095583,1614095583),('Palau','es','',1614095583,1614095583),('Palau','fa','',1614095583,1614095583),('Palau','fr','',1614095583,1614095583),('Palau','hu','',1614095583,1614095583),('Palau','it','',1614095583,1614095583),('Palau','ja','',1614095583,1614095583),('Palau','nl','',1614095583,1614095583),('Palau','pl','',1614095583,1614095583),('Palau','pt_BR','',1614095583,1614095583),('Palau','ru','',1614095583,1614095583),('Palau','sk','',1614095583,1614095583),('Palau','sv','',1614095583,1614095583),('Palau','sv_FI','',1614095583,1614095583),('Palau','th','',1614095583,1614095583),('Palau','tr','',1614095583,1614095583),('Palau','uk','',1614095583,1614095583),('Palau','zh_Hans','',1614095583,1614095583),('Palazzo suits','cs','',1614096676,1614096676),('Palazzo suits','de','',1614096676,1614096676),('Palazzo suits','en','',1614096676,1614096676),('Palazzo suits','es','',1614096676,1614096676),('Palazzo suits','fa','',1614096676,1614096676),('Palazzo suits','fr','',1614096676,1614096676),('Palazzo suits','hu','',1614096676,1614096676),('Palazzo suits','it','',1614096676,1614096676),('Palazzo suits','ja','',1614096676,1614096676),('Palazzo suits','nl','',1614096676,1614096676),('Palazzo suits','pl','',1614096676,1614096676),('Palazzo suits','pt_BR','',1614096676,1614096676),('Palazzo suits','ru','',1614096676,1614096676),('Palazzo suits','sk','',1614096676,1614096676),('Palazzo suits','sv','',1614096676,1614096676),('Palazzo suits','sv_FI','',1614096676,1614096676),('Palazzo suits','th','',1614096676,1614096676),('Palazzo suits','tr','',1614096676,1614096676),('Palazzo suits','uk','',1614096676,1614096676),('Palazzo suits','zh_Hans','',1614096676,1614096676),('Palestinian Territories','cs','',1614095583,1614095583),('Palestinian Territories','de','',1614095583,1614095583),('Palestinian Territories','en','',1614095583,1614095583),('Palestinian Territories','es','',1614095583,1614095583),('Palestinian Territories','fa','',1614095583,1614095583),('Palestinian Territories','fr','',1614095583,1614095583),('Palestinian Territories','hu','',1614095583,1614095583),('Palestinian Territories','it','',1614095583,1614095583),('Palestinian Territories','ja','',1614095583,1614095583),('Palestinian Territories','nl','',1614095583,1614095583),('Palestinian Territories','pl','',1614095583,1614095583),('Palestinian Territories','pt_BR','',1614095583,1614095583),('Palestinian Territories','ru','',1614095583,1614095583),('Palestinian Territories','sk','',1614095583,1614095583),('Palestinian Territories','sv','',1614095583,1614095583),('Palestinian Territories','sv_FI','',1614095583,1614095583),('Palestinian Territories','th','',1614095583,1614095583),('Palestinian Territories','tr','',1614095583,1614095583),('Palestinian Territories','uk','',1614095583,1614095583),('Palestinian Territories','zh_Hans','',1614095583,1614095583),('Panama','cs','',1614095583,1614095583),('Panama','de','',1614095583,1614095583),('Panama','en','',1614095583,1614095583),('Panama','es','',1614095583,1614095583),('Panama','fa','',1614095583,1614095583),('Panama','fr','',1614095583,1614095583),('Panama','hu','',1614095583,1614095583),('Panama','it','',1614095583,1614095583),('Panama','ja','',1614095583,1614095583),('Panama','nl','',1614095583,1614095583),('Panama','pl','',1614095583,1614095583),('Panama','pt_BR','',1614095583,1614095583),('Panama','ru','',1614095583,1614095583),('Panama','sk','',1614095583,1614095583),('Panama','sv','',1614095583,1614095583),('Panama','sv_FI','',1614095583,1614095583),('Panama','th','',1614095583,1614095583),('Panama','tr','',1614095583,1614095583),('Panama','uk','',1614095583,1614095583),('Panama','zh_Hans','',1614095583,1614095583),('Papua New Guinea','cs','',1614095583,1614095583),('Papua New Guinea','de','',1614095583,1614095583),('Papua New Guinea','en','',1614095583,1614095583),('Papua New Guinea','es','',1614095583,1614095583),('Papua New Guinea','fa','',1614095583,1614095583),('Papua New Guinea','fr','',1614095583,1614095583),('Papua New Guinea','hu','',1614095583,1614095583),('Papua New Guinea','it','',1614095583,1614095583),('Papua New Guinea','ja','',1614095583,1614095583),('Papua New Guinea','nl','',1614095583,1614095583),('Papua New Guinea','pl','',1614095583,1614095583),('Papua New Guinea','pt_BR','',1614095583,1614095583),('Papua New Guinea','ru','',1614095583,1614095583),('Papua New Guinea','sk','',1614095583,1614095583),('Papua New Guinea','sv','',1614095583,1614095583),('Papua New Guinea','sv_FI','',1614095583,1614095583),('Papua New Guinea','th','',1614095583,1614095583),('Papua New Guinea','tr','',1614095583,1614095583),('Papua New Guinea','uk','',1614095583,1614095583),('Papua New Guinea','zh_Hans','',1614095583,1614095583),('Paraguay','cs','',1614095583,1614095583),('Paraguay','de','',1614095583,1614095583),('Paraguay','en','',1614095583,1614095583),('Paraguay','es','',1614095583,1614095583),('Paraguay','fa','',1614095583,1614095583),('Paraguay','fr','',1614095583,1614095583),('Paraguay','hu','',1614095583,1614095583),('Paraguay','it','',1614095583,1614095583),('Paraguay','ja','',1614095583,1614095583),('Paraguay','nl','',1614095583,1614095583),('Paraguay','pl','',1614095583,1614095583),('Paraguay','pt_BR','',1614095583,1614095583),('Paraguay','ru','',1614095583,1614095583),('Paraguay','sk','',1614095583,1614095583),('Paraguay','sv','',1614095583,1614095583),('Paraguay','sv_FI','',1614095583,1614095583),('Paraguay','th','',1614095583,1614095583),('Paraguay','tr','',1614095583,1614095583),('Paraguay','uk','',1614095583,1614095583),('Paraguay','zh_Hans','',1614095583,1614095583),('Patiala suits','cs','',1614096675,1614096675),('Patiala suits','de','',1614096675,1614096675),('Patiala suits','en','',1614096675,1614096675),('Patiala suits','es','',1614096675,1614096675),('Patiala suits','fa','',1614096675,1614096675),('Patiala suits','fr','',1614096675,1614096675),('Patiala suits','hu','',1614096675,1614096675),('Patiala suits','it','',1614096675,1614096675),('Patiala suits','ja','',1614096675,1614096675),('Patiala suits','nl','',1614096675,1614096675),('Patiala suits','pl','',1614096675,1614096675),('Patiala suits','pt_BR','',1614096675,1614096675),('Patiala suits','ru','',1614096675,1614096675),('Patiala suits','sk','',1614096675,1614096675),('Patiala suits','sv','',1614096675,1614096675),('Patiala suits','sv_FI','',1614096675,1614096675),('Patiala suits','th','',1614096675,1614096675),('Patiala suits','tr','',1614096675,1614096675),('Patiala suits','uk','',1614096675,1614096675),('Patiala suits','zh_Hans','',1614096675,1614096675),('Pattern','cs','',1614095592,1614095592),('Pattern','de','',1614095592,1614095592),('Pattern','en','',1614095592,1614095592),('Pattern','es','',1614095592,1614095592),('Pattern','fa','',1614095592,1614095592),('Pattern','fr','',1614095592,1614095592),('Pattern','hu','',1614095592,1614095592),('Pattern','it','',1614095592,1614095592),('Pattern','ja','',1614095592,1614095592),('Pattern','nl','',1614095592,1614095592),('Pattern','pl','',1614095592,1614095592),('Pattern','pt_BR','',1614095592,1614095592),('Pattern','ru','',1614095592,1614095592),('Pattern','sk','',1614095592,1614095592),('Pattern','sv','',1614095592,1614095592),('Pattern','sv_FI','',1614095592,1614095592),('Pattern','th','',1614095592,1614095592),('Pattern','tr','',1614095592,1614095592),('Pattern','uk','',1614095592,1614095592),('Pattern','zh_Hans','',1614095592,1614095592),('Peru','cs','',1614095584,1614095584),('Peru','de','',1614095584,1614095584),('Peru','en','',1614095584,1614095584),('Peru','es','',1614095584,1614095584),('Peru','fa','',1614095584,1614095584),('Peru','fr','',1614095584,1614095584),('Peru','hu','',1614095584,1614095584),('Peru','it','',1614095584,1614095584),('Peru','ja','',1614095584,1614095584),('Peru','nl','',1614095584,1614095584),('Peru','pl','',1614095584,1614095584),('Peru','pt_BR','',1614095584,1614095584),('Peru','ru','',1614095584,1614095584),('Peru','sk','',1614095584,1614095584),('Peru','sv','',1614095584,1614095584),('Peru','sv_FI','',1614095584,1614095584),('Peru','th','',1614095584,1614095584),('Peru','tr','',1614095584,1614095584),('Peru','uk','',1614095584,1614095584),('Peru','zh_Hans','',1614095584,1614095584),('Philippines','cs','',1614095584,1614095584),('Philippines','de','',1614095584,1614095584),('Philippines','en','',1614095584,1614095584),('Philippines','es','',1614095584,1614095584),('Philippines','fa','',1614095584,1614095584),('Philippines','fr','',1614095584,1614095584),('Philippines','hu','',1614095584,1614095584),('Philippines','it','',1614095584,1614095584),('Philippines','ja','',1614095584,1614095584),('Philippines','nl','',1614095584,1614095584),('Philippines','pl','',1614095584,1614095584),('Philippines','pt_BR','',1614095584,1614095584),('Philippines','ru','',1614095584,1614095584),('Philippines','sk','',1614095584,1614095584),('Philippines','sv','',1614095584,1614095584),('Philippines','sv_FI','',1614095584,1614095584),('Philippines','th','',1614095584,1614095584),('Philippines','tr','',1614095584,1614095584),('Philippines','uk','',1614095584,1614095584),('Philippines','zh_Hans','',1614095584,1614095584),('Pitcairn Islands','cs','',1614095584,1614095584),('Pitcairn Islands','de','',1614095584,1614095584),('Pitcairn Islands','en','',1614095584,1614095584),('Pitcairn Islands','es','',1614095584,1614095584),('Pitcairn Islands','fa','',1614095584,1614095584),('Pitcairn Islands','fr','',1614095584,1614095584),('Pitcairn Islands','hu','',1614095584,1614095584),('Pitcairn Islands','it','',1614095584,1614095584),('Pitcairn Islands','ja','',1614095584,1614095584),('Pitcairn Islands','nl','',1614095584,1614095584),('Pitcairn Islands','pl','',1614095584,1614095584),('Pitcairn Islands','pt_BR','',1614095584,1614095584),('Pitcairn Islands','ru','',1614095584,1614095584),('Pitcairn Islands','sk','',1614095584,1614095584),('Pitcairn Islands','sv','',1614095584,1614095584),('Pitcairn Islands','sv_FI','',1614095584,1614095584),('Pitcairn Islands','th','',1614095584,1614095584),('Pitcairn Islands','tr','',1614095584,1614095584),('Pitcairn Islands','uk','',1614095584,1614095584),('Pitcairn Islands','zh_Hans','',1614095584,1614095584),('Poland','cs','',1614095584,1614095584),('Poland','de','',1614095584,1614095584),('Poland','en','',1614095584,1614095584),('Poland','es','',1614095584,1614095584),('Poland','fa','',1614095584,1614095584),('Poland','fr','',1614095584,1614095584),('Poland','hu','',1614095584,1614095584),('Poland','it','',1614095584,1614095584),('Poland','ja','',1614095584,1614095584),('Poland','nl','',1614095584,1614095584),('Poland','pl','',1614095584,1614095584),('Poland','pt_BR','',1614095584,1614095584),('Poland','ru','',1614095584,1614095584),('Poland','sk','',1614095584,1614095584),('Poland','sv','',1614095584,1614095584),('Poland','sv_FI','',1614095584,1614095584),('Poland','th','',1614095584,1614095584),('Poland','tr','',1614095584,1614095584),('Poland','uk','',1614095584,1614095584),('Poland','zh_Hans','',1614095584,1614095584),('Portugal','cs','',1614095584,1614095584),('Portugal','de','',1614095584,1614095584),('Portugal','en','',1614095584,1614095584),('Portugal','es','',1614095584,1614095584),('Portugal','fa','',1614095584,1614095584),('Portugal','fr','',1614095584,1614095584),('Portugal','hu','',1614095584,1614095584),('Portugal','it','',1614095584,1614095584),('Portugal','ja','',1614095584,1614095584),('Portugal','nl','',1614095584,1614095584),('Portugal','pl','',1614095584,1614095584),('Portugal','pt_BR','',1614095584,1614095584),('Portugal','ru','',1614095584,1614095584),('Portugal','sk','',1614095584,1614095584),('Portugal','sv','',1614095584,1614095584),('Portugal','sv_FI','',1614095584,1614095584),('Portugal','th','',1614095584,1614095584),('Portugal','tr','',1614095584,1614095584),('Portugal','uk','',1614095584,1614095584),('Portugal','zh_Hans','',1614095584,1614095584),('Price','cs','',1614095565,1614095565),('Price','de','',1614095565,1614095565),('Price','en','',1614095565,1614095565),('Price','es','',1614095565,1614095565),('Price','fa','',1614095565,1614095565),('Price','fr','',1614095565,1614095565),('Price','hu','',1614095565,1614095565),('Price','it','',1614095565,1614095565),('Price','ja','',1614095565,1614095565),('Price','nl','',1614095565,1614095565),('Price','pl','',1614095565,1614095565),('Price','pt_BR','',1614095565,1614095565),('Price','ru','',1614095565,1614095565),('Price','sk','',1614095565,1614095565),('Price','sv','',1614095565,1614095565),('Price','sv_FI','',1614095565,1614095565),('Price','th','',1614095565,1614095565),('Price','tr','',1614095565,1614095565),('Price','uk','',1614095565,1614095565),('Price','zh_Hans','',1614095565,1614095565),('Primary Fields','cs','',1614096074,1614096074),('Primary Fields','de','',1614096074,1614096074),('Primary Fields','en','',1614096074,1614096074),('Primary Fields','es','',1614096074,1614096074),('Primary Fields','fa','',1614096074,1614096074),('Primary Fields','fr','',1614096074,1614096074),('Primary Fields','hu','',1614096074,1614096074),('Primary Fields','it','',1614096074,1614096074),('Primary Fields','ja','',1614096074,1614096074),('Primary Fields','nl','',1614096074,1614096074),('Primary Fields','pl','',1614096074,1614096074),('Primary Fields','pt_BR','',1614096074,1614096074),('Primary Fields','ru','',1614096074,1614096074),('Primary Fields','sk','',1614096074,1614096074),('Primary Fields','sv','',1614096074,1614096074),('Primary Fields','sv_FI','',1614096074,1614096074),('Primary Fields','th','',1614096074,1614096074),('Primary Fields','tr','',1614096074,1614096074),('Primary Fields','uk','',1614096074,1614096074),('Primary Fields','zh_Hans','',1614096074,1614096074),('Printed','cs','',1614095592,1614095592),('Printed','de','',1614095592,1614095592),('Printed','en','',1614095592,1614095592),('Printed','es','',1614095592,1614095592),('Printed','fa','',1614095592,1614095592),('Printed','fr','',1614095592,1614095592),('Printed','hu','',1614095592,1614095592),('Printed','it','',1614095592,1614095592),('Printed','ja','',1614095592,1614095592),('Printed','nl','',1614095592,1614095592),('Printed','pl','',1614095592,1614095592),('Printed','pt_BR','',1614095592,1614095592),('Printed','ru','',1614095592,1614095592),('Printed','sk','',1614095592,1614095592),('Printed','sv','',1614095592,1614095592),('Printed','sv_FI','',1614095592,1614095592),('Printed','th','',1614095592,1614095592),('Printed','tr','',1614095592,1614095592),('Printed','uk','',1614095592,1614095592),('Printed','zh_Hans','',1614095592,1614095592),('Product Detail','cs','',1614095566,1614095566),('Product Detail','de','',1614095566,1614095566),('Product Detail','en','',1614095566,1614095566),('Product Detail','es','',1614095566,1614095566),('Product Detail','fa','',1614095566,1614095566),('Product Detail','fr','',1614095566,1614095566),('Product Detail','hu','',1614095566,1614095566),('Product Detail','it','',1614095566,1614095566),('Product Detail','ja','',1614095566,1614095566),('Product Detail','nl','',1614095566,1614095566),('Product Detail','pl','',1614095566,1614095566),('Product Detail','pt_BR','',1614095566,1614095566),('Product Detail','ru','',1614095566,1614095566),('Product Detail','sk','',1614095566,1614095566),('Product Detail','sv','',1614095566,1614095566),('Product Detail','sv_FI','',1614095566,1614095566),('Product Detail','th','',1614095566,1614095566),('Product Detail','tr','',1614095566,1614095566),('Product Detail','uk','',1614095566,1614095566),('Product Detail','zh_Hans','',1614095566,1614095566),('Puerto Rico','cs','',1614095584,1614095584),('Puerto Rico','de','',1614095584,1614095584),('Puerto Rico','en','',1614095584,1614095584),('Puerto Rico','es','',1614095584,1614095584),('Puerto Rico','fa','',1614095584,1614095584),('Puerto Rico','fr','',1614095584,1614095584),('Puerto Rico','hu','',1614095584,1614095584),('Puerto Rico','it','',1614095584,1614095584),('Puerto Rico','ja','',1614095584,1614095584),('Puerto Rico','nl','',1614095584,1614095584),('Puerto Rico','pl','',1614095584,1614095584),('Puerto Rico','pt_BR','',1614095584,1614095584),('Puerto Rico','ru','',1614095584,1614095584),('Puerto Rico','sk','',1614095584,1614095584),('Puerto Rico','sv','',1614095584,1614095584),('Puerto Rico','sv_FI','',1614095584,1614095584),('Puerto Rico','th','',1614095584,1614095584),('Puerto Rico','tr','',1614095584,1614095584),('Puerto Rico','uk','',1614095584,1614095584),('Puerto Rico','zh_Hans','',1614095584,1614095584),('Qatar','cs','',1614095584,1614095584),('Qatar','de','',1614095584,1614095584),('Qatar','en','',1614095584,1614095584),('Qatar','es','',1614095584,1614095584),('Qatar','fa','',1614095584,1614095584),('Qatar','fr','',1614095584,1614095584),('Qatar','hu','',1614095584,1614095584),('Qatar','it','',1614095584,1614095584),('Qatar','ja','',1614095584,1614095584),('Qatar','nl','',1614095584,1614095584),('Qatar','pl','',1614095584,1614095584),('Qatar','pt_BR','',1614095584,1614095584),('Qatar','ru','',1614095584,1614095584),('Qatar','sk','',1614095584,1614095584),('Qatar','sv','',1614095584,1614095584),('Qatar','sv_FI','',1614095584,1614095584),('Qatar','th','',1614095584,1614095584),('Qatar','tr','',1614095584,1614095584),('Qatar','uk','',1614095584,1614095584),('Qatar','zh_Hans','',1614095584,1614095584),('Returnable','cs','',1614095592,1614095592),('Returnable','de','',1614095592,1614095592),('Returnable','en','',1614095592,1614095592),('Returnable','es','',1614095592,1614095592),('Returnable','fa','',1614095592,1614095592),('Returnable','fr','',1614095592,1614095592),('Returnable','hu','',1614095592,1614095592),('Returnable','it','',1614095592,1614095592),('Returnable','ja','',1614095592,1614095592),('Returnable','nl','',1614095592,1614095592),('Returnable','pl','',1614095592,1614095592),('Returnable','pt_BR','',1614095592,1614095592),('Returnable','ru','',1614095592,1614095592),('Returnable','sk','',1614095592,1614095592),('Returnable','sv','',1614095592,1614095592),('Returnable','sv_FI','',1614095592,1614095592),('Returnable','th','',1614095592,1614095592),('Returnable','tr','',1614095592,1614095592),('Returnable','uk','',1614095592,1614095592),('Returnable','zh_Hans','',1614095592,1614095592),('Romania','cs','',1614095584,1614095584),('Romania','de','',1614095584,1614095584),('Romania','en','',1614095584,1614095584),('Romania','es','',1614095584,1614095584),('Romania','fa','',1614095584,1614095584),('Romania','fr','',1614095584,1614095584),('Romania','hu','',1614095584,1614095584),('Romania','it','',1614095584,1614095584),('Romania','ja','',1614095584,1614095584),('Romania','nl','',1614095584,1614095584),('Romania','pl','',1614095584,1614095584),('Romania','pt_BR','',1614095584,1614095584),('Romania','ru','',1614095584,1614095584),('Romania','sk','',1614095584,1614095584),('Romania','sv','',1614095584,1614095584),('Romania','sv_FI','',1614095584,1614095584),('Romania','th','',1614095584,1614095584),('Romania','tr','',1614095584,1614095584),('Romania','uk','',1614095584,1614095584),('Romania','zh_Hans','',1614095584,1614095584),('Round Neck','cs','',1614096675,1614096675),('Round Neck','de','',1614096675,1614096675),('Round Neck','en','',1614096675,1614096675),('Round Neck','es','',1614096675,1614096675),('Round Neck','fa','',1614096675,1614096675),('Round Neck','fr','',1614096675,1614096675),('Round Neck','hu','',1614096675,1614096675),('Round Neck','it','',1614096675,1614096675),('Round Neck','ja','',1614096675,1614096675),('Round Neck','nl','',1614096675,1614096675),('Round Neck','pl','',1614096675,1614096675),('Round Neck','pt_BR','',1614096675,1614096675),('Round Neck','ru','',1614096675,1614096675),('Round Neck','sk','',1614096675,1614096675),('Round Neck','sv','',1614096675,1614096675),('Round Neck','sv_FI','',1614096675,1614096675),('Round Neck','th','',1614096675,1614096675),('Round Neck','tr','',1614096675,1614096675),('Round Neck','uk','',1614096675,1614096675),('Round Neck','zh_Hans','',1614096675,1614096675),('Russia','cs','',1614095584,1614095584),('Russia','de','',1614095584,1614095584),('Russia','en','',1614095584,1614095584),('Russia','es','',1614095584,1614095584),('Russia','fa','',1614095584,1614095584),('Russia','fr','',1614095584,1614095584),('Russia','hu','',1614095584,1614095584),('Russia','it','',1614095584,1614095584),('Russia','ja','',1614095584,1614095584),('Russia','nl','',1614095584,1614095584),('Russia','pl','',1614095584,1614095584),('Russia','pt_BR','',1614095584,1614095584),('Russia','ru','',1614095584,1614095584),('Russia','sk','',1614095584,1614095584),('Russia','sv','',1614095584,1614095584),('Russia','sv_FI','',1614095584,1614095584),('Russia','th','',1614095584,1614095584),('Russia','tr','',1614095584,1614095584),('Russia','uk','',1614095584,1614095584),('Russia','zh_Hans','',1614095584,1614095584),('Rwanda','cs','',1614095584,1614095584),('Rwanda','de','',1614095584,1614095584),('Rwanda','en','',1614095584,1614095584),('Rwanda','es','',1614095584,1614095584),('Rwanda','fa','',1614095584,1614095584),('Rwanda','fr','',1614095584,1614095584),('Rwanda','hu','',1614095584,1614095584),('Rwanda','it','',1614095584,1614095584),('Rwanda','ja','',1614095584,1614095584),('Rwanda','nl','',1614095584,1614095584),('Rwanda','pl','',1614095584,1614095584),('Rwanda','pt_BR','',1614095584,1614095584),('Rwanda','ru','',1614095584,1614095584),('Rwanda','sk','',1614095584,1614095584),('Rwanda','sv','',1614095584,1614095584),('Rwanda','sv_FI','',1614095584,1614095584),('Rwanda','th','',1614095584,1614095584),('Rwanda','tr','',1614095584,1614095584),('Rwanda','uk','',1614095584,1614095584),('Rwanda','zh_Hans','',1614095584,1614095584),('Réunion','cs','',1614095585,1614095585),('Réunion','de','',1614095585,1614095585),('Réunion','en','',1614095585,1614095585),('Réunion','es','',1614095585,1614095585),('Réunion','fa','',1614095585,1614095585),('Réunion','fr','',1614095585,1614095585),('Réunion','hu','',1614095585,1614095585),('Réunion','it','',1614095585,1614095585),('Réunion','ja','',1614095585,1614095585),('Réunion','nl','',1614095585,1614095585),('Réunion','pl','',1614095585,1614095585),('Réunion','pt_BR','',1614095585,1614095585),('Réunion','ru','',1614095585,1614095585),('Réunion','sk','',1614095585,1614095585),('Réunion','sv','',1614095585,1614095585),('Réunion','sv_FI','',1614095585,1614095585),('Réunion','th','',1614095585,1614095585),('Réunion','tr','',1614095585,1614095585),('Réunion','uk','',1614095585,1614095585),('Réunion','zh_Hans','',1614095585,1614095585),('S','cs','',1614095565,1614095565),('S','de','',1614095565,1614095565),('S','en','',1614095565,1614095565),('S','es','',1614095565,1614095565),('S','fa','',1614095565,1614095565),('S','fr','',1614095565,1614095565),('S','hu','',1614095565,1614095565),('S','it','',1614095565,1614095565),('S','ja','',1614095565,1614095565),('S','nl','',1614095565,1614095565),('S','pl','',1614095565,1614095565),('S','pt_BR','',1614095565,1614095565),('S','ru','',1614095565,1614095565),('S','sk','',1614095565,1614095565),('S','sv','',1614095565,1614095565),('S','sv_FI','',1614095565,1614095565),('S','th','',1614095565,1614095565),('S','tr','',1614095565,1614095565),('S','uk','',1614095565,1614095565),('S','zh_Hans','',1614095565,1614095565),('SKU','cs','',1614095564,1614095564),('SKU','de','',1614095564,1614095564),('SKU','en','',1614095564,1614095564),('SKU','es','',1614095564,1614095564),('SKU','fa','',1614095564,1614095564),('SKU','fr','',1614095564,1614095564),('SKU','hu','',1614095564,1614095564),('SKU','it','',1614095564,1614095564),('SKU','ja','',1614095564,1614095564),('SKU','nl','',1614095564,1614095564),('SKU','pl','',1614095564,1614095564),('SKU','pt_BR','',1614095564,1614095564),('SKU','ru','',1614095564,1614095564),('SKU','sk','',1614095564,1614095564),('SKU','sv','',1614095564,1614095564),('SKU','sv_FI','',1614095564,1614095564),('SKU','th','',1614095564,1614095564),('SKU','tr','',1614095564,1614095564),('SKU','uk','',1614095564,1614095564),('SKU','zh_Hans','',1614095564,1614095564),('Salwar suits','cs','',1614096675,1614096675),('Salwar suits','de','',1614096675,1614096675),('Salwar suits','en','',1614096675,1614096675),('Salwar suits','es','',1614096675,1614096675),('Salwar suits','fa','',1614096675,1614096675),('Salwar suits','fr','',1614096675,1614096675),('Salwar suits','hu','',1614096675,1614096675),('Salwar suits','it','',1614096675,1614096675),('Salwar suits','ja','',1614096675,1614096675),('Salwar suits','nl','',1614096675,1614096675),('Salwar suits','pl','',1614096675,1614096675),('Salwar suits','pt_BR','',1614096675,1614096675),('Salwar suits','ru','',1614096675,1614096675),('Salwar suits','sk','',1614096675,1614096675),('Salwar suits','sv','',1614096675,1614096675),('Salwar suits','sv_FI','',1614096675,1614096675),('Salwar suits','th','',1614096675,1614096675),('Salwar suits','tr','',1614096675,1614096675),('Salwar suits','uk','',1614096675,1614096675),('Salwar suits','zh_Hans','',1614096675,1614096675),('Samoa','cs','',1614095585,1614095585),('Samoa','de','',1614095585,1614095585),('Samoa','en','',1614095585,1614095585),('Samoa','es','',1614095585,1614095585),('Samoa','fa','',1614095585,1614095585),('Samoa','fr','',1614095585,1614095585),('Samoa','hu','',1614095585,1614095585),('Samoa','it','',1614095585,1614095585),('Samoa','ja','',1614095585,1614095585),('Samoa','nl','',1614095585,1614095585),('Samoa','pl','',1614095585,1614095585),('Samoa','pt_BR','',1614095585,1614095585),('Samoa','ru','',1614095585,1614095585),('Samoa','sk','',1614095585,1614095585),('Samoa','sv','',1614095585,1614095585),('Samoa','sv_FI','',1614095585,1614095585),('Samoa','th','',1614095585,1614095585),('Samoa','tr','',1614095585,1614095585),('Samoa','uk','',1614095585,1614095585),('Samoa','zh_Hans','',1614095585,1614095585),('San Marino','cs','',1614095585,1614095585),('San Marino','de','',1614095585,1614095585),('San Marino','en','',1614095585,1614095585),('San Marino','es','',1614095585,1614095585),('San Marino','fa','',1614095585,1614095585),('San Marino','fr','',1614095585,1614095585),('San Marino','hu','',1614095585,1614095585),('San Marino','it','',1614095585,1614095585),('San Marino','ja','',1614095585,1614095585),('San Marino','nl','',1614095585,1614095585),('San Marino','pl','',1614095585,1614095585),('San Marino','pt_BR','',1614095585,1614095585),('San Marino','ru','',1614095585,1614095585),('San Marino','sk','',1614095585,1614095585),('San Marino','sv','',1614095585,1614095585),('San Marino','sv_FI','',1614095585,1614095585),('San Marino','th','',1614095585,1614095585),('San Marino','tr','',1614095585,1614095585),('San Marino','uk','',1614095585,1614095585),('San Marino','zh_Hans','',1614095585,1614095585),('Saudi Arabia','cs','',1614095585,1614095585),('Saudi Arabia','de','',1614095585,1614095585),('Saudi Arabia','en','',1614095585,1614095585),('Saudi Arabia','es','',1614095585,1614095585),('Saudi Arabia','fa','',1614095585,1614095585),('Saudi Arabia','fr','',1614095585,1614095585),('Saudi Arabia','hu','',1614095585,1614095585),('Saudi Arabia','it','',1614095585,1614095585),('Saudi Arabia','ja','',1614095585,1614095585),('Saudi Arabia','nl','',1614095585,1614095585),('Saudi Arabia','pl','',1614095585,1614095585),('Saudi Arabia','pt_BR','',1614095585,1614095585),('Saudi Arabia','ru','',1614095585,1614095585),('Saudi Arabia','sk','',1614095585,1614095585),('Saudi Arabia','sv','',1614095585,1614095585),('Saudi Arabia','sv_FI','',1614095585,1614095585),('Saudi Arabia','th','',1614095585,1614095585),('Saudi Arabia','tr','',1614095585,1614095585),('Saudi Arabia','uk','',1614095585,1614095585),('Saudi Arabia','zh_Hans','',1614095585,1614095585),('Senegal','cs','',1614095585,1614095585),('Senegal','de','',1614095585,1614095585),('Senegal','en','',1614095585,1614095585),('Senegal','es','',1614095585,1614095585),('Senegal','fa','',1614095585,1614095585),('Senegal','fr','',1614095585,1614095585),('Senegal','hu','',1614095585,1614095585),('Senegal','it','',1614095585,1614095585),('Senegal','ja','',1614095585,1614095585),('Senegal','nl','',1614095585,1614095585),('Senegal','pl','',1614095585,1614095585),('Senegal','pt_BR','',1614095585,1614095585),('Senegal','ru','',1614095585,1614095585),('Senegal','sk','',1614095585,1614095585),('Senegal','sv','',1614095585,1614095585),('Senegal','sv_FI','',1614095585,1614095585),('Senegal','th','',1614095585,1614095585),('Senegal','tr','',1614095585,1614095585),('Senegal','uk','',1614095585,1614095585),('Senegal','zh_Hans','',1614095585,1614095585),('Serbia','cs','',1614095585,1614095585),('Serbia','de','',1614095585,1614095585),('Serbia','en','',1614095585,1614095585),('Serbia','es','',1614095585,1614095585),('Serbia','fa','',1614095585,1614095585),('Serbia','fr','',1614095585,1614095585),('Serbia','hu','',1614095585,1614095585),('Serbia','it','',1614095585,1614095585),('Serbia','ja','',1614095585,1614095585),('Serbia','nl','',1614095585,1614095585),('Serbia','pl','',1614095585,1614095585),('Serbia','pt_BR','',1614095585,1614095585),('Serbia','ru','',1614095585,1614095585),('Serbia','sk','',1614095585,1614095585),('Serbia','sv','',1614095585,1614095585),('Serbia','sv_FI','',1614095585,1614095585),('Serbia','th','',1614095585,1614095585),('Serbia','tr','',1614095585,1614095585),('Serbia','uk','',1614095585,1614095585),('Serbia','zh_Hans','',1614095585,1614095585),('Seychelles','cs','',1614095585,1614095585),('Seychelles','de','',1614095585,1614095585),('Seychelles','en','',1614095585,1614095585),('Seychelles','es','',1614095585,1614095585),('Seychelles','fa','',1614095585,1614095585),('Seychelles','fr','',1614095585,1614095585),('Seychelles','hu','',1614095585,1614095585),('Seychelles','it','',1614095585,1614095585),('Seychelles','ja','',1614095585,1614095585),('Seychelles','nl','',1614095585,1614095585),('Seychelles','pl','',1614095585,1614095585),('Seychelles','pt_BR','',1614095585,1614095585),('Seychelles','ru','',1614095585,1614095585),('Seychelles','sk','',1614095585,1614095585),('Seychelles','sv','',1614095585,1614095585),('Seychelles','sv_FI','',1614095585,1614095585),('Seychelles','th','',1614095585,1614095585),('Seychelles','tr','',1614095585,1614095585),('Seychelles','uk','',1614095585,1614095585),('Seychelles','zh_Hans','',1614095585,1614095585),('Sierra Leone','cs','',1614095585,1614095585),('Sierra Leone','de','',1614095585,1614095585),('Sierra Leone','en','',1614095585,1614095585),('Sierra Leone','es','',1614095585,1614095585),('Sierra Leone','fa','',1614095585,1614095585),('Sierra Leone','fr','',1614095585,1614095585),('Sierra Leone','hu','',1614095585,1614095585),('Sierra Leone','it','',1614095585,1614095585),('Sierra Leone','ja','',1614095585,1614095585),('Sierra Leone','nl','',1614095585,1614095585),('Sierra Leone','pl','',1614095585,1614095585),('Sierra Leone','pt_BR','',1614095585,1614095585),('Sierra Leone','ru','',1614095585,1614095585),('Sierra Leone','sk','',1614095585,1614095585),('Sierra Leone','sv','',1614095585,1614095585),('Sierra Leone','sv_FI','',1614095585,1614095585),('Sierra Leone','th','',1614095585,1614095585),('Sierra Leone','tr','',1614095585,1614095585),('Sierra Leone','uk','',1614095585,1614095585),('Sierra Leone','zh_Hans','',1614095585,1614095585),('Singapore','cs','',1614095585,1614095585),('Singapore','de','',1614095585,1614095585),('Singapore','en','',1614095585,1614095585),('Singapore','es','',1614095585,1614095585),('Singapore','fa','',1614095585,1614095585),('Singapore','fr','',1614095585,1614095585),('Singapore','hu','',1614095585,1614095585),('Singapore','it','',1614095585,1614095585),('Singapore','ja','',1614095585,1614095585),('Singapore','nl','',1614095585,1614095585),('Singapore','pl','',1614095585,1614095585),('Singapore','pt_BR','',1614095585,1614095585),('Singapore','ru','',1614095585,1614095585),('Singapore','sk','',1614095585,1614095585),('Singapore','sv','',1614095585,1614095585),('Singapore','sv_FI','',1614095585,1614095585),('Singapore','th','',1614095585,1614095585),('Singapore','tr','',1614095585,1614095585),('Singapore','uk','',1614095585,1614095585),('Singapore','zh_Hans','',1614095585,1614095585),('Sint Maarten','cs','',1614095585,1614095585),('Sint Maarten','de','',1614095585,1614095585),('Sint Maarten','en','',1614095585,1614095585),('Sint Maarten','es','',1614095585,1614095585),('Sint Maarten','fa','',1614095585,1614095585),('Sint Maarten','fr','',1614095585,1614095585),('Sint Maarten','hu','',1614095585,1614095585),('Sint Maarten','it','',1614095585,1614095585),('Sint Maarten','ja','',1614095585,1614095585),('Sint Maarten','nl','',1614095585,1614095585),('Sint Maarten','pl','',1614095585,1614095585),('Sint Maarten','pt_BR','',1614095585,1614095585),('Sint Maarten','ru','',1614095585,1614095585),('Sint Maarten','sk','',1614095585,1614095585),('Sint Maarten','sv','',1614095585,1614095585),('Sint Maarten','sv_FI','',1614095585,1614095585),('Sint Maarten','th','',1614095585,1614095585),('Sint Maarten','tr','',1614095585,1614095585),('Sint Maarten','uk','',1614095585,1614095585),('Sint Maarten','zh_Hans','',1614095585,1614095585),('Size','cs','',1614095564,1614095564),('Size','de','',1614095564,1614095564),('Size','en','',1614095564,1614095564),('Size','es','',1614095564,1614095564),('Size','fa','',1614095564,1614095564),('Size','fr','',1614095564,1614095564),('Size','hu','',1614095564,1614095564),('Size','it','',1614095564,1614095564),('Size','ja','',1614095564,1614095564),('Size','nl','',1614095564,1614095564),('Size','pl','',1614095564,1614095564),('Size','pt_BR','',1614095564,1614095564),('Size','ru','',1614095564,1614095564),('Size','sk','',1614095564,1614095564),('Size','sv','',1614095564,1614095564),('Size','sv_FI','',1614095564,1614095564),('Size','th','',1614095564,1614095564),('Size','tr','',1614095564,1614095564),('Size','uk','',1614095564,1614095564),('Size','zh_Hans','',1614095564,1614095564),('Sleeveless','cs','',1614096675,1614096675),('Sleeveless','de','',1614096675,1614096675),('Sleeveless','en','',1614096675,1614096675),('Sleeveless','es','',1614096675,1614096675),('Sleeveless','fa','',1614096675,1614096675),('Sleeveless','fr','',1614096675,1614096675),('Sleeveless','hu','',1614096675,1614096675),('Sleeveless','it','',1614096675,1614096675),('Sleeveless','ja','',1614096675,1614096675),('Sleeveless','nl','',1614096675,1614096675),('Sleeveless','pl','',1614096675,1614096675),('Sleeveless','pt_BR','',1614096675,1614096675),('Sleeveless','ru','',1614096675,1614096675),('Sleeveless','sk','',1614096675,1614096675),('Sleeveless','sv','',1614096675,1614096675),('Sleeveless','sv_FI','',1614096675,1614096675),('Sleeveless','th','',1614096675,1614096675),('Sleeveless','tr','',1614096675,1614096675),('Sleeveless','uk','',1614096675,1614096675),('Sleeveless','zh_Hans','',1614096675,1614096675),('Sleeves','cs','',1614096675,1614096675),('Sleeves','de','',1614096675,1614096675),('Sleeves','en','',1614096675,1614096675),('Sleeves','es','',1614096675,1614096675),('Sleeves','fa','',1614096675,1614096675),('Sleeves','fr','',1614096675,1614096675),('Sleeves','hu','',1614096675,1614096675),('Sleeves','it','',1614096675,1614096675),('Sleeves','ja','',1614096675,1614096675),('Sleeves','nl','',1614096675,1614096675),('Sleeves','pl','',1614096675,1614096675),('Sleeves','pt_BR','',1614096675,1614096675),('Sleeves','ru','',1614096675,1614096675),('Sleeves','sk','',1614096675,1614096675),('Sleeves','sv','',1614096675,1614096675),('Sleeves','sv_FI','',1614096675,1614096675),('Sleeves','th','',1614096675,1614096675),('Sleeves','tr','',1614096675,1614096675),('Sleeves','uk','',1614096675,1614096675),('Sleeves','zh_Hans','',1614096675,1614096675),('Slovakia','cs','',1614095586,1614095586),('Slovakia','de','',1614095586,1614095586),('Slovakia','en','',1614095586,1614095586),('Slovakia','es','',1614095586,1614095586),('Slovakia','fa','',1614095586,1614095586),('Slovakia','fr','',1614095586,1614095586),('Slovakia','hu','',1614095586,1614095586),('Slovakia','it','',1614095586,1614095586),('Slovakia','ja','',1614095586,1614095586),('Slovakia','nl','',1614095586,1614095586),('Slovakia','pl','',1614095586,1614095586),('Slovakia','pt_BR','',1614095586,1614095586),('Slovakia','ru','',1614095586,1614095586),('Slovakia','sk','',1614095586,1614095586),('Slovakia','sv','',1614095586,1614095586),('Slovakia','sv_FI','',1614095586,1614095586),('Slovakia','th','',1614095586,1614095586),('Slovakia','tr','',1614095586,1614095586),('Slovakia','uk','',1614095586,1614095586),('Slovakia','zh_Hans','',1614095586,1614095586),('Slovenia','cs','',1614095586,1614095586),('Slovenia','de','',1614095586,1614095586),('Slovenia','en','',1614095586,1614095586),('Slovenia','es','',1614095586,1614095586),('Slovenia','fa','',1614095586,1614095586),('Slovenia','fr','',1614095586,1614095586),('Slovenia','hu','',1614095586,1614095586),('Slovenia','it','',1614095586,1614095586),('Slovenia','ja','',1614095586,1614095586),('Slovenia','nl','',1614095586,1614095586),('Slovenia','pl','',1614095586,1614095586),('Slovenia','pt_BR','',1614095586,1614095586),('Slovenia','ru','',1614095586,1614095586),('Slovenia','sk','',1614095586,1614095586),('Slovenia','sv','',1614095586,1614095586),('Slovenia','sv_FI','',1614095586,1614095586),('Slovenia','th','',1614095586,1614095586),('Slovenia','tr','',1614095586,1614095586),('Slovenia','uk','',1614095586,1614095586),('Slovenia','zh_Hans','',1614095586,1614095586),('Solid','cs','',1614095592,1614095592),('Solid','de','',1614095592,1614095592),('Solid','en','',1614095592,1614095592),('Solid','es','',1614095592,1614095592),('Solid','fa','',1614095592,1614095592),('Solid','fr','',1614095592,1614095592),('Solid','hu','',1614095592,1614095592),('Solid','it','',1614095592,1614095592),('Solid','ja','',1614095592,1614095592),('Solid','nl','',1614095592,1614095592),('Solid','pl','',1614095592,1614095592),('Solid','pt_BR','',1614095592,1614095592),('Solid','ru','',1614095592,1614095592),('Solid','sk','',1614095592,1614095592),('Solid','sv','',1614095592,1614095592),('Solid','sv_FI','',1614095592,1614095592),('Solid','th','',1614095592,1614095592),('Solid','tr','',1614095592,1614095592),('Solid','uk','',1614095592,1614095592),('Solid','zh_Hans','',1614095592,1614095592),('Solomon Islands','cs','',1614095586,1614095586),('Solomon Islands','de','',1614095586,1614095586),('Solomon Islands','en','',1614095586,1614095586),('Solomon Islands','es','',1614095586,1614095586),('Solomon Islands','fa','',1614095586,1614095586),('Solomon Islands','fr','',1614095586,1614095586),('Solomon Islands','hu','',1614095586,1614095586),('Solomon Islands','it','',1614095586,1614095586),('Solomon Islands','ja','',1614095586,1614095586),('Solomon Islands','nl','',1614095586,1614095586),('Solomon Islands','pl','',1614095586,1614095586),('Solomon Islands','pt_BR','',1614095586,1614095586),('Solomon Islands','ru','',1614095586,1614095586),('Solomon Islands','sk','',1614095586,1614095586),('Solomon Islands','sv','',1614095586,1614095586),('Solomon Islands','sv_FI','',1614095586,1614095586),('Solomon Islands','th','',1614095586,1614095586),('Solomon Islands','tr','',1614095586,1614095586),('Solomon Islands','uk','',1614095586,1614095586),('Solomon Islands','zh_Hans','',1614095586,1614095586),('Somalia','cs','',1614095586,1614095586),('Somalia','de','',1614095586,1614095586),('Somalia','en','',1614095586,1614095586),('Somalia','es','',1614095586,1614095586),('Somalia','fa','',1614095586,1614095586),('Somalia','fr','',1614095586,1614095586),('Somalia','hu','',1614095586,1614095586),('Somalia','it','',1614095586,1614095586),('Somalia','ja','',1614095586,1614095586),('Somalia','nl','',1614095586,1614095586),('Somalia','pl','',1614095586,1614095586),('Somalia','pt_BR','',1614095586,1614095586),('Somalia','ru','',1614095586,1614095586),('Somalia','sk','',1614095586,1614095586),('Somalia','sv','',1614095586,1614095586),('Somalia','sv_FI','',1614095586,1614095586),('Somalia','th','',1614095586,1614095586),('Somalia','tr','',1614095586,1614095586),('Somalia','uk','',1614095586,1614095586),('Somalia','zh_Hans','',1614095586,1614095586),('South Africa','cs','',1614095586,1614095586),('South Africa','de','',1614095586,1614095586),('South Africa','en','',1614095586,1614095586),('South Africa','es','',1614095586,1614095586),('South Africa','fa','',1614095586,1614095586),('South Africa','fr','',1614095586,1614095586),('South Africa','hu','',1614095586,1614095586),('South Africa','it','',1614095586,1614095586),('South Africa','ja','',1614095586,1614095586),('South Africa','nl','',1614095586,1614095586),('South Africa','pl','',1614095586,1614095586),('South Africa','pt_BR','',1614095586,1614095586),('South Africa','ru','',1614095586,1614095586),('South Africa','sk','',1614095586,1614095586),('South Africa','sv','',1614095586,1614095586),('South Africa','sv_FI','',1614095586,1614095586),('South Africa','th','',1614095586,1614095586),('South Africa','tr','',1614095586,1614095586),('South Africa','uk','',1614095586,1614095586),('South Africa','zh_Hans','',1614095586,1614095586),('South Georgia & South Sandwich Islands','cs','',1614095586,1614095586),('South Georgia & South Sandwich Islands','de','',1614095586,1614095586),('South Georgia & South Sandwich Islands','en','',1614095586,1614095586),('South Georgia & South Sandwich Islands','es','',1614095586,1614095586),('South Georgia & South Sandwich Islands','fa','',1614095586,1614095586),('South Georgia & South Sandwich Islands','fr','',1614095586,1614095586),('South Georgia & South Sandwich Islands','hu','',1614095586,1614095586),('South Georgia & South Sandwich Islands','it','',1614095586,1614095586),('South Georgia & South Sandwich Islands','ja','',1614095586,1614095586),('South Georgia & South Sandwich Islands','nl','',1614095586,1614095586),('South Georgia & South Sandwich Islands','pl','',1614095586,1614095586),('South Georgia & South Sandwich Islands','pt_BR','',1614095586,1614095586),('South Georgia & South Sandwich Islands','ru','',1614095586,1614095586),('South Georgia & South Sandwich Islands','sk','',1614095586,1614095586),('South Georgia & South Sandwich Islands','sv','',1614095586,1614095586),('South Georgia & South Sandwich Islands','sv_FI','',1614095586,1614095586),('South Georgia & South Sandwich Islands','th','',1614095586,1614095586),('South Georgia & South Sandwich Islands','tr','',1614095586,1614095586),('South Georgia & South Sandwich Islands','uk','',1614095586,1614095586),('South Georgia & South Sandwich Islands','zh_Hans','',1614095586,1614095586),('South Korea','cs','',1614095586,1614095586),('South Korea','de','',1614095586,1614095586),('South Korea','en','',1614095586,1614095586),('South Korea','es','',1614095586,1614095586),('South Korea','fa','',1614095586,1614095586),('South Korea','fr','',1614095586,1614095586),('South Korea','hu','',1614095586,1614095586),('South Korea','it','',1614095586,1614095586),('South Korea','ja','',1614095586,1614095586),('South Korea','nl','',1614095586,1614095586),('South Korea','pl','',1614095586,1614095586),('South Korea','pt_BR','',1614095586,1614095586),('South Korea','ru','',1614095586,1614095586),('South Korea','sk','',1614095586,1614095586),('South Korea','sv','',1614095586,1614095586),('South Korea','sv_FI','',1614095586,1614095586),('South Korea','th','',1614095586,1614095586),('South Korea','tr','',1614095586,1614095586),('South Korea','uk','',1614095586,1614095586),('South Korea','zh_Hans','',1614095586,1614095586),('South Sudan','cs','',1614095586,1614095586),('South Sudan','de','',1614095586,1614095586),('South Sudan','en','',1614095586,1614095586),('South Sudan','es','',1614095586,1614095586),('South Sudan','fa','',1614095586,1614095586),('South Sudan','fr','',1614095586,1614095586),('South Sudan','hu','',1614095586,1614095586),('South Sudan','it','',1614095586,1614095586),('South Sudan','ja','',1614095586,1614095586),('South Sudan','nl','',1614095586,1614095586),('South Sudan','pl','',1614095586,1614095586),('South Sudan','pt_BR','',1614095586,1614095586),('South Sudan','ru','',1614095586,1614095586),('South Sudan','sk','',1614095586,1614095586),('South Sudan','sv','',1614095586,1614095586),('South Sudan','sv_FI','',1614095586,1614095586),('South Sudan','th','',1614095586,1614095586),('South Sudan','tr','',1614095586,1614095586),('South Sudan','uk','',1614095586,1614095586),('South Sudan','zh_Hans','',1614095586,1614095586),('Spain','cs','',1614095586,1614095586),('Spain','de','',1614095586,1614095586),('Spain','en','',1614095586,1614095586),('Spain','es','',1614095586,1614095586),('Spain','fa','',1614095586,1614095586),('Spain','fr','',1614095586,1614095586),('Spain','hu','',1614095586,1614095586),('Spain','it','',1614095586,1614095586),('Spain','ja','',1614095586,1614095586),('Spain','nl','',1614095586,1614095586),('Spain','pl','',1614095586,1614095586),('Spain','pt_BR','',1614095586,1614095586),('Spain','ru','',1614095586,1614095586),('Spain','sk','',1614095586,1614095586),('Spain','sv','',1614095586,1614095586),('Spain','sv_FI','',1614095586,1614095586),('Spain','th','',1614095586,1614095586),('Spain','tr','',1614095586,1614095586),('Spain','uk','',1614095586,1614095586),('Spain','zh_Hans','',1614095586,1614095586),('Sri Lanka','cs','',1614095586,1614095586),('Sri Lanka','de','',1614095586,1614095586),('Sri Lanka','en','',1614095586,1614095586),('Sri Lanka','es','',1614095586,1614095586),('Sri Lanka','fa','',1614095586,1614095586),('Sri Lanka','fr','',1614095586,1614095586),('Sri Lanka','hu','',1614095586,1614095586),('Sri Lanka','it','',1614095586,1614095586),('Sri Lanka','ja','',1614095586,1614095586),('Sri Lanka','nl','',1614095586,1614095586),('Sri Lanka','pl','',1614095586,1614095586),('Sri Lanka','pt_BR','',1614095586,1614095586),('Sri Lanka','ru','',1614095586,1614095586),('Sri Lanka','sk','',1614095586,1614095586),('Sri Lanka','sv','',1614095586,1614095586),('Sri Lanka','sv_FI','',1614095586,1614095586),('Sri Lanka','th','',1614095586,1614095586),('Sri Lanka','tr','',1614095586,1614095586),('Sri Lanka','uk','',1614095586,1614095586),('Sri Lanka','zh_Hans','',1614095586,1614095586),('St. Barthélemy','cs','',1614095587,1614095587),('St. Barthélemy','de','',1614095587,1614095587),('St. Barthélemy','en','',1614095587,1614095587),('St. Barthélemy','es','',1614095587,1614095587),('St. Barthélemy','fa','',1614095587,1614095587),('St. Barthélemy','fr','',1614095587,1614095587),('St. Barthélemy','hu','',1614095587,1614095587),('St. Barthélemy','it','',1614095587,1614095587),('St. Barthélemy','ja','',1614095587,1614095587),('St. Barthélemy','nl','',1614095587,1614095587),('St. Barthélemy','pl','',1614095587,1614095587),('St. Barthélemy','pt_BR','',1614095587,1614095587),('St. Barthélemy','ru','',1614095587,1614095587),('St. Barthélemy','sk','',1614095587,1614095587),('St. Barthélemy','sv','',1614095587,1614095587),('St. Barthélemy','sv_FI','',1614095587,1614095587),('St. Barthélemy','th','',1614095587,1614095587),('St. Barthélemy','tr','',1614095587,1614095587),('St. Barthélemy','uk','',1614095587,1614095587),('St. Barthélemy','zh_Hans','',1614095587,1614095587),('St. Helena','cs','',1614095587,1614095587),('St. Helena','de','',1614095587,1614095587),('St. Helena','en','',1614095587,1614095587),('St. Helena','es','',1614095587,1614095587),('St. Helena','fa','',1614095587,1614095587),('St. Helena','fr','',1614095587,1614095587),('St. Helena','hu','',1614095587,1614095587),('St. Helena','it','',1614095587,1614095587),('St. Helena','ja','',1614095587,1614095587),('St. Helena','nl','',1614095587,1614095587),('St. Helena','pl','',1614095587,1614095587),('St. Helena','pt_BR','',1614095587,1614095587),('St. Helena','ru','',1614095587,1614095587),('St. Helena','sk','',1614095587,1614095587),('St. Helena','sv','',1614095587,1614095587),('St. Helena','sv_FI','',1614095587,1614095587),('St. Helena','th','',1614095587,1614095587),('St. Helena','tr','',1614095587,1614095587),('St. Helena','uk','',1614095587,1614095587),('St. Helena','zh_Hans','',1614095587,1614095587),('St. Kitts & Nevis','cs','',1614095587,1614095587),('St. Kitts & Nevis','de','',1614095587,1614095587),('St. Kitts & Nevis','en','',1614095587,1614095587),('St. Kitts & Nevis','es','',1614095587,1614095587),('St. Kitts & Nevis','fa','',1614095587,1614095587),('St. Kitts & Nevis','fr','',1614095587,1614095587),('St. Kitts & Nevis','hu','',1614095587,1614095587),('St. Kitts & Nevis','it','',1614095587,1614095587),('St. Kitts & Nevis','ja','',1614095587,1614095587),('St. Kitts & Nevis','nl','',1614095587,1614095587),('St. Kitts & Nevis','pl','',1614095587,1614095587),('St. Kitts & Nevis','pt_BR','',1614095587,1614095587),('St. Kitts & Nevis','ru','',1614095587,1614095587),('St. Kitts & Nevis','sk','',1614095587,1614095587),('St. Kitts & Nevis','sv','',1614095587,1614095587),('St. Kitts & Nevis','sv_FI','',1614095587,1614095587),('St. Kitts & Nevis','th','',1614095587,1614095587),('St. Kitts & Nevis','tr','',1614095587,1614095587),('St. Kitts & Nevis','uk','',1614095587,1614095587),('St. Kitts & Nevis','zh_Hans','',1614095587,1614095587),('St. Lucia','cs','',1614095587,1614095587),('St. Lucia','de','',1614095587,1614095587),('St. Lucia','en','',1614095587,1614095587),('St. Lucia','es','',1614095587,1614095587),('St. Lucia','fa','',1614095587,1614095587),('St. Lucia','fr','',1614095587,1614095587),('St. Lucia','hu','',1614095587,1614095587),('St. Lucia','it','',1614095587,1614095587),('St. Lucia','ja','',1614095587,1614095587),('St. Lucia','nl','',1614095587,1614095587),('St. Lucia','pl','',1614095587,1614095587),('St. Lucia','pt_BR','',1614095587,1614095587),('St. Lucia','ru','',1614095587,1614095587),('St. Lucia','sk','',1614095587,1614095587),('St. Lucia','sv','',1614095587,1614095587),('St. Lucia','sv_FI','',1614095587,1614095587),('St. Lucia','th','',1614095587,1614095587),('St. Lucia','tr','',1614095587,1614095587),('St. Lucia','uk','',1614095587,1614095587),('St. Lucia','zh_Hans','',1614095587,1614095587),('St. Martin','cs','',1614095587,1614095587),('St. Martin','de','',1614095587,1614095587),('St. Martin','en','',1614095587,1614095587),('St. Martin','es','',1614095587,1614095587),('St. Martin','fa','',1614095587,1614095587),('St. Martin','fr','',1614095587,1614095587),('St. Martin','hu','',1614095587,1614095587),('St. Martin','it','',1614095587,1614095587),('St. Martin','ja','',1614095587,1614095587),('St. Martin','nl','',1614095587,1614095587),('St. Martin','pl','',1614095587,1614095587),('St. Martin','pt_BR','',1614095587,1614095587),('St. Martin','ru','',1614095587,1614095587),('St. Martin','sk','',1614095587,1614095587),('St. Martin','sv','',1614095587,1614095587),('St. Martin','sv_FI','',1614095587,1614095587),('St. Martin','th','',1614095587,1614095587),('St. Martin','tr','',1614095587,1614095587),('St. Martin','uk','',1614095587,1614095587),('St. Martin','zh_Hans','',1614095587,1614095587),('St. Pierre & Miquelon','cs','',1614095587,1614095587),('St. Pierre & Miquelon','de','',1614095587,1614095587),('St. Pierre & Miquelon','en','',1614095587,1614095587),('St. Pierre & Miquelon','es','',1614095587,1614095587),('St. Pierre & Miquelon','fa','',1614095587,1614095587),('St. Pierre & Miquelon','fr','',1614095587,1614095587),('St. Pierre & Miquelon','hu','',1614095587,1614095587),('St. Pierre & Miquelon','it','',1614095587,1614095587),('St. Pierre & Miquelon','ja','',1614095587,1614095587),('St. Pierre & Miquelon','nl','',1614095587,1614095587),('St. Pierre & Miquelon','pl','',1614095587,1614095587),('St. Pierre & Miquelon','pt_BR','',1614095587,1614095587),('St. Pierre & Miquelon','ru','',1614095587,1614095587),('St. Pierre & Miquelon','sk','',1614095587,1614095587),('St. Pierre & Miquelon','sv','',1614095587,1614095587),('St. Pierre & Miquelon','sv_FI','',1614095587,1614095587),('St. Pierre & Miquelon','th','',1614095587,1614095587),('St. Pierre & Miquelon','tr','',1614095587,1614095587),('St. Pierre & Miquelon','uk','',1614095587,1614095587),('St. Pierre & Miquelon','zh_Hans','',1614095587,1614095587),('St. Vincent & Grenadines','cs','',1614095587,1614095587),('St. Vincent & Grenadines','de','',1614095587,1614095587),('St. Vincent & Grenadines','en','',1614095587,1614095587),('St. Vincent & Grenadines','es','',1614095587,1614095587),('St. Vincent & Grenadines','fa','',1614095587,1614095587),('St. Vincent & Grenadines','fr','',1614095587,1614095587),('St. Vincent & Grenadines','hu','',1614095587,1614095587),('St. Vincent & Grenadines','it','',1614095587,1614095587),('St. Vincent & Grenadines','ja','',1614095587,1614095587),('St. Vincent & Grenadines','nl','',1614095587,1614095587),('St. Vincent & Grenadines','pl','',1614095587,1614095587),('St. Vincent & Grenadines','pt_BR','',1614095587,1614095587),('St. Vincent & Grenadines','ru','',1614095587,1614095587),('St. Vincent & Grenadines','sk','',1614095587,1614095587),('St. Vincent & Grenadines','sv','',1614095587,1614095587),('St. Vincent & Grenadines','sv_FI','',1614095587,1614095587),('St. Vincent & Grenadines','th','',1614095587,1614095587),('St. Vincent & Grenadines','tr','',1614095587,1614095587),('St. Vincent & Grenadines','uk','',1614095587,1614095587),('St. Vincent & Grenadines','zh_Hans','',1614095587,1614095587),('Straight suits','cs','',1614096675,1614096675),('Straight suits','de','',1614096675,1614096675),('Straight suits','en','',1614096675,1614096675),('Straight suits','es','',1614096675,1614096675),('Straight suits','fa','',1614096675,1614096675),('Straight suits','fr','',1614096675,1614096675),('Straight suits','hu','',1614096675,1614096675),('Straight suits','it','',1614096675,1614096675),('Straight suits','ja','',1614096675,1614096675),('Straight suits','nl','',1614096675,1614096675),('Straight suits','pl','',1614096675,1614096675),('Straight suits','pt_BR','',1614096675,1614096675),('Straight suits','ru','',1614096675,1614096675),('Straight suits','sk','',1614096675,1614096675),('Straight suits','sv','',1614096675,1614096675),('Straight suits','sv_FI','',1614096675,1614096675),('Straight suits','th','',1614096675,1614096675),('Straight suits','tr','',1614096675,1614096675),('Straight suits','uk','',1614096675,1614096675),('Straight suits','zh_Hans','',1614096675,1614096675),('Stripes','cs','',1614095592,1614095592),('Stripes','de','',1614095592,1614095592),('Stripes','en','',1614095592,1614095592),('Stripes','es','',1614095592,1614095592),('Stripes','fa','',1614095592,1614095592),('Stripes','fr','',1614095592,1614095592),('Stripes','hu','',1614095592,1614095592),('Stripes','it','',1614095592,1614095592),('Stripes','ja','',1614095592,1614095592),('Stripes','nl','',1614095592,1614095592),('Stripes','pl','',1614095592,1614095592),('Stripes','pt_BR','',1614095592,1614095592),('Stripes','ru','',1614095592,1614095592),('Stripes','sk','',1614095592,1614095592),('Stripes','sv','',1614095592,1614095592),('Stripes','sv_FI','',1614095592,1614095592),('Stripes','th','',1614095592,1614095592),('Stripes','tr','',1614095592,1614095592),('Stripes','uk','',1614095592,1614095592),('Stripes','zh_Hans','',1614095592,1614095592),('Sudan','cs','',1614095587,1614095587),('Sudan','de','',1614095587,1614095587),('Sudan','en','',1614095587,1614095587),('Sudan','es','',1614095587,1614095587),('Sudan','fa','',1614095587,1614095587),('Sudan','fr','',1614095587,1614095587),('Sudan','hu','',1614095587,1614095587),('Sudan','it','',1614095587,1614095587),('Sudan','ja','',1614095587,1614095587),('Sudan','nl','',1614095587,1614095587),('Sudan','pl','',1614095587,1614095587),('Sudan','pt_BR','',1614095587,1614095587),('Sudan','ru','',1614095587,1614095587),('Sudan','sk','',1614095587,1614095587),('Sudan','sv','',1614095587,1614095587),('Sudan','sv_FI','',1614095587,1614095587),('Sudan','th','',1614095587,1614095587),('Sudan','tr','',1614095587,1614095587),('Sudan','uk','',1614095587,1614095587),('Sudan','zh_Hans','',1614095587,1614095587),('Suriname','cs','',1614095587,1614095587),('Suriname','de','',1614095587,1614095587),('Suriname','en','',1614095587,1614095587),('Suriname','es','',1614095587,1614095587),('Suriname','fa','',1614095587,1614095587),('Suriname','fr','',1614095587,1614095587),('Suriname','hu','',1614095587,1614095587),('Suriname','it','',1614095587,1614095587),('Suriname','ja','',1614095587,1614095587),('Suriname','nl','',1614095587,1614095587),('Suriname','pl','',1614095587,1614095587),('Suriname','pt_BR','',1614095587,1614095587),('Suriname','ru','',1614095587,1614095587),('Suriname','sk','',1614095587,1614095587),('Suriname','sv','',1614095587,1614095587),('Suriname','sv_FI','',1614095587,1614095587),('Suriname','th','',1614095587,1614095587),('Suriname','tr','',1614095587,1614095587),('Suriname','uk','',1614095587,1614095587),('Suriname','zh_Hans','',1614095587,1614095587),('Svalbard & Jan Mayen','cs','',1614095587,1614095587),('Svalbard & Jan Mayen','de','',1614095587,1614095587),('Svalbard & Jan Mayen','en','',1614095587,1614095587),('Svalbard & Jan Mayen','es','',1614095587,1614095587),('Svalbard & Jan Mayen','fa','',1614095587,1614095587),('Svalbard & Jan Mayen','fr','',1614095587,1614095587),('Svalbard & Jan Mayen','hu','',1614095587,1614095587),('Svalbard & Jan Mayen','it','',1614095587,1614095587),('Svalbard & Jan Mayen','ja','',1614095587,1614095587),('Svalbard & Jan Mayen','nl','',1614095587,1614095587),('Svalbard & Jan Mayen','pl','',1614095587,1614095587),('Svalbard & Jan Mayen','pt_BR','',1614095587,1614095587),('Svalbard & Jan Mayen','ru','',1614095587,1614095587),('Svalbard & Jan Mayen','sk','',1614095587,1614095587),('Svalbard & Jan Mayen','sv','',1614095587,1614095587),('Svalbard & Jan Mayen','sv_FI','',1614095587,1614095587),('Svalbard & Jan Mayen','th','',1614095587,1614095587),('Svalbard & Jan Mayen','tr','',1614095587,1614095587),('Svalbard & Jan Mayen','uk','',1614095587,1614095587),('Svalbard & Jan Mayen','zh_Hans','',1614095587,1614095587),('Sweden','cs','',1614095588,1614095588),('Sweden','de','',1614095588,1614095588),('Sweden','en','',1614095588,1614095588),('Sweden','es','',1614095588,1614095588),('Sweden','fa','',1614095588,1614095588),('Sweden','fr','',1614095588,1614095588),('Sweden','hu','',1614095588,1614095588),('Sweden','it','',1614095588,1614095588),('Sweden','ja','',1614095588,1614095588),('Sweden','nl','',1614095588,1614095588),('Sweden','pl','',1614095588,1614095588),('Sweden','pt_BR','',1614095588,1614095588),('Sweden','ru','',1614095588,1614095588),('Sweden','sk','',1614095588,1614095588),('Sweden','sv','',1614095588,1614095588),('Sweden','sv_FI','',1614095588,1614095588),('Sweden','th','',1614095588,1614095588),('Sweden','tr','',1614095588,1614095588),('Sweden','uk','',1614095588,1614095588),('Sweden','zh_Hans','',1614095588,1614095588),('Switzerland','cs','',1614095588,1614095588),('Switzerland','de','',1614095588,1614095588),('Switzerland','en','',1614095588,1614095588),('Switzerland','es','',1614095588,1614095588),('Switzerland','fa','',1614095588,1614095588),('Switzerland','fr','',1614095588,1614095588),('Switzerland','hu','',1614095588,1614095588),('Switzerland','it','',1614095588,1614095588),('Switzerland','ja','',1614095588,1614095588),('Switzerland','nl','',1614095588,1614095588),('Switzerland','pl','',1614095588,1614095588),('Switzerland','pt_BR','',1614095588,1614095588),('Switzerland','ru','',1614095588,1614095588),('Switzerland','sk','',1614095588,1614095588),('Switzerland','sv','',1614095588,1614095588),('Switzerland','sv_FI','',1614095588,1614095588),('Switzerland','th','',1614095588,1614095588),('Switzerland','tr','',1614095588,1614095588),('Switzerland','uk','',1614095588,1614095588),('Switzerland','zh_Hans','',1614095588,1614095588),('Syria','cs','',1614095588,1614095588),('Syria','de','',1614095588,1614095588),('Syria','en','',1614095588,1614095588),('Syria','es','',1614095588,1614095588),('Syria','fa','',1614095588,1614095588),('Syria','fr','',1614095588,1614095588),('Syria','hu','',1614095588,1614095588),('Syria','it','',1614095588,1614095588),('Syria','ja','',1614095588,1614095588),('Syria','nl','',1614095588,1614095588),('Syria','pl','',1614095588,1614095588),('Syria','pt_BR','',1614095588,1614095588),('Syria','ru','',1614095588,1614095588),('Syria','sk','',1614095588,1614095588),('Syria','sv','',1614095588,1614095588),('Syria','sv_FI','',1614095588,1614095588),('Syria','th','',1614095588,1614095588),('Syria','tr','',1614095588,1614095588),('Syria','uk','',1614095588,1614095588),('Syria','zh_Hans','',1614095588,1614095588),('São Tomé & Príncipe','cs','',1614095588,1614095588),('São Tomé & Príncipe','de','',1614095588,1614095588),('São Tomé & Príncipe','en','',1614095588,1614095588),('São Tomé & Príncipe','es','',1614095588,1614095588),('São Tomé & Príncipe','fa','',1614095588,1614095588),('São Tomé & Príncipe','fr','',1614095588,1614095588),('São Tomé & Príncipe','hu','',1614095588,1614095588),('São Tomé & Príncipe','it','',1614095588,1614095588),('São Tomé & Príncipe','ja','',1614095588,1614095588),('São Tomé & Príncipe','nl','',1614095588,1614095588),('São Tomé & Príncipe','pl','',1614095588,1614095588),('São Tomé & Príncipe','pt_BR','',1614095588,1614095588),('São Tomé & Príncipe','ru','',1614095588,1614095588),('São Tomé & Príncipe','sk','',1614095588,1614095588),('São Tomé & Príncipe','sv','',1614095588,1614095588),('São Tomé & Príncipe','sv_FI','',1614095588,1614095588),('São Tomé & Príncipe','th','',1614095588,1614095588),('São Tomé & Príncipe','tr','',1614095588,1614095588),('São Tomé & Príncipe','uk','',1614095588,1614095588),('São Tomé & Príncipe','zh_Hans','',1614095588,1614095588),('Taiwan','cs','',1614095588,1614095588),('Taiwan','de','',1614095588,1614095588),('Taiwan','en','',1614095588,1614095588),('Taiwan','es','',1614095588,1614095588),('Taiwan','fa','',1614095588,1614095588),('Taiwan','fr','',1614095588,1614095588),('Taiwan','hu','',1614095588,1614095588),('Taiwan','it','',1614095588,1614095588),('Taiwan','ja','',1614095588,1614095588),('Taiwan','nl','',1614095588,1614095588),('Taiwan','pl','',1614095588,1614095588),('Taiwan','pt_BR','',1614095588,1614095588),('Taiwan','ru','',1614095588,1614095588),('Taiwan','sk','',1614095588,1614095588),('Taiwan','sv','',1614095588,1614095588),('Taiwan','sv_FI','',1614095588,1614095588),('Taiwan','th','',1614095588,1614095588),('Taiwan','tr','',1614095588,1614095588),('Taiwan','uk','',1614095588,1614095588),('Taiwan','zh_Hans','',1614095588,1614095588),('Tajikistan','cs','',1614095588,1614095588),('Tajikistan','de','',1614095588,1614095588),('Tajikistan','en','',1614095588,1614095588),('Tajikistan','es','',1614095588,1614095588),('Tajikistan','fa','',1614095588,1614095588),('Tajikistan','fr','',1614095588,1614095588),('Tajikistan','hu','',1614095588,1614095588),('Tajikistan','it','',1614095588,1614095588),('Tajikistan','ja','',1614095588,1614095588),('Tajikistan','nl','',1614095588,1614095588),('Tajikistan','pl','',1614095588,1614095588),('Tajikistan','pt_BR','',1614095588,1614095588),('Tajikistan','ru','',1614095588,1614095588),('Tajikistan','sk','',1614095588,1614095588),('Tajikistan','sv','',1614095588,1614095588),('Tajikistan','sv_FI','',1614095588,1614095588),('Tajikistan','th','',1614095588,1614095588),('Tajikistan','tr','',1614095588,1614095588),('Tajikistan','uk','',1614095588,1614095588),('Tajikistan','zh_Hans','',1614095588,1614095588),('Tanzania','cs','',1614095588,1614095588),('Tanzania','de','',1614095588,1614095588),('Tanzania','en','',1614095588,1614095588),('Tanzania','es','',1614095588,1614095588),('Tanzania','fa','',1614095588,1614095588),('Tanzania','fr','',1614095588,1614095588),('Tanzania','hu','',1614095588,1614095588),('Tanzania','it','',1614095588,1614095588),('Tanzania','ja','',1614095588,1614095588),('Tanzania','nl','',1614095588,1614095588),('Tanzania','pl','',1614095588,1614095588),('Tanzania','pt_BR','',1614095588,1614095588),('Tanzania','ru','',1614095588,1614095588),('Tanzania','sk','',1614095588,1614095588),('Tanzania','sv','',1614095588,1614095588),('Tanzania','sv_FI','',1614095588,1614095588),('Tanzania','th','',1614095588,1614095588),('Tanzania','tr','',1614095588,1614095588),('Tanzania','uk','',1614095588,1614095588),('Tanzania','zh_Hans','',1614095588,1614095588),('Thailand','cs','',1614095588,1614095588),('Thailand','de','',1614095588,1614095588),('Thailand','en','',1614095588,1614095588),('Thailand','es','',1614095588,1614095588),('Thailand','fa','',1614095588,1614095588),('Thailand','fr','',1614095588,1614095588),('Thailand','hu','',1614095588,1614095588),('Thailand','it','',1614095588,1614095588),('Thailand','ja','',1614095588,1614095588),('Thailand','nl','',1614095588,1614095588),('Thailand','pl','',1614095588,1614095588),('Thailand','pt_BR','',1614095588,1614095588),('Thailand','ru','',1614095588,1614095588),('Thailand','sk','',1614095588,1614095588),('Thailand','sv','',1614095588,1614095588),('Thailand','sv_FI','',1614095588,1614095588),('Thailand','th','',1614095588,1614095588),('Thailand','tr','',1614095588,1614095588),('Thailand','uk','',1614095588,1614095588),('Thailand','zh_Hans','',1614095588,1614095588),('Timor-Leste','cs','',1614095588,1614095588),('Timor-Leste','de','',1614095588,1614095588),('Timor-Leste','en','',1614095588,1614095588),('Timor-Leste','es','',1614095588,1614095588),('Timor-Leste','fa','',1614095588,1614095588),('Timor-Leste','fr','',1614095588,1614095588),('Timor-Leste','hu','',1614095588,1614095588),('Timor-Leste','it','',1614095588,1614095588),('Timor-Leste','ja','',1614095588,1614095588),('Timor-Leste','nl','',1614095588,1614095588),('Timor-Leste','pl','',1614095588,1614095588),('Timor-Leste','pt_BR','',1614095588,1614095588),('Timor-Leste','ru','',1614095588,1614095588),('Timor-Leste','sk','',1614095588,1614095588),('Timor-Leste','sv','',1614095588,1614095588),('Timor-Leste','sv_FI','',1614095588,1614095588),('Timor-Leste','th','',1614095588,1614095588),('Timor-Leste','tr','',1614095588,1614095588),('Timor-Leste','uk','',1614095588,1614095588),('Timor-Leste','zh_Hans','',1614095588,1614095588),('Togo','cs','',1614095588,1614095588),('Togo','de','',1614095588,1614095588),('Togo','en','',1614095588,1614095588),('Togo','es','',1614095588,1614095588),('Togo','fa','',1614095588,1614095588),('Togo','fr','',1614095588,1614095588),('Togo','hu','',1614095588,1614095588),('Togo','it','',1614095588,1614095588),('Togo','ja','',1614095588,1614095588),('Togo','nl','',1614095588,1614095588),('Togo','pl','',1614095588,1614095588),('Togo','pt_BR','',1614095588,1614095588),('Togo','ru','',1614095588,1614095588),('Togo','sk','',1614095588,1614095588),('Togo','sv','',1614095588,1614095588),('Togo','sv_FI','',1614095588,1614095588),('Togo','th','',1614095588,1614095588),('Togo','tr','',1614095588,1614095588),('Togo','uk','',1614095588,1614095588),('Togo','zh_Hans','',1614095588,1614095588),('Tokelau','cs','',1614095589,1614095589),('Tokelau','de','',1614095589,1614095589),('Tokelau','en','',1614095589,1614095589),('Tokelau','es','',1614095589,1614095589),('Tokelau','fa','',1614095589,1614095589),('Tokelau','fr','',1614095589,1614095589),('Tokelau','hu','',1614095589,1614095589),('Tokelau','it','',1614095589,1614095589),('Tokelau','ja','',1614095589,1614095589),('Tokelau','nl','',1614095589,1614095589),('Tokelau','pl','',1614095589,1614095589),('Tokelau','pt_BR','',1614095589,1614095589),('Tokelau','ru','',1614095589,1614095589),('Tokelau','sk','',1614095589,1614095589),('Tokelau','sv','',1614095589,1614095589),('Tokelau','sv_FI','',1614095589,1614095589),('Tokelau','th','',1614095589,1614095589),('Tokelau','tr','',1614095589,1614095589),('Tokelau','uk','',1614095589,1614095589),('Tokelau','zh_Hans','',1614095589,1614095589),('Tonga','cs','',1614095589,1614095589),('Tonga','de','',1614095589,1614095589),('Tonga','en','',1614095589,1614095589),('Tonga','es','',1614095589,1614095589),('Tonga','fa','',1614095589,1614095589),('Tonga','fr','',1614095589,1614095589),('Tonga','hu','',1614095589,1614095589),('Tonga','it','',1614095589,1614095589),('Tonga','ja','',1614095589,1614095589),('Tonga','nl','',1614095589,1614095589),('Tonga','pl','',1614095589,1614095589),('Tonga','pt_BR','',1614095589,1614095589),('Tonga','ru','',1614095589,1614095589),('Tonga','sk','',1614095589,1614095589),('Tonga','sv','',1614095589,1614095589),('Tonga','sv_FI','',1614095589,1614095589),('Tonga','th','',1614095589,1614095589),('Tonga','tr','',1614095589,1614095589),('Tonga','uk','',1614095589,1614095589),('Tonga','zh_Hans','',1614095589,1614095589),('Trinidad & Tobago','cs','',1614095589,1614095589),('Trinidad & Tobago','de','',1614095589,1614095589),('Trinidad & Tobago','en','',1614095589,1614095589),('Trinidad & Tobago','es','',1614095589,1614095589),('Trinidad & Tobago','fa','',1614095589,1614095589),('Trinidad & Tobago','fr','',1614095589,1614095589),('Trinidad & Tobago','hu','',1614095589,1614095589),('Trinidad & Tobago','it','',1614095589,1614095589),('Trinidad & Tobago','ja','',1614095589,1614095589),('Trinidad & Tobago','nl','',1614095589,1614095589),('Trinidad & Tobago','pl','',1614095589,1614095589),('Trinidad & Tobago','pt_BR','',1614095589,1614095589),('Trinidad & Tobago','ru','',1614095589,1614095589),('Trinidad & Tobago','sk','',1614095589,1614095589),('Trinidad & Tobago','sv','',1614095589,1614095589),('Trinidad & Tobago','sv_FI','',1614095589,1614095589),('Trinidad & Tobago','th','',1614095589,1614095589),('Trinidad & Tobago','tr','',1614095589,1614095589),('Trinidad & Tobago','uk','',1614095589,1614095589),('Trinidad & Tobago','zh_Hans','',1614095589,1614095589),('Tunisia','cs','',1614095589,1614095589),('Tunisia','de','',1614095589,1614095589),('Tunisia','en','',1614095589,1614095589),('Tunisia','es','',1614095589,1614095589),('Tunisia','fa','',1614095589,1614095589),('Tunisia','fr','',1614095589,1614095589),('Tunisia','hu','',1614095589,1614095589),('Tunisia','it','',1614095589,1614095589),('Tunisia','ja','',1614095589,1614095589),('Tunisia','nl','',1614095589,1614095589),('Tunisia','pl','',1614095589,1614095589),('Tunisia','pt_BR','',1614095589,1614095589),('Tunisia','ru','',1614095589,1614095589),('Tunisia','sk','',1614095589,1614095589),('Tunisia','sv','',1614095589,1614095589),('Tunisia','sv_FI','',1614095589,1614095589),('Tunisia','th','',1614095589,1614095589),('Tunisia','tr','',1614095589,1614095589),('Tunisia','uk','',1614095589,1614095589),('Tunisia','zh_Hans','',1614095589,1614095589),('Turkey','cs','',1614095589,1614095589),('Turkey','de','',1614095589,1614095589),('Turkey','en','',1614095589,1614095589),('Turkey','es','',1614095589,1614095589),('Turkey','fa','',1614095589,1614095589),('Turkey','fr','',1614095589,1614095589),('Turkey','hu','',1614095589,1614095589),('Turkey','it','',1614095589,1614095589),('Turkey','ja','',1614095589,1614095589),('Turkey','nl','',1614095589,1614095589),('Turkey','pl','',1614095589,1614095589),('Turkey','pt_BR','',1614095589,1614095589),('Turkey','ru','',1614095589,1614095589),('Turkey','sk','',1614095589,1614095589),('Turkey','sv','',1614095589,1614095589),('Turkey','sv_FI','',1614095589,1614095589),('Turkey','th','',1614095589,1614095589),('Turkey','tr','',1614095589,1614095589),('Turkey','uk','',1614095589,1614095589),('Turkey','zh_Hans','',1614095589,1614095589),('Turkmenistan','cs','',1614095589,1614095589),('Turkmenistan','de','',1614095589,1614095589),('Turkmenistan','en','',1614095589,1614095589),('Turkmenistan','es','',1614095589,1614095589),('Turkmenistan','fa','',1614095589,1614095589),('Turkmenistan','fr','',1614095589,1614095589),('Turkmenistan','hu','',1614095589,1614095589),('Turkmenistan','it','',1614095589,1614095589),('Turkmenistan','ja','',1614095589,1614095589),('Turkmenistan','nl','',1614095589,1614095589),('Turkmenistan','pl','',1614095589,1614095589),('Turkmenistan','pt_BR','',1614095589,1614095589),('Turkmenistan','ru','',1614095589,1614095589),('Turkmenistan','sk','',1614095589,1614095589),('Turkmenistan','sv','',1614095589,1614095589),('Turkmenistan','sv_FI','',1614095589,1614095589),('Turkmenistan','th','',1614095589,1614095589),('Turkmenistan','tr','',1614095589,1614095589),('Turkmenistan','uk','',1614095589,1614095589),('Turkmenistan','zh_Hans','',1614095589,1614095589),('Turks & Caicos Islands','cs','',1614095589,1614095589),('Turks & Caicos Islands','de','',1614095589,1614095589),('Turks & Caicos Islands','en','',1614095589,1614095589),('Turks & Caicos Islands','es','',1614095589,1614095589),('Turks & Caicos Islands','fa','',1614095589,1614095589),('Turks & Caicos Islands','fr','',1614095589,1614095589),('Turks & Caicos Islands','hu','',1614095589,1614095589),('Turks & Caicos Islands','it','',1614095589,1614095589),('Turks & Caicos Islands','ja','',1614095589,1614095589),('Turks & Caicos Islands','nl','',1614095589,1614095589),('Turks & Caicos Islands','pl','',1614095589,1614095589),('Turks & Caicos Islands','pt_BR','',1614095589,1614095589),('Turks & Caicos Islands','ru','',1614095589,1614095589),('Turks & Caicos Islands','sk','',1614095589,1614095589),('Turks & Caicos Islands','sv','',1614095589,1614095589),('Turks & Caicos Islands','sv_FI','',1614095589,1614095589),('Turks & Caicos Islands','th','',1614095589,1614095589),('Turks & Caicos Islands','tr','',1614095589,1614095589),('Turks & Caicos Islands','uk','',1614095589,1614095589),('Turks & Caicos Islands','zh_Hans','',1614095589,1614095589),('Tuvalu','cs','',1614095589,1614095589),('Tuvalu','de','',1614095589,1614095589),('Tuvalu','en','',1614095589,1614095589),('Tuvalu','es','',1614095589,1614095589),('Tuvalu','fa','',1614095589,1614095589),('Tuvalu','fr','',1614095589,1614095589),('Tuvalu','hu','',1614095589,1614095589),('Tuvalu','it','',1614095589,1614095589),('Tuvalu','ja','',1614095589,1614095589),('Tuvalu','nl','',1614095589,1614095589),('Tuvalu','pl','',1614095589,1614095589),('Tuvalu','pt_BR','',1614095589,1614095589),('Tuvalu','ru','',1614095589,1614095589),('Tuvalu','sk','',1614095589,1614095589),('Tuvalu','sv','',1614095589,1614095589),('Tuvalu','sv_FI','',1614095589,1614095589),('Tuvalu','th','',1614095589,1614095589),('Tuvalu','tr','',1614095589,1614095589),('Tuvalu','uk','',1614095589,1614095589),('Tuvalu','zh_Hans','',1614095589,1614095589),('Types','cs','',1614096675,1614096675),('Types','de','',1614096675,1614096675),('Types','en','',1614096675,1614096675),('Types','es','',1614096675,1614096675),('Types','fa','',1614096675,1614096675),('Types','fr','',1614096675,1614096675),('Types','hu','',1614096675,1614096675),('Types','it','',1614096675,1614096675),('Types','ja','',1614096675,1614096675),('Types','nl','',1614096675,1614096675),('Types','pl','',1614096675,1614096675),('Types','pt_BR','',1614096675,1614096675),('Types','ru','',1614096675,1614096675),('Types','sk','',1614096675,1614096675),('Types','sv','',1614096675,1614096675),('Types','sv_FI','',1614096675,1614096675),('Types','th','',1614096675,1614096675),('Types','tr','',1614096675,1614096675),('Types','uk','',1614096675,1614096675),('Types','zh_Hans','',1614096675,1614096675),('U.S. Outlying Islands','cs','',1614095589,1614095589),('U.S. Outlying Islands','de','',1614095589,1614095589),('U.S. Outlying Islands','en','',1614095589,1614095589),('U.S. Outlying Islands','es','',1614095589,1614095589),('U.S. Outlying Islands','fa','',1614095589,1614095589),('U.S. Outlying Islands','fr','',1614095589,1614095589),('U.S. Outlying Islands','hu','',1614095589,1614095589),('U.S. Outlying Islands','it','',1614095589,1614095589),('U.S. Outlying Islands','ja','',1614095589,1614095589),('U.S. Outlying Islands','nl','',1614095589,1614095589),('U.S. Outlying Islands','pl','',1614095589,1614095589),('U.S. Outlying Islands','pt_BR','',1614095589,1614095589),('U.S. Outlying Islands','ru','',1614095589,1614095589),('U.S. Outlying Islands','sk','',1614095589,1614095589),('U.S. Outlying Islands','sv','',1614095589,1614095589),('U.S. Outlying Islands','sv_FI','',1614095589,1614095589),('U.S. Outlying Islands','th','',1614095589,1614095589),('U.S. Outlying Islands','tr','',1614095589,1614095589),('U.S. Outlying Islands','uk','',1614095589,1614095589),('U.S. Outlying Islands','zh_Hans','',1614095589,1614095589),('U.S. Virgin Islands','cs','',1614095590,1614095590),('U.S. Virgin Islands','de','',1614095590,1614095590),('U.S. Virgin Islands','en','',1614095590,1614095590),('U.S. Virgin Islands','es','',1614095590,1614095590),('U.S. Virgin Islands','fa','',1614095590,1614095590),('U.S. Virgin Islands','fr','',1614095590,1614095590),('U.S. Virgin Islands','hu','',1614095590,1614095590),('U.S. Virgin Islands','it','',1614095590,1614095590),('U.S. Virgin Islands','ja','',1614095590,1614095590),('U.S. Virgin Islands','nl','',1614095590,1614095590),('U.S. Virgin Islands','pl','',1614095590,1614095590),('U.S. Virgin Islands','pt_BR','',1614095590,1614095590),('U.S. Virgin Islands','ru','',1614095590,1614095590),('U.S. Virgin Islands','sk','',1614095590,1614095590),('U.S. Virgin Islands','sv','',1614095590,1614095590),('U.S. Virgin Islands','sv_FI','',1614095590,1614095590),('U.S. Virgin Islands','th','',1614095590,1614095590),('U.S. Virgin Islands','tr','',1614095590,1614095590),('U.S. Virgin Islands','uk','',1614095590,1614095590),('U.S. Virgin Islands','zh_Hans','',1614095590,1614095590),('Uganda','cs','',1614095590,1614095590),('Uganda','de','',1614095590,1614095590),('Uganda','en','',1614095590,1614095590),('Uganda','es','',1614095590,1614095590),('Uganda','fa','',1614095590,1614095590),('Uganda','fr','',1614095590,1614095590),('Uganda','hu','',1614095590,1614095590),('Uganda','it','',1614095590,1614095590),('Uganda','ja','',1614095590,1614095590),('Uganda','nl','',1614095590,1614095590),('Uganda','pl','',1614095590,1614095590),('Uganda','pt_BR','',1614095590,1614095590),('Uganda','ru','',1614095590,1614095590),('Uganda','sk','',1614095590,1614095590),('Uganda','sv','',1614095590,1614095590),('Uganda','sv_FI','',1614095590,1614095590),('Uganda','th','',1614095590,1614095590),('Uganda','tr','',1614095590,1614095590),('Uganda','uk','',1614095590,1614095590),('Uganda','zh_Hans','',1614095590,1614095590),('Ukraine','cs','',1614095590,1614095590),('Ukraine','de','',1614095590,1614095590),('Ukraine','en','',1614095590,1614095590),('Ukraine','es','',1614095590,1614095590),('Ukraine','fa','',1614095590,1614095590),('Ukraine','fr','',1614095590,1614095590),('Ukraine','hu','',1614095590,1614095590),('Ukraine','it','',1614095590,1614095590),('Ukraine','ja','',1614095590,1614095590),('Ukraine','nl','',1614095590,1614095590),('Ukraine','pl','',1614095590,1614095590),('Ukraine','pt_BR','',1614095590,1614095590),('Ukraine','ru','',1614095590,1614095590),('Ukraine','sk','',1614095590,1614095590),('Ukraine','sv','',1614095590,1614095590),('Ukraine','sv_FI','',1614095590,1614095590),('Ukraine','th','',1614095590,1614095590),('Ukraine','tr','',1614095590,1614095590),('Ukraine','uk','',1614095590,1614095590),('Ukraine','zh_Hans','',1614095590,1614095590),('United Arab Emirates','cs','',1614095590,1614095590),('United Arab Emirates','de','',1614095590,1614095590),('United Arab Emirates','en','',1614095590,1614095590),('United Arab Emirates','es','',1614095590,1614095590),('United Arab Emirates','fa','',1614095590,1614095590),('United Arab Emirates','fr','',1614095590,1614095590),('United Arab Emirates','hu','',1614095590,1614095590),('United Arab Emirates','it','',1614095590,1614095590),('United Arab Emirates','ja','',1614095590,1614095590),('United Arab Emirates','nl','',1614095590,1614095590),('United Arab Emirates','pl','',1614095590,1614095590),('United Arab Emirates','pt_BR','',1614095590,1614095590),('United Arab Emirates','ru','',1614095590,1614095590),('United Arab Emirates','sk','',1614095590,1614095590),('United Arab Emirates','sv','',1614095590,1614095590),('United Arab Emirates','sv_FI','',1614095590,1614095590),('United Arab Emirates','th','',1614095590,1614095590),('United Arab Emirates','tr','',1614095590,1614095590),('United Arab Emirates','uk','',1614095590,1614095590),('United Arab Emirates','zh_Hans','',1614095590,1614095590),('United Kingdom','cs','',1614095590,1614095590),('United Kingdom','de','',1614095590,1614095590),('United Kingdom','en','',1614095590,1614095590),('United Kingdom','es','',1614095590,1614095590),('United Kingdom','fa','',1614095590,1614095590),('United Kingdom','fr','',1614095590,1614095590),('United Kingdom','hu','',1614095590,1614095590),('United Kingdom','it','',1614095590,1614095590),('United Kingdom','ja','',1614095590,1614095590),('United Kingdom','nl','',1614095590,1614095590),('United Kingdom','pl','',1614095590,1614095590),('United Kingdom','pt_BR','',1614095590,1614095590),('United Kingdom','ru','',1614095590,1614095590),('United Kingdom','sk','',1614095590,1614095590),('United Kingdom','sv','',1614095590,1614095590),('United Kingdom','sv_FI','',1614095590,1614095590),('United Kingdom','th','',1614095590,1614095590),('United Kingdom','tr','',1614095590,1614095590),('United Kingdom','uk','',1614095590,1614095590),('United Kingdom','zh_Hans','',1614095590,1614095590),('United States','cs','',1614095590,1614095590),('United States','de','',1614095590,1614095590),('United States','en','',1614095590,1614095590),('United States','es','',1614095590,1614095590),('United States','fa','',1614095590,1614095590),('United States','fr','',1614095590,1614095590),('United States','hu','',1614095590,1614095590),('United States','it','',1614095590,1614095590),('United States','ja','',1614095590,1614095590),('United States','nl','',1614095590,1614095590),('United States','pl','',1614095590,1614095590),('United States','pt_BR','',1614095590,1614095590),('United States','ru','',1614095590,1614095590),('United States','sk','',1614095590,1614095590),('United States','sv','',1614095590,1614095590),('United States','sv_FI','',1614095590,1614095590),('United States','th','',1614095590,1614095590),('United States','tr','',1614095590,1614095590),('United States','uk','',1614095590,1614095590),('United States','zh_Hans','',1614095590,1614095590),('Uruguay','cs','',1614095590,1614095590),('Uruguay','de','',1614095590,1614095590),('Uruguay','en','',1614095590,1614095590),('Uruguay','es','',1614095590,1614095590),('Uruguay','fa','',1614095590,1614095590),('Uruguay','fr','',1614095590,1614095590),('Uruguay','hu','',1614095590,1614095590),('Uruguay','it','',1614095590,1614095590),('Uruguay','ja','',1614095590,1614095590),('Uruguay','nl','',1614095590,1614095590),('Uruguay','pl','',1614095590,1614095590),('Uruguay','pt_BR','',1614095590,1614095590),('Uruguay','ru','',1614095590,1614095590),('Uruguay','sk','',1614095590,1614095590),('Uruguay','sv','',1614095590,1614095590),('Uruguay','sv_FI','',1614095590,1614095590),('Uruguay','th','',1614095590,1614095590),('Uruguay','tr','',1614095590,1614095590),('Uruguay','uk','',1614095590,1614095590),('Uruguay','zh_Hans','',1614095590,1614095590),('Uzbekistan','cs','',1614095590,1614095590),('Uzbekistan','de','',1614095590,1614095590),('Uzbekistan','en','',1614095590,1614095590),('Uzbekistan','es','',1614095590,1614095590),('Uzbekistan','fa','',1614095590,1614095590),('Uzbekistan','fr','',1614095590,1614095590),('Uzbekistan','hu','',1614095590,1614095590),('Uzbekistan','it','',1614095590,1614095590),('Uzbekistan','ja','',1614095590,1614095590),('Uzbekistan','nl','',1614095590,1614095590),('Uzbekistan','pl','',1614095590,1614095590),('Uzbekistan','pt_BR','',1614095590,1614095590),('Uzbekistan','ru','',1614095590,1614095590),('Uzbekistan','sk','',1614095590,1614095590),('Uzbekistan','sv','',1614095590,1614095590),('Uzbekistan','sv_FI','',1614095590,1614095590),('Uzbekistan','th','',1614095590,1614095590),('Uzbekistan','tr','',1614095590,1614095590),('Uzbekistan','uk','',1614095590,1614095590),('Uzbekistan','zh_Hans','',1614095590,1614095590),('V Neck','cs','',1614096675,1614096675),('V Neck','de','',1614096675,1614096675),('V Neck','en','',1614096675,1614096675),('V Neck','es','',1614096675,1614096675),('V Neck','fa','',1614096675,1614096675),('V Neck','fr','',1614096675,1614096675),('V Neck','hu','',1614096675,1614096675),('V Neck','it','',1614096675,1614096675),('V Neck','ja','',1614096675,1614096675),('V Neck','nl','',1614096675,1614096675),('V Neck','pl','',1614096675,1614096675),('V Neck','pt_BR','',1614096675,1614096675),('V Neck','ru','',1614096675,1614096675),('V Neck','sk','',1614096675,1614096675),('V Neck','sv','',1614096675,1614096675),('V Neck','sv_FI','',1614096675,1614096675),('V Neck','th','',1614096675,1614096675),('V Neck','tr','',1614096675,1614096675),('V Neck','uk','',1614096675,1614096675),('V Neck','zh_Hans','',1614096675,1614096675),('Vanuatu','cs','',1614095590,1614095590),('Vanuatu','de','',1614095590,1614095590),('Vanuatu','en','',1614095590,1614095590),('Vanuatu','es','',1614095590,1614095590),('Vanuatu','fa','',1614095590,1614095590),('Vanuatu','fr','',1614095590,1614095590),('Vanuatu','hu','',1614095590,1614095590),('Vanuatu','it','',1614095590,1614095590),('Vanuatu','ja','',1614095590,1614095590),('Vanuatu','nl','',1614095590,1614095590),('Vanuatu','pl','',1614095590,1614095590),('Vanuatu','pt_BR','',1614095590,1614095590),('Vanuatu','ru','',1614095590,1614095590),('Vanuatu','sk','',1614095590,1614095590),('Vanuatu','sv','',1614095590,1614095590),('Vanuatu','sv_FI','',1614095590,1614095590),('Vanuatu','th','',1614095590,1614095590),('Vanuatu','tr','',1614095590,1614095590),('Vanuatu','uk','',1614095590,1614095590),('Vanuatu','zh_Hans','',1614095590,1614095590),('Vatican City','cs','',1614095590,1614095590),('Vatican City','de','',1614095590,1614095590),('Vatican City','en','',1614095590,1614095590),('Vatican City','es','',1614095590,1614095590),('Vatican City','fa','',1614095590,1614095590),('Vatican City','fr','',1614095590,1614095590),('Vatican City','hu','',1614095590,1614095590),('Vatican City','it','',1614095590,1614095590),('Vatican City','ja','',1614095590,1614095590),('Vatican City','nl','',1614095590,1614095590),('Vatican City','pl','',1614095590,1614095590),('Vatican City','pt_BR','',1614095590,1614095590),('Vatican City','ru','',1614095590,1614095590),('Vatican City','sk','',1614095590,1614095590),('Vatican City','sv','',1614095590,1614095590),('Vatican City','sv_FI','',1614095590,1614095590),('Vatican City','th','',1614095590,1614095590),('Vatican City','tr','',1614095590,1614095590),('Vatican City','uk','',1614095590,1614095590),('Vatican City','zh_Hans','',1614095590,1614095590),('Venezuela','cs','',1614095590,1614095590),('Venezuela','de','',1614095590,1614095590),('Venezuela','en','',1614095590,1614095590),('Venezuela','es','',1614095590,1614095590),('Venezuela','fa','',1614095590,1614095590),('Venezuela','fr','',1614095590,1614095590),('Venezuela','hu','',1614095590,1614095590),('Venezuela','it','',1614095590,1614095590),('Venezuela','ja','',1614095590,1614095590),('Venezuela','nl','',1614095590,1614095590),('Venezuela','pl','',1614095590,1614095590),('Venezuela','pt_BR','',1614095590,1614095590),('Venezuela','ru','',1614095590,1614095590),('Venezuela','sk','',1614095590,1614095590),('Venezuela','sv','',1614095590,1614095590),('Venezuela','sv_FI','',1614095590,1614095590),('Venezuela','th','',1614095590,1614095590),('Venezuela','tr','',1614095590,1614095590),('Venezuela','uk','',1614095590,1614095590),('Venezuela','zh_Hans','',1614095590,1614095590),('Vietnam','cs','',1614095591,1614095591),('Vietnam','de','',1614095591,1614095591),('Vietnam','en','',1614095591,1614095591),('Vietnam','es','',1614095591,1614095591),('Vietnam','fa','',1614095591,1614095591),('Vietnam','fr','',1614095591,1614095591),('Vietnam','hu','',1614095591,1614095591),('Vietnam','it','',1614095591,1614095591),('Vietnam','ja','',1614095591,1614095591),('Vietnam','nl','',1614095591,1614095591),('Vietnam','pl','',1614095591,1614095591),('Vietnam','pt_BR','',1614095591,1614095591),('Vietnam','ru','',1614095591,1614095591),('Vietnam','sk','',1614095591,1614095591),('Vietnam','sv','',1614095591,1614095591),('Vietnam','sv_FI','',1614095591,1614095591),('Vietnam','th','',1614095591,1614095591),('Vietnam','tr','',1614095591,1614095591),('Vietnam','uk','',1614095591,1614095591),('Vietnam','zh_Hans','',1614095591,1614095591),('Wallis & Futuna','cs','',1614095591,1614095591),('Wallis & Futuna','de','',1614095591,1614095591),('Wallis & Futuna','en','',1614095591,1614095591),('Wallis & Futuna','es','',1614095591,1614095591),('Wallis & Futuna','fa','',1614095591,1614095591),('Wallis & Futuna','fr','',1614095591,1614095591),('Wallis & Futuna','hu','',1614095591,1614095591),('Wallis & Futuna','it','',1614095591,1614095591),('Wallis & Futuna','ja','',1614095591,1614095591),('Wallis & Futuna','nl','',1614095591,1614095591),('Wallis & Futuna','pl','',1614095591,1614095591),('Wallis & Futuna','pt_BR','',1614095591,1614095591),('Wallis & Futuna','ru','',1614095591,1614095591),('Wallis & Futuna','sk','',1614095591,1614095591),('Wallis & Futuna','sv','',1614095591,1614095591),('Wallis & Futuna','sv_FI','',1614095591,1614095591),('Wallis & Futuna','th','',1614095591,1614095591),('Wallis & Futuna','tr','',1614095591,1614095591),('Wallis & Futuna','uk','',1614095591,1614095591),('Wallis & Futuna','zh_Hans','',1614095591,1614095591),('Warranty','cs','',1614095566,1614095566),('Warranty','de','',1614095566,1614095566),('Warranty','en','',1614095566,1614095566),('Warranty','es','',1614095566,1614095566),('Warranty','fa','',1614095566,1614095566),('Warranty','fr','',1614095566,1614095566),('Warranty','hu','',1614095566,1614095566),('Warranty','it','',1614095566,1614095566),('Warranty','ja','',1614095566,1614095566),('Warranty','nl','',1614095566,1614095566),('Warranty','pl','',1614095566,1614095566),('Warranty','pt_BR','',1614095566,1614095566),('Warranty','ru','',1614095566,1614095566),('Warranty','sk','',1614095566,1614095566),('Warranty','sv','',1614095566,1614095566),('Warranty','sv_FI','',1614095566,1614095566),('Warranty','th','',1614095566,1614095566),('Warranty','tr','',1614095566,1614095566),('Warranty','uk','',1614095566,1614095566),('Warranty','zh_Hans','',1614095566,1614095566),('Washable','cs','',1614088788,1614088788),('Washable','de','',1614088788,1614088788),('Washable','en','',1614088788,1614088788),('Washable','es','',1614088788,1614088788),('Washable','fa','',1614088788,1614088788),('Washable','fr','',1614088788,1614088788),('Washable','hu','',1614088788,1614088788),('Washable','it','',1614088788,1614088788),('Washable','ja','',1614088788,1614088788),('Washable','nl','',1614088788,1614088788),('Washable','pl','',1614088788,1614088788),('Washable','pt_BR','',1614088788,1614088788),('Washable','ru','',1614088788,1614088788),('Washable','sk','',1614088788,1614088788),('Washable','sv','',1614088788,1614088788),('Washable','sv_FI','',1614088788,1614088788),('Washable','th','',1614088788,1614088788),('Washable','tr','',1614088788,1614088788),('Washable','uk','',1614088788,1614088788),('Washable','zh_Hans','',1614088788,1614088788),('Western Sahara','cs','',1614095591,1614095591),('Western Sahara','de','',1614095591,1614095591),('Western Sahara','en','',1614095591,1614095591),('Western Sahara','es','',1614095591,1614095591),('Western Sahara','fa','',1614095591,1614095591),('Western Sahara','fr','',1614095591,1614095591),('Western Sahara','hu','',1614095591,1614095591),('Western Sahara','it','',1614095591,1614095591),('Western Sahara','ja','',1614095591,1614095591),('Western Sahara','nl','',1614095591,1614095591),('Western Sahara','pl','',1614095591,1614095591),('Western Sahara','pt_BR','',1614095591,1614095591),('Western Sahara','ru','',1614095591,1614095591),('Western Sahara','sk','',1614095591,1614095591),('Western Sahara','sv','',1614095591,1614095591),('Western Sahara','sv_FI','',1614095591,1614095591),('Western Sahara','th','',1614095591,1614095591),('Western Sahara','tr','',1614095591,1614095591),('Western Sahara','uk','',1614095591,1614095591),('Western Sahara','zh_Hans','',1614095591,1614095591),('XL','cs','',1614095565,1614095565),('XL','de','',1614095565,1614095565),('XL','en','',1614095565,1614095565),('XL','es','',1614095565,1614095565),('XL','fa','',1614095565,1614095565),('XL','fr','',1614095565,1614095565),('XL','hu','',1614095565,1614095565),('XL','it','',1614095565,1614095565),('XL','ja','',1614095565,1614095565),('XL','nl','',1614095565,1614095565),('XL','pl','',1614095565,1614095565),('XL','pt_BR','',1614095565,1614095565),('XL','ru','',1614095565,1614095565),('XL','sk','',1614095565,1614095565),('XL','sv','',1614095565,1614095565),('XL','sv_FI','',1614095565,1614095565),('XL','th','',1614095565,1614095565),('XL','tr','',1614095565,1614095565),('XL','uk','',1614095565,1614095565),('XL','zh_Hans','',1614095565,1614095565),('XLSX Export','cs','',1614093259,1614093259),('XLSX Export','de','',1614093259,1614093259),('XLSX Export','en','',1614093259,1614093259),('XLSX Export','es','',1614093259,1614093259),('XLSX Export','fa','',1614093259,1614093259),('XLSX Export','fr','',1614093259,1614093259),('XLSX Export','hu','',1614093259,1614093259),('XLSX Export','it','',1614093259,1614093259),('XLSX Export','ja','',1614093259,1614093259),('XLSX Export','nl','',1614093259,1614093259),('XLSX Export','pl','',1614093259,1614093259),('XLSX Export','pt_BR','',1614093259,1614093259),('XLSX Export','ru','',1614093259,1614093259),('XLSX Export','sk','',1614093259,1614093259),('XLSX Export','sv','',1614093259,1614093259),('XLSX Export','sv_FI','',1614093259,1614093259),('XLSX Export','th','',1614093259,1614093259),('XLSX Export','tr','',1614093259,1614093259),('XLSX Export','uk','',1614093259,1614093259),('XLSX Export','zh_Hans','',1614093259,1614093259),('XXL','cs','',1614095565,1614095565),('XXL','de','',1614095565,1614095565),('XXL','en','',1614095565,1614095565),('XXL','es','',1614095565,1614095565),('XXL','fa','',1614095565,1614095565),('XXL','fr','',1614095565,1614095565),('XXL','hu','',1614095565,1614095565),('XXL','it','',1614095565,1614095565),('XXL','ja','',1614095565,1614095565),('XXL','nl','',1614095565,1614095565),('XXL','pl','',1614095565,1614095565),('XXL','pt_BR','',1614095565,1614095565),('XXL','ru','',1614095565,1614095565),('XXL','sk','',1614095565,1614095565),('XXL','sv','',1614095565,1614095565),('XXL','sv_FI','',1614095565,1614095565),('XXL','th','',1614095565,1614095565),('XXL','tr','',1614095565,1614095565),('XXL','uk','',1614095565,1614095565),('XXL','zh_Hans','',1614095565,1614095565),('Yemen','cs','',1614095591,1614095591),('Yemen','de','',1614095591,1614095591),('Yemen','en','',1614095591,1614095591),('Yemen','es','',1614095591,1614095591),('Yemen','fa','',1614095591,1614095591),('Yemen','fr','',1614095591,1614095591),('Yemen','hu','',1614095591,1614095591),('Yemen','it','',1614095591,1614095591),('Yemen','ja','',1614095591,1614095591),('Yemen','nl','',1614095591,1614095591),('Yemen','pl','',1614095591,1614095591),('Yemen','pt_BR','',1614095591,1614095591),('Yemen','ru','',1614095591,1614095591),('Yemen','sk','',1614095591,1614095591),('Yemen','sv','',1614095591,1614095591),('Yemen','sv_FI','',1614095591,1614095591),('Yemen','th','',1614095591,1614095591),('Yemen','tr','',1614095591,1614095591),('Yemen','uk','',1614095591,1614095591),('Yemen','zh_Hans','',1614095591,1614095591),('Zambia','cs','',1614095591,1614095591),('Zambia','de','',1614095591,1614095591),('Zambia','en','',1614095591,1614095591),('Zambia','es','',1614095591,1614095591),('Zambia','fa','',1614095591,1614095591),('Zambia','fr','',1614095591,1614095591),('Zambia','hu','',1614095591,1614095591),('Zambia','it','',1614095591,1614095591),('Zambia','ja','',1614095591,1614095591),('Zambia','nl','',1614095591,1614095591),('Zambia','pl','',1614095591,1614095591),('Zambia','pt_BR','',1614095591,1614095591),('Zambia','ru','',1614095591,1614095591),('Zambia','sk','',1614095591,1614095591),('Zambia','sv','',1614095591,1614095591),('Zambia','sv_FI','',1614095591,1614095591),('Zambia','th','',1614095591,1614095591),('Zambia','tr','',1614095591,1614095591),('Zambia','uk','',1614095591,1614095591),('Zambia','zh_Hans','',1614095591,1614095591),('Zimbabwe','cs','',1614095591,1614095591),('Zimbabwe','de','',1614095591,1614095591),('Zimbabwe','en','',1614095591,1614095591),('Zimbabwe','es','',1614095591,1614095591),('Zimbabwe','fa','',1614095591,1614095591),('Zimbabwe','fr','',1614095591,1614095591),('Zimbabwe','hu','',1614095591,1614095591),('Zimbabwe','it','',1614095591,1614095591),('Zimbabwe','ja','',1614095591,1614095591),('Zimbabwe','nl','',1614095591,1614095591),('Zimbabwe','pl','',1614095591,1614095591),('Zimbabwe','pt_BR','',1614095591,1614095591),('Zimbabwe','ru','',1614095591,1614095591),('Zimbabwe','sk','',1614095591,1614095591),('Zimbabwe','sv','',1614095591,1614095591),('Zimbabwe','sv_FI','',1614095591,1614095591),('Zimbabwe','th','',1614095591,1614095591),('Zimbabwe','tr','',1614095591,1614095591),('Zimbabwe','uk','',1614095591,1614095591),('Zimbabwe','zh_Hans','',1614095591,1614095591),('bottom','cs','',1614094634,1614094634),('bottom','de','',1614094634,1614094634),('bottom','en','',1614094634,1614094634),('bottom','es','',1614094634,1614094634),('bottom','fa','',1614094634,1614094634),('bottom','fr','',1614094634,1614094634),('bottom','hu','',1614094634,1614094634),('bottom','it','',1614094634,1614094634),('bottom','ja','',1614094634,1614094634),('bottom','nl','',1614094634,1614094634),('bottom','pl','',1614094634,1614094634),('bottom','pt_BR','',1614094634,1614094634),('bottom','ru','',1614094634,1614094634),('bottom','sk','',1614094634,1614094634),('bottom','sv','',1614094634,1614094634),('bottom','sv_FI','',1614094634,1614094634),('bottom','th','',1614094634,1614094634),('bottom','tr','',1614094634,1614094634),('bottom','uk','',1614094634,1614094634),('bottom','zh_Hans','',1614094634,1614094634),('brand','cs','',1614075137,1614075137),('brand','de','',1614075137,1614075137),('brand','en','',1614075137,1614075137),('brand','es','',1614075137,1614075137),('brand','fa','',1614075137,1614075137),('brand','fr','',1614075137,1614075137),('brand','hu','',1614075137,1614075137),('brand','it','',1614075137,1614075137),('brand','ja','',1614075137,1614075137),('brand','nl','',1614075137,1614075137),('brand','pl','',1614075137,1614075137),('brand','pt_BR','',1614075137,1614075137),('brand','ru','',1614075137,1614075137),('brand','sk','',1614075137,1614075137),('brand','sv','',1614075137,1614075137),('brand','sv_FI','',1614075137,1614075137),('brand','th','',1614075137,1614075137),('brand','tr','',1614075137,1614075137),('brand','uk','',1614075137,1614075137),('brand','zh_Hans','',1614075137,1614075137),('category','cs','',1614074994,1614074994),('category','de','',1614074994,1614074994),('category','en','',1614074994,1614074994),('category','es','',1614074994,1614074994),('category','fa','',1614074994,1614074994),('category','fr','',1614074994,1614074994),('category','hu','',1614074994,1614074994),('category','it','',1614074994,1614074994),('category','ja','',1614074994,1614074994),('category','nl','',1614074994,1614074994),('category','pl','',1614074994,1614074994),('category','pt_BR','',1614074994,1614074994),('category','ru','',1614074994,1614074994),('category','sk','',1614074994,1614074994),('category','sv','',1614074994,1614074994),('category','sv_FI','',1614074994,1614074994),('category','th','',1614074994,1614074994),('category','tr','',1614074994,1614074994),('category','uk','',1614074994,1614074994),('category','zh_Hans','',1614074994,1614074994),('default_value_warning','cs','',1614095354,1614095354),('default_value_warning','de','',1614095354,1614095354),('default_value_warning','en','',1614095354,1614095354),('default_value_warning','es','',1614095354,1614095354),('default_value_warning','fa','',1614095354,1614095354),('default_value_warning','fr','',1614095354,1614095354),('default_value_warning','hu','',1614095354,1614095354),('default_value_warning','it','',1614095354,1614095354),('default_value_warning','ja','',1614095354,1614095354),('default_value_warning','nl','',1614095354,1614095354),('default_value_warning','pl','',1614095354,1614095354),('default_value_warning','pt_BR','',1614095354,1614095354),('default_value_warning','ru','',1614095354,1614095354),('default_value_warning','sk','',1614095354,1614095354),('default_value_warning','sv','',1614095354,1614095354),('default_value_warning','sv_FI','',1614095354,1614095354),('default_value_warning','th','',1614095354,1614095354),('default_value_warning','tr','',1614095354,1614095354),('default_value_warning','uk','',1614095354,1614095354),('default_value_warning','zh_Hans','',1614095354,1614095354),('down','cs','',1614088609,1614088609),('down','de','',1614088609,1614088609),('down','en','',1614088609,1614088609),('down','es','',1614088609,1614088609),('down','fa','',1614088609,1614088609),('down','fr','',1614088609,1614088609),('down','hu','',1614088609,1614088609),('down','it','',1614088609,1614088609),('down','ja','',1614088609,1614088609),('down','nl','',1614088609,1614088609),('down','pl','',1614088609,1614088609),('down','pt_BR','',1614088609,1614088609),('down','ru','',1614088609,1614088609),('down','sk','',1614088609,1614088609),('down','sv','',1614088609,1614088609),('down','sv_FI','',1614088609,1614088609),('down','th','',1614088609,1614088609),('down','tr','',1614088609,1614088609),('down','uk','',1614088609,1614088609),('down','zh_Hans','',1614088609,1614088609),('fabric','cs','',1614088522,1614088522),('fabric','de','',1614088522,1614088522),('fabric','en','',1614088522,1614088522),('fabric','es','',1614088522,1614088522),('fabric','fa','',1614088522,1614088522),('fabric','fr','',1614088522,1614088522),('fabric','hu','',1614088522,1614088522),('fabric','it','',1614088522,1614088522),('fabric','ja','',1614088522,1614088522),('fabric','nl','',1614088522,1614088522),('fabric','pl','',1614088522,1614088522),('fabric','pt_BR','',1614088522,1614088522),('fabric','ru','',1614088522,1614088522),('fabric','sk','',1614088522,1614088522),('fabric','sv','',1614088522,1614088522),('fabric','sv_FI','',1614088522,1614088522),('fabric','th','',1614088522,1614088522),('fabric','tr','',1614088522,1614088522),('fabric','uk','',1614088522,1614088522),('fabric','zh_Hans','',1614088522,1614088522),('false','cs','',1614095354,1614095354),('false','de','',1614095354,1614095354),('false','en','',1614095354,1614095354),('false','es','',1614095354,1614095354),('false','fa','',1614095354,1614095354),('false','fr','',1614095354,1614095354),('false','hu','',1614095354,1614095354),('false','it','',1614095354,1614095354),('false','ja','',1614095354,1614095354),('false','nl','',1614095354,1614095354),('false','pl','',1614095354,1614095354),('false','pt_BR','',1614095354,1614095354),('false','ru','',1614095354,1614095354),('false','sk','',1614095354,1614095354),('false','sv','',1614095354,1614095354),('false','sv_FI','',1614095354,1614095354),('false','th','',1614095354,1614095354),('false','tr','',1614095354,1614095354),('false','uk','',1614095354,1614095354),('false','zh_Hans','',1614095354,1614095354),('faqs','cs','',1614095592,1614095592),('faqs','de','',1614095592,1614095592),('faqs','en','',1614095592,1614095592),('faqs','es','',1614095592,1614095592),('faqs','fa','',1614095592,1614095592),('faqs','fr','',1614095592,1614095592),('faqs','hu','',1614095592,1614095592),('faqs','it','',1614095592,1614095592),('faqs','ja','',1614095592,1614095592),('faqs','nl','',1614095592,1614095592),('faqs','pl','',1614095592,1614095592),('faqs','pt_BR','',1614095592,1614095592),('faqs','ru','',1614095592,1614095592),('faqs','sk','',1614095592,1614095592),('faqs','sv','',1614095592,1614095592),('faqs','sv_FI','',1614095592,1614095592),('faqs','th','',1614095592,1614095592),('faqs','tr','',1614095592,1614095592),('faqs','uk','',1614095592,1614095592),('faqs','zh_Hans','',1614095592,1614095592),('female','cs','',1614095565,1614095565),('female','de','',1614095565,1614095565),('female','en','',1614095565,1614095565),('female','es','',1614095565,1614095565),('female','fa','',1614095565,1614095565),('female','fr','',1614095565,1614095565),('female','hu','',1614095565,1614095565),('female','it','',1614095565,1614095565),('female','ja','',1614095565,1614095565),('female','nl','',1614095565,1614095565),('female','pl','',1614095565,1614095565),('female','pt_BR','',1614095565,1614095565),('female','ru','',1614095565,1614095565),('female','sk','',1614095565,1614095565),('female','sv','',1614095565,1614095565),('female','sv_FI','',1614095565,1614095565),('female','th','',1614095565,1614095565),('female','tr','',1614095565,1614095565),('female','uk','',1614095565,1614095565),('female','zh_Hans','',1614095565,1614095565),('jeans','cs','',1614096644,1614096644),('jeans','de','',1614096644,1614096644),('jeans','en','',1614096644,1614096644),('jeans','es','',1614096644,1614096644),('jeans','fa','',1614096644,1614096644),('jeans','fr','',1614096644,1614096644),('jeans','hu','',1614096644,1614096644),('jeans','it','',1614096644,1614096644),('jeans','ja','',1614096644,1614096644),('jeans','nl','',1614096644,1614096644),('jeans','pl','',1614096644,1614096644),('jeans','pt_BR','',1614096644,1614096644),('jeans','ru','',1614096644,1614096644),('jeans','sk','',1614096644,1614096644),('jeans','sv','',1614096644,1614096644),('jeans','sv_FI','',1614096644,1614096644),('jeans','th','',1614096644,1614096644),('jeans','tr','',1614096644,1614096644),('jeans','uk','',1614096644,1614096644),('jeans','zh_Hans','',1614096644,1614096644),('male','cs','',1614095565,1614095565),('male','de','',1614095565,1614095565),('male','en','',1614095565,1614095565),('male','es','',1614095565,1614095565),('male','fa','',1614095565,1614095565),('male','fr','',1614095565,1614095565),('male','hu','',1614095565,1614095565),('male','it','',1614095565,1614095565),('male','ja','',1614095565,1614095565),('male','nl','',1614095565,1614095565),('male','pl','',1614095565,1614095565),('male','pt_BR','',1614095565,1614095565),('male','ru','',1614095565,1614095565),('male','sk','',1614095565,1614095565),('male','sv','',1614095565,1614095565),('male','sv_FI','',1614095565,1614095565),('male','th','',1614095565,1614095565),('male','tr','',1614095565,1614095565),('male','uk','',1614095565,1614095565),('male','zh_Hans','',1614095565,1614095565),('months','cs','',1614091004,1614091004),('months','de','',1614091004,1614091004),('months','en','',1614091004,1614091004),('months','es','',1614091004,1614091004),('months','fa','',1614091004,1614091004),('months','fr','',1614091004,1614091004),('months','hu','',1614091004,1614091004),('months','it','',1614091004,1614091004),('months','ja','',1614091004,1614091004),('months','nl','',1614091004,1614091004),('months','pl','',1614091004,1614091004),('months','pt_BR','',1614091004,1614091004),('months','ru','',1614091004,1614091004),('months','sk','',1614091004,1614091004),('months','sv','',1614091004,1614091004),('months','sv_FI','',1614091004,1614091004),('months','th','',1614091004,1614091004),('months','tr','',1614091004,1614091004),('months','uk','',1614091004,1614091004),('months','zh_Hans','',1614091004,1614091004),('null','cs','',1614095354,1614095354),('null','de','',1614095354,1614095354),('null','en','',1614095354,1614095354),('null','es','',1614095354,1614095354),('null','fa','',1614095354,1614095354),('null','fr','',1614095354,1614095354),('null','hu','',1614095354,1614095354),('null','it','',1614095354,1614095354),('null','ja','',1614095354,1614095354),('null','nl','',1614095354,1614095354),('null','pl','',1614095354,1614095354),('null','pt_BR','',1614095354,1614095354),('null','ru','',1614095354,1614095354),('null','sk','',1614095354,1614095354),('null','sv','',1614095354,1614095354),('null','sv_FI','',1614095354,1614095354),('null','th','',1614095354,1614095354),('null','tr','',1614095354,1614095354),('null','uk','',1614095354,1614095354),('null','zh_Hans','',1614095354,1614095354),('object_add_dialog_custom_text.brand','cs','',1614075466,1614075466),('object_add_dialog_custom_text.brand','de','',1614075466,1614075466),('object_add_dialog_custom_text.brand','en','',1614075466,1614075466),('object_add_dialog_custom_text.brand','es','',1614075466,1614075466),('object_add_dialog_custom_text.brand','fa','',1614075466,1614075466),('object_add_dialog_custom_text.brand','fr','',1614075466,1614075466),('object_add_dialog_custom_text.brand','hu','',1614075466,1614075466),('object_add_dialog_custom_text.brand','it','',1614075466,1614075466),('object_add_dialog_custom_text.brand','ja','',1614075466,1614075466),('object_add_dialog_custom_text.brand','nl','',1614075466,1614075466),('object_add_dialog_custom_text.brand','pl','',1614075466,1614075466),('object_add_dialog_custom_text.brand','pt_BR','',1614075466,1614075466),('object_add_dialog_custom_text.brand','ru','',1614075466,1614075466),('object_add_dialog_custom_text.brand','sk','',1614075466,1614075466),('object_add_dialog_custom_text.brand','sv','',1614075466,1614075466),('object_add_dialog_custom_text.brand','sv_FI','',1614075466,1614075466),('object_add_dialog_custom_text.brand','th','',1614075466,1614075466),('object_add_dialog_custom_text.brand','tr','',1614075466,1614075466),('object_add_dialog_custom_text.brand','uk','',1614075466,1614075466),('object_add_dialog_custom_text.brand','zh_Hans','',1614075466,1614075466),('object_add_dialog_custom_text.category','cs','',1614075376,1614075376),('object_add_dialog_custom_text.category','de','',1614075376,1614075376),('object_add_dialog_custom_text.category','en','',1614075376,1614075376),('object_add_dialog_custom_text.category','es','',1614075376,1614075376),('object_add_dialog_custom_text.category','fa','',1614075376,1614075376),('object_add_dialog_custom_text.category','fr','',1614075376,1614075376),('object_add_dialog_custom_text.category','hu','',1614075376,1614075376),('object_add_dialog_custom_text.category','it','',1614075376,1614075376),('object_add_dialog_custom_text.category','ja','',1614075376,1614075376),('object_add_dialog_custom_text.category','nl','',1614075376,1614075376),('object_add_dialog_custom_text.category','pl','',1614075376,1614075376),('object_add_dialog_custom_text.category','pt_BR','',1614075376,1614075376),('object_add_dialog_custom_text.category','ru','',1614075376,1614075376),('object_add_dialog_custom_text.category','sk','',1614075376,1614075376),('object_add_dialog_custom_text.category','sv','',1614075376,1614075376),('object_add_dialog_custom_text.category','sv_FI','',1614075376,1614075376),('object_add_dialog_custom_text.category','th','',1614075376,1614075376),('object_add_dialog_custom_text.category','tr','',1614075376,1614075376),('object_add_dialog_custom_text.category','uk','',1614075376,1614075376),('object_add_dialog_custom_text.category','zh_Hans','',1614075376,1614075376),('object_add_dialog_custom_text.fabric','cs','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','de','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','en','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','es','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','fa','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','fr','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','hu','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','it','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','ja','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','nl','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','pl','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','pt_BR','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','ru','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','sk','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','sv','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','sv_FI','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','th','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','tr','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','uk','',1614088759,1614088759),('object_add_dialog_custom_text.fabric','zh_Hans','',1614088759,1614088759),('object_add_dialog_custom_text.product','cs','',1614095564,1614095564),('object_add_dialog_custom_text.product','de','',1614095564,1614095564),('object_add_dialog_custom_text.product','en','',1614095564,1614095564),('object_add_dialog_custom_text.product','es','',1614095564,1614095564),('object_add_dialog_custom_text.product','fa','',1614095564,1614095564),('object_add_dialog_custom_text.product','fr','',1614095564,1614095564),('object_add_dialog_custom_text.product','hu','',1614095564,1614095564),('object_add_dialog_custom_text.product','it','',1614095564,1614095564),('object_add_dialog_custom_text.product','ja','',1614095564,1614095564),('object_add_dialog_custom_text.product','nl','',1614095564,1614095564),('object_add_dialog_custom_text.product','pl','',1614095564,1614095564),('object_add_dialog_custom_text.product','pt_BR','',1614095564,1614095564),('object_add_dialog_custom_text.product','ru','',1614095564,1614095564),('object_add_dialog_custom_text.product','sk','',1614095564,1614095564),('object_add_dialog_custom_text.product','sv','',1614095564,1614095564),('object_add_dialog_custom_text.product','sv_FI','',1614095564,1614095564),('object_add_dialog_custom_text.product','th','',1614095564,1614095564),('object_add_dialog_custom_text.product','tr','',1614095564,1614095564),('object_add_dialog_custom_text.product','uk','',1614095564,1614095564),('object_add_dialog_custom_text.product','zh_Hans','',1614095564,1614095564),('object_add_dialog_custom_title.brand','cs','',1614075466,1614075466),('object_add_dialog_custom_title.brand','de','',1614075466,1614075466),('object_add_dialog_custom_title.brand','en','',1614075466,1614075466),('object_add_dialog_custom_title.brand','es','',1614075466,1614075466),('object_add_dialog_custom_title.brand','fa','',1614075466,1614075466),('object_add_dialog_custom_title.brand','fr','',1614075466,1614075466),('object_add_dialog_custom_title.brand','hu','',1614075466,1614075466),('object_add_dialog_custom_title.brand','it','',1614075466,1614075466),('object_add_dialog_custom_title.brand','ja','',1614075466,1614075466),('object_add_dialog_custom_title.brand','nl','',1614075466,1614075466),('object_add_dialog_custom_title.brand','pl','',1614075466,1614075466),('object_add_dialog_custom_title.brand','pt_BR','',1614075466,1614075466),('object_add_dialog_custom_title.brand','ru','',1614075466,1614075466),('object_add_dialog_custom_title.brand','sk','',1614075466,1614075466),('object_add_dialog_custom_title.brand','sv','',1614075466,1614075466),('object_add_dialog_custom_title.brand','sv_FI','',1614075466,1614075466),('object_add_dialog_custom_title.brand','th','',1614075466,1614075466),('object_add_dialog_custom_title.brand','tr','',1614075466,1614075466),('object_add_dialog_custom_title.brand','uk','',1614075466,1614075466),('object_add_dialog_custom_title.brand','zh_Hans','',1614075466,1614075466),('object_add_dialog_custom_title.category','cs','',1614075376,1614075376),('object_add_dialog_custom_title.category','de','',1614075376,1614075376),('object_add_dialog_custom_title.category','en','',1614075376,1614075376),('object_add_dialog_custom_title.category','es','',1614075376,1614075376),('object_add_dialog_custom_title.category','fa','',1614075376,1614075376),('object_add_dialog_custom_title.category','fr','',1614075376,1614075376),('object_add_dialog_custom_title.category','hu','',1614075376,1614075376),('object_add_dialog_custom_title.category','it','',1614075376,1614075376),('object_add_dialog_custom_title.category','ja','',1614075376,1614075376),('object_add_dialog_custom_title.category','nl','',1614075376,1614075376),('object_add_dialog_custom_title.category','pl','',1614075376,1614075376),('object_add_dialog_custom_title.category','pt_BR','',1614075376,1614075376),('object_add_dialog_custom_title.category','ru','',1614075376,1614075376),('object_add_dialog_custom_title.category','sk','',1614075376,1614075376),('object_add_dialog_custom_title.category','sv','',1614075376,1614075376),('object_add_dialog_custom_title.category','sv_FI','',1614075376,1614075376),('object_add_dialog_custom_title.category','th','',1614075376,1614075376),('object_add_dialog_custom_title.category','tr','',1614075376,1614075376),('object_add_dialog_custom_title.category','uk','',1614075376,1614075376),('object_add_dialog_custom_title.category','zh_Hans','',1614075376,1614075376),('object_add_dialog_custom_title.fabric','cs','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','de','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','en','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','es','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','fa','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','fr','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','hu','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','it','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','ja','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','nl','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','pl','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','pt_BR','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','ru','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','sk','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','sv','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','sv_FI','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','th','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','tr','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','uk','',1614088759,1614088759),('object_add_dialog_custom_title.fabric','zh_Hans','',1614088759,1614088759),('object_add_dialog_custom_title.product','cs','',1614095564,1614095564),('object_add_dialog_custom_title.product','de','',1614095564,1614095564),('object_add_dialog_custom_title.product','en','',1614095564,1614095564),('object_add_dialog_custom_title.product','es','',1614095564,1614095564),('object_add_dialog_custom_title.product','fa','',1614095564,1614095564),('object_add_dialog_custom_title.product','fr','',1614095564,1614095564),('object_add_dialog_custom_title.product','hu','',1614095564,1614095564),('object_add_dialog_custom_title.product','it','',1614095564,1614095564),('object_add_dialog_custom_title.product','ja','',1614095564,1614095564),('object_add_dialog_custom_title.product','nl','',1614095564,1614095564),('object_add_dialog_custom_title.product','pl','',1614095564,1614095564),('object_add_dialog_custom_title.product','pt_BR','',1614095564,1614095564),('object_add_dialog_custom_title.product','ru','',1614095564,1614095564),('object_add_dialog_custom_title.product','sk','',1614095564,1614095564),('object_add_dialog_custom_title.product','sv','',1614095564,1614095564),('object_add_dialog_custom_title.product','sv_FI','',1614095564,1614095564),('object_add_dialog_custom_title.product','th','',1614095564,1614095564),('object_add_dialog_custom_title.product','tr','',1614095564,1614095564),('object_add_dialog_custom_title.product','uk','',1614095564,1614095564),('object_add_dialog_custom_title.product','zh_Hans','',1614095564,1614095564),('product','cs','',1614090208,1614090208),('product','de','',1614090208,1614090208),('product','en','',1614090208,1614090208),('product','es','',1614090208,1614090208),('product','fa','',1614090208,1614090208),('product','fr','',1614090208,1614090208),('product','hu','',1614090208,1614090208),('product','it','',1614090208,1614090208),('product','ja','',1614090208,1614090208),('product','nl','',1614090208,1614090208),('product','pl','',1614090208,1614090208),('product','pt_BR','',1614090208,1614090208),('product','ru','',1614090208,1614090208),('product','sk','',1614090208,1614090208),('product','sv','',1614090208,1614090208),('product','sv_FI','',1614090208,1614090208),('product','th','',1614090208,1614090208),('product','tr','',1614090208,1614090208),('product','uk','',1614090208,1614090208),('product','zh_Hans','',1614090208,1614090208),('shirt','cs','',1614096644,1614096644),('shirt','de','',1614096644,1614096644),('shirt','en','',1614096644,1614096644),('shirt','es','',1614096644,1614096644),('shirt','fa','',1614096644,1614096644),('shirt','fr','',1614096644,1614096644),('shirt','hu','',1614096644,1614096644),('shirt','it','',1614096644,1614096644),('shirt','ja','',1614096644,1614096644),('shirt','nl','',1614096644,1614096644),('shirt','pl','',1614096644,1614096644),('shirt','pt_BR','',1614096644,1614096644),('shirt','ru','',1614096644,1614096644),('shirt','sk','',1614096644,1614096644),('shirt','sv','',1614096644,1614096644),('shirt','sv_FI','',1614096644,1614096644),('shirt','th','',1614096644,1614096644),('shirt','tr','',1614096644,1614096644),('shirt','uk','',1614096644,1614096644),('shirt','zh_Hans','',1614096644,1614096644),('suits','cs','',1614096644,1614096644),('suits','de','',1614096644,1614096644),('suits','en','',1614096644,1614096644),('suits','es','',1614096644,1614096644),('suits','fa','',1614096644,1614096644),('suits','fr','',1614096644,1614096644),('suits','hu','',1614096644,1614096644),('suits','it','',1614096644,1614096644),('suits','ja','',1614096644,1614096644),('suits','nl','',1614096644,1614096644),('suits','pl','',1614096644,1614096644),('suits','pt_BR','',1614096644,1614096644),('suits','ru','',1614096644,1614096644),('suits','sk','',1614096644,1614096644),('suits','sv','',1614096644,1614096644),('suits','sv_FI','',1614096644,1614096644),('suits','th','',1614096644,1614096644),('suits','tr','',1614096644,1614096644),('suits','uk','',1614096644,1614096644),('suits','zh_Hans','',1614096644,1614096644),('top','cs','',1614094634,1614094634),('top','de','',1614094634,1614094634),('top','en','',1614094634,1614094634),('top','es','',1614094634,1614094634),('top','fa','',1614094634,1614094634),('top','fr','',1614094634,1614094634),('top','hu','',1614094634,1614094634),('top','it','',1614094634,1614094634),('top','ja','',1614094634,1614094634),('top','nl','',1614094634,1614094634),('top','pl','',1614094634,1614094634),('top','pt_BR','',1614094634,1614094634),('top','ru','',1614094634,1614094634),('top','sk','',1614094634,1614094634),('top','sv','',1614094634,1614094634),('top','sv_FI','',1614094634,1614094634),('top','th','',1614094634,1614094634),('top','tr','',1614094634,1614094634),('top','uk','',1614094634,1614094634),('top','zh_Hans','',1614094634,1614094634),('true','cs','',1614095354,1614095354),('true','de','',1614095354,1614095354),('true','en','',1614095354,1614095354),('true','es','',1614095354,1614095354),('true','fa','',1614095354,1614095354),('true','fr','',1614095354,1614095354),('true','hu','',1614095354,1614095354),('true','it','',1614095354,1614095354),('true','ja','',1614095354,1614095354),('true','nl','',1614095354,1614095354),('true','pl','',1614095354,1614095354),('true','pt_BR','',1614095354,1614095354),('true','ru','',1614095354,1614095354),('true','sk','',1614095354,1614095354),('true','sv','',1614095354,1614095354),('true','sv_FI','',1614095354,1614095354),('true','th','',1614095354,1614095354),('true','tr','',1614095354,1614095354),('true','uk','',1614095354,1614095354),('true','zh_Hans','',1614095354,1614095354),('up','cs','',1614088609,1614088609),('up','de','',1614088609,1614088609),('up','en','',1614088609,1614088609),('up','es','',1614088609,1614088609),('up','fa','',1614088609,1614088609),('up','fr','',1614088609,1614088609),('up','hu','',1614088609,1614088609),('up','it','',1614088609,1614088609),('up','ja','',1614088609,1614088609),('up','nl','',1614088609,1614088609),('up','pl','',1614088609,1614088609),('up','pt_BR','',1614088609,1614088609),('up','ru','',1614088609,1614088609),('up','sk','',1614088609,1614088609),('up','sv','',1614088609,1614088609),('up','sv_FI','',1614088609,1614088609),('up','th','',1614088609,1614088609),('up','tr','',1614088609,1614088609),('up','uk','',1614088609,1614088609),('up','zh_Hans','',1614088609,1614088609),('weeks','cs','',1614090994,1614090994),('weeks','de','',1614090994,1614090994),('weeks','en','',1614090994,1614090994),('weeks','es','',1614090994,1614090994),('weeks','fa','',1614090994,1614090994),('weeks','fr','',1614090994,1614090994),('weeks','hu','',1614090994,1614090994),('weeks','it','',1614090994,1614090994),('weeks','ja','',1614090994,1614090994),('weeks','nl','',1614090994,1614090994),('weeks','pl','',1614090994,1614090994),('weeks','pt_BR','',1614090994,1614090994),('weeks','ru','',1614090994,1614090994),('weeks','sk','',1614090994,1614090994),('weeks','sv','',1614090994,1614090994),('weeks','sv_FI','',1614090994,1614090994),('weeks','th','',1614090994,1614090994),('weeks','tr','',1614090994,1614090994),('weeks','uk','',1614090994,1614090994),('weeks','zh_Hans','',1614090994,1614090994),('years','cs','',1614091067,1614091067),('years','de','',1614091067,1614091067),('years','en','',1614091067,1614091067),('years','es','',1614091067,1614091067),('years','fa','',1614091067,1614091067),('years','fr','',1614091067,1614091067),('years','hu','',1614091067,1614091067),('years','it','',1614091067,1614091067),('years','ja','',1614091067,1614091067),('years','nl','',1614091067,1614091067),('years','pl','',1614091067,1614091067),('years','pt_BR','',1614091067,1614091067),('years','ru','',1614091067,1614091067),('years','sk','',1614091067,1614091067),('years','sv','',1614091067,1614091067),('years','sv_FI','',1614091067,1614091067),('years','th','',1614091067,1614091067),('years','tr','',1614091067,1614091067),('years','uk','',1614091067,1614091067),('years','zh_Hans','',1614091067,1614091067),('Åland Islands','cs','',1614095591,1614095591),('Åland Islands','de','',1614095591,1614095591),('Åland Islands','en','',1614095591,1614095591),('Åland Islands','es','',1614095591,1614095591),('Åland Islands','fa','',1614095591,1614095591),('Åland Islands','fr','',1614095591,1614095591),('Åland Islands','hu','',1614095591,1614095591),('Åland Islands','it','',1614095591,1614095591),('Åland Islands','ja','',1614095591,1614095591),('Åland Islands','nl','',1614095591,1614095591),('Åland Islands','pl','',1614095591,1614095591),('Åland Islands','pt_BR','',1614095591,1614095591),('Åland Islands','ru','',1614095591,1614095591),('Åland Islands','sk','',1614095591,1614095591),('Åland Islands','sv','',1614095591,1614095591),('Åland Islands','sv_FI','',1614095591,1614095591),('Åland Islands','th','',1614095591,1614095591),('Åland Islands','tr','',1614095591,1614095591),('Åland Islands','uk','',1614095591,1614095591),('Åland Islands','zh_Hans','',1614095591,1614095591);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,4,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075383,0,1,1,NULL,NULL),(2,4,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075441,0,1,2,NULL,NULL),(3,5,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075454,0,1,1,NULL,NULL),(4,3,'asset',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(852): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(539): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(373): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(491): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(333): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075781,0,1,1,'2782f681741fd959ab45bcc85f5f08a0844218a0327eabaa5caab18b8e735763e8f4d0e988bdb16d01c8a8149ba527b04b7b53bfd51dd57b478344a8e151029d',NULL),(5,5,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614075792,0,1,2,NULL,NULL),(6,7,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614088764,0,1,1,NULL,NULL),(7,7,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614088837,0,1,2,NULL,NULL),(8,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614095551,0,1,1,NULL,NULL),(9,10,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(821): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->addAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614095770,0,1,1,NULL,NULL),(10,10,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614095777,0,1,2,NULL,NULL),(11,5,'asset',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(852): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(539): Pimcore\\Model\\Asset->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/Asset.php(373): Pimcore\\Model\\Asset->save()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(491): Pimcore\\Model\\Asset::create()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/AssetController.php(368): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAsset()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\AssetController->addAssetCompatibilityAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614095825,0,1,1,'57659802d9a3f37029564f7af17d75fef485f9956e7ab0a261067cd5b9d02b73b280fadae416f026e382a695df98200247ff370b3a20420600837097d2ce1d43',NULL),(12,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614095836,0,1,2,NULL,NULL),(13,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614096322,0,1,3,NULL,NULL),(14,9,'object',2,'','#0 /var/www/html/clothing/vendor/pimcore/pimcore/models/Element/AbstractElement.php(348): Pimcore\\Model\\Version->save()\n#1 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(292): Pimcore\\Model\\Element\\AbstractElement->doSaveVersion()\n#2 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(210): Pimcore\\Model\\DataObject\\Concrete->saveVersion()\n#3 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/AbstractObject.php(659): Pimcore\\Model\\DataObject\\Concrete->update()\n#4 /var/www/html/clothing/vendor/pimcore/pimcore/models/DataObject/Concrete.php(748): Pimcore\\Model\\DataObject\\AbstractObject->save()\n#5 /var/www/html/clothing/vendor/pimcore/pimcore/bundles/AdminBundle/Controller/Admin/DataObject/DataObjectController.php(1260): Pimcore\\Model\\DataObject\\Concrete->save()\n#6 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(158): Pimcore\\Bundle\\AdminBundle\\Controller\\Admin\\DataObject\\DataObjectController->saveAction()\n#7 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/HttpKernel.php(80): Symfony\\Component\\HttpKernel\\HttpKernel->handleRaw()\n#8 /var/www/html/clothing/vendor/symfony/symfony/src/Symfony/Component/HttpKernel/Kernel.php(201): Symfony\\Component\\HttpKernel\\HttpKernel->handle()\n#9 /var/www/html/clothing/web/app.php(35): Symfony\\Component\\HttpKernel\\Kernel->handle()\n#10 {main}',1614096662,0,1,4,NULL,NULL);
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
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
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
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
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
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
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
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_4` AS select `object_query_4`.`oo_id` AS `oo_id`,`object_query_4`.`oo_classId` AS `oo_classId`,`object_query_4`.`oo_className` AS `oo_className`,`object_query_4`.`sku` AS `sku`,`object_query_4`.`name` AS `name`,`object_query_4`.`size` AS `size`,`object_query_4`.`color__rgb` AS `color__rgb`,`object_query_4`.`color__a` AS `color__a`,`object_query_4`.`price` AS `price`,`object_query_4`.`fabric__id` AS `fabric__id`,`object_query_4`.`fabric__type` AS `fabric__type`,`object_query_4`.`discount` AS `discount`,`object_query_4`.`gender` AS `gender`,`object_query_4`.`brand__id` AS `brand__id`,`object_query_4`.`brand__type` AS `brand__type`,`object_query_4`.`productDetail` AS `productDetail`,`object_query_4`.`category__id` AS `category__id`,`object_query_4`.`category__type` AS `category__type`,`object_query_4`.`madeIn` AS `madeIn`,`object_query_4`.`image` AS `image`,`object_query_4`.`warranty__value` AS `warranty__value`,`object_query_4`.`warranty__unit` AS `warranty__unit`,`object_query_4`.`returnable` AS `returnable`,`object_query_4`.`pattern` AS `pattern`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_4` join `objects` on((`objects`.`o_id` = `object_query_4`.`oo_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `object_5`
--

/*!50001 DROP VIEW IF EXISTS `object_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_5` AS select `object_query_5`.`oo_id` AS `oo_id`,`object_query_5`.`oo_classId` AS `oo_classId`,`object_query_5`.`oo_className` AS `oo_className`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount` from (`object_query_5` join `objects` on((`objects`.`o_id` = `object_query_5`.`oo_id`))) */;
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
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_localized_4_bn` AS select `object_query_4`.`oo_id` AS `oo_id`,`object_query_4`.`oo_classId` AS `oo_classId`,`object_query_4`.`oo_className` AS `oo_className`,`object_query_4`.`sku` AS `sku`,`object_query_4`.`name` AS `name`,`object_query_4`.`size` AS `size`,`object_query_4`.`color__rgb` AS `color__rgb`,`object_query_4`.`color__a` AS `color__a`,`object_query_4`.`price` AS `price`,`object_query_4`.`fabric__id` AS `fabric__id`,`object_query_4`.`fabric__type` AS `fabric__type`,`object_query_4`.`discount` AS `discount`,`object_query_4`.`gender` AS `gender`,`object_query_4`.`brand__id` AS `brand__id`,`object_query_4`.`brand__type` AS `brand__type`,`object_query_4`.`productDetail` AS `productDetail`,`object_query_4`.`category__id` AS `category__id`,`object_query_4`.`category__type` AS `category__type`,`object_query_4`.`madeIn` AS `madeIn`,`object_query_4`.`image` AS `image`,`object_query_4`.`warranty__value` AS `warranty__value`,`object_query_4`.`warranty__unit` AS `warranty__unit`,`object_query_4`.`returnable` AS `returnable`,`object_query_4`.`pattern` AS `pattern`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount`,`bn`.`ooo_id` AS `ooo_id`,`bn`.`language` AS `language`,`bn`.`localName` AS `localName`,`bn`.`localDetail` AS `localDetail` from ((`object_query_4` join `objects` on((`objects`.`o_id` = `object_query_4`.`oo_id`))) left join `object_localized_query_4_bn` `bn` on(((0 <> 1) and (`object_query_4`.`oo_id` = `bn`.`ooo_id`)))) */;
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
/*!50013 DEFINER=`susmita`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `object_localized_4_en` AS select `object_query_4`.`oo_id` AS `oo_id`,`object_query_4`.`oo_classId` AS `oo_classId`,`object_query_4`.`oo_className` AS `oo_className`,`object_query_4`.`sku` AS `sku`,`object_query_4`.`name` AS `name`,`object_query_4`.`size` AS `size`,`object_query_4`.`color__rgb` AS `color__rgb`,`object_query_4`.`color__a` AS `color__a`,`object_query_4`.`price` AS `price`,`object_query_4`.`fabric__id` AS `fabric__id`,`object_query_4`.`fabric__type` AS `fabric__type`,`object_query_4`.`discount` AS `discount`,`object_query_4`.`gender` AS `gender`,`object_query_4`.`brand__id` AS `brand__id`,`object_query_4`.`brand__type` AS `brand__type`,`object_query_4`.`productDetail` AS `productDetail`,`object_query_4`.`category__id` AS `category__id`,`object_query_4`.`category__type` AS `category__type`,`object_query_4`.`madeIn` AS `madeIn`,`object_query_4`.`image` AS `image`,`object_query_4`.`warranty__value` AS `warranty__value`,`object_query_4`.`warranty__unit` AS `warranty__unit`,`object_query_4`.`returnable` AS `returnable`,`object_query_4`.`pattern` AS `pattern`,`objects`.`o_id` AS `o_id`,`objects`.`o_parentId` AS `o_parentId`,`objects`.`o_type` AS `o_type`,`objects`.`o_key` AS `o_key`,`objects`.`o_path` AS `o_path`,`objects`.`o_index` AS `o_index`,`objects`.`o_published` AS `o_published`,`objects`.`o_creationDate` AS `o_creationDate`,`objects`.`o_modificationDate` AS `o_modificationDate`,`objects`.`o_userOwner` AS `o_userOwner`,`objects`.`o_userModification` AS `o_userModification`,`objects`.`o_classId` AS `o_classId`,`objects`.`o_className` AS `o_className`,`objects`.`o_childrenSortBy` AS `o_childrenSortBy`,`objects`.`o_childrenSortOrder` AS `o_childrenSortOrder`,`objects`.`o_versionCount` AS `o_versionCount`,`en`.`ooo_id` AS `ooo_id`,`en`.`language` AS `language`,`en`.`localName` AS `localName`,`en`.`localDetail` AS `localDetail` from ((`object_query_4` join `objects` on((`objects`.`o_id` = `object_query_4`.`oo_id`))) left join `object_localized_query_4_en` `en` on(((0 <> 1) and (`object_query_4`.`oo_id` = `en`.`ooo_id`)))) */;
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

-- Dump completed on 2021-02-23 21:45:13
