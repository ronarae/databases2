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
-- Temporary view structure for view `boekingsoverzicht`
--

DROP TABLE IF EXISTS `boekingsoverzicht`;
/*!50001 DROP VIEW IF EXISTS `boekingsoverzicht`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `boekingsoverzicht` AS SELECT 
 1 AS `naam`,
 1 AS `stad`,
 1 AS `land`,
 1 AS `kamer`,
 1 AS `reizigersnaam`,
 1 AS `aankomst_datum`,
 1 AS `verblijfsduur`,
 1 AS `betaald`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `boekingsoverzicht`
--

/*!50001 DROP VIEW IF EXISTS `boekingsoverzicht`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `boekingsoverzicht` AS select `accommodatie`.`naam` AS `naam`,`accommodatie`.`stad` AS `stad`,`accommodatie`.`land` AS `land`,`accommodatie`.`kamer` AS `kamer`,concat(`reiziger`.`voornaam`,' ',`reiziger`.`achternaam`) AS `reizigersnaam`,`reservering`.`aankomst_datum` AS `aankomst_datum`,(to_days(`reservering`.`vertrek_datum`) - to_days(`reservering`.`aankomst_datum`)) AS `verblijfsduur`,`reservering`.`betaald` AS `betaald` from ((`reservering` join `accommodatie` on((`accommodatie`.`accommodatie_code` = `reservering`.`accommodatie_code`))) join `reiziger` on((`reiziger`.`reizigers_code` = `reservering`.`reizigers_code`))) order by `reservering`.`aankomst_datum` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'big_five_safari'
--

--
-- Dumping routines for database 'big_five_safari'
--
/*!50003 DROP FUNCTION IF EXISTS `geboektOp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `geboektOp`(pCode VARCHAR(60), pDatum DATE) RETURNS varchar(60) CHARSET latin1
BEGIN
DECLARE rCode VARCHAR (60) DEFAULT 0;

SELECT reizigers_code INTO rCode FROM `reservering`
WHERE
	accommodatie_code = pCode
        AND pDatum BETWEEN aankomst_datum AND vertrek_datum;

RETURN IFNULL(rCode, null);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verwijderAccommodatie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verwijderAccommodatie`(IN accommodatieCode VARCHAR(5))
BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT * FROM Reservering WHERE  Reservering.accommodatie_code = accommodatie_code) THEN
    DELETE FROM Accommodatie
		WHERE Accommodatie.accommodatie_code = accommodatie_code;
	DELETE FROM Reservering
		WHERE  Reservering.accommodatie_code = accommodatie_code AND now() > vertrek_datum AND betaald = 1;
END IF;

COMMIT;
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

-- Dump completed on 2020-10-23 16:40:13
