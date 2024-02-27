					-- TRIGGERS
DELIMITER //
CREATE TRIGGER t_ventas_update
BEFORE UPDATE ON ventas
FOR EACH ROW
BEGIN
	INSERT INTO ventas_log (id_venta,fecha,id_cliente,id_producto,id_empleado,fecha_update,usuario_update) 
    VALUES (OLD.id_venta, OLD.fecha, OLD.id_cliente, OLD.id_producto, OLD.id_empleado, now(), user());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER t_clientes_delete
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
	INSERT INTO clientes_log (id_cliente,nombre,apellido,email,telefono,fecha_eliminacion,usuario_eliminacion) 
    VALUES (OLD.id_cliente, OLD.nombre, OLD.apellido, OLD.email,OLD.telefono,now(),user());
END //
DELIMITER ;


