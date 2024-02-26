  --       FUNCIONES

  -- sintaxis
  
  --  						DETERMINISTIC
-- Se considera a una rutina como DETERMINISTIC (determinista) si esta produce el mismo tipo de resultado que el de sus parámetros de entrada.
-- Se utiliza comúnmente con cadena del texto (string) o procesamiento matemáticos, aunque no se limita solo a estos resultados.
  
  delimiter $$   -- delimitador
	CREATE FUNCTION f_Suma(num1 int, num2 int) RETURNS INT DETERMINISTIC    -- retorna un tipo de dato
    BEGIN   -- comienza la logica
		DECLARE suma INT;    -- se crea la variable
        SET suma = num1 + num2;   -- se inicializa la variable con SET
        RETURN suma;   -- se retorna el resultado
    END $$  -- termina la logica
    delimiter ;   -- se cierra el delimitador
    
SELECT f_cuenta(5,8) as Cuenta; -- usar la funcion


-- ----------------------------------------------------------

DELIMITER $$
CREATE FUNCTION contarcomentariosdejuego(gameId INT) RETURNS INT deterministic
BEGIN
    DECLARE commentCount INT;
    SELECT COUNT(*) INTO commentCount FROM COMMENT WHERE id_game = gameId;
    RETURN commentCount;
END$$
DELIMITER ;
select * from comment;

SELECT contarcomentariosdejuego(3);

-- -------------------------------------------------------------
delimiter //
create function fcomentario (idc int, idg int) returns varchar (100) deterministic
begin
     declare comentario varchar(100);
     select commentary into comentario from commentary 
     where id_commentary = idc and id_game = idg;
     return comentario;
end //
delimiter ;

select fcomentario (1,45) as comentario;

-- ------------------------------------------------------------------

DELIMITER $$
CREATE FUNCTION Juegoscompletados(userId INT) RETURNS INT READS SQL DATA DETERMINISTIC
BEGIN
    DECLARE completedGamesCount INT;
    SELECT COUNT(*) INTO completedGamesCount FROM PLAY WHERE id_system_user = userId AND completed = TRUE;
    RETURN completedGamesCount;
END$$
DELIMITER ;

SELECT Juegoscompletados(4);


-- ----------------------------------------------------------------------
-- 								READS SQL DATA
-- Se considera a una rutina como READS SQL DATA, cuando esta función sólo leerá datos de una base de datos.
-- No modificará datos a través de las cláusulas INSERT, UPDATE o DELETE, solo leerá información a través de la sentencia SELECT.

DELIMITER $$  
CREATE FUNCTION countVotesByGame(gameId INT) RETURNS INT READS SQL DATA DETERMINISTIC
BEGIN
    DECLARE voteCount INT;
    SELECT COUNT(*) INTO voteCount FROM VOTE WHERE id_game = gameId;
    RETURN voteCount;
END $$ 
DELIMITER ;

select countVotesByGame(3);

-- --------------------------------------------------------------------------
-- 							NO SQL
-- Se considera a una rutina como NO SQL, cuando esta no utiliza ningún tipo de llamada o invocación de datos a través del lenguaje SQL.
-- O sea, no se llama una sentencia SELECT, UPDATE, ni cualquier otra sentencia del tipo DML.

delimiter //
CREATE FUNCTION calcular_litros_de_pintura (largo INT, alto INT, total_manos INT) RETURNS FLOAT NO SQL
BEGIN
	DECLARE resultado FLOAT;
	DECLARE litro_x_m2 FLOAT;
	SET litro_x_m2 = 0.10;
	SET resultado = ((largo * alto) * total_manos) * litro_x_m2;
	RETURN resultado;
END //
delimiter ;

select calcular_litros_de_pintura(10, 3, 3) as litros_de_pintura ;