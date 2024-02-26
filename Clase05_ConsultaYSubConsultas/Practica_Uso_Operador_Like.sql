 -- Uso del operador LIKE
-- Implementemos el uso del operador LIKE sobre las tablas GAME y SYSTEM_USER de nuestra base de datos GAMER

select * from game;
select * from system_user;
-- Aquellos usuarios cuyo nombre comience con la letra ‘J’
select * from system_user where first_name like "J%";
-- Aquellos usuarios cuyo apellido contenga la letra ‘W’
select * from system_user where last_name like "%W%";
-- Aquellos usuarios cuyo nombre contenga la letra ‘i’ en segundo lugar
select * from system_user where first_name like "_i%";
-- Aquellos usuarios cuyo nombre finalice con la letra ‘k’
select * from system_user where first_name like "%k";
-- Aquellos usuarios cuyo nombre no incluya las letras ‘ch’
select * from system_user where first_name regexp '[^ch]';
-- Aquellos usuarios cuyo nombre solo incluya las letras ‘ch’
select * from system_user where first_name like '%ch%';
