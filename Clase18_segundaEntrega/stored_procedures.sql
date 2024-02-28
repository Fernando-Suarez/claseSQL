-- stored procedures

create procedure SPbajaProducto
@id int
as
begin



DELIMITER //
CREATE PROCEDURE SP_cambio_estado(
IN field CHAR(25),
IN id INT,
IN activo BIT)
BEGIN
    update alumno set activo=0
	where id_producto = id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_Registrar_Detalle_Venta(
IN p_id_producto INT,
IN p_cantidad INT,
IN p_id_venta INT
)
BEGIN
	DECLARE v_precio DECIMAL(7, 2);
    DECLARE v_stock INT;

	-- Obtener el precio actualizado del producto
	SELECT precio INTO v_precio
	FROM productos
	WHERE id_producto = p_id_producto;

	-- Obtener stock actualizado del producto
    SELECT cantidad INTO v_stock
    FROM stock
    WHERE id_producto = p_id_producto;



	-- Descontar el stock del producto
    IF v_stock > p_cantidad THEN
		UPDATE stock
		SET cantidad = cantidad - p_cantidad
		WHERE id_producto = p_id_producto;
        	-- Crear la factura del  detalle_venta
	INSERT INTO detalle_venta (id_producto, cantidad, precio_unitario, id_venta)
	VALUES (p_id_producto , p_cantidad, v_precio , p_id_venta);
		SELECT 'Detalle de Venta registrado exitosamente.' AS mensaje;
    ELSE
		SELECT 'No hay stock suficiente' AS mensaje;
    END IF;
END //
DELIMITER ;

CALL sp_Registrar_Detalle_Venta(79, 50 ,50);