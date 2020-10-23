select * from reservering r 
inner join accommodatie a on r.accommodatie_code = a.accommodatie_code 
inner join reiziger re on r.reizigers_code = re.reizigers_code 
where r.reizigers_code = 'FadilT';
