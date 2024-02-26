     -- SUBCONSULTAS SQL
     
-- Llevemos todos los ejemplos hasta aquí aprendidos, a la base de datos GAMER. Trabajamos con las tablas  combinando consultas y subconsultas que cumplan con el uso de:
-- Juegos jugados por jugador
SELECT name
FROM game 
WHERE id_game =
ANY (SELECT id_game FROM play where id_system_user = 5 );

-- Condicionales en el nombre de los usuarios
SELECT * FROM system_user
WHERE first_name LIKE "T%" AND id_system_user >
(SELECT  AVG(id_system_user) FROM system_user);

-- Integración de HAVING
-- Funciones de agregación y GROUP BY
SELECT * FROM commentary;

SELECT id_game, COUNT(id_game) AS cantidad
FROM commentary
WHERE id_game < (SELECT MAX(id_game) FROM commentary)
GROUP BY id_game
HAVING id_game < (SELECT AVG(id_game) FROM commentary)
ORDER BY id_game DESC;

 

 


