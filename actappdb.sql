-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: mankindnewdb
-- ------------------------------------------------------
-- Server version	8.0.42

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

--
-- Table structure for table `admin_login_mst`
--

DROP TABLE IF EXISTS `admin_login_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_login_mst` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_login_mst`
--

LOCK TABLES `admin_login_mst` WRITE;
/*!40000 ALTER TABLE `admin_login_mst` DISABLE KEYS */;
INSERT INTO `admin_login_mst` VALUES (1,'test account','admin','admin@852',NULL,'Y'),(2,'Malika Saini','Malika','Malika@987','malika.saini@mankindpharma.com','Y'),(3,'Supriya Sharma','Supriya','Supriya@963','supriya@mankindpharma.com','Y'),(4,'Rohit Dureja','Rohit','Rohit@741','rohit.dureja@mankindpharma.com','Y'),(5,'Riya Manori','Riya','Riya@654','riya.manori@mankindpharma.com','Y'),(6,'Krishankant Dubey','Krishankant','Krishankant@852','krishankant.dubey@mankindpharma.com','Y');
/*!40000 ALTER TABLE `admin_login_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user_login_mst`
--

DROP TABLE IF EXISTS `admin_user_login_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_user_login_mst` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `empcode` int DEFAULT NULL,
  `name` varchar(33) DEFAULT NULL,
  `password` varchar(6) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user_login_mst`
--

