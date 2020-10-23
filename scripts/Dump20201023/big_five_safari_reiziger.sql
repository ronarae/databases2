-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: big_five_safari
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `reiziger`
--

DROP TABLE IF EXISTS `reiziger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reiziger` (
  `reizigers_code` varchar(215) NOT NULL,
  `voornaam` varchar(215) NOT NULL,
  `achternaam` varchar(215) NOT NULL,
  `adres` varchar(215) NOT NULL,
  `postcode` varchar(215) NOT NULL,
  `plaats` varchar(215) NOT NULL,
  `land` varchar(215) NOT NULL,
  `hoofdreiziger` varchar(215) DEFAULT NULL,
  PRIMARY KEY (`reizigers_code`),
  UNIQUE KEY `rezigers_code_idx` (`reizigers_code`),
  KEY `fk_Reiziger_Reiziger_idx` (`hoofdreiziger`),
  CONSTRAINT `fk_Reiziger_Reiziger1` FOREIGN KEY (`hoofdreiziger`) REFERENCES `reiziger` (`reizigers_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reiziger`
--

LOCK TABLES `reiziger` WRITE;
/*!40000 ALTER TABLE `reiziger` DISABLE KEYS */;
INSERT INTO `reiziger` VALUES ('FadilO','Omar','Fadil','Houtsberg 16','6091 NA','Leveroy','Nederland','FadilT'),('FadilT','Tehara','Fadil','Houtsberg 16','6091 NA','Leveroy','Nederland',NULL),('FonteijnC','Claar','Fonteijn','Castricummerwerf 70','1901 RF','Castricum','Nederland','MeijerP'),('JeremyB','Bram','Jeremy','Rijksstraatweg 289','3956 CP','Leersum','Nederland','JeremyD'),('JeremyD','Demitri','Jeremy','Rijksstraatweg 289','3956 CP','Leersum','Nederland',NULL),('JeremyD1','Devid','Jeremy','De Kronkels 25','3752 LM','Bunschoten','Nederland','JeremyD'),('MeijerP','Pieter','Meijer','Expediditiestraat 2','1135 GB','Edam','Nederland',NULL),('MulderD','Derek','Mulder','Lakenblekerstraat 49A','1431 GE','Aalsmeer','Nederland','MulderF'),('MulderF','Frank','Mulder','Lakenblekerstraat 49A','1431 GE','Aalsmeer','Nederland',NULL),('MulderS','Sophie','Mulder','Lakenblekerstraat 49A','1431 GE','Aalsmeer','Nederland','MulderF'),('NazariM','Moustafa','Nazari','Vlakdissen 12','1648 HJ','Den Goorn','Nederland',NULL),('NguyenR','Roy','Nguyen','Bukkemweg 1','5081 CT','Hilvarenbeek','Nederland',NULL),('RijenF','Fred','van Rijen','Einsteinstraat 10','1446 VG','Purmerend','Nederland','MulderF'),('WongH','Hu','Wong','Rembrandtstraat 7','3662 HN','OJud-Bijerland','Nederland',NULL);
/*!40000 ALTER TABLE `reiziger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23 16:40:12
