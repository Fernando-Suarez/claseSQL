-- Practicas de agrupamiento
-- Partiendo de la tabla, debes determinar qué resultado obtendrás, implementando las consultas de la diapositiva siguiente.
-- Comentaremos los resultados en la clase, a través del sistema de chat.


select * from commentary;

SELECT * FROM commentary ORDER BY id_system_user desc; -- selecciona todos los campos de comentary y los ordena por id_system_user en forma descendente

SELECT * FROM commentary ORDER BY id_system_user LIMIT 3; -- selecciona todos los campos de commentary y los ordena de forma ascendente por defecto  con el limite de los 3 primeros 

SELECT COUNT(id_system_user ) AS comments, id_system_user -- selecciona los campos id_system_user, cuenta todas las filas de id_system_user y las renombra a comments de la tabla commentary, luego los agrupa por la cantidad de comentarios que tiene cada id_system_user
FROM commentary GROUP BY id_system_user ;

SELECT COUNT(id_system_user ) AS comments, id_system_user -- selecciona los campos id_system_user, cuenta todas las filas de id_system_user y las renombra a comments de la tabla commentary, luego los agrupa por la cantidad de comentarios que tiene cada id_system_user siempre que sea mayor de 3 comentarios
FROM commentary 
GROUP BY id_system_user 
HAVING comments > 2;
