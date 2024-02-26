-- Inserción y actualización de tablas
-- Descripción de la actividad. 
-- Basado en las tablas creadas con el Diagrama E-R de la clase 7, insertar al menos 2 registros en cada tabla.
-- Luego de realizado, elige una tabla y modifica al menos el dato de 1 registro insertado.

use comercio;
select * from clientes;

INSERT INTO categorias VALUES (null,"Bebidas"),(null,"Fiambres");

INSERT INTO clientes VALUES (null,"Fernando","Suarez","hola@gmail.com", "2657456789"),(null,"Fernando","Gomez","hola@gmail.com", "2657456788");

INSERT INTO empleados VALUES (null,"Carlos","Perez","Empleado"),(null,"Carmen","Gonzales","Empleado");

INSERT INTO proveedores VALUES (null,"Coca Cola","cocacola@gmail.com", 12345),(null,"Paladini","paladini@gmail.com",456321);

INSERT INTO productos VALUES (null,"Fanta","Bebida a base de zumo de naranja",2000,50,1,1),(null,"Mortadela","Mortadela Paladini",2000,40,2,2);

INSERT INTO ventas VALUES (null,4000,"2024-01-10",1,3,1),(null,5000,"2024-01-10",2,4,2);

UPDATE clientes SET nombre = "Jorge" WHERE id_cliente = 1;

