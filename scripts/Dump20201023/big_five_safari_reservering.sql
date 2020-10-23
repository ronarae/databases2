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
-- Table structure for table `reservering`
--

DROP TABLE IF EXISTS `reservering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservering` (
  `reservering_id` int(11) NOT NULL,
  `betaald` enum('y','n') NOT NULL,
  `aankomst_datum` date NOT NULL,
  `vertrek_datum` date NOT NULL,
  `accommodatie_code` varchar(215) NOT NULL,
  `reizigers_code` varchar(215) NOT NULL,
  PRIMARY KEY (`reservering_id`),
  KEY `fk_Reservering_Accommodatie_idx` (`accommodatie_code`),
  KEY `fk_Reservering_Reiziger_idx` (`reizigers_code`),
  CONSTRAINT `fk_Reservering_Accommodatie1` FOREIGN KEY (`accommodatie_code`) REFERENCES `accommodatie` (`accommodatie_code`),
  CONSTRAINT `fk_Reservering_Reiziger1` FOREIGN KEY (`reizigers_code`) REFERENCES `reiziger` (`reizigers_code`),
  CONSTRAINT `CheckDatum` CHECK ((`vertrek_datum` > `aankomst_datum`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservering`
--

LOCK TABLES `reservering` WRITE;
/*!40000 ALTER TABLE `reservering` DISABLE KEYS */;
INSERT INTO `reservering` VALUES (1,'n','2020-07-12','2020-07-19','HIBZ2','FadilT'),(2,'y','2020-07-10','2020-07-19','HSCW1','JeremyD'),(3,'n','2020-07-31','2020-08-05','HPHC1','WongH'),(4,'n','2020-07-19','2020-07-23','LBBL1','FadilT'),(5,'y','2020-08-12','2020-08-14','LNZL1','MulderF'),(6,'n','2020-07-01','2020-07-05','HRHB1','NazariM'),(7,'n','2020-07-05','2020-07-08','LNZL1','NazariM'),(8,'y','2020-07-24','2020-07-26','HRMS1','NguyenR'),(9,'y','2020-07-26','2020-07-31','HPHC1','NguyenR'),(10,'y','2020-08-01','2020-08-06','LIE1','NguyenR'),(11,'n','2020-08-19','2020-08-27','LAAC1','MeijerP'),(12,'n','2020-08-27','2020-08-31','LIML1','MeijerP');
/*!40000 ALTER TABLE `reservering` ENABLE KEYS */;
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
