			-- Practica con Vistas
            
-- Sobre el esquema gamers, crea las siguientes Vistas que:

-- Muestre first_name y last_name de los usuarios que tengan mail ‘webnode.com’
CREATE OR REPLACE VIEW datos_usuarios AS
SELECT first_name , last_name, email
FROM system_user
WHERE email LIKE "%webnode.com%";

-- Muestre todos los datos de los juegos que han finalizado.
CREATE OR REPLACE VIEW juegos_completados AS
SELECT P.id_game, P.id_system_user,P.completed, G.name, G.description
FROM play P
JOIN game G ON P.id_game = G.id_game
WHERE completed > 0 ;


-- Muestre los distintos juegos que tuvieron una votación mayor a 9.
CREATE OR REPLACE VIEW juegos_calificacion AS
SELECT DISTINCT  V.value, V.id_game , G.name, G.description
FROM vote V
JOIN game G on V.id_game = G.id_game
WHERE V.value > 9
ORDER BY V.id_game;

-- Muestre nombre, apellido y mail de los usuarios que juegan al juego FIFA 22.

CREATE OR REPLACE VIEW usuarios_fifa AS
SELECT G.name, G.description , SU.first_name, SU.last_name, SU.email
FROM play P
JOIN game G on G.id_game = P.id_game
JOIN system_user SU on P.id_system_user = SU.id_system_user
WHERE G.name LIKE "%FIFA 22%"; 
