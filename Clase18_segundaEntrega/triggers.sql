					-- TRIGGERS
DELIMITER //
CREATE TRIGGER t_ventas_delete
BEFORE DELETE ON ventas
FOR EACH ROW
BEGIN
	INSERT INTO ventas_log (id_venta,id_cliente,id_producto,id_empleado,id_pago,id_detalle_venta,fecha,fecha_eliminacion,usuario_eliminacion) 
    VALUES (OLD.id_venta, OLD.id_cliente, OLD.id_producto, OLD.id_empleado,OLD.id_pago,OLD.id_detalle_venta,OLD.fecha, now(), user());
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


