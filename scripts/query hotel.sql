SELECT h.accommodatie_code, h.prijsPerNacht, h.onbijt, a.naam, a.stad, a.land, a.kamer, a.soort, a.persoon 
FROM Hotel AS h 
INNER JOIN Accommodatie AS a ON h.accommodatie_code = a.accommodatie_code;
     