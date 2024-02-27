							-- PRACTICA TRIGGERS
                            
-- Con la tabla comment del modelo gamers deberás crear dos triggers:
-- Debe detectar la modificación de un registro de la tabla en cuestión, justo antes de que ocurra, almacenando en otra tabla first_date y last_date
-- Debe detectar la eliminación de un registro, posterior a dicha operación, registrando también fecha y hora, más el usuario que lo eliminó
-- La tabla bitácora puede ser un espejo de la tabla elegida o una tabla del tipo LOG. 

SELECT * FROM comment;
SELECT * FROM comment_LOG;

 CREATE TABLE comment_LOG (
 id_game INT PRIMARY KEY,
 id_system_user INT,
 first_date DATE,
 last_date DATE,
 delete_date TIMESTAMP,
 user_name VARCHAR(50));


DELIMITER //
CREATE TRIGGER t_comment_update
BEFORE UPDATE ON comment
FOR EACH ROW
BEGIN
	INSERT INTO comment_LOG (id_game,id_system_user,first_date,last_date) VALUES (OLD.id_game, OLD.id_system_user, OLD.first_date, OLD.last_date);
END //
DELIMITER ; 

UPDATE comment SET last_date = CURRENT_DATE() WHERE id_game = 2  AND id_system_user = 430;


DELIMITER //
CREATE TRIGGER t_comment_delete
BEFORE DELETE ON comment
FOR EACH ROW
BEGIN
	INSERT INTO comment_log (id_game, id_system_user, delete_date,user_name) VALUES (OLD.id_game, OLD.id_system_user,NOW(),USER());
END //
DELIMITER ;

DELETE FROM comment WHERE id_game = 1 AND id_system_user = 294;