LOCK TABLES `admin_user_login_mst` WRITE;
/*!40000 ALTER TABLE `admin_user_login_mst` DISABLE KEYS */;
INSERT INTO `admin_user_login_mst` VALUES (1,10028626,'PALASH CHANDRA PAUL','100PAL','Y'),(2,10025356,'ARUN KUMAR SINGH','100ARU','Y'),(9,10025579,'ASHISH CHAURASIA','100ASH','Y'),(24,10028234,'NEETAN YADAV','100NEE','Y'),(41,10045533,'ARUN KUMAR','100ARU','Y'),(56,10029170,'ABHISHEK MISHRA','100ABH','Y'),(67,10025527,'VIVEK BHATNAGAR','100VIV','Y'),(68,10028804,'SACHIN KUMAR','100SAC','Y'),(84,0,'ANIL KUMAR','100ANI','Y'),(98,10028230,'SHATADRU PAUL','100SHA','Y'),(119,10028621,'TIRTHASIS BANERJEE','100TIR','Y'),(139,10028247,'ATUL ALTI','100ATU','Y'),(140,10028239,'RISHABH SHRINET','100RIS','Y'),(155,10028237,'YESHWANT RAGHUNATH GHORBAND','100YES','Y'),(170,10025357,'KETAN RATHOD','100KET','Y'),(171,10028625,'RAUNAK JITENDRA LOYA','100RAU','Y'),(197,10028624,'JIGNESH R JHAVERI','100JIG','Y'),(218,10002580,'PRAMOD MANAGOLI','100PRA','Y'),(219,10041037,'PRABHAT KUMAR','100PRA','Y'),(220,10032435,'MANJUNATHA N','100MAN','Y'),(237,10028317,'SAMPARA MARKANDEYULU','100SAM','Y'),(258,10028253,'PATTABIMATHIVANAN SHANMUGAVADIVEL','100PAT','Y'),(259,10031329,'DIVAKAR V','100DIV','Y'),(274,10028983,'ANAND C','100ANA','Y'),(275,10051710,'Arvind Kumar Verma ','100ARV','Y'),(10000,10000000,'TO BE FILLED','100TO ','Y'),(10001,10002149,'SUSHIL KUMAR SAW','100SUS','Y');
/*!40000 ALTER TABLE `admin_user_login_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_version_mst`
--

DROP TABLE IF EXISTS `app_version_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version_mst` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_version_mst`
--

LOCK TABLES `app_version_mst` WRITE;
/*!40000 ALTER TABLE `app_version_mst` DISABLE KEYS */;
INSERT INTO `app_version_mst` VALUES (1,'1.0','2023-09-15 12:29:38');
/*!40000 ALTER TABLE `app_version_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basic_mst`
--

DROP TABLE IF EXISTS `basic_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basic_mst` (
  `basic_id` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `identifier_code` int NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`basic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basic_mst`
--

LOCK TABLES `basic_mst` WRITE;
/*!40000 ALTER TABLE `basic_mst` DISABLE KEYS */;
INSERT INTO `basic_mst` VALUES (1,3,'AMLOKIND-10',1,'Y'),(2,3,'AMLOKIND-2.5',1,'Y'),(3,3,'AMLOKIND-5',1,'Y'),(4,3,'AMLOKIND-AT',1,'Y'),(5,3,'AMLOKIND-H',1,'Y'),(6,3,'AMLOKIND-L',1,'Y'),(7,3,'CEFAKIND-250',1,'N'),(8,3,'CEFAKIND-500',1,'N'),(9,3,'LIPIKIND-10',1,'Y'),(10,3,'LIPIKIND-20',1,'Y'),(11,3,'LIPIKIND-40',1,'Y'),(12,3,'LIPIKIND-AS',1,'Y'),(13,3,'LIPIKIND-AS 20',1,'Y'),(14,3,'LIPIKIND-F',1,'Y'),(15,3,'LIPIKIND-PLUS',1,'Y'),(28,3,'LIPIKIND-PLUS-20',1,'Y'),(29,3,'LIPIKIND-CV 10 CAPSULES',1,'Y'),(30,3,'LIPIKIND-CV 20 CAPSULES',1,'Y'),(31,3,'MOXIKIND-CV 375',1,'N'),(32,3,'MOXIKIND-CV 625',1,'N'),(33,3,'NUROKIND-LC',1,'N'),(34,3,'NUROKIND-OD',1,'N'),(35,3,'RABEKIND-20',1,'N'),(36,3,'RABEKIND-40',1,'N'),(37,3,'RABEKIND-DSR',1,'N'),(38,3,'RABEKIND-PLUS',1,'N'),(39,3,'TELMIKIND-20',1,'Y'),(40,3,'TELMIKIND-40',1,'Y'),(41,3,'TELMIKIND-80',1,'Y'),(42,3,'TELMIKIND-AM',1,'Y'),(43,3,'TELMIKIND-AM 80 TABLETS',1,'Y'),(44,3,'TELMIKIND-AM BETA 50',1,'Y'),(45,3,'TELMIKIND-AMH',1,'Y'),(46,3,'TELMIKIND-AMH 80',1,'Y'),(47,3,'TELMIKIND-BETA 25',1,'Y'),(48,3,'TELMIKIND-BETA 50',1,'Y'),(49,3,'TELMIKIND-H',1,'Y'),(50,3,'TELMIKIND-H 80',1,'Y'),(51,3,'TELMIKIND-MCT 25',1,'Y'),(52,3,'TELMIKIND-MCT 50',1,'Y'),(53,3,'TELMIKIND-TRIO 6.25 TABLETS',1,'Y'),(54,3,'TELMIKIND-TRIO 12.5 TABLETS',1,'Y'),(55,3,'VONALONG-10',1,'N'),(56,3,'VONALONG-20',1,'N');
/*!40000 ALTER TABLE `basic_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_report_img_mst`
--

DROP TABLE IF EXISTS `camp_report_img_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_report_img_mst` (
  `crimgid` int NOT NULL AUTO_INCREMENT,
  `crid` int NOT NULL,
  `imgpath` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `feedback` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subcat_id` int DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`crimgid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_report_img_mst`
--

LOCK TABLES `camp_report_img_mst` WRITE;
/*!40000 ALTER TABLE `camp_report_img_mst` DISABLE KEYS */;
INSERT INTO `camp_report_img_mst` VALUES (1,1,'17491294851580.7615610937212278pexels-photo-2379004.jpeg',NULL,NULL,'Y','2025-06-05 18:48:05',2,'2025-06-05 18:48:05',NULL),(3,6,'17496410173170.48126513859511433image_1.jpg',NULL,NULL,'Y','2025-06-11 16:53:38',3,'2025-06-11 16:53:38',NULL),(5,7,'17496416708380.020179485591189872image_1.jpg',NULL,NULL,'N','2025-06-11 17:04:30',3,'2025-06-14 15:47:59',NULL),(8,7,'17497171902210.09591074970751179image_1.jpg',NULL,NULL,'N','2025-06-12 14:03:10',3,'2025-06-14 15:47:59',NULL),(10,10,'17498983767010.18830859626872698image_1.jpg',NULL,NULL,'N','2025-06-14 16:22:56',3,'2025-06-14 16:24:26',NULL),(12,11,'17498988813200.5413651595418831image_1.jpg',NULL,NULL,'N','2025-06-14 16:31:21',3,'2025-06-16 14:32:13',NULL),(13,12,'17499076534860.3058872584539998image_1.jpg',NULL,NULL,'N','2025-06-14 18:57:33',3,'2025-06-14 19:02:20',NULL),(14,15,'17500646192140.3175476608767198image_1.jpg',NULL,NULL,'N','2025-06-16 14:33:40',3,'2025-06-16 14:50:40',NULL),(15,16,'17500652873050.8545352467974174image_1.jpg',NULL,NULL,'N','2025-06-16 14:44:48',3,'2025-06-16 14:50:38',NULL),(16,21,'17500712974920.18256596938273262image_1.jpg',NULL,NULL,'N','2025-06-16 16:24:59',3,'2025-06-16 17:19:03',NULL),(17,22,'17500717641340.7613557640643387image_1.jpg',NULL,NULL,'N','2025-06-16 16:32:45',3,'2025-06-16 17:19:01',NULL),(18,24,'17500795555330.9912353863421999image_1.jpg',NULL,NULL,'Y','2025-06-16 18:42:36',3,'2025-06-16 18:42:36',NULL),(19,24,'17500795560950.041714749603313006image_2.jpg',NULL,NULL,'Y','2025-06-16 18:42:36',3,'2025-06-16 18:42:36',NULL),(20,25,'17500796215920.2824250280931673image_1.jpg',NULL,NULL,'Y','2025-06-16 18:43:42',3,'2025-06-16 18:43:42',NULL),(21,25,'17500796220530.7989177274555133image_2.jpg',NULL,NULL,'Y','2025-06-16 18:43:42',3,'2025-06-16 18:43:42',NULL),(22,27,'17502245993700.5334654151052434image_1.jpg',NULL,NULL,'Y','2025-06-18 11:00:00',3,'2025-06-18 11:00:00',NULL),(23,28,'17502246568560.4066210969341417image_1.jpg',NULL,NULL,'Y','2025-06-18 11:00:57',3,'2025-06-18 11:00:57',NULL),(24,30,'17502249278450.0456127627353653image_1.jpg',NULL,NULL,'Y','2025-06-18 11:05:32',3,'2025-06-18 11:05:32',NULL),(25,30,'17502249322900.24510529071909648image_2.jpg',NULL,NULL,'Y','2025-06-18 11:05:32',3,'2025-06-18 11:05:32',NULL),(26,32,'17502250023290.9376103799124766image_1.jpg',NULL,NULL,'Y','2025-06-18 11:06:42',3,'2025-06-18 11:06:42',NULL),(27,33,'17502250465580.23612750588763465image_1.jpg',NULL,NULL,'Y','2025-06-18 11:07:27',3,'2025-06-18 11:07:27',NULL),(28,50,'17506815404890.09235372644754136image_1.jpg',NULL,NULL,'N','2025-06-23 17:55:40',3,'2025-06-23 19:19:53',NULL),(29,72,'17507472263910.8478935495583477image_1.jpg',NULL,NULL,'N','2025-06-24 12:10:26',3,'2025-06-24 12:10:51',NULL),(30,75,'17507473222610.36591659724009484image_1.jpg',NULL,NULL,'N','2025-06-24 12:12:02',3,'2025-06-24 12:18:20',NULL),(31,78,'17507492645600.22012871707264137image_1.jpg',NULL,NULL,'Y','2025-06-24 12:44:25',3,'2025-06-24 12:44:25',NULL),(32,87,'17510133587140.7443008456744535image_1.jpg',NULL,NULL,'N','2025-06-27 14:05:58',3,'2025-07-30 12:02:17',NULL),(33,108,'17538709246630.3080788831717334image_1.jpg',NULL,NULL,'Y','2025-07-30 15:52:04',3,'2025-07-30 15:52:04',NULL),(34,109,'17541192742850.45506496814279696image_1.jpg',NULL,NULL,'N','2025-08-02 12:51:14',3,'2025-08-02 14:31:31',NULL),(35,110,'17541195517690.7487139662458437image_1.jpg',NULL,NULL,'N','2025-08-02 12:55:52',3,'2025-08-02 14:31:29',NULL),(37,112,'17541255074230.2701778771310497image_1.jpg',NULL,NULL,'Y','2025-08-02 14:35:07',3,'2025-08-02 14:35:07',NULL),(38,113,'17541256627570.9599816661970624image_1.jpg',NULL,NULL,'Y','2025-08-02 14:37:42',3,'2025-08-02 14:37:42',NULL),(39,114,'17541264449190.10221341286435726image_1.jpg',NULL,NULL,'Y','2025-08-02 14:50:45',3,'2025-08-02 14:50:45',NULL);
/*!40000 ALTER TABLE `camp_report_img_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camp_report_mst`
--

DROP TABLE IF EXISTS `camp_report_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camp_report_mst` (
  `crid` int NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_empcode` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `subcat_id` int NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`crid`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camp_report_mst`
--

LOCK TABLES `camp_report_mst` WRITE;
/*!40000 ALTER TABLE `camp_report_mst` DISABLE KEYS */;
INSERT INTO `camp_report_mst` VALUES (1,'ak kumar','H234',NULL,1,1,'2025-06-05 13:46:19',1,'2025-06-06 10:29:16','Y'),(2,'ak kumar','H234',NULL,1,3,'2025-06-05 13:47:26',1,NULL,'Y'),(3,'ak kumar','H234',NULL,1,3,'2025-06-05 13:51:37',1,NULL,'Y'),(4,'a','H',NULL,1,3,'2025-06-05 13:54:04',1,'2025-06-09 17:44:45','N'),(6,'Rajeev Sharma1','Abc123',NULL,3,1,'2025-06-11 16:28:13',3,'2025-06-12 13:41:10','Y'),(7,'Mohit Gupta2','Bca23ewbdbd',NULL,3,1,'2025-06-11 17:01:19',3,'2025-06-14 15:47:59','N'),(8,'Ramesh Kumar','Abc123',NULL,3,3,'2025-06-12 19:10:47',3,NULL,'Y'),(9,'Rohit','Wfshh12',NULL,3,1,'2025-06-14 15:54:56',3,'2025-06-14 16:01:54','N'),(10,'Rohit','Wbdjd',NULL,3,1,'2025-06-14 16:02:03',3,'2025-06-14 16:24:26','N'),(11,'Lalit','Lat12',NULL,3,1,'2025-06-14 16:24:38',3,'2025-06-16 14:32:13','N'),(12,'Rajat','Hdhwj11',NULL,3,1,'2025-06-14 18:52:14',3,'2025-06-14 19:02:20','N'),(13,'Raj','Manl43 ',NULL,3,1,'2025-06-16 10:49:28',3,'2025-06-16 11:13:50','N'),(14,'Ajay','124',NULL,3,1,'2025-06-16 14:30:34',3,'2025-06-16 14:32:10','N'),(15,'Ajay','1334',NULL,3,1,'2025-06-16 14:32:31',3,'2025-06-16 14:50:40','N'),(16,'Hh','Ff',NULL,3,1,'2025-06-16 14:42:26',3,'2025-06-16 14:50:38','N'),(17,'Rajat','Bdbdbdn',NULL,3,1,'2025-06-16 14:50:22',3,'2025-06-16 14:50:35','N'),(18,'Karan ','Was123',NULL,3,1,'2025-06-16 16:19:14',3,'2025-06-16 16:20:24','N'),(19,'Gh','Fh',NULL,3,1,'2025-06-16 16:20:41',3,'2025-06-16 17:19:06','N'),(20,'G','G',NULL,3,2,'2025-06-16 16:21:08',3,'2025-06-16 17:19:11','N'),(21,'Gh','Gh',NULL,3,1,'2025-06-16 16:23:23',3,'2025-06-16 17:19:03','N'),(22,'Gh','Gh',NULL,3,1,'2025-06-16 16:31:57',3,'2025-06-16 17:19:01','N'),(23,'Raman','Bdbsj12',NULL,3,1,'2025-06-16 17:16:50',3,'2025-06-16 17:18:58','N'),(24,'Dr. Anmol','72829',NULL,3,1,'2025-06-16 18:41:43',3,NULL,'Y'),(25,'Dr. Kajal ','622929',NULL,3,2,'2025-06-16 18:43:03',3,NULL,'Y'),(26,'Dr.Jayant','62828',NULL,3,3,'2025-06-16 18:44:03',3,NULL,'Y'),(27,'Dr.Smita','Ywiwi',NULL,3,1,'2025-06-18 10:59:17',3,NULL,'Y'),(28,'Dr.Smita','Hejebe',NULL,3,2,'2025-06-18 11:00:23',3,NULL,'Y'),(29,'Dr.Smita','Ywiwow',NULL,3,3,'2025-06-18 11:01:20',3,NULL,'Y'),(30,'Turni','171717',NULL,3,1,'2025-06-18 11:02:17',3,NULL,'Y'),(31,'Turni','17171',NULL,3,3,'2025-06-18 11:05:51',3,NULL,'Y'),(32,'Smita','Tqyqi',NULL,3,1,'2025-06-18 11:06:09',3,NULL,'Y'),(33,'Smita','Eryi',NULL,3,2,'2025-06-18 11:06:58',3,NULL,'Y'),(34,'Riya','Etui',NULL,3,3,'2025-06-18 11:07:41',3,NULL,'Y'),(35,'Sam','12345',NULL,3,3,'2025-06-18 11:19:26',3,NULL,'Y'),(36,'Sam','12345',NULL,3,3,'2025-06-18 11:20:17',3,NULL,'Y'),(37,'Sneha','Yrjbg',NULL,3,1,'2025-06-19 17:20:05',3,NULL,'Y'),(38,'Sneha','Yrjbg',NULL,3,1,'2025-06-19 17:20:17',3,NULL,'Y'),(39,'Hina','Etoo',NULL,3,2,'2025-06-19 17:20:41',3,NULL,'Y'),(40,'Sam','12344',NULL,3,3,'2025-06-19 17:28:26',3,NULL,'Y'),(41,'HJsjs','Asjsjjs',NULL,3,3,'2025-06-19 17:28:59',3,'2025-06-20 15:54:45','N'),(42,'HJsjs','Asjsjjs',NULL,3,3,'2025-06-19 17:30:56',3,'2025-06-20 15:54:43','N'),(43,'Tyuu','Ghhj',NULL,3,1,'2025-06-20 14:11:09',3,'2025-06-23 19:08:45','N'),(44,'Yui','Tyi',NULL,3,1,'2025-06-20 15:42:41',3,'2025-06-23 19:08:42','N'),(45,'Wo','Rp',NULL,3,2,'2025-06-20 15:45:26',3,'2025-06-24 09:50:49','N'),(46,'Ri','Ri',NULL,3,3,'2025-06-20 15:51:01',3,'2025-06-20 15:54:40','N'),(47,'Rohit kumar','Abvcdvb133',NULL,3,2,'2025-06-23 16:56:41',3,'2025-06-23 17:00:00','N'),(48,'Rohit kumar','Abcehhe123',NULL,3,3,'2025-06-23 17:04:24',3,NULL,'Y'),(49,'Ram','Dgdhs',NULL,3,3,'2025-06-23 17:38:50',3,NULL,'Y'),(50,'Raj N','Bdbd',NULL,3,1,'2025-06-23 17:54:24',3,'2025-06-23 19:19:53','N'),(51,'Test','WA123',NULL,3,1,'2025-06-23 18:47:12',3,'2025-06-23 19:08:38','N'),(52,'Gg','Ag',NULL,3,1,'2025-06-23 18:49:43',3,'2025-06-23 19:08:35','N'),(53,'Ha','Wa',NULL,3,3,'2025-06-23 18:50:14',3,'2025-06-24 12:18:07','N'),(54,'Gga','Gga',NULL,3,3,'2025-06-23 18:52:20',3,'2025-06-24 12:18:05','N'),(55,'Aja','Wa13',NULL,3,1,'2025-06-23 18:57:19',3,'2025-06-23 19:08:32','N'),(56,'Waj','Gh',NULL,3,1,'2025-06-23 18:58:33',3,'2025-06-23 19:08:29','N'),(57,'Bsbs','Bdbd',NULL,3,1,'2025-06-23 19:07:00',3,'2025-06-23 19:08:27','N'),(58,'Rajat',' Xbd',NULL,3,2,'2025-06-23 19:11:39',3,'2025-06-24 12:10:54','N'),(59,'Rajat singh','Gsbsbns',NULL,3,1,'2025-06-23 19:15:05',3,'2025-06-23 19:18:04','N'),(60,'Ajay','Wa12',NULL,3,1,'2025-06-23 19:15:08',3,'2025-06-23 19:19:50','N'),(61,'Gah','Ja',NULL,3,2,'2025-06-23 19:15:57',3,'2025-06-24 09:50:44','N'),(62,'Rajat','Gdbd',NULL,3,1,'2025-06-23 19:18:15',3,'2025-06-23 19:18:33','N'),(63,'Rajat nbdb','Bdbnd',NULL,3,1,'2025-06-23 19:18:48',3,'2025-06-23 19:19:48','N'),(64,'Mohit G','Gdbdn',NULL,3,1,'2025-06-23 19:20:02',3,'2025-06-23 19:24:00','N'),(65,'Mohit G','Bdbdb',NULL,3,1,'2025-06-23 19:24:09',3,'2025-06-23 19:27:45','N'),(66,'Mohit G','Bdb',NULL,3,1,'2025-06-23 19:27:55',3,'2025-08-02 14:34:10','N'),(67,'Ajay','Karn',NULL,3,1,'2025-06-23 19:49:42',3,'2025-08-02 14:34:04','N'),(68,'Hjj','Yh',NULL,3,1,'2025-06-23 19:51:06',3,'2025-06-27 13:52:31','N'),(69,'Gh','Yy',NULL,3,2,'2025-06-23 19:51:46',3,'2025-06-24 09:50:40','N'),(70,'Gsvbs','Gdbdb',NULL,3,1,'2025-06-23 20:08:40',3,'2025-08-02 14:33:56','N'),(71,'Ajay','Wa123',NULL,3,1,'2025-06-23 20:49:44',3,'2025-08-02 14:34:02','N'),(72,'Rohit p','Bdndjd',NULL,3,2,'2025-06-24 09:51:01',3,'2025-06-24 12:10:51','N'),(73,'Karan','T12',NULL,3,1,'2025-06-24 10:44:58',3,'2025-08-02 14:33:54','N'),(74,'Karn ','Wa12',NULL,3,1,'2025-06-24 10:46:51',3,'2025-08-02 14:33:51','N'),(75,'Mohit P','Nskkd',NULL,3,2,'2025-06-24 12:11:05',3,'2025-06-24 12:18:20','N'),(76,'Raj mi','Gdbdb',NULL,3,1,'2025-06-24 12:16:44',3,'2025-06-24 12:17:01','N'),(77,'Gsg','Gdbd',NULL,3,3,'2025-06-24 12:17:18',3,'2025-06-24 12:18:03','N'),(78,'Diksha','Tuio',NULL,3,1,'2025-06-24 12:38:26',3,NULL,'Y'),(79,'Diksha','Eryio',NULL,3,3,'2025-06-24 12:45:09',3,NULL,'Y'),(80,'Diksha ','Etyio',NULL,3,2,'2025-06-24 12:47:05',3,NULL,'Y'),(81,'Sjkaka','Ajakak',NULL,3,1,'2025-06-24 15:08:43',3,'2025-06-27 13:52:26','N'),(82,'Sjkaka','Ajakak',NULL,3,1,'2025-06-24 15:09:53',3,'2025-06-27 13:52:23','N'),(83,'Zxxx','Zzxx',NULL,3,1,'2025-06-24 15:10:40',3,'2025-06-27 13:52:19','N'),(84,'Sfd','Ssd',NULL,3,3,'2025-06-24 15:11:23',3,'2025-06-27 13:59:09','N'),(85,'Rohan ','Bdbdn',NULL,3,1,'2025-06-27 13:52:41',3,'2025-06-27 13:55:47','N'),(86,'Raj ','Bdbd',NULL,3,3,'2025-06-27 13:58:07',3,'2025-06-27 13:59:06','N'),(87,'Rohit sharma','Abc123',NULL,3,2,'2025-06-27 14:04:46',3,'2025-07-30 12:02:17','N'),(88,'Raj mohan','Bdbnd',NULL,3,3,'2025-06-27 14:07:12',3,NULL,'Y'),(89,'Turni','Fhj',NULL,3,3,'2025-06-30 10:11:31',3,NULL,'Y'),(90,'Thh','Ghj',NULL,3,1,'2025-06-30 10:11:46',3,'2025-07-17 11:33:33','N'),(91,'Pineet','1234',NULL,3,3,'2025-07-02 12:59:28',3,'2025-07-17 12:06:04','N'),(92,'Rrr','123',NULL,3,2,'2025-07-02 13:03:06',3,'2025-07-17 11:34:47','N'),(93,'Turni','1234',NULL,3,2,'2025-07-07 21:12:13',3,'2025-07-30 12:02:23','N'),(94,'Rinku','Vsbns',NULL,3,1,'2025-07-17 11:33:48',3,'2025-07-17 11:34:27','N'),(95,'Mohan lal','Gdhdb',NULL,3,2,'2025-07-17 11:35:02',3,'2025-07-17 11:37:28','N'),(96,'Raj','Vdbd',NULL,3,3,'2025-07-17 11:37:37',3,'2025-07-17 11:41:01','N'),(97,'Hdh','Bdbr',NULL,3,2,'2025-07-17 11:41:10',3,'2025-07-17 11:41:55','N'),(98,'Amit','Bdbd',NULL,3,2,'2025-07-17 12:04:26',3,'2025-07-17 12:05:56','N'),(99,'Amit','Bdbd',NULL,3,3,'2025-07-17 12:06:21',3,NULL,'Y'),(100,'Turni','1234',NULL,3,2,'2025-07-23 08:45:49',3,'2025-07-30 12:14:36','N'),(101,'Turni','1234',NULL,3,3,'2025-07-23 08:46:28',3,NULL,'Y'),(102,'Pun','13r',NULL,3,2,'2025-07-25 15:55:16',3,'2025-07-30 12:02:14','N'),(103,'Tun','123',NULL,3,3,'2025-07-25 16:05:37',3,'2025-08-02 14:36:33','N'),(104,'Ajay Singh','123466',NULL,3,2,'2025-07-30 12:02:40',3,'2025-07-30 12:07:44','N'),(105,'Ajay','Hhr',NULL,3,2,'2025-07-30 12:07:54',3,'2025-07-30 14:57:16','N'),(106,'Ajay','Bdbd',NULL,3,2,'2025-07-30 14:57:24',3,'2025-07-30 15:10:48','N'),(107,'Ajay','Bdbd',NULL,3,2,'2025-07-30 15:11:14',3,'2025-07-30 15:27:30','N'),(108,'Ajay ','Hd',NULL,3,2,'2025-07-30 15:27:38',3,NULL,'Y'),(109,'Demo BP','1234',NULL,3,1,'2025-08-02 12:49:45',3,'2025-08-02 14:31:31','N'),(110,'Demo BP2','1234',NULL,3,1,'2025-08-02 12:54:09',3,'2025-08-02 14:31:29','N'),(111,'Mohan','Bdb',NULL,3,3,'2025-08-02 13:45:00',3,'2025-08-02 14:36:30','N'),(112,'Ramesh','W1234',NULL,3,1,'2025-08-02 14:31:54',3,NULL,'Y'),(113,'Ritesh','W1234',NULL,3,3,'2025-08-02 14:36:42',3,NULL,'Y'),(114,'Demo ECG','1342',NULL,3,2,'2025-08-02 14:48:57',3,NULL,'Y'),(115,'Demo Lipid','1245',NULL,3,3,'2025-08-02 14:51:10',3,NULL,'Y'),(116,'1','1',NULL,3,1,'2025-08-04 13:05:35',3,NULL,'Y'),(117,'Turni','1234',NULL,3,3,'2025-08-07 15:48:24',3,NULL,'Y'),(118,'Sneha','Wuahb',NULL,3,3,'2025-08-07 15:59:06',3,NULL,'Y');
/*!40000 ALTER TABLE `camp_report_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_mst`
--

DROP TABLE IF EXISTS `category_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_mst` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `categeory_icon` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `display_order` int NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_mst`
--

LOCK TABLES `category_mst` WRITE;
/*!40000 ALTER TABLE `category_mst` DISABLE KEYS */;
INSERT INTO `category_mst` VALUES (1,'Poster','null',1,'Y','2023-08-31 13:14:25'),(2,'Camp','null',2,'Y','2023-08-31 13:15:49'),(3,'Dashboard','null',3,'Y','2023-08-31 13:17:00');
/*!40000 ALTER TABLE `category_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `state_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_relates_to_state` (`state_id`),
  CONSTRAINT `city_relates_to_state` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1509 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Kolhapur',21),(2,'Port Blair',1),(3,'Adilabad',2),(4,'Adoni',2),(5,'Amadalavalasa',2),(6,'Amalapuram',2),(7,'Anakapalle',2),(8,'Anantapur',2),(9,'Badepalle',2),(10,'Banganapalle',2),(11,'Bapatla',2),(12,'Bellampalle',2),(13,'Bethamcherla',2),(14,'Bhadrachalam',2),(15,'Bhainsa',2),(16,'Bheemunipatnam',2),(17,'Bhimavaram',2),(18,'Bhongir',2),(19,'Bobbili',2),(20,'Bodhan',2),(21,'Chilakaluripet',2),(22,'Chirala',2),(23,'Chittoor',2),(24,'Cuddapah',2),(25,'Devarakonda',2),(26,'Dharmavaram',2),(27,'Eluru',2),(28,'Farooqnagar',2),(29,'Gadwal',2),(30,'Gooty',2),(31,'Gudivada',2),(32,'Gudur',2),(33,'Guntakal',2),(34,'Guntur',2),(35,'Hanuman Junction',2),(36,'Hindupur',2),(37,'Hyderabad',32),(38,'Ichchapuram',2),(39,'Jaggaiahpet',2),(40,'Jagtial',2),(41,'Jammalamadugu',2),(42,'Jangaon',2),(43,'Kadapa',2),(44,'Kadiri',2),(45,'Kagaznagar',2),(46,'Kakinada',2),(47,'Kalyandurg',2),(48,'Kamareddy',2),(49,'Kandukur',2),(50,'Karimnagar',2),(51,'Kavali',2),(52,'Khammam',2),(53,'Koratla',2),(54,'Kothagudem',2),(55,'Kothapeta',2),(56,'Kovvur',2),(57,'Kurnool',2),(58,'Kyathampalle',2),(59,'Macherla',2),(60,'Machilipatnam',2),(61,'Madanapalle',2),(62,'Mahbubnagar',2),(63,'Mancherial',2),(64,'Mandamarri',2),(65,'Mandapeta',2),(66,'Manuguru',2),(67,'Markapur',2),(68,'Medak',2),(69,'Miryalaguda',2),(70,'Mogalthur',2),(71,'Nagari',2),(72,'Nagarkurnool',2),(73,'Nandyal',2),(74,'Narasapur',2),(75,'Narasaraopet',2),(76,'Narayanpet',2),(77,'Narsipatnam',2),(78,'Nellore',2),(79,'Nidadavole',2),(80,'Nirmal',2),(81,'Nizamabad',2),(82,'Nuzvid',2),(83,'Ongole',2),(84,'Palacole',2),(85,'Palasa Kasibugga',2),(86,'Palwancha',2),(87,'Parvathipuram',2),(88,'Pedana',2),(89,'Peddapuram',2),(90,'Pithapuram',2),(91,'Pondur',2),(92,'Ponnur',2),(93,'Proddatur',2),(94,'Punganur',2),(95,'Puttur',2),(96,'Rajahmundry',2),(97,'Rajam',2),(98,'Ramachandrapuram',2),(99,'Ramagundam',2),(100,'Rayachoti',2),(101,'Rayadurg',2),(102,'Renigunta',2),(103,'Repalle',2),(104,'Sadasivpet',2),(105,'Salur',2),(106,'Samalkot',2),(107,'Sangareddy',2),(108,'Sattenapalle',2),(109,'Siddipet',2),(110,'Singapur',2),(111,'Sircilla',2),(112,'Srikakulam',2),(113,'Srikalahasti',2),(115,'Suryapet',2),(116,'Tadepalligudem',2),(117,'Tadpatri',2),(118,'Tandur',2),(119,'Tanuku',2),(120,'Tenali',2),(121,'Tirupati',2),(122,'Tuni',2),(123,'Uravakonda',2),(124,'Venkatagiri',2),(125,'Vicarabad',2),(126,'Vijayawada',2),(127,'Vinukonda',2),(128,'Visakhapatnam',2),(129,'Vizianagaram',2),(130,'Wanaparthy',2),(131,'Warangal',2),(132,'Yellandu',2),(133,'Yemmiganur',2),(134,'Yerraguntla',2),(135,'Zahirabad',2),(136,'Rajampet',2),(137,'Along',3),(138,'Bomdila',3),(139,'Itanagar',3),(140,'Naharlagun',3),(141,'Pasighat',3),(142,'Abhayapuri',4),(143,'Amguri',4),(144,'Anandnagaar',4),(145,'Barpeta',4),(146,'Barpeta Road',4),(147,'Bilasipara',4),(148,'Bongaigaon',4),(149,'Dhekiajuli',4),(150,'Dhubri',4),(151,'Dibrugarh',4),(152,'Digboi',4),(153,'Diphu',4),(154,'Dispur',4),(156,'Gauripur',4),(157,'Goalpara',4),(158,'Golaghat',4),(159,'Guwahati',4),(160,'Haflong',4),(161,'Hailakandi',4),(162,'Hojai',4),(163,'Jorhat',4),(164,'Karimganj',4),(165,'Kokrajhar',4),(166,'Lanka',4),(167,'Lumding',4),(168,'Mangaldoi',4),(169,'Mankachar',4),(170,'Margherita',4),(171,'Mariani',4),(172,'Marigaon',4),(173,'Nagaon',4),(174,'Nalbari',4),(175,'North Lakhimpur',4),(176,'Rangia',4),(177,'Sibsagar',4),(178,'Silapathar',4),(179,'Silchar',4),(180,'Tezpur',4),(181,'Tinsukia',4),(182,'Amarpur',5),(183,'Araria',5),(184,'Areraj',5),(185,'Arrah',5),(186,'Asarganj',5),(187,'Aurangabad',5),(188,'Bagaha',5),(189,'Bahadurganj',5),(190,'Bairgania',5),(191,'Bakhtiarpur',5),(192,'Banka',5),(193,'Banmankhi Bazar',5),(194,'Barahiya',5),(195,'Barauli',5),(196,'Barbigha',5),(197,'Barh',5),(198,'Begusarai',5),(199,'Behea',5),(200,'Bettiah',5),(201,'Bhabua',5),(202,'Bhagalpur',5),(203,'Bihar Sharif',5),(204,'Bikramganj',5),(205,'Bodh Gaya',5),(206,'Buxar',5),(207,'Chandan Bara',5),(208,'Chanpatia',5),(209,'Chhapra',5),(210,'Colgong',5),(211,'Dalsinghsarai',5),(212,'Darbhanga',5),(213,'Daudnagar',5),(214,'Dehri-on-Sone',5),(215,'Dhaka',5),(216,'Dighwara',5),(217,'Dumraon',5),(218,'Fatwah',5),(219,'Forbesganj',5),(220,'Gaya',5),(221,'Gogri Jamalpur',5),(222,'Gopalganj',5),(223,'Hajipur',5),(224,'Hilsa',5),(225,'Hisua',5),(226,'Islampur',5),(227,'Jagdispur',5),(228,'Jamalpur',5),(229,'Jamui',5),(230,'Jehanabad',5),(231,'Jhajha',5),(232,'Jhanjharpur',5),(233,'Jogabani',5),(234,'Kanti',5),(235,'Katihar',5),(236,'Khagaria',5),(237,'Kharagpur',5),(238,'Kishanganj',5),(239,'Lakhisarai',5),(240,'Lalganj',5),(241,'Madhepura',5),(242,'Madhubani',5),(243,'Maharajganj',5),(244,'Mahnar Bazar',5),(245,'Makhdumpur',5),(246,'Maner',5),(247,'Manihari',5),(248,'Marhaura',5),(249,'Masaurhi',5),(250,'Mirganj',5),(251,'Mokameh',5),(252,'Motihari',5),(253,'Motipur',5),(254,'Munger',5),(255,'Murliganj',5),(256,'Muzaffarpur',5),(257,'Narkatiaganj',5),(258,'Naugachhia',5),(259,'Nawada',5),(260,'Nokha',5),(261,'Patna',5),(262,'Piro',5),(263,'Purnia',5),(264,'Rafiganj',5),(265,'Rajgir',5),(266,'Ramnagar',5),(267,'Raxaul Bazar',5),(268,'Revelganj',5),(269,'Rosera',5),(270,'Saharsa',5),(271,'Samastipur',5),(272,'Sasaram',5),(273,'Sheikhpura',5),(274,'Sheohar',5),(275,'Sherghati',5),(276,'Silao',5),(277,'Sitamarhi',5),(278,'Siwan',5),(279,'Sonepur',5),(280,'Sugauli',5),(281,'Sultanganj',5),(282,'Supaul',5),(283,'Warisaliganj',5),(284,'Ahiwara',7),(285,'Akaltara',7),(286,'Ambagarh Chowki',7),(287,'Ambikapur',7),(288,'Arang',7),(289,'Bade Bacheli',7),(290,'Balod',7),(291,'Baloda Bazar',7),(292,'Bemetra',7),(293,'Bhatapara',7),(294,'Bilaspur',7),(295,'Birgaon',7),(296,'Champa',7),(297,'Chirmiri',7),(298,'Dalli-Rajhara',7),(299,'Dhamtari',7),(300,'Dipka',7),(301,'Dongargarh',7),(302,'Durg-Bhilai Nagar',7),(303,'Gobranawapara',7),(304,'Jagdalpur',7),(305,'Janjgir',7),(306,'Jashpurnagar',7),(307,'Kanker',7),(308,'Kawardha',7),(309,'Kondagaon',7),(310,'Korba',7),(311,'Mahasamund',7),(312,'Mahendragarh',7),(313,'Mungeli',7),(314,'Naila Janjgir',7),(315,'Raigarh',7),(316,'Raipur',7),(317,'Rajnandgaon',7),(318,'Sakti',7),(319,'Tilda Newra',7),(320,'Amli',8),(321,'Silvassa',8),(322,'Daman and Diu',9),(323,'Daman and Diu',9),(324,'Asola',10),(325,'Delhi',10),(326,'Aldona',11),(327,'Curchorem Cacora',11),(328,'Madgaon',11),(329,'Mapusa',11),(330,'Margao',11),(331,'Marmagao',11),(332,'Panaji',11),(333,'Ahmedabad',12),(334,'Amreli',12),(335,'Anand',12),(336,'Ankleshwar',12),(337,'Bharuch',12),(338,'Bhavnagar',12),(339,'Bhuj',12),(340,'Cambay',12),(341,'Dahod',12),(342,'Deesa',12),(344,'Dholka',12),(345,'Gandhinagar',12),(346,'Godhra',12),(347,'Himatnagar',12),(348,'Idar',12),(349,'Jamnagar',12),(350,'Junagadh',12),(351,'Kadi',12),(352,'Kalavad',12),(353,'Kalol',12),(354,'Kapadvanj',12),(355,'Karjan',12),(356,'Keshod',12),(357,'Khambhalia',12),(358,'Khambhat',12),(359,'Kheda',12),(360,'Khedbrahma',12),(361,'Kheralu',12),(362,'Kodinar',12),(363,'Lathi',12),(364,'Limbdi',12),(365,'Lunawada',12),(366,'Mahesana',12),(367,'Mahuva',12),(368,'Manavadar',12),(369,'Mandvi',12),(370,'Mangrol',12),(371,'Mansa',12),(372,'Mehmedabad',12),(373,'Modasa',12),(374,'Morvi',12),(375,'Nadiad',12),(376,'Navsari',12),(377,'Padra',12),(378,'Palanpur',12),(379,'Palitana',12),(380,'Pardi',12),(381,'Patan',12),(382,'Petlad',12),(383,'Porbandar',12),(384,'Radhanpur',12),(385,'Rajkot',12),(386,'Rajpipla',12),(387,'Rajula',12),(388,'Ranavav',12),(389,'Rapar',12),(390,'Salaya',12),(391,'Sanand',12),(392,'Savarkundla',12),(393,'Sidhpur',12),(394,'Sihor',12),(395,'Songadh',12),(396,'Surat',12),(397,'Talaja',12),(398,'Thangadh',12),(399,'Tharad',12),(400,'Umbergaon',12),(401,'Umreth',12),(402,'Una',12),(403,'Unjha',12),(404,'Upleta',12),(405,'Vadnagar',12),(406,'Vadodara',12),(407,'Valsad',12),(408,'Vapi',12),(409,'Vapi',12),(410,'Veraval',12),(411,'Vijapur',12),(412,'Viramgam',12),(413,'Visnagar',12),(414,'Vyara',12),(415,'Wadhwan',12),(416,'Wankaner',12),(417,'Adalaj',12),(418,'Adityana',12),(419,'Alang',12),(420,'Ambaji',12),(421,'Ambaliyasan',12),(422,'Andada',12),(423,'Anjar',12),(424,'Anklav',12),(425,'Antaliya',12),(426,'Arambhada',12),(427,'Atul',12),(428,'Ballabhgarh',13),(429,'Ambala',13),(430,'Ambala',13),(431,'Asankhurd',13),(432,'Assandh',13),(433,'Ateli',13),(434,'Babiyal',13),(435,'Bahadurgarh',13),(436,'Barwala',13),(437,'Bhiwani',13),(438,'Charkhi Dadri',13),(439,'Cheeka',13),(440,'Ellenabad 2',13),(441,'Faridabad',13),(442,'Fatehabad',13),(443,'Ganaur',13),(444,'Gharaunda',13),(445,'Gohana',13),(446,'Gurgaon',13),(447,'Haibat(Yamuna Nagar)',13),(448,'Hansi',13),(449,'Hisar',13),(450,'Hodal',13),(451,'Jhajjar',13),(452,'Jind',13),(453,'Kaithal',13),(454,'Kalan Wali',13),(455,'Kalka',13),(456,'Karnal',13),(457,'Ladwa',13),(458,'Mahendragarh',13),(459,'Mandi Dabwali',13),(460,'Narnaul',13),(461,'Narwana',13),(462,'Palwal',13),(463,'Panchkula',13),(464,'Panipat',13),(465,'Pehowa',13),(466,'Pinjore',13),(467,'Rania',13),(468,'Ratia',13),(469,'Rewari',13),(470,'Rohtak',13),(471,'Safidon',13),(472,'Samalkha',13),(473,'Shahbad',13),(474,'Sirsa',13),(475,'Sohna',13),(476,'Sonipat',13),(477,'Taraori',13),(478,'Thanesar',13),(479,'Tohana',13),(480,'Yamunanagar',13),(481,'Arki',14),(482,'Baddi',14),(483,'Bilaspur',14),(484,'Chamba',14),(485,'Dalhousie',14),(486,'Dharamsala',14),(487,'Hamirpur',14),(488,'Mandi',14),(489,'Nahan',14),(490,'Shimla',14),(491,'Solan',14),(492,'Sundarnagar',14),(493,'Jammu',15),(494,'Achabbal',15),(495,'Akhnoor',15),(496,'Anantnag',15),(497,'Arnia',15),(498,'Awantipora',15),(499,'Bandipore',15),(500,'Baramula',15),(501,'Kathua',15),(502,'Leh',15),(503,'Punch',15),(504,'Rajauri',15),(505,'Sopore',15),(506,'Srinagar',15),(507,'Udhampur',15),(508,'Amlabad',16),(509,'Ara',16),(510,'Barughutu',16),(511,'Bokaro Steel City',16),(512,'Chaibasa',16),(513,'Chakradharpur',16),(514,'Chandrapura',16),(515,'Chatra',16),(516,'Chirkunda',16),(517,'Churi',16),(518,'Daltonganj',16),(519,'Deoghar',16),(520,'Dhanbad',16),(521,'Dumka',16),(522,'Garhwa',16),(523,'Ghatshila',16),(524,'Giridih',16),(525,'Godda',16),(526,'Gomoh',16),(527,'Gumia',16),(528,'Gumla',16),(529,'Hazaribag',16),(530,'Hussainabad',16),(531,'Jamshedpur',16),(532,'Jamtara',16),(533,'Jhumri Tilaiya',16),(534,'Khunti',16),(535,'Lohardaga',16),(536,'Madhupur',16),(537,'Mihijam',16),(538,'Musabani',16),(539,'Pakaur',16),(540,'Patratu',16),(541,'Phusro',16),(542,'Ramngarh',16),(543,'Ranchi',16),(544,'Sahibganj',16),(545,'Saunda',16),(546,'Simdega',16),(547,'Tenu Dam-cum- Kathhara',16),(548,'Arasikere',17),(549,'Bangalore',17),(550,'Belgaum',17),(551,'Bellary',17),(552,'Chamrajnagar',17),(553,'Chikkaballapur',17),(554,'Chintamani',17),(555,'Chitradurga',17),(556,'Gulbarga',17),(557,'Gundlupet',17),(558,'Hassan',17),(559,'Hospet',17),(560,'Hubli',17),(561,'Karkala',17),(562,'Karwar',17),(563,'Kolar',17),(564,'Kota',17),(565,'Lakshmeshwar',17),(566,'Lingsugur',17),(567,'Maddur',17),(568,'Madhugiri',17),(569,'Madikeri',17),(570,'Magadi',17),(571,'Mahalingpur',17),(572,'Malavalli',17),(573,'Malur',17),(574,'Mandya',17),(575,'Mangalore',17),(576,'Manvi',17),(577,'Mudalgi',17),(578,'Mudbidri',17),(579,'Muddebihal',17),(580,'Mudhol',17),(581,'Mulbagal',17),(582,'Mundargi',17),(583,'Mysore',17),(584,'Nanjangud',17),(585,'Pavagada',17),(586,'Puttur',17),(587,'Rabkavi Banhatti',17),(588,'Raichur',17),(589,'Ramanagaram',17),(590,'Ramdurg',17),(591,'Ranibennur',17),(592,'Robertson Pet',17),(593,'Ron',17),(594,'Sadalgi',17),(595,'Sagar',17),(596,'Sakleshpur',17),(597,'Sandur',17),(598,'Sankeshwar',17),(599,'Saundatti-Yellamma',17),(600,'Savanur',17),(601,'Sedam',17),(602,'Shahabad',17),(603,'Shahpur',17),(604,'Shiggaon',17),(605,'Shikapur',17),(606,'Shimoga',17),(607,'Shorapur',17),(608,'Shrirangapattana',17),(609,'Sidlaghatta',17),(610,'Sindgi',17),(611,'Sindhnur',17),(612,'Sira',17),(613,'Sirsi',17),(614,'Siruguppa',17),(615,'Srinivaspur',17),(616,'Talikota',17),(617,'Tarikere',17),(618,'Tekkalakota',17),(619,'Terdal',17),(620,'Tiptur',17),(621,'Tumkur',17),(622,'Udupi',17),(623,'Vijayapura',17),(624,'Wadi',17),(625,'Yadgir',17),(626,'Adoor',18),(627,'Akathiyoor',18),(628,'Alappuzha',18),(629,'Ancharakandy',18),(630,'Aroor',18),(631,'Ashtamichira',18),(632,'Attingal',18),(633,'Avinissery',18),(634,'Chalakudy',18),(635,'Changanassery',18),(636,'Chendamangalam',18),(637,'Chengannur',18),(638,'Cherthala',18),(639,'Cheruthazham',18),(640,'Chittur-Thathamangalam',18),(641,'Chockli',18),(642,'Erattupetta',18),(643,'Guruvayoor',18),(644,'Irinjalakuda',18),(645,'Kadirur',18),(646,'Kalliasseri',18),(647,'Kalpetta',18),(648,'Kanhangad',18),(649,'Kanjikkuzhi',18),(650,'Kannur',18),(651,'Kasaragod',18),(652,'Kayamkulam',18),(653,'Kochi',18),(654,'Kodungallur',18),(655,'Kollam',18),(656,'Koothuparamba',18),(657,'Kothamangalam',18),(658,'Kottayam',18),(659,'Kozhikode',18),(660,'Kunnamkulam',18),(661,'Malappuram',18),(662,'Mattannur',18),(663,'Mavelikkara',18),(664,'Mavoor',18),(665,'Muvattupuzha',18),(666,'Nedumangad',18),(667,'Neyyattinkara',18),(668,'Ottappalam',18),(669,'Palai',18),(670,'Palakkad',18),(671,'Panniyannur',18),(672,'Pappinisseri',18),(673,'Paravoor',18),(674,'Pathanamthitta',18),(675,'Payyannur',18),(676,'Peringathur',18),(677,'Perinthalmanna',18),(678,'Perumbavoor',18),(679,'Ponnani',18),(680,'Punalur',18),(681,'Quilandy',18),(682,'Shoranur',18),(683,'Taliparamba',18),(684,'Thiruvalla',18),(685,'Thiruvananthapuram',18),(686,'Thodupuzha',18),(687,'Thrissur',18),(688,'Tirur',18),(689,'Vadakara',18),(690,'Vaikom',18),(691,'Varkala',18),(692,'Kavaratti',19),(693,'Ashok Nagar',20),(694,'Balaghat',20),(695,'Betul',20),(696,'Bhopal',20),(697,'Burhanpur',20),(698,'Chhatarpur',20),(699,'Dabra',20),(700,'Datia',20),(701,'Dewas',20),(702,'Dhar',20),(703,'Fatehabad',20),(704,'Gwalior',20),(705,'Indore',20),(706,'Itarsi',20),(707,'Jabalpur',20),(708,'Katni',20),(709,'Kotma',20),(710,'Lahar',20),(711,'Lundi',20),(712,'Maharajpur',20),(713,'Mahidpur',20),(714,'Maihar',20),(715,'Malajkhand',20),(716,'Manasa',20),(717,'Manawar',20),(718,'Mandideep',20),(719,'Mandla',20),(720,'Mandsaur',20),(721,'Mauganj',20),(722,'Mhow Cantonment',20),(723,'Mhowgaon',20),(724,'Morena',20),(725,'Multai',20),(726,'Murwara',20),(727,'Nagda',20),(728,'Nainpur',20),(729,'Narsinghgarh',20),(730,'Narsinghgarh',20),(731,'Neemuch',20),(732,'Nepanagar',20),(733,'Niwari',20),(734,'Nowgong',20),(735,'Nowrozabad',20),(736,'Pachore',20),(737,'Pali',20),(738,'Panagar',20),(739,'Pandhurna',20),(740,'Panna',20),(741,'Pasan',20),(742,'Pipariya',20),(743,'Pithampur',20),(744,'Porsa',20),(745,'Prithvipur',20),(746,'Raghogarh-Vijaypur',20),(747,'Rahatgarh',20),(748,'Raisen',20),(749,'Rajgarh',20),(750,'Ratlam',20),(751,'Rau',20),(752,'Rehli',20),(753,'Rewa',20),(754,'Sabalgarh',20),(755,'Sagar',20),(756,'Sanawad',20),(757,'Sarangpur',20),(758,'Sarni',20),(759,'Satna',20),(760,'Sausar',20),(761,'Sehore',20),(762,'Sendhwa',20),(763,'Seoni',20),(764,'Seoni-Malwa',20),(765,'Shahdol',20),(766,'Shajapur',20),(767,'Shamgarh',20),(768,'Sheopur',20),(769,'Shivpuri',20),(770,'Shujalpur',20),(771,'Sidhi',20),(772,'Sihora',20),(773,'Singrauli',20),(774,'Sironj',20),(775,'Sohagpur',20),(776,'Tarana',20),(777,'Tikamgarh',20),(778,'Ujhani',20),(779,'Ujjain',20),(780,'Umaria',20),(781,'Vidisha',20),(782,'Wara Seoni',20),(783,'Ahmednagar',21),(784,'Akola',21),(785,'Amravati',21),(786,'Aurangabad',21),(787,'Baramati',21),(788,'Chalisgaon',21),(789,'Chinchani',21),(790,'Devgarh',21),(791,'Dhule',21),(792,'Dombivli',21),(793,'Durgapur',21),(794,'Ichalkaranji',21),(795,'Jalna',21),(796,'Kalyan',21),(797,'Latur',21),(798,'Loha',21),(799,'Lonar',21),(800,'Lonavla',21),(801,'Mahad',21),(802,'Mahuli',21),(803,'Malegaon',21),(804,'Malkapur',21),(805,'Manchar',21),(806,'Mangalvedhe',21),(807,'Mangrulpir',21),(808,'Manjlegaon',21),(809,'Manmad',21),(810,'Manwath',21),(811,'Mehkar',21),(812,'Mhaswad',21),(813,'Miraj',21),(814,'Morshi',21),(815,'Mukhed',21),(816,'Mul',21),(817,'Mumbai',21),(818,'Murtijapur',21),(819,'Nagpur',21),(820,'Nalasopara',21),(821,'Nanded-Waghala',21),(822,'Nandgaon',21),(823,'Nandura',21),(824,'Nandurbar',21),(825,'Narkhed',21),(826,'Nashik',21),(827,'Navi Mumbai',21),(828,'Nawapur',21),(829,'Nilanga',21),(830,'Osmanabad',21),(831,'Ozar',21),(832,'Pachora',21),(833,'Paithan',21),(834,'Palghar',21),(835,'Pandharkaoda',21),(836,'Pandharpur',21),(837,'Panvel',21),(838,'Parbhani',21),(839,'Parli',21),(840,'Parola',21),(841,'Partur',21),(842,'Pathardi',21),(843,'Pathri',21),(844,'Patur',21),(845,'Pauni',21),(846,'Pen',21),(847,'Phaltan',21),(848,'Pulgaon',21),(849,'Pune',21),(850,'Purna',21),(851,'Pusad',21),(852,'Rahuri',21),(853,'Rajura',21),(854,'Ramtek',21),(855,'Ratnagiri',21),(856,'Raver',21),(857,'Risod',21),(858,'Sailu',21),(859,'Sangamner',21),(860,'Sangli',21),(861,'Sangole',21),(862,'Sasvad',21),(863,'Satana',21),(864,'Satara',21),(865,'Savner',21),(866,'Sawantwadi',21),(867,'Shahade',21),(868,'Shegaon',21),(869,'Shendurjana',21),(870,'Shirdi',21),(871,'Shirpur-Warwade',21),(872,'Shirur',21),(873,'Shrigonda',21),(874,'Shrirampur',21),(875,'Sillod',21),(876,'Sinnar',21),(877,'Solapur',21),(878,'Soyagaon',21),(879,'Talegaon Dabhade',21),(880,'Talode',21),(881,'Tasgaon',21),(882,'Tirora',21),(883,'Tuljapur',21),(884,'Tumsar',21),(885,'Uran',21),(886,'Uran Islampur',21),(887,'Wadgaon Road',21),(888,'Wai',21),(889,'Wani',21),(890,'Wardha',21),(891,'Warora',21),(892,'Warud',21),(893,'Washim',21),(894,'Yevla',21),(895,'Uchgaon',21),(896,'Udgir',21),(897,'Umarga',21),(898,'Umarkhed',21),(899,'Umred',21),(900,'Vadgaon Kasba',21),(901,'Vaijapur',21),(902,'Vasai',21),(903,'Virar',21),(904,'Vita',21),(905,'Yavatmal',21),(906,'Yawal',21),(907,'Imphal',22),(908,'Kakching',22),(909,'Lilong',22),(910,'Mayang Imphal',22),(911,'Thoubal',22),(912,'Jowai',23),(913,'Nongstoin',23),(914,'Shillong',23),(915,'Tura',23),(916,'Aizawl',24),(917,'Champhai',24),(918,'Lunglei',24),(919,'Saiha',24),(920,'Dimapur',25),(921,'Kohima',25),(922,'Mokokchung',25),(923,'Tuensang',25),(924,'Wokha',25),(925,'Zunheboto',25),(950,'Anandapur',26),(951,'Anugul',26),(952,'Asika',26),(953,'Balangir',26),(954,'Balasore',26),(955,'Baleshwar',26),(956,'Bamra',26),(957,'Barbil',26),(958,'Bargarh',26),(959,'Bargarh',26),(960,'Baripada',26),(961,'Basudebpur',26),(962,'Belpahar',26),(963,'Bhadrak',26),(964,'Bhawanipatna',26),(965,'Bhuban',26),(966,'Bhubaneswar',26),(967,'Biramitrapur',26),(968,'Brahmapur',26),(969,'Brajrajnagar',26),(970,'Byasanagar',26),(971,'Cuttack',26),(972,'Debagarh',26),(973,'Dhenkanal',26),(974,'Gunupur',26),(975,'Hinjilicut',26),(976,'Jagatsinghapur',26),(977,'Jajapur',26),(978,'Jaleswar',26),(979,'Jatani',26),(980,'Jeypur',26),(981,'Jharsuguda',26),(982,'Joda',26),(983,'Kantabanji',26),(984,'Karanjia',26),(985,'Kendrapara',26),(986,'Kendujhar',26),(987,'Khordha',26),(988,'Koraput',26),(989,'Malkangiri',26),(990,'Nabarangapur',26),(991,'Paradip',26),(992,'Parlakhemundi',26),(993,'Pattamundai',26),(994,'Phulabani',26),(995,'Puri',26),(996,'Rairangpur',26),(997,'Rajagangapur',26),(998,'Raurkela',26),(999,'Rayagada',26),(1000,'Sambalpur',26),(1001,'Soro',26),(1002,'Sunabeda',26),(1003,'Sundargarh',26),(1004,'Talcher',26),(1005,'Titlagarh',26),(1006,'Umarkote',26),(1007,'Karaikal',27),(1008,'Mahe',27),(1009,'Puducherry',27),(1010,'Yanam',27),(1011,'Ahmedgarh',28),(1012,'Amritsar',28),(1013,'Barnala',28),(1014,'Batala',28),(1015,'Bathinda',28),(1016,'Bhagha Purana',28),(1017,'Budhlada',28),(1018,'Chandigarh',28),(1019,'Dasua',28),(1020,'Dhuri',28),(1021,'Dinanagar',28),(1022,'Faridkot',28),(1023,'Fazilka',28),(1024,'Firozpur',28),(1025,'Firozpur Cantt.',28),(1026,'Giddarbaha',28),(1027,'Gobindgarh',28),(1028,'Gurdaspur',28),(1029,'Hoshiarpur',28),(1030,'Jagraon',28),(1031,'Jaitu',28),(1032,'Jalalabad',28),(1033,'Jalandhar',28),(1034,'Jalandhar Cantt.',28),(1035,'Jandiala',28),(1036,'Kapurthala',28),(1037,'Karoran',28),(1038,'Kartarpur',28),(1039,'Khanna',28),(1040,'Kharar',28),(1041,'Kot Kapura',28),(1042,'Kurali',28),(1043,'Longowal',28),(1044,'Ludhiana',28),(1045,'Malerkotla',28),(1046,'Malout',28),(1047,'Mansa',28),(1048,'Maur',28),(1049,'Moga',28),(1050,'Mohali',28),(1051,'Morinda',28),(1052,'Mukerian',28),(1053,'Muktsar',28),(1054,'Nabha',28),(1055,'Nakodar',28),(1056,'Nangal',28),(1057,'Nawanshahr',28),(1058,'Pathankot',28),(1059,'Patiala',28),(1060,'Patran',28),(1061,'Patti',28),(1062,'Phagwara',28),(1063,'Phillaur',28),(1064,'Qadian',28),(1065,'Raikot',28),(1066,'Rajpura',28),(1067,'Rampura Phul',28),(1068,'Rupnagar',28),(1069,'Samana',28),(1070,'Sangrur',28),(1071,'Sirhind Fatehgarh Sahib',28),(1072,'Sujanpur',28),(1073,'Sunam',28),(1074,'Talwara',28),(1075,'Tarn Taran',28),(1076,'Urmar Tanda',28),(1077,'Zira',28),(1078,'Zirakpur',28),(1079,'Bali',29),(1080,'Banswara',29),(1081,'Ajmer',29),(1082,'Alwar',29),(1083,'Bandikui',29),(1084,'Baran',29),(1085,'Barmer',29),(1086,'Bikaner',29),(1087,'Fatehpur',29),(1088,'Jaipur',29),(1089,'Jaisalmer',29),(1090,'Jodhpur',29),(1091,'Kota',29),(1092,'Lachhmangarh',29),(1093,'Ladnu',29),(1094,'Lakheri',29),(1095,'Lalsot',29),(1096,'Losal',29),(1097,'Makrana',29),(1098,'Malpura',29),(1099,'Mandalgarh',29),(1100,'Mandawa',29),(1101,'Mangrol',29),(1102,'Merta City',29),(1103,'Mount Abu',29),(1104,'Nadbai',29),(1105,'Nagar',29),(1106,'Nagaur',29),(1107,'Nargund',29),(1108,'Nasirabad',29),(1109,'Nathdwara',29),(1110,'Navalgund',29),(1111,'Nawalgarh',29),(1112,'Neem-Ka-Thana',29),(1113,'Nelamangala',29),(1114,'Nimbahera',29),(1115,'Nipani',29),(1116,'Niwai',29),(1117,'Nohar',29),(1118,'Nokha',29),(1119,'Pali',29),(1120,'Phalodi',29),(1121,'Phulera',29),(1122,'Pilani',29),(1123,'Pilibanga',29),(1124,'Pindwara',29),(1125,'Pipar City',29),(1126,'Prantij',29),(1127,'Pratapgarh',29),(1128,'Raisinghnagar',29),(1129,'Rajakhera',29),(1130,'Rajaldesar',29),(1131,'Rajgarh (Alwar)',29),(1132,'Rajgarh (Churu',29),(1133,'Rajsamand',29),(1134,'Ramganj Mandi',29),(1135,'Ramngarh',29),(1136,'Ratangarh',29),(1137,'Rawatbhata',29),(1138,'Rawatsar',29),(1139,'Reengus',29),(1140,'Sadri',29),(1141,'Sadulshahar',29),(1142,'Sagwara',29),(1143,'Sambhar',29),(1144,'Sanchore',29),(1145,'Sangaria',29),(1146,'Sardarshahar',29),(1147,'Sawai Madhopur',29),(1148,'Shahpura',29),(1149,'Shahpura',29),(1150,'Sheoganj',29),(1151,'Sikar',29),(1152,'Sirohi',29),(1153,'Sojat',29),(1154,'Sri Madhopur',29),(1155,'Sujangarh',29),(1156,'Sumerpur',29),(1157,'Suratgarh',29),(1158,'Taranagar',29),(1159,'Todabhim',29),(1160,'Todaraisingh',29),(1161,'Tonk',29),(1162,'Udaipur',29),(1163,'Udaipurwati',29),(1164,'Vijainagar',29),(1165,'Gangtok',30),(1166,'Calcutta',36),(1167,'Arakkonam',31),(1168,'Arcot',31),(1169,'Aruppukkottai',31),(1170,'Bhavani',31),(1171,'Chengalpattu',31),(1172,'Chennai',31),(1173,'Chinna salem',31),(1174,'Coimbatore',31),(1175,'Coonoor',31),(1176,'Cuddalore',31),(1177,'Dharmapuri',31),(1178,'Dindigul',31),(1179,'Erode',31),(1180,'Gudalur',31),(1181,'Gudalur',31),(1182,'Gudalur',31),(1183,'Kanchipuram',31),(1184,'Karaikudi',31),(1185,'Karungal',31),(1186,'Karur',31),(1187,'Kollankodu',31),(1188,'Lalgudi',31),(1189,'Madurai',31),(1190,'Nagapattinam',31),(1191,'Nagercoil',31),(1192,'Namagiripettai',31),(1193,'Namakkal',31),(1194,'Nandivaram-Guduvancheri',31),(1195,'Nanjikottai',31),(1196,'Natham',31),(1197,'Nellikuppam',31),(1198,'Neyveli',31),(1199,'O\' Valley',31),(1200,'Oddanchatram',31),(1201,'P.N.Patti',31),(1202,'Pacode',31),(1203,'Padmanabhapuram',31),(1204,'Palani',31),(1205,'Palladam',31),(1206,'Pallapatti',31),(1207,'Pallikonda',31),(1208,'Panagudi',31),(1209,'Panruti',31),(1210,'Paramakudi',31),(1211,'Parangipettai',31),(1212,'Pattukkottai',31),(1213,'Perambalur',31),(1214,'Peravurani',31),(1215,'Periyakulam',31),(1216,'Periyasemur',31),(1217,'Pernampattu',31),(1218,'Pollachi',31),(1219,'Polur',31),(1220,'Ponneri',31),(1221,'Pudukkottai',31),(1222,'Pudupattinam',31),(1223,'Puliyankudi',31),(1224,'Punjaipugalur',31),(1225,'Rajapalayam',31),(1226,'Ramanathapuram',31),(1227,'Rameshwaram',31),(1228,'Rasipuram',31),(1229,'Salem',31),(1230,'Sankarankoil',31),(1231,'Sankari',31),(1232,'Sathyamangalam',31),(1233,'Sattur',31),(1234,'Shenkottai',31),(1235,'Sholavandan',31),(1236,'Sholingur',31),(1237,'Sirkali',31),(1238,'Sivaganga',31),(1239,'Sivagiri',31),(1240,'Sivakasi',31),(1241,'Srivilliputhur',31),(1242,'Surandai',31),(1243,'Suriyampalayam',31),(1244,'Tenkasi',31),(1245,'Thammampatti',31),(1246,'Thanjavur',31),(1247,'Tharamangalam',31),(1248,'Tharangambadi',31),(1249,'Theni Allinagaram',31),(1250,'Thirumangalam',31),(1251,'Thirunindravur',31),(1252,'Thiruparappu',31),(1253,'Thirupuvanam',31),(1254,'Thiruthuraipoondi',31),(1255,'Thiruvallur',31),(1256,'Thiruvarur',31),(1257,'Thoothukudi',31),(1258,'Thuraiyur',31),(1259,'Tindivanam',31),(1260,'Tiruchendur',31),(1261,'Tiruchengode',31),(1262,'Tiruchirappalli',31),(1263,'Tirukalukundram',31),(1264,'Tirukkoyilur',31),(1265,'Tirunelveli',31),(1266,'Tirupathur',31),(1267,'Tirupathur',31),(1268,'Tiruppur',31),(1269,'Tiruttani',31),(1270,'Tiruvannamalai',31),(1271,'Tiruvethipuram',31),(1272,'Tittakudi',31),(1273,'Udhagamandalam',31),(1274,'Udumalaipettai',31),(1275,'Unnamalaikadai',31),(1276,'Usilampatti',31),(1277,'Uthamapalayam',31),(1278,'Uthiramerur',31),(1279,'Vadakkuvalliyur',31),(1280,'Vadalur',31),(1281,'Vadipatti',31),(1282,'Valparai',31),(1283,'Vandavasi',31),(1284,'Vaniyambadi',31),(1285,'Vedaranyam',31),(1286,'Vellakoil',31),(1287,'Vellore',31),(1288,'Vikramasingapuram',31),(1289,'Viluppuram',31),(1290,'Virudhachalam',31),(1291,'Virudhunagar',31),(1292,'Viswanatham',31),(1293,'Agartala',33),(1294,'Badharghat',33),(1295,'Dharmanagar',33),(1296,'Indranagar',33),(1297,'Jogendranagar',33),(1298,'Kailasahar',33),(1299,'Khowai',33),(1300,'Pratapgarh',33),(1301,'Udaipur',33),(1302,'Achhnera',34),(1303,'Adari',34),(1304,'Agra',34),(1305,'Aligarh',34),(1306,'Allahabad',34),(1307,'Amroha',34),(1308,'Azamgarh',34),(1309,'Bahraich',34),(1310,'Ballia',34),(1311,'Balrampur',34),(1312,'Banda',34),(1313,'Bareilly',34),(1314,'Chandausi',34),(1315,'Dadri',34),(1316,'Deoria',34),(1317,'Etawah',34),(1318,'Fatehabad',34),(1319,'Fatehpur',34),(1320,'Fatehpur',34),(1321,'Greater Noida',34),(1322,'Hamirpur',34),(1323,'Hardoi',34),(1324,'Jajmau',34),(1325,'Jaunpur',34),(1326,'Jhansi',34),(1327,'Kalpi',34),(1328,'Kanpur',34),(1329,'Kota',34),(1330,'Laharpur',34),(1331,'Lakhimpur',34),(1332,'Lal Gopalganj Nindaura',34),(1333,'Lalganj',34),(1334,'Lalitpur',34),(1335,'Lar',34),(1336,'Loni',34),(1337,'Lucknow',34),(1338,'Mathura',34),(1339,'Meerut',34),(1340,'Modinagar',34),(1341,'Muradnagar',34),(1342,'Nagina',34),(1343,'Najibabad',34),(1344,'Nakur',34),(1345,'Nanpara',34),(1346,'Naraura',34),(1347,'Naugawan Sadat',34),(1348,'Nautanwa',34),(1349,'Nawabganj',34),(1350,'Nehtaur',34),(1351,'NOIDA',34),(1352,'Noorpur',34),(1353,'Obra',34),(1354,'Orai',34),(1355,'Padrauna',34),(1356,'Palia Kalan',34),(1357,'Parasi',34),(1358,'Phulpur',34),(1359,'Pihani',34),(1360,'Pilibhit',34),(1361,'Pilkhuwa',34),(1362,'Powayan',34),(1363,'Pukhrayan',34),(1364,'Puranpur',34),(1365,'Purquazi',34),(1366,'Purwa',34),(1367,'Rae Bareli',34),(1368,'Rampur',34),(1369,'Rampur Maniharan',34),(1370,'Rasra',34),(1371,'Rath',34),(1372,'Renukoot',34),(1373,'Reoti',34),(1374,'Robertsganj',34),(1375,'Rudauli',34),(1376,'Rudrapur',34),(1377,'Sadabad',34),(1378,'Safipur',34),(1379,'Saharanpur',34),(1380,'Sahaspur',34),(1381,'Sahaswan',34),(1382,'Sahawar',34),(1383,'Sahjanwa',34),(1385,'Sambhal',34),(1386,'Samdhan',34),(1387,'Samthar',34),(1388,'Sandi',34),(1389,'Sandila',34),(1390,'Sardhana',34),(1391,'Seohara',34),(1394,'Shahganj',34),(1395,'Shahjahanpur',34),(1396,'Shamli',34),(1399,'Sherkot',34),(1401,'Shikohabad',34),(1402,'Shishgarh',34),(1403,'Siana',34),(1404,'Sikanderpur',34),(1405,'Sikandra Rao',34),(1406,'Sikandrabad',34),(1407,'Sirsaganj',34),(1408,'Sirsi',34),(1409,'Sitapur',34),(1410,'Soron',34),(1411,'Suar',34),(1412,'Sultanpur',34),(1413,'Sumerpur',34),(1414,'Tanda',34),(1415,'Tanda',34),(1416,'Tetri Bazar',34),(1417,'Thakurdwara',34),(1418,'Thana Bhawan',34),(1419,'Tilhar',34),(1420,'Tirwaganj',34),(1421,'Tulsipur',34),(1422,'Tundla',34),(1423,'Unnao',34),(1424,'Utraula',34),(1425,'Varanasi',34),(1426,'Vrindavan',34),(1427,'Warhapur',34),(1428,'Zaidpur',34),(1429,'Zamania',34),(1430,'Almora',35),(1431,'Bazpur',35),(1432,'Chamba',35),(1433,'Dehradun',35),(1434,'Haldwani',35),(1435,'Haridwar',35),(1436,'Jaspur',35),(1437,'Kashipur',35),(1438,'kichha',35),(1439,'Kotdwara',35),(1440,'Manglaur',35),(1441,'Mussoorie',35),(1442,'Nagla',35),(1443,'Nainital',35),(1444,'Pauri',35),(1445,'Pithoragarh',35),(1446,'Ramnagar',35),(1447,'Rishikesh',35),(1448,'Roorkee',35),(1449,'Rudrapur',35),(1450,'Sitarganj',35),(1451,'Tehri',35),(1452,'Muzaffarnagar',34),(1454,'Alipurduar',36),(1455,'Arambagh',36),(1456,'Asansol',36),(1457,'Baharampur',36),(1458,'Bally',36),(1459,'Balurghat',36),(1460,'Bankura',36),(1461,'Barakar',36),(1462,'Barasat',36),(1463,'Bardhaman',36),(1464,'Bidhan Nagar',36),(1465,'Chinsura',36),(1466,'Contai',36),(1467,'Cooch Behar',36),(1468,'Darjeeling',36),(1469,'Durgapur',36),(1470,'Haldia',36),(1471,'Howrah',36),(1472,'Islampur',36),(1473,'Jhargram',36),(1474,'Kharagpur',36),(1475,'Kolkata',36),(1476,'Mainaguri',36),(1477,'Mal',36),(1478,'Mathabhanga',36),(1479,'Medinipur',36),(1480,'Memari',36),(1481,'Monoharpur',36),(1482,'Murshidabad',36),(1483,'Nabadwip',36),(1484,'Naihati',36),(1485,'Panchla',36),(1486,'Pandua',36),(1487,'Paschim Punropara',36),(1488,'Purulia',36),(1489,'Raghunathpur',36),(1490,'Raiganj',36),(1491,'Rampurhat',36),(1492,'Ranaghat',36),(1493,'Sainthia',36),(1494,'Santipur',36),(1495,'Siliguri',36),(1496,'Sonamukhi',36),(1497,'Srirampore',36),(1498,'Suri',36),(1499,'Taki',36),(1500,'Tamluk',36),(1501,'Tarakeswar',36),(1502,'Chikmagalur',17),(1503,'Davanagere',17),(1504,'Dharwad',17),(1505,'Gadag',17),(1506,'Chennai',31),(1507,'Coimbatore',31),(1508,'Baroda',12);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_mst`
--

DROP TABLE IF EXISTS `doctor_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_mst` (
  `doctor_id` int NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doctor_img` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doctor_qualification` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `camp_date` date DEFAULT NULL,
  `camp_venue` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `camp_time` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doctor_city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `doctor_state` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `subcat_id` int DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` int DEFAULT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_mst`
--

LOCK TABLES `doctor_mst` WRITE;
/*!40000 ALTER TABLE `doctor_mst` DISABLE KEYS */;
INSERT INTO `doctor_mst` VALUES (1,'Ajay','17490323406410.26586409962184154docimage (9).jpg','specilist','GH2323','2025-06-12','Nagpur','16:40 PM','Nagpur','Mah',3,1,'N','2025-06-04 13:47:04',1,'2025-06-14 17:06:21',0),(2,'karna','17490351799960.748024001694525download.jpg','specilist','GH2323','2025-06-25','Nagpur','16:40 PM','Pune','Mah',3,1,'Y','2025-06-04 13:47:04',1,'2025-06-06 11:09:45',0),(3,'suraj','17490323406410.26586409962184154docimage (9).jpg',NULL,'H343','2025-06-20','Nagpur sitabuldi',NULL,NULL,NULL,3,NULL,'Y','2025-06-04 15:49:00',1,'2025-06-06 11:05:31',NULL),(4,'fdsfsdf','17490351799960.748024001694525download.jpg',NULL,'tttf','2025-06-25','fdfsdfsdfsdfdsfdsf',NULL,NULL,NULL,3,2,'N','2025-06-04 15:53:13',1,'2025-06-14 15:16:55',1),(5,'Mohit Mishra','17492105943690.2727636181791939profile.jpg',NULL,'Abc123','2025-06-07','Mumbai North',NULL,NULL,NULL,3,1,'N','2025-06-06 16:48:35',3,'2025-06-07 17:26:33',3),(6,'Rameet','17492130422630.22951767472130102profile.jpg',NULL,'Bsbs11','2025-06-06','Mumbai ',NULL,NULL,NULL,3,1,'N','2025-06-06 18:00:42',3,'2025-06-06 18:01:15',NULL),(7,'Bsbs','17492131178920.5615974441888625profile.jpg',NULL,'Dnnd','2025-06-06','Bdbd',NULL,NULL,NULL,3,1,'N','2025-06-06 18:01:57',3,'2025-06-06 18:03:10',NULL),(8,'Bdjej','17492132067280.18044196774686627profile.jpg',NULL,'Nfnfnfn','2025-06-06','Hrjdn',NULL,NULL,NULL,3,1,'N','2025-06-06 18:03:26',3,'2025-06-07 17:26:30',NULL),(9,'suraj','17492137641130.834768935585632docimage (9).jpg',NULL,'H343','2025-06-20','Nagpur sitabuldi',NULL,NULL,NULL,1,2,'Y','2025-06-06 18:12:44',1,'2025-06-06 18:12:44',NULL),(10,'Ram','17492974998900.9528930622517315profile.jpg',NULL,'Df2','2025-06-07','Mum',NULL,NULL,NULL,3,1,'N','2025-06-07 17:28:19',3,'2025-06-07 17:46:51',NULL),(11,'Rameet','17492986813850.6713133494941295profile.jpg',NULL,'Gdjs113','2025-06-07','Mumb',NULL,NULL,NULL,3,1,'N','2025-06-07 17:48:01',3,'2025-06-14 16:55:10',NULL),(12,'fdsfsdf','17498122003570.42312778832581555download.jpg',NULL,'tttf','2025-06-25','fdfsdfsdfsdfdsfdsf','01:50 PM',NULL,NULL,1,2,'Y','2025-06-13 16:25:26',1,'2025-06-13 16:26:40',1),(13,'Rajesh','17498942881040.20098190339730393profile.jpg',NULL,'Abcd123','2025-06-14','Mumbai','6:00 PM',NULL,NULL,3,2,'N','2025-06-14 14:58:51',3,'2025-06-14 15:16:56',3),(14,'Manmeet','17498943723110.6274901024989219profile.jpg',NULL,'Bcd234','2025-06-14','Delhi','7:00 PM',NULL,NULL,3,3,'Y','2025-06-14 15:16:12',3,'2025-06-14 15:16:12',NULL),(15,'Vijay','17498989912390.5849477295547125profile.jpg',NULL,'20','2025-06-14','Hhd','4:32 PM',NULL,NULL,3,2,'N','2025-06-14 16:33:11',3,'2025-06-16 17:19:34',NULL),(16,'Raj','17499003270740.9762926948735131profile.jpg',NULL,'Hdhsj','2025-06-14','Bdnd','4:55 PM',NULL,NULL,3,1,'Y','2025-06-14 16:55:27',3,'2025-06-14 16:55:27',NULL),(17,'Test doctor2','17500642780150.7791739355548profile.jpg',NULL,'WA2355','2025-06-24','Pumumba','5:20 PM',NULL,NULL,3,1,'N','2025-06-16 14:25:19',3,'2025-06-16 16:31:37',3),(18,'',NULL,NULL,'','2025-06-16','','2:26 PM',NULL,NULL,3,1,'N','2025-06-16 14:26:12',3,'2025-06-16 14:27:05',NULL),(19,'Gh',NULL,NULL,'Ga','2025-06-16','','2:28 PM',NULL,NULL,3,3,'Y','2025-06-16 14:28:56',3,'2025-06-16 14:28:56',NULL),(20,'',NULL,NULL,'','2025-06-16','','2:29 PM',NULL,NULL,3,3,'Y','2025-06-16 14:29:19',3,'2025-06-16 14:29:19',NULL),(21,'Ajay','17500708861980.9147870786944721profile.jpg',NULL,'Gh','2025-06-26','Pune','9:15 PM',NULL,NULL,3,1,'Y','2025-06-16 16:17:19',3,'2025-06-16 16:18:06',3),(22,'Karan','17500716859030.9886933391668775profile.jpg',NULL,'Wac','2025-06-16','Ghh','6:29 PM',NULL,NULL,3,1,'N','2025-06-16 16:30:27',3,'2025-06-20 16:00:19',3),(23,'Dr. Sneha','17500792846200.8406188530636622profile.jpg',NULL,'796819','2025-06-17','Mumbai ','6:37 PM',NULL,NULL,3,1,'N','2025-06-16 18:38:04',3,'2025-06-20 16:00:00',NULL),(24,'Chirag','17500794102680.018601338365949793profile.jpg',NULL,'7282729','2025-06-16','Mumbai ','6:39 PM',NULL,NULL,3,2,'N','2025-06-16 18:40:10',3,'2025-06-20 16:00:31',NULL),(25,'Dr.Smita','17502244936940.34616986658264737profile.jpg',NULL,'62828','2025-06-18','Mumbai ','10:57 AM',NULL,NULL,3,1,'N','2025-06-18 10:58:13',3,'2025-06-20 15:59:53',NULL),(26,'Dr.Smita','17502245419400.4671963094740923profile.jpg',NULL,'Uwuwi','2025-06-18','Mumbai ','10:58 AM',NULL,NULL,3,3,'N','2025-06-18 10:59:02',3,'2025-06-20 16:00:40',NULL),(27,'Kirti','17502246064610.533702342160145profile.jpg',NULL,'199hahah','2025-06-30','Hwjaha','3:58 PM',NULL,NULL,3,1,'Y','2025-06-18 11:00:06',3,'2025-06-18 11:00:06',NULL),(28,'Turni','17502247034560.04378627222302467profile.jpg',NULL,',7171','2025-06-18','Hj','11:00 AM',NULL,NULL,3,3,'Y','2025-06-18 11:01:43',3,'2025-06-18 11:01:43',NULL),(29,'Smita','17504153832080.34171429995533975profile.jpg',NULL,'Yiwoo','2025-06-18','Mumbai ','11:54 AM',NULL,NULL,3,1,'N','2025-06-18 11:04:59',3,'2025-06-20 15:59:50',3),(30,'Smita','17502249466660.8793112529480489profile.jpg',NULL,'Twowo','2025-06-19','Mumbai ','6:54 PM',NULL,NULL,3,3,'N','2025-06-18 11:05:46',3,'2025-06-20 16:00:36',NULL),(31,'Turni','17502253622850.19239267301328478profile.jpg',NULL,'16161','2025-06-18','Turbi','11:12 AM',NULL,NULL,3,2,'Y','2025-06-18 11:12:42',3,'2025-06-18 11:12:42',NULL),(32,'Rajat Kumar test',NULL,NULL,'Abcgdh123','2025-06-23','','4:49 PM',NULL,NULL,3,1,'Y','2025-06-23 16:50:01',3,'2025-06-23 16:52:01',3),(33,'Kara1',NULL,NULL,'Hh','2025-06-27','','5:43 PM',NULL,NULL,3,1,'Y','2025-06-23 18:46:12',3,'2025-06-23 18:46:21',3),(34,'Diksha',NULL,NULL,'Rtoouy','2025-06-24','','12:37 PM',NULL,NULL,3,1,'Y','2025-06-24 12:37:28',3,'2025-06-24 12:37:28',NULL),(35,'Puneet',NULL,NULL,'12345','2025-07-02','','12:50 PM',NULL,NULL,3,1,'Y','2025-07-02 12:50:30',3,'2025-07-02 12:50:30',NULL),(36,'Puneet',NULL,NULL,'1234','2025-07-02','','12:54 PM',NULL,NULL,3,2,'Y','2025-07-02 12:55:01',3,'2025-07-02 12:55:01',NULL),(37,'Turni',NULL,NULL,'1234','2025-07-07','','9:05 PM',NULL,NULL,3,3,'Y','2025-07-07 21:05:52',3,'2025-07-07 21:05:52',NULL),(38,'Pun',NULL,NULL,'123','2025-07-25','','3:51 PM',NULL,NULL,3,1,'N','2025-07-25 15:51:43',3,'2025-08-02 14:25:27',NULL),(39,'Pun',NULL,NULL,'123','2025-07-25','','3:52 PM',NULL,NULL,3,1,'N','2025-07-25 15:52:29',3,'2025-08-02 14:25:25',NULL),(40,'Demo',NULL,NULL,'1234','2025-08-02','','11:58 AM',NULL,NULL,3,1,'N','2025-08-02 12:09:46',3,'2025-08-02 14:25:22',NULL),(41,'Demo ecg',NULL,NULL,'12345','2025-08-02','','12:17 PM',NULL,NULL,3,2,'Y','2025-08-02 12:17:47',3,'2025-08-02 12:17:47',NULL),(42,'Demo Lipid',NULL,NULL,'1245','2025-08-02','','12:19 PM',NULL,NULL,3,3,'N','2025-08-02 12:19:34',3,'2025-08-02 14:30:33',NULL),(43,'Ramesh',NULL,NULL,'W124466','2025-08-03','','6:00 PM',NULL,NULL,3,1,'Y','2025-08-02 14:26:02',3,'2025-08-02 14:26:02',NULL),(44,'Rajesh',NULL,NULL,'W123','2025-08-02','','2:30 PM',NULL,NULL,3,2,'Y','2025-08-02 14:30:14',3,'2025-08-07 15:54:00',3),(45,'Ritesh',NULL,NULL,'W3456','2025-08-02','','2:30 PM',NULL,NULL,3,3,'Y','2025-08-02 14:30:43',3,'2025-08-02 14:30:43',NULL),(46,'Turni',NULL,NULL,'1234','2025-08-07','','3:47 PM',NULL,NULL,3,3,'Y','2025-08-07 15:47:57',3,'2025-08-07 15:47:57',NULL),(47,'Kirti',NULL,NULL,'7171','2025-08-07','','5:47 PM',NULL,NULL,3,1,'Y','2025-08-07 15:49:28',3,'2025-08-07 15:49:28',NULL);
/*!40000 ALTER TABLE `doctor_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identifier_mst`
--

DROP TABLE IF EXISTS `identifier_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identifier_mst` (
  `identifier_code` int NOT NULL AUTO_INCREMENT,
  `identifier-desc` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`identifier_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identifier_mst`
--

LOCK TABLES `identifier_mst` WRITE;
/*!40000 ALTER TABLE `identifier_mst` DISABLE KEYS */;
INSERT INTO `identifier_mst` VALUES (1,'brand name');
/*!40000 ALTER TABLE `identifier_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_mst`
--

DROP TABLE IF EXISTS `language_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_mst` (
  `lang_id` int NOT NULL AUTO_INCREMENT,
  `langkey` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `langvalue` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `display_order` int NOT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_mst`
--

LOCK TABLES `language_mst` WRITE;
/*!40000 ALTER TABLE `language_mst` DISABLE KEYS */;
INSERT INTO `language_mst` VALUES (1,'en','English','Y',1),(2,'hi','Hindi','Y',2);
/*!40000 ALTER TABLE `language_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_mst`
--

DROP TABLE IF EXISTS `patient_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_mst` (
  `pa_id` int NOT NULL AUTO_INCREMENT,
  `crid` int NOT NULL,
  `subcat_id` int NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `bp` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sbp` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dbp` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `isHypertensive` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tc` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tg` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hdl` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nonhdl` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ldl` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ldlhdl` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `heart_rate` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fibrillation` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT 'Y',
  PRIMARY KEY (`pa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_mst`
--

LOCK TABLES `patient_mst` WRITE;
/*!40000 ALTER TABLE `patient_mst` DISABLE KEYS */;
INSERT INTO `patient_mst` VALUES (1,4,2,'patient1',20,'Male','202','34','45','67','45','23','90','76','49',NULL,NULL,NULL,1,'2025-06-05 15:44:33','2025-06-09 17:44:45','N'),(2,4,2,'p',2,'Ma','2','3','4','Y','4','2','9','7','4',NULL,NULL,NULL,1,'2025-06-05 15:45:22','2025-06-09 17:44:45','N'),(3,4,2,'Mohw',26,'Male','20','10','20','No','','','','','',NULL,NULL,NULL,1,'2025-06-10 15:38:13','2025-06-11 15:43:28','N'),(4,4,2,'Ramnet',20,'Female','10','10','10','No','','','','','',NULL,NULL,NULL,1,'2025-06-11 14:42:58','2025-06-11 14:43:48','N'),(5,4,2,'Rohan',25,'','20','30','50','Yes','','','','','',NULL,NULL,NULL,1,'2025-06-11 15:41:57','2025-06-11 15:43:32','N'),(6,4,2,'Raj Sharma',20,'','10','10','20','Yes','','','','','',NULL,NULL,NULL,1,'2025-06-11 15:43:56',NULL,'Y'),(7,6,1,'Lokesh Shah',30,'','20','30','50','No','','','','','',NULL,NULL,NULL,3,'2025-06-11 16:29:14',NULL,'Y'),(8,7,1,'Raju kumar1',20,'Male','10','10','10','No','','','','','',NULL,NULL,NULL,3,'2025-06-11 17:02:03','2025-06-14 15:47:59','N'),(9,7,1,'Neha Mishra',25,'Female','2','3','5','Yes','','','','','',NULL,NULL,NULL,3,'2025-06-11 17:02:33','2025-06-14 15:47:59','N'),(10,8,3,'Harish shah',10,'','','','','No','10','20','100','10','10',NULL,NULL,NULL,3,'2025-06-12 19:11:18',NULL,'Y'),(11,8,3,'Ranu Garg',26,'Female','','','','No','200','300','45','45','60',NULL,NULL,NULL,3,'2025-06-12 19:12:02',NULL,'Y'),(12,9,1,'Ramneet',23,'Female','10','20','139','Yes','','','','','',NULL,NULL,NULL,3,'2025-06-14 15:57:53','2025-06-14 16:01:54','N'),(13,10,1,'Rajesh',50,'','358','6568','555','Yes','','','','','',NULL,NULL,NULL,3,'2025-06-14 16:05:57','2025-06-14 16:24:26','N'),(14,11,1,'Ramya Mohan',30,'Female','30','20','39','No','','','','','',NULL,NULL,NULL,3,'2025-06-14 16:24:56','2025-06-16 14:32:13','N'),(15,12,1,'Rohit agrawal',20,'','10','20','60','No','','','','','',NULL,NULL,NULL,3,'2025-06-14 18:54:24','2025-06-14 19:02:20','N'),(16,16,1,'Ahay 3',5,'Male','13','21','58','Yes','','','','','',NULL,NULL,NULL,3,'2025-06-16 14:43:23','2025-06-16 14:50:38','N'),(17,21,1,'Gh',5,'Female','25','25','58','Yes','','','','','',NULL,NULL,NULL,3,'2025-06-16 16:23:40','2025-06-16 17:19:03','N'),(18,21,1,'',0,'','','','','No','','','','','',NULL,NULL,NULL,3,'2025-06-16 16:24:27','2025-06-16 16:24:31','N'),(19,22,1,'Gh',5,'Male','4','4','8','No','','','','','',NULL,NULL,NULL,3,'2025-06-16 16:32:13','2025-06-16 17:19:01','N'),(20,23,1,'Rohyahdb',26,'','9','9','9898','No','','','','','',NULL,NULL,NULL,3,'2025-06-16 17:18:44','2025-06-16 17:18:58','N'),(21,41,3,'Turni',23,'Female','','','','No','123','230','35','266','150',NULL,NULL,NULL,3,'2025-06-19 17:30:20','2025-06-20 15:54:45','N'),(22,46,3,'Bina',28,'Female','','','','No','25','25','25','25','25',NULL,NULL,NULL,3,'2025-06-20 15:54:11','2025-06-20 15:54:40','N'),(23,48,3,'Jack',20,'Female','','','','No','','','','60','','',NULL,NULL,3,'2025-06-23 17:04:50','2025-06-23 17:05:08','Y'),(24,48,3,'Raju',60,'','','','','No','9797','705','8707','10','','10',NULL,NULL,3,'2025-06-23 17:06:15',NULL,'Y'),(25,49,3,'Rohit Jogi',30,'','','','','No','60','20','60','','35','',NULL,NULL,3,'2025-06-23 17:39:23','2025-06-23 17:45:12','N'),(26,49,3,'Rohit jogi',20,'Female','','','','No','30','65','25','44','12','33',NULL,NULL,3,'2025-06-23 17:45:38','2025-06-23 17:47:13','N'),(27,49,3,'Rohit jogi',20,'Female','','','','No','87007','','','','','',NULL,NULL,3,'2025-06-23 17:47:30','2025-06-23 17:49:07','N'),(28,49,3,'Rohit jogi',10,'Male','','','','No','90','80','99','23','66','45',NULL,NULL,3,'2025-06-23 17:49:21','2025-06-23 17:50:16','Y'),(29,50,1,'Rajat n',60,'Male','60','21','31','No','','','','','','',NULL,NULL,3,'2025-06-23 17:55:03','2025-06-23 19:19:53','N'),(30,56,1,'Gh',25,'Male','25','25','25','Yes','','','','','','',NULL,NULL,3,'2025-06-23 18:58:46','2025-06-23 19:08:29','N'),(31,57,1,'Ajit',20,'Male','20','60','60','No','','','','','','',NULL,NULL,3,'2025-06-23 19:07:28','2025-06-23 19:08:27','N'),(32,58,2,'Raj T',30,'Male','','','','No','','','','','','',NULL,NULL,3,'2025-06-23 19:11:50','2025-06-24 12:10:54','N'),(33,58,2,'Tarak',30,'Male','20','36','69','No','','','','','','',NULL,NULL,3,'2025-06-23 19:12:48','2025-06-24 12:10:54','N'),(34,60,1,'Gh',25,'Male','25','25','1','No','','','','','','',NULL,NULL,3,'2025-06-23 19:15:23','2025-06-23 19:19:50','N'),(35,61,2,'Gh',5,'Female','2','2','2','No','','','','','','',NULL,NULL,3,'2025-06-23 19:16:07','2025-06-24 09:50:44','N'),(36,66,1,'Ramit',48,'Male','8','60','84','No','','','','','','',NULL,NULL,3,'2025-06-23 19:30:00','2025-08-02 14:34:10','N'),(37,68,1,'Fh',2,'Male','1','2','2','No','','','','','','',NULL,NULL,3,'2025-06-23 19:51:18','2025-06-27 13:52:31','N'),(38,69,2,'Th',25,'Male','2','1','25','Yes','','','','','','',NULL,NULL,3,'2025-06-23 19:52:00','2025-06-24 09:50:40','N'),(39,72,2,'Ram r',60,'Male','','','','No','','','','','','',NULL,NULL,3,'2025-06-24 10:00:39','2025-06-24 12:08:56','N'),(40,73,1,'Test',26,'Male','2','2','4','No','','','','','','',NULL,NULL,3,'2025-06-24 10:45:17','2025-06-24 10:45:40','N'),(41,72,2,'Raj ',20,'Male','','','','No','','','','','','',NULL,NULL,3,'2025-06-24 12:10:02','2025-06-24 12:10:51','N'),(42,75,2,'Mohan K',30,'Male','10','20','40','No','','','','','','',NULL,NULL,3,'2025-06-24 12:11:36','2025-06-24 12:18:20','N'),(43,77,3,'Bdbd',95,'Male','','','','No','','','','','','',NULL,NULL,3,'2025-06-24 12:17:42','2025-06-24 12:18:03','N'),(44,78,1,'Diksha',28,'Female','25','25','25','Yes','','','','','','',NULL,NULL,3,'2025-06-24 12:43:55',NULL,'Y'),(45,79,3,'Diksha',28,'Female','','','','No','25','25','58','25','58','28',NULL,NULL,3,'2025-06-24 12:45:49',NULL,'Y'),(46,80,2,'Diksha',25,'Female','25','28','28','Yes','','','','','','',NULL,NULL,3,'2025-06-24 12:47:22',NULL,'Y'),(47,83,1,'Tujk',25,'Male','44','80','150','Yes','','','','','','',NULL,NULL,3,'2025-06-24 15:11:05','2025-06-27 13:52:19','N'),(48,84,3,'Ghjj',44,'Male','','','','No','258','235','25','50','250','',NULL,NULL,3,'2025-06-24 15:12:06','2025-06-27 13:59:09','N'),(49,86,3,'Rohand',90,'Male','','','','No','10','20','60','885','8584','1.5',NULL,NULL,3,'2025-06-27 13:58:41','2025-06-27 13:59:06','N'),(50,87,2,'Rajat Singh',25,'Male','','10','10','No','','','','','','',NULL,NULL,3,'2025-06-27 14:05:16','2025-07-30 12:02:17','N'),(51,88,3,'Raj H',35,'Male','','','','No','54','949','44','95','94','1.5',NULL,NULL,3,'2025-06-27 14:07:45',NULL,'Y'),(52,91,3,'P',23,'Male','','','','No','200','200','300','','10','',NULL,'Not Detected',3,'2025-07-02 13:01:26','2025-07-17 12:06:04','N'),(53,92,2,'R',22,'Male','','130','80','No','','','','','','',NULL,NULL,3,'2025-07-02 13:03:36','2025-07-17 11:34:47','N'),(54,94,1,'Raj',20,'Male','','10','10','No','','','','','','','','Not Detected',3,'2025-07-17 11:34:09','2025-07-17 11:34:27','N'),(55,95,2,'Pramit',2,'Male','','10','20','No','','','','','','','80','Detected',3,'2025-07-17 11:35:25','2025-07-17 11:37:28','N'),(56,96,3,'Monu',60,'Male','','','','No','10','20','60','','20','','','Not Detected',3,'2025-07-17 11:38:06','2025-07-17 11:41:01','N'),(57,97,2,'Beb',5,'Female','','659','656','No','','','','','','','60','Not Detected',3,'2025-07-17 11:41:29','2025-07-17 11:41:55','N'),(58,93,2,'Aman',20,'Male','','10','10','No','','','','','','','90','Detected',3,'2025-07-17 11:56:37','2025-07-30 12:02:23','N'),(59,98,2,'Ajay',10,'Male','','2','10','No','','','','','Detected','','80','Detected',3,'2025-07-17 12:04:41','2025-07-17 12:05:56','N'),(60,99,3,'Ajay',10,'Male','','','','No','94','2','4','','5','','','Not Detected',3,'2025-07-17 12:06:35',NULL,'Y'),(61,102,2,'Rrr',26,'Male','','160','85','No','','','','','','','50','Not Detected',3,'2025-07-25 16:00:29','2025-07-30 12:02:14','N'),(62,104,2,'Ankit',20,'Male','','10','10','No','','','','','','','2959','Not Detected',3,'2025-07-30 12:03:15','2025-07-30 12:07:44','N'),(63,105,2,'Gsgs',10,'Male','','995','18','No','','','','','','','848','Not Detected',3,'2025-07-30 12:08:24','2025-07-30 14:57:16','N'),(64,106,2,'Meet',15,'Male','','10','11','No','','','','','','','12','Not Detected',3,'2025-07-30 14:57:50','2025-07-30 15:10:48','N'),(65,107,2,'Amit',15,'Male','','1','1','No','','','','','','','1','Not Detected',3,'2025-07-30 15:11:35','2025-07-30 15:27:30','N'),(66,108,2,'Am',14,'Male','','1','','No','','','','','','','','Not Detected',3,'2025-07-30 15:27:51',NULL,'Y'),(67,109,1,'Demo',25,'Male','','180','120','No','','','','','','','','Not Detected',3,'2025-08-02 12:50:05','2025-08-02 14:31:31','N'),(68,110,1,'Demo patient two',26,'Female','','','','No','','','','','','','','Not Detected',3,'2025-08-02 12:54:30','2025-08-02 14:31:29','N'),(69,111,3,'Ajiy',10,'Male','','','','No','','','','','','','','Not Detected',3,'2025-08-02 13:45:10','2025-08-02 14:36:30','N'),(70,112,1,'Meet',20,'Male','','10','20','No','','','','','','','','Not Detected',3,'2025-08-02 14:32:12',NULL,'Y'),(71,113,3,'Rajat',30,'Male','','','','No','10','20','','','','','','Not Detected',3,'2025-08-02 14:37:05',NULL,'Y'),(72,114,2,'Demo ECG patient ',26,'Male','','','','No','','','','','','','','Not Detected',3,'2025-08-02 14:49:15','2025-08-02 14:49:38','Y'),(73,115,3,'Demo lipid patient',26,'Female','','','','No','','','','','','','','Not Detected',3,'2025-08-02 14:51:22','2025-08-02 14:51:37','Y'),(74,116,1,'K',30,'Male','','','','No','','','','','','','','Not Detected',3,'2025-08-04 13:05:59',NULL,'Y');
/*!40000 ALTER TABLE `patient_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster_cat_mst`
--

DROP TABLE IF EXISTS `poster_cat_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster_cat_mst` (
  `pcat_id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `display_order` int DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pcat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster_cat_mst`
--

LOCK TABLES `poster_cat_mst` WRITE;
/*!40000 ALTER TABLE `poster_cat_mst` DISABLE KEYS */;
INSERT INTO `poster_cat_mst` VALUES (1,'BP Camp Poster',1,'Y'),(2,'BP + ECG Camp Poster',2,'Y'),(3,'Lipid Camp Poster',3,'Y');
/*!40000 ALTER TABLE `poster_cat_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster_field_mst`
--

DROP TABLE IF EXISTS `poster_field_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster_field_mst` (
  `poster_id` int NOT NULL AUTO_INCREMENT,
  `poster_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `cat_id` int DEFAULT NULL,
  `nx` int NOT NULL,
  `ny` double NOT NULL,
  `vx` double NOT NULL,
  `vy` double NOT NULL,
  `dx` int NOT NULL,
  `dy` double NOT NULL,
  `tx` int NOT NULL,
  `ty` double NOT NULL,
  `fs` int DEFAULT NULL,
  `iw` int DEFAULT NULL,
  `ih` int DEFAULT NULL,
  `it` int DEFAULT NULL,
  `il` int DEFAULT NULL,
  `c` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nta` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vta` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster_field_mst`
--

LOCK TABLES `poster_field_mst` WRITE;
/*!40000 ALTER TABLE `poster_field_mst` DISABLE KEYS */;
INSERT INTO `poster_field_mst` VALUES (1,'lipidBackup',3,30,45,45,93,17,59.5,17,69.7,40,260,260,925,148,'black','left','left','N'),(2,'bp',1,29,52.2,50,93,17,65,17,72,47,260,260,925,148,'black','left','left','Y'),(3,'bpecg',2,29,52.2,50,93,17,65,17,72,40,260,260,925,148,'black','left','left','Y'),(4,'lipid',3,29,77,50,93,24,82.8,64,82.8,47,260,260,925,148,'black','left','left','Y');
/*!40000 ALTER TABLE `poster_field_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster_mst`
--

DROP TABLE IF EXISTS `poster_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster_mst` (
  `poster_id` int NOT NULL AUTO_INCREMENT,
  `postername` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `poster_path` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `language` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `subcat_id` int DEFAULT NULL,
  `displayorder` int NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster_mst`
--

LOCK TABLES `poster_mst` WRITE;
/*!40000 ALTER TABLE `poster_mst` DISABLE KEYS */;
INSERT INTO `poster_mst` VALUES (1,'bp','bp.png','en',1600,2399,1,1,'Y'),(2,'bpecg','bpecg.png','en',1600,2399,2,2,'Y'),(3,'lipid','lipid.png','en',1600,2399,3,3,'Y'),(4,'lipidBack','lipid.png','en',1600,2399,4,4,'N');
/*!40000 ALTER TABLE `poster_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_camp_rep_mapping`
--

DROP TABLE IF EXISTS `question_camp_rep_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_camp_rep_mapping` (
  `qcid` int NOT NULL AUTO_INCREMENT,
  `rqid` int DEFAULT NULL,
  `crid` int DEFAULT NULL,
  `subcat_id` int DEFAULT NULL,
  `brand_id` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `other_brands` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer` int DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT 'Y',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`qcid`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_camp_rep_mapping`
--

LOCK TABLES `question_camp_rep_mapping` WRITE;
/*!40000 ALTER TABLE `question_camp_rep_mapping` DISABLE KEYS */;
INSERT INTO `question_camp_rep_mapping` VALUES (1,1,1,1,'2,3',NULL,9,'Y','2025-06-05 17:50:32',1,'2025-06-05 18:22:27'),(2,2,1,1,'2,3',NULL,9,'Y','2025-06-05 17:50:32',1,'2025-06-05 18:22:27'),(3,3,1,1,'2,3',NULL,10,'Y','2025-06-05 17:50:32',1,'2025-06-05 18:22:27'),(13,1,6,1,'1,4',NULL,30,'Y','2025-06-11 16:43:34',3,'2025-06-11 16:43:34'),(14,2,6,1,'1,4',NULL,20,'Y','2025-06-11 16:43:34',3,'2025-06-11 16:43:34'),(15,3,6,1,'1,4',NULL,10,'Y','2025-06-11 16:43:34',3,'2025-06-11 16:43:34'),(19,1,7,1,'3,5',NULL,20,'N','2025-06-11 17:04:11',3,'2025-06-14 15:47:59'),(20,2,7,1,'3,5',NULL,30,'N','2025-06-11 17:04:11',3,'2025-06-14 15:47:59'),(21,3,7,1,'3,5',NULL,40,'N','2025-06-11 17:04:11',3,'2025-06-14 15:47:59'),(22,7,8,3,'1,4,6',NULL,30,'Y','2025-06-12 19:13:38',3,'2025-06-12 19:13:38'),(23,8,8,3,'1,4,6',NULL,30,'Y','2025-06-12 19:13:38',3,'2025-06-12 19:13:38'),(24,9,8,3,'1,4,6',NULL,60,'Y','2025-06-12 19:13:38',3,'2025-06-12 19:13:38'),(25,1,11,1,'7,4,1',NULL,25,'N','2025-06-14 16:26:51',3,'2025-06-16 14:32:13'),(26,2,11,1,'7,4,1',NULL,32,'N','2025-06-14 16:26:51',3,'2025-06-16 14:32:13'),(27,3,11,1,'7,4,1',NULL,69,'N','2025-06-14 16:26:51',3,'2025-06-16 14:32:13'),(28,1,12,1,'4,6,7',NULL,5855,'N','2025-06-14 18:57:20',3,'2025-06-14 19:02:20'),(29,2,12,1,'4,6,7',NULL,848,'N','2025-06-14 18:57:20',3,'2025-06-14 19:02:20'),(30,3,12,1,'4,6,7',NULL,955,'N','2025-06-14 18:57:20',3,'2025-06-14 19:02:20'),(31,1,15,1,'3,5',NULL,2,'N','2025-06-16 14:33:30',3,'2025-06-16 14:50:40'),(32,2,15,1,'3,5',NULL,3,'N','2025-06-16 14:33:30',3,'2025-06-16 14:50:40'),(33,3,15,1,'3,5',NULL,4,'N','2025-06-16 14:33:30',3,'2025-06-16 14:50:40'),(34,1,16,1,'4,5',NULL,2,'N','2025-06-16 14:44:34',3,'2025-06-16 14:50:38'),(35,2,16,1,'4,5',NULL,5,'N','2025-06-16 14:44:34',3,'2025-06-16 14:50:38'),(36,3,16,1,'4,5',NULL,4,'N','2025-06-16 14:44:34',3,'2025-06-16 14:50:38'),(37,1,21,1,'1',NULL,2,'N','2025-06-16 16:24:49',3,'2025-06-16 17:19:03'),(38,2,21,1,'1',NULL,5,'N','2025-06-16 16:24:49',3,'2025-06-16 17:19:03'),(39,3,21,1,'1',NULL,3,'N','2025-06-16 16:24:49',3,'2025-06-16 17:19:03'),(40,1,22,1,'3,5',NULL,5,'N','2025-06-16 16:32:38',3,'2025-06-16 17:19:01'),(41,2,22,1,'3,5',NULL,1,'N','2025-06-16 16:32:38',3,'2025-06-16 17:19:01'),(42,3,22,1,'3,5',NULL,2,'N','2025-06-16 16:32:38',3,'2025-06-16 17:19:01'),(43,1,24,1,'1',NULL,25,'Y','2025-06-16 18:42:26',3,'2025-06-16 18:42:26'),(44,2,24,1,'1',NULL,25,'Y','2025-06-16 18:42:26',3,'2025-06-16 18:42:26'),(45,3,24,1,'1',NULL,25,'Y','2025-06-16 18:42:26',3,'2025-06-16 18:42:26'),(46,4,25,2,'5',NULL,2,'Y','2025-06-16 18:43:35',3,'2025-06-16 18:43:35'),(47,5,25,2,'5',NULL,2,'Y','2025-06-16 18:43:35',3,'2025-06-16 18:43:35'),(48,6,25,2,'5',NULL,2,'Y','2025-06-16 18:43:35',3,'2025-06-16 18:43:35'),(49,7,26,3,'4',NULL,2,'Y','2025-06-16 18:45:33',3,'2025-06-16 18:45:33'),(50,8,26,3,'4',NULL,2,'Y','2025-06-16 18:45:33',3,'2025-06-16 18:45:33'),(51,9,26,3,'4',NULL,5,'Y','2025-06-16 18:45:33',3,'2025-06-16 18:45:33'),(52,1,27,1,'3',NULL,25,'Y','2025-06-18 10:59:53',3,'2025-06-18 10:59:53'),(53,2,27,1,'3',NULL,25,'Y','2025-06-18 10:59:53',3,'2025-06-18 10:59:53'),(54,3,27,1,'3',NULL,25,'Y','2025-06-18 10:59:53',3,'2025-06-18 10:59:53'),(55,4,28,2,'4',NULL,25,'Y','2025-06-18 11:00:49',3,'2025-06-18 11:00:49'),(56,5,28,2,'4',NULL,28,'Y','2025-06-18 11:00:49',3,'2025-06-18 11:00:49'),(57,6,28,2,'4',NULL,28,'Y','2025-06-18 11:00:49',3,'2025-06-18 11:00:49'),(58,7,29,3,'5',NULL,25,'Y','2025-06-18 11:01:46',3,'2025-06-18 11:01:46'),(59,8,29,3,'5',NULL,25,'Y','2025-06-18 11:01:46',3,'2025-06-18 11:01:46'),(60,9,29,3,'5',NULL,25,'Y','2025-06-18 11:01:46',3,'2025-06-18 11:01:46'),(61,1,30,1,'3,5,1',NULL,2,'Y','2025-06-18 11:04:45',3,'2025-06-18 11:04:45'),(62,2,30,1,'3,5,1',NULL,2,'Y','2025-06-18 11:04:45',3,'2025-06-18 11:04:45'),(63,3,30,1,'3,5,1',NULL,36,'Y','2025-06-18 11:04:45',3,'2025-06-18 11:04:45'),(64,1,32,1,'3,5',NULL,25,'Y','2025-06-18 11:06:37',3,'2025-06-18 11:06:37'),(65,2,32,1,'3,5',NULL,25,'Y','2025-06-18 11:06:37',3,'2025-06-18 11:06:37'),(66,3,32,1,'3,5',NULL,25,'Y','2025-06-18 11:06:37',3,'2025-06-18 11:06:37'),(67,7,31,3,'1,3,4,5,6',NULL,2,'Y','2025-06-18 11:07:02',3,'2025-06-18 11:07:02'),(68,8,31,3,'1,3,4,5,6',NULL,2,'Y','2025-06-18 11:07:02',3,'2025-06-18 11:07:02'),(69,9,31,3,'1,3,4,5,6',NULL,2,'Y','2025-06-18 11:07:02',3,'2025-06-18 11:07:02'),(70,4,33,2,'5',NULL,25,'Y','2025-06-18 11:07:21',3,'2025-06-18 11:07:21'),(71,5,33,2,'5',NULL,25,'Y','2025-06-18 11:07:21',3,'2025-06-18 11:07:21'),(72,6,33,2,'5',NULL,28,'Y','2025-06-18 11:07:21',3,'2025-06-18 11:07:21'),(73,7,34,3,'5',NULL,25,'Y','2025-06-18 11:08:08',3,'2025-06-18 11:08:08'),(74,8,34,3,'5',NULL,25,'Y','2025-06-18 11:08:08',3,'2025-06-18 11:08:08'),(75,9,34,3,'5',NULL,25,'Y','2025-06-18 11:08:08',3,'2025-06-18 11:08:08'),(76,7,48,3,'3,5',NULL,10,'Y','2025-06-23 17:13:26',3,'2025-06-23 17:13:26'),(77,8,48,3,'3,5',NULL,60,'Y','2025-06-23 17:13:26',3,'2025-06-23 17:13:26'),(78,9,48,3,'3,5',NULL,10,'Y','2025-06-23 17:13:26',3,'2025-06-23 17:13:26'),(79,7,49,3,'55,Tel,42',NULL,10,'Y','2025-06-23 17:53:06',3,'2025-06-23 17:53:06'),(80,8,49,3,'55,Tel,42',NULL,10,'Y','2025-06-23 17:53:06',3,'2025-06-23 17:53:06'),(81,9,49,3,'55,Tel,42',NULL,10,'Y','2025-06-23 17:53:06',3,'2025-06-23 17:53:06'),(82,1,50,1,'2,3',NULL,1,'N','2025-06-23 17:55:29',3,'2025-06-23 19:19:53'),(83,2,50,1,'2,3',NULL,1,'N','2025-06-23 17:55:29',3,'2025-06-23 19:19:53'),(84,3,50,1,'2,3',NULL,1,'N','2025-06-23 17:55:29',3,'2025-06-23 19:19:53'),(85,4,75,2,'1,2',NULL,10,'N','2025-06-24 12:11:53',3,'2025-06-24 12:18:20'),(86,5,75,2,'1,2',NULL,2,'N','2025-06-24 12:11:53',3,'2025-06-24 12:18:20'),(87,6,75,2,'1,2',NULL,6,'N','2025-06-24 12:11:53',3,'2025-06-24 12:18:20'),(88,1,78,1,'51',NULL,25,'Y','2025-06-24 12:44:17',3,'2025-06-24 12:44:17'),(89,2,78,1,'51',NULL,25,'Y','2025-06-24 12:44:17',3,'2025-06-24 12:44:17'),(90,3,78,1,'51',NULL,25,'Y','2025-06-24 12:44:17',3,'2025-06-24 12:44:17'),(91,7,79,3,'47,50,41',NULL,25,'Y','2025-06-24 12:46:08',3,'2025-06-24 12:46:08'),(92,8,79,3,'47,50,41',NULL,288,'Y','2025-06-24 12:46:08',3,'2025-06-24 12:46:08'),(93,9,79,3,'47,50,41',NULL,58,'Y','2025-06-24 12:46:08',3,'2025-06-24 12:46:08'),(94,4,80,2,'4',NULL,25,'Y','2025-06-24 12:47:32',3,'2025-06-24 12:47:32'),(95,5,80,2,'4',NULL,28,'Y','2025-06-24 12:47:32',3,'2025-06-24 12:47:32'),(96,6,80,2,'4',NULL,28,'Y','2025-06-24 12:47:32',3,'2025-06-24 12:47:32'),(97,4,87,2,'3,2',NULL,2,'N','2025-06-27 14:05:30',3,'2025-07-30 12:02:17'),(98,5,87,2,'3,2',NULL,3,'N','2025-06-27 14:05:30',3,'2025-07-30 12:02:17'),(99,6,87,2,'3,2',NULL,4,'N','2025-06-27 14:05:30',3,'2025-07-30 12:02:17'),(100,7,88,3,'1',NULL,10,'Y','2025-06-27 14:08:09',3,'2025-06-27 14:08:09'),(101,8,88,3,'1',NULL,10,'Y','2025-06-27 14:08:09',3,'2025-06-27 14:08:09'),(102,9,88,3,'1',NULL,10,'Y','2025-06-27 14:08:09',3,'2025-06-27 14:08:09'),(103,7,91,3,'42,44',NULL,15,'N','2025-07-02 13:01:57',3,'2025-07-17 12:06:04'),(104,8,91,3,'42,44',NULL,3,'N','2025-07-02 13:01:57',3,'2025-07-17 12:06:04'),(105,9,91,3,'42,44',NULL,2,'N','2025-07-02 13:01:57',3,'2025-07-17 12:06:04'),(106,4,102,2,'42,11,12,14',NULL,30,'N','2025-07-25 16:03:39',3,'2025-07-30 12:02:14'),(107,5,102,2,'42,11,12,14',NULL,20,'N','2025-07-25 16:03:39',3,'2025-07-30 12:02:14'),(108,6,102,2,'42,11,12,14',NULL,5,'N','2025-07-25 16:03:39',3,'2025-07-30 12:02:14'),(109,4,104,2,'2',NULL,10,'N','2025-07-30 12:03:38',3,'2025-07-30 12:07:44'),(110,5,104,2,'2',NULL,10,'N','2025-07-30 12:03:38',3,'2025-07-30 12:07:44'),(111,6,104,2,'2',NULL,10,'N','2025-07-30 12:03:38',3,'2025-07-30 12:07:44'),(112,4,105,2,'3',NULL,1,'N','2025-07-30 12:08:38',3,'2025-07-30 14:57:16'),(113,5,105,2,'3',NULL,1,'N','2025-07-30 12:08:38',3,'2025-07-30 14:57:16'),(114,6,105,2,'3',NULL,1,'N','2025-07-30 12:08:38',3,'2025-07-30 14:57:16'),(118,4,106,2,'','Nutra,alpha',10,'N','2025-07-30 15:00:19',3,'2025-07-30 15:10:48'),(119,5,106,2,'','Nutra,alpha',10,'N','2025-07-30 15:00:19',3,'2025-07-30 15:10:48'),(120,6,106,2,'','Nutra,alpha',1,'N','2025-07-30 15:00:19',3,'2025-07-30 15:10:48'),(121,4,107,2,'','Nutra, zesta',1,'N','2025-07-30 15:12:05',3,'2025-07-30 15:27:30'),(122,5,107,2,'','Nutra, zesta',1,'N','2025-07-30 15:12:05',3,'2025-07-30 15:27:30'),(123,6,107,2,'','Nutra, zesta',1,'N','2025-07-30 15:12:05',3,'2025-07-30 15:27:30'),(124,4,108,2,'2,4','Zesta,alpha,cresta',1,'Y','2025-07-30 15:28:17',3,'2025-07-30 15:52:23'),(125,5,108,2,'2,4','Zesta,alpha,cresta',1,'Y','2025-07-30 15:28:17',3,'2025-07-30 15:52:23'),(126,6,108,2,'2,4','Zesta,alpha,cresta',1,'Y','2025-07-30 15:28:17',3,'2025-07-30 15:52:23'),(127,1,109,1,'9,1','Dolo , Digene , Montelucast',1,'N','2025-08-02 12:50:58',3,'2025-08-02 14:31:31'),(128,2,109,1,'9,1','Dolo , Digene , Montelucast',1,'N','2025-08-02 12:50:58',3,'2025-08-02 14:31:31'),(129,3,109,1,'9,1','Dolo , Digene , Montelucast',1,'N','2025-08-02 12:50:58',3,'2025-08-02 14:31:31'),(130,1,110,1,'1,3,6','Dolo, Digene, Montelucast',5,'N','2025-08-02 12:55:35',3,'2025-08-02 14:31:29'),(131,2,110,1,'1,3,6','Dolo, Digene, Montelucast',3,'N','2025-08-02 12:55:35',3,'2025-08-02 14:31:29'),(132,3,110,1,'1,3,6','Dolo, Digene, Montelucast',1,'N','2025-08-02 12:55:35',3,'2025-08-02 14:31:29'),(133,7,111,3,'2,4','',20,'N','2025-08-02 13:47:13',3,'2025-08-02 14:36:30'),(134,8,111,3,'2,4','',30,'N','2025-08-02 13:47:13',3,'2025-08-02 14:36:30'),(135,9,111,3,'2,4','',10,'N','2025-08-02 13:47:13',3,'2025-08-02 14:36:30'),(136,1,112,1,'','Dolo',2,'Y','2025-08-02 14:33:04',3,'2025-08-02 14:33:04'),(137,2,112,1,'','Dolo',3,'Y','2025-08-02 14:33:04',3,'2025-08-02 14:33:04'),(138,3,112,1,'','Dolo',4,'Y','2025-08-02 14:33:04',3,'2025-08-02 14:33:04'),(139,7,113,3,'10,12','',2,'Y','2025-08-02 14:37:19',3,'2025-08-02 14:37:19'),(140,8,113,3,'10,12','',3,'Y','2025-08-02 14:37:19',3,'2025-08-02 14:37:19'),(141,9,113,3,'10,12','',5,'Y','2025-08-02 14:37:19',3,'2025-08-02 14:37:19'),(142,4,114,2,'5,4,1','Dolo, Digene, Montelukast',5,'Y','2025-08-02 14:50:13',3,'2025-08-07 15:55:08'),(143,5,114,2,'5,4,1','Dolo, Digene, Montelukast',3,'Y','2025-08-02 14:50:13',3,'2025-08-07 15:55:08'),(144,6,114,2,'5,4,1','Dolo, Digene, Montelukast',2,'Y','2025-08-02 14:50:13',3,'2025-08-07 15:55:08'),(145,7,115,3,'53,48,51,49','Dolo, Magran, Digene',15,'Y','2025-08-02 14:52:12',3,'2025-08-02 14:52:12'),(146,8,115,3,'53,48,51,49','Dolo, Magran, Digene',10,'Y','2025-08-02 14:52:12',3,'2025-08-02 14:52:12'),(147,9,115,3,'53,48,51,49','Dolo, Magran, Digene',8,'Y','2025-08-02 14:52:12',3,'2025-08-02 14:52:12');
/*!40000 ALTER TABLE `question_camp_rep_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_ques_mst`
--

DROP TABLE IF EXISTS `report_ques_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_ques_mst` (
  `rqid` int NOT NULL AUTO_INCREMENT,
  `subcat_id` int NOT NULL,
  `question` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`rqid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_ques_mst`
--

LOCK TABLES `report_ques_mst` WRITE;
/*!40000 ALTER TABLE `report_ques_mst` DISABLE KEYS */;
INSERT INTO `report_ques_mst` VALUES (1,1,'Number of Patients Screened','Y'),(2,1,'Number of patients diagnosed','Y'),(3,1,'Number of Rx generated','Y'),(4,2,'Number of Patients Screened','Y'),(5,2,'Number of patients diagnosed','Y'),(6,2,'Number of Rx generated','Y'),(7,3,'Number of Patients Screened','Y'),(8,3,'Number of patients diagnosed','Y'),(9,3,'Number of Rx generated','Y');
/*!40000 ALTER TABLE `report_ques_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_mst`
--

DROP TABLE IF EXISTS `role_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_mst` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_mst`
--

LOCK TABLES `role_mst` WRITE;
/*!40000 ALTER TABLE `role_mst` DISABLE KEYS */;
INSERT INTO `role_mst` VALUES (1,'Top Line',1),(2,'3rd Line',1),(3,'2nd Line',1),(4,'1st Line',1),(5,'MR',1);
/*!40000 ALTER TABLE `role_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(200) NOT NULL,
  `zone_id` int NOT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Andaman & Nicobar Islands',3,'Y'),(2,'Andhra Pradesh',4,'Y'),(3,'Arunachal Pradesh',3,'Y'),(4,'Assam',1,'Y'),(5,'Bihar',3,'Y'),(6,'Chandigarh',1,'Y'),(7,'Chhattisgarh',3,'Y'),(8,'Dadra & Nagar Haveli',2,'Y'),(9,'Daman & Diu',2,'Y'),(10,'Delhi',1,'Y'),(11,'Goa',2,'Y'),(12,'Gujarat',2,'Y'),(13,'Haryana',1,'Y'),(14,'Himachal Pradesh',1,'Y'),(15,'Jammu & Kashmir',1,'Y'),(16,'Jharkhand',3,'Y'),(17,'Karnataka',4,'Y'),(18,'Kerala',4,'Y'),(19,'Lakshadweep',4,'Y'),(20,'Madhya Pradesh',2,'Y'),(21,'Maharashtra',2,'Y'),(22,'Manipur',3,'Y'),(23,'Meghalaya',1,'Y'),(24,'Mizoram',3,'Y'),(25,'Nagaland',3,'Y'),(26,'Odisha',3,'Y'),(27,'Puducherry',4,'Y'),(28,'Punjab',1,'Y'),(29,'Rajasthan',1,'Y'),(30,'Sikkim',3,'Y'),(31,'Tamil Nadu',4,'Y'),(32,'Telangana',4,'Y'),(33,'Tripura',3,'Y'),(34,'Uttar Pradesh',1,'Y'),(35,'Uttarakhand',1,'Y'),(36,'West Bengal',3,'Y'),(37,'Mumbai',2,'Y'),(38,'Chennai',4,'Y');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory_mst`
--

DROP TABLE IF EXISTS `subcategory_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory_mst` (
  `subcategory_id` int NOT NULL AUTO_INCREMENT,
  `subcategory_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `display_order` int NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory_mst`
--

LOCK TABLES `subcategory_mst` WRITE;
/*!40000 ALTER TABLE `subcategory_mst` DISABLE KEYS */;
INSERT INTO `subcategory_mst` VALUES (1,'BP Camp',1,'Y','2023-08-31 13:45:27'),(2,'BP + ECG Camp',2,'Y','2023-08-31 13:46:26'),(3,'Lipid Camp',3,'Y','2023-08-31 13:46:26');
/*!40000 ALTER TABLE `subcategory_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_dtl`
--

DROP TABLE IF EXISTS `user_login_dtl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_dtl` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `login_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_dtl`
--

LOCK TABLES `user_login_dtl` WRITE;
/*!40000 ALTER TABLE `user_login_dtl` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_dtl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_history`
--

DROP TABLE IF EXISTS `user_login_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login_history` (
  `lh_id` int NOT NULL AUTO_INCREMENT,
  `session_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `login_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`lh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_history`
--

LOCK TABLES `user_login_history` WRITE;
/*!40000 ALTER TABLE `user_login_history` DISABLE KEYS */;
INSERT INTO `user_login_history` VALUES (11,NULL,9,'2024-07-17 17:16:15','2024-07-17 18:38:43'),(12,NULL,9,'2024-07-17 18:40:25','2024-07-17 18:42:13'),(13,NULL,218,'2024-07-17 18:42:34','2024-07-17 18:42:52'),(14,NULL,35,'2024-07-17 18:53:17','2024-07-17 18:53:41'),(15,NULL,155,'2024-07-17 18:54:57','2024-07-17 18:55:06'),(16,NULL,24,'2024-07-17 18:55:50','2024-07-17 18:56:15'),(17,NULL,35,'2024-07-17 18:56:37','2024-07-17 18:57:54'),(18,NULL,24,'2024-07-17 18:58:50','2024-07-17 19:00:47'),(19,NULL,35,'2024-07-17 19:01:07','2024-07-17 19:01:19'),(20,NULL,24,'2024-07-17 19:02:01','2024-07-17 19:02:01'),(21,NULL,3,'2024-07-22 12:43:20','2025-03-10 13:20:05'),(22,NULL,1,'2024-07-23 10:00:23','2024-07-23 10:00:23'),(23,NULL,1,'2024-07-23 12:44:15','2024-07-23 12:44:15'),(24,NULL,1,'2024-07-23 16:12:03','2024-07-23 16:31:36'),(25,NULL,1,'2024-07-24 15:36:57','2024-07-24 15:36:57'),(26,NULL,1,'2024-07-29 10:12:54','2024-07-29 10:12:54'),(27,NULL,1,'2024-07-30 15:19:53','2024-07-30 15:19:53'),(28,NULL,124,'2024-08-06 16:58:22','2024-08-06 16:58:21'),(29,NULL,113,'2024-08-06 16:58:23','2024-09-23 22:25:51'),(30,NULL,129,'2024-08-06 16:58:28','2024-10-21 12:04:26'),(31,NULL,104,'2024-08-06 16:58:33','2024-08-06 16:58:33'),(32,NULL,120,'2024-08-06 16:58:35','2024-08-06 16:58:35'),(33,NULL,134,'2024-08-06 16:58:56','2024-08-06 17:32:08'),(34,NULL,3,'2024-08-06 18:44:02','2024-08-06 18:44:01'),(35,NULL,14,'2024-08-06 18:53:31','2024-08-06 19:00:23'),(36,NULL,25,'2024-08-06 19:02:00','2024-08-06 19:05:01'),(37,NULL,213,'2024-08-07 16:00:44','2024-08-28 22:21:51'),(38,NULL,165,'2024-08-07 16:02:05','2024-11-10 18:03:55'),(39,NULL,156,'2024-08-07 16:03:00','2024-08-07 16:24:50'),(40,NULL,198,'2024-08-07 16:03:52','2024-08-07 16:03:52'),(41,NULL,172,'2024-08-07 17:16:17','2024-08-07 17:16:16'),(42,NULL,192,'2024-08-07 17:16:20','2024-12-26 09:55:22'),(43,NULL,141,'2024-08-07 17:16:22','2024-08-07 17:16:22'),(44,NULL,177,'2024-08-07 17:16:22','2024-08-07 17:40:24'),(45,NULL,146,'2024-08-07 17:16:24','2024-08-07 17:16:23'),(46,NULL,182,'2024-08-07 17:16:30','2024-08-07 17:16:30'),(47,NULL,187,'2024-08-07 17:16:35','2024-08-07 17:16:34'),(48,NULL,185,'2024-08-07 17:16:47','2024-08-07 17:16:47'),(49,NULL,151,'2024-08-07 17:16:56','2025-01-25 21:48:09'),(50,NULL,172,'2024-08-07 17:22:47','2024-08-07 17:22:47'),(51,NULL,171,'2024-08-07 17:25:33','2024-08-07 17:25:32'),(52,NULL,203,'2024-08-08 07:17:14','2024-12-25 21:29:45'),(53,NULL,1,'2024-08-08 12:36:32','2024-08-08 12:36:31'),(54,NULL,1,'2024-08-08 13:12:19','2024-08-08 13:12:19'),(55,NULL,3,'2024-08-08 13:44:38','2024-08-08 13:45:04'),(56,NULL,1,'2024-08-08 18:26:21','2024-08-08 18:26:20'),(57,NULL,1,'2024-08-09 12:19:36','2024-08-13 16:21:10'),(58,NULL,3,'2024-08-09 12:41:38','2024-08-09 12:41:38'),(59,NULL,108,'2024-08-09 21:34:38','2024-08-09 21:34:37'),(60,NULL,3,'2024-08-10 16:08:25','2024-08-10 16:08:25'),(61,NULL,9,'2024-08-10 16:10:23','2024-12-25 20:21:29'),(62,NULL,14,'2024-08-10 16:13:06','2024-08-10 16:13:06'),(63,NULL,35,'2024-08-10 16:26:45','2024-08-10 19:18:23'),(64,NULL,25,'2024-08-10 16:30:06','2024-08-10 16:30:05'),(65,NULL,74,'2024-08-10 16:42:57','2024-08-10 16:42:57'),(66,NULL,79,'2024-08-10 16:43:00','2024-08-10 16:42:59'),(67,NULL,42,'2024-08-10 16:43:00','2024-08-10 16:43:00'),(68,NULL,69,'2024-08-10 16:43:02','2024-08-10 16:43:02'),(69,NULL,52,'2024-08-10 16:45:36','2024-08-10 16:45:36'),(70,NULL,94,'2024-08-10 16:46:11','2024-08-10 16:46:11'),(71,NULL,47,'2024-08-10 16:46:41','2024-08-10 16:46:40'),(72,NULL,89,'2024-08-10 16:46:47','2024-08-10 16:46:47'),(73,NULL,59,'2024-08-10 16:47:17','2024-08-10 16:47:16'),(74,NULL,3,'2024-08-10 17:49:43','2024-08-10 17:50:09'),(75,NULL,1,'2024-08-10 17:50:39','2024-08-10 17:50:39'),(76,NULL,1,'2024-08-11 06:47:01','2024-08-11 06:47:00'),(77,NULL,35,'2024-08-11 17:39:57','2024-08-11 17:39:57'),(78,NULL,3,'2024-08-12 10:26:26','2024-08-12 14:15:34'),(79,NULL,69,'2024-08-12 12:24:39','2024-08-12 12:24:38'),(80,NULL,19,'2024-08-12 14:16:28','2024-08-12 14:36:54'),(81,NULL,19,'2024-08-12 14:38:23','2024-08-13 10:29:25'),(82,NULL,1,'2024-08-12 14:49:20','2024-08-12 14:50:10'),(83,NULL,583,'2024-08-12 14:53:50','2024-08-12 15:00:06'),(84,NULL,583,'2024-08-12 15:00:29','2024-08-12 15:19:53'),(85,NULL,1,'2024-08-12 15:20:05','2024-08-12 15:22:51'),(86,NULL,583,'2024-08-12 15:23:02','2024-08-14 10:56:22'),(87,NULL,583,'2024-08-12 15:30:17','2024-08-12 15:35:47'),(88,NULL,1,'2024-08-12 15:36:07','2024-08-12 15:36:44'),(89,NULL,583,'2024-08-12 15:37:23','2024-08-12 15:37:23'),(90,NULL,1,'2024-08-12 16:48:19','2024-08-12 16:58:27'),(91,NULL,1,'2024-08-12 17:00:21','2024-08-12 17:00:20'),(92,NULL,69,'2024-08-13 10:29:41','2024-08-13 10:29:41'),(93,NULL,69,'2024-08-13 13:08:24','2024-08-13 13:14:33'),(94,NULL,69,'2024-08-13 13:14:56','2024-08-13 13:18:00'),(95,NULL,3,'2024-08-13 13:22:53','2024-08-13 13:23:57'),(96,NULL,3,'2024-08-13 13:24:26','2024-08-13 13:25:12'),(97,NULL,25,'2024-08-13 13:25:41','2024-08-13 13:31:18'),(98,NULL,1,'2024-08-13 13:28:07','2024-08-13 13:28:07'),(99,NULL,141,'2024-08-13 13:31:41','2024-08-13 13:34:10'),(100,NULL,85,'2024-08-13 13:34:48','2024-08-13 16:33:03'),(101,NULL,1,'2024-08-13 15:04:35','2024-08-13 15:07:39'),(102,NULL,3,'2024-08-13 15:08:04','2024-08-13 15:10:14'),(103,NULL,1,'2024-08-13 15:10:52','2024-08-13 15:10:52'),(104,NULL,69,'2024-08-13 16:21:27','2024-08-13 16:22:35'),(105,NULL,3,'2024-08-13 16:23:42','2024-08-13 16:23:42'),(106,NULL,69,'2024-08-13 16:33:32','2024-08-13 16:35:43'),(107,NULL,3,'2024-08-13 16:36:02','2024-08-14 11:58:05'),(108,NULL,3,'2024-08-14 10:56:58','2024-08-14 10:57:30'),(109,NULL,3,'2024-08-14 10:57:55','2024-08-14 10:58:56'),(110,NULL,14,'2024-08-14 10:59:41','2024-08-14 11:00:14'),(111,NULL,19,'2024-08-14 11:00:43','2024-08-14 11:02:29'),(112,NULL,25,'2024-08-14 11:03:05','2024-08-14 11:04:28'),(113,NULL,69,'2024-08-14 11:58:20','2024-08-14 11:59:14'),(114,NULL,69,'2024-08-14 11:59:48','2024-08-22 17:14:36'),(115,NULL,1,'2024-08-17 11:46:31','2024-08-17 14:47:30'),(116,NULL,99,'2024-08-19 00:34:49','2024-08-19 00:34:48'),(117,NULL,1,'2024-08-19 18:32:08','2024-08-19 18:33:11'),(118,NULL,1,'2024-08-19 18:33:46','2024-08-19 18:33:45'),(119,NULL,1,'2024-08-19 19:15:08','2024-08-19 19:15:07'),(120,NULL,1,'2024-08-22 17:14:55','2024-08-22 17:15:14'),(121,NULL,1,'2024-08-22 17:15:48','2024-08-22 17:17:45'),(122,NULL,9,'2024-08-22 17:18:06','2024-08-22 17:18:32'),(123,NULL,3,'2024-08-22 17:19:27','2024-08-22 17:20:22'),(124,NULL,1,'2024-08-22 17:21:02','2024-08-29 10:02:12'),(125,NULL,177,'2024-08-24 12:07:46','2024-10-23 11:57:42'),(126,NULL,213,'2024-08-29 10:03:56','2024-08-29 10:04:39'),(127,NULL,213,'2024-08-29 10:05:05','2024-08-29 10:15:04'),(128,NULL,213,'2024-08-29 10:15:43','2024-08-29 10:26:20'),(129,NULL,213,'2024-08-29 12:43:57','2024-08-29 12:43:57'),(130,NULL,261,'2024-09-17 13:30:10','2024-09-19 22:54:03'),(131,NULL,265,'2024-09-18 15:50:53','2024-09-27 11:51:52'),(132,NULL,261,'2024-09-19 22:54:20','2024-09-19 22:56:13'),(133,NULL,3,'2024-09-25 14:27:18','2024-09-27 08:48:52'),(134,NULL,265,'2024-09-27 08:49:17','2024-09-27 08:51:27'),(135,NULL,265,'2024-09-27 08:52:06','2024-09-27 08:52:05'),(136,NULL,1,'2024-09-27 10:07:23','2024-09-27 10:07:22'),(137,NULL,1,'2024-09-27 10:09:44','2024-09-27 12:35:53'),(138,NULL,265,'2024-09-27 11:55:56','2024-09-27 11:55:55'),(139,NULL,265,'2024-09-27 11:58:37','2024-09-27 11:58:36'),(140,NULL,1,'2024-09-27 12:37:35','2024-12-13 15:06:42'),(141,NULL,1,'2024-09-27 13:07:25','2024-09-27 13:07:24'),(142,NULL,1,'2024-09-27 13:22:04','2024-09-27 13:22:04'),(143,NULL,265,'2024-09-27 15:02:55','2024-10-04 16:50:43'),(144,NULL,237,'2024-10-04 15:15:53','2024-10-04 15:15:52'),(145,NULL,160,'2024-10-04 15:18:55','2024-10-04 15:18:55'),(146,NULL,172,'2024-10-04 16:51:24','2024-10-23 11:59:12'),(147,NULL,1,'2024-10-17 11:23:18','2024-10-17 11:23:41'),(148,NULL,1,'2024-10-17 11:23:54','2024-10-17 11:23:53'),(149,NULL,281,'2024-10-19 08:28:40','2024-10-19 08:28:39'),(150,NULL,177,'2024-10-24 10:50:38','2024-10-24 11:17:15'),(151,NULL,177,'2024-10-24 11:21:22','2024-10-24 11:22:40'),(152,NULL,59,'2024-10-29 00:14:40','2024-10-29 00:14:39'),(153,NULL,585,'2024-11-05 12:46:23','2024-11-05 12:46:34'),(154,NULL,585,'2024-11-05 12:48:20','2024-11-05 16:06:18'),(155,NULL,59,'2024-11-05 16:03:19','2024-11-05 16:04:36'),(156,NULL,59,'2024-11-05 16:06:35','2024-11-06 12:41:21'),(157,NULL,253,'2024-11-06 12:42:57','2024-11-06 12:43:17'),(158,NULL,3,'2024-11-06 12:44:17','2024-11-06 12:44:31'),(159,NULL,3,'2024-11-06 12:44:53','2024-11-06 12:45:19'),(160,NULL,3,'2024-11-06 12:46:21','2024-11-06 12:46:34'),(161,NULL,253,'2024-11-06 12:47:07','2024-11-06 12:47:21'),(162,NULL,253,'2024-11-06 16:03:15','2024-11-06 16:04:03'),(163,NULL,3,'2024-11-06 16:04:36','2024-11-07 10:59:34'),(164,NULL,585,'2024-11-06 16:50:25','2024-11-06 16:55:57'),(165,NULL,3,'2024-11-06 16:56:27','2024-11-06 16:57:49'),(166,NULL,14,'2024-11-06 16:58:11','2024-11-06 16:58:35'),(167,NULL,253,'2024-11-06 16:58:53','2024-11-06 16:59:19'),(168,NULL,203,'2024-11-06 16:59:45','2024-11-06 16:59:56'),(169,NULL,14,'2024-11-06 17:01:44','2024-11-06 17:29:40'),(170,NULL,3,'2024-11-06 17:04:09','2024-11-11 14:47:48'),(171,NULL,3,'2024-11-06 17:30:00','2024-11-07 10:46:08'),(172,NULL,253,'2024-11-07 09:46:33','2024-11-07 09:46:33'),(173,NULL,253,'2024-11-07 10:46:24','2024-11-07 10:47:18'),(174,NULL,253,'2024-11-07 10:47:45','2024-11-08 14:54:12'),(175,NULL,253,'2024-11-07 11:27:30','2024-11-07 11:47:21'),(176,NULL,253,'2024-11-07 11:49:44','2024-11-07 11:54:45'),(177,NULL,253,'2024-11-07 11:50:39','2024-11-07 11:50:39'),(178,NULL,253,'2024-11-07 11:55:45','2024-11-07 12:07:39'),(179,NULL,253,'2024-11-07 12:00:35','2024-11-07 12:00:34'),(180,NULL,253,'2024-11-07 12:12:51','2024-11-07 12:12:50'),(181,NULL,253,'2024-11-07 15:31:44','2024-11-07 15:31:44'),(182,NULL,248,'2024-11-08 09:50:58','2024-11-08 15:51:38'),(183,NULL,222,'2024-11-08 14:10:25','2024-11-08 14:10:49'),(184,NULL,222,'2024-11-08 14:11:01','2024-11-08 14:11:07'),(185,NULL,594,'2024-11-08 14:13:31','2024-11-08 14:13:40'),(186,NULL,35,'2024-11-08 14:13:53','2024-11-08 14:17:11'),(187,NULL,248,'2024-11-08 14:17:23','2024-11-08 14:17:44'),(188,NULL,594,'2024-11-08 14:54:29','2024-11-08 14:54:45'),(189,NULL,594,'2024-11-08 14:55:47','2024-11-08 14:56:56'),(190,NULL,248,'2024-11-08 14:57:12','2024-11-08 14:58:19'),(191,NULL,35,'2024-11-08 14:58:37','2024-11-08 15:08:28'),(192,NULL,248,'2024-11-08 15:51:51','2024-11-08 15:52:08'),(193,NULL,248,'2024-11-08 15:52:20','2024-11-10 10:15:24'),(194,NULL,248,'2024-11-10 10:15:45','2024-11-10 10:15:54'),(195,NULL,248,'2024-11-10 10:16:03','2024-11-10 10:16:02'),(196,NULL,165,'2024-11-10 18:04:11','2024-11-10 18:04:10'),(197,NULL,177,'2024-11-11 11:33:42','2024-11-11 11:38:04'),(198,NULL,594,'2024-11-11 13:16:48','2024-11-11 13:16:47'),(199,NULL,248,'2024-11-11 14:47:06','2024-12-13 14:27:54'),(200,NULL,248,'2024-11-11 14:48:04','2024-11-11 14:48:03'),(201,NULL,1,'2024-11-20 08:32:26','2024-11-20 08:32:25'),(202,NULL,585,'2024-11-22 20:37:13','2024-11-22 20:37:13'),(203,NULL,1,'2024-12-08 16:38:43','2024-12-08 16:38:43'),(204,NULL,172,'2024-12-13 14:28:28','2024-12-24 14:48:31'),(205,NULL,172,'2024-12-13 15:07:16','2024-12-13 15:08:09'),(206,NULL,172,'2024-12-13 15:43:26','2024-12-13 15:43:26'),(207,NULL,3,'2024-12-23 21:49:31','2024-12-24 07:26:35'),(208,NULL,265,'2024-12-24 07:26:56','2025-03-19 18:19:47'),(209,NULL,177,'2024-12-24 10:53:24','2024-12-24 13:25:32'),(210,NULL,177,'2024-12-24 14:51:19','2024-12-25 19:00:26'),(211,NULL,129,'2024-12-24 18:49:56','2024-12-24 18:49:55'),(212,NULL,68,'2024-12-24 20:33:38','2025-01-08 20:51:52'),(213,NULL,177,'2024-12-24 21:07:56','2024-12-24 21:11:41'),(214,NULL,24,'2024-12-25 12:16:19','2024-12-25 12:16:18'),(215,NULL,213,'2024-12-25 12:40:44','2024-12-25 12:40:44'),(216,NULL,30,'2024-12-25 15:49:53','2024-12-25 16:43:08'),(217,NULL,192,'2024-12-25 19:00:42','2025-03-05 18:41:11'),(218,NULL,9,'2024-12-25 20:30:04','2024-12-25 20:30:21'),(219,NULL,11,'2024-12-25 20:30:38','2025-05-08 09:25:39'),(220,NULL,11,'2024-12-25 20:33:00','2024-12-25 20:32:59'),(221,NULL,238,'2024-12-25 21:46:25','2024-12-25 21:46:25'),(222,NULL,68,'2025-01-08 21:15:40','2025-01-08 21:15:40'),(223,NULL,177,'2025-01-24 21:35:09','2025-01-24 21:39:36'),(224,NULL,203,'2025-01-24 23:24:43','2025-01-24 23:24:43'),(225,NULL,192,'2025-01-25 14:57:05','2025-01-25 14:57:05'),(226,NULL,156,'2025-01-25 16:00:50','2025-01-25 16:12:46'),(227,NULL,151,'2025-01-25 21:48:32','2025-01-25 21:48:31'),(228,NULL,172,'2025-02-07 18:46:59','2025-02-07 18:46:58'),(229,NULL,177,'2025-02-21 09:36:02','2025-02-21 10:03:41'),(230,NULL,197,'2025-02-24 14:32:01','2025-02-24 14:32:00'),(231,NULL,261,'2025-03-04 16:41:32','2025-03-04 16:41:31'),(232,NULL,602,'2025-03-04 17:02:36','2025-03-04 17:02:49'),(233,NULL,598,'2025-03-04 17:07:46','2025-03-04 17:07:45'),(234,NULL,261,'2025-03-05 18:41:46','2025-03-05 18:52:42'),(235,NULL,598,'2025-03-05 18:52:56','2025-03-05 18:52:56'),(236,NULL,598,'2025-03-06 10:39:01','2025-03-06 10:39:01'),(237,NULL,177,'2025-03-08 12:38:55','2025-03-08 12:48:37'),(238,NULL,599,'2025-03-17 18:26:34','2025-03-17 18:26:33'),(239,NULL,177,'2025-04-09 12:01:22','2025-04-09 12:13:56'),(240,NULL,172,'2025-04-11 18:36:12','2025-04-11 18:36:12'),(241,NULL,3,'2025-04-17 19:37:17','2025-04-17 19:37:21'),(242,NULL,1,'2025-05-08 10:04:21','2025-05-08 10:04:21'),(243,NULL,3,'2025-05-27 12:43:26','2025-05-27 12:43:25'),(244,NULL,77,'2025-05-28 16:15:10','2025-05-28 16:15:09'),(245,NULL,3,'2025-06-04 10:39:30','2025-06-04 10:39:53'),(246,NULL,3,'2025-06-04 12:06:49','2025-06-04 12:06:48'),(247,NULL,3,'2025-06-04 12:52:15','2025-06-04 12:56:06'),(248,NULL,3,'2025-06-06 15:44:10','2025-06-06 15:44:10'),(249,NULL,3,'2025-06-06 15:49:45','2025-06-14 17:14:24'),(250,NULL,3,'2025-06-14 17:25:37','2025-06-14 17:25:36'),(251,NULL,3,'2025-06-14 19:29:49','2025-06-14 19:29:48'),(252,NULL,3,'2025-06-16 10:24:14','2025-06-16 10:42:22'),(253,NULL,3,'2025-06-16 10:42:40','2025-06-16 10:42:39'),(254,NULL,3,'2025-06-16 11:08:58','2025-06-16 11:08:58'),(255,NULL,3,'2025-06-16 14:23:13','2025-06-16 14:23:13'),(256,NULL,3,'2025-06-16 14:36:43','2025-06-16 14:36:42'),(257,NULL,3,'2025-06-16 14:58:06','2025-06-16 14:58:05'),(258,NULL,3,'2025-06-16 15:13:54','2025-06-16 15:13:53'),(259,NULL,3,'2025-06-16 15:19:52','2025-06-16 15:19:51'),(260,NULL,3,'2025-06-16 15:42:02','2025-06-16 15:42:02'),(261,NULL,3,'2025-06-16 15:50:19','2025-06-16 15:50:18'),(262,NULL,3,'2025-06-16 16:16:21','2025-06-16 16:16:21'),(263,NULL,3,'2025-06-16 18:11:04','2025-06-16 18:11:03'),(264,NULL,3,'2025-06-16 18:37:10','2025-06-18 10:56:03'),(265,NULL,3,'2025-06-18 10:57:33','2025-06-18 11:03:43'),(266,NULL,3,'2025-06-18 10:58:58','2025-06-18 10:58:58'),(267,NULL,3,'2025-06-18 11:04:09','2025-06-20 17:32:47'),(268,NULL,3,'2025-06-18 11:20:03','2025-06-18 11:20:03'),(269,NULL,3,'2025-06-20 17:33:35','2025-06-20 17:33:35'),(270,NULL,3,'2025-06-23 18:45:51','2025-06-23 18:45:50'),(271,NULL,3,'2025-06-23 18:57:04','2025-06-23 18:57:03'),(272,NULL,3,'2025-06-23 19:14:49','2025-06-23 19:14:49'),(273,NULL,3,'2025-06-23 19:17:52','2025-06-23 19:17:51'),(274,NULL,3,'2025-06-23 19:49:30','2025-06-23 19:49:29'),(275,NULL,3,'2025-06-23 20:08:29','2025-06-23 20:08:28'),(276,NULL,3,'2025-06-23 20:49:21','2025-06-23 20:49:20'),(277,NULL,3,'2025-06-24 09:50:29','2025-06-24 09:50:28'),(278,NULL,3,'2025-06-24 10:44:06','2025-06-24 10:44:05'),(279,NULL,3,'2025-06-24 12:16:05','2025-06-24 12:16:05'),(280,NULL,3,'2025-06-24 12:36:21','2025-06-24 12:36:21'),(281,NULL,3,'2025-06-24 15:08:22','2025-06-24 15:08:22'),(282,NULL,3,'2025-06-27 14:04:27','2025-06-27 14:04:27'),(283,NULL,3,'2025-07-02 12:49:54','2025-07-02 12:49:53'),(284,NULL,3,'2025-07-17 11:28:39','2025-07-17 11:28:39'),(285,NULL,3,'2025-07-17 11:33:23','2025-07-17 11:33:23'),(286,NULL,3,'2025-07-17 11:55:36','2025-07-17 11:55:36'),(287,NULL,3,'2025-07-17 12:04:08','2025-07-17 12:04:08'),(288,NULL,3,'2025-07-21 15:05:37','2025-07-21 15:05:36'),(289,NULL,3,'2025-07-23 08:45:18','2025-07-23 08:45:18'),(290,NULL,3,'2025-07-25 15:50:46','2025-07-25 15:50:46'),(291,NULL,3,'2025-07-29 14:38:08','2025-07-29 14:38:07'),(292,NULL,3,'2025-07-30 12:01:20','2025-07-30 12:01:19'),(293,NULL,3,'2025-08-02 11:42:10','2025-08-02 11:45:27'),(294,NULL,3,'2025-08-02 11:45:41','2025-08-02 11:45:40'),(295,NULL,3,'2025-08-02 14:24:09','2025-08-02 14:24:15'),(296,NULL,3,'2025-08-02 14:24:33','2025-08-02 14:42:35'),(297,NULL,3,'2025-08-02 18:20:30','2025-08-02 18:20:29'),(298,NULL,3,'2025-08-02 18:39:55','2025-08-02 18:39:54'),(299,NULL,3,'2025-08-02 18:41:27','2025-08-02 18:41:27'),(300,NULL,3,'2025-08-02 18:46:36','2025-08-02 18:46:35'),(301,NULL,3,'2025-08-04 11:31:56','2025-08-04 11:31:56'),(302,NULL,3,'2025-08-04 11:32:03','2025-08-04 11:32:02'),(303,NULL,3,'2025-08-04 11:54:26','2025-08-04 11:54:25'),(304,NULL,3,'2025-08-04 13:04:16','2025-08-04 13:04:16'),(305,NULL,3,'2025-08-04 15:48:26','2025-08-04 15:48:25'),(306,NULL,3,'2025-08-04 18:17:05','2025-08-04 18:17:04'),(307,NULL,3,'2025-08-05 15:18:38','2025-08-05 15:18:37'),(308,NULL,3,'2025-08-07 11:41:01','2025-08-07 11:41:00'),(309,NULL,3,'2025-08-07 15:27:46','2025-08-07 15:27:45'),(310,NULL,3,'2025-08-07 15:47:45','2025-08-07 15:47:45'),(311,NULL,3,'2025-08-07 16:19:26','2025-08-07 16:19:26');
/*!40000 ALTER TABLE `user_login_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mst`
--

DROP TABLE IF EXISTS `user_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mst` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `empcode` varchar(50) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `hq` varchar(50) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `reporting` int DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT 'Y',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified_by` int DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=604 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mst`
--

LOCK TABLES `user_mst` WRITE;
/*!40000 ALTER TABLE `user_mst` DISABLE KEYS */;
INSERT INTO `user_mst` VALUES (1,'PALASH CHANDRA PAUL','10028626','WB','KOLKATA','SSM',0,'100PAL',1,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(2,'ARUN KUMAR SINGH','10025356','UP','LUCKNOW','DZM',10028626,'100ARU',2,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(3,'ROHIT AGNIHOTRI','10025711','UP','KANPUR','SAM',10025356,'100ROH',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(4,'ANURAG SHUKLA','10047421','UP','KANPUR','STM',10025711,'100ANU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(5,'DEEPAK KUMAR SHUKLA','10039764','UP','KANPUR','SSBA',10025711,'100DEE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(6,'SATYA PRAKASH TIWARI','10037360','UP','PRAYAGRAJ','SBM',10025711,'100SAT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(7,'SIDDHANT SHUKLA','10046423','UP','PRAYAGRAJ','STM',10025711,'100SID',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(8,'MANVENDRA SINGH','10029243','UP','JHANSI','SSBM',10025711,'100MAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(9,'ASHISH CHAURASIA','10025579','UP','GORAKHPUR','SAM',10025356,'100ASH',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(10,'SHIVAM SINGH','10032565','UP','GORAKHPUR','SBO',10025579,'100SHI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(11,'RAVI SHANKAR SINGH','10029775','UP','BASTI','SSBO',10025579,'100RAV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(12,'DEEPANSHU SRIVASTAV','10032608','UP','PADRAUNA','SSBO',10025579,'100DEE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(13,'SHOBHIT KUMAR SHUKLA','10039714','UP','AZAMGARH','SSBM',10025579,'100SHO',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(14,'SATYAM KUMAR SINGH','10025796','UP','LUCKNOW','DRM',10025579,'100SAT',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(15,'VIVEK KUMAR DUBEY','10029345','UP','LUCKNOW','SSBO',10025796,'100VIV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(16,'JITENDRA KUMAR PANDEY','10025709','UP','LUCKNOW','SSBM',10025796,'100JIT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(17,'ANAND KUMAR MISHRA','10047453','UP','LUCKNOW','SSBO',10025796,'100ANA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(18,'ANIL KUMAR SHUKLA','10029263','UP','AYODHYA','STM',10025796,'100ANI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(19,'MAYANK MOHAN DUBEY','10025582','UP','SITAPUR','SSBA',10025579,'100MAY',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(20,'SOORAJ','10047498','UP','VARANASI','AM',10025582,'100SOO',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(21,'ANAND MISHRA','10030051','UP','VARANASI','SSBO',10025582,'100ANA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(22,'MOHAMMAD ZAID','10029245','UP','VARANASI','SSBM',10025582,'100MOH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(23,'SUBODH KANT TRIPATHI','10025778','UP','JAUNPUR','SSBM',10025582,'100SUB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(24,'NEETAN YADAV','10028234','BH','PATNA','RSM',10025356,'100NEE',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(25,'ANUPAM KUMAR','10028623','BH','PATNA','AM',10028234,'100ANU',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(26,'UDAY KUMAR SINGH','10029219','BH','PATNA','SSBM',10028623,'100UDA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(27,'SUNIL KUMAR','10029228','BH','PATNA','SSBM',10028623,'100SUN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(28,'VIKASH KUMAR','10029220','BH','MUZAFFAR PUR','SSBM',10028623,'100VIK',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(29,'AMIT KUMAR THAKUR','10047653','BH','DARBHANGA','SSTM',10028623,'100AMI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(30,'AMAR KANT','10028805','JKD','RANCHI','AM',10028234,'100AMA',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(31,'SHUBHAM KUMAR SHRIVASTAV','10029339','JKD','RANCHI','SBO',10028805,'100SHU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(32,'RAJAN KAUSHIK','10042834','JKD','RANCHI','SSBA',10028805,'100RAJ',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(33,'SUVAJIT SAHOO','10029215','JKD','JAMSHEDPUR','SSBM',10028805,'100SUV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(34,'RAHUL SINGH','10029210','JKD','DHANBAD','SBO',10028805,'100RAH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(35,'MANOJ KUMAR','10028817','BIHAR','PATNA','SAM',10028234,'100NOJ',4,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:13:06'),(36,'CHANDAN KUMAR','10029678','BH','PATNA','SBO',10028817,'100CHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(37,'AMARJEET KUMAR JHA','10029799','BH','PURNIA','SBO',0,'100AMA',5,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:15:02'),(38,'MD.ARSHAD HASAN KHAN','10029231','BH','GAYA','SSBM',10028817,'100ARS',5,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:14:49'),(39,'SHIVAM KUMAR','10043067','BH','BHAGALPUR','SSTM',10028817,'100SHI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(40,'amrish','10000000','PB','LUDHIANA','DZM',10028626,'100Dem',2,'N',NULL,'2024-07-18 11:28:01',NULL,NULL),(41,'ARUN KUMAR','10045533','PB','AMRITSAR','RM',10000000,'100ARU',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(42,'SANDEEP KUMAR','10029218','PB','LUDHIANA','AM',10045533,'100SAN',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(43,'CHETAN KUMAR','10046422','PB','LUDHIANA','STM',10050271,'100CHE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(44,'SOLLY MEHTA','10042229','PB','MOGA','SBA',10029218,'100SOL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(45,'SUMIT SHAH','10047420','PB','BHATINDA','STM',10050271,'100SUM',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(46,'ABHISHEK TANDON','10029774','PB','PATIALA','SSBO',10029218,'100ABH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(47,'AJAY JAMWAL','10027706','PB','AMRITSAR','AM',10045533,'100AJA',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(48,'ANURAG SHARMA','10035742','PB','AMRITSAR','SBO',10027706,'100ANU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(49,'ROHIT SHARMA','10043510','PB','PATHANKOT','SSTM',10027706,'100ROH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(50,'LAKHWINDER SINGH','10029855','PB','HOSHIARPUR','SSBO',10027706,'100LAK',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(51,'PRANAV CHANDLA','10033576','PB','JALLANDHAR','SBO',10027706,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(52,'FAROOQ AHMAD LONE','10025470','J&K','SRINAGAR','AM',10045533,'100FAR',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(53,'UZAIR AYOUB HANDOO','10035854','J&K','SRINAGAR','SBO',10025470,'100UZA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(55,'GOVIND KUMAR','10030583','J&K','JAMMU','SSBO',10025470,'100GOV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(56,'ABHISHEK MISHRA','10029170','PB','CHANDIGARH','DRM',10000000,'100ABH',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(57,'Dhananjay','10000001','PB','CHANDIGARH','AM',10029170,'100Dem',4,'N',NULL,'2024-07-18 11:30:53',NULL,NULL),(58,'MOJUNAID','10029778','PB','CHANDIGARH','SSBM',10000001,'100MOJ',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(59,'ANKUSH SETIA','10030509','PB','MOHALI','SSBM',10000001,'100ANK',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(60,'ABHISHEK CHANDEL','10033575','HP','MANDI','SBO',10000001,'100ABH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(61,'GAURAV KUMAR','10040161','HP','SHIMLA','SBA',10000001,'100GAU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(62,'RAMAN KUMAR','10025343','HR','AMBALA','AM',10029170,'100RAM',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(63,'JAI NARAYAN MISHRA','10039715','HR','AMBALA','SSBA',10025343,'100JAI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(64,'RAJPAL','10033239','HR','HISAR','SBM',10025343,'100RAJ',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(65,'GAURAV SHARMA','10042838','HR','KARNAL','SBM',10025343,'100GAU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(66,'HARISH KUMAR','10042837','HR','ROHTAK','SBM',10025343,'100HAR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(67,'VIVEK BHATNAGAR','10025527','UP','GHAZIABAD','ZM',10028626,'100VIV',2,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(68,'SACHIN KUMAR','10028804','DL','DELHI','RSM',10025527,'100SAC',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(69,'SOURABH SINGH','10028979','DL','DELHI','AMD',10028804,'100SOU',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(70,'AYUSH SHUKLA','10042021','DL','DELHI WEST','SBAD',10028979,'100AYU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(71,'ARUN KUMAR','10042145','DL','DELHI NORTH','SBOD',10028979,'100ARU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(72,'HIMANSHU INGLE','10035745','DL','DELHI EAST','SSBMD',10028979,'100HIM',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(73,'SHASHI PRAKASH','10029235','DL','DELHI NORTH','SSBMD',10028979,'100SHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(74,'DEVMANI SINGH','10029234','DL','DELHI','AMD',10028804,'100DEV',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(75,'ANAND KUMAR TRIPATHI','10042136','DL','DELHI SOUTH','SBOD',10029234,'100ANA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(76,'ABHISHEK AMBESH','10042093','DL','DELHI CENTRAL','SBAD',10035744,'100ABH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(77,'ABHISHEK KUMAR SINGH','10035744','DL','DELHI SOUTH','SSBOD',10002149,'100ABH',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(78,'MS. NAGAMA','10036695','DL','DELHI SOUTH','SBMD',10029234,'100NAG',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(79,'ATUL KUMAR','10025534','UP','GHAZIABAD','AM',10028804,'100ATU',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(80,'SHUBHAM KAUSHIK','10029745','UP','GHAZIABAD','SBM',10025534,'100SHU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(81,'ANAND KUMAR','10029777','UP','NOIDA','SSBM',10025534,'100ANA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(82,'ANUJ','10029226','HR','GURUGRAM','SBM',10025534,'100ANU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(83,'PANKAJ CHOUDHARY','10030151','HR','FARIDABAD','SBM',10025534,'100PAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(84,'ANIL KUMAR','10028801','UP','MEERUT','RSM',10025527,'100ANI',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(85,'SURAJ TRIPATHI','10025753','UP','AGRA','AM',10028801,'100SUR',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(86,'VINKAL SINGH','10029408','UP','AGRA','SSBM',10025753,'100VIN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(87,'ANUJ KUMAR','10029679','UP','FIROZABAD','SSBO',10035744,'100ANU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(88,'SACHIN SHARMA','10035171','UP','ALIGARH','SBO',10035744,'100SAC',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(89,'SHUBHAM KANNOJIA','10029266','UP','MEERUT','AM',10028801,'100SHU',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(90,'ROHIT BOSE','10047452','UP','MEERUT','SBM',10029266,'100ROH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(91,'SURAJ SINGH','10047422','UP','MEERUT','STM',10029266,'100SUR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(92,'MAYANK','10044365','UP','MUZAFFAR NAGAR','SSTM',10029266,'100MAY',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(93,'TUSHAR KUMAR','10045172','UT','DEHRADUN','SBO',10029266,'100TUS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(94,'BHOOPENDRA KUMAR','10029673','UP','BAREILLY','AM',10002149,'100BHO',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(95,'GOPAL ARORA','10041021','UP','BAREILLY','SBM',10029673,'100GOP',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(96,'YASH SINGHAL','10029364','UP','MORADABAD','SBM',10029673,'100YAS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(97,'ANIL KUMAR','10029302','UT','HALDWANI','SSBO',10029673,'100ANI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(98,'SHATADRU PAUL','10028230','WB','KOLKATA','RSM',10028626,'100SHA',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(99,'ANEENDYA GOSWAMI','10029176','WB','KOLKATA','AM',10028230,'100ANE',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(100,'DEBASIS PRAMANIK','10029213','WB','KOLKATA','SBM',10029176,'100DEB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(101,'MS. TRISHA HAZRA','10029343','WB','KOLKATA','SBO',10029176,'100TRI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(102,'SUBHAJIT MAITY','10029216','WB','KOLKATA','SSBO',10029176,'100SUB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(103,'SUVANKAR ROY','10029214','WB','KOLKATA','SSBM',10029176,'100SUV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(104,'MANAS KUMAR MUKHERJEE','10029177','WB','DURGAPUR','AM',10028230,'100MAN',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(105,'ARIJIT BISWAS','10029227','WB','DURGAPUR','SBM',10029177,'100ARI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(106,'KOUSHIK HALDAR','10029223','WB','BARDHAMAN','SSBO',10029177,'100KOU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(107,'KOUSIK MUKHERJEE','10035765','WB','BANKURA','SSBO',10029177,'100KOU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(108,'SUSANTA GOPE','10029289','WB','HOWRAH','AM',10028230,'100SUS',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(109,'DIPANJAN BANERJEE','10029232','WB','HOWRAH','SSBM',10029289,'100DIP',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(110,'PRABHAT MAITY','10029541','WB','MIDNAPUR','SSBO',10029289,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(111,'DEB KUMAR JANA','10029788','WB','TAMLUK','SSBM',10029289,'100DEB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(112,'SUMAN SANTRA','10042832','WB','SRIRAMPUR (W.B.)','SSTM',10029289,'100SUM',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(113,'NILIM SARMA','10028800','NE','GUWAHATI','AM',10028230,'100NIL',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(114,'AHAMMAD ALI','10029211','NE','GUWAHATI','SBO',10028800,'100AHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(115,'TULUKAN HAZARIKA','10029225','NE','GUWAHATI','SBO',10028800,'100TUL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(116,'RANJU DUTTA','10029233','NE','NAGAON','SSBM',10028800,'100RAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(117,'SAEED AHMED SAIKIA','10045182','NE','DIBRUGARH','SSBA',10028800,'100SAE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(118,'NIRZHAR CHAKRABORTY','10035764','NE','SILCHAR','SBO',10028800,'100NIR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(119,'TIRTHASIS BANERJEE','10028621','WB','KOLKATA','RSM',10028626,'100TIR',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(120,'MOHAN KUMAR SAHOO','10029290','ORI','BHUBNESHWAR','AM',10028621,'100MOH',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(121,'SRINIBASH MOHANTY','10025859','ORI','BHUBNESHWAR','SSBM',10029290,'100SRI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(122,'UTTAM MAITY','10029304','ORI','BALASORE','SSBM',10029290,'100UTT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(123,'BASANTA CHANDRA BEHERA','10029800','ORI','BERHAMPUR','SSBO',10029290,'100BAS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(124,'PRIYABRATA RAY','10028980','ORI','CUTTACK','AM',10028621,'100PRI',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(125,'SAGAR BEHERA','10029379','ORI','CUTTACK','SSBM',10028980,'100SAG',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(126,'BIDESH BEHERA','10029313','ORI','BHUBNESHWAR','SSBM',10028980,'100BID',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(127,'LALIT RANJAN BHATTACHARYA','10033275','ORI','RAURKELA','SBO',10028980,'100LAL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(128,'RITENDRA KUMAR MOHAPATRA','10029475','ORI','SAMBALPUR','SSBM',10028980,'100RIT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(129,'SUMAN BHATTACHERJEE','10045630','WB','KOLKATA','AM',10028621,'100SUM',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(130,'SAJAL KANRAR','10042835','WB','KOLKATA','SSTM',10045630,'100SAJ',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(131,'SUBHANKAR BISWAS','10035743','WB','KOLKATA','SSBO',10045630,'100SUB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(132,'SATYAJIT SAHA','10029854','WB','BARASAT','SSBO',10045630,'100SAT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(133,'SOUVIK SUR','10041576','WB','KALYANI','SSTM',10045630,'100SOU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(134,'SUKHENDU HARI','10029222','WB','SILIGURI','AM',10028621,'100SUK',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(135,'SHILADITYA SARKAR','10029344','WB','SILIGURI','SBO',10029222,'100SHI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(136,'DEBASHIS MUKHOPADHYAY','10032393','WB','BEHRAMPUR','SSBM',10029222,'100DEB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(137,'PRADYUT SINGHA','10045169','WB','MALDA','STM',10029222,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(138,'BISWAJIT SAHA','10029300','WB','KOCH BIHAR','SSBO',10029222,'100BIS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(139,'ATUL ALTI','10028247','MUM','MUMBAI','SSMM',0,'100ATU',1,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(140,'RISHABH SHRINET','10028239','MUM','MUMBAI','RSM',10028247,'100RIS',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(141,'BRIJLAL SHYAMSUNDAR VARMA','10028797','MUM','MUMBAI','AMM',10028239,'100BRI',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(142,'VASISHTHA KALYAN YEWLE','10045760','MUM','MUMBAI THANE','STMM',10028797,'100VAS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(143,'RAJESH SHIMBHUDAYAL KUMHAR','10042836','MUM','MUMBAI PANVEL','SBOM',10028797,'100RAJ',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(144,'PRASHANT RAJESH PANDEY','10029376','MUM','MUMBAI THANE','SSBO',10028797,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(145,'GUNJAN NANDKUMAR VISHWAKARMA','10029373','MUM','MUMBAI WEST','SSBOM',10028797,'100GUN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(146,'YOGESH RAJENDRA PRASAD MISHRA','10029057','MUM','MUMBAI','AMM',10028239,'100YOG',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(147,'SHIVAM KUMAR SINGH','10029375','MUM','MUMBAI WEST','SSBOM',10029057,'100SHI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(148,'RITESH KUMAR DUBEY','10029378','MUM','MUMBAI CENTRAL','SSBMM',10029057,'100RIT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(149,'DEEPAK PANDEY','10045193','MUM','MUMBAI VASAI','STMM',10029057,'100DEE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(150,'VIVEK SHARMA','10029790','MUM','MUMBAI SOUTH','SBOM',10029057,'100VIV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(151,'VIKESH RAVINDRA GUPTA','10029384','MUM','MUMBAI','AMM',10028239,'100VIK',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(152,'MANISH KUMAR YADAV','10029372','MUM','MUMBAI WEST','SSBOM',10029384,'100MAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(153,'PRADEEP DARA JAISWAR','10029497','MUM','MUMBAI SOUTH','SSBOM',10029384,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(154,'UMESH YADAV','10035327','GOA','PANJIM','SSBO',10029384,'100UME',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(155,'YESHWANT RAGHUNATH GHORBAND','10028237','MAH','PUNE','RSM',10028247,'100YES',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(156,'SARDAR G. WADKAR','20000956','MAH','KOLHAPUR','AM',10028237,'200SAR',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(157,'RANVEER ASHOK NIMBALKAR','10029370','MAH','KOLHAPUR','SSBM',20000956,'100RAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(158,'ROHIT RAJENDRA KESARE','10029412','MAH','SANGLI','SSBM',20000956,'100ROH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(159,'SOURABH SATENDRA SONAWANE','10029422','MAH','SATARA','SSBM',20000956,'100SOU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(160,'BHANDE BALASAHEB VYANKATRAO','10028807','MAH','SOLAPUR','AM',10028237,'100BHA',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(161,'RAVIRAJ BALASAHEB LALAGE','10029358','MAH','SOLAPUR','SSBO',10028807,'100RAV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(162,'PAWAR KRISHNA VITTHAL','10037401','MAH','LATUR','SBA',10028807,'100PAW',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(163,'DNYANESHWAR APPARAO PATIL','10031917','MAH','NANDED','SBO',10028807,'100DNY',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(164,'ROHIT BHARAT SURVASE','10045184','MAH','AHMED NAGAR','SSBA',10028807,'100ROH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(165,'AVINASH SHIRALKAR','10028799','MAH','PUNE','SAM',10028237,'100AVI',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(166,'AKSHAY SIDDHESHWAR RAJESHWAR','10029368','MAH','PCMC','SSBM',10028799,'100AKS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(167,'AKSHAY VIJAY JADHAV','10042833','MAH','PUNE','SSBA',10028799,'100AKS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(168,'AKHILESH RAJESHWAR UTTARWAR','10033443','MAH','PUNE','SBM',10028799,'100AKH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(169,'MAYUR SADASHIV GADEKAR','10030665','MAH','PUNE','STM',10028799,'100MAY',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(170,'KETAN RATHOD','10025357','MP','UJJAIN','DZM',10028247,'100KET',2,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(171,'RAUNAK JITENDRA LOYA','10028625','MAH','NAGPUR','RSM',10025357,'100RAU',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(172,'SUBHASH BANKATSING BEDWAL','10029171','MAH','NAGPUR','AM',10028625,'100SUB',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(173,'SIDHANT RAMESH THORAT','10037400','MAH','NAGPUR','SSBO',10029171,'100SID',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(174,'SURAJ SANJAY BHOSLE','10045761','MAH','NAGPUR','SSBM',10029171,'100SUR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(176,'LOKESH HEMCHANDRA DHANDE','10029417','MAH','AMRAVATI','SSBM',10029171,'100LOK',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(177,'RAVINDRA GANPATRAOJI SEMBEKAR','10028806','MAH','SAMBHAJI NAGAR','AM',10028625,'100RAV',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(178,'KRUNAL DILIPRAO WADHAI','10029419','MAH','SAMBHAJI NAGAR','SBO',10028806,'100KRU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(179,'SWAPNIL MANKAR','10036870','MAH','SAMBHAJI NAGAR','SBO',10028806,'100SWA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(180,'PRADIP GOVINDA CHAVHAN','10029413','MAH','NASIK','STM',10028806,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(181,'AKSHAY ASHOK AWAGHATE','10029474','MAH','JALGAON','SSBO',10028806,'100AKS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(182,'SOURABH CHOUBEY','10029312','MP','BHOPAL','AM',10025357,'100SOU',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(183,'JHAMMAN KUMAR CHANDRAKAR','10037799','MP','BHOPAL','STM',10029312,'100JHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(184,'PRAKASH KUMAR','10035853','MP','BHOPAL','SSBO',10029312,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(185,'NIHAL PILLAI','10035798','MP','SATNA','SSBM',10029312,'100NIH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(186,'MADHAW JEE','10040121','MP','JABALPUR','SBO',10029312,'100MAD',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(187,'SAMAR JAISWAL','10028972','MP','INDORE','SAM',10025357,'100SAM',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(189,'DEEPAK RATNAWAT','10045783','MP','INDORE','STM',10028972,'100DEE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(190,'UDIT NARAYAN PANDEY','10045168','MP','UJJAIN','STM',10028972,'100UDI',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(191,'SOURABH SINGH JADON','10044364','MP','GWALIOR','SBM',10028972,'100SOU',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(192,'SHIVAM RICHHARIYA','10029346','CHG','RAIPUR','AM',10025357,'100SHI',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(193,'NAYAN DHEERAN','10029772','CHG','RAIPUR','SSBO',10029346,'100NAY',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(195,'RAJESH KUSHWAHA','10025442','CHG','DURG','SBO',10029346,'100RAJ',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(196,'ROHIT GUPTA','10029771','CHG','BILASPUR','STM',10029346,'100ROH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(197,'JIGNESH R JHAVERI','10028624','GUJ','AHMEDABAD','RSM',10028247,'100JIG',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(198,'MAKANI SANDEEP KANAIYALAL','10028803','GUJ','AHMEDABAD','AM',10028624,'100MAK',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(199,'PATNI NILESH KALIDAS','10029462','GUJ','AHMEDABAD','SSBM',10028803,'100PAT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(200,'SHAHU CHANDRAPRAKASH SANTOSHKUMAR','10029500','GUJ','AHMEDABAD','SSBM',10028803,'100SHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(201,'ABHISHEKSINGH CHAUHAN','10029501','GUJ','AHMEDABAD','SSBM',10028803,'100ABH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(203,'SATISH KUMAR VISHWAKARMA','10037128','GUJ','VADODARA','AM',10028624,'100SAT',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(204,'MOHAMMADMIYA MOHAMMADSOAB CHOKHAWALA','10029473','GUJ','VADODARA','SSBM',10037128,'100MOH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(205,'MORE JITESH','10029495','GUJ','VADODARA','SSBM',10037128,'100MOR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(206,'PRAVINBHAI BHUPATBHAI KALSARIYA','10044419','GUJ','SURAT','SSTM',10037128,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(207,'BABARIYA RURU ARVINDBHAI','10029522','GUJ','SURAT','SSBM',10037128,'100BAB',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(208,'YOGENDRA NAGAR','10029174','RAJ','JAIPUR','AM',10028624,'100YOG',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(209,'SHRIPAL SINGH CHAMPAWAT','10047419','RAJ','JAIPUR','SBM',10029174,'100SHR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(210,'KESHAV SONI','10029460','RAJ','JAIPUR','SSBM',70118545,'100KES',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(211,'CHANDRAPAL SINGH PARIHAR','10029683','RAJ','JAIPUR','SSBO',70118545,'100CHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(212,'PUSHPENDRA SINGH','10037430','RAJ','AJMER','SBM',70118545,'100PUS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(213,'YOGESH AGARWAL','10003869','RAJ','JODHPUR','AM',10028624,'100YOG',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(214,'VINAY KUMAR SHARMA','10035197','RAJ','JODHPUR','STM',10003869,'100VIN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(215,'MOHAMMAD SAQIB','10029499','RAJ','BIKANER','SBA',10003869,'100MOH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(216,'VINOD KUMAR SAINI','10029981','RAJ','KOTA','SBA',10003869,'100VIN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(217,'NAVEEN KUMAR SHARMA','10031653','RAJ','UDAIPUR','SSBO',10003869,'100NAV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(218,'PRAMOD MANAGOLI','10002580','TN','CHENNAI','SM',0,'100PRA',1,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(219,'PRABHAT KUMAR','10041037','TN','CHENNAI','RM',10002580,'100PRA',2,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(220,'MANJUNATHA N','10032435','TN','CHENNAI','AM',10041037,'100MAN',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(221,'SUNIL KUMAR','10028981','TN','CHENNAI','SSBO',10032435,'100SUN',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(222,'MANOJ KUMAR G.','10025757','TN','CHENNAI','SSBM',10028981,'100MAN',5,'N',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:11:19'),(223,'SAFIUL ISLAM','10042831','TN','CHENNAI','SSBM',10028981,'100SAF',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(224,'SANGMESHWAR','10039765','TN','PONDICHERRY','SBM',10028981,'100SAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(225,'VIDYADHARA','10025632','TN','COIMBATORE','AM',10028981,'100VID',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(226,'Mohit','10000003','TN','COIMBATORE','SSBO',10032435,'100Dem',4,'N',NULL,'2024-07-18 11:32:24',NULL,NULL),(227,'SOMAGATTA RAMAPPA HARISH','10035195','TN','COIMBATORE','STM',10000003,'100SOM',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(228,'BHEEMASHANKAR','10032519','TN','ERODE','SSBM',10025757,'100BHE',5,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:07:28'),(229,'MADAN M','10043073','TN','MADURAI','AM',10025757,'100MAD',5,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:07:49'),(230,'INAYATH ULLA KHAN','10035196','TN','MADURAI','SBM',10025757,'100INA',5,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:08:13'),(231,'IRANI KHUSROO ABBAS','10025621','TN','MADURAI','SSBM',10032435,'100IRA',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(232,'SHAMSHUDDIN DHARAWAD','10025642','TN','TRICHY','SSBO',10025621,'100SHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(233,'PRASHANT HANAMANTACHE','10039716','TN','TIRUNELVELI','SBO',10025621,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(234,'MOHAMMED IRFAN','10031636','KRL','ERNAKULAM','RM',10025621,'100MOH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(235,'SYED PARVEEZ AHAMED','10047654','KRL','ERNAKULAM','AM',10025621,'100SYE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(236,'MUKUL SHIVAKUMAR CHAVAN','10044420','KRL','ERNAKULAM','SSBO',10025621,'100MUK',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(237,'SAMPARA MARKANDEYULU','10028317','KRL','ERNAKULAM','SBM',10041037,'100SAM',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(238,'MINNIKANTI S S S SRINIVAS','10045522','KRL','KOLLAM','SBO',10028317,'100MIN',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(239,'MOHAMMAD RAFFI','10039834','KRL','TRIVANDRUM','STM',10045522,'100MOH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(240,'KARIJALA SUNIL','10038505','KRL','KOTTAYAM','SBM',10045522,'100KAR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(241,'PAYYAVULA MAHESH','10029416','KRL','KOZHIKODE','AM',10045522,'100PAY',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(242,'TAMMANAVENI RAVINDER','10029414','KRL','KOZHIKODE','SSBO',10045522,'100TAM',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(243,'Ishan','10000004','KRL','THRISSUR','SBM',10028317,'100Dem',4,'N',NULL,'2024-07-18 11:35:25',NULL,NULL),(244,'PANJALA ARAVIND','10029685','KRL','KANNUR','SBM',10000004,'100PAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(245,'DULGACH RAHUL SINGH','10029836','KRL','PERINTHALMANNA','SBA',10000004,'100DUL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(246,'MOHAMMAD ASHRAF','10039841','KAR','BENGALURU','SSM',10000004,'100MOH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(247,'ANKALA PARUSURAMU','10030510','KAR','BENGALURU','SM',10000004,'100ANK',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(248,'POTHURI VENKATA SRINIVAS CHALAPATHI RAO','10028818','A.P.','VIJAYAWADA','RM',10028317,'100POT',4,'Y',NULL,'2024-07-17 17:39:27',1,'2024-11-08 14:17:05'),(249,'PATAN SHABBER KHAN','10045167','KAR','BENGALURU','AM',10028818,'100PAT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(250,'SHAIK NAGUR VALI','10037399','KAR','BENGALURU','SSBM',10028818,'100SHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(251,'KOPPOLU KARIMULLA','10029411','KAR','BENGALURU','SBA',10028818,'100KOP',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(252,'I MAHESH','10029537','KAR','BENGALURU','SBO',10028818,'100MAH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(253,'SRUJAN KUMAR BOMMI','20001127','KAR','UDUPI','SSBM',10028317,'200SRU',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(255,'REDDI RAMAMOHANA RAO','10043459','KAR','BENGALURU','SSBO',20001127,'100RED',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(256,'VADLAMURI SURYA PRAKASH','10029361','KAR','BENGALURU','SSBO',20001127,'100VAD',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(257,'MATTA NARESH','10036793','KAR','BENGALURU','SBA',20001127,'100MAT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(258,'PATTABIMATHIVANAN SHANMUGAVADIVEL','10028253','KAR','MYSURE','SSBM',10002580,'100PAT',2,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(259,'DIVAKAR V','10031329','KAR','HUBBALLI','AM',10028253,'100DIV',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(260,'Rohit','10000005','KAR','HUBBALLI','SSBM',10031329,'100Dem',4,'N',NULL,'2024-07-18 11:36:57',NULL,NULL),(261,'MUJEEB RAHMAN','10029802','KAR','BELAGAVI','SBO',10000005,'100MUJ',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(262,'KARTHIKEYAN MUNUSAMY','10029785','TAMIL NADU','CHENNAI','SSBM',10029802,'100KAR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(263,'DEENADAYALAN K','10030711','KAR','DAVANGERE','STM',10029802,'100DEE',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(264,'PRADEEP KUMAR S','10032569','KAR','KALABURGI','SSBO',10000005,'100PRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(265,'KARTHICK PARAMAN','10029278','TLG','HYDERABAD','RSM',10031329,'100KAR',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(266,'MANIVANNAN','10035797','TLG','HYDERABAD','AM',10029278,'100MAN',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(267,'MATHAN M','10046405','TLG','HYDERABAD','SSBA',10029278,'100MAT',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(268,'WILLIAMS INNACIMUTHU','10029974','TLG','HYDERABAD','SSBO',10029278,'100WIL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(269,'NAGARAJAN C','10043444','TLG','WARANGAL','SSBM',10031329,'100NAG',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(270,'MARIAPPAN V','10029476','TLG','KARIMNAGAR','SSBM',10043444,'100MAR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(271,'ROOBANRAJ DURAISINGH','10042840','TLG','HYDERABAD','AM',10043444,'100ROO',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(272,'BALAJI RAVICHANDRAN','10035799','TLG','HYDERABAD','SSBO',10043444,'100BAL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(273,'BALACHANDAR','10038967','TLG','HYDERABAD','SSBM',10043444,'100BAL',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(274,'ANAND C','10028983','TLG','HYDERABAD','SSBA',10028253,'100ANA',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(275,'AMRUTH LAL S','10044733','AP','KURNOOL','SSBM',10028983,'100AMR',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(276,'AGHIL THOMAS','10041574','AP','VIJAYAWADA','AM',10044733,'100AGH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(277,'SIVAPRASAD R PAI','10032391','AP','VIJAYAWADA','SSBM',10044733,'100SIV',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(278,'SHAMEERKHAN M','10039033','AP','GUNTUR','SSBM',10044733,'100SHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(279,'SRAVAN S S','10047510','AP','NELLORE','SBM',10044733,'100SRA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(280,'SARATHMON P S','10029090','AP','TIRUPATI','SSBM',10044733,'100SAR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(281,'AJESH P','10041679','AP','VISHAKHAPATNAM','AM',10028983,'100AJE',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(282,'SHALIK P','10029091','AP','VISHAKHAPATNAM','STM',10041679,'100SHA',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(283,'ABHAY KRISHNA K R','10042839','AP','VISHAKHAPATNAM','SBA',10041679,'100ABH',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(284,'VISHNU K','10029079','AP','RAJAHMUNDRY','SSBO',10041679,'100VIS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(285,'RASHID AMEEN CHOLAMUGHATH','10042273','AP','KAKINADA','SBM',10041679,'100RAS',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(576,'ajay123','931015','Maharashtra','ffdsfs','fdsf',5572525,'2452452',3,'N',NULL,'2024-07-17 17:39:27',NULL,NULL),(577,'Sneha kkkkkk','68676465363','Delhi','delhi','aPM',1234567,'Mankind',1,'N',NULL,'2024-07-17 17:39:27',NULL,NULL),(578,'Malika Saini','3333333','Delhi','gggg','aPM',2,'Mankind',5,'N',NULL,'2024-07-17 17:39:27',NULL,NULL),(582,'karan','12345','Mah','Pune','Zm',1234,'1234',5,'N',1,'2024-07-18 11:47:25',1,'2024-07-18 11:48:43'),(585,'GURPREET VERMA','10017012','HARYANA','AMBALA','AM',10029170,'100GUR',4,'Y',1,'2024-11-05 12:41:49',NULL,NULL),(586,'JAI NARAYAN MISHRA','10039715','HARYANA','AMBALA','SBO',10017012,'00s',5,'Y',1,'2024-11-05 12:42:42',NULL,NULL),(587,'RAJPAL .','10033239','HARYANA','HISAR','SBM',10017012,'00s',5,'Y',1,'2024-11-05 12:43:23',NULL,NULL),(588,'GAURAV SHARMA','10042838','HARYANA','KARNAL','SSBM',10017012,'00s',5,'Y',1,'2024-11-05 12:43:59',NULL,NULL),(589,'HARISH KUMAR','10042837','HARYANA','ROHTAK','SSBM',10017012,'00s',5,'Y',1,'2024-11-05 12:44:30',NULL,NULL),(590,'ANKUSH SETIA','10030509','PUNJAB','CHANDIGARH','AM',10029170,'100ANK',4,'Y',1,'2024-11-05 15:59:13',NULL,NULL),(591,'MOJUNAID .','10029778','PUNJAB','CHANDIGARH','SSBM',10030509,'00s',5,'Y',1,'2024-11-05 15:59:53',NULL,NULL),(592,'ABHISHEK CHANDEL','10033575','HIMACHAL PRADESH','MANDI','SSBO',10030509,'00s',5,'Y',1,'2024-11-05 16:00:31',NULL,NULL),(593,'GAURAV KUMAR','10040161','HIMACHAL PRADESH','SHIMLA','SBO',10030509,'00s',5,'Y',1,'2024-11-05 16:01:13',NULL,NULL),(594,'MANOJ KUMAR G.','10025757','KARNATAKA','BENGALURU','AM',70118494,'100MAN',4,'Y',1,'2024-11-08 14:05:21',1,'2024-11-08 14:11:33'),(595,'DHANRAJ VILAS RAUNDAL','10048890','MAHARASHTRA','Nashik','Mr',10029171,'000',5,'Y',1,'2024-12-13 13:12:34',NULL,NULL),(596,'Adarsh Kumar Thakur','10051504','UP','Noida','SSBM',10025534,'100ADA',5,'Y',2,'2025-02-20 10:52:28',NULL,NULL),(597,'AKTHAR JAVITH','10048129','TAMIL NADU','CHENNAI','SSTM',10029802,'000KAR',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(598,'Prince Mahajan','10050271','PB','Ludhiana','SSTM',10045533,'100PRI',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(599,'Arvind Kumar Verma ','10051710','RAJ','Jaipur ','SSTM',0,'100ARV',3,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(600,'KOMALPREET SINGH','10048430','PB','FARIDKOT','STM',10050271,'000kom',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(601,'JATIN CHAUHAN','10050463','PB','PATIALA','SBM',10050271,'000jai',5,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(602,'vacent','70118545','RAJ','Jaipur ','AM',10051710,'100VAC',4,'Y',NULL,'2024-07-17 17:39:27',NULL,NULL),(603,'SUSHIL KUMAR SAW','10002149','UP','MEERUT','RM',10025527,'100SUS',3,'Y',NULL,'2025-05-28 15:55:37',NULL,NULL);
/*!40000 ALTER TABLE `user_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_poster_download_log`
--

DROP TABLE IF EXISTS `user_poster_download_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_poster_download_log` (
  `upd_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `poster_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  `download_type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `download_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`upd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_poster_download_log`
--

LOCK TABLES `user_poster_download_log` WRITE;
/*!40000 ALTER TABLE `user_poster_download_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_poster_download_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_poster_mst`
--

DROP TABLE IF EXISTS `user_poster_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_poster_mst` (
  `upid` int NOT NULL AUTO_INCREMENT,
  `doctor_id` int NOT NULL,
  `subcat_id` int DEFAULT NULL,
  `poster_name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `poster_type` int DEFAULT NULL,
  `p_lang` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `normal_poster_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`upid`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_poster_mst`
--

LOCK TABLES `user_poster_mst` WRITE;
/*!40000 ALTER TABLE `user_poster_mst` DISABLE KEYS */;
INSERT INTO `user_poster_mst` VALUES (1,4,1,'test/4-dryeye-en-1.jpg',NULL,'en',NULL,NULL,'2025-06-04 18:01:06'),(2,10,1,'test/10-dryeye-en-1.jpg',NULL,'en',NULL,NULL,'2025-06-07 17:45:55'),(3,11,1,'test/11-dryeye-en-1.jpg',NULL,'en',NULL,NULL,'2025-06-07 17:48:03'),(4,12,1,'test/12-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-13 16:28:07'),(5,12,3,'test/12-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-13 16:42:19'),(6,14,3,'test/14-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-14 15:16:13'),(7,11,1,'test/11-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-14 16:32:08'),(8,2,1,'test/2-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-14 16:32:13'),(9,1,1,'test/1-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-14 16:32:29'),(10,16,1,'test/16-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-14 16:55:28'),(11,17,1,'test/17-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-16 14:25:21'),(12,18,1,'test/18-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-16 14:26:16'),(13,19,3,'test/19-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-16 14:28:57'),(14,20,3,'test/20-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-16 14:29:20'),(15,21,1,'test/21-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-16 16:17:20'),(16,22,1,'test/22-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-16 16:30:29'),(17,23,1,'test/23-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-16 18:38:07'),(18,25,1,'test/25-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-18 10:58:15'),(19,26,3,'test/26-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-18 10:59:03'),(20,27,1,'test/27-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-18 11:00:08'),(21,28,3,'test/28-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-18 11:01:46'),(22,29,1,'test/29-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-18 11:05:00'),(23,30,3,'test/30-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-06-18 11:05:47'),(24,32,1,'test/32-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-23 16:50:02'),(25,33,1,'test/33-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-23 18:46:13'),(26,34,1,'test/34-bp-en-1.png',NULL,'en',NULL,NULL,'2025-06-24 12:37:29'),(27,35,1,'test/35-bp-en-1.png',NULL,'en',NULL,NULL,'2025-07-02 12:50:32'),(28,37,3,'test/37-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-07-07 21:05:53'),(29,36,2,'test/36-bpecg-en-2.png',NULL,'en',NULL,NULL,'2025-07-17 11:42:03'),(30,31,2,'test/31-bpecg-en-2.png',NULL,'en',NULL,NULL,'2025-07-17 11:55:47'),(31,38,1,'test/38-bp-en-1.png',NULL,'en',NULL,NULL,'2025-07-25 15:51:45'),(32,39,1,'test/39-bp-en-1.png',NULL,'en',NULL,NULL,'2025-07-25 15:52:30'),(33,40,1,'test/40-bp-en-1.png',NULL,'en',NULL,NULL,'2025-08-02 12:09:48'),(34,41,2,'test/41-bpecg-en-2.png',NULL,'en',NULL,NULL,'2025-08-02 12:17:49'),(35,42,3,'test/42-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-08-02 12:19:36'),(36,43,1,'test/43-bp-en-1.png',NULL,'en',NULL,NULL,'2025-08-02 14:26:04'),(37,44,2,'test/44-bpecg-en-2.png',NULL,'en',NULL,NULL,'2025-08-02 14:30:15'),(38,45,3,'test/45-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-08-02 14:30:45'),(39,46,3,'test/46-lipid-en-3.png',NULL,'en',NULL,NULL,'2025-08-07 15:47:58'),(40,47,1,'test/47-bp-en-1.png',NULL,'en',NULL,NULL,'2025-08-07 15:49:30');
/*!40000 ALTER TABLE `user_poster_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_maping`
--

DROP TABLE IF EXISTS `user_role_maping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role_maping` (
  `ur_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_date` datetime NOT NULL,
  `creted_by` int NOT NULL,
  PRIMARY KEY (`ur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_maping`
--

LOCK TABLES `user_role_maping` WRITE;
/*!40000 ALTER TABLE `user_role_maping` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_maping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_mst`
--

DROP TABLE IF EXISTS `zone_mst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_mst` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `zone_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y',
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_mst`
--

LOCK TABLES `zone_mst` WRITE;
/*!40000 ALTER TABLE `zone_mst` DISABLE KEYS */;
INSERT INTO `zone_mst` VALUES (1,'North','Y','2024-06-07 00:00:00'),(2,'West','Y','2024-06-07 12:44:59'),(3,'East','Y','2024-06-07 12:45:11'),(4,'South','Y','2024-06-07 12:45:28');
/*!40000 ALTER TABLE `zone_mst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mankindnewdb'
--

--
-- Dumping routines for database 'mankindnewdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddPoster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPoster`(IN `p_doctor_id` INT, IN `p_language` VARCHAR(100), IN `p_poster_name` VARCHAR(255), IN `p_subcat_id` INT)
BEGIN
    DECLARE existing_row_count INT;

    -- Check if the row already exists
    SELECT COUNT(*) INTO existing_row_count
    FROM user_poster_mst
    WHERE
        doctor_id = p_doctor_id COLLATE utf8mb4_general_ci AND
        p_lang = p_language COLLATE utf8mb4_general_ci AND
        poster_name = p_poster_name COLLATE utf8mb4_general_ci AND
        subcat_id = p_subcat_id COLLATE utf8mb4_general_ci;

    -- If the row doesn't exist, insert it
    IF existing_row_count = 0 THEN
        INSERT INTO user_poster_mst (doctor_id, subcat_id,p_lang, poster_name)
        VALUES (p_doctor_id, p_subcat_id,p_language, p_poster_name);
    ELSE
        -- If the row exists, update it
        UPDATE user_poster_mst
        SET
            poster_name = p_poster_name COLLATE utf8mb4_general_ci,
            p_lang = p_language COLLATE utf8mb4_general_ci
        WHERE
            doctor_id = p_doctor_id COLLATE utf8mb4_general_ci AND
            subcat_id = p_subcat_id COLLATE utf8mb4_general_ci AND
            poster_name = p_poster_name COLLATE utf8mb4_general_ci AND
            p_lang = p_language COLLATE utf8mb4_general_ci;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AV_GetCampReportFinalSummary_DateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AV_GetCampReportFinalSummary_DateRange`(IN `insupcat_id` INT, IN `instartdate` VARCHAR(25), IN `inenddate` VARCHAR(25))
BEGIN

    DECLARE done INT DEFAULT FALSE;
   -- DECLARE c_user_id INT;
    DECLARE c_name VARCHAR(250);
	DECLARE	c_empcode INT;
    DECLARE c_reporting INT;
	DECLARE	c_hq VARCHAR(250);

    -- Declare a cursor
    DECLARE cur CURSOR FOR
        SELECT name,empcode,reporting,hq FROM user_mst WHERE status='Y' and role !=7 order by role asc;

    -- Declare a continue handler to exit the loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS t_result;
-- Create a temporary table
    CREATE TEMPORARY TABLE t_result (
       -- user_id INT,
        name VARCHAR(250),
		empcode INT,
        reporting INT,
		hq VARCHAR(250),
       -- TotalNoOfEmpReportingCount INT,
		TotalDoctorCount INT,
		TotalCampCount INT,
		TotalPatientScaneed INT,
		TotalPatientDiagnosed INT,
		TotalPrescribe INT        
    );
    


    -- Open the cursor
    OPEN cur;

    -- Loop through the result set
    read_loop: LOOP
        FETCH cur INTO c_name,c_empcode,c_reporting,c_hq;

        IF done THEN
            LEAVE read_loop;
        END IF;
		
        CALL AV_GetCampReportSummaryByEmpcode_DateRangeWise(c_empcode,insupcat_id,instartdate,inenddate,@TotalNoOfEmpReportingCount, @TotalDoctorCount, @TotalCampCount,@TotalPatientScaneed,@TotalPatientDiagnosed,@TotalPrescribe);
        -- select c_user_id, @TotalNoOfEmpReportingCount, @TotalDoctorCount, @TotalCampCount,@TotalPatientScaneed,@TotalPatientDiagnosed,@TotalPrescribe;

       
        -- Insert the row into the temporary table
        INSERT INTO t_result VALUES ( c_name, c_empcode,c_reporting,c_hq,@TotalDoctorCount, @TotalCampCount,@TotalPatientScaneed,@TotalPatientDiagnosed,@TotalPrescribe);
        /*
         SELECT c_user_id AS 'Fetched_Column1', c_name AS 'Fetched_Column2',
         c_empcode AS 'Fetched_Column3', c_reporting AS 'Fetched_Column4',
         c_hq AS 'Fetched_Column5';
         */
          -- set done=TRUE;
    END LOOP;

    -- Close the cursor
    CLOSE cur;
    
     -- Select the result set from the temporary table
    SELECT * FROM t_result;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AV_GetCampReportFinalSummary_EmpCodeDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AV_GetCampReportFinalSummary_EmpCodeDateRange`(IN `inempcode` INT, IN `insupcat_id` INT, IN `instartdate` VARCHAR(25), IN `inenddate` VARCHAR(25))
BEGIN

    DECLARE done INT DEFAULT FALSE;
   -- DECLARE c_user_id INT;
    DECLARE c_name VARCHAR(250);
	DECLARE	c_empcode INT;
    DECLARE c_reporting INT;
	DECLARE	c_hq VARCHAR(250);

    -- Declare a cursor
    DECLARE cur CURSOR FOR
       WITH RECURSIVE EmployeeHierarchy AS (
		SELECT  user_id, empcode, name, reporting, hq, role,status FROM  user_mst WHERE status='Y' and empcode = inempcode -- 10000950
		UNION ALL
		SELECT  e.user_id, e.empcode, e.name, e.reporting, e.hq, e.role, e.status FROM user_mst e
		JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode
		)
	SELECT name,empcode,reporting,hq  FROM EmployeeHierarchy f where role!=7 and status='Y' order by role asc;

    -- Declare a continue handler to exit the loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

 -- Drop the temporary table
    DROP TEMPORARY TABLE IF EXISTS t_result;
-- Create a temporary table
    CREATE TEMPORARY TABLE t_result (
       -- user_id INT,
        name VARCHAR(250),
		empcode INT,
        reporting INT,
		hq VARCHAR(250),
       -- TotalNoOfEmpReportingCount INT,
		TotalDoctorCount INT,
		TotalCampCount INT,
		TotalPatientScaneed INT,
		TotalPatientDiagnosed INT,
		TotalPrescribe INT        
    );
    


    -- Open the cursor
    OPEN cur;

    -- Loop through the result set
    read_loop: LOOP
        FETCH cur INTO c_name,c_empcode,c_reporting,c_hq;

        IF done THEN
            LEAVE read_loop;
        END IF;
		
        CALL AV_GetCampReportSummaryByEmpcode_DateRangeWise(c_empcode,insupcat_id,instartdate,inenddate,@TotalNoOfEmpReportingCount, @TotalDoctorCount, @TotalCampCount,@TotalPatientScaneed,@TotalPatientDiagnosed,@TotalPrescribe);
        -- select c_user_id, @TotalNoOfEmpReportingCount, @TotalDoctorCount, @TotalCampCount,@TotalPatientScaneed,@TotalPatientDiagnosed,@TotalPrescribe;

       
        -- Insert the row into the temporary table
        INSERT INTO t_result VALUES ( c_name, c_empcode,c_reporting,c_hq,@TotalDoctorCount, @TotalCampCount,@TotalPatientScaneed,@TotalPatientDiagnosed,@TotalPrescribe);
        /*
         SELECT c_user_id AS 'Fetched_Column1', c_name AS 'Fetched_Column2',
         c_empcode AS 'Fetched_Column3', c_reporting AS 'Fetched_Column4',
         c_hq AS 'Fetched_Column5';
         */
          -- set done=TRUE;
    END LOOP;

    -- Close the cursor
    CLOSE cur;
    
     -- Select the result set from the temporary table
    SELECT * FROM t_result;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AV_GetCampReportSummaryByEmpcode_DateRangeWise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AV_GetCampReportSummaryByEmpcode_DateRangeWise`(IN `inempcode` INT, IN `insupcat_id` INT, IN `instartdate` VARCHAR(25), IN `inenddate` VARCHAR(25), OUT `TotalNoOfEmpReportingCount` INT, OUT `TotalDoctorCount` INT, OUT `TotalCampCount` INT, OUT `TotalPatientScaneed` INT, OUT `TotalPatientDiagnosed` INT, OUT `TotalPrescribe` INT)
BEGIN	
-- SET @@cte_max_recursion_depth = 30000;
-- selected Category wise with date range 
    IF insupcat_id > 0 AND instartdate!='' AND inenddate!='' THEN
        WITH RECURSIVE EmployeeHierarchy AS (
				SELECT user_id,empcode,name,reporting,role FROM user_mst WHERE	empcode = inempcode-- 10000945 -- 10000950
				UNION ALL
				SELECT e.user_id,e.empcode,e.name,e.reporting,e.role FROM user_mst e
					JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode and e.role !=7
			)
		select  t_empnum, t_doc_count,t_camp_count,t_patient_scaned,t_patient_diag,t_prescribe INTO 
			TotalNoOfEmpReportingCount,TotalDoctorCount,TotalCampCount,TotalPatientScaneed,TotalPatientDiagnosed,TotalPrescribe from (
			SELECT -- f.user_id,f.empcode,f.name,f.reporting,f.role,
			 -- count(f.user_id) t_empnum,
             0 as t_empnum,
			(sum((select count(distinct camp_report_mst.code) 
			   from camp_report_mst where user_id=f.user_id and subcat_id=insupcat_id and status='Y'  and camp_date>=instartdate and camp_date<=inenddate ))) as t_doc_count
			  ,sum((select count(camp_report_mst.crid)  
					from camp_report_mst where user_id=f.user_id and subcat_id=insupcat_id and status='Y'  and camp_date>=instartdate and camp_date<=inenddate )) as t_camp_count    
			  ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
				inner join camp_report_mst crm on qcrm.crid=crm.crid 
				and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and crm.subcat_id=insupcat_id and camp_date>=instartdate and camp_date<=inenddate
				and rqid in (1,4,7))) as t_patient_scaned
			   ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
					inner join camp_report_mst crm on qcrm.crid=crm.crid 
					 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and crm.subcat_id=insupcat_id  and camp_date>=instartdate and camp_date<=inenddate
					 and rqid  in (2,5,8))) as t_patient_diag 
			   , sum((select IFNULL(sum(answer),0) as TotalPrescribe from question_camp_rep_mapping qcrm
									inner join camp_report_mst crm on qcrm.crid=crm.crid 
										 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and crm.subcat_id=insupcat_id  and camp_date>=instartdate and camp_date<=inenddate
										 and rqid  in (3,6,9))) as t_prescribe                      
				 FROM EmployeeHierarchy f order by role asc ) temp; 
      -- All Categories with date range            
	ELSEIF insupcat_id = 0 AND instartdate!='' AND inenddate!='' THEN
        WITH RECURSIVE EmployeeHierarchy AS (
				SELECT user_id,empcode,name,reporting,role FROM user_mst WHERE	empcode = inempcode-- 10000945 -- 10000950
				UNION ALL
				SELECT e.user_id,e.empcode,e.name,e.reporting,e.role FROM user_mst e
					JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode and e.role !=7
			)
		select  t_empnum, t_doc_count,t_camp_count,t_patient_scaned,t_patient_diag,t_prescribe INTO 
			TotalNoOfEmpReportingCount,TotalDoctorCount,TotalCampCount,TotalPatientScaneed,TotalPatientDiagnosed,TotalPrescribe from (
			SELECT -- f.user_id,f.empcode,f.name,f.reporting,f.role,
			 -- count(f.user_id) t_empnum,
             0 as t_empnum,
			(sum((select count(distinct camp_report_mst.code) 
			   from camp_report_mst where user_id=f.user_id  and status='Y'  and camp_date>=instartdate and camp_date<=inenddate ))) as t_doc_count
			  ,sum((select count(camp_report_mst.crid)  
					from camp_report_mst where user_id=f.user_id  and status='Y'  and camp_date>=instartdate and camp_date<=inenddate )) as t_camp_count    
			  ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
				inner join camp_report_mst crm on qcrm.crid=crm.crid 
				and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and camp_date>=instartdate and camp_date<=inenddate
				and rqid in (1,4,7))) as t_patient_scaned
			   ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
					inner join camp_report_mst crm on qcrm.crid=crm.crid 
					 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y'  and camp_date>=instartdate and camp_date<=inenddate
					 and rqid  in (2,5,8))) as t_patient_diag 
			   , sum((select IFNULL(sum(answer),0) as TotalPrescribe from question_camp_rep_mapping qcrm
									inner join camp_report_mst crm on qcrm.crid=crm.crid 
										 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y'  and camp_date>=instartdate and camp_date<=inenddate
										 and rqid  in (3,6,9))) as t_prescribe                      
				 FROM EmployeeHierarchy f order by role asc ) temp; 
      -- seleted Categories without date range             
	 ELSEIF insupcat_id > 0 AND instartdate='' AND inenddate='' THEN
        WITH RECURSIVE EmployeeHierarchy AS (
				SELECT user_id,empcode,name,reporting,role FROM user_mst WHERE	empcode = inempcode-- 10000945 -- 10000950
				UNION ALL
				SELECT e.user_id,e.empcode,e.name,e.reporting,e.role FROM user_mst e
					JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode and e.role !=7
			)
		select  t_empnum, t_doc_count,t_camp_count,t_patient_scaned,t_patient_diag,t_prescribe INTO 
			TotalNoOfEmpReportingCount,TotalDoctorCount,TotalCampCount,TotalPatientScaneed,TotalPatientDiagnosed,TotalPrescribe from (
			SELECT -- f.user_id,f.empcode,f.name,f.reporting,f.role,
			 -- count(f.user_id) t_empnum,
             0 as t_empnum,
			(sum((select count(distinct camp_report_mst.code) 
			   from camp_report_mst where user_id=f.user_id and subcat_id=insupcat_id and status='Y'  ))) as t_doc_count
			  ,sum((select count(camp_report_mst.crid)  
					from camp_report_mst where user_id=f.user_id and subcat_id=insupcat_id and status='Y'  )) as t_camp_count    
			  ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
				inner join camp_report_mst crm on qcrm.crid=crm.crid 
				and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and crm.subcat_id=insupcat_id 
				and rqid in (1,4,7))) as t_patient_scaned
			   ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
					inner join camp_report_mst crm on qcrm.crid=crm.crid 
					 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and crm.subcat_id=insupcat_id  
					 and rqid  in (2,5,8))) as t_patient_diag 
			   , sum((select IFNULL(sum(answer),0) as TotalPrescribe from question_camp_rep_mapping qcrm
									inner join camp_report_mst crm on qcrm.crid=crm.crid 
										 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' and crm.subcat_id=insupcat_id  
										 and rqid  in (3,6,9))) as t_prescribe                      
				 FROM EmployeeHierarchy f order by role asc ) temp; 
	-- All Categories without date range            
    ELSEIF insupcat_id = 0 AND instartdate='' AND inenddate='' THEN
        WITH RECURSIVE EmployeeHierarchy AS (
				SELECT user_id,empcode,name,reporting,role FROM user_mst WHERE	empcode = inempcode-- 10000945 -- 10000950
				UNION ALL
				SELECT e.user_id,e.empcode,e.name,e.reporting,e.role FROM user_mst e
					JOIN EmployeeHierarchy eh ON e.reporting = eh.empcode and e.role !=7
			)
		select  t_empnum, t_doc_count,t_camp_count,t_patient_scaned,t_patient_diag,t_prescribe INTO 
			TotalNoOfEmpReportingCount,TotalDoctorCount,TotalCampCount,TotalPatientScaneed,TotalPatientDiagnosed,TotalPrescribe from (
			SELECT -- f.user_id,f.empcode,f.name,f.reporting,f.role,
			 -- count(f.user_id) t_empnum,
             0 as t_empnum,
			(sum((select count(distinct camp_report_mst.code) 
			   from camp_report_mst where user_id=f.user_id  and status='Y'  ))) as t_doc_count
			  ,sum((select count(camp_report_mst.crid)  
					from camp_report_mst where user_id=f.user_id  and status='Y'  )) as t_camp_count    
			  ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
				inner join camp_report_mst crm on qcrm.crid=crm.crid 
				and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y'  
				and rqid in (1,4,7))) as t_patient_scaned
			   ,sum((select IFNULL(sum(answer),0)  from question_camp_rep_mapping qcrm
					inner join camp_report_mst crm on qcrm.crid=crm.crid 
					 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y' 
					 and rqid  in (2,5,8))) as t_patient_diag 
			   , sum((select IFNULL(sum(answer),0) as TotalPrescribe from question_camp_rep_mapping qcrm
									inner join camp_report_mst crm on qcrm.crid=crm.crid 
										 and qcrm.created_by=crm.created_by and crm.created_by=f.user_id and crm.status='Y'  
										 and rqid  in (3,6,9))) as t_prescribe                      
				 FROM EmployeeHierarchy f order by role asc ) temp; 	
    END IF;

   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFilteredReportData1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilteredReportData1`(IN `in_subcat_id` INT, IN `in_filter_type` VARCHAR(20), IN `in_start_date` DATE, IN `in_end_date` DATE)
BEGIN
    DECLARE cat_id INT;
    DECLARE cat_name VARCHAR(255);
    DECLARE doctor_count INT;
    DECLARE camp_count INT;
    DECLARE screened_count INT;
    DECLARE diagnosed_count INT;
    DECLARE prescription_count INT;

    
    -- Declare start_date and end_date with default values
    DECLARE start_date DATE DEFAULT '1970-01-01';  -- Default start date
    DECLARE end_date DATE DEFAULT NOW();
    
    -- Initialize start_date and end_date with default values
    SET start_date = '1970-01-01';  -- Default start date
    SET end_date = NOW();

    -- Calculate the date range for filtering based on in_filter_type
    IF in_filter_type = 'weekly' THEN
        SET start_date = DATE_SUB(NOW(), INTERVAL 7 DAY);
    ELSEIF in_filter_type = 'monthly' THEN
        SET start_date = DATE_SUB(NOW(), INTERVAL 30 DAY);
    END IF;
   
   -- SELECT CONCAT('start_date: ', start_date, ', end_date: ', end_date) AS debug_info;
    -- Override the date range if custom dates are provided
    IF in_start_date IS NOT NULL AND in_end_date IS NOT NULL THEN
       SET start_date = in_start_date;
        SET end_date = in_end_date;
     END IF;
 -- SELECT CONCAT('start_date: ', start_date, ', end_date: ', end_date) AS debug_info;
    -- Query 1: Get camp_count
    SELECT COUNT(*) INTO camp_count
    FROM camp_report_mst
    WHERE subcat_id = in_subcat_id
    AND created_date BETWEEN start_date AND end_date and camp_report_mst.status='Y';
    
    SELECT COUNT(DISTINCT camp_report_mst.code) INTO doctor_count FROM camp_report_mst WHERE subcat_id = in_subcat_id AND created_date BETWEEN start_date AND end_date and camp_report_mst.status='Y';
    -- Query 2: Get screened_count
    SELECT COALESCE(SUM(answer), 0) INTO screened_count
    FROM question_camp_rep_mapping INNER JOIN camp_report_mst on question_camp_rep_mapping.crid = camp_report_mst.crid
    WHERE question_camp_rep_mapping.rqid IN (1,4,7)
    AND question_camp_rep_mapping.subcat_id = in_subcat_id
    AND camp_report_mst.created_by BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';

    -- Query 3: Get diagnosed_count
    SELECT COALESCE(SUM(answer), 0) INTO diagnosed_count
    FROM question_camp_rep_mapping INNER JOIN camp_report_mst on question_camp_rep_mapping.crid = camp_report_mst.crid
     WHERE question_camp_rep_mapping.rqid IN (2,5,8,11)
    AND question_camp_rep_mapping.subcat_id = in_subcat_id
    AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    
     -- Query 3: Get prescription_count
    SELECT COALESCE(SUM(answer), 0) INTO prescription_count
    FROM question_camp_rep_mapping INNER JOIN camp_report_mst on question_camp_rep_mapping.crid = camp_report_mst.crid
     WHERE question_camp_rep_mapping.rqid IN (3,6,9)
    AND question_camp_rep_mapping.subcat_id = in_subcat_id
    AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';

    -- Get subcategory name
    SELECT subcategory_id, subcategory_name INTO cat_id, cat_name FROM subcategory_mst WHERE subcategory_id = in_subcat_id;

    -- Return the results
    SELECT cat_id AS cat_id,cat_name AS cat_name ,doctor_count AS doctor_count, camp_count AS camp_count, screened_count AS screened_count, diagnosed_count AS diagnosed_count,prescription_count AS prescription_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetFilterReportData2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetFilterReportData2`(IN `in_user_id` INT, IN `in_subcat_id` INT, IN `in_rqid1` INT, IN `in_rqid2` INT, IN `in_filter_type` VARCHAR(50), IN `in_start_date` DATE, IN `in_end_date` DATE)
BEGIN
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(255);
    DECLARE camp_count INT;
    DECLARE doctor_count INT;
    DECLARE screened_count INT;
    DECLARE diagnosed_count INT;
    DECLARE prescription_count INT;
    DECLARE role VARCHAR(255);
    DECLARE emp_code INT;

     -- Declare start_date and end_date with default values
    DECLARE start_date DATE DEFAULT '1970-01-01';  -- Default start date
    DECLARE end_date DATE DEFAULT NOW();

    -- Initialize start_date and end_date with default values
    SET start_date = '1970-01-01';  -- Default start date
    SET end_date = NOW();

    -- Calculate the date range for filtering based on in_filter_type
    IF in_filter_type = 'weekly' THEN
        SET start_date = DATE_SUB(NOW(), INTERVAL 7 DAY);
    ELSEIF in_filter_type = 'monthly' THEN
        SET start_date = DATE_SUB(NOW(), INTERVAL 30 DAY);
    END IF;

    -- Override the date range if custom dates are provided
    IF in_start_date IS NOT NULL AND in_end_date IS NOT NULL THEN
        SET start_date = in_start_date;
        SET end_date = in_end_date;
    END IF;

    -- Query 1: Get camp_count
    IF in_subcat_id IS NOT NULL THEN
        SELECT COUNT(*) INTO camp_count FROM camp_report_mst WHERE created_by = in_user_id AND subcat_id = in_subcat_id AND created_date BETWEEN start_date AND end_date and camp_report_mst.status='Y';
    ELSE
        SELECT COUNT(*) INTO camp_count FROM camp_report_mst WHERE created_by = in_user_id AND created_date BETWEEN start_date AND end_date and camp_report_mst.status='Y';
    END IF;
    
    -- Query 2: Get doctor_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COUNT(DISTINCT camp_report_mst.code) INTO doctor_count FROM camp_report_mst WHERE user_id = in_user_id AND subcat_id = in_subcat_id AND created_date BETWEEN start_date AND end_date and camp_report_mst.status='Y';
    ELSE
        SELECT COUNT(DISTINCT camp_report_mst.code) INTO doctor_count FROM camp_report_mst WHERE user_id = in_user_id AND created_date BETWEEN start_date AND end_date and camp_report_mst.status='Y';
    END IF;
    
    -- Query 3: Get screened_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COALESCE(SUM(answer), 0) INTO screened_count
        FROM question_camp_rep_mapping 
        INNER JOIN camp_report_mst ON question_camp_rep_mapping.crid = camp_report_mst.crid
        WHERE question_camp_rep_mapping.rqid IN (1, 4, 7)
        AND question_camp_rep_mapping.subcat_id = in_subcat_id
        AND question_camp_rep_mapping.created_by = in_user_id
        AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    ELSE
        SELECT COALESCE(SUM(answer), 0) INTO screened_count
        FROM question_camp_rep_mapping 
        INNER JOIN camp_report_mst ON question_camp_rep_mapping.crid = camp_report_mst.crid
        WHERE question_camp_rep_mapping.rqid IN (1, 4, 7)
        AND question_camp_rep_mapping.created_by = in_user_id
        AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    END IF;

    -- Query 4: Get diagnosed_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COALESCE(SUM(answer), 0) INTO diagnosed_count
        FROM question_camp_rep_mapping 
        INNER JOIN camp_report_mst ON question_camp_rep_mapping.crid = camp_report_mst.crid
        WHERE question_camp_rep_mapping.rqid IN (2, 5, 8)
        AND question_camp_rep_mapping.created_by = in_user_id
        AND question_camp_rep_mapping.subcat_id = in_subcat_id
        AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    ELSE
        SELECT COALESCE(SUM(answer), 0) INTO diagnosed_count
        FROM question_camp_rep_mapping 
        INNER JOIN camp_report_mst ON question_camp_rep_mapping.crid = camp_report_mst.crid
        WHERE question_camp_rep_mapping.rqid IN (2, 5, 8)
        AND question_camp_rep_mapping.created_by = in_user_id
        AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    END IF;
    
     -- Query 4: Get prescription_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COALESCE(SUM(answer), 0) INTO prescription_count
        FROM question_camp_rep_mapping 
        INNER JOIN camp_report_mst ON question_camp_rep_mapping.crid = camp_report_mst.crid
        WHERE question_camp_rep_mapping.rqid IN (3,6,9)
        AND question_camp_rep_mapping.created_by = in_user_id
        AND question_camp_rep_mapping.subcat_id = in_subcat_id
        AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    ELSE
        SELECT COALESCE(SUM(answer), 0) INTO prescription_count
        FROM question_camp_rep_mapping 
        INNER JOIN camp_report_mst ON question_camp_rep_mapping.crid = camp_report_mst.crid
        WHERE question_camp_rep_mapping.rqid IN (3,6,9)
        AND question_camp_rep_mapping.created_by = in_user_id
        AND camp_report_mst.created_date BETWEEN start_date AND end_date and question_camp_rep_mapping.status='Y';
    END IF;
    
    SELECT empcode,name,user_id INTO emp_code,emp_name,emp_id FROM user_mst WHERE user_id = in_user_id;
    select role_mst.rolename INTO role from user_mst INNER JOIN role_mst ON user_mst.role = role_mst.role_id WHERE user_id = in_user_id;

    -- Return the results
    SELECT emp_code AS emp_code,emp_id AS emp_id, emp_name AS emp_name, doctor_count AS doctor_count, camp_count AS camp_count, screened_count AS screened_count, diagnosed_count AS diagnosed_count, prescription_count AS prescription_count,role as role;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetReportData1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetReportData1`(IN `in_user_id` INT, IN `in_subcat_id` INT, IN `in_rqid1` INT, IN `in_rqid2` INT)
BEGIN
    DECLARE emp_id INT;
    DECLARE emp_name VARCHAR(255);
    DECLARE camp_count INT;
    DECLARE doctor_count INT;
    DECLARE screened_count INT;
    DECLARE diagnosed_count INT;
    DECLARE prescription_count INT;
    DECLARE role VARCHAR(255);
    DECLARE emp_code INT;
    
    -- Query 1: Get camp_count
    IF in_subcat_id IS NOT NULL THEN
        SELECT COUNT(*) INTO camp_count FROM camp_report_mst WHERE created_by = in_user_id AND subcat_id = in_subcat_id and camp_report_mst.status='Y';
    ELSE
        SELECT COUNT(*) INTO camp_count FROM camp_report_mst WHERE created_by = in_user_id and camp_report_mst.status='Y';
    END IF;
    
    -- Query 2: Get doctor_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COUNT(DISTINCT camp_report_mst.code) INTO doctor_count FROM camp_report_mst WHERE user_id = in_user_id AND subcat_id = in_subcat_id and camp_report_mst.status='Y';
    ELSE
        SELECT COUNT(DISTINCT camp_report_mst.code) INTO doctor_count FROM camp_report_mst WHERE user_id = in_user_id and camp_report_mst.status='Y';
    END IF;
    
    -- Query 3: Get screened_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COALESCE(SUM(answer), 0) INTO screened_count FROM question_camp_rep_mapping WHERE rqid IN (1, 4, 7) AND created_by = in_user_id AND subcat_id = in_subcat_id and question_camp_rep_mapping.status='Y';
    ELSE
        SELECT COALESCE(SUM(answer), 0) INTO screened_count FROM question_camp_rep_mapping WHERE rqid IN (1, 4, 7) AND created_by = in_user_id and question_camp_rep_mapping.status='Y';
    END IF;

    -- Query 4: Get diagnosed_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COALESCE(SUM(answer), 0) INTO diagnosed_count FROM question_camp_rep_mapping WHERE rqid IN (2, 5, 8) AND created_by = in_user_id AND subcat_id = in_subcat_id and question_camp_rep_mapping.status='Y';
    ELSE
        SELECT COALESCE(SUM(answer), 0) INTO diagnosed_count FROM question_camp_rep_mapping WHERE rqid IN (2, 5, 8) AND created_by = in_user_id and question_camp_rep_mapping.status='Y';
    END IF;
    
     -- Query 4: Get prescription_count
    IF in_subcat_id IS NOT NULL THEN 
        SELECT COALESCE(SUM(answer), 0) INTO prescription_count FROM question_camp_rep_mapping WHERE rqid IN (3,6,9) AND created_by = in_user_id AND subcat_id = in_subcat_id and question_camp_rep_mapping.status='Y';
    ELSE
        SELECT COALESCE(SUM(answer), 0) INTO prescription_count FROM question_camp_rep_mapping WHERE rqid IN (3,6,9) AND created_by = in_user_id and question_camp_rep_mapping.status='Y';
    END IF;
    
    SELECT empcode,name,user_id INTO emp_code,emp_name,emp_id FROM user_mst WHERE user_id = in_user_id;
    
    select role_mst.rolename INTO role from user_mst INNER JOIN role_mst ON user_mst.role = role_mst.role_id WHERE user_id = in_user_id;

    -- Return the results
    SELECT emp_code AS emp_code,emp_id AS emp_id,emp_name AS emp_name , doctor_count AS doctor_count, camp_count AS camp_count, screened_count AS screened_count, diagnosed_count AS diagnosed_count , prescription_count AS prescription_count, role AS role;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSubCatData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSubCatData`(IN `in_subcat_id` INT)
BEGIN
    DECLARE cat_id INT;
    DECLARE cat_name VARCHAR(255);
    DECLARE doctor_count INT;
    DECLARE camp_count INT;
    DECLARE screened_count INT;
    DECLARE diagnosed_count INT;
    DECLARE prescription_count INT;
    
    -- Query 1: Get camp_count
    SELECT COUNT(*) INTO camp_count FROM camp_report_mst WHERE subcat_id = in_subcat_id and camp_report_mst.status='Y';
    SELECT COUNT(DISTINCT camp_report_mst.code) INTO doctor_count FROM camp_report_mst WHERE subcat_id = in_subcat_id and camp_report_mst.status='Y';
    -- Query 2: Get screened_count
    SELECT COALESCE(SUM(answer), 0) INTO screened_count FROM question_camp_rep_mapping WHERE rqid IN(1,4,7) AND subcat_id = in_subcat_id and question_camp_rep_mapping.status='Y';

    -- Query 3: Get diagnosed_count
    SELECT COALESCE(SUM(answer), 0) INTO diagnosed_count FROM question_camp_rep_mapping WHERE rqid IN(2,5,8) AND subcat_id = in_subcat_id and question_camp_rep_mapping.status='Y';
    
        -- Query 3: Get prescription_count
    SELECT COALESCE(SUM(answer), 0) INTO prescription_count FROM question_camp_rep_mapping WHERE rqid IN (3,6,9) AND subcat_id = in_subcat_id and question_camp_rep_mapping.status='Y';
    
    SELECT subcategory_id, subcategory_name INTO cat_id, cat_name FROM subcategory_mst WHERE subcategory_id = in_subcat_id;

    -- Return the results
    SELECT cat_id AS cat_id,cat_name AS cat_name ,doctor_count AS doctor_count, camp_count AS camp_count, screened_count AS screened_count, diagnosed_count AS diagnosed_count, prescription_count AS prescription_count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateCampReportWithInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateCampReportWithInfo`(IN `p_crId` INT, IN `p_code` VARCHAR(100), IN `p_doctorName` VARCHAR(255), IN `p_userId` INT)
BEGIN
  -- Update camp_date if provided
  IF p_code IS NOT NULL THEN
    UPDATE camp_report_mst
    SET camp_report_mst.code = p_code
    WHERE crid = p_crId;
  END IF;

  -- Update doctor_name if provided
  IF p_doctorName IS NOT NULL THEN
    UPDATE camp_report_mst
    SET doctor_name = p_doctorName
    WHERE crid = p_crId;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateDoctor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateDoctor`(IN `p_userid` INT, IN `p_docid` INT, IN `p_docname` VARCHAR(255), IN `p_docimg` VARCHAR(255), IN `p_date` DATE, IN `p_time` VARCHAR(100), IN `p_venue` VARCHAR(255), IN `p_code` VARCHAR(255))
BEGIN
    -- Update the doctor's information
      DECLARE current_datetime DATETIME;
  
  -- Get the current datetime using NOW()
  SET current_datetime = NOW();
    UPDATE doctor_mst
    SET
        doctor_name = COALESCE(p_docname, doctor_name),
        doctor_img = COALESCE(p_docimg, doctor_img),
        doctor_mst.code = p_code,
        doctor_mst.camp_date = p_date,
        doctor_mst.camp_time = p_time,
        doctor_mst.camp_venue = p_venue,
        modified_date = current_datetime,
        modified_by = p_userid
    WHERE doctor_id = p_docid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdatePatient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePatient`(IN `p_pId` INT, IN `p_name` VARCHAR(100), IN `p_age` INT, IN `p_gender` VARCHAR(50), IN `p_bp` VARCHAR(100), IN `p_sbp` VARCHAR(200), IN `p_dbp` VARCHAR(100), IN `p_isHypertensive` VARCHAR(250), IN `p_tc` VARCHAR(250), IN `p_tg` VARCHAR(100), IN `p_hdl` VARCHAR(100), IN `p_nonhdl` VARCHAR(100), IN `p_ldl` VARCHAR(100),IN `p_ldlhdl` VARCHAR(100),IN `p_heartrate` VARCHAR(100),IN `p_fibrillation` VARCHAR(100))
BEGIN
 
  IF p_name IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.name = p_name
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_age IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.age = p_age
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_gender IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.gender = p_gender
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_bp IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.bp = p_bp
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_sbp IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.sbp = p_sbp
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_dbp IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.dbp = p_dbp
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_isHypertensive IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.isHypertensive = p_isHypertensive
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
  IF p_tc IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.tc = p_tc
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
  IF p_tg IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.tg = p_tg
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
  IF p_hdl IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.hdl = p_hdl
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_nonhdl IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.nonhdl = p_nonhdl
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_ldl IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.ldl = p_ldl
    WHERE patient_mst.pa_id = p_pId;
  END IF;
    IF p_ldlhdl IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.ldlhdl = p_ldlhdl
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_heartrate IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.heart_rate = p_heartrate
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
   IF p_fibrillation IS NOT NULL THEN
    UPDATE patient_mst
    SET patient_mst.fibrillation = p_fibrillation
    WHERE patient_mst.pa_id = p_pId;
  END IF;
  
  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-07 18:51:32
