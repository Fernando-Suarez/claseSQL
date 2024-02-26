-- Clase 04
-- Prácticas con operadores
select * from game;
-- Resolver las siguientes consultas:
-- Todos los comentarios sobre juegos desde 2019 en adelante.
select * from commentary where comment_date >= "2019-01-01";
-- Todos los comentarios sobre juegos anteriores a 2011.
select * from commentary where comment_date < "2011-01-01";
-- Los usuarios y texto de aquellos comentarios sobre juegos cuyo código de juego (id_game) sea 73
select id_system_user, commentary , id_game from commentary where id_game = 73; 
-- Los usuarios y texto de aquellos comentarios sobre juegos cuyo id de juego no sea 73.
select id_system_user , commentary , id_game from commentary where id_game != 73;
-- Aquellos juegos de nivel 1.
select * from game where id_level = 1;
-- Aquellos juegos sean de nivel 14, 5 ó 9.
select * from game where id_level in (14,5,9);
-- Aquellos juegos de nombre 'Riders Republic' o 'The Dark Pictures: House Of Ashes'.
select * from game where name = "Riders Republic" or name = "The Dark Pictures: House Of Ashes";
-- Aquellos juegos cuyo nombre empiece con 'Gran'.
select * from game where name like "Gran%";
-- Aquellos juegos cuyo nombre contenga 'field'.
select * from game where name like "%field%"