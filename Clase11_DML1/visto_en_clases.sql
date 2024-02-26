use gammers;

select * from pay;
-- cambiar date_pay por CURRENT_DATE con alter table
-- INSTERT
-- Inserción de registros
INSERT INTO pay VALUES (NULL, 250, "U$S", 
"2021-07-22", "Paypal", 850, 77);


-- Insertar datos parciales
INSERT INTO pay 
(id_pay, amount, currency, date_pay, id_system_user, id_game) 
VALUES ( NULL, 300, "U$S", "2021-07-22", 501, 13);


-- Insertar múltiples datos

INSERT INTO pay VALUES 
(NULL, 250, 'U$S', '2021-07-22', 'Paypal', 850, 77),
(NULL, 3700, 'Pesos Arg', '2021-07-22', 'Visa', 38, 31),
(NULL, 180, 'Libras', '2021-07-22', 'Transfer', 175, 16);


-- UPDATE
-- Actualizar registros
-- UPDATE nombre_de_la_tabla SET campo1 = ‘dato1’, campo2 = ‘dato2’, campo3 = ‘dato3’;

-- Actualizar datos que cumplan determinada condición
-- UPDATE pay SET date_pay = CURRENT_DATE - 1 WHERE date_pay = CURRENT_DATE;

-- DELETE
-- Eliminar registros
-- DELETE FROM nombre_de_la_tabla WHERE (campo = ‘dato’);


-- Eliminación total de registros de una tabla
-- TRUNCATE nombre_de_la_tabla;