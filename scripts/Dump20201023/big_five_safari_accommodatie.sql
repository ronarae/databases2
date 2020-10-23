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
-- Table structure for table `accommodatie`
--

DROP TABLE IF EXISTS `accommodatie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accommodatie` (
  `accommodatie_code` varchar(215) NOT NULL,
  `naam` varchar(215) NOT NULL,
  `stad` varchar(215) NOT NULL,
  `land` varchar(215) NOT NULL,
  `kamer` varchar(450) NOT NULL,
  `persoon` int(11) NOT NULL,
  `soort` enum('hotel','lodge') NOT NULL,
  PRIMARY KEY (`accommodatie_code`),
  UNIQUE KEY `accommodatie_code_idx` (`accommodatie_code`),
  CONSTRAINT `accommodatie_code_check` CHECK (((length(`accommodatie_code`) <= 5) and regexp_like(`accommodatie_code`,_utf8mb4'[0-9]$')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accommodatie`
--

LOCK TABLES `accommodatie` WRITE;
/*!40000 ALTER TABLE `accommodatie` DISABLE KEYS */;
INSERT INTO `accommodatie` VALUES ('HEVO1','Etosha Village','Okaukuejo','Namibië','Standaard kamer met 2 Bedden',2,'hotel'),('HHIH1','Holiday Inn','Harare','Zimbabwe','Standaard kamer',3,'hotel'),('HIBZ1','Indigo Beach','Zanzibar','Tanzania','Swahili-stijl budget tweepersoonskamer',2,'hotel'),('HIBZ2','Indigo Beach','Zanzibar','Tanzania','Bungalow met uitzicht op de tuin',8,'hotel'),('HPHC1','Premier Hotel Cape Town','Kaapstad','Zuid-Afrika','Familie loft met queen size bed en 2 aparte bedden',4,'hotel'),('HRHB1','Bulawayo Rainbow Hotel','Bulawayo','Zimbabwe','Deluxe tweepersoonskamer',2,'hotel'),('HRMS1','River Manor Boutique Hotel','Stellen Bosch','Zuid-Afrika','Loft studio kamer',2,'hotel'),('HRMS2','River Manor Boutique Hotel','Stellen Bosch','Zuid-Afrika','Superior tweepersoonskamer',2,'hotel'),('HSCW1','Safari Court Hotel','Windhoek','Namibië','Classic tweepersoonskamer met 2 aparte bedden',2,'hotel'),('HZBK1','Zanbluu Beach Hotel','Kiwengwa','Tanzania','Superior Suite met uitzicht op zee en eigen zwembad',2,'hotel'),('LAAC1','Sasa Safari Camp','Outjo','Namibië','Tweepersoonskamer met Uitzicht',2,'lodge'),('LASL1','Africa Safari Lodge','Mariental','Namibië','Familiekamer',4,'lodge'),('LBBL1','Baby Bush Lodge','Kiwengwa','Tanzania','Bruidssuite met Balkon',2,'lodge'),('LIE1','Impala Ecolodge','Kisumu','Kenia','Luxe suite',2,'lodge'),('LIML1','Immanuel Wilderness Lodge','Windhoek','Namibië','Tweepersoonskamer met Uitzicht op de Tuin',2,'lodge'),('LML1','Mika Lodge','Lusaka','Zambia','Executive Suite',2,'lodge'),('LNZL1','Ngoma Zanga Lodge','Livingstone','Zambia','Deluxe kamer met kingsize bed',3,'lodge');
/*!40000 ALTER TABLE `accommodatie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23 16:40:13
