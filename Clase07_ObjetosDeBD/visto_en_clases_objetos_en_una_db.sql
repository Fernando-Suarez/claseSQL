			-- OBJETOS EN UNA BASE DE DATOS
-- TABLAS
-- paso 1 crear la tabla friend
CREATE TABLE friend (
	id INT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    troop INT,
    PRIMARY KEY(id)
);

-- paso 2. agregar algunos registros
INSERT INTO friend (age,id,first_name,last_name,troop)
values (25,1,"Rick","Hunter",1),
(25,2,"Roy","Fokler",2),
(25,3,"Max","Sterling",2),
(25,4,"Kramer","Key",2),
(25,5,"Mriya","Sterling",2),
(25,6,"Ben","Dixon",2);

-- crear la tabla troops
create TABLE troops(
id INT,
description VARCHAR(45),
 primary key (id),
 foreign key(id) references friend(id)
);

-- paso 4 agregar algunos registros
insert into troops(id,description)
values (1,"Vermillon"),
(2,"Skull");


delete from friend where id = 1; -- no se puede borrar porque esta vinculado a la tabla troops , primero deberiamos borrar en la tabla troops y despues en friends
delete from troops where id = 1; 
select * from friend;




			-- VISTAS O VIEW
-- Una Vista es un conjunto de resultados de una tabla o más tablas de un DB.
-- Podemos definirlas también como “una tabla virtual”, que se genera a partir de una o más tablas de una BD relacional.

CREATE VIEW GameInfo AS
SELECT G.id_game, G.name, G.description, LG.description AS level_description
FROM game G
JOIN level_game LG ON G.id_level = LG.id_level;

/*Esta vista crea una forma conveniente de consultar información sobre 
juegos junto con sus niveles y clases correspondientes*/

-- Consulta para utilizar la vista 'GameInfo'.
select * from level_game;
SELECT * FROM GameInfo;



			-- Funciones
-- Estas permiten crear una rutina específica que procese determinados parámetros, y retornar un resultado determinado.
-- Deben retornar siempre un valor con un tipo de dato definido.
-- Pueden usarse en el contexto de una sentencia SQL.
-- Retornan un valor individual, y nunca un conjunto de registros.

DELIMITER $$
CREATE FUNCTION count_troops(id_troop INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE troopCount INT; -- Declara una variable para guardar el resultado de la query
    SELECT COUNT(*) 
    INTO troopCount  -- guarda dentro de la variable el contador
    FROM friends 
    WHERE troop = id_troop;
    RETURN troopCount; -- retorna la variable 
END $$
DELIMITER ;

SELECT count_troops(2);


    -- TRIGGERS
-- El trigger se dispara cuando ocurre un comando INSERT, UPDATE o DELETE, ejecutando un bloque de instrucciones que proteja o prepare la información de las tablas.
-- La principal tarea de un trigger es la de mantener la integridad de una bb.dd. aplicando los siguientes casos de uso:
-- Validar la información
-- Calcular atributos derivados
-- Seguir movimientos y Logs

-- EJEMPLO:

-- Crear la tabla de respaldo
CREATE TABLE BACKUP_GAME (
    id_game_backup INT NOT NULL,
    name_backup VARCHAR(100) NOT NULL,
    description_backup VARCHAR(300) NOT NULL,
    id_level_backup INT NOT NULL,
    id_class_backup INT NOT NULL,
    backup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_game_backup)
);
drop table BACKUP_GAME;

-- Crear el desencadenador para guardar datos antes de eliminar en la tabla GAME
DELIMITER //
CREATE TRIGGER BEFORE_DELETE_GAME_TRIGGER
BEFORE DELETE ON GAME
FOR EACH ROW
BEGIN
    -- Insertar datos de la fila a eliminar en la tabla de respaldo
    INSERT INTO BACKUP_GAME (id_game_backup, name_backup, description_backup, id_level_backup, id_class_backup)
    VALUES (OLD.id_game, OLD.name, OLD.description, OLD.id_level, OLD.id_class);
END;
//
DELIMITER ;

-- Desactivar restricciones de clave foránea
SET foreign_key_checks = 0;

-- Realizar la eliminación de los registros

-- Volver a activar restricciones de clave foránea
SET foreign_key_checks = 1;

delete from game where id_game = 3;
select * from backup_game;
select * from game;



		-- STORED PROCEDURES
-- un SP se ejecuta siempre del lado del servidor, y devuelve los datos filtrados y procesados al cliente que los solicitó.
--
--
--

-- Procedimientos Almacenados:
DROP PROCEDURE GetCompletedGamesCount;
-- Procedimiento almacenado para obtener el número de juegos completados por un usuario.
DELIMITER //
CREATE PROCEDURE GetCompletedGamesCount(IN userId INT)
BEGIN
    SELECT COUNT(*) FROM PLAY WHERE id_system_user = userId AND completed = true;
END//
DELIMITER ;

/*Este procedimiento almacenado acepta el ID de un usuario como parámetro y 
devuelve el número de juegos completados por ese usuario.*/

-- Llamar al procedimiento almacenado 'GetCompletedGamesCount' con el ID de un usuario.
CALL GetCompletedGamesCount(5); -- Reemplaza '1' con el ID del usuario que desees.        
        