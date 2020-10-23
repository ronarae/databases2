use big_five_safari;
SELECT r.reservering_id, r.aankomst_datum, r.vertrek_datum, r.betaald, 
a.accommodatie_code, a.naam, a.stad, a.land, 
reiziger.voornaam, reiziger.achternaam,reiziger.adres, reiziger.postcode,
reiziger.plaats, reiziger.reizigers_code, reiziger.hoofdreiziger
FROM `reservering` AS r 
INNER JOIN accommodatie AS a ON r.accommodatie_code = a.accommodatie_code 
INNER JOIN reiziger ON r.reizigers_code = reiziger.reizigers_code	