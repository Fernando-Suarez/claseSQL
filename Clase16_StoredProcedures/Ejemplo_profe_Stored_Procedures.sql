DELIMITER //
CREATE PROCEDURE RegistrarVenta(
IN p_producto_id INT,
IN p_canal_venta VARCHAR(50),
IN p_cantidad INT,
IN p_vendedor_id INT
)
BEGIN

	DECLARE v_precio DECIMAL(10, 2);
	DECLARE v_ganancia DECIMAL(10, 2);
	DECLARE v_comision DECIMAL(10, 2); -- Declarar la variable primero

	-- Obtener el precio actualizado del producto

	SELECT precio INTO v_precio
	FROM Producto
	WHERE producto_id = p_producto_id;

	-- Crear la factura de venta
    
	INSERT INTO FacturaVenta (producto_id, canal_venta, cantidad, precio_unitario)
	VALUES (p_producto_id, p_canal_venta, p_cantidad, v_precio);

	-- Descontar el stock del producto

	UPDATE Producto
	SET stock = stock - p_cantidad
	WHERE producto_id = p_producto_id;

	-- Informar a logística para el despacho (suponiendo que hay una tabla Logistica)

	INSERT INTO Logistica (producto_id, cantidad, despacho_programado)
	VALUES (p_producto_id, p_cantidad, NOW());
    
    -- Registrar el movimiento en la tabla de LOG

	INSERT INTO LogMovimiento (producto_id, cantidad, tipo_movimiento, fecha)
	VALUES (p_producto_id, p_cantidad, 'Venta', NOW());

	-- Calcular la comisión del vendedor y asignarla

	SET v_comision = v_precio * 0.1; -- Asignar valor a la variable
	INSERT INTO Comisiones (vendedor_id, monto, fecha)
	VALUES (p_vendedor_id, v_comision, NOW());

	-- Registrar en el área contable la ganancia por venta

	SET v_ganancia = v_precio * p_cantidad - (v_comision * p_cantidad); -- Ganancia = (Precio * Cantidad) - Comisión
	INSERT INTO GananciaVenta (producto_id, ganancia, fecha)
	VALUES (p_producto_id, v_ganancia, NOW());

	-- Devolver un mensaje de éxito

	SELECT 'Venta registrada exitosamente.' AS mensaje;
END //
DELIMITER ;

CALL RegistrarVenta(123, 'telefónico', 5, 1001);