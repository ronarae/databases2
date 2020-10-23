CREATE DEFINER=`root`@`localhost` FUNCTION `geboektOp`(pCode VARCHAR(60), pDatum DATE) RETURNS varchar(60) CHARSET latin1
BEGIN
DECLARE rCode VARCHAR (60) DEFAULT 0;

SELECT reizigers_code INTO rCode FROM `reservering`
WHERE
	accommodatie_code = pCode
        AND pDatum BETWEEN aankomst_datum AND vertrek_datum;

RETURN IFNULL(rCode, null);
END