    -- UNION ---------------
-- El operador UNION combina los resultados de dos o más consultas en un único resultado 
-- Es decir, las consultas se ejecutan por separado, concatenando luego los resultados de cada una.
-- Hay una condición para poder utilizar el operador UNION, y es que la cantidad de columnas en cada consulta o tablas debe ser la misma y del mismo tipo de datos 

SELECT * FROM game;

SELECT id_game, name, description, id_level, id_class 
FROM game
WHERE id_level = 1
UNION 
SELECT id_game, name, description, id_level, id_class 
FROM game
WHERE id_level = 2;


			-- Operador Like "%"
-- La implementación de este operador se realiza sobre campos del tipo texto o alfanuméricos, para buscar parte de un valor coincidente. 

SELECT * 
FROM game 
WHERE name LIKE "FIFA%";

			-- Operador Like  "_"
-- El caracter comodín “_”, podemos también definir el desconocimiento de un solo caracter. 
-- Se puede combinar con el caracter %.

SELECT * 
FROM game
WHERE name LIKE '__a%'; -- busca los juegos que la tercera letra sea a ya que desconoce las 2 primeras


			-- Regexp ------------------
            -- Exclusión de caracteres
SELECT * 
FROM game 
WHERE name REGEXP '^[^FO]';  -- Los lista char [^abc] se utiliza para hacer coincidir cualquier carácter excepto los incluidos.



			-- Subconsultas -----------------
-- Las subconsultas son, básicamente, una segunda consulta completa que debe ser definida a continuación de las cláusulas WHERE o HAVING dentro de una sentencia general de SQL.
-- Para poder llevar a cabo esto de manera exitosa, debemos tener en cuenta las siguientes reglas:
-- La subconsulta debe ir entre paréntesis.
-- La subconsulta debe tener una sola columna o expresión.
-- No podemos utilizar BETWEEN o LIKE en la subconsulta.
-- No debemos colocar la cláusula ORDER BY en la subconsulta.

    -- OBTENER DATOS DE OTRAS TABLAS
-- Contamos con dos tablas: SYSTEM_USER y USER_TYPE; necesitamos visualizar aquellos usuarios con el máximo identificador de tipo.

SELECT id_system_user, last_name ,id_user_type -- El resultado en esta consulta será solamente el id_system_user y last_name, pero solamente de aquellos usuarios que son del tipo cuyo id_user_type es el máximo
FROM system_user
WHERE id_user_type = (SELECT max(id_user_type) FROM user_type);

SELECT id_system_user, last_name -- El resultado en esta consulta será solamente el id_system_user y last_name, pero solamente de aquellos usuarios que son del tipo cuya descripción comience con 'tempo'
FROM system_user
WHERE id_user_type = (SELECT id_user_type FROM user_type
WHERE description like 'tempo%');



  -- OBTENER DATOS DE UNA MISMA TABLA
-- También podemos abordar subconsultas dentro de una misma tabla. 
-- En este caso, la tabla vote cuenta con información del puntaje que cada usuario le dio a un juego en la columna value.


-- Busquemos los usuarios que votaron con un puntaje superior al promedio.
SELECT id_system_user 
FROM vote WHERE value = (SELECT FLOOR(AVG(value)) FROM vote);

-- Podemos también obtener los votos totales de un juego específico, por ejemplo el de menor id:

SELECT SUM(value) 
FROM vote
WHERE id_game = (SELECT min(id_game) FROM game);

-- Tambien podemos sumar otros operadores.   
-- usuarios que votaron por encima del promedio total de votos.
SELECT id_system_user 
FROM vote
WHERE value > (SELECT avg(value) FROM vote);



  -- Ordenamiento en subconsultas
-- La sentencia ORDER BY puede ser utilizada dentro de consultas con subconsultas, debemos incluir el orden sobre la consulta más externa.
SELECT id_system_user, last_name
FROM system_user
WHERE id_user_type = (SELECT max(id_user_type) FROM user_type)
ORDER BY last_name ASC;


-- Debemos obtener la suma de votos por juego, solo de aquellos juegos de nivel 1. Observemos cómo podemos hacerlo con nuestras tablas

SELECT id_game, SUM(value) AS votos
FROM vote 
WHERE id_game IN (SELECT id_game 
FROM game WHERE id_level = 1)
GROUP BY id_game;

-- Veamos cómo integrar consultas con HAVING. Ahora seleccionaremos los juegos pero sólo aquellos que hayan tenido más de un voto.

SELECT id_game, name
FROM game
WHERE id_level = 1 AND
id_game IN 
(SELECT id_game
FROM vote
GROUP BY id_game
HAVING count(*) > 1);
