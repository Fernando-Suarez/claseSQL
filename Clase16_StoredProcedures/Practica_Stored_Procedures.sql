--   			PRACTICA SQL STORED PROCEDURES


-- Crea un Stored Procedure que inserte datos en una tabla
-- Debe recibir un parámetro del tipo char(xx)
-- Inserta dicho parámetro como un nuevo registro en la tabla
-- Ejecuta luego, un SELECT sobre la tabla ordenada de forma descendente, para ver el registro insertado en primer lugar
-- Si el parámetro char() recibido es igual a ‘’, devuelve un error que diga  ‘ERROR: no se pudo crear el producto indicado’
USE GAMMERS ;

CREATE TABLE CARACTERES	(
ID_CARACTER INT PRIMARY KEY AUTO_INCREMENT,
CARACTER CHAR);
SELECT * FROM CARACTERES;

DELIMITER //
CREATE PROCEDURE sp_insertar_datos(IN i_caracter CHAR)
BEGIN
	IF i_caracter <> '' THEN
		INSERT INTO CARACTERES(caracter) VALUES (i_caracter);
    ELSE 
		SELECT "ERROR: no se pudo crear el producto indicado";
    END IF;
END //
DELIMITER ;

CALL sp_insertar_datos('');