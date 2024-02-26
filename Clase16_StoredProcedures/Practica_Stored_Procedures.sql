--   			PRACTICA SQL STORED PROCEDURES


-- Crea un Stored Procedure que inserte datos en una tabla
-- Debe recibir un parámetro del tipo char(xx)
-- Inserta dicho parámetro como un nuevo registro en la tabla
-- Ejecuta luego, un SELECT sobre la tabla ordenada de forma descendente, para ver el registro insertado en primer lugar
-- Si el parámetro char() recibido es igual a ‘’, devuelve un error que diga  ‘ERROR: no se pudo crear el producto indicado’