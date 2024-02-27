					-- TRIGGERS
                    
-- sintaxis

--  delimiter //                                   	paso 1
--  create trigger nombreTrigger 					paso 2
--  before o after									paso 3 elegir si se dispara antes o despues
--  insert, update o delete	ON						paso 4
-- for each row										paso 5 hace un bucle en todas las filas
--  begin											paso 6 
--  aca va la logica								paso 7 escribo la logica de nuestro trigger
-- end  //											paso 8
-- delimiter ;										paso 9


DELIMITER //
CREATE TRIGGER t_play_papelera
BEFORE DELETE ON play
FOR EACH ROW
BEGIN
	INSERT INTO play_papelera (id_game , id_system_user, completed) VALUES (OLD.id_game , OLD.id_system_user, OLD.completed);
END //
DELIMITER ;


DELETE FROM play WHERE id_game = 1 AND id_system_user = 135 ;

DELIMITER //
CREATE TRIGGER t_play_actualizacion
AFTER INSERT ON play
FOR EACH ROW
BEGIN
	INSERT INTO play_papelera (id_game , id_system_user, completed) VALUES (NEW.id_game , NEW.id_system_user, NEW.completed);
END //
DELIMITER ;

select * from play;
select * from play_papelera;

INSERT INTO play (id_game , id_system_user, completed) VALUES (1100,1,0);
-- SET foreign_key_checks = 1



-- FUNCIONES DE SISTEMA  ------------------------------------------------------------------------------

-- de Fecha y Hora
SELECT NOW();	-- NOW() Muestra el momento en el que estamos con fecha y hora
SELECT CURRENT_DATE();	-- CURRENT_DATE() Muestra la fecha actual
SELECT CURDATE();	-- CURDATE() Muestra la fecha actual
SELECT CURRENT_TIME();	-- CURRENT_TIME() Muestra la hora actual
SELECT CURTIME();	-- CURTIME() Muestra la hora actual
SELECT CURRENT_TIMESTAMP();	-- CURRENT_TIMESTAMP() Muestra la fecha y hora donde se ejecuta la instancia al servidor

-- de Usuario
SELECT SESSION_USER();	-- SESSION_USER()
SELECT SYSTEM_USER();	-- SYSTEM_USER()
SELECT USER();	-- USER()

-- de Plataforma
SELECT DATABASE();	-- DATABASE()
SELECT VERSION();	-- VERSION()


CREATE TABLE new_game2024 (
id_game INT PRIMARY KEY,
name VARCHAR(50),
descripcion VARCHAR(150),
fecha_carga TIMESTAMP);

DELIMITER // 
CREATE TRIGGER t_insert_new_game2024
AFTER INSERT ON game
FOR EACH ROW
BEGIN
	INSERT INTO new_game2024 (id_game, name,descripcion,fecha_carga) VALUES (NEW.id_game,NEW.name,NEW.description,NOW());
END //
DELIMITER ;

INSERT INTO game (id_game,name,description,id_level,id_class) VALUES (1001,"Resident Evil Zero", "lorem ipsum", 1,310);
SELECT * FROM game WHERE id_game = 1001;
SELECT * FROM new_game2024;