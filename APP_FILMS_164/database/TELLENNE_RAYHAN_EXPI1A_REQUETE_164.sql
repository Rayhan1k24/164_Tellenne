SELECT * FROM t_agents;

SELECT * FROM t_genre;

SELECT * FROM t_film;

SELECT * FROM t_agents WHERE nom = 'Smith';

SELECT * FROM t_film WHERE date_film > '2024-04-25 13:26:00';

SELECT COUNT(*) FROM t_agents;

SELECT COUNT(*) FROM t_genre;

SELECT COUNT(*) FROM t_film;

SELECT * FROM t_agents WHERE telephone = '+33 6 12 34 56 78';

SELECT * FROM t_genre WHERE genre = 'Maison';

SELECT * FROM t_film WHERE email = 'APARTMENT-TOUR@example.com';

SELECT * FROM t_agents ORDER BY nom ASC;

SELECT * FROM t_genre ORDER BY date_genre DESC;

SELECT * FROM t_film ORDER BY nom_film ASC;