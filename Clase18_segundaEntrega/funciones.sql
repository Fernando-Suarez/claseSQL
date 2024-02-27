				--     FUNCIONES
                
DELIMITER //
CREATE FUNCTION venta_mas_alta() RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
	DECLARE venta DECIMAL(10,2);
    SELECT max(total_gastado) INTO venta FROM comercio.pagos;
    RETURN venta;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION ventas_por_empleado(id int) RETURNS int DETERMINISTIC
BEGIN
	DECLARE cantidad_ventas int;
    SELECT COUNT(*) into cantidad_ventas FROM ventasempleado where id_empleado = id;
    RETURN cantidad_ventas;
END //
DELIMITER ;

