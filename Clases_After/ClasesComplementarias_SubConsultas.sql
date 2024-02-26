		-- After Subconsultas

SELECT *
FROM GAME
WHERE id_game > all (SELECT id_game FROM VOTE WHERE value = 3 and id_game = 77);

SELECT id_game FROM VOTE WHERE value = 3;
select * from vote;


SELECT * FROM GAME
WHERE id_game IN (
    SELECT id_game
    FROM PLAY
    WHERE id_system_user IN (1, 2, 3)

);
select * from play;

 
SELECT id_game,id_system_user
FROM PLAY
WHERE id_system_user IN (1, 2, 3);

    

    

    

SELECT * FROM GAME
WHERE id_game = ANY (

    SELECT id_game
    FROM VOTE
    WHERE value > 3

);


select * from game;
select * from play;
select * from system_user;
select * from commentary;
-- 54 y 999

select * from play where id_game = all ( select id_game from game where id_game = 54)
and id_system_user = all (select id_system_user from system_user where id_system_user =999);

 

select * from commentary where id_commentary = all
 ( select id_commentary from commentary where id_commentary =1);
 
 
 select * from vote
where id_game in ( select id_game from game where id_game = 77) and id_system_user = any (
select id_system_user from system_user where id_system_user = 850);