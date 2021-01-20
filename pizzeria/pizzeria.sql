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
  PRIMARY KEY (`categoria_pizza_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_pizza`
--

LOCK TABLES `categoria_pizza` WRITE;
/*!40000 ALTER TABLE `categoria_pizza` DISABLE KEYS */;
INSERT INTO `categoria_pizza` VALUES (1,'ortolana');
INSERT INTO `categoria_pizza` VALUES (2,'marinara');
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
  `botiga_botiga_id` int NOT NULL,
  PRIMARY KEY (`comanda_id`,`client_client_id`,`botiga_botiga_id`),
  KEY `fk_comanda_client1_idx` (`client_client_id`),
  KEY `fk_comanda_botiga1_idx` (`botiga_botiga_id`),
  CONSTRAINT `fk_comanda_botiga1` FOREIGN KEY (`botiga_botiga_id`) REFERENCES `botiga` (`botiga_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda`
--

LOCK TABLES `comanda` WRITE;
/*!40000 ALTER TABLE `comanda` DISABLE KEYS */;
INSERT INTO `comanda` VALUES (1,'2021-01-13 17:11:08','domicili',19.00,1,1);
INSERT INTO `comanda` VALUES (2,'2021-01-13 17:11:08','botiga',24.00,2,2);
INSERT INTO `comanda` VALUES (3,'2021-01-13 18:04:16','domicili',24.00,1,2);
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
  `categoria_pizza_categoria_pizza_id` int DEFAULT NULL,
  PRIMARY KEY (`comanda_comanda_id`,`productes_productes_id`),
  KEY `fk_comanda_productes_comanda1_idx` (`comanda_comanda_id`),
  KEY `fk_comanda_productes_productes1_idx` (`productes_productes_id`),
  KEY `fk_comanda_productes_categoria_pizza1_idx` (`categoria_pizza_categoria_pizza_id`),
  CONSTRAINT `fk_comanda_productes_categoria_pizza1` FOREIGN KEY (`categoria_pizza_categoria_pizza_id`) REFERENCES `categoria_pizza` (`categoria_pizza_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_productes_comanda1` FOREIGN KEY (`comanda_comanda_id`) REFERENCES `comanda` (`comanda_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comanda_productes_productes1` FOREIGN KEY (`productes_productes_id`) REFERENCES `productes` (`productes_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comanda_productes`
--

LOCK TABLES `comanda_productes` WRITE;
/*!40000 ALTER TABLE `comanda_productes` DISABLE KEYS */;
INSERT INTO `comanda_productes` VALUES (1,1,1,NULL);
INSERT INTO `comanda_productes` VALUES (1,2,2,NULL);
INSERT INTO `comanda_productes` VALUES (2,2,2,NULL);
INSERT INTO `comanda_productes` VALUES (2,1,3,1);
INSERT INTO `comanda_productes` VALUES (3,2,2,NULL);
INSERT INTO `comanda_productes` VALUES (3,1,3,2);
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
INSERT INTO `productes` VALUES (1,'hamburguesa','Carn de vedella i formatge ',_binary '�\��\�\0JFIF\0\0H\0H\0\0�\�\0�\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((��\0\0�,\"\0�\�\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1\"AQaq2��#B��3R�\�4br\��$5CSs��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1A\"Q23qBaR��\���\�\0\0\0?\0\�!\0B�!\0B� �\�\0B	Mk+騙��x\�\�v�E\�\�\�I�\�yp�8�\�S�)b��\���\0uTļAĤ��ӷ��\�~�V�eP��\�0ퟣl�f�����\�\��<��%Ī\�\�\�\�<\�@��\rMc�s:\��7U�ԣ����/\�gE\�\�x4\�t����\�3\Z��\r�\'��\0E\�RT<�2�&\�J[�:�\�?\�_�1t\�\�#�\0]�\��\0�6���\�X�Ӈe 7��\05\�\�2��\���c�C\�>_�}>>�\�P�\r1�x�?�\�Ob���\�UL�Y\\�\�l�mk\�yd-�cdŝ�B\�O�3���E�\\�E\�ح�6\'Y�IH\n\�A\�R[5lu,\�4mu�b\�69�~P�`\�xgJ�\�\�8o����b8\\r��L�\�o���\�\�yZ��\�J\rKr��\0B\�>7B^�Qd|��5TQ	)��h\�΍�\��J\�4Q\��\0!@�\0!@�\0!@�\0!@�q\0M�ԠIL1<V�i3\�w�cu%DcX\�TF\�c\'S\�|�s�I7Ԟ�7#=C\�,�F�3\�x\�U\�\�_�h�j\��T�ʧL\���\�~���wP\�\�\�[�c+:\�N�\Zܛ,\�Lת�V�\�G\�HN\�1�\��)b\'}�\�2|z\�s\�\�\�a$G\��$|�)GK\�\�����75�\0t�\�I6t�yӗd\�\��&�A����k�Me�]E\��g4G���z�$M��O\��l�tvn���h��Z��\0D��\�\�=||\��\0D��\�5\"\r\r^\�u���0�s;�K=�\�	/d\�\"\ry��\�Ը\0�x#\�\�`A\Z��-ę¸�\�\�l�S\�<~(\�[�-�\�5\�te�cp���\�ْ���\�b&G7b�]ҏ�\"\�#?(\�~\�|�\�чV4TZ\�^Y˯\�Y\�^���\�\�\\Ǵ\�9�\�B��\0�\�Y�����5m\�*�c�\�?5v����B\�Ga\�\�HL��J��������Qv\�\�q�\�\�<V��\�P� B\0� B\0� A@\\�f�\�fя��\��\�Z�_.+\rݢ�tZl�fZ�\0DKX�[\�dDW\�\�2���S�í\�I��Y�f�l+�\�\�\�5��]�\�@�Mҝc�a^��))\�}�J�$\Z�i�\��m\�[�\�2�,\"�\Z�&φ��T�\��;�\�3��\����Q\�5\"X\�\�$\�Xɽ\�����F	:i\�ˤ��\�,u\�D\�H�\r�R\�3!=Fɼ���-���\"$�{X{&\�]Ԝ�\�\\&\�\�{��q��e�/��$��6�)4[at\�\�22Fk\��Sw0�)7\�n{��h:��A�=wX=�m�N\�}\�\�\���\�Od\�6\�ײQ��D�gSb��JDZ-\�X�	׉��\�N��\�\�<�\�}WQp�PqF~\')\�H�y�w�.6���oqMWc1\�\�\�]\�<=$g�\n�FGc\��S\�\�\�[�����M0��|O���x��v�ޅ;-$�ek\\�\�!\0B�!\0AB\n\0a\\3H\�v7{ږ]\��H�\�,���2\�\'���ǡMd�B�\�m�M��T�K1�,|�6\�5|:\�6�R�at\r$|G[�$a/\Zim�d�\�D4\�\�{���\�؍���0w\Z\�\�\�\��opRd�FdDM\�\�\�3�\��54c9\�\�\�\�\��m\�)�ё\0\�M\����Y�˚\�b�\"�\�絮uQ���\��\�/Ӫ[�A\����\�3�\"kע�\�\��;oa\�FUS�\�a\�Dx$��H@k����������\����d�E6W�\�vRA�\�E�\�$�n~�fH,/kY\"a6&&q�A\�l�4\�j�M=\�\�=�FX,ݷRR\"\�B\�3���}5\�pRAf\��qf-@�N~�)�n��%�)#[\�\�\�!\"\�\�\�\�B\r�)\�#�ʹ\�M4\�.�h\�c�1\�\�s8��\Z�.vי����\�6\\\�\�~zn0\�^\�y�X}Aуe��g}|�1s �g�B�U!\0B�!\0��\�*ڨ�\"7\�^Z\\Z\\\�\�\�q�-�[�Fe\�\\$3�:�V��3��h���_\rLZ*��\',r��=N�쩕�5x�iv5�3�i��Ѳ\\���\����+6̭ɨ��X\�&vANR\�gE\�Ibqq\07]M�e>1�V9ͥ����э�}:pN+&&\��_���sQ,PJ��$X�ͻ\r5�\�\�������\�̓l\�s��k�[~ʻ�RjE\����\�,�O\�KL����4�5H\�q���a\��(\�\�<��V���\�|�\�\�ub�\'�\�\�T4X\�[GTZ#d����ğ�\��\'\�Л�m�\�i\��\��\Z�(\�\�\�[�q\��NikY<%\�F9�\�\�X�\�y]�>\��vV�{)Fmy�\0\�\r,s��%��l\�\�\�m\��,���O\�\�ٷͯRR\�|2	\�9\�\0\�uQ�)�\'sD\\���z\r\�:�͆�\�,\�>Z��8=\�e���\� Ƶ�=\��\�z�Ǎ�K#D,���@�gQF36\�\��\0%`{�&\�Z\r�b\�C�6\�N�A\�=�YfJ<���\Zr�����8J�\�|֝�\�\�4����\�hͧ�\�\�Ț\�ElRmb=VcZ\��\�\�7[�}�X�\�K.�y\�EzJ+_M-�o�=p�oEftZ���0HB*\�h>i��$�\0\�emu#m�����\�>)��U�FcwtEM���ea|\�-��J�B\�\�\��\�\�\�D	�.=5Ni��\�\�jJ}3\�o+\\\�\�\�-�E5ed4԰�Y��\�\�z�Ɩ\�	_�c�\�3q$Z\�G\�\�X\�W�7�R\�U\�sJ\�ӳG�V�\�ƫ↌�\��%�B�	!\0B�!3�1!�`u\��t9\�i�N�+~f�h\�\�U\�Q\�\��lQ\�VF\�\�,\�, FV�\��|�\��F\Zڎ1\�\�\�(���4\�\�s�\�\Z��\�9qZzz\�\�==X��\0�:\�0h\�á�Vfm�\�\��\0�o�kp|6LZ\Zײ��GEe����e�#C����[�p�O\�	�JJ�\�\��U\�\�v`omͬ\n�����J���\�E)0�\��\�z|��\�X�uV!Y\0d��\�R\�\��\0\'�\�i\����m�u�\�4gd� �ތx��0\�\�\�J��\�G����\��v�K\0@v�Ib�t�nyʐ�3\��\\ӵ\���@1\�f7\�\�F\�Ǖ�\�F\�\�ߩ^\�M\�SIY=@\Z0H>�\�ǩ\�\�j\\J\"\'�I�7�$1\��Z��wM#�^\�rZmtɼJ\�u�\�X�\�\���22�4�\�\�\�1��c\�渏�BRB\�o�\�b���`��,7��\'��r�\�`ۡ�[�\\N�\��ͣ���\�&��u�\�s�\�I�x��\0\�#/XiLѥ�-U|\�o�����\�Զ�:\Z��\�F\�/�\'0����\�\�\�)\�%�\�Nl�˟e\�M�����_\�c\�nTkx��*f&�Ĥ-6�	p�YgSѲ��\�_\��\0c~�-}\�\�z\�b��6>\'	���\\�g#{�\�1O\�@I��F��$Y\�?\�i\��Ë�\�\�%k@\�\�L6�\�W\���N�\Z�����\Z\Z	�\�g.?�4�\0��A\�\\�J&\��1�\�FՂ��&\���(�a�g{#k\�a\rw�%��G]E�Z�\�\��D\��\��;G#ŮlTC\�\�\�\�\rn���X�\�\�+�\�\�\\7\�\�M�;�l��&�ڂ\�F�5\�$p�k\�qJV�\�3�>�ip`ٞ\�Gͦho-\�$�\��K\�萪�`y\��u�x\�|Вޛg%�n&�o�\��w\�\Zr\�u\�\�,8�\0 �b\�#a\�\rW;�\�&B\�[q꼛tC;Z\�j��x�:1�u�\��6:�g8�JC�0��*\�9E�.��:\�s�1:x\�\"��\��-�p�EOvJ�-�\�\�\�,\��\�\�k|\�!��&�\�jH�l���»�pzJw\�SWq�n\�V�\r�|\�\�\�oe\�\�-`�a�E�3\��\�w\\\rl@�H\�\��\0Yo\�>\�Tk�tQ�*�L��|�J�5C\�V5��O�e\�!�\��\�!\�=�5�;-	|��>\�\�fݕ\�=�5����9A#�e��$�䪬2\�k1Z\\a\�UH�ƹϾQ��-�\�˄q\�I]��ğ�V�B]%<��0�7\0�\�6-�O�W��x\�\�@-f�a���\��*f�N��\�$p�\�\�\�wJs,Nq�;}��Ce\�\�\\Eôx� 7\�g;�G�>�hl���\�2Z\�\�!�B\0�!\0Bs��\�\�E\�C���5�PR\��\�.g�F�iI��X�\�0mϢݜY�@\�[�F\��\n\�\\E�a�C@\�Lf�J\�FW�呚ߕ\�P�2\�e\�f�\'5pi\n�O\�:Y\�ϊ93�\�:��\�]��\�쥱�)\�\�O�UմGK��\��n6�\�uh\�h���|T�3\�RO+\�HK�哳M��#�\Z\�V�J�3,�����L�\�$wqh�6$�\�T�۴]\�o��j\�\�+㩜�T\�\�\�c�\�6�\�:�ע�\�~,J\��\�Ĥc�<q\�,\�~ӥ\�^�*�$\�<P�N�Ƶ��v\�\�\�;�1�\�\�t�\nSSF\�\�%�\�{�E\�o�m\��\�\��!O{߶DS\��8�r=҈\�-\�ZM\�\�/�豤���3b�\�U\�(dm�\��K�������\�i\�N\�\�l�0\0\�\�A]�i��ڊI\�,�2�\�anS���s��\'e֒�-�/#	_$5�GU昦\�O�[\��q\n:��Z7\�\�\��\0��\�\�HЁ��ЪX#\�O5N&oO,}4���&\�[�\�w\�?����Ii�|u2�&�qkK���\�o��qOz!*{���q>\Z\�:I��6�(\�\��\�3n�\��;�\�i\�Ū�\Z\�\�\�:���<��/ܴ�>�Y�\��d�\�TԀ\Z\�\�\�_9?�k�\�V�Y��V�fH߄6\�w�:]X�\�hK�m$͑\��\r\'���\\\�2\�\r;�sir=�\�\�\"��B\���El��GHV\�61�`=�\�\�\�a\�dؚc|�n�\�\0\�\�㯡SV���F?\�\�4\�{#\�0��\�{���\�\r�uR�{C$�S��/6Y\Zs\�u7=�[����eCL1\�\Z\�W�+3�Y\�\�}�1aDڊ$G�# ��ӡ�\��?E���\�v\�FR\����ǈ\�dD\�\0P4\�2B�_�䜽ZSyY\�\�\��q�]�:�D�\�<\�=\�d�����۲q�PZ�3�\�Cߕ�\�\�)�kG�\�\��\�	WL����\��T9\�{lNab��bD%�?G��xtO\�\�5�/k�u=��\�#�<�h\��Z�o��U�0��i�^\�\�\�2r�\�\�\rB���_\�#�!\�=\�2�\0\'�S�����u%\�Ux���\�,�\�@4\�&�@\��\�g�\�\�<���\�l�\�\0�C��0\�d�01\�}�\�L\�윖���\�s�\�\�o�^r�\�)q=J}U##�\"\�5\�\�\rl�\�`�կ{\�`kI�/\�\\\�\�,_o�6��uMLqGq��\�{�0z(\�)\Zַ[k}\�c�`�a\��<�\�瞾�\�VI�\�,vT���\�j��Y�gJ\�7btd�\0��\�5\������\�\�iٕ�u\'\���{\�\'���\�\�G�џ����\'	!\0B�!\n\�EE,�\�\�*E?3��\�ڭ�wU|n�GR\�4y�Y}N�詯E\�+{d\�U�����\�\���+^\�b4�\�\r�#[�\0���H\�.�O	�q�]�XЛ�5��G\�\n��z\�K�V��Ѹ\Zwk�\�=\0\��\�\Za��x���1\�2\�i\�\�\�X�X�\�\�5\0io�F*��I	�\�K�f\�\��++!ik�=��M�`�m²V:�h~\��1�\�׶\��\�+)£�ض1��Lmt\�ha:g\0|K��;ei3r\�S\�GO.#�\�>�I3Y\�@\�3u/�{\�Uix9\�\�Ɗ`)\�|!�eH\�\0���\������i\�\��}\��4�4X��\Zl��+�\�U\�\�WK� �Vo�\�r���~s18|s[���覲�\�.\r�\�nō}Q����\\_r\�N��b�b\0R\�\�Y�\�#궼\�`S\�f(\Z\�\�S�\�}O\�TxM�K\�/���o�s˭�ؕT\��h\�1U\�\�+�燼fp\Z�\0�V�g\�\��\�\�VJ\�\�\n�7\�\�\�\�Xj��\rh�\�̔�\�ٜCXָ�\�w�MdrC\rD���q{\�>�\�I\�\�\�\r�UX�:)5���7DK`�@KG5\�\��\�$i\�ׇ\�͞\�.����\��X\�33+�\�:m����~�a�/t\�32SFO\�\09�\�so��ȫ�E\�g�3�:�لM}\�\�	m��w\Z$Yu0�\�\�\�-�\�#N�7S�1�\�q\��Z��\�o=ƽ:�\0EQ��\�%C�w\�G\�\�|헝rS\�\��2�c\�\�*C^o�\�W�8� |�8\�.�w	R��_/Ak�\�S\�W\�\'\�\Z\�\�{\�~�l�r��MP\�b�\�\�P\�\�\�\�qR\�4\�w�B\�Ԭ<�����������,v��X3\�\�#��\�\r��V\Z~\ns�\�\�\�\�㓗)WQ,Qܵ�\�\��#-X.�[\�&YR~G/$U/\r\�\�\�\�f\���nI\�\�9@켒��\�\'\�2��!:\�\�%\�R�5B1�P\�I>�2��(�M\�I:j*`\�\�\�\�ËCݫ��u)�\�\�99���S�8ъ\0�L�\�b/�\�kB�\�\\\�I�V6\�z*jZ~H!`��\0[7\�|\�V\�#\��I˺M�$b�0K\" �!\0B\0�!\0xwQ��4�й\�\��>f�l\�;�_\�߉U\\\r�`Դ\�\�ET$�\�Z적fۯ�J��A��Es�j5�$\�b��\�Q>dg,��G��!e$ ��\�\���\�\'���Lg�HQ�\Z�W�Gw�\�[\�Yĸ�\�ҷÀ�=0\�3}K6?+,��{\\\�\�.C\'�K�-QN[r\�\�4�Q�\�\�GmE���yG�PV\�\�E;\\ᡌ�ŧPR��Ok,��\�\�ф\�!l\�\�\�\�\�3\�>W�0�\�\�l:w\�KM,Ѡ�\�u\�\�>���ݺ�kp=od��\�G\�;�9]q�tL�L�fP]�Ý���͔�Б k����l\�\�l\�}v]\�>\�,\"sK@\�\�n\�@�o> I:���\�ܕ\�ٔJ�hO��0�\�,%�;�]L\�j1\�+|�\�r\Z� \�oq�yYY\�L\���\�j��cex/������J�s9\�[�����.(\�\�Ӑ\�>\�\�\��)�M[�<�$\\�H��e�_����\�\�l��Ƒ����;�&Ψ<�\�w�=�\�$�I\�x\�4\Z�\�l����P뜮v\�#$\�\r\�\�{w^<\09N�h�H�\�\���TĈ�s9e\�]t�)	*5:��C{�\0d\�IE\�C�\�\�\�T�>&�����\���D��.;$\�P\\n_��QW4?C�	��\�\�u5d\�\�\�Iצ�.��{��\n\"j\�\�\�_\�e5Uc�c\�O�RfDc\�\�Tv�z\r\��\0\rQ\�\��Js�p����s\�w!m.\�\�Rc���T�&}׻8�:\�:i\Z{���\��\�\�\�?\0\�[��\�C��Z4N9�t�0�Q\0B\0�!\0�A\�# q\Z �*Ȩ(jk*hi\�t��h���\�\�qEe.?] 55��\�\�-4,vVF}\�=n�\�0\�ޘmM�>UDn�\�\"˞��\�\�QP\�\Z9\�I�=ٝ~n\�\\g(\�+f�J���ݏO�|\�z��#�*f2a�\�&��\0B[f\�\�\�u��S�\�\�\�{�	\�>\�Ԙ�5el�\�l\Z�4�me���i���@���jb:�\�\�\�����\�]������3E\���\n�Y�x\���,XU\�6��\\��5[�d i�����\�\'T,Z�\�NJ��\"���0�~��\�,\�9\��֑\�\�b�\�8x�C,��C�Z�\�붗�K \�n!\��N kp�i��h�T�\�)�\�\�-\�>\�\�&hGq5S\�T4\�8�^.�N�\�_�u\�\�@6���\�x��\\�]�\��\�\�e\\��\�\�b8�/`ɝ`�ˤ�\0�C\�R^\�U\�*!!\�\0\�\���5{\�~r\�7)�t�V\�j|\r\�\Z)8��\��\�\����U\�\��8E�R\��I\�\��]�\�CWQ�\�d�\�\�7\�ۮ��H\��-�X�ꤦ��F�\0\�#m��sx_\�w�J\'\��W?�Z�}}Ds��؃v\�l���{�t*FOx�\�7���?\�V?�O\�[3im���}�}D$\�L\�v��L��`��S}թ��\�T��w\�\�\�?��o\�\�o�V��	�,��l�ˈ3Q�Q�\�\Z\�[z��y�\�\�kdCr���\0g\�&epq\�uO���2\��#�\�řr\"va�\�?4����\�%p=H�\�\n0�m�4\�\�X(�+�)\��->\�>8�B%�6q�8-V\�X��\�M\�\�\�nF\�o\�.ʤ\��\"�\�)��������0|��\\c\�	����r�\�I\�]\�l<S#\0�-\�\�h�9X\��J���SP���\�\Zz+E&\rON\0k\�J\�(\�k��z�\0!@�\0!@�\�\� KA\�,]N\�(�\0����P4��^\�!\0��\0YB\0�!\0B�Y@�\0\"\�B\0d!\0B\0�!\0B\0�!\0B\0�!\0�\�',15.00);
INSERT INTO `productes` VALUES (2,'beguda','coca-cola',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\Z\Z* \Z%!1!&*+...\"583-7(-.+\n\n\n\r\Z7%#2+0-+5+/5---5+-6--75-67--+-------/---5-----------.��\0\0\�\0�\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0�\�\0F\0\0\0\0\0\0!1A\"Qaq��R���#$2Bbr�\�3Sc�\�\��%s����&C�\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0�\�\0+\0\0\0\0\0\0\0\0!1\"2AQ�aq���#3��\�\0\0\0?\0��\" \"\"\" \"\"\" \"\"\�\�kY\r\�ٌis��P\�WJ�\�z>w�<���nav��.8�\�yl\�z|f�Ϸ�\�]�\�9ѧ�7\�{�\��\�7=\�x\�<�G!��B7\���\�\�}aÊ��\�&�\�3Ρ�=m\�\�ׅ��]\�ݴ%��\�N\�\�\r採�N��c_\�כ��\�Vq�\�\�g+1������\�y*�\���U8k*\"vh\�i���G �/�\�\'mm3\�\����Ff���/�ܮ��\Z]�dE�\�\\�m�.s�%�wU�|\�\�Ǻ���:11>\�V$DV�����������������������������p�\r{G\�k��\�\�X~j\�}�\r3��p\�߲\�~cڻ\�tQ�Z\�\�Əa*A�Av9>Z����\�ۇǖ�\�;Ǵ1f\�\�%\�HoH\��G��\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" .,^KP�o$\�p]��\�>\�6��\�\��,,֐\�\�I�%F��\�e*Ro<ai�\�᧼\�?F�\�F5$�A\�\�}⿉q\��\�75�}w,7�OoX\�\�MvZ֜D.��\ZRW�\�ϟ	a\�۴��\�\�\�i%��qmُ\�H�q�̞y\��=�?�&\�wx9o���C{��8����\�ӌ\��D[�D@DDD@DDD@DDD@DDD@DDD@DD�v��},�\�&�n?�\�u�\��\0Z�G+;C\�{!i��|�}`�\�D08�\�e�vr;\�d��֒|7,���L7lk�H�\��z\�\�5�\�u\\b���\�\�1P�5�\�\�<\�;\�ہ\�P\�N\"���\�v���}&�D^\�\�\�q\"\'ޢ�kh=n��y�NvIz��4$�4\����\�\0���y�\��e�\Zs;�\0MZ\�R9\�K\�\��\�\�?�\�#�]\�`O[\\�\���Ĉ��D@DDD@DDD@DDD@DDD@DDDA��xƹݧm0=\Zf�\�Kg��\�y�R\�\�-�\�\'8\�\��\�\�*�\0H\�\�j/~vW�}\��x3(�R���dl\\=\�\�`\�\�1�vv4\�\�R\��=��}\�.O\�p�q\n?&�\07�K��qsG��_�k�\�\���Lf���s\�~\�J�Z�;�s\�\�\�\�x\�)_O e\�\�/izT!݂\�\�8\�C.\�s~\�/ \�ɇk\�L\�Ѩa�\�\�#?\�%�Ah���J\�Fڊz�ۛ��?u���n<V��B�\�8z�\�g\�\")�\�\�e��2%]�T���i\Z�rz\r�����\�9�\�:Z,\���u�k�\����(�{�I\�&I@\Z�\\�@�\�[\�0��L8�<4�\0|l{��{��2B\\\�[�C�\0�\�\��V�hw+�iS\�aň\�!�[.\�^\�: �\�\���\�p7��a\�M�0滛k�jϥ��\�#6\�\�{\�����y\"YA\�\r\�\�7:^\�E[�Ħlvl�4f.\�\�t��v�y��ij\�v\�k��{r��.!�]�܋���؃�v�.|2�aN[+\��B\�\��\���\\\�\��\0�G��2���4=�E�֛���Z)�&�*�\�-$q\�f|@�\�\�\�\�63o5/��tW��\�W0��Zv�(\�s��p��׼\�]\�\\5�hpY;hp���l\�m�ɿx�s\��\�]n��A\�i\�򹛿7G\�\"+�D@DDD@DDD@DDD@DDD@DD\�P�@\�\�	�\�pc�\�����Ʉ�\�<�k��.w\�\�v\��\�\�%��q\�.\�wu+�ͳ\�]�\� y}T\�\�y\�I����\�Zk�M\�\�U-��\�I9fvG���n������\r�\�\�W\r�����h����xt`8�\0\�%�#\�N\�qq#RI�����p\�_��\�\�\�w=^\�\�N!{cqlű\�s��n��I|\�\�L\�ť��\�Qk\�aV=QP�:H2�\���YO%\�h7\�e ؓ`�p.5�\�7%&_.�}S��\�3�1x��]�\�\�q�B\�ն>J㨔=\��\�`\�:8\�\�@-`ֻ�d`h\0��Y�{\�g?h\�\����9Β9`�\�IX\�\�\�\'����\r{\�s��Kƺ�\�5�4�2�H\�L��Ό\�鍢���\r�\�h\0\�w+4�>�lFH9ʈe\nR�M4���\'\r2�1���E\�\�\�\�)�\��\�\�\�#\�\�5D�&W�\nBX#l�\�\�yԵ\�ݸ-\\��\"\'>\�\��H\�皨	4���-6\�^Z9\�Ǯ\\lsk\�-Z����\���Vo\�\�h\��9\�	.n�\�%q�B\�~�g��\�!,�.\�K�g��\�A�OO��\�\�\�L$QX\�\"\"\" \"\"\" \"\"\" \"\"\" \"\"\" *\�)8��`\�$7\�0X\\�M�L=ٞ/ج��\�]>}��oTw\�\�\�G�\�x/S�)���Z�m\�nhVl�\�C$qt��K�\\\�s�9\�Lx�h�\0��=J��C����\���;V�E:G\�\'�\�hjC\�\�6�B\��ZŎe\�\\-k�*��\�]e5���H�y��\�[R7�\�i\�i��\�3\�}\�\�\n�T\�8+\"}E<9��\��\�Sp\�)\�3�\��0=�Hw\�M���\�H\��E[\r�T��Fǵ�l�\�d�\�)6��,���{��Ϛ<��=�Fm�J�\\f3\�������<�2zNp;\�[\�\�i^L�\�6�ѽ�����\�\�\�{�0ج��H��\0&4\�\�\'�M녯�\�\��G\����JΈ�\�aq\�\�\�4_��\��M#\�0�3m�eb6�Ѧp\�\n7�\�\�����\�ds~\nN�X�>�\��\�Xu\'\�\�\�ӧ*G\��g/�\�a\�;�_�\�\�\�M��\'\�\��J��;P��\�ѧ�g/&�\�\�mv\�\���}����M�k��?��v���\05\�.\�u\�Ҳ�\��\�_�׸575�\�\�\�c@�,�\�nwj��ߤ�6~7����\�/+���\�DEk0����������������������2�)\�\�(\�\Z.Z\�	�yJQ�\�\��S�@(���D\�ߓ/��B\�:�C�\�o\�\��oa>\�ϴ\��G\�\�\�i6T�Q�0���\�ߤ\�s�Oč\�\�M&y\�Eb>���~\�7��YE?kO�\�2��+��H��{}\��\�v�Yh�t�!�\Z��\�:���\���d���q\��\�E�\�H\�1�\�qZ9ut���\�\��dDEc8�������������������������|\nz�\�D��\�Z\�@�  \���bm��*�\�\�k���\�C�\06�\�~�[�u�[\�դ�~,�\�T�T�\�%\�\�\�\�q\'R{N�\�O╖\�Y\�\�<��\�kW��kp�Y�x�\0�\�jl2n7\� j2�w\�:\�JF�Iۖ�:�ǅ\�\�\��ـϸ7�ױR)e�\����,�\�\�ק\�=\�\�NSf�~�\0k\�ZqyG�\��\�<\�;\�J\�\'������\�ʴ4��4��\��S�>Q*��\�qp\�\�Z�\�r�N�l\�\�\���LC\�3�|�Y�ޘɍ\�D\\���;u%j��\�}#\0����1\�\��;��)\�\��ߗ�E̢\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"�r�9g\'UDqo�\�cO�\�\�<�\�s��U�U�\�l�\�\�\��J�ᘉ\�\0\�\'ا0\�f\�S\�z,n\�v�\0\\zcx�j�7_\�\�g�b2\�\�\�cښ�0ַ�\�\�r�Bn�Ԇ;Y\�5�\�Z犋d���DF2�-lbr:\�L`���D\��{/�(�\����p� l�7���N&1u��&�f^�\�r��#s��sK}\�\�\�ɞ\�\�f���\0�䖗�\�\��\�I�\� �8)hVc��\�\�h�-舴1����������������������7\�\�/\�\�\�v��^\�Ӡ׊\�De�7-{��N�	\Z\0@v�ԥp큧�fm[�?�y> ��pzyIO\�s\ZO��%N\�\�^���{�\���搜^\�\�_$�\�\�}�5\�/TRϨ\�\�\�\�\��up]�V\�n��\�X\�`��\�n�\��\�e_j6n����俞e\�&	쮶�s�n�I©ƶ�v���Ӊ,\��}VRN�x}&�k�6\�\�\�/%��\�s�d\0�\�#6\�l��|����5��\�\\\�\�ՙO\�\�\�.O\�xg}��Y8W\��ڞ\�\��Ea��Ϩ���͐��&Α���M����\��dxlqG�8\�\�3��hh�\�E�S\�>N\�\�ր|\�z�W\n\�l�I�\�',2.00);
INSERT INTO `productes` VALUES (3,'pizza','Base de pa, salsa tomaquet i formatge',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0�\0	\Z\Z\Z\Z( (!1!%)+...383-7(-.+\n\n\n\r-& %-//--5/-/----------------/------------------------��\0\0�\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0A\0\0\0\0\0!1AQa\"2q����#B�\�\��3Rbr����4Ss�C\��\�\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\06\0\0\0\0!1A\"Qaq����2\�3��\�#B�4RrC�\�\0\0\0?\0\�\�\�x��rdB&Vt�\�\'��13���؟D\�N\'�ӥ�#)wx�s$9r+\��Αv�\�[��2\�:8�+:Z�V@`LWl�b��\�RB�Y\�ɴQ\�Ʉ�\�\��)�\\�X�\�\�k��oo\r#[�\�a\�i4�,�Ƞ�6���19\�i�+���\�\nl��\n�;�\'�0�r:K/ʞ�T�\�p�o\�8)�\�!w.A�\�)�h�\�&U�7Hb\�Fu�\�/�8��\�1pw��k2���\����?hOY�\'�a��瞟�M�G\rK)��ɹv\�x\�D��I\�6�\\P\�S�3��A=�InEjv0U�;��\�z�\r���8US�(�uK6\�X�0�\�po�\�e\�M�]=\�M<O��%�(\�:z�f\�i3��w�y#���\����_+��S�\�=�\�Q\�\�P��|*J�4�-F\�F\�v-�*b��z�+�\�S��L\�\�X\�\�\�=�`\n�B\�Hb\�\�~�7�5\Z��U\�4��\�{:zz�\0��Q�.�I�\��I%�7\Zrm�P[�\�4\�ϓ�\�1|rt\��{8ѫN�8.\�m�\����x`DɓJ\�&D�\�s{D8\�U,m�7��=x\��GI�GN�GN�%�Ø�ɝ:B	m\0&;\"t\�j�@<I�(\0َ�\�\'H�ѢÙ\�����:,#��~���)�\��B��܀X\�\'\�枝)@��Ԫ�ŉ<L��2��� ��D\��xQ����ՑI\�ϸ\�GaT�h�w\�܏\��Ɵ̙��\��xj-�ϕ.8̓\�\"$�P���x:}a\n?g\'y�\Z�\0`�Ǯ�v�[�ZǾYk,f��\�R�P)h\�H����꣩x\�Q��=\�\�G\�\0\�Ӱ�5\\AT�z���\�=�\�f�\�T�N)��y�?ܢ~w�\�_IsZ\�a�1�\�\�C�\���9\�\�6s��mG~W�\�\�\�%2��C���(�Q�O���4P\�\�}c�u\nM�7��\�\�q�rU*�JIСd\0�E/�\�Ck@l��VbZ�)�\0��f�o�*�&l���\�瘟�\0w4�W�3��׭�V῿\�d[F\�DP������@9�F�0&T���\�=$)b��t�\�gݪϕ&��F�y\�\�\�\��=$�IJ�<�\�o\�)\�`)Vyo�%چs�<L����ed\�\'*d#d�\�\\\�h\�V9=fm�q�b\�1\�9��,J\�$N��e☝<P�t\�	h�\�\�%nl\"3\�:XFA�^L\��\'�\�`Ξ\�GN�t�\�:v�װ\�\"D\�d\�a�\nd\�31\�\�\'O��t\�;8�%,GYӀ�>�3�w\�l\�x�\0[R\�P}���b�B8\�!m�\�\���y�8\n\�SWڒݙ$�\�ߜ�bc\�\Z\��8J�I�LوK&\�ҧpN\�\�^	�`��zŮUe{D��p��	\�OH�\�\�w�5\�TMD��S�\0\�P\���\��6\�\�l}���q*Q&�K* 4�w��f���?/\��\�\�cU�a$�ju�,5}nN��0T����^\�ⱁ��\"r{<\�ߔqO6�STF7}�RQ{*�wܟ(�Lt��\�\�!\�s�-Z9=���m\�E$�\�ak1��3Oh�˷��oCZD���\�x\�ސ�d:\�U�-�\�\n\�	ԓP�\"[�l�r�1�mǜ8B�\�\�Kuձ�\�\�si\�&f�-٭\�#��_Fp&�9\�Ϭu֝A�\'��ˡ�=$\�$IP��\�\0�k\�\�}�M���S�|_\�m7q\�?\�`\�\�&\�s�CT�\'1\rE��&a�\�F���\�%��\"\�}\\\�yyƅk\�\�-�h�\���\"����Ȝ\�ΓJ\�&v\'�U\�EdO\�&wLFm/\��l\�wI�˖1ݧft$x�\�p�	E\�Q�3�%@\�r\'N4Ac\�E�\�̉\\���|gId\�{��q:}\�\�fH\�\�\�w�\�Gw\�v$I[-\�\'q\'JK�̈o����o�B��$bihUy\�#�q�[4�?1˭J\�\�*`B%yA����W�2\�qO\�%#\�਷-�WO�(w[�LmO�A�M���e�b�\�!\�\��\�X�2\�!I�dp�r��ROw�\0��?\�C|b�\�\�B$\����n2�B*r��:��l\�R�}\��x��H\�S#13\Z55�1)+R�J\0��\Z\0\��xS\�\��1q\�lv��Ζ�\�jYEAÂ@s}X�\��1��v��SB�L��@Y\�,Gv,Ky��=\�gOZs�K\"D\�\�Kn\�n\�\�\�oh�Uy�\"�a�cἲ���m�\r=�7�\�3QZ�y8���.RL���D]l_�o(Vm��C\�X\�p\�w�0�\"�\�)D\�*\�ɀa\�\�[ bhi\�KFA�~�V�KFe(�sr^\�[�C\�\�#=>\�\�$�ɚ��\\\�b��\�b\�\�O�*��J��\�mB�\�\�h4�\�TKZ��%%\'b�g\Z�u�Ŵ\��gc�<֢�*l<�\�00b����chs2�e{�E\�g3\�\�D�-\"O,Z&L\�jc\�\�\Z��3�R\���~� �0�d�\�K\�,Y\�I\�&�\�\�����S�h�]Z�a\n�Xz)�B�8b�L:��_\��Y@�\0��\���\��T�\�0˔���x���}\'\�N��8?i\r?\��\���B\��i\�\�;/\�M\�:�\�0:PU̘y\�oU<Pjn=@xD�Ug�|\��>⛖s��\���B�d\���\Z�4fK#*O\�rI�w\�K�\'��eA���s	\�PӐ\Z�\�K�~0�\�vy~>Q��}@\�L�Zs\�4i~�TPYh\�Ą>Τ�\�H58|�r�5،\���;\�5�g0-\�9<|\�a�Q�Ʌ=�\�4-����#C���\�\"�\�h.�mү\�,5�=D����\�&���n�\'\�\�\�V����9<	�S�^-��\�A�u}���U��=@��_�R��\'\�\�\�`@\�>�>�U`?��|o\�\�!!N\�I\nQꔛ\�\�\�Aљ�$\0fs�)T\�KZ�MR\�X�\�o���#���\�\�4\�ϻQ\�\��\�\�:ɰ\��\�E�aW\�\���\0�\��\0o�)+%U#���\�(ePpAa\�M9�x0`�s}=�v\�GC�N�Ek���\�z��\�\�\�rDi��(®=e��q�\�	2�\�)a�\��7X�\�{Jj\Z��\�\�\�<\�FM6l\�R|2\�3/N[jm�H\�\�c\�jt�\�9Qǩ\�3\\B�IR�\\�\0_\�\�z��:�\�Y�\�\�G\"�\���977 \�a��O2��)\�}\�r#�?$HGc,�b\�f\0.<Z��r��\�iS�J\�	i\�@w��d�M+@9�\�)w�\�bjM\�	\�.aآ�L\�%\�\rb���\��}ĖU�p�4l�u	����\0�\'\�&l��\�#\�3\�@\'�t�|�\�]]ϡՑ�\0�\�<����Gq3&q\Z\�\�DS̉\�DΓ�&$N\�#Y�̖�#�\n\�=��N��\n��X\�Nf�\�{�$\�xL�KZ�$������O��p\0�\�\�~wBRp�k.B7T\�[u��s�\0ُˈ\��>�\�\0�|�*��+�\�\��c�#\�]j8Q:]�x�\0�\�\�Ɏ߰co��YX1\�\�\�:�ڂ5<�$��\\�3.@=gS*\'Kw�	x\�U�J�c��v��Y���j|ϯ8V�\�� ��\nBC�(=�t��cis\�[J\�\� \�B��{7�\�b�Q��	܂Yz�>\�r�$5o��\�/\�\��\n��\�����bV�i.\Z�D/\�1���t�\\����s�\�X�{QX`K�ih\�,�N�x���\��n�!�¯\�*����\�:\\\�s�FoR	ku/X\�K&��\�o2\�ӕ�i�$�\�m��\�\�蛚XŰJye)\nTu\Z\�W���\�2�_k�qĥ�\�v\�TՁ �{�j�\�\�%v���c\�ƪWi:R��T��\�Mb��r\�c�陫\�-M��~\���Y�e�	 N�\�\��\00$\�:����s\�Q4�ك���\�ΐ��\�/p=�y�\r�\�\�cD�\���J�ZT��ҊR�ܟ��[��ˁ\�tl�\�\n\�\0Ā4\�z��Y.\�\�G�\�	\�5i$)\Z9\�ڷ\�XR낰\n��N����\�e\�p\�~P�U�\�y��\�\�\��\�R�$\�I\n\�\�3�\�5▦�\��\�_�kD�����\�\�1�O6e�	r�{��\�\��x����\�\�\��̎pIL�dҦ�qB!�\�3\���Wc0�\\��ԏB}�H\�|���\�._\�^�a\�j�T��0;�%�,�;\��<���1]5\�N�a�\"&1\�\�\�Ys(�}�*\�H\n����գ\�oAkOf�u(�L�tRN\���۫B��ʍ\�\�\�\�\�h\�~\����a��A!�\�u����|��\�Dmho7U\�Q��sQVӟX�1Bi\�F�\�Γ Z$H�u��V\�;\�r\�Lь�q��\�֎�\�V\r$\�\n@R��#\�/\�\�D��۷�]-\�5����\�#0\�	$\�J�W��[Ďd��̆k%\�\�\"%\�KC�ve79\��՞\�K*=�(a\�Y\�NT\����%��6\�ӨD\�y�\�ra+\�OVt��R@)�:\�X�\�\n0d^\� ����9�R���Ԭ�A<��0&�c\�2�\0XW�{\��.BA���3��\�\Z�a�l\�L\rU��HB\0\'s�2�s\�2F��h>MD\�\�S�\�Vx�\Z:\�YUUB�V\�-��@�X�_f;\���5X^G�P:\�\�GZ\�F\�\�{J���?�G\�J�\�)9�\�`��\���U�\���\��爹\�X�%\�\"@Z��E�|\�\�Z\r�N#U>h\n�*�0\�\�r\�f\��p� ��s��\�\�?\�����̕)\0��٤�u��>ֿ/X\�\�	�sɋ]JI�\�:eeFUT�-�K�6-\�>]\�\�]�\�o\�&q�	K�P\\�\�$l�4\�}!�YN\�9\�1\�f؏�0�\\��V`�.\�\�H�p!o\�\�\�\���A\Z�rY�Z%-\nJ2�f��\0y_M\�KD1�I�Y\�\0W�\�3J�/*���Nʼ;\�\�����\�Y\rn9.S��G̝�>u��c��f砃N;R�6T��\�\�\�\�\�mE\��8\�QMJ=�\�͑R�K��d�b\r����[\�֕�u�\�>�龲?i�\\C�̧Z3�M�ҰJ��\r�\�6q�o�6s�}fƞ\�IS�1��FR\\\�Џw\�*c��\�\�p��J���\�g��u,\�\�1EF\���*�KIyJI\�f\�oo�v�\�g7X\�e;��k���@S��\�X	!O#�\�x���l�\�H\�j$ �-$(ߺ�\� k\�0\�\�>�&ޒ\�q�<~~s\��\�TЦb��\0�jC2\��a�]=V\�o\�\�\�j<6ʧc\�\�-��\��0Ȁh���C�\"D\�T.b\\e!D���\0�`\"�x3x�T��\��\�%?i-Em\�T=�g�ܖ?\�n=%\�~!\�0 y��Hr\�U�9/\�\\\�_E�\�y���3�y�\�\�q1�J\����\�\�Ә㤳�a\�5(N�\0��\�f\�̥��O��%	j%=�lO!w6\�S\�\r�\�{L\"l\�l\�\�-sf��@\�\�<��\�$��b\�e��(\��\�5P}�@L3Yc��H�\��G�Ծ\\A�\�\�Ӫb�i\�`$$�&\�0`4f��\�q�}{C����\�\��f�jd������$�4�]:s�;^42\�\�锗\�\�\�ǎ��SI�\0��\��էT,`\���\�VF\�D���m9*��\0E�$\�ط�A�\��U�ܑ,̯Pb���\�\'\�\�W�S\0\�ʄ\�v,�\�7g#NF\�^Q�)c�J&�4S��\�\�w<��\�c�{6�\�@�\�albY�(\0[��i�\�\�g\�t�-�I�>�;ZǤ��\�̩Z���)w\'�u\�\�xKSr\�|\�/^�\��T\�;��O�#\�3%7	�j��/6;\�d\�\�O��+�r�c%$��p��VPۄ�&\�N�|F,\�\�\Z��g�H)8^�VN\�HJ\���g���ڗ�f�\0	\�\�\�|\�\�\�PP��\�)�{\��z�G�W\�\�\�ǜ\�:\���MX�&L3�Fm�� j\���T2\�,~SPU���@�������\�����\�*����ji�R��(\�\n�G2�ؾ�\�k�ͥa\�\"y��h��PG\�\�3RAʥ;�\�OR\�Q\�\��=?�%Z����\��\�Z\�e\�&e��@�����ab�6\�ŵ�\�v\���G��\�,�V�V�* \r`�m._�Z\�?\�\��~w���w��Q�\��É��\� F\�\r�ՖN�&Y��-}\\wաԥM�z\�\�)��\�g�E��T\0�-S\�!\� p\�\�f\�\��|.�3\�i5!\�\�\0\0\�\��#��U/���Z���a�1��u�\�\�~x�K�>�Z��\�\�\�<���}\r��#CNœ\r\�@\�r;\�e�\'x0Ȁ\��\0\�\�M§�\n\�\�Tܲ�\�1���1\Z\n��_�L\�?\�\�����q�+Z���2RJ&P7:�N�!��X\�\Z-Am\�\�:�\�\�0ܡ\n�L�[��iR_K�*FɁ\�z\�\�\�?ql���\�8{�\��&\�)M��B�\��\��\�W�\�W�\�\�.\�tT���I:�1�*1$3y�#\��Se�\���q�K��.d�/�NN\�`\��U3X�?;��Ȫ��q9\�\Z	s�l\�#����\�\��{@\�k-{s�Ƀ�p��\�w,H\�W�H=��\�l�+V\�K��k��\�v��\��c\�\�T����+��t|��y���������>V�q����2b\�J�\�K\�2������{|\�|!eHRA%\�n���`\�;CR0\����?\�\�L*�`T��Ye2H�_[�\���\�e8\�߸}OO\nU.\�	[*�ı\�\�x\'\�)C�V�8��-%hOt�e �	\�fQ\�\rZ.�\�r�\�H�~�D��`��Ji��)\�w1\'\�fy�\�KI\����`#?Sb5�\�s,U�c�1Ü8�\�&�9\\�Pua�W#�m\��ٻ�_#\�9��\��-Q\��|��\�U\�-6��\��!X \\��薄���\�Ej�hE2O3ɉA@\"*��.\�A9���\�\�\�S\n\�O=`|[�PZ\�\�\�$?��a]4V\r���\�7ې�-\�PKD�Rs\"\�)b\�Z��\�R��s\�VY\�\��e:Y��̔��@bEʬ�l�\���9n������\'\�=�\�!9VXX:H$�}\��o�]�Ǥ\�ғ��x:�)k �\��{��`#K�\�\0w��E�\�\0�o]�\��|\�{�B�\'�\�h\�v)\����٦֥G\�v�\�s;�9(jX�`ް�ڿ�3\�B�1ڣ��WT3�� ��������\�yFUϹ˜��?\�Ԯ��R{u��\��\�K�\���rDn�a\�D�iÄ\�TM\Z\�Xs�+Oh\�\�\�<Lz�-��&\'�b�\Z;\�x#�2yT\�q\�đ�3�ocPJ���\0���{�Io!\�\�0�j09��B���R\�&Z\'�a#*�;�8�E\�F[�\�\�h�\�z��5���Om)�\�0#E�^z\�\��p�F��\r�h�W\���Gbkd�u\0�2M�[g[vEZ/��\�QPy�5\�\�HWn�uN@=�%l\�g�zJ0�\�-EMO=*c��;\��\�+�1Q\�\�R㜈>��\�ewȔ2�*\n ��DZ*n\�\r�ɧ\�p��\�:�J(	{3�<\�\�\�\�\�H/\�\���\�\�궒7���F)6a\�\�X\'PX�`\�E\�\�9ni-�\�\�k\�\�%�#\�9\�1\"\�B�z\�\�\�)f�[�q����9�M#\�$\�JV�4�;[(5N��\���\0�箦\�8a\n\�I6\�wn�\���\rL\�%�\�\�Im@a�?�n�\�05}f\�\�{Pl	,O�\�$\"]f\������\01ź\�\��=*�HA.\�;�;�\��\�\��5\�b-f\�*�I�s�,��n�\�ˠa\����!�d��D\���׍�72�\�I-\�~��\�\Z�6x��\�\��0���\�K/ha�\�2\�u��J7s8ñ\�\�\�G��x^�E��e\�e\�\�g{�9�\�\�\0�@���\�Q-2\�nA\07Zˀ\�5^�,\�\rAMsx\r��S�\�F?�\�A.A\�.�\�3\�\��lL�\0\�	��%E�NGG��h\�\�k\�Uu�(\�M>�A)Q)VR6\�\r\�\���8X	\�\�+˓=}\�+{;�K_[A�\�\�T8M�R)\�fMd�[?ϩ�Wz\�g�~SZ\�9\n��[\�HJ�9D��]\�g\'�H��{|C׷�*hX�N���\�q�\�d\�Av?\�	�{�{\\�!��*󃘷�J������p��=<�*�vcB��a�c\�\�T�\�f,$(��\�Y�\�\�0ꕡ%{\�2��`\0$\��\r6:�\�k\'\'�[\�32�t��\�A�Mݷ�4O�)`+\���U\�3qs8fJ�E��T\�\0㚉@K$MNo�\��0`\�ܹ~^I:m��ӥ�\�`y�T��%(�s\'}70!��oV\�h_H\�����Q\�K(76%M\�\�\n���\���Ve+\���f\��$�f%ҖH��Dh0Q�4Z\�\�\�\�����a�Y@*��TO��\�!q\��6��_ڙ�\��\r\�M�S���1\�*\�e�\��3%o\�n\�\���\���\�Z\�\�\�\�|�z\�$2\�#�\�fĽ�QW��H��\�P)7P�i�E\�X`ä�-�%��\�!�����\�7��\�\�սa/O�eI��&\�ku�\\�.��\�\'�\�\�Q\�\0\�GH�JU�t\��\����\�X\��-$�\���[+�\0$�Ȱ}�oH�`���1\�\�y��ө$5�\�O�Up~u\"U\�f�2�\��K��s�\���02�\r=eaYP\�Z��`zC�7Jl\�\�V\�\�90�^(\�h��v�\0�E\�N�lX�c\�{��ҋ�e\Z:^\�/ڙ�Y%��k|\�\�h#����]��\"�b\�R��}���\�2\�\"�A��+(HK%\"ͥ��\��\�\"\\s;G;\rLq 4�8�@�#��ʼSm`\�{%!�\�m��%����fG\�\n52�NSn\�V\�O�\�	\�ϜM�*[<�HKP�!\�\�\\���\�3R�\r�����x^ZNe(�\�(p�\�[�\�x�}2�<)v\�\n\�AI\�b\��Ji�%KeL~�\Z#�=!\�>������M�T#<�\0�[2�b�\�PḨMy\�\�\'QP�s�\�Z�\�\n$ئ�Q�ŏ�\��	k�\�^aY�S{�q\Z�\�T�M������*�P��Ai\�q��\r����\'Ր�	���y8\�3\�Ur�m`�W?��~�}LE��x\�%i�K_��չyA�k�\�\nu��E\�<�0\�\����J�_�}\�89e`����\�z\�k�ya�\�^Xs4|#�*_fR�\�\0��\�WV\�M��ĭ��m\�Y�A!(\�BP�n�\0\�фM\�\\3`}̪3�\�\�\�\���\�RF�[\�]:8~}`\�ÞO0n,�T�)9lV��\nRE�F���$\�Z�\�\0IV=\�,>R�j\0[�m�$��He+�wX\"y\�M>�)\":\�V\\0����(OFYk첩@nl�aDuD\"�ay\'��\�\�J��\�Ze�\�R�FU3�$39�\��9\�\�\�6����%�\�+#�����2Yd\�\����E5�\"b\��˙r���E2�P�eKX\�\�Ȍ��\�}�\�z[\�_\�s�\\1HK*b�y��cCE�$\�\'\���\�oV<.,�L5�fL�`ک� �\�\�}a��\���PI\�_�X�\�hȳ$\����=$\�Q\"\�\�gn �X�\�T�V��K�ݷ[v\�K*ٖ\�\Z�eH}e�+IHJ��<\�wR!nӐr%��\�$\�\�q\\g��J]��\�CA��y2\�D\�\�\Z��)6h4����}\'bYT�D\�Fe�\�\� ��u�\�\�p�\�V�s\�O�)6|�iԨ{��0���	1ta6\�Jd��a��\�M�\�1��\�G�\�rҵq3j�\�\����\�4BA\��Q�����w0^&ѓ\�\�x\��ALJ[�Pʁԍ|���_	w?�\Z��Ǥ\�fM$�(�%\�;À\00 �rf�\���\�\�הL��\�\'P\r�\'`\�\�1�d\�f\�?B=\�\���=��3\nB�\�\0\�	\�w�Z��\��Q\�t����S\�\�@;�$ݿ\�\ri�,\�ig!�DTLss\ZDqF\�\��[�\�a��[dbVĨω>�J�\�b��\�X0\�\�q�y�R~���̝���!\�\�fNό\�hq\�\�aS\�{�Ǩ��ή[9��@�\�i^c�*Ф��;���h֪W\��\�I��D�bT�\n�4\�zEF�^̷\'Ӵ ��0:Hx��%Q��R��R�\�RN\�\�ha��\�\�&�F��ppSkq\�:�]@�\�e��9S��#�\�,ۉ���\�H\�\�\������@�\�.�\�b?ȭ|�heu$0��\�\0�\�\�#��\�6Pc�\0�k\nI��\�ޱoաm�*\�5��0��f�u*&�!*!\�S\�/\�\�u��\�[�׿�\��\0Ik(\'\� W\�O��\�I\�\Z�\�t������9I\�X��9��T\�5:%ʒT\�\'6\��P��\��\�8�\���;W��b���\�.bQ-\n2�@�\�3���^}\��:\�mi\���2�i<F�2$��\�^�F��k�rI�L���\�R�\��%�0��5��ܡK�9\�!� b\"c|J�\�\�,��\�.\�G�u\�{*�|��ԧLMyc�.#ąS*X�}�� @y\0o\�,�JȯH\non� *laI*�%ԥe@~W�����!\�\�\���2a���NRX�%\�;�^��t�=\�X�2\�l�HPVH$:�a��WӰ>^��\�\�ɸL�C5�/�P\�㡖]S�C�x�\0C\�pl\�#���sM��\�(�ɘ�D\�-JZ\�R�I*:�u&6@\0`E�3Q�5\�EJ�j\�TĴ��\�\'\\\�͇�\�MIf\�v��Kׁ�\�\"�w������	W����>\�\�5(�\��3f+4Ɋ�z$X̘�\�\�\�O��93\�uUu*QS��u\0\�\�a��\�u=e-?�\r�ҙ����HS���N�f��U\�\�0\�VyJ�X2\�\��n�����n\�_�4�\n�f�Yqa�c�)\�*hBFk�w\�\�*\rX6\�ΐ^s埞�\�\�j�������\�ɻ|� �&\'��\�`$(\�&d]�\�\��F\�B\�h\�\�1)	Vб$G�Qd.4\��)�p����v�\�\�T��pR �d\�8K;��\�ᙴ\�q1\'��\�V\�;Xs8\�U�*�K\�f&�\n՜\�)W\�~q\�e��3�\�3Q\�c�	9��oH/\�\�[ s8W٢\'խu(*:J\Z�\�\�,6�\�o�-\�q\��ATI$\0��\"\�\��lG��s/!w!��6\�BK��c�\�\0�|a\�S{$\�Y,P\�rt�\�\���NCXC׼�\�\�;�\�ɘ��\�D\�*ꔢ\����(��p�9\�Mu�@�}`��MIuKZ/\�\n\Z�qb-}\���g\�R01\���� K\�	\�M�6,\�\r��\\�#\�r��w�f�\�\�)R\�g�(�\n\0�3���q��\�\�b���i`�k%)H$�X\0:��\n�9T����jNl��^f�h�n\�9\��\�<\�\�\�%�\�)\�Nn�_�Tr��\'|��I�w�<K�fa�\�i���%�0�܏�+)K\�6\�f\�^?��h\�\�\r�4*l\��YJr䶡Îw1&����\\�v���\�|:uB%�]<�^\�\�&�U�����\�\�\'�\0\�*ל\�\�U!?W \�#\�\Z*P�}8�\�&�w\�\�q!S*t\�\�D��cF�\�IOޘ(	\�3Z\�U��g9\�%��QW=K\nRh\��ܲˋ�\0R�I\�4I�m\�\�*\�\�\�;�UE|\�r�*X\�\'��n\�\�}`Ց�\r�\�O���c�TV$wOvK�\�o0rd��wCN&�+e.j��bJ��vbǣ�{@\�8\�\�d\�C�@a�۸`t��u�N\��\�I\"\�E�\0!r�[3�6�Ο0J�-K��H\rc��$\r\�h>e���O�����kPE\�<(\��\0v���+n�/l\�O�%^f�2y~q�}\�ν#�U�dE�n!�.Z$��)\��5Π����l\�/I$*\ré�3,\�Ot\\W\'��\�H�6#W�\��%�\�\�\�\�+\"nV�\�\����.N�&��\�V(r$��\\�:�AB�H\�4Ճ\0D\�t(\�L�^��\�&Xg��Mg������pK\0ֹmN\�\0\���9�R��\�%\n���L!9��\�͹�x2��b8�\Zʳ���{)����\0\��\�\���kp~QmE\�l���qLEBI�7[w�i8R��3[@s_�]nP�=ݟ}G�\�Xj6\�\�^�.l��ybb�`���኉��F\�V\�8�+aT]֜�>\�Y�\�8�)!�n�,T��1tӛ3d{�O7~�����A�\�˥QBe�k\�p�}�!aezr\�W^�<Fh\�>�nb\0�\�X%y��˖Py>�PnX:w\�bښE-�l˕`}�I<�\��\�\�)\0\�	\�\�!��4\�b��\�n��m��\�/b\�9C.N�\nK�6�\�ͧG]�ȀA\�暖ZP9����\�]U��\0�\�\�r`6\�\�\�\�J%)))XWy\�\�C`y�]Y~���hrXv�p�\"�.��4�*n\�mA��\�W��-NO\'\�-�ֵǎc�Sv\0�\'�x}�s\�\���̒l��\�C�ÙN�\�J�����\�\\8�=T@�&KJi�\�\����r�\Z�G��\0p�pg\"t�iQ$!	r��@\��w{T+l\�}��]9#9�\�\�E4�g�O-*o\�dHW��\�\�j��.:ʺ�\�E2T�O-���%� \�}��d�x\�L\�\�	�@Iܤ\0�k��\���\�(O/�\�H\�\�ߛ?\�\�*�Y�\�\�[).r�\�\�O\�XEϬ\��|������`�:a)[dU�$�\Z\�\�\�\�f\�D\\\\�F\"�镆����}\�\�\�r�Z��,���*��\�\�|�DiZ\�Vu�LGbHPI\"\�	��.ԋjN	\�:����33��\��꒲n\���;\�n���W\'\"o�=l� �ng\0��SӸ7\�Q�u	�zL{�)�\��8 \�\�V|�\�r�����\Zëk�/N˲�\0\�~z�Q\�a\�q4\���%�(X#\0b_��,\�m�ؽ$oĳ\"Z�u$\�\�\��6�|�\��\�\�-��\�\�\�6tߟ\����\�6����@x&\\\��G��D\�\�\�8�U)3*$�\�!F\�\�\�b\�g\�\�ϩ���D�\���3�\�^QC%iߌf߯\�6  Fj\�X$@xV3�j�\���[�`q빁��F\�dǮ\�\�>��ğ�p�Y0KS�)\�v��X�E�6;\�\�\�\r.�t�� K������)\nQ�/�Հ��ax3x\�}q\�-\�bø�U (\�,\0\�wr��k\�P\�:_YKto�;�_��\�H(ײ�R\�\�\�\�\�\�Kl^��6�;��\�R8��b���$\�Y��ũ�X}�\�\�\�J)#\�aI�\�\n@ �-���]�\\\n.}O��\"qɝL�J5`Y\�\�L4ڄ�`��Ġ��\�wE�I�Y3�\�V��;s\���\�i\�Yqs�$����7�<�\'��W\�7J\�|�1+���K\Z�uq\"yr���\����\��Ne\�\\�/2X(��ok�h5�\"HR%\�K\0���\r��\�ˀ\\�\�S�\�))�HR�;_�x{F�e~\�˥s\�\�HQZ���eJ�0d-�mPb\�Z�#Q\�\�G\�^�W=A\�.�Y{\�ѝ�\�.	ߖS<q+��/,�+-�*>�\��[�@07c�Qc��MRl\�\0y�N�7.���\�ii\��C�/�\�<\�5\�\�J�vm��\'p�\r���\�\�1���8\�p�k\�*VbX\�;�\�KhKz�\���	c��̡�p��W2z��w��\����,8\�-~�@O1\�Eu8df�\�\�\�3\\\"���|Wù��Ax\��.���\��\0�7��ku\�\�{<�-\���J�H)̵���\0��\\p�;�޸�:r��\�M>j�\0\"%\�\�\0	�\�\�|µJ�<,�\�A��\�,p[\"k{5\�\'\�鰶OwO_\�@\Z\�f�ڼK�\�H`Y�\�\���礂\�J�}��7t��y������\�\�\�ox�	\�k�\�\�\�\�b�\���ޙʞc\n�Օh���\�!���A3\�6\�\r+\"mJ�E\�\�\\�\�\�Ea@9\��2\�jJ����¿\��t%���E\r��G���n\�\\�d\�¥�e\�\rr�O�M�Q>\�θ	Sm�q�3�:�JOٛ�\�\��&\�\�\�jJ-l�}�\0ģ�E\�9\�\�\�\0�)(QgR[�o��\��+%��~u�^ζ�>n��E5v,�C�\�;\�\� \r\���\�a�\�_)\�b���!�\'�7�[\0A�\�\�ݙG�AJ�m\�m=w\�\�1�,v\�|AkT\�a@\�H;�$�v\�<�\�8\\�\�b�N�UVǘ\��\�K*lܩ:$j}��m\�\�s�1:�kP��T\�L��K\nSl��\�Fc�RT09\'\��\�]�kF\� �$�SU0��� .\�\�Gw��6u\�Z=�\�i�L�\�94s\�(���w\����\�|E��~��l��f\�qUʔ��ʒ\�\�:;\0n�6\�A�h���\�K\�J�2�\�٠i\�\�~�����5��?�d�r�i:V|�H}Eط#\�^�\�\��#(��\�>1\�-ax=I��c*$;CܑoBL�%|@8�۫�>�,ɺ�.T��KS�;��}\\\�\�| l�FG�(,�^��Q�#�,\�3\�`Se�\�:\�\rU��\0��v8�̋�\n�^�nw\�@\\ŇU\�	g~���gT�ܽ��q���G4ս\�j�S\�|W6hsc\��/h�\�9s��V��\�2p�\ZKBH��,ܐ��zi��Α�O�yf\���al\�\�\\�ǒ\n����!�qku�ʏ/��_eZ=`�<mU�J�r��\�\�yB���9\�OA�O\n�]�\�pr�@N~qmM�\�\�F��~31\�L\�1\�Sf-JQ		%�O�[\�x\�0\'����`t9ܐ4sg\�a�\�#\�\�\r\�,\�b��|at,�aG��Y�\�{�>\�H\�Y0$<j\�B�\�Q�2�)�\�V.� }	�\��@\�\�o\�\�rg*\"P�\�p\���j�ot-\�y�BÜJ2�̰���\'�/�Wdz\�B7/\�>�\�d\�\�Ut2\��\�[�\�W*r!V\��g	�\�w\�^�L���l�14���\�Ai9`ni�\�K\�3T�M\�\n�G\�\�J�҉)r��U�\�Ϋ��K�C�\�q\�J�\�K(\�Jl\�>ЧB��\�^~�\Zu\�P\0�?o\�.\�@\�q�L� �Ŵk��\�.�K\�E�rC�(\�	\�\�\�I\�ܠ1�h1i�Y]<ѫ�R����{;�-����h\�\�t�E՟q�\�\�/\�L��҉BV\���$6	�=b]v��\�rnH��&\�4ۗ������v��w�s,�P \'g	НuѡVԪ�BD\�\�[q\�`u=cĺ	2�!	@P��s~pڕr:0-�\�\�\�N\"\�LŮ`\�-K\�o��|c-�3c�\Z(v9\�\�xA\n\�L\�w��o\��\�\�^[�+�\��ó�\�(履�\�\�\�m��\�\�Mvt\�\0\�W9\�bZ�\�s\�\0c\���	1\�ц�\��.�r���z�\�0+E\��*k�\���0\�*�+9�J@V\�\�HX[Q\�\0\�\n\��\�|��Xׂ\��ER\�̯��B=zŴ���__\�2�\�\�%�I\�rK\0A~C_Xu��\��{{�:c|LF�s���r��Ts\��\�g>Gn�n޳Cr=aa��d��R����\���7�-�P�{~}����i\��F���\0lٟ�h�f\�\��h�F����ዐ�������0���V\�Ȕ�W&�\�\�\�	a�\\\�)��}΃���	�N�k�\�9\�j<?�	)/�-ry�[KY\�g��wU�kH�.�9��~^�l�\�\�Bq�q=$��	 ����\�[v6Tu�in)�\�\"^@�u�\�;\�RHɛ��\�\Zk7�ʙ)95`�g�ѩJ|�s�\�\�ilG�Hx�	���\�\r��=\�Y�B�\�:\��\�QI�\0�������Wx�߉Wېi�x�\��Y̐O=?�x���S���I���\�\����F\"s2\��\�\��_����\�!,�\�3\�\0-\�pe�$;{Dg\� οó\�1\�\�\�ж8̏o7�c/u!\'kF\�Rk\�(f>y\��uXpZ�_x\�\�A�\';�<w\�ao ax�1\� L#!(�0v\�\��\0o��΃Ӵb���\�X\�\ZB^b��9\�\�m��\�7��x\�\�A\�u-��\�3Må�R\�R3K|�lᏤ:��;E\�U+�Y[��>R���!\��h��7/�mI��\�-S}%�{�\�\0�n\r�#��\�\nxC�i�o�ԅ\\{\�!\�\�Fgh+\��g�l��@kl	���\�2\��\��\0w�X����nݓ\�ӔLgն:|`:�Z����ȥb\�@�:��\�\�=\�	�rC\��S}�6��\�:G��\�\��\�A�\0\�f*\�\�C�9\'\�\��CSn1\�\�\�Q���\��XS}bR2���_K����C�|�Y\�\�?�\�>���\0P��\�\�<�HU\�\09��r\�l{�\�[#\�\�[\�\\X\�����kH\���\�\n\"�\\ɪ��KC�(+ͯ嵄_NʭיJ���\�9Ϥ\\\�2\��\�;��Ѭ\�xڣ\�\�xe`�&W��-�U))�\�܂@�oHV\��\�:�~����m= �C�D�-K̶b%�\�\�\�<�3e8q挧�ﱲ�\�\�\��\�y��\n=���Ș��\�\�\�ו3�lFr��;A�\�kE�YWr%��\�Gw�	�G\�\��@?\�O$�8≨ٟV\��鏠���\�<WLY+B|\�\�\"\�\�\�Z�=\�\�\�s���\�@\� �\�t7\�y\�:h\�?��f�b�Q��(A�\�v��l:�d\�	h\��\0R}b\�L�*�\�j�M�0M+�]D�)�s�\�!K�\�9�`zO?�\����M\��UFo\�ǅ\�7��#�t��!�GtՌ�L�*@b\�`��<\�o���%\�h4�\���\"u2QQ)\�\�Xi\���c�+��\\�,\�,\�D�pJ�]/oV��$��g\�\�)M+2]N�A��`	b$���%�\�4T`�PKI�\0uE�\�\�:J�w\�>b\�\�-%/�\�u�}+\�A{:v=��+mS�*�Ӽ;\�`B�ʒ\�_�-ܗ\��\�R�<)�\��~�\�1���Hh\\�`#Y\��x��ZҀN�-X�z(\�Yhw8Q�/��*)\��\r�K�ej�wl`\���q\�\"P��z�Hp�6J3NVs\��\�\�\�h<6�q\���ږ�\�\�XĊb+g�0T�(��Б��L �>Ѭ\�Sz�3�\�P6��.\�\�\��\0�7>h��f��\0\�$\rH!�vб\�M\�W,\��q\�~c����\�\�\�)�T\�3\�3�C�k�ԡ����C�09ݩ�-��\�.\�\"\��M�Z!�\��zM���X���/L\\\�y����\0\�._\��`�`$��H �ַl��nO�7\�U�A�\��r��_|\��\�b��,�bo��\Z�۲\��>\�yk\0\�W�ÐN�\�\�\��\"����e�\�\�ZCK\�\�K\�?�\�W\��ɒ�\�Y�\���-�\�Uk.F���\'a\�b\�\�_\\=�R�T��I�ػ�\�\r��������\Z�.���%8$���\�b\��������[h�\�R���XNBR[+w��\�\r�\�\'f\'\rN�D��D��R��Л��\�^V��u9 \�K\�6(\r�\�_U:���,LI7)\����ϐpH>�J\�\�\�\�����y̓-$��L�S�\�&�J2��<2B\n����	�mC�C-n\'x\� ��\�-\�9i��IX*k�{_a��P\'q�ӯ�f�8�83�3e��rnE�\'}�T�s`~\������1���ǹTHG� �4\�O]C s0\Z\�~�\�<E2e-j6H&ձ۰u0\�z˰.\�\�Lҹ\�W~b� �r�L[@\���a\0\�M\�*R��G\�\0k	��z|`\r`\�8�I6�K�Hn`�\�Ͷ\� 8\�E�{Ω\���/�\�_\�9�\�L�9<�`LX��ݿXS\�|R�s:�\�[�ӝ�21�\�t�\�\0\'.{\\\���\�I\�2�q(L��(�-\��t��\�/\�\"8c|E$%r\�\�	>����`A�Ʀ�V�\��{����&R�{4��Y){���#^�\��\�zMZl\��=\�7\Z�uQ���\�c�\\\"�\�\�i��?<q!Uz��U�	�\���R��\�N\�0��\�T}s��y��\�ਐv$���#�\��S\�p�;�9\�,9�b\�D�\�\�f�B�~�3کX\��\\Ք���\�2v�;\��v��k�\�D\�\�g�p�)J#d��\�\n�\�2Ǥ���� &°š\�*Ju_��VJ����\�c\�&\\\�\�,S�iK�C�ݷ1 9�̣>�\�*v�@\'���~�J��1\�X\�\�\�\�Y9S7EU��`\�����>��\�:\��l\�T\�@<6$���T�	33\�%	=_x���P \�\�\�7;�=rc�\':]l\�t�\���Jv\��F}=>3&\�)\��}aQ �)H��Ɛ\�\�\�Wk\0I\�`�VSS����\�A$�\���-�i���Z\�kz@�AY\"c/*��\�\�t\�3���Y�\�]�ԥ2D\�\�ZҰy\�s)!�C�\"\��١�\"�\�zF�z�Z9>��&���KrKuك��+��3\���\�j�#�-�\�0\�位˟8�\�\�\�Qb\�^�[X�8\�⹚�\�F�ᔴ�m�\�\�лԢ����kU`�I\�\�~։?f31�!\�4�R��\�\�z{\�a9\�IƸ�K%���\�٣%\\3\�ni��\\n\�T\�家� �\n��	�\�@E�\�f�̺J	/�ب�B\044�aP\�\�m�\�2iˆ��\���js�t\�U�Ź%�;1�u�v\�O\�f��\�\�\�\0\�P�$��c\��ƍ�E�n&�s��~R\��X$�[V��\�X�\�J�^$˖E���˥\�_\�P\"���4�}z\�)\�+���ɷ-�\�*�\�ʲ�\�sO1f�%<�~W�X/\\\�`�L\�\"c�Hs\�X�D���Z��\09\�==��=%H\�\�U�U)D���[F�Q��\�`Js�|\�9�5c�/nV>9�fi�ë.DP\�(\�\�/*Դ�X\��\�Di�Vç��k\��l]\�\��\"�BS\�9�\r4�n[�PR3׉�g�6$��Ve\�RB� +NF%�\�?\�ML\r,A�\�;���Ϛ�h��!̞�$\�,ܲ\�M[\��3l�p�T\�\�-jwQܞ�\�ԉ�y�KQ�{ܳ\�_U:Y�\r�+\��\�24&\\��rB\n\�S�=grLY�\0\�\\��\�K�ce�\�\��޶VQ��\�\�6D-I�\�\�`\�Y\�\�H�\�i\�@3ǧq��j-bN �����1�\�\�)\"��`H��\"R뺶\�8�\�\�V60\�?I\�&ۑH2�e\�2{V\�\�G\���\�i2Gq5\�mU{���F�P{�bo��\�\�x�\�;�BH\0�t\�R9\0bV\�f2\�\\Є�)�\�\�6صp=3�X�q�VZd)j*\�YE$\0\�@��eߋkr[?owo\�\�r2$|?�\"�&r��p\���Et�#i%\�1\��B�E\�T�)I\�00�6;��c\�x\�5\"aW�\��G \�gu<X�\�)I\ry�c)\�Nf �P��S\�����i\�ጞ}1\�\�\\�\�U�/\�\�\�\�s\�hK.WY{U\�i�у\�yD*c\�V�\��w�-`P���\�պ��\�}\�\�\�s�Xi\n]q��/H��L�\�X�\�\�	G�N\0k��kSk�	���\r�ӭ�Kt/�\n%Yʀ\�{��0��\�\�F:MO�0tɒ��3��?8�5J\����[\�\Z�m����3F��3	�bȑ-S�JC�\�8SQij��SQs�3�*�\�NT�\n��\�H\�\�3\�yF3��U���U�����\0�Ww{�%N\�aE)$1�\��\�/�\�L�\�FL�KL��r�m�~p6*\�8�g�\�eU\�Oq����\�lqF\�*U\�2dݎD��\�\�?(�\�+Ӽ���%-��b\�y�p^d�d���\�HN����\0�h\�\�f\�fZW\�\�q\�l�z�q��E\�39��wpհ���o����\�ҧ�d�\0q�G�\�tYOc~��L\�^�\�cO.a��_�D��R\�E�\�\�4�=&��\�7�\�)펫\�j!��x�M\�W\��\��\�5����^P�~\��fi_�Ew\�^�z�\�>�|(��\�\��=��dy@.�\0\�\'\�\�O�\0�Bx\'�ǯ\�6����ߺ[��r\�\�e��x\�Z��\�#U��H�)>_�=����G=�ѥ~�\0�?\�,�\��\�v�������i�F�_�~,��9C݄���x!������@���y\�U\�z�����\�8����\�uɞ3\��~��_\�\0�\'�)�\0\���lt\��Y�\�/����\0\�1o\�f��\0\��\03U�\�/O�\'�~�\��n\�\�u���$\�L �\0\����\�`z\'�џwy�wxvO�\����H�t�\�x\��~qa\�YzI�x�Dv��\0�\�]>?H����x��\�\�.\�:\���5_h�f|G�_H\�\��ȗ���>B�\�\�1_��\�',20.00);
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

-- Dump completed on 2021-01-20 16:28:45
