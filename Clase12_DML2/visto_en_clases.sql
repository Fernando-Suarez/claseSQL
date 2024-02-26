			-- DML SUBCONSULTAS
            
CREATE TABLE new_class (
id_level int NOT NULL,
id_class int NOT NULL,
description varchar(200) NOT NULL,
PRIMARY KEY (id_class,id_level)
);

 

CREATE TABLE new_level_game ( 
id_level int NOT NULL,
description varchar(200) NOT NULL,
PRIMARY KEY (id_level)
);


SELECT * FROM new_class;
SELECT * FROM new_level_game;
SELECT * FROM level_game;


INSERT INTO new_class (id_level, id_class, description) VALUES (17, 10, 'Adventure Other'),
(15, 1, "Spy Other"),
(17, 20, "British Comedy"),
(17, 30, "Adventure"),
(14, 1,""),
(18,1,"");

INSERT INTO new_level_game (id_level, description)  
SELECT DISTINCT id_level, concat('New level',id_level) 
FROM new_class 
WHERE id_level NOT IN (
    SELECT id_level 
    FROM level_game
);




CREATE TABLE PLAY_INCOMPLETED
(SELECT * FROM PLAY WHERE completed = 0);

select * from play;

select * from PLAY_INCOMPLETED;

drop table play_incompleted;

 

CREATE view  v_PLAY_INCOMPLETED as
SELECT * FROM PLAY WHERE completed = 0;

select * from v_play_incompleted;
drop view v_play_incompleted;


select * from new_class;
select * from new_level_game;

UPDATE new_class SET id_level = 20 
WHERE id_level IN (SELECT id_level FROM new_level_game);

-- Restaura el modo seguro de actualización a su valor original
-- SET SQL_SAFE_UPDATES = 1;


SET SQL_SAFE_UPDATES = 0;

DELETE FROM NEW_CLASS
WHERE id_level NOT IN (SELECT id_level FROM NEW_LEVEL_GAME);

SELECT * FROM NEW_LEVEL_GAME,new_class;

select * from new_class;

 

-- Restaura el modo seguro de actualización a su valor original

SET SQL_SAFE_UPDATES = 1;