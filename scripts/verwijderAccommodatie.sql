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
END