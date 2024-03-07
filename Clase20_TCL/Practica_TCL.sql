								-- Modificaciones controladas mediante transacciones
-- CONSIGNAS :
-- Trabajaremos con la tabla PAY de la DB GAMERS
-- Abrir una nueva pestaña script y elimina tres pagos de los que insertamos en la filmina 49,  iniciando una transacción.
-- Validar en otra pestaña script, los registros eliminados.
-- A continuación, en la primera pestaña de script, revertir la eliminación de pagos.
-- En la tabla pagos, insertar un lote de 15 pagos, iniciando previamente la transacción y estableciendo un savepoint luego del registro #5, y otro luego del registro #10
-- Validar en otra pestaña script, los registros insertados
-- Eliminar el segundo savepoint
-- Confirmar la transacción y vuelve a validar en otra pestaña script los registros insertados.


-- SOLUCIONES :

-- Trabajaremos con la tabla PAY de la DB GAMERS
USE gammers;
-- Abrir una nueva pestaña script y elimina tres pagos de los que insertamos en la filmina 49,  iniciando una transacción.
START TRANSACTION;
DELETE FROM pay WHERE id_pay = 3;
DELETE FROM pay WHERE id_pay = 4;
DELETE FROM pay WHERE id_pay = 5;
-- Validar en otra pestaña script, los registros eliminados.
SELECT * FROM PAY;
-- A continuación, en la primera pestaña de script, revertir la eliminación de pagos.
ROLLBACK;
-- En la tabla pagos, insertar un lote de 15 pagos, iniciando previamente la transacción y estableciendo un savepoint luego del registro #5, y otro luego del registro #10
START TRANSACTION;
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (6,400,"Pesos Arg",current_date(),"Transfer",468,47);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (7,4000,"Pesos Arg",current_date(),"Transfer",469,48);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (8,4251,"Pesos Arg",current_date(),"Transfer",478,49);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (9,5452,"Pesos Arg",current_date(),"Transfer",500,50);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (10,4179,"Pesos Arg",current_date(),"Transfer",4,51);
SAVEPOINT pagos1;
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (11,489,"Pesos Arg",current_date(),"Transfer",69,55);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (12,10000,"Pesos Arg",current_date(),"Transfer",46,99);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (13,1000,"Pesos Arg",current_date(),"Transfer",68,12);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (14,7458,"Pesos Arg",current_date(),"Transfer",44,10);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (15,9356,"Pesos Arg",current_date(),"Transfer",39,5);
SAVEPOINT pagos2;
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (16,5428,"Pesos Arg",current_date(),"Transfer",22,30);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (17,4692,"Pesos Arg",current_date(),"Transfer",985,8);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (18,1011,"Pesos Arg",current_date(),"Transfer",471,22);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (19,23458,"Pesos Arg",current_date(),"Transfer",222,88);
INSERT INTO pay (id_pay,amount,currency,date_pay,pay_type,id_system_user,id_game) VALUES (21,1472,"Pesos Arg",current_date(),"Transfer",970,81);
-- Validar en otra pestaña script, los registros insertados
SELECT * FROM pay;
-- Eliminar el segundo savepoint
RELEASE SAVEPOINT pagos2;
-- Confirmar la transacción y vuelve a validar en otra pestaña script los registros insertados.
COMMIT;





