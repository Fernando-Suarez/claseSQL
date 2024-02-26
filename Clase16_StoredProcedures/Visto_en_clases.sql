--          			STORED PROCEDURES


-- Sintaxis

delimiter //
CREATE PROCEDURE ValidacionEdad (in edad int)
BEGIN
	IF edad >= 18 THEN 
		SELECT "Puedes Pasar" ;
    ELSE 
		SELECT "No Puedes Pasar";
    END IF;    
END //
delimiter ;


CALL ValidacionEdad(30) ;

-- ----------------------------------------------------------

delimiter //
CREATE PROCEDURE sp_get_games()
BEGIN
	SELECT * FROM game;
END //
delimiter ;


CALL sp_get_games();

-- -------------------------------------------------------------

DELIMITER //

 

CREATE PROCEDURE `sp_get_games_order` (IN field CHAR(20))
BEGIN
    DECLARE game_order VARCHAR(100);
    DECLARE clausula VARCHAR(200);
    IF field <> '' THEN
        SET game_order = CONCAT('ORDER BY ', field);
    ELSE
        SET game_order = '';
    END IF;
    SET @clausula = CONCAT('SELECT * FROM game ', game_order);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END //
DELIMITER ;

CALL sp_get_games_order('id_level,id_game');