-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: drone_store
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Test1','2022-05-18 17:25:07','2022-05-18 20:25:07');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_product` (
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `category_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  CONSTRAINT `category_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (1,1,'2022-05-18 17:25:26','2022-05-18 20:25:26'),(1,2,'2022-05-19 11:23:33','2022-05-19 14:23:33');
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(15) NOT NULL,
  `status` enum('register','not register') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Tes','T',NULL,NULL,'3599546161','not register','2022-05-19 07:20:18','2022-05-19 10:20:18'),(2,'Test','2','afsl@fsd.com','klaskngsd','6493166','register','2022-05-19 07:20:47','2022-05-19 10:20:47'),(3,'Tes2','1',NULL,NULL,'325325326','not register','2022-05-19 07:21:05','2022-05-19 10:21:05');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,3,'2022-05-22 09:32:53','2022-05-22 12:32:53'),(1,2,'2022-05-22 09:54:18','2022-05-22 12:54:18');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2022-05-19 11:09:46','2022-05-19 08:09:49','2022-05-19 11:09:49'),(2,1,'2022-05-19 12:36:52','2022-05-19 09:36:52','2022-05-19 12:36:52'),(3,1,'2022-05-19 12:37:18','2022-05-19 09:37:18','2022-05-19 12:37:18'),(4,1,'2022-05-19 12:37:34','2022-05-19 09:37:34','2022-05-19 12:37:34'),(5,1,'2022-05-19 12:39:48','2022-05-19 09:39:48','2022-05-19 12:39:48'),(6,1,'2022-05-19 12:42:28','2022-05-19 09:42:28','2022-05-19 12:42:28'),(7,1,'2022-05-19 12:45:16','2022-05-19 09:45:16','2022-05-19 12:45:16'),(8,1,'2022-05-19 13:29:20','2022-05-19 10:29:20','2022-05-19 13:29:20'),(9,1,'2022-05-19 13:32:01','2022-05-19 10:32:01','2022-05-19 13:32:01'),(10,1,'2022-05-19 13:33:56','2022-05-19 10:33:56','2022-05-19 13:33:56'),(11,1,'2022-05-19 13:56:47','2022-05-19 10:56:47','2022-05-19 13:56:47'),(12,1,'2022-05-19 13:59:40','2022-05-19 10:59:40','2022-05-19 13:59:40'),(13,1,'2022-05-19 14:01:10','2022-05-19 11:01:10','2022-05-19 14:01:10'),(14,1,'2022-05-19 14:01:40','2022-05-19 11:01:40','2022-05-19 14:01:40'),(15,1,'2022-05-19 14:02:12','2022-05-19 11:02:12','2022-05-19 14:02:12'),(16,1,'2022-05-19 14:02:45','2022-05-19 11:02:45','2022-05-19 14:02:45'),(17,1,'2022-05-19 14:03:05','2022-05-19 11:03:05','2022-05-19 14:03:05'),(18,1,'2022-05-19 14:03:10','2022-05-19 11:03:10','2022-05-19 14:03:10'),(19,1,'2022-05-19 14:03:44','2022-05-19 11:03:44','2022-05-19 14:03:44'),(20,1,'2022-05-19 14:04:06','2022-05-19 11:04:06','2022-05-19 14:04:06'),(21,1,'2022-05-19 14:04:20','2022-05-19 11:04:20','2022-05-19 14:04:20'),(22,1,'2022-05-19 14:04:58','2022-05-19 11:04:58','2022-05-19 14:04:58'),(23,1,'2022-05-19 14:05:10','2022-05-19 11:05:10','2022-05-19 14:05:10'),(24,1,'2022-05-19 14:05:17','2022-05-19 11:05:17','2022-05-19 14:05:17'),(25,1,'2022-05-19 14:05:29','2022-05-19 11:05:29','2022-05-19 14:05:29'),(26,1,'2022-05-19 14:05:58','2022-05-19 11:05:58','2022-05-19 14:05:58'),(27,1,'2022-05-19 14:06:12','2022-05-19 11:06:12','2022-05-19 14:06:12'),(28,1,'2022-05-19 14:06:19','2022-05-19 11:06:19','2022-05-19 14:06:19'),(29,1,'2022-05-19 14:07:19','2022-05-19 11:07:19','2022-05-19 14:07:19'),(30,1,'2022-05-19 14:07:39','2022-05-19 11:07:39','2022-05-19 14:07:39'),(31,1,'2022-05-19 14:08:05','2022-05-19 11:08:05','2022-05-19 14:08:05'),(32,1,'2022-05-19 14:08:11','2022-05-19 11:08:11','2022-05-19 14:08:11'),(33,1,'2022-05-19 14:08:17','2022-05-19 11:08:17','2022-05-19 14:08:17'),(34,1,'2022-05-19 14:09:21','2022-05-19 11:09:21','2022-05-19 14:09:21'),(35,1,'2022-05-19 14:09:40','2022-05-19 11:09:40','2022-05-19 14:09:40'),(36,1,'2022-05-19 14:11:29','2022-05-19 11:11:29','2022-05-19 14:11:29'),(37,1,'2022-05-19 14:49:07','2022-05-19 11:49:07','2022-05-19 14:49:07'),(38,1,'2022-05-21 19:02:14','2022-05-21 16:02:14','2022-05-21 19:02:14'),(39,1,'2022-05-21 19:03:13','2022-05-21 16:03:13','2022-05-21 19:03:13'),(40,1,'2022-05-21 19:03:35','2022-05-21 16:03:35','2022-05-21 19:03:35'),(41,1,'2022-05-21 19:06:54','2022-05-21 16:06:54','2022-05-21 19:06:54'),(42,1,'2022-05-21 19:07:13','2022-05-21 16:07:13','2022-05-21 19:07:13'),(43,1,'2022-05-21 19:07:41','2022-05-21 16:07:41','2022-05-21 19:07:41'),(44,1,'2022-05-21 19:08:18','2022-05-21 16:08:18','2022-05-21 19:08:18'),(45,1,'2022-05-21 19:08:27','2022-05-21 16:08:27','2022-05-21 19:08:27'),(46,1,'2022-05-21 19:08:41','2022-05-21 16:08:41','2022-05-21 19:08:41'),(47,1,'2022-05-21 19:08:54','2022-05-21 16:08:54','2022-05-21 19:08:54'),(48,1,'2022-05-21 19:09:09','2022-05-21 16:09:09','2022-05-21 19:09:09'),(49,1,'2022-05-21 19:09:22','2022-05-21 16:09:22','2022-05-21 19:09:22'),(50,1,'2022-05-21 19:12:11','2022-05-21 16:12:11','2022-05-21 19:12:11'),(51,1,'2022-05-21 19:13:10','2022-05-21 16:13:10','2022-05-21 19:13:10'),(52,1,'2022-05-21 19:13:45','2022-05-21 16:13:45','2022-05-21 19:13:45'),(53,1,'2022-05-21 19:15:05','2022-05-21 16:15:05','2022-05-21 19:15:05'),(54,1,'2022-05-21 19:16:37','2022-05-21 16:16:37','2022-05-21 19:16:37'),(55,1,'2022-05-21 19:17:09','2022-05-21 16:17:09','2022-05-21 19:17:09'),(56,1,'2022-05-21 19:18:54','2022-05-21 16:18:54','2022-05-21 19:18:54'),(57,1,'2022-05-21 19:19:31','2022-05-21 16:19:31','2022-05-21 19:19:31'),(58,1,'2022-05-21 19:20:50','2022-05-21 16:20:50','2022-05-21 19:20:50'),(59,1,'2022-05-21 19:21:30','2022-05-21 16:21:30','2022-05-21 19:21:30'),(60,1,'2022-05-21 19:22:03','2022-05-21 16:22:03','2022-05-21 19:22:03'),(61,1,'2022-05-21 19:23:47','2022-05-21 16:23:47','2022-05-21 19:23:47'),(62,1,'2022-05-21 19:24:15','2022-05-21 16:24:15','2022-05-21 19:24:15'),(63,1,'2022-05-21 19:25:31','2022-05-21 16:25:31','2022-05-21 19:25:31'),(64,1,'2022-05-21 19:26:07','2022-05-21 16:26:07','2022-05-21 19:26:07'),(65,1,'2022-05-22 10:46:54','2022-05-22 07:46:54','2022-05-22 10:46:54'),(66,1,'2022-05-22 10:48:47','2022-05-22 07:48:47','2022-05-22 10:48:47'),(67,1,'2022-05-22 10:49:26','2022-05-22 07:49:26','2022-05-22 10:49:26'),(68,1,'2022-05-22 10:50:29','2022-05-22 07:50:29','2022-05-22 10:50:29'),(69,1,'2022-05-22 10:50:55','2022-05-22 07:50:55','2022-05-22 10:50:55'),(70,1,'2022-05-22 10:56:29','2022-05-22 07:56:29','2022-05-22 10:56:29'),(71,1,'2022-05-22 11:01:02','2022-05-22 08:01:02','2022-05-22 11:01:02'),(72,1,'2022-05-22 11:01:53','2022-05-22 08:01:53','2022-05-22 11:01:53'),(73,1,'2022-05-22 11:02:51','2022-05-22 08:02:51','2022-05-22 11:02:51'),(74,1,'2022-05-22 11:04:14','2022-05-22 08:04:14','2022-05-22 11:04:14'),(75,1,'2022-05-22 11:10:09','2022-05-22 08:10:09','2022-05-22 11:10:09'),(76,1,'2022-05-22 11:17:24','2022-05-22 08:17:24','2022-05-22 11:17:24'),(77,1,'2022-05-22 11:21:13','2022-05-22 08:21:13','2022-05-22 11:21:13'),(78,1,'2022-05-22 12:14:40','2022-05-22 09:14:40','2022-05-22 12:14:40'),(79,1,'2022-05-22 12:32:42','2022-05-22 09:32:42','2022-05-22 12:32:42');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_product`
--

DROP TABLE IF EXISTS `order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_product` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_amount` int NOT NULL,
  `product_price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_product`
