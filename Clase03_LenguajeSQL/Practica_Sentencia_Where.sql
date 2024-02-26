-- Aplicaremos las consultas con la sentencia WHERE de la siguiente diapositiva; a la tabla SYSTEM_USER y discutiremos por Chat el resultado de cada una de las consultas:

select * from system_user;

SELECT * FROM system_user WHERE first_name = "Gillie"; -- trae todos los campos de la tabla donde first_name = x
SELECT first_name, last_name FROM system_user WHERE id_user_type = 334; -- trae los campos first_name y last_name donde el id sea 334
SELECT first_name, last_name FROM system_user WHERE id_system_user = 56; -- trae los campos first_name y last_name donde el id sea 56
SELECT * FROM system_user WHERE first_name = "Reinaldos"; -- trae todos los campos donde firs_name = x 
