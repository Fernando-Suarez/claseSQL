						-- SUBLENGUAJE TCL (TRANSACTION CONTROL LENGUAGE)
DROP TABLE IF EXISTS equipos;
-- crear tabla
CREATE TABLE equipos(
id INT,
nombre VARCHAR(20));


SELECT * FROM equipos;

-- set autocommit = 0; en caso de que no funcione el rollback por el autocommit = 1 por defecto del workbench


-- 									ROLLBACK Y COMMIT
START TRANSACTION;  -- comienza con la transacion, utilizar antes de la consulta dml para poder utilizar rollback , commit y savepoint

INSERT INTO equipos(id,nombre) VALUES (2,"River"); -- se hace la consulta dml

ROLLBACK; -- deshace lo ultimo si no se le indica con el TO siempre y cuando no se haga un commit primero

COMMIT; -- se fija el estado y se evita que se pueda volver.


-- 									SAVEPOINT

START TRANSACTION;

SAVEPOINT equipoA;
INSERT INTO equipos(id,nombre) VALUES (3,"Lanus"),(4,"Estudiantes"),(5,"Independiente");

SAVEPOINT equipoB;
INSERT INTO equipos(id,nombre) VALUES (6,"Racing"),(7,"Aldosivi"),(8,"Defensa y Justicia");

SAVEPOINT equipoC;
INSERT INTO equipos(id,nombre) VALUES (9,"Chacarita"),(10,"Velez"),(11,"Belgrano");

SELECT * FROM equipos;

ROLLBACK TO equipoC;  -- deshace desde el savepoint indicado hacia adelante;

-- COMMIT   -- elimina los savepoint y fija el estado actual para que no se pueda deshacer