--

LOCK TABLES `order_product` WRITE;
/*!40000 ALTER TABLE `order_product` DISABLE KEYS */;
INSERT INTO `order_product` VALUES (1,4,3,12,'2022-05-19 09:44:08','2022-05-19 12:44:08'),(1,2,5,155,'2022-05-19 09:47:14','2022-05-19 12:47:14'),(1,1,1,5,'2022-05-19 09:59:16','2022-05-19 12:59:16'),(1,2,1,142,'2022-05-19 09:59:16','2022-05-19 12:59:16'),(1,2,5,155,'2022-05-19 10:05:53','2022-05-19 13:05:53'),(1,2,5,155,'2022-05-19 10:27:13','2022-05-19 13:27:13'),(1,2,5,155,'2022-05-19 10:27:13','2022-05-19 13:27:13'),(8,1,5,155,'2022-05-19 10:29:20','2022-05-19 13:29:20'),(8,1,5,155,'2022-05-19 10:29:20','2022-05-19 13:29:20'),(9,1,5,155,'2022-05-19 10:32:01','2022-05-19 13:32:01'),(9,1,5,155,'2022-05-19 10:32:01','2022-05-19 13:32:01'),(10,1,5,155,'2022-05-19 10:33:56','2022-05-19 13:33:56'),(10,1,5,155,'2022-05-19 10:33:56','2022-05-19 13:33:56'),(11,1,7,155,'2022-05-19 10:56:47','2022-05-19 13:56:47'),(11,1,7,155,'2022-05-19 10:56:47','2022-05-19 13:56:47'),(12,1,7,155,'2022-05-19 10:59:40','2022-05-19 13:59:40'),(12,1,7,155,'2022-05-19 10:59:40','2022-05-19 13:59:40'),(13,1,7,155,'2022-05-19 11:01:10','2022-05-19 14:01:10'),(13,1,7,155,'2022-05-19 11:01:10','2022-05-19 14:01:10'),(14,1,7,155,'2022-05-19 11:01:40','2022-05-19 14:01:40'),(14,1,7,155,'2022-05-19 11:01:40','2022-05-19 14:01:40'),(18,1,7,155,'2022-05-19 11:03:10','2022-05-19 14:03:10'),(18,1,7,155,'2022-05-19 11:03:10','2022-05-19 14:03:10'),(19,1,7,155,'2022-05-19 11:03:44','2022-05-19 14:03:44'),(25,1,7,155,'2022-05-19 11:05:29','2022-05-19 14:05:29'),(28,1,7,155,'2022-05-19 11:06:19','2022-05-19 14:06:19'),(33,4,5,55,'2022-05-19 11:08:17','2022-05-19 14:08:17'),(33,1,7,155,'2022-05-19 11:08:17','2022-05-19 14:08:17'),(34,4,5,55,'2022-05-19 11:09:21','2022-05-19 14:09:21'),(34,1,7,155,'2022-05-19 11:09:21','2022-05-19 14:09:21'),(35,4,5,55,'2022-05-19 11:09:40','2022-05-19 14:09:40'),(35,1,7,155,'2022-05-19 11:09:40','2022-05-19 14:09:40'),(36,4,5,55,'2022-05-19 11:11:29','2022-05-19 14:11:29'),(36,1,7,155,'2022-05-19 11:11:29','2022-05-19 14:11:29'),(37,1,4,50,'2022-05-19 11:49:07','2022-05-19 14:49:07'),(37,2,4,50,'2022-05-19 11:49:07','2022-05-19 14:49:07'),(55,1,1,1500,'2022-05-21 16:17:09','2022-05-21 19:17:09'),(55,3,1,155,'2022-05-21 16:17:09','2022-05-21 19:17:09'),(56,1,1,1500,'2022-05-21 16:18:54','2022-05-21 19:18:54'),(56,3,1,155,'2022-05-21 16:18:54','2022-05-21 19:18:54'),(57,1,1,1500,'2022-05-21 16:19:31','2022-05-21 19:19:31'),(57,3,1,155,'2022-05-21 16:19:31','2022-05-21 19:19:31'),(58,1,1,1500,'2022-05-21 16:20:50','2022-05-21 19:20:50'),(58,3,1,155,'2022-05-21 16:20:50','2022-05-21 19:20:50'),(59,1,1,1500,'2022-05-21 16:21:30','2022-05-21 19:21:30'),(59,3,1,155,'2022-05-21 16:21:30','2022-05-21 19:21:30'),(60,1,1,1500,'2022-05-21 16:22:03','2022-05-21 19:22:03'),(60,3,1,155,'2022-05-21 16:22:03','2022-05-21 19:22:03'),(61,1,1,1500,'2022-05-21 16:23:47','2022-05-21 19:23:47'),(61,3,1,155,'2022-05-21 16:23:47','2022-05-21 19:23:47'),(62,1,1,1500,'2022-05-21 16:24:15','2022-05-21 19:24:15'),(62,3,1,155,'2022-05-21 16:24:15','2022-05-21 19:24:15'),(63,1,1,1500,'2022-05-21 16:25:31','2022-05-21 19:25:31'),(64,1,1,1500,'2022-05-21 16:26:07','2022-05-21 19:26:07'),(65,3,5,155,'2022-05-22 07:46:54','2022-05-22 10:46:54'),(66,3,5,155,'2022-05-22 07:48:47','2022-05-22 10:48:47'),(67,3,5,155,'2022-05-22 07:49:26','2022-05-22 10:49:26'),(68,3,5,155,'2022-05-22 07:50:29','2022-05-22 10:50:29'),(69,3,5,155,'2022-05-22 07:50:55','2022-05-22 10:50:55'),(70,3,5,155,'2022-05-22 07:56:29','2022-05-22 10:56:29'),(71,2,1,155,'2022-05-22 08:01:02','2022-05-22 11:01:02'),(72,2,1,155,'2022-05-22 08:01:53','2022-05-22 11:01:53'),(73,1,1,1500,'2022-05-22 08:02:51','2022-05-22 11:02:51'),(74,1,1,1500,'2022-05-22 08:04:14','2022-05-22 11:04:14'),(75,1,1,1500,'2022-05-22 08:10:09','2022-05-22 11:10:09'),(76,1,1,1500,'2022-05-22 08:17:24','2022-05-22 11:17:24'),(77,2,1,155,'2022-05-22 08:21:13','2022-05-22 11:21:13'),(78,2,1,155,'2022-05-22 09:14:40','2022-05-22 12:14:40'),(79,1,1,1500,'2022-05-22 09:32:42','2022-05-22 12:32:42');
/*!40000 ALTER TABLE `order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_photo`
--

DROP TABLE IF EXISTS `product_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_photo` (
  `photo_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`photo_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `product_photo_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_photo`
--

LOCK TABLES `product_photo` WRITE;
/*!40000 ALTER TABLE `product_photo` DISABLE KEYS */;
INSERT INTO `product_photo` VALUES (1,1,'product-img.jpg','2022-05-18 20:02:48','2022-05-19 17:23:35'),(2,2,'product-img.jpg','2022-05-18 20:02:48','2022-05-19 17:23:35'),(3,3,'product-img.jpg','2022-05-19 11:14:45','2022-05-19 17:23:35'),(5,4,'product-img.jpg','2022-05-19 10:48:39','2022-05-19 17:23:35');
/*!40000 ALTER TABLE `product_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` int NOT NULL,
  `available` tinyint(1) DEFAULT (true),
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Test','dafgadlgnlkadnglang',352,1,1500,'2022-05-18 17:24:43','2022-05-22 12:32:42'),(2,'Test2','asflsdgak',1,1,155,'2022-05-18 19:03:36','2022-05-22 12:14:40'),(3,'Test3','asflsdgak',0,1,155,'2022-05-18 19:03:36','2022-05-22 10:56:29'),(4,'Test4','asflsdgak',429,1,155,'2022-05-18 19:03:36','2022-05-20 14:18:27');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-22 12:56:17
