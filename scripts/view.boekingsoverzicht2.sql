CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `boekingsoverzicht` AS
    SELECT 
        `accommodatie`.`naam` AS `naam`,
        `accommodatie`.`stad` AS `stad`,
        `accommodatie`.`land` AS `land`,
        `accommodatie`.`kamer` AS `kamer`,
        CONCAT(`reiziger`.`voornaam`,
                ' ',
                `reiziger`.`achternaam`) AS `reizigersnaam`,
        `reservering`.`aankomst_datum` AS `aankomst_datum`,
        (TO_DAYS(`reservering`.`vertrek_datum`) - TO_DAYS(`reservering`.`aankomst_datum`)) AS `verblijfsduur`,
        `reservering`.`betaald` AS `betaald`
    FROM
        ((`reservering`
        JOIN `accommodatie` ON ((`accommodatie`.`accommodatie_code` = `reservering`.`accommodatie_code`)))
        JOIN `reiziger` ON ((`reiziger`.`reizigers_code` = `reservering`.`reizigers_code`)))
    ORDER BY `reservering`.`aankomst_datum`