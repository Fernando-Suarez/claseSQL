				-- FUNCIONES DE AGREGACION O AGRUPACION -------
                
select count(*)  -- devuelve el numero total de filas
as total_id_game
from game;

select min(id_game) -- devuleve el valor minimo de un campo que seleccionemos
as min_id_game
from game;

select max(id_game) -- devuelve el valor maximo de un campo que seleccionemos
as max_id_game
from game;

SELECT SUM(value) -- Devuelve la suma de los valores de un campo que especifiquemos
FROM vote
WHERE id_game = 1;

SELECT AVG(value) -- Devuelve el promedio de un campo que especifiquemos
FROM vote
WHERE id_game = 1;

  -- selecciona id_system_user, lo renombra a user despues cuenta todos los id_game, los agrupa por id_system_user y los renombra a games_by_user
         -- la debemos utilizar cuando debemos obtener información que nace de la agrupación de registros
         
SELECT
id_system_user AS user, COUNT(*) AS games_by_user
FROM play
GROUP BY id_system_user;

-- HAVING, al igual WHERE, permite establecer condiciones para filtrar los resultados -  solo funciona con campos generados a partir de una función.


SELECT 
id_system_user AS user, COUNT(*) AS games_by_user
FROM play
GROUP BY id_system_user
HAVING COUNT(*) > 1;

						-- JOIN -------------------------------------------
                        
-- INNER JOIN, o JOIN, retorna todas las filas de las dos tablas siempre que haya coincidencia por el campo declarado en el ON.
-- El resultado es NULL cuando no hay coincidencia alguna.


SELECT id_system_user as user, g.id_game as game, name, 
       id_level as level
FROM play p INNER JOIN game g ON (p.id_game = g.id_game);

-- LEFT JOIN retorna todas las filas de la tabla izquierda que coincidan con las filas de la tabla derecha
-- El resultado es NULL del lado derecho, cuando no hay coincidencia.
SELECT * FROM play;
select * from game;

SELECT id_system_user as user, g.id_game as game, 
name, id_level as level
FROM game g LEFT JOIN play p
ON (p.id_game = g.id_game);


-- RIGHT JOIN retorna todas las filas de la tabla derecha que coincidan con las filas de la tabla izquierda
-- El resultado es NULL cuando no hay coincidencia del lado izquierdo

SELECT id_system_user as user, g.id_game as game, 
name, id_level as level
FROM play p RIGHT JOIN game g
ON (p.id_game = g.id_game);


