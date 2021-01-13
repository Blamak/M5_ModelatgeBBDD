-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: pizzeria
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
-- Table structure for table `botiga`
--

DROP TABLE IF EXISTS `botiga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `botiga` (
  `botiga_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(254) COLLATE utf8_bin DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `localitat_localitat_id` int NOT NULL,
  PRIMARY KEY (`botiga_id`),
  KEY `fk_botiga_localitat1_idx` (`localitat_localitat_id`),
  CONSTRAINT `fk_botiga_localitat1` FOREIGN KEY (`localitat_localitat_id`) REFERENCES `localitat` (`localitat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `botiga`
--

LOCK TABLES `botiga` WRITE;
/*!40000 ALTER TABLE `botiga` DISABLE KEYS */;
INSERT INTO `botiga` VALUES (1,'Arlongton 897','44774',2);
INSERT INTO `botiga` VALUES (2,'Saussalito 376','55544',1);
/*!40000 ALTER TABLE `botiga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_pizza`
--

DROP TABLE IF EXISTS `categoria_pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_pizza` (
  `categoria_pizza_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `productes_productes_id` int NOT NULL,
  PRIMARY KEY (`categoria_pizza_id`,`productes_productes_id`),
  KEY `fk_categoria_pizza_productes1_idx` (`productes_productes_id`),
  CONSTRAINT `fk_categoria_pizza_productes1` FOREIGN KEY (`productes_productes_id`) REFERENCES `productes` (`productes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pizza`
--

LOCK TABLES `categoria_pizza` WRITE;
/*!40000 ALTER TABLE `categoria_pizza` DISABLE KEYS */;
INSERT INTO `categoria_pizza` VALUES (1,'ortolana',3);
INSERT INTO `categoria_pizza` VALUES (2,'marinara',3);
/*!40000 ALTER TABLE `categoria_pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) COLLATE utf8_bin NOT NULL,
  `cognoms` varchar(20) COLLATE utf8_bin NOT NULL,
  `address` varchar(254) COLLATE utf8_bin DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `telefon` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `localitat_localitat_id` int NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_client_localitat1_idx` (`localitat_localitat_id`),
  CONSTRAINT `fk_client_localitat1` FOREIGN KEY (`localitat_localitat_id`) REFERENCES `localitat` (`localitat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Jeremy','Irons Maidens','Mulholland Drive','1122233','0146513448',1);
INSERT INTO `client` VALUES (2,'Martina','Hingis Kahn','Acorn St.','654789','123314745',2);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda`
--

DROP TABLE IF EXISTS `comanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda` (
  `comanda_id` int NOT NULL AUTO_INCREMENT,
  `datahora` datetime DEFAULT CURRENT_TIMESTAMP,
  `repartiment` enum('domicili','botiga') COLLATE utf8_bin NOT NULL,
  `total` decimal(6,2) DEFAULT NULL,
  `client_client_id` int NOT NULL,
  PRIMARY KEY (`comanda_id`,`client_client_id`),
  KEY `fk_comanda_client1_idx` (`client_client_id`),
  CONSTRAINT `fk_comanda_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'2021-01-13 17:11:08','domicili',NULL,1);
INSERT INTO `comanda` VALUES (2,'2021-01-13 17:11:08','botiga',NULL,2);
INSERT INTO `comanda` VALUES (3,'2021-01-13 18:04:16','domicili',NULL,1);
/*!40000 ALTER TABLE `comanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda_a_domicili`
--

DROP TABLE IF EXISTS `comanda_a_domicili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda_a_domicili` (
  `comanda_comanda_id` int NOT NULL,
  `empleat_empleat_id` int NOT NULL,
  `lliurament` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comanda_comanda_id`,`empleat_empleat_id`),
  KEY `fk_comanda_a_domicili_empleat1_idx` (`empleat_empleat_id`),
  CONSTRAINT `fk_comanda_a_domicili_comanda1` FOREIGN KEY (`comanda_comanda_id`) REFERENCES `comanda` (`comanda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_a_domicili_empleat1` FOREIGN KEY (`empleat_empleat_id`) REFERENCES `empleat` (`empleat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda_a_domicili`
--

LOCK TABLES `comanda_a_domicili` WRITE;
/*!40000 ALTER TABLE `comanda_a_domicili` DISABLE KEYS */;
INSERT INTO `comanda_a_domicili` VALUES (1,1,'2021-01-13 18:05:16');
INSERT INTO `comanda_a_domicili` VALUES (3,1,'2021-01-14 18:55:16');
/*!40000 ALTER TABLE `comanda_a_domicili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comanda_productes`
--

DROP TABLE IF EXISTS `comanda_productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comanda_productes` (
  `comanda_comanda_id` int NOT NULL,
  `quantitat` int DEFAULT NULL,
  `productes_productes_id` int NOT NULL,
  PRIMARY KEY (`comanda_comanda_id`,`productes_productes_id`),
  KEY `fk_comanda_productes_comanda1_idx` (`comanda_comanda_id`),
  KEY `fk_comanda_productes_productes1_idx` (`productes_productes_id`),
  CONSTRAINT `fk_comanda_productes_comanda1` FOREIGN KEY (`comanda_comanda_id`) REFERENCES `comanda` (`comanda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_productes_productes1` FOREIGN KEY (`productes_productes_id`) REFERENCES `productes` (`productes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda_productes`
--

LOCK TABLES `comanda_productes` WRITE;
/*!40000 ALTER TABLE `comanda_productes` DISABLE KEYS */;
INSERT INTO `comanda_productes` VALUES (1,1,1);
INSERT INTO `comanda_productes` VALUES (1,2,2);
INSERT INTO `comanda_productes` VALUES (2,2,2);
INSERT INTO `comanda_productes` VALUES (2,1,3);
INSERT INTO `comanda_productes` VALUES (3,1,1);
INSERT INTO `comanda_productes` VALUES (3,2,2);
/*!40000 ALTER TABLE `comanda_productes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleat`
--

DROP TABLE IF EXISTS `empleat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleat` (
  `empleat_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `cognoms` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `nif` varchar(13) COLLATE utf8_bin DEFAULT NULL,
  `telefon` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `tasca` enum('cuiner','repartidor') COLLATE utf8_bin DEFAULT NULL,
  `botiga_botiga_id` int NOT NULL,
  PRIMARY KEY (`empleat_id`,`botiga_botiga_id`),
  KEY `fk_empleat_botiga1_idx` (`botiga_botiga_id`),
  CONSTRAINT `fk_empleat_botiga1` FOREIGN KEY (`botiga_botiga_id`) REFERENCES `botiga` (`botiga_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleat`
--

LOCK TABLES `empleat` WRITE;
/*!40000 ALTER TABLE `empleat` DISABLE KEYS */;
INSERT INTO `empleat` VALUES (1,'Jimmy','Carter','777888','456987','repartidor',1);
INSERT INTO `empleat` VALUES (2,'Geena','Ravis','45678aa','45645+6','cuiner',2);
/*!40000 ALTER TABLE `empleat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localitat`
--

DROP TABLE IF EXISTS `localitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localitat` (
  `localitat_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `provincia_provincia_id` int NOT NULL,
  PRIMARY KEY (`localitat_id`,`provincia_provincia_id`),
  UNIQUE KEY `nom_UNIQUE` (`nom`),
  KEY `fk_localitat_provincia_idx` (`provincia_provincia_id`),
  CONSTRAINT `fk_localitat_provincia` FOREIGN KEY (`provincia_provincia_id`) REFERENCES `provincia` (`provincia_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localitat`
--

LOCK TABLES `localitat` WRITE;
/*!40000 ALTER TABLE `localitat` DISABLE KEYS */;
INSERT INTO `localitat` VALUES (2,'Boston',2);
INSERT INTO `localitat` VALUES (1,'Cisco',1);
/*!40000 ALTER TABLE `localitat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `productes_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin NOT NULL,
  `descripcio` varchar(254) COLLATE utf8_bin DEFAULT NULL,
  `imatge` blob,
  `preu` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`productes_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
INSERT INTO `productes` VALUES (1,'hamburguesa','Carn de vedella i formatge amb pa de xapata',NULL,15.00);
INSERT INTO `productes` VALUES (2,'beguda','coca-cola',NULL,2.00);
INSERT INTO `productes` VALUES (3,'pizza','Base de pa, salsa tomaquet i formatge',NULL,20.00);
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `provincia_id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`provincia_id`),
  UNIQUE KEY `nom_UNIQUE` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='																';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'California');
INSERT INTO `provincia` VALUES (2,'Massachussets');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-13 18:08:53
