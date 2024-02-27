/*Trigger Before Insert en la tabla GAME: Para asegurarse
 de que el nivel y la clase especificados existen antes de insertar un nuevo juego.*/

DELIMITER $$
CREATE TRIGGER before_game_insert
BEFORE INSERT ON GAME
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM LEVEL_GAME WHERE id_level = NEW.id_level) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nivel especificado no existe';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM CLASS WHERE id_class = NEW.id_class) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La clase especificada no existe';
    END IF;
END;

INSERT INTO GAME (id_game, name, description, id_level, id_class) VALUES (1, 'Nombre del Juego', 'Descripción del Juego', 1, 1);

-- ------------------------------------------------------------------------------------------------------------
/*Trigger Before Insert en la tabla COMMENT: Para asegurarse de que el juego 
y el usuario especificados existen antes de insertar un nuevo comentario.*/

DELIMITER $$
CREATE TRIGGER before_comment_insert
BEFORE INSERT ON COMMENT
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GAME WHERE id_game = NEW.id_game) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El juego especificado no existe';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM SYSTEM_USER WHERE id_system_user = NEW.id_system_user) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario especificado no existe';
    END IF;
END $$
DELIMITER ;

INSERT INTO COMMENT (id_game, id_system_user, first_date, last_date) VALUES (1, 1, '2024-02-15', NULL);

-- -------------------------------------------------------------------------------------------------------------------
/*Trigger Before Update en la tabla PLAY: Para evitar 
que se actualice el estado "completado" a falso si ya está marcado como completado.*/

DELIMITER $$
CREATE TRIGGER before_play_update
BEFORE UPDATE ON PLAY
FOR EACH ROW
BEGIN
    IF OLD.completed = TRUE AND NEW.completed = FALSE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El juego ya ha sido completado, no se puede marcar como incompleto';
    END IF;
END $$
DELIMITER ;

UPDATE PLAY SET completed = FALSE WHERE id_game = 1 AND id_system_user = 1;

-- ------------------------------------------------------------------------------------------------------
/*Trigger Before Delete en la tabla SUGGEST: Para prevenir la eliminación de sugerencias.*/

DELIMITER $$
CREATE TRIGGER before_suggest_delete
BEFORE DELETE ON SUGGEST
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite eliminar sugerencias';
END $$
DELIMITER ;

DELETE FROM SUGGEST WHERE id_suggest = 1;/*Trigger Before Delete en la tabla SUGGEST: Para prevenir la eliminación de sugerencias.*/

-- --------------------------------------------------------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER before_suggest_delete
BEFORE DELETE ON SUGGEST
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se permite eliminar sugerencias';
END $$
DELIMITER ;

DELETE FROM SUGGEST WHERE id_suggest = 1;

-- --------------------------------------------------------------------------------------------------------------
/* Trigger Before Insert en la tabla COMMENTARY: 
Para verificar la existencia del juego y del usuario antes de insertar un comentario.*/
DELIMITER $$
CREATE TRIGGER before_commentary_insert
BEFORE INSERT ON COMMENTARY
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM GAME WHERE id_game = NEW.id_game) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El juego no existe';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM SYSTEM_USER WHERE id_system_user = NEW.id_system_user) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El usuario no existe';
    END IF;
END;

INSERT INTO COMMENTARY (id_commentary, id_game, id_system_user, comment_date, commentary) 
VALUES (1, 1, 1, '2024-02-15', 'Comentario de prueba');

-- -------------------------------------------------------------------------------------------------------------------
/*Trigger After Update en la tabla COMMENT: Para actualizar 
la última fecha cuando se actualice un comentario.*/
DELIMITER $$
CREATE TRIGGER after_comment_update
AFTER UPDATE ON COMMENT
FOR EACH ROW
BEGIN
    UPDATE COMMENT SET last_date = NOW() WHERE id_game = NEW.id_game AND id_system_user = NEW.id_system_user;
END;

UPDATE COMMENT SET commentary = 'Nuevo comentario' WHERE id_game = 1 AND id_system_user = 1;