-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: culdampolla
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `carrer` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `pis` varchar(45) DEFAULT NULL,
  `porta` varchar(45) DEFAULT NULL,
  `ciutat` varchar(45) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Bocamoll','25','2','3','Barcallona','08025','Espanyistan');
INSERT INTO `address` VALUES (2,'Coquelicot','52','7','4','Vignobles du Rivesaltes','1154565','Guayomini');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(20) NOT NULL,
  `telefon` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `data_registre` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `recomanat_per` int DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Aretha','0188978944','rescue@me.hold','2021-01-12 17:50:46',NULL);
INSERT INTO `client` VALUES (2,'Etta','01645567','rather@be.blind','2021-01-12 17:51:49',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_address`
--

DROP TABLE IF EXISTS `client_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_address` (
  `client_address_id` int NOT NULL AUTO_INCREMENT,
  `client_client_id` int NOT NULL,
  `address_address_id` int NOT NULL,
  PRIMARY KEY (`client_address_id`,`client_client_id`),
  KEY `fk_client_address_client1_idx` (`client_client_id`),
  KEY `fk_client_address_address1_idx` (`address_address_id`),
  CONSTRAINT `fk_client_address_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_client_address_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_address`
--

LOCK TABLES `client_address` WRITE;
/*!40000 ALTER TABLE `client_address` DISABLE KEYS */;
INSERT INTO `client_address` VALUES (1,1,1);
/*!40000 ALTER TABLE `client_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `nom` varchar(20) NOT NULL,
  `proveidor_id` int DEFAULT NULL,
  PRIMARY KEY (`nom`),
  KEY `proveidor_id_idx` (`proveidor_id`),
  CONSTRAINT `proveidor_id` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`proveidor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES ('Gucci Luz',1);
INSERT INTO `marca` VALUES ('HugoSosBos',2);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor`
--

DROP TABLE IF EXISTS `proveidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor` (
  `proveidor_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  `fax` int DEFAULT NULL,
  `nif` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`proveidor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor`
--

LOCK TABLES `proveidor` WRITE;
/*!40000 ALTER TABLE `proveidor` DISABLE KEYS */;
INSERT INTO `proveidor` VALUES (1,'Gluglu Aquaman','4564564',45646,'5464864aa');
INSERT INTO `proveidor` VALUES (2,'Rom`petechos S. L.','4564777444',7897945,'54648aa');
/*!40000 ALTER TABLE `proveidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveidor_address`
--

DROP TABLE IF EXISTS `proveidor_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveidor_address` (
  `proveidor_address_id` int NOT NULL AUTO_INCREMENT,
  `proveidor_proveidor_id` int NOT NULL,
  `address_address_id` int NOT NULL,
  PRIMARY KEY (`proveidor_address_id`,`proveidor_proveidor_id`),
  KEY `fk_proveidor_address_proveidor1_idx` (`proveidor_proveidor_id`),
  KEY `fk_proveidor_address_address1_idx` (`address_address_id`),
  CONSTRAINT `fk_proveidor_address_address1` FOREIGN KEY (`address_address_id`) REFERENCES `address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_proveidor_address_proveidor1` FOREIGN KEY (`proveidor_proveidor_id`) REFERENCES `proveidor` (`proveidor_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveidor_address`
--

LOCK TABLES `proveidor_address` WRITE;
/*!40000 ALTER TABLE `proveidor_address` DISABLE KEYS */;
INSERT INTO `proveidor_address` VALUES (1,1,1);
INSERT INTO `proveidor_address` VALUES (2,1,2);
/*!40000 ALTER TABLE `proveidor_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ulleres`
--

DROP TABLE IF EXISTS `ulleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ulleres` (
  `ulleres_id` int NOT NULL AUTO_INCREMENT,
  `marca` varchar(20) NOT NULL,
  `grad_esquerra` double DEFAULT NULL,
  `grad_dreta` double DEFAULT NULL,
  `muntura` set('flotant','pasta','metalica') DEFAULT NULL,
  `color_muntura` varchar(10) DEFAULT NULL,
  `color_vidre_dret` varchar(10) DEFAULT NULL,
  `preu` decimal(10,0) DEFAULT NULL,
  `empleat` varchar(10) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`ulleres_id`),
  KEY `marca_idx` (`marca`),
  KEY `client_idx` (`client_id`),
  CONSTRAINT `client` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE RESTRICT,
  CONSTRAINT `marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`nom`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ulleres`
--

LOCK TABLES `ulleres` WRITE;
/*!40000 ALTER TABLE `ulleres` DISABLE KEYS */;
INSERT INTO `ulleres` VALUES (1,'Gucci Luz',2.3,3.2,'flotant','groc','verd',23,'dasfsd',1);
/*!40000 ALTER TABLE `ulleres` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 10:21:34
