--   Práctica de funciones SQL

-- Crea una nueva función en la DB GAMERS, llamada get_game() para obtener el nombre del videojuego, pasándole a dicha función el parámetro id_game.
-- Los nombres de los videojuegos se encuentran en la tabla game.
-- Luego, debes crear una consulta del tipo SELECT sobre la tabla game, obteniendo sólo el name del videojuego.


USE GAMMERS;
SELECT * FROM GAME;
delimiter //
CREATE FUNCTION get_game(idGame int) RETURNS VARCHAR(50) DETERMINISTIC
BEGIN
	DECLARE nombreJuego VARCHAR(50);
    SELECT name INTO nombreJuego FROM game WHERE id_game = idGAme;
    RETURN nombreJuego;
END //
delimiter ;

SELECT get_game(1) as Nombre_Juego;