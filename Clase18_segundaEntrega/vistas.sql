-- Vistas

create view v_ventas as
select V.id_venta, C.nombre as nombre_cliente, C.apellido as apellido_cliente, P.nombre as nombre_producto, E.nombre as nombre_empleado,E.apellido as apellido_empleado, pagos.total_gastado,V.fecha
From ventas V
inner join clientes C on V.id_cliente = C.id_cliente
inner join productos P on V.id_producto = P.id_producto
inner join empleados E on V.id_empleado = E.id_empleado
inner join pagos on V.id_pago = pagos.id_pago;

create view v_stock_producto as
select P.id_producto, P.nombre,S.cantidad, P.id_proveedores
from productos P
inner join stock S on S.id_producto = P.id_producto
where P.activo <> 0;

create view v_ventas_empleado as
select V.id_venta, fecha, V.id_empleado,nombre,apellido
from ventas V
inner join empleados on empleados.id_empleado = V.id_empleado;

create view v_producto_categorias as
select P.id_producto,P.nombre as nombre_producto ,id_proveedores,C.nombre,C.id_categoria
from productos P
inner join categorias C on C.id_categoria = P.id_categoria;


create view v_productos_faltantes as
select P.id_producto, P.nombre  ,S.cantidad, P.id_proveedores, activo
from productos P
inner join stock S on S.id_producto = P.id_producto
where P.activo = 0;





