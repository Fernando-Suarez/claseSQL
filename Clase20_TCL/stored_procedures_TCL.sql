DELIMITER //
CREATE PROCEDURE sp_transaccion_debito2(
IN id_cuenta_envio INT,
IN id_cuenta_destino INT,
IN monto DECIMAL(10,2))

BEGIN 
	DECLARE EXIT HANDLER FOR SQLEXCEPTION -- DECLARE HANDLER CREA UN MANEJADOR DE ERRORES PARA MANEJAR LA EXCEPCIONES
BEGIN  -- se inicia el handler
	ROLLBACK;   -- aqui va lo que queremos hacer con el error
	RESIGNAL;
 END; -- se finaliza el handler
    START TRANSACTION;
	-- INSERT EN LA TABLA TRANSACCIONES
    INSERT INTO transacciones (id_transaccion,cuenta_envio,cuenta_destino) VALUES (0,id_cuenta_envio,id_cuenta_destino);
	-- ACTUALIZAR MONTO EN LA TARJETA DE CREDITO 
    UPDATE tarjeta_credito SET saldo = saldo - monto WHERE id_tar_cred = id_cuenta_envio; 
    -- ACTUALIZAR MONTO EN LA TARJETA DE DEBITO
	UPDATE tarjeta_debito SET saldo = saldo + monto WHERE id_tar_deb = id_cuenta_destino;
COMMIT;
END //
DELIMITER ;
use clientes;

CALL sp_transaccion_debito2(101,201,100);
