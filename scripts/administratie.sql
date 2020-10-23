CREATE USER 'administratie'@'localhost' IDENTIFIED BY 'Vakantie2020';

GRANT SELECT ON big_five_safari.boekingsoverzicht TO 'administratie'@'localhost';

GRANT EXECUTE ON PROCEDURE big_five_safari.verwijderAccommodatie TO 'administratie'@'localhost';

SHOW GRANTS FOR 'administratie'@'localhost';