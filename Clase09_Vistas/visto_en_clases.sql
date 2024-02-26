-- Vista 1: Juego con información de nivel y clase

 
select * from class;
CREATE OR REPLACE view GameDetails AS
SELECT  G.name, G.description AS game_description,
LG.description AS level_description, C.description AS class_description
FROM GAME G
JOIN LEVEL_GAME LG ON G.id_level = LG.id_level
JOIN CLASS C ON G.id_class = C.id_class AND G.id_level = C.id_level;

 

select * from gamedetails 
order by name;



-- Vista 2: Comentarios detallados con información de usuarios

CREATE VIEW CommentDetails AS

SELECT CO.id_game, CO.id_system_user, CO.comment_date, CO.commentary,

       SU.primer_nombre, SU.last_name, SU.email

FROM COMMENTARY CO

JOIN SYSTEM_USER SU ON CO.id_system_user = SU.id_system_user;

select * from commentdetails;


-- Vista 3: Votaciones con información de juegos y usuarios
CREATE VIEW VoteDetails AS

SELECT V.id_vote, V.value, V.id_game, V.id_system_user,

       G.name AS game_name, SU.primer_nombre, SU.last_name, SU.email

FROM VOTE V

JOIN GAME G ON V.id_game = G.id_game

JOIN SYSTEM_USER SU ON V.id_system_user = SU.id_system_user;

 

 

-- Vista 4: Sugerencias con detalles de juego y usuario
CREATE VIEW SuggestDetails AS

SELECT S.id_suggest, S.id_game, S.id_system_user,

       G.name AS game_name, SU.primer_nombre, SU.last_name, SU.email

FROM SUGGEST S

JOIN GAME G ON S.id_game = G.id_game

JOIN SYSTEM_USER SU ON S.id_system_user = SU.id_system_user;



-- Vista 5: Jugadas completadas con detalles
CREATE VIEW CompletedPlays AS

SELECT P.id_game, P.id_system_user, P.completed,

       G.name AS game_name, SU.primer_nombre, SU.last_name, SU.email

FROM PLAY P

JOIN GAME G ON P.id_game = G.id_game

JOIN SYSTEM_USER SU ON P.id_system_user = SU.id_system_user;

 

select * FROM completedplays where completed = 1;



-- Vista 6: Detalles de usuarios con tipos de usuario
CREATE VIEW UserDetailsWithType AS

SELECT SU.id_system_user, SU.first_name, SU.last_name, SU.email, UT.description AS user_type

FROM SYSTEM_USER SU

JOIN USER_TYPE UT ON SU.id_user_type = UT.id_user_type;


-- Vista 7: Comentarios recientes con detalles de juego y usuario
CREATE VIEW RecentComments AS

SELECT CO.id_game, CO.id_system_user, CO.comment_date, CO.commentary,

       G.name AS game_name, SU.first_name, SU.last_name, SU.email

FROM COMMENTARY CO

JOIN GAME G ON CO.id_game = G.id_game

JOIN SYSTEM_USER SU ON CO.id_system_user = SU.id_system_user

WHERE CO.comment_date = (SELECT MAX(comment_date) FROM COMMENTARY WHERE id_game = CO.id_game);