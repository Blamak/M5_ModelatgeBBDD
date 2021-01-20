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
INSERT INTO `productes` VALUES (1,'hamburguesa','Carn de vedella i formatge ',_binary 'ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\Û\0„\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(\n\n\n\n(\Z\Z((((((((((((((((((((((((((((((((((((((((((((((((((ÿÀ\0\0«,\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1\"AQaq2‘#B¡±3RÁ\Ñ4br\áğ$5CSs‚’\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0!1A\"Q23qBaR‘Á\áğÿ\Ú\0\0\0?\0\ê”!\0B€!\0B€ ¢\è\0B	Mk+é¨™ªx\â\æv¿E\Æ\Ò\åI¾\éypª8—\ĞS‚)b’¡\İşÿ\0uTÄ¼AÄ¤¸§Ó·ü­\Ì~¥VeP÷²\Ä0íŸ£l¤fª§‡ø³\Ä\Ïõ< ñ%Äª\ï\ç\×\Ô<\Â@ü”\rMcœs:\î©7U¥Ô£ı¨³›/\îgE\Ï\Äx4\ât€À\Ñ3\Zğó\r\'öÿ\0E\ÎRT<‹2À&\ÒJ[ñ:ş\Ê?\Ô_¤1t\Õ\í#ÿ\0]ğ\åÿ\0ó6şş\ÉX¸Ó‡e 7§ÿ\05\Ç\ê2‰ô\ëºÁò‘c›C\Ñ>_€}>>™\ÕPñ\r1´x­?ü\ÍOb­¥–\ŞUL¶Y\\‰\çl¼mk\Øyd-·cdÅùB\ßOü3±¸¸Eô\\“E\ÄØ­½6\'Y¿IH\n\ÃA\â§R[5lu,\í4muşb\Å69~P™`\ÍxgJ…\ê\Ò8o²´´b8\\r¯‚L§\èoú«®\â—\âyZú§\ÑJ\rKrÿ\0B\á>7B^‰Qd|¢ò„5TQ	)¦h\ÎÎÁ\ÃòJ\İ4Q\ê„\0!@„\0!@„\0!@„\0!@±q\0M€Ô IL1<V—i3\Éwôcu%DcX\ãšTF\Ãc\'S\ìª|¯sœI7Ô«7#=C\í‡,½FŸ3\áx\ÇU\Ì\Ú_ûhöj\ãóTúÊ§L\â÷¹\Ï~ùªwP\Â\ç\Ø[ºc+:\ÛN‹\ZÜ›,\æL×ªˆV¾\ÔG\ÔHN\å1”\æ»)b\'}º\İ2|z\ís\ì‘\Ü\Ùa$G\Í¨$|“)GKî¥\×\Üş©¼±75ˆ\0t°\ÙI6t‡yÓ—d\Õ\Â÷&ùA±º–’k Me‹]E\ïò²’g4G¹—ºzú$M®·O\ßšltvn©‰œh˜Zıÿ\0D•ˆ\Ó\Ñ=||\Äÿ\0Dƒ™\Ğ5\"\r\r^\çu½†‹0´s;òK=\É	/d\Å\"\ry¤«\ÖÔ¸\0“x#\×\Õ`A\Zš¤-Ä™Â¸ƒ\Â\æl´S\Ó<~(\Ş[ù-•\Ã5\âte±cp²¾ı\ÆÙ’ú¦»\éb&G7b]Ò†\"\Ê#?(\ì~\ã|‰\ÚÑ‡V4TZ\æ^YË¯\ÉY\î¸^­ñ\È\Ù\\Ç´\Ü9¦\ÄB¶÷\0ø\ÇY‡˜¨ø“5m\Â*ñc¿\Ì?5v¼”ø‘B\ÌGa\É\ÑHL°¬J Š³¨¢šQv\È\Ãqş\Ç\Ñ<Vü”\ÏP„ B\0„ B\0„ A@\\¨f­\ÓfÑˆ\Åş\ÊZ¾_.+\rİ¢…tZl¨fZÿ\0DKXğ[\îdDW\ß\Ù2’­¶SòÃ­\ìšI€Y¯fœl+ò\Ó\Ş\á5Ÿ]¯\ê¬@šMÒc£a^’®))\í}¾JÁ$\Zşi¤\Ô÷m\íª[ˆ\å2¿,\"÷\Zú&Ï†úıTû\éô;‘\Ù3–\Æö¶¶Q\Ñ5\"X\ì\í$\ÖXÉ½\í¢œ–‹‹¦F	:i\ÒË¤ˆ‡\Â,u\ÛD\ŞHˆ\r÷R\Ò3!=FÉ¼‘¬-°©œ\"${X{&\ï‹]Ôœ‘\Ø\\&\Ò\Å{©¦q‘¯eı/ˆ…$ø¬6¸)4[at\Ä\È22Fk\ÖıSw0ú)7\Æn{¤úh:¦¦AŒ=wX=ºmõN\Ì}\Â\Å\Ìµ·\ÙOd\Ì6\Æ×²Qœ§D±gSbŒŠJDZ-\ÆX—	×‰¨¤\ÏNó÷\Ô\Ï<’\è}WQpŸPqF~\')\ÒHœy¢wò¸.6Œ–«oqMWc1\Ö\Ó\è]\É<=$g÷\n·FGc\ÓğS\È\Æ\ï[“­®½M0ºú|O§­£x’v±Ş…;-$öek\\…\Ğ!\0B€!\0AB\n\0a\\3H\Ğv7{Ú–]\×ôH–\Ü,û¡¹2\Ä\'¤ˆ÷Ç¡MdB¤\ämµMŸ…T”K1™,|®6\Ù5|:\æ6±R¯at\r$|G[¤$a/\Zim’d‡\ÆD4\Ğ\ê{¦³À\ÛØ‚œ’0w\Z\Ú\é›\ã\ÌğopRd‡FdDM\Ã\Ò\á3š\à…54c9\Ò\é¼\Ô\æ\Äúm\Ù)¡Ñ‘\0\èM\Ü·¥”Y§Ëš\çb­\"š\Ñçµ®uQµ†\Â÷\ì/Óª[¦A\Íµ­¨\Õ3’\"k×¢²\Ô\Ò¶;oa\ÑFUS\ãa\×Dx$¥²H@k©´Ÿ’ššò\ÆÁ»dE6W\ÚvRA²\ÄEô\Õ$øn~ŠfH,/kY\"a6&&q‘A\íªlø4\Ğj§M=\Æ\×=‚FX,İ·RR\"\ÈB\é3¿¢š}5\ïpRAf\èŸqf-@ÁN~»)Ánšû%™)#[\Ş\à\Ñ!\"\Æ\×\îœ\ÇB\r´)\ã #¢Í´\ÇM4\Ü.÷h\Üc1\Ô\às8–´\Zˆ.v×™¿¡ú­\Ä6\\\ç\á~zn0\Ã^\ÂyX}AÑƒe±‡g}|ú1s £gÁB¶U!\0B€!\0ºğ”\Ó*Ú¨¢\"7\Ë^Z\\Z\\\Ë\ß\Ùq½-‚[Fe\Ü\\$3 :õV¢ñ3«h³·†_\rLZ*‰›\',r“ =N€ì©•õ5x½iv5Š3ˆi›Ñ²\\°¹ \åô¶·+6Ì­É¨­›X\İ&vANR\ÒgE\ÔIbqq\07]M”e>1‡V9Í¥¬§‘öÑ}:pN+&&\èğ¼_ªª£sQ,PJü¬$X—Í»\r5º\Ã\àš†™±µ¼\ÈÌ“l\Ós”»k‹[~Ê»¾RjE\Èôš \Ü,³O\×KLöšüÀ45H\ä¹q¸¸•a\ãş(\á\ã<•†Vµ¼±\Ì|À\Ñ\ìubğ\'Œ\Ø\ÅT4X\Ó[GTZ#d÷û·ÄŸ‡\ç¢£\'\ÊĞ›ºm´\Çi\í‰\Ñ¹\Z‹(\â\Ñ\È[¨q\ËóNikY<%\ÂF9¢\í½\ÓX¥\Îy]ğ>\Ä‰vV¸{)Fmyš\0\ç\r,s¢%¾l\Ì\Ö\Ím\ïú,¤±O\Ü\æÙ·Í¯RR\Ş|2	\Û9\î\0\ÜuQ)®\'sD\\´ü¹z\r\î™:“Í†¢\Î,\Î>Z©¦8=\ïe¹†§\Ù Æµ“=\àş\Ëz•Ç²K#D,°‰¬@²gQF36\Ú\Şÿ\0%`{“&\ÙZ\r“b\éCš6\ÓN¥A\ã=’YfJ<µ´÷\Zr‘ª§¼¤8J²\Í|Öˆ\Û\Ñ4¨¯\ÎhÍ§²\ç\ÓÈš\ÉElRmb=VcZ\ÖŠ\Å\ä7[‘}öXù\×K.¬y\ÉEzJ+_M-²oö=p·oEftZ‘ò0î‚HB*\î¤h>i¬”$\0\Óemu#mğ„Œ” \à>)ú„UFcwtEM•„ea|\Ì-¶½JÀB\Æ\î\Èø\ä\Ã\çD	¢.=5Ni¨ş\î\ÄjJ}3\âo+\\\Ü\ß\Ñ-†E5ed4Ô°ºY¥ø\İ\Üz©Æ–\Ù	_Ácğ\Ë3q$Z\ì§G\İ\æ·X\ÙW¸7–R\×U\ÊsJ\áÓ³G V²\ÚÆ«â†Œ«\ìù%°B¬	!\0B€!3‰1!„`u\Õöt9\ìiüN·+~fÁh\ç\ÔU\ÕQ\Õ\âlQ\×VF\Ö\Í,\Ì, FV‘\Òú|–\ÔñF\ZÚ1\á\ï\Ë(•²4\æ\Ësµ\È\Z­‹\ã9qZzz\È\Û==X½¤\0†:\ç0h\ŞÃ¡½Vfm©\Ë\ãÿ\0oùkp|6LZ\Z×²ªğ¶GEeƒ e÷#C¯ª”ğ[‡püO\â	ñJJ§\è\ÖÁU\Å\âv`omÍ¬\n…¨‡¨ŠJˆ£˜\×E)0¹\Îš\Òz|”¯\âX®uV!Y\0d\ĞR\Ó\Ìø\0\'™\äi\Íüª¤mŒuµ\Â4gdû ôŞŒx…0\Ş\â\ÊJ’ \ÃGˆ¹ô‘\Âóv¶K\0@v÷Ib”tõnyÊ»3\Åù\\Óµ\Ôˆ¼@1\Ìf7\â\ÚF\ØÇ•\ØF\Ö\Éß©^\ÖM\ÆSIY=@\Z0H>ñ—\ÖÇ©\ß\ä“j\\J\"\'óI©7¹$1\ÄøZ¶wM#œ^\ãrZmtÉ¼J\Âu\ÜX‚\ä\ë©–22—4›\å\ß\Ù1ƒ¬c\íæ¸óBRB\å•o†\ÙbÁ›Š`‘¾,7ª\'›ùr¿\Ì`Û¡ö[¾\\NŒ\áôÍ£«§\æ&‰·uµ\ÑsÁ\âI˜x˜ÿ\0\É#/XiLÑ¥ş-U|\Üo«¯³À˜\ÚÔ¶ù:\Z¡‘\ÏF\É/©\'0ºˆš™\Ğ\Ó\Ê)\ë%‰\ÒNl¾ËŸe\ãœM—Š†¢¢_\ác\ÜnTkx«Š*f&—Ä¤-6³	p„YgSÑ²«–\é³_\ïÿ\0c~ª-}\È\èz\Üb²Š6>\'	¥ \\›g#{û\ê 1O\Û@IšFŒ·$Y\Ö?\Õi\ÙøÃ‹©\ì\ê‰%k@\Ô\ÉL6õ\ÑW\ê±ú¼N¤\Z¹³‡“£\Z\Z	ş\Ëg.?¹4ÿ\0÷ğA\Û\\šJ&\ä1‘\âFÕ‚ñù&\Äõ¥(üaÀg{#k\êa\rwñ%„€G]EõZ§\á·\áóD\É›\Ìó;G#Å®lTC\è\Ã\ê\Ù\rn”‘«X\Õ\ä—+’\Ú\Ä\\7\à\ßMñ;šl¢¾&µÚ‚\âFŸ5\ì$pğk\ËqJV´\Ã3õ>Áip`Ù\ÜGÍ¦ho-\â$¹\×¿K\ëèªÁ`y\Ï¹u°x\Ô|Ğ’Ş›g%‡n&òoˆ\Ø€w\ï\Zr\İu\Ï\Õ,8ÿ\0 –b\î#a\æ\rW;ş\ì&B\Â[qê¼›tC;Z\íªŸjüŠxº:1¼u\È÷6:úg8›JC0‘œ*\â9E¾.½—:\ásª1:x\ì\"ó™\ÂÀ-ñƒp¶EOvJ©-»\Í\Ç\È,\ìü\Ø\âk|\ì!ù&¥\âjH l’¼¸Â»pzJw\ÉSWqn\æªV£\r¤|\Æ\Ú\Ûoe\Ï\Ş-`²aüEŸ3\ßñ‡\Çw\\\rl@–H\é\Ùÿ\0Yo\Å>\ßTktQ²*¼LÁœ|šJ5C\ÎV5€O¿e\æ!Š\â’À\ß!\Â=·5®;-	|º†>\Î\Çfİ•\Ò=­5®¢ù9A#§e¹ğ$øäª¬2\Çk1Z\\a\äUHùÆ¹Ï¾Qôù-\àË„q\æI]ª¦ÄŸöV¾B]%<‡ñ0ö7\0\ìµ6-‰OˆW¾¢x\Ø\É@-fÀağîªª—ˆ\éñ*fùN¡û\È$p¿\Ş\Ë\İwJs,Nqœ;}üCe\Â\ä\\EÃ´x¤ 7\Îg;¾G>ªhl®¦š\Ú2Z\Ó\Ó! B\0„!\0Bs‹œ\í\ØE\ÚC»­5PR\áø\ì.g•FiI–¼X\Ç0mÏ¢İœY™@\Ù[ñF\íı\n\×\\EƒaœC@\êLf”J\ÂFW°å‘šß•\ÃP±2\ße\í¿f¾\'5pi\nŠO\â:Y\ãÏŠ93£\Ì:úº\İ]­½\Åì¥±ˆ)\å•\â–O²UÕ´GK˜\áøn6°\ïuh\Çh§Á¥|Tô3\ÔRO+\ä‚HKŸå“³M†#©\Z\ÙV¸J¸3,‘­–Lò\Ã$wqhõ6$\ßT¥Û´]\îo’‚j\ê\è+ã©œ¸T\Ó\Ê\Ùc\Í6‘\Í:ƒ×¢–\â¼~,J\êñ\ç¥Ä¤c<q\Æ,\Ò~Ó¥\É^ñ*ş$\Ç<PÁNòÆµ‚ùv\Ò\ä\ì;¤1˜\âŸ\ít†\nSSF\â\é%‰\Î{E\Üo¡m\í¯ª°\Ò\Òü!O{ß¶DS\âõ8„r=Òˆ\Ì-\ÍZM\Û\ß/÷è±¤¥‘ô3b•\ÕU\Û(dm•\äï˜©¬K£®­ ®Àü\Éi\ßN\ç\âlŠ0\0\á¯\ÂA]ŠiƒÀÚŠI\è,2°\ÊanS˜´€s¨°\'eÖ’ğ-§/#	_$5GUæ˜¦\í»Oö[\ÃÀq\n:Š¬Z7\Õ\Õ\Äÿ\0ğó‚\Ø\ÃHĞøûĞªX#\ÙO5N&oO,}4‘ù‚&\Ü[”\íw\Ñ?ƒšŠ–Ii£|u2&§qkK¾›ô\Óoª‚qOz!*{—‹q>\Z\á:Iğü6’(\Ş\ëı\Õ3nû\Ûñ;§\Õi\îÅª°\Z\æ\Í\å:®ˆ»<·/Ü´õ>…Yø\â÷d±\ÔTÔ€\Z\Æ\Ï\Ğ_9?„k¨\İV°Y¥†V‘fHß„6\àw°:]X†\â›hK­m$Í‘\Çş\r\'¾¦–\\\Õ2\Ä\r;®sir=÷\ì´\î™\"•²B\ç´‡El’ºGHV\ï61÷`=·\å\í\éa\ÑdØšc|”n¸\Ê\0\×\Şã¯¡SV´òF?\Ä\â¥4\Ï{#\Â0û†\ß{ ¿¢\è\r¿uRø{C$‘S–¾/6Y\Zs\Şu7=ú[¥–‘¦eCL1\Î\Z\ÚWƒ+3´Y\Í\î}«1aDÚŠ$G­# €Ó¡¸\è–?E¨¾ù\Êv\ÅFR\áøÇˆ\â¬dD\í\0P4\ï2B÷_‘äœ½ZSyY\ä\È\×ùq¸]–:ŸDƒ\Ü<\Ë=\îd·¾š‚¹Û²qºPZô3\äºCß•½\Â\Î)§kG˜\à\ŞÁ\×	WLû“•„\ê‹T9\ì{lNab¿šbD%‘?G¯¯xtO\É\æ5½/kŸu=ñ\Ş#†<¶h\ÌğZõo§¨U–0»”i”^\ä\ï\ì²2r¾\î¾\Ä\rB…¸õ_\Û#´!\Ù=\í2ÿ\0\'ŠS¹¥¢…Àu%\áUxƒˆ§\â,Œ\Ä@4\Ş&·@\Ëú\î¢g†\Î\å<§ù\Òl…\î\0¶C•§0\×dª01\è}õ\ÇL\äìœ–›ı‘\Ìs®\ì­\èo¸^r½\Ã)q=J}U##–\"\×5\Æ\Û\rlœ\Ñ`õÕ¯{\ã`kI°/\Ñ\\\ï\×,_o¤6¤¦uMLqGq˜€\ç{²0z(\é)\ZÖ·[k}\Âc‚`‘a\Ôö<÷\Ìç¾\ÊVI²\Æ,vT®·¹\éj­®Y¿gJ\ã7btdÿ\0‡«\Ì5\èöƒú‚¶\à\ÙiÙ•®u\'\Íøñ´{\å\'ú…»\Æ\ËGöÑŸ‘ûŒ„\'	!\0B€!\n\ØEE,±\Ä\Û*E?3ƒÀ\ŞÚ­ŠwU|n˜GR\í4y¸Y}Nè©¯E\Ü+{d\âUÀ’¸µ·\Ô\É©¨+^\æb4‘\È\rõ#[ÿ\0º”H\è.™O	¶q¦]ˆXĞ›ƒ5¸‘G\â\n¨±z\æK…VıÑ¸\Zwk\İ=\0\êğ\Ç\Za‘¢x§™­1\Ş2\ëi\Ê\ã±\è·X–X…\ï\Ì5\0iošF*‡²I	»\ÜK³f\ï¡\Ëú++!ik‚=²şMƒ`ümÂ²V:–h~\Õ•1…\Í×¶\à\ê+)Â£•Ø¶1©òLmt\×ha:g\0|K¢Ÿ;ei3r\æ·S\ÙGO.#Œ\Ó>®I3Y\Ã@\í3u/«{\çUix9\Ì\ãÆŠ`)\æ|!ğ˜eH\Ì\0‡\æÁŒ²¥†i\ê\é„ñ}\ã€4¸4Xü¶\Zl·ö+‚\áU\Ï\ËWK­ ¿Voµ\Õr¯¸~s18|s[¥…€è¦²£\á¢.\rò™\ÏnÅ}Q“¨•ù\\_r\àN»©bôb\0R\è\ÖY¹\ã±#ê¶¼\Ş`S\Öf(\Z\çµ\ÎS–\İ}O\è™TxM„K\É/¸¹úo²sË­ùØ•T\âøh\Ô1U\Ó\Í+œç‡¼fp\Zÿ\0¹Vˆg\Â\éğ\é\âŠVJ\â\Û\n¢7\Ö\æ\Ã\ÔXj¦ñ\rh°\ÈÌ”³\ÈÙœCXÖ¸ó\è³w†MdrC\rDŒˆ‘q{\ç>£\ÑI\ä\Ô\×\rœUXŸ:)5¸”¦7DK`´@KG5\î\Ú÷\Ø$i\äˆ×‡\ÔÍ\ë».¤š·\ÔøX\Æ33+\ç—:mú¦ñø~öaµ/t\í32SFO\Â\09\ïso’šÈ«òE\×g²3:ºÙ„M}\Ù\Ê	mˆ»w\Z$Yu0½\í\Ì\Û-–\Ö#N—7Sô1‰\áq\ËöZ†»\Ìo=Æ½:ÿ\0EQÁ•\Ê%C®w\ÑG\æƒ\ã|í—rS\Ì\Ìó2€c\Ş\é*C^oº\ë W¸8— |³8\ê.—w	R¸ò_/Ak\é¿S\àW\Ã\'\ä¢\Z\Ì\ì{\Ş~ğ‘lƒr¼ŒMP\Âb‰\æ\çP\Ö\ì¶\Ã\ÔqR\æ4\Èw·B\ÌÔ¬<±µ¡€º„²’ğ‰,vü³X3\Ä\ê‹#†™\ä\r…ÀV\Z~\nsš\Æ\Õ\È\ãšã“—)WQ,QÜµœ\Ö\ÒÁ#-X.¿[\İ&YR~G/$U/\r\Ò\Ò\Ä\Öf\ËøœnI\îŸ\Ù9@ì¼’¨¹\×\'\İ2§!:\é\İ%\ÎRò5B1šP\ĞI>Š2ª«(°M\ê«I:j*`\ê\ê\Ø\éÃ‹Cİ«¿”u)•\Ö\Û99¨­Sû8ÑŠ\0ûL¦\Òb/œ\ÌkB¶\Ë\\\ËIğV6\Úz*jZ~H!`\0[7\Ä|\æV\Ô#\ÛŒIËºM–$b“0K\" „!\0B\0„!\0xwQ˜õ4“Ğ¹\Ô\Í>f·l\İÂ“;­_\âß‰U\\\rŒ`Ô´\Ô\ÕET$ù\ŞZì fÛ¯©J¹ÁA÷øEs²j5ù$\èªb¬‰\ŞQ>dg,‘¿G°ö!e$ ¶ı\Æ\Éóğ\Ü\'Œ°ªLg–HQ’\Z¨WGw±\Ü[\ÄYÄ¸„\ÖÒ·Ã€ş=0\Ë3}K6?+,«º{\\\×\Ê.C\'K†-QN[r\Û\è4°Q“\Ä\æGmE‡’yGPV\Æ\çE;\\á¡Œò¸Å§PR’ùOk,©Á\Å\èÑ„\Û!l\î\Ì\Ô\ß\Ñ3\Ğ>W0‡\Ù\Úl:w\İKM,Ñ \íu\Ğ\ê>ªœ–İº´kp=od½±\é¦G\Í;‹9]q¡tLªLfP]£Ã­¯­Í”ŒĞ‘ k€±Ÿªl\è\àl\Ã}v]\Ù>\æ«,\"sK@\Î\ìºn\â@²o> I:Œ··\ÔÜ•\ãÙ”Jò—hO¶¥0–\ä,%¤;©]L\çj1\Ä+|‡\Ér\Zñ \èoq¢yYY\åL\Ò´°\Øj£¥cex/“ş¡µ–Jœs9\Ú[¥¿ºŸ¢.(\È\ÖÓ\Ò>\é\Â\Ú÷)µM[<$\\’H›¸eø_ñî‘™º‘š\ì\Ğl¦‘Æ‘œõ®¸;‹&Î¨< \êw÷=–\Î$I\èx\Ì4\Zú\ìl˜‘ŒŸPëœ®v\Õ#$\î\r\æ\Û{w^<\09N»h›Hñ—\â\Öö·TÄˆ±s9e\Ú]tô)	*5:§C{ÿ\0d\ÖIE\ÃCº\é¯\ê›\ÔT€>&ƒú©¨‘\ØñõD›’.;$\ßP\\n_òõQW4?C¨	œµ\ç˜\ßu5d\ã\ê\ÃI×¦Š.¢·{ô\n\"j\â\ç\×_\Ñe5Uc€c\ÈO¯RfDc\å\ÏTv’z\r\Ôÿ\0\rQ\È\éòJspœ²½®s\çw!m.\à\éRcü–…T¨&}×»8ô:\á:i\Z{­±€\Æğ\Æ\Ş\ê?\0\á“[™ª\ëC‡ˆZ4N9¥tñ«0¢Q\0B\0„!\0¸A\Ù# q\Z ±*È¨(jk*hi\ât¯öh¹ıñ\ï\ÔqEe.?] 55‘\Ñ\Ä-4,vVF}\É=nº\ïˆ0\ÏŞ˜mM®>UDn‰\ã¸\"Ëñ¿±\æ\ÒQP\Ò\Z9\à¤Iğ=Ù~n\ê¦\\g(\ê+f·J¶š¤İOş|\ãzœˆ#À*f2a\Æ&»ÿ\0B[f\Ó\Ğ\ë§u¿¿S¸\å\Î\Û{­	\Ã>\ãÔ˜­5elô\ìl\Z†4—me´ğ¾¨i¨”Ÿ@§Œ§jb:Œ\ê²\î\êŸóüñ¬\Ç]¦™¨ü3E\Êñó\n¯YÁx\å‹ğ,XU\Ä6‚°\\üœ5[d i²“†±\ì\'T,Zš\ÙNJ¥š\"ª«ˆ0«~õÀ\ë,\Â9\àûÖ‘\Ô\éb˜\Ö8xC,®C®ZŒ\Ñë¶—£K \ên!\ÃøN kpúişhÁT§\Ó)—\é\Ú-\Ã>\Å\å&hGq5S\ÄT4\Ò8›^.¹Nş\İ_ºu\â\Î@6¶Ÿóª\Øx¯„\\ˆ]…\Ç»\Ç\Ëe\\ªğ\Ô\Ğb8/`É`«Ë¤ÿ\0¦C\×R^\âU\ê*!!îˆ¶\ä\0\Ü\ÆÀ¥5{\á~r\ç7)øt¶V\î§j|\r\Ä\Z)8š¦\Çğ\Ê\Ğñù…U\à\ï°8ER\Ì¤I\×\è–ú]‹\ÃCWQ¯\Úd’\Æ\Ğ7\ĞÛ®½’H\Èö-‹X÷ê¤¦ğŸµFğ\0\Í#mº¦sx_\Çw¾J\'\àW?§Z‰}}Ds§ŒØƒv\ïªlú˜³{€t*FOxõ\Î7§£±?\ÌV?øO\Ç[3im®¦º}§}D$\ÕL\ív—±L¥¬`™´S}Õ©¾ñŒ¢\ÒTÀÀw\Ê\Ô\â?ø‚o\ã\âo¾V€™	û,úıl Ëˆ3QœQ‰\Ä\Z\ï¼[zŸöy\ß\âkdCr¦¨ÿ\0g\ê&epq\îuO¼±2\Îü#œ\çÅ™r\"vaµ\Ú?4‰–®¤\Ú%p=H²\ë\n0ˆm˜4\Û\ÑX(¼+Á)\í÷->\á>8°B%—6q´8-V\îXœù\ÙM\á\Ş\â•nF\Êo\Ğ.Ê¤\àœ\"š\Ù)™§¢–ƒ¡€0|“£\\c\á	•³—–r®\áI\Ê]\ál<ÂS#\0ù-\æ\Êh˜9X\ÑòJ†°SPğ¥¤\ì\Zz+E&\rON\0k\ÑJ\Ù(\ák€ z„\0!@„\0!@ò\Ë\Ô KA\Ü,]N\á(„\0ˆƒ¢P4’–^\Ø!\0²„\0YB\0‹!\0B€Y@„\0\"\ÈB\0d!\0B\0„!\0B\0„!\0B\0„!\0ÿ\Ù',15.00);
INSERT INTO `productes` VALUES (2,'beguda','coca-cola',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\Z\Z* \Z%!1!&*+...\"583-7(-.+\n\n\n\r\Z7%#2+0-+5+/5---5+-6--75-67--+-------/---5-----------.ÿÀ\0\0\Ë\0ø\"\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0F\0\0\0\0\0\0!1A\"Qaq‘R¡±Á#$2Bbr’\Ñ3Sc“\Â\áğ%s‚ƒ¢ñ&Cÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0+\0\0\0\0\0\0\0\0!1\"2AQğaq±Á#3¡ÿ\Ú\0\0\0?\0ûŠ\" \"\"\" \"\"\" \"\"\æ\ÄkY\r\æÙŒisıP\âWJŠ\Úz>w’<Á·¹nav›.8\Åyl\ã¢z|fñÏ·¯\á]¥\å9Ñ§”7\Ö{˜\Ûğ\×7=\Åx\â<¥G!°ºB7\ÙÀ¸\ê\í}aÃŠ¡\Ø&¹\Ã3Î¡®=m\à\å×…õñ]\ßİ´%»\ÏN\×\Ğ\ræ¡»NÀ³c_\İ×›ş™\ÌVqó\î\æg+1€”²†õ±\ìy*¾\àøœU8k*\"vh\äiµûG ÷/š\í\'mm3\Ü\Ù¡·³Ff†Œ£/€Ü®›„\Z]›dEù\î\\ğm—.s›%®wUº|\ã\ÌÇº­£:11>\İV$DV°ˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ„»p¿\r{G\ßkø®\Å\ãX~j\ïº}¡\r3‰œp\èß²\Ä~cÚ»\ÚtQôZ\Ï\ÜÆa*A¿Av9>Z“»ºş\åÛ‡Ç–\Í;Ç´1f\Ã\İ%\ßHoH\ÃöG¹²\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"\" .,^KP›o$\çp]ª‹\Ê>\Ö6’¢\Ë\Şı,,Ö\ï\ÖIü%FöŠ\Æe*Ro<ai¢\Ûá§¼\Ø?F¨\ØF5$”A\Â\à}â¿‰q\Éù\ç75¬}w,7ıOoX\Ì\ËMvZÖœD.õ \ZRW†\ÏÏŸ	a\âÛ´÷´\Û\à¨\Çi%³qmÙ\ÅHòq´Ìy\éò†=‡?˜&\Îwx9o÷‚³C{¥­8¤£«µ\ÕÓŒ\Ú”D[„D@DDD@DDD@DDD@DDD@DDD@DD™v»»},À\Ş&n?ò\ã¸u‡\Îÿ\0ZûG+;C\è{!i´³|”}`¼\îD08ƒ\×evr;\âdŸ¢Ö’|7,û™ğL7lkşH—\×ğz\Ğ\Ì5­\âu\\b¼º¡\î\ã1P´5„\á\Ó<\ïŒ;\ØÛ\íP\ØN\"ó…ô\çµv¼©˜}&ŒD^\Ù\î—\Äq\"\'Ş¢¶kh=n¡©y´NvIz¹¹4$ö4\åú„“\ß\0õ¨œy\Ñ¿e§\Zs;ÿ\0MZ\ÜR9\ÚK\Ø\Èó\Ë\É?¬\å#]\Û`O[\\®\ëµœ˜ÄˆˆD@DDD@DDD@DDD@DDD@DDDAŸùxÆ¹İ§m0=\Zf\ÚKgºı\Íy•R\Ù\è-†\É\'8\Ü\Ó‚\ã\Ú*ÿ\0H\Ç\êj/~vW¸}\Òóx3(ğR‘Œ˜dl\\=\ß\Í`\Ü\Û1ˆvv4\ã\ÆR\ïù=™“}\Ş.O\Şp¿q\n?&ÿ\07KşqsG–¿_¢kƒ\Ü\Û³Lf³¦s\Ê~\ïJ·Z¨;µs\â\ê\á\Ãx\î)_O e\È\Ğ/izT!İ‚\ê\İ8\ÄC.\îs~\Ë/ \ØÉ‡k\İL\ãÑ¨aü\È\ï#?\â%üAh•‘ğJ\ßFÚŠz‹Û›‘¯?u¯‡‹n<V·—B–\Ì8zô\ãg\ê\")¨\ã…\Ûeúˆ2%]ŠT±—Ši\ZÁrz\rµ “©\Ğ9ƒ\Ó:Z,\å¥Á®uk\ÇÁºù(ª{¾I\Ş&I@\Z’\\ò@‰\Õ[\è0ššL8‡<4™\0|l{‹£{™˜2B\\\Ù[«C‰\0‹\Ú\ëüVŸhw+ŠiS\ŞaÅˆ\á!¹[.\Ü^\İ: \î\Ü›®\áp7•‡a\ÕM˜0æ»›k°jÏ¥£\Ñ#6\ë\é{\è»ö™¸y\"YA\Ì\r\Ã\È7:^\ã³E[¥Ä¦lvl²4f.\Ñ\Ätˆ±v‡y¨ğ®ij\êv\Êk¢©{rˆ‰.! ] Ü‹¶À›Øƒ¿vñ¼.|2†aN[+\Öğ½¼B\è\Âğ\ÚúŠ\\\ì•\ÑÀ\0’G¹¬2•¬Œ4=ùE¬Ö›­”½Z)¥&¢*–\Æ-$q\Ìf|@œ\Ù\Ë\Ñ\Ñ63o5/§ŠtW«­\ËW0¦ˆZv‚(\ßs‘p½®×¼\Ã]\Ë\\5¶hpY;hpù ­l\Ïm‡É¿x»s\æª\â]n¥¬A\Ñi\Ñò¹›¿7G\ê\"+™D@DDD@DDD@DDD@DDD@DD\çPû@\ã\Ô	ò\Ñpcò\äÀ§«‡É„ \Ï<kš».w\Â\Êv\Úù\ê\ç%±›q\Ê.\ëwu+•Í³\Ğ]¦\Ì y}T\Ü\ãœy\ëI‘\æZk’M\Ï\ÕU-—¯\ÛI9fvGˆ—¼n»£……‚ü\r‹\È\îW\r™¨–§¨h¢—›¨xt`8°\0\Ù%#\ÇN\îqq#RIµ…­“¦p\ë_—Ÿ\Ç\Ï\æw=^\Ï\ÓN!{cqlÅ±\ÃsÀ–n‘–I|\Ü\ÌL\ÕÅ¥¹œ\ÂQk\ÄaV=QP¾:H2½\Õ™ùYO%\Ïh7\Ìe Ø“`Áp.5³\í7%&_.ğ}S±ù\í3ı1xşƒ]¦\â\ëq½B\ĞÕ¶>Jã¨”=\í¬¬ù\Ñ`\é:8\Ü\ë@-`Ö»˜d`h\0“ÁY…{\Äg?h\ê\Çö“9Î’9`¤\ÊIX\æµ\Ô\Í\'¸\r{\ísõ³KÆºı\ì5ù4õ2¶H\İL’¶ÎŒ\Èé¢¦³µ\r‘\Îh\0\é”w+4“>šlFH9Êˆe\nR™M4¡Œ‚\'\r2ó1€óôE\ä\Ê\æ\é)ƒ\Â…\Â\Ø\Û#\á˜\Í5D&W¾\nBX#l–\Ü\ìyÔµ\îİ¸-\\Áõ\"\'>\×\ËùH\Äçš¨	4­»-6\É^Z9\ÉÇ®\\lsk\Ñ-Z‚‰ù¨\Øî¶´ù€Vo\å…\Òh\Ã®9\Û	.nğ\Ù%q’B\Ò~®g˜À\à!,´.\ÎK›g©\ëAó¥OO²\Ä\Ä\ÌL$QX\Ì\"\"\" \"\"\" \"\"\" \"\"\" \"\"\" *\×)8€ƒ`\ë$7\Ö0X\\‡MòL=Ù/Ø¬ª³\Ê]>}­oTw\î\Æ\áG°\Îx/S)¤²Zùm\ÜnhVl£\åC$qt§¤Kœ\\\ãs¿9\â¨Lxôhÿ\0®¥=Jü»C½ƒ£ü\Ö‰›;V¼E:G\Ì\'¶\ßhjC\ç\æ6¦B\àöZÅe\Ë\\-k‡*©…\í]e5¡‚¢H£y»š\×[R7´\ïi\íi”–\Ü3\ç±}\Ó\ï\n·T\Û8+\"}E<9ş\Ôø\İSp\é)\Ù3›\Æò0= Hw\âMõúø\İH\àûE[\rŒT½±FÇµ­l‚\Ìd†\ï)6¹ñ,¡À¼{—®Ïš<õ=¡Fm˜Jú\\f3\êş¶§¢§<2zNp;\í»[\î\Éi^L«\Û6ÀÑ½¹´…±›\ï\Í\æœ{³0Ø¬ÁŒH´ÿ\0&4\Ü\ß\'ôMë…¯ı\ç\Ê¿G\ÊÁ¸ŒJÎˆŠ\Öaq\ã\Ü\î4_¬‰\íüM#\â»0¦3mıeb6şÑ¦p\í\n7¥\æ±\áü§‘\Ùds~\nNŸX¢>«\Çõ\ìXu\'\Ï\å\ØÓ§*G\â»g/\İa\Ü;•_Š\Î\ê\í¶Mù”\'\í\ìşJ›Š;P¡™\æÑ§ôg/&³\ä\×mv\Ã\Ùö}—ü—”M¼k¾?„v¸ûÿ\05\ç.\ëu\éÒ²¯\ãù\Ñ_’×¸575ƒ\Ã\ê\âc@ø,š\Únwj£Šß¤6~7µ¿¯–\İ/+‡¹ó\àDEk0ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ2¯)\Ü\×(\Ì\Z.Z\Ù	óyJQş\Ú\ÓğS´@(³½ñD\ãß“/¹B\Ğ:øC¾\Ëo\ä\ë¬§oa>\ÊÏ´\âøG\íƒ\Ä\ïi6TŒQ½0®¸»\ï³ß¤\ßs‡OÄ\Ş\ÕM&y\ÃEb>œüõ~\Ó7¢§YE?kOº\ê2+§ñH²˜{}\Íü\Õv·Yh´t¬!ö\Z—\å:•¿·\Ïû dş©–q\äšı\éEª\ÉH\ï1‘\îqZ9ut¼ù\Í\×ûdDEc8ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆ£ö‡ô|\nz\ÕD÷\ÖZ\Ò@ñ  \Íü¥bmŸ”*§\Ş\ík¹±ş\ËCÿ\06¿\Í~Á[u·[\îÕ¤´~,£\ÅT³T¹\Î%\Ä\Ş\ä\ïq\'R{N§\ÅOâ•–\ÂY\Ş\â<›ü\ì±kW”»kpˆYñxÿ\0õ\Æjl2n7\å j2ñw\ê:\ÕJF‡IÛ–ü:…Ç…\í\à¯\ãÀÙ€Ï¸7õ×±R)eš\ëú¿ù,ù\Ç\ì×§\ë=\å\äNSf‘~ş\0k\îZqyG \Âş\Ğ<\ßÍ¾\ÕJ\Ä\'»û•’¡¼\îÊ´4ô²4¼\ÏúS>Q*­­\Æqp\í\ÙZ¦\Ór«Nòl\Ò\à\ÓşûLC\Ã3š|’Y‘Ş˜É\ÇD\\¶ò;u%j­œ\Ä}#\0‚£õ±1\ç½\Í;­š)\å\îúß—ºEÌ¢\" \"\"\" \"\"\" \"\"\" \"\"\" \"\"§r½9g\'UDqoƒ\åcO±\Ê\âª<¬\ÓsœUU\î¤l‡\Ø\Õ\äöJ½á˜‰\Ë\0\í\'Ø§0\Úf\ËS\Üz,n\î·vÿ\0\\zcxÂ‘Áj²7_\ë\Ég´b2\İ\Ì\ácÚšò0Ö·­\Ã\ÙrªBn•Ô†;Y\Î5‚\àZçŠ‹dñÀ¨DF2º-lbr:\åL`˜óD\éõ{/¼(·\Òõğpø lŒ7°ö©N&1u‰ñ&±f^œ\ërû÷#s—òsK}\í\ç\àÉ\Ñ\ìf©«‰\0›ä–—›\ä\î¬\ÇIû\Ù ö8)hVcº\İ\ëhŒ-èˆ´1ˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆˆ€ˆˆ‡†7\á\Ç/\è\ä\Ìv„ô^\ÒÓ ×Š\îDe¸7-{òN›	\Z\0@vñÔ¥pí§fm[?°y>  «pzyIO\ís\ZO”%N\Å\Ğ^şŒÀ{›\ÛÀªæœ^\Ñ\Ú_$©\ä\Ö}­5\İ/TRÏ¨\ê\Ì\Ğ\à\Şûup]òV\Şnş–\ÛX\ê`•·\í±n–\êú\ße_j6n•§£¹ä¿e\Ç&	ì®¶ºs’nüIÂ©Æ¶¤v•üœÓ‰,\êı}VRNòx}&ƒk6\íµ\Ì\Í/%”œ\Ès«d\0õ\Æ#6\íl­»|•š“ƒ5²º\İ\\\ä–\İÕ™O\Ğ\ì\İ.O\Ñxg}¼³Y8W\ØúÚ\ï”\ã»‡Ea†¥Ï¨‘Á­Íµ&Î‘ùÀ°M……÷ı\Ï§dxlqGú8\Ø\Ö3±¬hhö\åE„S\Ä>N\Ù\ÚÖ€|\×z”W\n\íl÷Iÿ\Ù',2.00);
INSERT INTO `productes` VALUES (3,'pizza','Base de pa, salsa tomaquet i formatge',_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0„\0	\Z\Z\Z\Z( (!1!%)+...383-7(-.+\n\n\n\r-& %-//--5/-/----------------/------------------------ÿÀ\0\0±\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\0A\0\0\0\0\0!1AQa\"2q‘¡±#BÁ\Ñ\áğ3Rbr‚’²ñ4Ss¢C\Âÿ\Ä\0\Z\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\06\0\0\0\0!1A\"Qaq‘¡ğ2\Ñ3±Á\á#Bñ4RrCÿ\Ú\0\0\0?\0\Å\ê\êx ŒrdB&Vtñ\Ò\'±§13§¯‰ØŸD\âN\'‘Ó¥„#)wx®s$9r+\áøÎ‘v¼\Ì[“§2\ê:8+:Z™V@`LWl¹b·‡\â™RB€Y\ÙÉ´Q\ëÉ„®\â£\ÖÀ)…\\òX”\Ø\ìkùÀoo\r#[½\Éa\Úi4œ,¾È ¬6¡­ñ„¶19\Äiµ+œ±\ì\nl™¹\nµ;ş\'”0–r:K/Ê°T¼\Ép£o\ß8)Á\é!w.A‹\Õ)‹hğ\â&UŠ7Hb\ĞFu\ê/™8™\Â1pw®²k2„¤ø\Ôş ó?hOYª\'·a¢çŸœM’G\rK)–É¹v\ëx\ÃD´‚I\ë6¿\\P\íS˜3¡©A=•InEjv0U­;˜\Ízš\rõı§8US­(¨uK6\ÌXŸ0­\Ûpoô\àe\ÚMš]=\êM<Oõø%(\à:zÀf\Éi3ó¤w¿y#Ÿóù\Åôúö_+ô˜S“\ï™=\ÔQ\Ì\ÉP‚’|*J‡4«-F\àF\Ív-ƒ*bŒ…zÁ+½\à¢S…´L\é\æX\ì\Î\Ä=`\n˜B\æHb\Ç\ï~7…5\Z¾U\ë4ôš\Ş{:zzÿ\0¨ùQ‡.–I¨\ìò°I%‰7\ZrmšP[¨\ë4\êÏ“´\Ï1|rt\Õ¥{8Ñ«Nˆ8.\ím˜\Ú¥“©x`DÉ“J\Ò&Dğ\Ês{D8\ÎU,m™7‰=x\éGIŸGNGN–%€Ã˜¡É:B	m\0&;\"t\êj¼@<IŸ(\0Ù¿\î½\'H§Ñ¢Ã™\ÓÀ—:,#¤~šµ)±\î¨ûBš¥Ü€X\Å\'\Íæ)@¢õÔª€Å‰<L÷2ª®œ ÷»D\é˜ğxQ±½ˆôÕ‘I\ÌÏ¸\æGaT´h•w\ÒÜ\êğÆŸÌ™€º\ÃÀxj-ŒÏ•.8Ì“\Ä\"$™P±—†x:}a\n?g\'yª\Zÿ\0`ûÇ®v€[¨ZÇ¾Yk,f‡‰\ãR¨P)h\ÒHºòûê£©x\ÊQ¼—=\æ\î—G\â\0\ÏÓ°‹5\\AT£z‰Š\Ê=’\Âf˜\ÓT½N)«¦yŠ?Ü¢~wø\Ä_IsZ\ã¤aÁ1…\Ù\ÎC\èñ9\ä\Ñ6s™—mG~W\Î\Ò\Î%2ª•C°˜¡(¶Q¨Oô÷œ4P\ì\Î}cšu\nMª7½³\ï„\éq©rU*´JIĞ¡d\0®E/¡\×Ck@l­·VbZ)ÿ\0Œ¦f¼oÁ*¥&l©”\æïª¥ÿ\0w4òW¿3§¢×­şVá¿¿\Âd[F\ÎDP¦’¥œ©@9øFƒ0&T±À\Ü=ÂŠ$)bú€t™\é¤gİªÏ•&®ŸFµy\í\ë\é\éñš=$ŠIJŸ<€\Ìo\É)\æ`)Vyo¤%Ú†s…<L³‹¸¦ed\Ç\'*d#d\Å\\\Ìh\×V9=fm·qµb\Ü1\ë9‘,J\Ò$Nªeâ˜<P´t\é	h´\é\Ú%nl\"3\é:XFA¡^L\éò§\'›\Ä`Î\ÛGNœt‰\é:v¤×°\Ò\"D\êd\á®aó\nd\È31\é\Æ\'O„¢t\Ò;8%,GYÓ€›>ñ3£w\ÑlÂš\ä›xÿ\0[R\ØP}ğôŒ“ğš¯bªB8\ç´!m›\Ø\Çôõyˆ8\n\×SWÚ’İ™$ü\Æßœ—bc\Ö\Z\Æ€8J¿I‰LÙˆK&\ÙÒ§pN\à\Ü^	¥`¤®zÅ®Ue{D”ˆpÀŒ	\ÑOHŒ\Ë\Äwú5\à¡TMDñöSÿ\0\ÜP\×ü¡\Ãó6\Ø\Ål}¢™¨q*Q&™K* 4´w™€fõò„õ?/\æ«\é\ŞcU•a$©ju¹,5}nN—ó0T¨öû^\Öâ±÷Ÿ\"r{<\Åß”qO6şSTF7}„î’ RQ{*ùwÜŸ(†Ltœ\Ñ\Õ!\Îsñ-Z9=¬´©m\×E$ó\æak1´’3OhøË·ö·oCîŸZD´€³\İx\ŞŞd:\âU-‘\Ö\n\â	Ô“P•\"[’l r¨1¹mÇœ8B\ä\âKuÕ±ñ\Ğ\âsi\î&f–-Ù­\È#ş_Fp&¬9\éÏ¬uÖAÁ\'¸Ë¡‘=$\Ó$IPº¤\å\0ık\Î\ã}¢M§şSŸ|_\Âm7q\ê?\Ì`\á\Ú&\ëŸsúCT \'1\rE„&aôƒ\ÄFª ¥\ì%”¡\"\Å}\\\èyyÆ…k\Ü\Ä-³hù\Äù¢\"³‚ˆœÈœ\ÄÎ“J\Ò&v\'ªU\ËEdO\ï&wLFm/\×òˆl\âwIòË–1İ§ft$x\Æp	E\ÛQ™3±%@\År\'N4Ac\ÔE€\ÈÌ‰\\³¸‹|gId\É{˜‚q:}\Ø\ÄfH\Ä\í\Øw­\ĞGw\âv$I[-\Ê\'q\'JKƒÌˆo…«¹…o³Bº•$bihUy\Ì#qŠ[4?1Ë­J\×\Ë*`B%yA­ ˜­W¡2\ÇqO\Ö%#\Âà¨·-¼WO§(w[¬LmOœA‡Mœ¬’eªb™\Ù!\í\Ìò\ÃX¨2\Ç!I„dpµr•”ROwÿ\0´°?\ÔC|b‚\ê\ÏB$\à‰·ğn2‹B*r £:Ál\ËRÀ}\Íöx§‚H\âS#13\Z55“1)+R‰J\0û‰\Z\0\ÜóxS\Å\Üø1q\çlv€Î–\ÖjYEAÃ‚@s}X—\åğ1»œvšôSBœL†@Y\Ê,Gv,Ky˜©=\ãgOZs´K\"D\é\ÄKn\æ®n\İ\Í\Ûoh¦Uy—\"¼a†cá¼²ÀÁ¸m‹\r=7\Ù3QZ«y8•‘Š.RL©òûD]l_›o(VmõœC\äX\ãp\äwƒ0ù\"ı\å)D\Ø*\ÍÉ€a\ë\Ø[ bhi\îKFA”~´VµKFe(‘sr^\ã[ó‚°C\Í\Ô#=>\Ğ\Å$µÉš™¹\\\Ëb¡š\ãb\â\ŞO¤*ø±J‰¨\ÅmB™\ë\Òh4“\åTKZ¤–%%\'b•g\ZuøÅ´\Öøgcñ<Ö¢‹*l<ü\ë00bÀ‹ü¬chs2˜e{úE\åg3\Ñ\ÂD-\"O,Z&L\åjc\Ä\é\Z”ñ3§R\Ô¡ş~† ‰0‚d“\áK\ï,Y\ÛI\é&¥\Â\ç©À”³şSóh£]Zõa\n´Xz)úB’8b©L:_\ÄÀY@ÿ\0´¿\é¬ô’\ÔğTö\Í0Ë”¹¦x ö…}\'\åN…¬8?i\r?\Èû\ÓÀòB\Ëùi\Ú\Û;/\ÜM\ì:Œ\Ë0:PUÌ˜y\åoU<Pjn=@xDöUg÷|\ä”>â›–søñ\Ü÷ûBŸd\éıò\Z¬4fK#*O\İrIõw\çK\'˜öeAıs	\ÓPÓ\Z˜\ï™Kù~0»\Ùvy~>Q¥ö}@\âLªZs\İ4i~ŠTPYh\çÄ„>Î¤\ßH58| r”5ØŒ\Åõ»;\Ã5„g0-\ì½9<|\áa‚QıÉ…=Ÿ\Ä4-ú›û‰#C·şƒ\å\"›\Ãh.ÁmÒ¯\Î,5Œ=Dƒ¤¤ş\å”&ğô°n…\'\Í\à\ÃVş°øı9<	ÀS÷^-ú£\ŞAöu}¦ôU‚›=@’²_ùR÷÷\'\Ú\Ô\ê‰`@\Î>“>úU`?’|o\é\é!!N\ÑI\nQê”›\æ\ï\ÈAÑ™€$\0fs¾)T\ãKZóMR\æXø\Ôoı¡™#¦‘¹\ä\Ç4\ŞÏ»Q\Ë\ïğ\Æ\Å:É°\ä°ş\ÙE½aW\Ó\î˜ÿ\0ş\Êÿ\0o÷)+%U#³Š\Ä(ePpAa\ÏM9ˆx0`ús}=ºv\ÜGCñNÀÂEk™œı\Ğz“û\Ş\Ô\î¬rDiõş(Â®=e¼ŠqŸ\ß	2À\Õ)aú\é§7X§\Ş{Jj\Z¥«\Ë\×\ã<\â¼FM6l\ÓR|2\Ò3/N[jm»H\Û\Îc\Ójt–\ê9QÇ©\é3\\B¹IR\\ÿ\0_\à\Ñz‘«:¾\ÄYş\ß\îG\"\Ò…„977 \Ía¤¶O2õû)\é}\Èr#•?$HGc,ªb\ìf\0.<Z’Àr…÷\ÙiSˆJ\ï	i\Ş@wşšd•M+@9³\Ş)wˆ\ÜbjM\Ç	\Ò.aØ¢¤L\í%\æ\rb“÷ƒ\Üò}Ä–U½põ4l©u	µ‡Àÿ\0™\'\Ò&l¿¯\Ò#\Ä3\Í@\'¾t|À\×]]Ï¡Õ‘ÿ\0‡\á<†ª‚¬Gq3&q\Z\İ\âDSÌ‰Â…\ØDÎ“¡&$N\Ì#YÌ–¦#³\n\Ó=‰òN¾­\n®¡X\áNfŠ\é{$\ÔxL‚KZ$€Ÿı‹ü O¨°p\0\Õ\ì´~wBRp¤k.B7T\Ç[u½¾sÿ\0ÙËˆ\âû>„\Ç\0Ÿ|²*•+¦\Ã\à c’#\é]j8Q:]§x¬\0ú\ë\ÑÉß°co¶®YX1\é\Ó\ç:•Ú‚5<$ş‘\\¦3.@=gS*\'Kwı	x\àUºJœcı™v’¶Y’¢¹j|Ï¯8Vû\Æ¹ ü¥\nBC•(=ùt†˜cis\Ö[J\ç\Ë \ÊB‹–{7‘\êb»Q‡š	Ü‚Yz«>\Ör“$5Âo¸ƒ\Ş/\å\ï‹\n©\æüõ„ıbV˜i.\ZºD/\Å1™‚Št²\\ûˆ­«s\ßX»{QX`K³ih\æ,…N–x®¹õ\å©nş!´Â¯\å*§‚¥¨\æ—:\\\Ôs–FoR	ku/X\äK&º§\ço2\ĞÓ•‰i³$Ÿ\Æm·Œ\Ğ\Şè›šXÅ°Jye)\nTu\Z\ÄW¨°Œ\ã2”_k‚qÄ¥‰\Ğv\äTÕ û{Áj·\Ä\à¬%vøŸ½c\áÆªWi:Rı¦T‚¦\èMb­§r\Çc¾é™«\Ô-M¶²~\é«ñY²e¬	 N§\Ë\áÿ\00$\Ô:ƒŒğs\ÌQ4õÙƒ»™“\ĞÎŠ»\Ç/p=’yõ\r \æ\İcD†\È¤J¶ZTöşÒŠR™ÜŸŸ¬[´ôË\átlœ\Ê\n\Ô\0Ä€4\Ôz‘Y.\Ü\àG\Ã	\É5i$)\Z9\æÚ·\ÏXRë‚°\n»¦Nªş¨§\ãe\Êp\í~PõU»\Ùyô˜\Ì\Ü\à‰\×R‰$\ÊI\n\Ñ\Ğ3\Ë5â–¦ \ã°ô\Ï_¤kD´½˜°ñ\ï\ï1¬O6e¢	r§{—»\İ\İõx…œ·\Ë\Ó\í”ÌpILdÒ¦qB!”\Í3\è÷ˆWc0ø\\ ôÔB}H\ê|£‰‰\í._\Ä^ıa\ìjˆT£¹0;‡%”,ö;\ë»Á<¶®õ1]5\ÇNşaş\"&1\Ã\ë–\ÅYs(³}‰*\ÓH\n“œ»§Õ£\çoAî…¸kOfšu(¥L’tRN\ÏüÀÛ«BššÊ\Ë\Ö\è\Î\ãh\è~\Çø™—aš­A!¥\Ìu££ò|¸\èDmho7U\ÏQÁsQVÓŸX±1Bi\ÊFû\ÄÎ“ Z$Hu´ùV\Ó;\är\ê·LÑŒ¶q•\ÜÖ \âV\r$\Ë\n@R…#\à/\ã¾\îD°©Û·ˆ]-\Ü5öõ†\Ç#0\Ü	$\éJ¹WÁş[Äd–ÀÌ†k%\Ç\ê\"%\ÏKCˆve79\ÈöÕ\ÑK*=ğ(a\ÇY\ÏNT\ÙÀ”«%™Á6\çÓ¨D\Çy\êra+\ÔOVt„ºR@)°:\êX–\ç\n0d^\Ø ‚§¥9šR””ıÔ¬‚A<½´0&°c\Ï2ÿ\0XW„{\åªô.BAš¥•3³¶\ä\Z‘aÂ›l\êL\rU‹÷HB\0\'s¬2•s\æ2Fh>MD\äœ\ÃS­\à¤Vx‡\Z:\âYUUB®V\Ì-°€@ñX‡_f;\ÏÀô5X^GÀP:\ì\ßGZ\ÈF\Õ\ê{J®›À?òG\ã„J“\ß)9\Ï`ú·\çö‡Uº\Âş¡\íòçˆ¹\ÅX²%\å\"@Z…Eƒ|\à\ÚZ\rN#U>h\nµ*0\È\år\Êf\íşpò ¯€s—°\Ê\ç?\ŞÀñú„Ì•)\0©»Ù¤·u­”>Ö¿/X\í˜\Î	øsÉ‹]JIú\Ç:eeFUT¢-˜Kõ6-\ê>]\â\ï§]»\éo\æ&q·	K§P\\Ÿ\Ç$l4\é}!YN\Ö9\È1\ßfØ0¼\\¡¤V` .\é\ËH–p!o\×\é\ê\àœŸA\Z¸rYŸZ%-\nJ2¨f²”\0y_M\ÇKD1¼I‰Y\í\0Wı\Ç3J›/*€’˜NÊ¼;\Ô\å˜‚œ©\ÏY\rn9.Sˆ²GÌ„>u•Œc™§fç ƒN;Rµ6T„¨\Ì\ã\Î\ï\ëmE\Öğ8\èQMJ=ó\ÕÍ‘R•K›üd¼b\r‚’­ù[\ÖÖ•¯u‡\Ì>òé¾²?iˆ\\CƒÌ§Z3¡M™Ò°J‚À\r¦\Ë6q³o¬6s€}fÆ\äµISñ1ş FR\\\ïĞw\Ö*c•ƒ\Ş\ášp¹ŠJ²‘\İgø…u,\ï”\Ô1EF\î¦™*¤KIyJI\çf\Øoo„vš\Åg7X\Ëe;ˆók’Œª@S–¸\ÇX	!O#¿\çx®ˆl©\ÄH\âj$ -$(ßºö\Ñ k\Ğ0\Ù\á…>½&Ş’\Æq–<~~s\é†\çTĞ¦b’ó¥\0»jC2\Ã—a¸]=V\îo\Ú\Ü\Îj<6Ê§c\Ä\Æ-±\îó0È€h™“¥Cö\"D\é£T.b\\e!D˜¨ÿ\0Œ`\"®x3xûTôû\Îğ\Ò%?i-Em\ãT=œgŠÜ–?\ín=%\Ú~!\Æ0 y“”Hr\êUº9/\Ê\\\í›_E˜\Øyœª¬3y¿\à\Şq1œJ\ëšú‡õ\è\ÑÓ˜ã¤³„a\ê5(Nÿ\0¹\Ùf\ÅÌ¥Œ¥O£%	j%=šlO!w6\ÓS\é¨\rÁ\Î{L\"l\Ül\â\Ó-sf†÷@\Ô\è<ô\Ú$ªòb\Íeš¯(\éù\Ö5P}©@L3Yc¥‡H\âºùG„Ô¾\\Aø\Ç\ÔÓªbi\â`$$•&\ç0`4fˆÀ\áqŒ}{CµŸ“\ï€\éøf¡jd¤ƒ¹†°À$ñ4ü]:s‘;^42\Ö\àé”—\Î\Ö\ÑÇ°ƒSIÿ\0°ú\Êó°Õ§T,`\à‡ôŠ\î†VF\èDöŠ¦m9*–¥\0EÀ$\ÉØ·¬Aú\ÅõU®Ü‘,Ì¯Pb±˜\É\'\Ñ\ÌWS\0\ÉÊ„\Ùv,’\Ö7g#NF\Ñ^Q¤)c…J&Š4S‰ó”¦\Ã\Âw< \Écø{6õ\ï@†\ãalbY¦(\0[©†i­\á\ìg\Øtƒ-‹IÁ>°;ZÇ¤©‰\ÔÌ©Z„„›)w\'—u\Æ\ãxKSr\Ú|\Â/^¦\ÊÁT\ï;Ÿ‡O¨#\ë3%7	jÁ¾/6;\Êd\í\ÆOø”+ør©c%$´±p©‹VPÛ„°&\ï¬N•|F,\Ù\â\Z¥­gúH)8^¶VN\ÙHJ\Ş·‘g·¦±Ú—õfÿ\0	\Î\ê\Æ|\á\ê\ÒPP°¢\Ú)µ{\ÅôzG†W\ç\î€\ÚÇœ\Å:\êõ…MX–&L3ŠFm›± j\É‡”T2\î,~SPU«œ@˜„õ¨¢®ö\ÆÀù¢ˆ\Â*©À”°jiªR¥£(\Ê\n‚G2ÀØ¾Œ\ík´Í¥a\Ã\"y›¼h¨™PG\Õ\æ¥3RAÊ¥;‚\ÊOR\ÃQ\ß\áñ=?ˆ%Zªœøû\Åó…\ÍZ\Âe\Ê&e’@ƒ‘®¯ûab¶6\ÇÅµª\îv\ãóğGœ…\Å,²V V¦* \r`‘m._œZ\ê?\ã\Ëş~w˜šwşQÀ\éüÃ‰”„\İ F\Ğ\r•Õ–N¦&Y›ƒ-}\\wÕ¡Ô¥Mz\ã\ß)¼‡\âgœEƒ”T\0…-S\ß!\ß p\Ì\Ûf\Û\Êµ|.ó3\Ñi5!\è\Ë\0\0\ã\ãø#ü¢U/¼µúZ­…•a†1öu†\×\â~xúKÀ>¥Z¬£\ì\æ\Ñ<ƒú}\rü”#CNÅ“\r\Ô@\Ør;\Åe©\'x0È€\Äõ\0\Å\çMÂ§ƒ\n\Í\êTÜ²\Î1–­½1\Z\n²_‡L\ç?\Ú\ßş¢½q™+Z“ˆ«2RJ&P7:·N‘!™¹X\Í\Z-Am\é\Æ:‘\Ã\Æ0Ü¡\n¦L²[¾©iR_K—*FÉ\Ãz\Í\Ó\ë?qlû„\ë8{œ\Å˜&\ï)MğøB–\Üõ\æø\ÊW©\ÕWœ\ç\ç.\á”tTƒº¹I:§1ó*1$3y#\á¿Se§\Îˆq™K”¡.d¥/•NN\Í`\ß½U3X®?;Á­ÈªÀq9\à\Z	s•l\á#¼¶»µ\È\Îû{@\Ñk-{sğÉƒ³pú\êw,H\ÑW—H=¨¼\Èl“+V\ÖK»“k»÷\Òv®±\Âòc\Ò\ç¤T¨ª˜µ+³št|„y¸ö®¡»ƒõš>V¾q÷—°ü2b\ÔJ™\ÔK\è2Ÿœ ÷«{|\Ä|!eHRA%\Ønùô`\Ğ;CR0\ãø”•?\â\âL*¦`T¤®Ye2H»_[³\í÷Œ\Óe8\Üß¸}OO\nU.\ê	[*”Ä±\è\ìx\'\ë)CˆV¸8Œ¸-%hOtºe ’	\ĞfQ\Ô\rZ.¤\Ør¢\ÍHµ~³D¢¢`÷Ji³)\ßw1\'\éfy²\åKI\Îú¶ö`#?Sb5„\ßs,Uöc´1Ãœ8µ\É&¥9\\÷Pua¡W#»m\ç¯Ù»†_#\İ9Š¡\Âó-Q\á‹™|÷“\ÂU\é-6…Á\Ûş!X \\÷Œè–„Œ¡€\èEj£hE2O3É‰A@\"*õ£.\ÖA9‘’\É\Ç\áS\n\ÚO=`|[§PZ\Ö\Ì\å$?¶ıa]4V\ròø\Õ7Û¢-\ÖPKD¦Rs\"\×)b\ÙZ¸„\ÎR¼s\îVY\ì\ëƒşe:Yò¥Ì”œ¨@bEÊ¬şlş\í¨±9n‘¦©ğ¹\'\í=\Ä!9VXX:H$±}\Å÷o”]¼Ç¤\åÒ“•†x:¬)k »\èÀ{³ó`#Kš\ï\0wüúEµ\é…\0ˆo]›\ïÀ|\á{ùB÷\'ü\Äh\æv)\Â–ŸñŠÙ¦Ö¥G\Ævı\Ìs;›9(jX©`Ş°ÀÚ¿ò3\êB«1Ú£˜µWT3ª¡ ²ƒ¤¶Ášü\ÈyFUÏ¹ËœŒò?\ÄÔ®³´R{uüõ\Îˆ\çKô‹\éõŒrDn£a\ÄDúiÃ„\ÚTM\Z\ÊXsı+îŸOh\Ğ\Ó\Ü<Lzˆ-›†&\'õbƒ\Z;\Çx#§2yT\äq\ÛÄ‘§3ôocPJ–œ„\0”„¹{’Io!\é\Ö0·j09üúB„R\â&Z\'™a#*ó;û8ğE\ŞF[¬\×\Óhª\Şz™ö5ƒ¦¢Om)Š\Û0#E^z\ß\Ò£p‘F¥©\rúh†W\Ë÷úGbkdôŠu\0¥2M”[g[vEZ/ª¤\İQPyš5\Ó\ÍHWnµuN@=¥%l\èg–zJ0ƒ\ë¸-EMO=*c¢ô;\éõ\Ú+œ1Q\Ì\áRãœˆ>«„\êewÈ”2¹*\n ¡DZ*n\Ç\r™É§\Üp¦¡\ã:‰J(	{3¼<\Â\Í\ß\Í\ÇH/\é\Ôù±\Ï\Şê¶’7Œ‰õF)6a\ï\ÎX\'PXô`\ÑE\Ó\Ö9ni-¦\Å\Ík\Ó\ê%¼#\ìˆ9\Ó1\"\ÙBòz\è\Ç\Ö)f™[q©¤ºğ9øM#\Ä$\ÌJV‚4¸;[(5N•‘\îúÿ\0¹ç®¦\Ä8a\n\çI6\Şwnõ\íƒ‰\rL\Õ%²\Ë\ÌIm@a¹?nÁ\É05}f\Ò\Â{Pl	,O¥\ã$\"]f\Úú£øÿ\01Åº\Ê\Ó¤=*‰HA.\Ê;€;¯\Èñ\è¨\Òø5\àb-f\ã*©I’s¤,ø–n£\ëË a\Ò¨»Á!”d÷–D\ßÁ×ƒ72’\ÊI-\İ~šˆ\Î\Z–6x„ˆ\á\Óù0–»ˆ\ÎK/haõ\Ö2\àuƒ¯J7s8Ã±\Å\î\ãGıõx^Eµe\í¥e\Å\â«g{´9ú\Æ\Ä\0¨@õ¸ô\ĞQ-2\ÖnA\07ZË€\Æ5^™,\Ü\rAMsx\rº›S\ĞF?\åA.A\Ú.÷\Ø3\Ò\éÁlLÿ\0\â	“™%EŸNGG«h\ä\æk\×UuŸ(\æM>A)Q)VR6\ï\r\Û\Ş¶ó8X	\É\ë+Ë“=}\ç+{;¿K_[A¨\à\ÉT8M„R)\ĞfMd©[?Ï©Wz\×gˆ~SZ\Ş9\n¯[\ÅHJ•9D¨¥]\Ôg\'—Hª—{|C×·¤*hX¨Nƒ¹œ\Òq¿\Öd\ÙAv?\Ö	¨{{\\ñ!½*óƒ˜·‹J©Œ¹®‘p’«=<¢*±vcB¦¬ac\å\ÖTª\Æf,$(’ \ØY´\æ\Ñ0ê•¡%{\Â2¸®`\0$\åò€\r6:›\ék\'\'™[\â32t¹Œ\ËAıMİ·÷4O¦)`+\ë¶„U\İ3qs8fJ”ET\Í\0ãš‰@K$MNoş\ÅÀ0`\ÉÜ¹~^I:m¯ŸÓ¥­\è`yó”T©Š%(»s\'}70!‚oV\Ãh_H\ÓÀµ¥¨Q\ÊK(76%M\è\æ\n·¬\ÉöVe+\ÔÀ¨f\Ô‘$¨f%Ò–H¶…Dh0Q“4Z\Ú\ë\á\Ûù„Á•aòY@*ú²TOúš\ã!q\éñ6ö_Ú™ù\Í»\r\ËM’Sš·1\Ö*\Úe•\äõ3%o\İn\ç\ïªğ\ÊÀœ\ÉZ\Ò\Â\Ì\Ï| z\Ş$2\Ë#Á\êfÄ½ŠQW®‘H²\åP)7P¯iùE\ÍX`Ã¤-”%Àƒ\Ö!ªŒ¯º’\ì7‚‡\Û\ÌÕ½a/OeI”¥&\èku³\\¼.¹\Î\'Ÿ\Ñ\ØQ\×\0\äGH©JUõt\Ú‹\Ùöòˆ€\ÛX\Íş-$\çŠ–[+³\0$È°}­oH`³¡‰1\È\Üy„¤Ó©$5ù\ÛOŒUp~u\"U\Äf©2•\İñ›©K…˜s‘\Ú ¬02¦\r=eaYP\ÑZú`zCº7Jl\ç\ÒV\í\Ì90^(\á„h¾¹vñ\0µE\ìNµlX´c\Û{±Ò‹e\Z:^\É/Ú™ŠY%ˆ·k|\â\×h#¯¤½]±Œ\"ªb\ÖR¤°}¢¥»\æ2\Õ\"®A„“+(HK%\"Í¥¹\àò\Æ\"\\s;G;\rLq 4œ8•@•#´¨Ê¼Sm`\Ö{%!¡\åmÀ•%•¸‘fG\Ò\n52‚NSn\ÑV\ÌOô\ì	\ÑÏœMº*[<úHKP¶!\Ê\é‰\\²£§\Æ3R¶\r­Š·’x^ZNe(¶\ã¯(p»\â[õ\ìx™}2’<)v\Ğ\n\ËAI\êb\ïñJi”%KeL~ñ\Z#ó=!\İ>ˆ¿˜ôşğM¨T#<ÿ\0[2®b»\êPHÌ§My\ß\Ú\'QP¥sˆ\åZº\Ï\n$Ø¦°QªÅ¥\Êü	k„\é^aY²S{şq\Z†\ÏTøM£¼ƒ‰¸…*šP‹¤Ai\Óqº¦\r§¯ö‚\'Õ—	øÁ…y8\Ì3\ÚUrœm`øW?ˆƒ~}LEµx\Æ%iõK_ˆ¸Õ¹yAô‚kú\È\nuıùE\å<™0\Ë\Ìú‰’J_¤}\Â89e`“’÷\Ôz\Ík÷ya…\É^Xs4|#—*_fRŸ\ê\0¿›\ÇWV\ÂMûÄ­½¬m\ÂYŸA!(\ÊBP‚n\0\ÍÑ„M\â¥\\3`}Ìª3–\È\ä\Ë\Ôô©\ÊRF€[\á]:8~}`\ÚÃO0n,T™)9lV –\nRE‚Fš¨û$\ÇZŠ\Õ\0IV=\á,>RŠj\0[“m$€ıHe+£wX\"y\âM>•)\":\ÕV\\0œ¤ƒ‘(OFYkì²©@nlıaDuD\"¾ay\'™›\Ê\áJ…\ÖZe¤\êR¢FU3–$39ô\Ò¹9\ã\×\İ6†º¦¬%¹\Ì+#„§´›2Yd\İ\Èø¼ºE5¯\"b\Ø›Ë™r—œ©E2P•eKX\ë\ÑÈŒğŒ\Ş}¹\ãz[\ë_\ês°\\1HK*b”y›ücCE¥$\ï\'\İüÀ\êoV<.,©L5fL¦`Ú©€ ¨\ê\Ö}aµ¹\ë÷†PI\Ä_šX¹\ßhÈ³$\ä÷¯=$\éQ\"\Ğ\Êgn X±\ÆTóV†–K¸İ·[v\åK*Ù–\é\Z¨eH}eŒ+IHJ¬­<\áwR!nÓr%šª\Ä$\è\Şq\\g ƒJ]„‰\ãCA®’y2\ÃD\Ä\æ\Z ’)6h4‚‰Ÿ}\'bYTŠD\êFe\Ì\İ ùóu·\ì\êp»\ÌVûs\ÄOÁ)6|©iÔ¨{Ÿ€0õ­µ	1ta6\êJd€™aŠƒ\×Mı\Æ1öœ\äGš\ÂrÒµq3j¥\Ñ\Ëœ½¤\Ò4BA\ÜóQ·¹†«£w0^&Ñ“\Ô\Éx\×—ALJ[µPÊÔ|†¾_	w?„\Z±ıÇ¤\ÂfM$•(¹%\É;Ã€\00 ‹rf«\Âô²\è\è‚×”L˜œ\ë\'P\rÀ\'`\ã\Î1µd\Ûf\Â?B=\İ\åô±=š3\nBˆ\Ù\0\è	\çw…Z¢¼\ÆüQ\Ôt¸ª¼S\Ë\ì@;ó$İ¿\í\ri©,\Ùig!ùDTLss\ZDqF\É\æ¦[†\Öa‰¥[dbVÄ¨Ï‰>°J¬\ìbúš\îX0\Ï\åqyöR~ñıôÌ„÷“!\Ô\ÇfNÏŒ\Ùhq\Ş\ÑaS\É{©Ç¨¹óÎ®[9ü÷@¥\Êi^cµ*Ğ¤‚‚;‹¿¬hÖªW\Ëõ\ïIšD®bT°\n’4\ØzEF™^Ì·\'Ó´ µ•0:Hx‡‰%Q¥ÁR–ùR–\ÛRN\Â\àha§³\Ã\Ä&—Fú’ppSkq\á:¦]@”\Óeƒ”9S½À#½\Ò,Û‰õš£\ÙH\Ì\ß\ãù†¨¸ı@´\é.Ÿ\æ—b?È­|Áheu$0³\Ù\0Œ\Ö\ß#ü\â6Pc§\0©k\nIü¼\ÆŞ±oÕ¡m³*\Í5•œ0Á‚fñu*&©!*!\ÙS\Å/\î\äu€£\Ó[‹×¿ş\áÿ\0Ik(\'\é W\ÓO–¬\éI\î—\Z\Çt¸õŠ½»¸9I\ÒX ƒ9¡¤T\Ô5:%Ê’T\ä\'6\ÔşP¨®\ëÁ\Ú8ô\Ï÷;W†b´µ’\Ê.bQ-\n2©@¤\ê¥3¹³¶^}\àö:\×mi\Ïúü2ƒi<Fú2$†¸\Ú^úF™krIœLœ…ú\ÔRÀ\äğ%¶0ñ5¤ªÜ¡KŠ9\Ü!“ b\"c|J”\Ï\å¤,…¨\ì.\ÙGõu\Ğ{*º|ùŒÔ§LMyc‰.#Ä…S*X•}¢ @y\0o\Î,¨JÈ¯H\nonı *laI*¦%Ô¥e@~Wôğ‹š!\Î\ë\È‚2aı¤”NRX°%\Ï;À^¤tŠ=\ÅX 2\İl‰HPVH$:ˆa¾ñWÓ°>^’•\Ş\ÈÉ¸L¢C5/„P\Òã¡–]S‰CŒx\0C\Ópl\ê#ø˜sM¢¯\Î(öÉ˜¥D\Õ-JZ\ÉR”I*:’u&6@\0`E3Qú5\áEJ–j\æTÄ´´\Ä\'\\\ÇÍ‡ \áMIf\àvüûK×°\Ú\"w˜«¨ü‡”	WŒ°ù>\é\å5(§\í¦3f+4ÉŠøz$XÌ˜£\Ú\ë\åOœŒ93\ãŒuUu*QS¡”u\0\ë\æaú…\Ëu=e-?õ\r‡Ò™“€’¢HSªº§NfÀ”U\Ì\Û0\ÎVyJªX2\Ğ\Ón¹š„‚n\Î_º4 \n™fŒYqaµcŠ)\ä *hBFk’w\ë\Ö*\rX6\ãÎ^såŸø\Ã\íj¦ ¤…©ˆ\ÑÉ»|½ ´&\'©Œ\İ`$(\è&d]„\ê\ØÂ”“F\àB\î¦h\Ô\ã¼1)	VĞ±$G‹Qd.4\Ğô‡)³pÁ™ºªv\Ë\ÒT–¾pR ½d\á·8K;‰¥\Ìá™´\Ëq1\'¿\åV\ê;Xs8\ÕU£*úK\Øf&¹\nÕœ\ê)W\à~q\îeŠ3ö\æ3Q\ã‚c©	9†£oH/\ê\Ù[ s8WÙ¢\'Õ­u(*:J\Z­\Û\Î,6\Æoû-\Òq\ëüATI$\0”¹\"\ä†\ç¾ñlG‡s/!w!û¡6\ÛBKúücˆ\Ì\0|a\á¤S{$\æY,P\írt\Ï\ï¶ NCXC×¼ñ\é\ë;¯\à©É˜¹”\êD\Ä*ê”¢\ÆüŸ(¸«pÀ9\ÄMuŠ@}`³MIuKZ/\Ş\n\Zôqb-}\Ëû„g\ÇR01\Û¢‰ K\Ê	\ÆM‰6,\Û\rˆù\\´#\çr÷™w¸f‡\é\å)R\Êg„(—\n\0¤3¸q˜±\ë\å‘b¸”ºi`—k%)H$›X\0:¥÷\n”9T±‘Š‰jNl ^f­h´n\Ú9\ëş\á<\ãŒ\Å\Î%¯\ì)\æNnö_³Tr¤Ÿ\'|¼„I¬w¡<Kıfa\Ëi¢®%ƒ0»Üó+)K\é6\ìf\ß^?Ÿ´h\á\Î\r4*l\ä…YJrä¶¡Ãw1&›ò£\\Šv¯ú’\â|:uB%¥]<´^\Ú\Ü&÷U‡–§­ª\Ó\Ø\'¬\0\Ö*×œ\ä˜\ÕU!?W \à#\æ\Z*Pø}8ü\æ&¬w\ç¼\Íq!S*t\É\ê–Dù¿cF’\ÅIOŞ˜(	\Üî£´3Z\íUº™g9\Î%ş—QW=K\nRh\å„Ü²Ë‹ÿ\0RˆI\Ó4I m\ç\ç*\Ö\à\Å;«UE|\Ör¡*X\Ë\'ºÀn\ê\Ì}`Õ‘¶\r”\ÇO£¿£c˜TV$wOvK‚\Äo0rdûò‰wCN&†+e.j¤¦bJ’vbÇ£‡{@\×8\Ì\îd\æC†@añÛ¸`t“œuN\Âş\ÉI\"\ÄE\0!r¾[3ó6„ÎŸ0J•-K™¡H\rc˜›$\r\Éh>eŠ÷›OğŒšö“kPE\Ô<(\è‡ÿ\0v§ ´+n¤/l\ÎO%^f¤2y~q•}\æÎ½#•U´dE¤n!.Z$ƒ”)\Ã€5Î —†´Šl\áº/I$*\rÃ©ü3,\ì£Ot\\W\'§’\çH£6#W¸\â‘% \Ñ\ê\ë\Ä+\"nV»\Ş\Ğ£ƒ.N&¤‚\çV(r$²†\\‘:¢ABŠH\Ò4Õƒ\0D\Æt(\ÅLš^Ÿ¿\Â&XgóıMg£­œ¬ªpK\0Ö¹mN\Ì\0\çÁ°9ŒRô \Ü%\nŸ”L!9½«\ëÍ¹x2–Áb8„\ZÊ³Œó¸{)—”ªÿ\0\Ê÷\ç½\Ş²¡kp~QmE\Şló‰üqLEBI²7[wó‚i8R§¨3[@s_°]nP£=İŸ}G®\ÇXj6\Õ\ç˜^.lÀŠybb€`ùˆ–áŠ‰ğ€F\ŞV\Ú8¶+aT]Öœ—>\ïY¨\à¸8—)!®n¢,T£©1tÓ›3d{ºO7~ »“ôøAø\ÇË¥QBe­k\åpŸ}ı!aezr\ËW^ù<Fh\Ñ> nb\0û\ÂX%yŒË–Py>—PnX:w\ìbÚšE-…lË•`}˜I<\é¹\ì\Æ)\0\â	\ç\Ï!¤Ÿ4\Úb¨€\Ñn¡›m©\ë/b\Ö9C.N¦\nK6ø\ÃÍ§G]­È€A\Ìæš–ZP9‡‰¹‚\Õ]Uª\0œ\Ì\Ìr`6\á\å\Õ\ÉJ%)))XWy\Ø\ÙC`yòŠ]Y~‘­¥hrXvp¿\"™.¶™4±*n\èmA½\ßWö-NO\'\í-ªÖµÇc—Sv\0¢\'õx}›s\ï\íğøÌ’l¢°\ÇCòÃ™N“\ÃJƒƒ\å\\8˜=T@’&KJÂƒi¶\â\äş‡r¾\Z°G¨ÿ\0p pg\"t©iQ$!	r„²@\è w{T+l\Ø}ù—]9#9‘\á\ØE4µg—O-*o\âdHWú™\â\Ôj¸À.:Êº\æE2TO-½´†%ƒ \ä}¾d‘x\ÖL\ä\É	¦@IÜ¤\0¦k„‘\áô…õ\ä(O/¯\çH\æ‡\Âß›?\Ô\Î*ñY³\Ü\Ì[).r\Ì\ÅO\×XEÏ¬\Ø¨|±‡†ø˜¢`‘:a)[dU$\Z\Î\Â\æ\Ïf\ØD\\\\§F\"·é•†õ÷÷ş}\ãŒ\Ê\Ùr¼Z¨¹,ù¶°*½¤\é\å|´DiZ\ÎVu‰LGbHPI\"\Î	øÁ.Ô‹jN	\í:š‰‚33ù•\Ó¾ê’²n\áùò;\ën¾ÀW\'\"o=l¹ ˆng\0¢¥SÂ„Ó¸7\ÏQ¥u	ûzL{õ)¿\ÈŒ8 \Ñ\åV|ò\Ôrƒ¡‰¸ò\ZÃ«kƒ/NË²š\0\×~zşQ\Ía\Ìq4\ë¶§¢%¿(X#\0b_“‡,\Ùm¼Ø½$oÄ³\"Z‘u$\å\è\äû6|¹\Åƒ\Ğ\È-˜·\Ä\Ô\Ã6tßŸ\àğö•\Î6˜¶ª°@x&\\\Â”G©‡D\Ï\Ğ\Ô8²U)3*$­\Ë!F\ì\ä\Èb\×g\Ô\ÂÏ©§«õD¦\Æıƒ3Š\ì^QC%ißŒfß¯\Ş6  Fj\ÒX$@xV3–j³\Ï÷”[¨`që¹½ûF\ìdÇ®\Ò\å>ŸŸÄŸˆp‘Y0KS)\Èv³ùXûE«6;\ï\ç\åˆ\r.­tÀ‚ K†©©²‰õ)\nQ°/ Õ€¿©ax3x\ÙÂ€}q\Õ-\ĞbÃ¸†U (\å»,\0\ïwr ök\ÅP\Ú:_YKto¨;_ş¥\ÙH(×²˜R\ì\à¥\ß\Ê\Ã\ãKl^¼ˆ6ö;öù\ÂR8¾b’“™$\éšYó¹¬Å©X}¢\Ï\ì\İJ)#\àaIó\î\n@ ‹-ğŒı]„\\\n.}Oø‹\"qÉL®J5`Y\Ï\æL4Ú„ `€õÄ ¬¹\âwEŠI˜Y3£\ÊV®§;s\ÏÀ‰\Öi\í¯–Yqs—$€¤–†7…<Á\'¤€W\Ë7J\Ò|ˆ1+¨¬ó¸K\Zœuq\"yr÷½\éÀ\ÜúNe\â\\Ÿ/2X(§¨okƒh5ƒ\"HR%\ÉK\0”§\r»¥\ÎË€\\ñ\ÖS¨\â))²HR¹;_‘x{F¼e~\ĞË¥s\É\àHQZŠ¤™eJ—0d-•mPb\ÑZõ#Q\å\èG\ç^“W=A\ï.¢Y{\æÑı\Î.	ß–S<q+«‘/,·+-¹*>¤\Ş·[¦@07có¼ºQcô—MRl\à\0yÁN©7.õƒğ\Ïii\ÖøCˆ/–\ç<\Ê5\Ò\ÉJvmµ¼\'p³\r¼¸\í\Ö1‘³8\Åp‰k\Í*VbX\Ä;\ßKhKz‡\Êô›	c€ñÌ¡„púW2z„ w”‚\Éü ¹,8\é-~¡@O1\ÚEu8df\Í\Û\Ö3\\\"“Ÿ|WÃ¹†üAx\×¥.”²ˆ\äÿ\0“7¬£ku\é\Ó{<·-\ÄÂƒ·¬J‚H)Ìµ—³›\0©†\\pª;˜Ş¸ø:r¤õ\àM>j”\0\"%\Õ\Ì\0	™\ß\Ò|ÂµJ–<,¥\ÏAùû\Å,p[\"k{5\Ö\'\áé°¶OwO_\Ä@\Z\ìfÚ¼K²\éH`Yü\Ç\ÈÀ‹ç¤‚\ÂJ²}‹û7t‹yŒ¼ …œ¦\Ö\ç\íox¤	\ÉkŠ\é\å¬\Ì\ëbÁ\ìşğŞ™Êc\n¬Õ•h…‹\Ä!·A3\í6\Ú\r+\"mJ»E\ì\å\\ô\Ô\ÆEa@9\ïõ2\ÖjJµõùÂ¿\áòt%ŸòøE\rõµGùñn\ê\\ıd\ÉÂ¥’e\ä\rr—OûMQ>\İÎ¸	SmŒq»3¼:šJOÙ›¶\å\Éó&\ç\Í\âjJ-l«}ÿ\0Ä£–E\î9\Ã\æ\Ì\0¡)(QgR[o–\Ïı+%…û~uš^Î¶¥>n½¢E5v, C€\å;\ë¥\Ï \r\à˜š\ïaü\æ_)\å§b²›±!ü\'£7¼[\0A«\Ú\çİ™GüAJ»m\Èm=w\×\ã1Ÿ,v\à|AkT\Éa@\ÉH;—$v\ê<¢\Õ8\\ñ\ÖbûN´UVÇ˜\Âø\ÅK*lÜ©:$j}±m\Ø\äsó1:õkPÀÁT\ÆL……K\nSl¼©\ÓFcóRT09\'\áü\Ê]¯kF\Ò $SU0¨³³ .\Ã\ÓGw¿”6u\ÎZ= \Öi©Lƒ\ëˆ94s\Û(–¤‡w\Ì÷ıù\Å|E~›©lüŒf\ÃqUÊ””©Ê’\ì\å:;\0nú6\ÛA£hÀ˜·\ÛK\ØJô2ù\âÙ i\Ô\ÜÂ’~‚ş½±ˆ5¦†?¿d…rªi:V|÷H}EØ·#\Ù^õ\Ù\Ô–#(‚‹\Â>1\Ö-ax=I“™c*$;CÜ‘oBL©%|@8Û«¬>“,Éº“.Tô•KS‚;‹¸}\\\è\Ä| l¡FGñ(,—^£§Qş#õ,\Ò3\Í`Se¹\è:\ë\rU«ÿ\0„»v8øÌ‹«\nø^‘nw\É@\\Å‡U\Ù	g~¼›œgT›Ü½ƒ®qñõùG4Õ½\çjğS\î‹|W6hsc\Óó/h¿\é9s™·V…§\Ş2p·\ZKBH˜,Ü§³zi¦Î‘¿Oyf\êı—al\×\Ò\\ŸÇ’\n»¤”ò!¾qku—Ê/¡ƒ_eZ=`Š<mU€J”rıõ\ç\ÈyB®›œ9\êOAúO\n‚]¾\Òpr‚@N~qmM‹\á\ìFÀ½~31\ÎL\Ê1\ÉSf-JQ		%’Oû[\ãx\í0\'¥©–µ`t9Ü4sg\ëa¬\Í#\è\ß\r\É,\Íbó°|at,÷aG¯Y‡\í{·>\ÏH\çY0$<j\ÚB¬\ÃQ“2ş)™\ÛV.” }	¹\ÍŒ@\Ë\æo\è†\Êrg*\"P½\áp\Ã¿‰jot-\ĞyşBÃœJ2óÌ°‰œ€\'—/”Wdz\ÉB7/\Ì>ñ\Ğd\ä\ÊUt2\Ö‚\Ç[Ÿ\áW*r!V\ÆÁg	Š\êw\ë^…L­•–l®14©\åAi9`ni«\ÆK\å3T±M\Í\nıG\ê\ëJ„Ò‰)r ¢U™\ÚÎ«€œK…C‡\êq\ĞJ®\ëK(\ãJl\Ù>Ğ§B¼\Ş^~­\Zu\êP\0¸?o\í.\Ú@\ÜqŸLó •Å´k˜´\é.ÁK\ÂE­rCõ(\â’	\Ï\ç\ÒI\ÑÜ 1”h1iŸY]<Ñ«ªR¹¥Ÿ{;†-¤±Š…h\Õ\ÚtğEÕŸqø\Å\î/\ÃL…‰Ò‰BV\à $6	õ=b]vö‚\árnHŠò€&\ì4Û—”™«´øv‚œwªs,÷P \'g	ĞuÑ¡VÔª·BD\Ë\Õ[q\âœ`u=cÄº	2¯!	@P»“s~pÚ•r:0-º\Æ\â\ÂN\"\åLÅ®`\å-K\Éoºû|c-÷3c¼\Z(v9\ã\ÂxA\n\ÊL\Õw˜Ÿo\Æ«\Ù\Ş^[“+¼\ÒÃ³©\É(ï§Ÿü\Â\×\ém¬ó\Ó\ÖMvt\â\0\ÄW9\ÎbZÀ\æs\ä\0c\ï´ğ	1\ÔÑ†\æ—.¦r»’”zş\Ä0+E\ëú*kı\í÷†0\Ì*±+9J@V\ï\äHX[Q\á\0\æ\n\êô\Û|¿ŸX×‚\×öER\ÔÌ¯·‹B=zÅ´·²©__\ï2ñ–\Û\é%­I\ìˆrK\0A~C_Xu²µ\à’{{„:c|LF¹s¥«¸rº’Ts\à’\äg>GnnŞ³Cr=aaˆ®d¹‰Rµ¤¤‡\Ò²ˆ7ó…-­Pü{~}¢šŠÀi\ÌòFŠ„¨\0lÙŸ÷h¥f\Í\Ç§hõF£˜­‹á‹¼¦ş–†«´0’›V\ÕÈ”€W&‚\î\Ã\ã	aø\\\å©)–ƒ}Îƒ©·”	­Nñkõ\Ö9\æj<?„	)/©-ry¼[KY\ÉgôwU¨kHŸ.±9˜’~^ñ˜lÁ\É\ÉBq‘q=$µ—	 ¸½½‡\å[v6Tuin)\İ\"^@¢u’\Ö;\ÚRHÉ›ô\È\Zk7ŒÊ™)95`şgñŠÑ©J|¤sı\ç–\ÖilGóHxŸ	§˜½\Ò\rº=\ÌYµBõ\Ø:\çğ\ÊQIñ\0™¶…€¢°§Wxß‰WÛi¸xÀ\ÊÁYÌO=?ûx§Á–S·†’I’·û\É\ë ış‘F\"s2\â§\Ù\Üù_ˆ«û¥\Å!,¯\ß3\Ì\0-\Òpe…$;{Dg\Ù Î¿Ã³\Ü1\Ú\à\ÅĞ¶8Ìo7‰c/u!\'kF\éRk\Ê(f>y\äÁuXpZ_x\æ¿\ÃA\';¬<w\Ìao ax1\Ì L#!(ñ0v\Ş\áÿ\0oÁÎƒÓ´b‹Šş\î¦X\á\ZB^b’•9\Ù\Ûm‰½\Ä7§§x\İ\ÔA\êu- \â3MÃ¥­R\ÖR3K|¤lá¤:¨¹;E\çU+Y[Á“>R¥–¡!\Øóh®¡7/ºmI¦À\â-S}%û{¸\Õ\0n\rÁ#§»\é\nxC¡i¥o¶Ô…\\{\ã!\á\ÉFgh+\ÏóŠg¨l«„@kl	°ô’\â2\Âµ\í¥ÿ\0w‹X¢’‹ñ‹nİ“\ÔÓ”LgÕ¶:|`:ªZ·§±ƒÈ¥b\è£@–:€\å\É=\æ	¹rC\Üó‹S}ª6“ˆ\Í:G¿•\é\ëù\ÖAÿ\0\Íf*\É\ìC»9\'\â\ÖûCSn1\Ä\Ğ\ÊQû‰\ĞñXS}bR2Ÿ¼_K üÁôŠ‹Cù|§Y\ì\â?¤\Ç>‡ùÿ\0P¬©\Ò\Û<¶HU\È\09óŒûr\äl{»\Ä[#\Ê\ã™[\Ä\\X\å¶ş°®kH\ÇûÀ\î\n\"\\Éªš…KC„(+Í¯åµ„_NÊ­×™J”»ó\Ò9Ï¤\\\Ä2\È÷\İ;¿Ñ¬\çxÚ£\ë\Çxe`§&WŸ‡-ûU))˜\ÅÜ‚@¥oHV\ïµ\Ş:ı~µº³m= üC¢D£-KÌ¶b%÷\Û\×\Â<3e8qæŒ§³ï±²£\Ë\ï\ãı\Äy¸ˆ\n=’”·È˜¤‘\æ\í\ì›×•3ºlFr»¹;A«\íkEïˆ¹¯YWr%¡\ÌGw³	óG\ç\á¼@?\êO$™8â‰¨ÙŸV\å«é ‹¸õ\ï<WLY+B|\Ô\ã\"\Î\ä\ÎZ¬=\È\æ\âs–ô\Ğ@\Ù ª\í§t7\Æy\áŒ:h\î?õ€fªbŸQóòƒ(A§\Ùv–øl:’d\å	h\Åÿ\0R}b\ÕLô*µ\éjôMÀ0M+¼]D•)´s°\è!Kô\Ö9ñ`zO?ª\ÖŸM\âüUFo\ÕÇ…Â•\å«7ı#´t€¾!øGtÕŒL£*@b\Ä`À<\ÃoŸ¤—%\Üh4ˆ\àô–\"u2QQ)\Û\ïXi\Õı¢cƒ+¢\\•,\Ë,\ÅD‡pJŸ]/oVŠ$ô€g\İ\Ì)M+2]NAÀù`	b$³¥„%Â™¹\Ü4T`™PKIÿ\0uEº\à\Ì:Jœw\Ş>b\Ñ\Ú-%/±\Øu}+\ÚA{:v=¢¢+mS™*ªÓ¼;\â£`BœÊ’\æ¢_‡-Ü—\İõ\ÚR¥<)ø\æ†~²\ê1€ÀHh\\€`#Y\Ìõx”´ZÒ€Nª-Xƒz(\æYhw8Q˜/ˆª*)\ì«\r§K´ej¯wl`\íşq\Í\"P¤›zúHp‘6J3NVs\æö\å\Ô\Âh<6ñq\åşòÚ–®\Æ\ÛXÄŠb+g“0T‰(û²Ğ‘§õL —>Ñ¬\ËSz3ù\ÖP6¿.\Í\Ç\Ôÿ\0¾7>h– f‘ÿ\0\Ø$\rH!ÀvĞ±\ÓM\áW,\Ãq\Ü~cüÁŠ•\Û\Ë\Ä)…T\ç”3\ì3úCšk•Ô¡²¢‡CŠ09İ©›-¦¢\Ç.\é\"\×MºZ!¨\ÙûzM½®¡X­¼¦/L\\\Ùy”´ÿ\0\Ì._\ãš`£`$¥«H ¥Ö·lšºnO«7\å¼U†AÁ\æõr§œ_|\Ñğ\êb¤…,‚bo¦\ZôÛ²\Öğ>\æyk\0\æW©ÃN§\Ô\é\Ò´\"±Áüôe“\Ò\ËZCK\Í\éK\Ü?¤\ÊW\ïñÉ’”\ÅYˆ\Õ±ô-ù\ÃUk.Fóúƒ\'a\Æb\ß\ã_\\=†R”TñIğØ»»\é\r«µ¯¼Ÿ€šú\Z”.ş¾ø%8$°ú\Éb\Âú–½·¸ı´[hš\ÃRı„ñXNBR[+wœ°\Ø\rô\Ş\'f\'\rNşDŸ®D©‹Rº–Ğ›œ£\Ë^V¸…u9 \ë™K\é6(\rù\Ö_U:§€³,LI7)\ë¢Áö„ÏpH>°J\Î\Ì\ã\æ´¥ŒğyÌ“-$ƒ÷LS©\é&­J2ó©<2B\n›©˜	şmCøC-n\'x\é» ôü\é-\â9i¤‰IX*k¸{_a¦P\'q—Ó¯fò8„83…3e¨rnE‡\'}ôƒTs`~\Ñ÷€ö—´1š«úÇ¹THG… ‚4\ÓO]C s0\Z\×~¦\â<E2e-j6H&Õ±Û°u0\ÚzË°.\Â\éLÒ¹\êW~b‰ €rL[@\Â±öa\0\àM\ß*R‰G\Æ\0k	½¬z|`\r`\í8¸I6‰K¸Hn`»\ïÍ¶\Ö 8\åE{Î©\ÔÁ/°\Ê_\Ö9€\êL†9<‰`LX½‰İ¿XS\Ò|R¢s:“\Ì[ñÓ¢21‰\Üt\È\0\'.{\\\Üúù\ÅI\ç2®q(Lœ”(¤-\Øût†–\Ä/\î\"8c|E$%r\å\Í	> ’¬»`A³Æ¦£Vğ\Óğ{§œ“ñ&R”{4„ Y){‘²‰#^‚\Âö\àzMZl\Òó¿=\Î7\Z˜uQ»™½\Ùc”\\\"ú\Ç\Ğiˆò°?<q!Uz÷¨Uô	–\ÆÁõR­ñ‹\ìN\Æ0•¡\åT}sı y¸‚\Ôà¨v$Ÿ‰ı#¶\ÇµS\Äpú;9\×,9—b\ÇD—\Û\ÎfòB§~³3Ú©X\Ïî…¸¢\\Õ”¥‹‹\è2v±;\ìóv™úk¥\ÜD\ë\ÃgŠp•)J#dòó\Ş\n¨\Î2Ç¤—º¦³ &Â°Å¡\İ*Ju_‘¼VJ“´ğ”º\åc\×&\\\Æ\å,S©iK¬C–İ·1 9«Ì£>¾\è*v›@\'‰ŸŒ~¢J™ó¤1\ïX\è\åˆ\Ö\ï´Y9S7EU‹œ`\Ã±õ÷¥>»¨\ê:\ïñl\ÄT\è@<6$²¸²T»	33\Ø%	=_x°µ‡P \ß\Ù\Ö7;†=rc\':]l\ít½\Òû±Jv\ÚˆF}=>3&\ß)\Âı}aQ §)HôüÆ\È\Ó\ÖWk\0I\Î`•VSS”ƒö\ÙA$³\ê÷€-µiñ·œú¸Z\ékz@¼AY\"c/*‚\Ş\Út\Ş3µ¥Yƒ\Ş]œÔ¥2D\Æ\çªZÒ°y\Ês)!¬C±\"\Î÷Ù¡\"†\êzF´z“Z9>¸”&¬‰KrKuÙƒı·+Á3\Äô”\îj€#…-Á\ï0\ää½ËŸ8Œ\Ã\Ä\âQb\î^ş[Xôˆ8\Äâ¹šŸ\ÒFŒá”´ƒm®\ã\àĞ»Ô¢–÷ôkU`ıI\Û\Ğ~Ö‰?f31·!\Ê4ŒR»ù\ã\Ğz{\æa9\ÄIÆ¸ K%›ƒ\í³Ù£%\\3\Úni½\\n\ÌT\Ãå®¶¥ ‹\nˆ°	ò\Ú@EÀ\êfµÌºJ	/ŒØ¨©B\044šaP\à\Ïm…\Ï2iË†˜ñ\Ïşjs‰t\ãUœÅ¹%Í¾1™uƒv\ïO\îf¿³\ë\ä¹\í\0\ÖP¤$›†c\â½Æò…E¹n&€sŒ~R\ÕšX$÷[V‰ò\ÓXş\ìJ·^$Ë–E¥•Ë¥\Ê_\ËP\"»”Ÿ4®}z\É)\ç¯+‡»ŒÉ·-¯\é*¹\àÊ²Œ\æsO1fÁ%<³~W¢X/\\\É`½L\ì\"c—Hs\ßX®DŒ¤šZ‚¨\09\î==£¹=%H\İ\ÒU™U)D’ú¹[F´Q€—\à`Jsğ|\É9¦5cº/nV>9§fi´Ã«.DP\Ä(\ê\ä/*Ô´X\Ü¡\ìDi«VÃ§øšk\ìúl]\Õ\à‰\"±BS\á9¹\r4şn[´PR3×‰Ÿg³6$”“Ve\çRB +NF%\Ä?\èML\r,Aü\ï;À°¥Ïš™h£¯!Ì‚$\äœ,Ü²\ÑM[\ìü3lÁp‰T\Ò\Ó-jwQÜ°\ÒÔ‰yKQ¨{Ü³\ê_U:Yˆ\rğ+\Æ‹\î24&\\´’rB\n\ëS=grLYÿ\0\äˆ\\Ÿ´\î’Kƒce³\ê\ÍöŞ¶VQ£•\é\Ü6D-IŠ\È\È`\×Y\Å\ÛH„\Õi\ê@3Ç§qô•j-bN Š¥š£1Œ\Ï\á)\"ú¶`H÷ƒ\"Rëº¶\â8¾\Ô\ÔV60\Í?I\Ó&Û‘H2ğe\Ó2{V\Ó\ÕG\ßù…\é°i2Gq5\ÎmU{ñ¾ğF­P{ıbo©²\ß\Üxô\í;¡BH\0…t\éR9\0bV\Æf2\Í\\Ğ„—)³\Ô\Ã6Øµp=3ªXñqœVZd)j*\ÎYE$\0\ì@´¼eß‹kr[?owo\Ì\Âr2$|?„\" &r”“p\ÛşùEtº#i%\Î1\ÚŒB¼E\ÂTµ)I\Ë00™6;±óc\éx\Ö5\"aW\íó–G \ægu<X•\å)I\ry¡c)\æNf P«¡S\Óø¦i\ÑáŒ}1\Ï\Ú\\¢\àU©/\Ú\Ê\Ö\ìs\íhK.WY{U\ãişÑƒ\àºyD*c\ÌV½\ïúw‚-`Pş˜…\ŞÕºÁ„\à}\á\Õ\Ìs”Xi\n]q±¶/HŠ®L©\ÅXº\ä\Ê	GN\0kùˆkSk…	Ÿó\r¡Ó­Kt/¬\n%YÂŠÊ€\ë{±¼0“\Ô\ÔF:MO„0tÉ’€ 3³Ÿ?85J\ï¹úö[\Ú\Z£m„‘‹3Fºñ3	bÈ‘-S¦JCŸ\ß8SQijõŒSQs3š*•\ÕNTò’\n¬\éH\ë\Ï3\×yF3ñ›ÁU…†‡Uõ»ü´ÿ\0ˆWw{°%N\ÉaE)$1¾\Ïû\Ş/•\ÆL¾\àFL³KL´¶r¥m‹~p6*\İ8ƒgö\ÉeU\ÊOq”²–\èlqF\ë*U\Ï2dİD‘³\í\î?(©\ï+Ó¼ú¦¬%-¢›b\ày¼p^d¥d˜“\ãHN¦ü†ÿ\0¤h\é\èf\éfZW\Í\æq\ÂlÀzşq¤ºE\Ç39ı wpÕ°¿úo°†³ú\ÇÒ§ğdÿ\0qùG \ÔtYOc~÷øL\É^û\çcO.aŸÀ_şDüŒR\ÈEı\ã\á4£=&ùˆ\í7õ\Â)í«\äj!ª¿x˜M\ÒW\Äô\Õş\Ù5À˜—…^Pƒ~\Ófi_üEw\ã^“zŸ\Ú>²|(õùÂ\Ô\Â¦=Ÿúdy@.ÿ\0\ã\'\Ä\ÌOÿ\0³Bx\'ğÇ¯\Î6½™ı•ßº[¬ğ˜r\ï\Øe¬ˆx\éZ¾‡\â#Uõ‹H)>_”=ªş¨øG=—Ñ¥~ÿ\0§?\æ…,ı\çó\Òv³ú‘¿şŸüiùF¥_µ~,÷†9Cİ„¤§‰x!¯ş‰†§÷@˜—„y\ÆU\İz³¼À¯\ß8¶‡¡•\ÕuÉ3\éøÂ–~ö–_\Û\0ñ\'ñ)ÿ\0\Íşølt\æ‹öYù\Ú/Ÿú´ÿ\0\ç1o\Úf ÿ\0\ãŸÿ\03U¦\Ö/Oõ\'“~’\Úôn\Ğ\æuô£ü$\äL ÿ\0\×ù© \ë`z\'üÑŸwy¥wxvO‹\×ğ…H³t\Ôx\Çù~qa\ÒYzIŒxùDv•ÿ\0¯\Ê]>?H¤ı³…x½¢\á\Ò.\ã:\Íóü5_hıf|Gü_H\İ\ÒşÈ—´¿¨>B¡\Å\é1_¬ÿ\Ù',20.00);
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
