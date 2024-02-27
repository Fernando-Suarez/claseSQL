-- Vistas

create view detallesDeVentas as
select V.id_venta,fecha,V.id_producto,precio_unitario,cantidad,total_gastado 
from (ventas V 
inner join pagos P on P.id_venta = V.id_venta)
inner join detalle_venta D on D.id_venta = V.id_venta;

create view stockProducto as
select P.id_producto, P.nombre,S.cantidad, P.id_proveedores
from productos P
inner join stock S on S.id_producto = P.id_producto
where P.activo <> 0;

create view ventasEmpleado as
select V.id_venta, fecha, V.id_empleado,nombre,apellido
from ventas V
inner join empleados on empleados.id_empleado = V.id_empleado;

create view productosCategorias as
select P.id_producto,P.nombre as nombre_producto ,id_proveedores,C.nombre,C.id_categoria
from productos P
inner join categorias C on C.id_categoria = P.id_categoria;


create view productosFaltantes as
select P.id_producto, P.nombre  ,S.cantidad, P.id_proveedores, activo
from productos P
inner join stock S on S.id_producto = P.id_producto
where P.activo = 0;



