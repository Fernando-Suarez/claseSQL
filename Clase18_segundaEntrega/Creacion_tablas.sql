-- DROP DATABASE comercio;
-- Creacion de la base de datos
CREATE DATABASE IF NOT EXISTS comercio;

-- Uso de la Base de Datos
USE comercio;

-- Creacion de la Tabla Clientes
CREATE TABLE IF NOT EXISTS clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30) ,
apellido VARCHAR(30) ,
email VARCHAR(30),
telefono VARCHAR(30));

-- Creacion de la Tabla Categorias
CREATE TABLE IF NOT EXISTS categorias(
id_categoria INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30));

-- Creacion de la Tabla Proveedores
CREATE TABLE IF NOT EXISTS proveedores(
id_proveedores INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
email VARCHAR(40),
telefono VARCHAR(30));

-- Creacion de la Tabla Productos
CREATE TABLE IF NOT EXISTS productos(
id_producto INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40),
descripcion VARCHAR(250),
precio DECIMAL(7,2),
id_proveedores INT,
id_categoria INT,
activo BIT,
FOREIGN KEY (id_proveedores) REFERENCES proveedores(id_proveedores) ON UPDATE CASCADE,
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria) ON UPDATE CASCADE);

-- Creacion de la Tabla Empleados
CREATE TABLE IF NOT EXISTS empleados(
id_empleado INT PRIMARY KEY AUTO_INCREMENT ,
nombre VARCHAR(30),
apellido VARCHAR(30),
cargo VARCHAR(30),
activo BIT);

-- Creacion de la Tabla Stock
CREATE TABLE IF NOT EXISTS stock(
id_stock INT PRIMARY KEY AUTO_INCREMENT ,
cantidad INT,
id_proveedores INT,
id_producto INT,
FOREIGN KEY (id_proveedores) REFERENCES proveedores(id_proveedores) ON UPDATE CASCADE,
FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON UPDATE CASCADE);

-- Creacion de la Tabla Sucursal
CREATE TABLE IF NOT EXISTS sucursal (
id_sucursal INT PRIMARY KEY AUTO_INCREMENT ,
nombre VARCHAR(30) NOT NULL,
domicilio VARCHAR(30));

-- Creacion de la Tabla Caja
CREATE TABLE IF NOT EXISTS cajas (
id_caja INT PRIMARY KEY AUTO_INCREMENT,
id_sucursal INT,
id_empleado INT,
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal) ON DELETE CASCADE,
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado));

  -- Creacion de la Tabla Pago
CREATE TABLE IF NOT EXISTS pagos (
id_pago INT PRIMARY KEY AUTO_INCREMENT,
total_gastado DECIMAL(10,2),
metodo_pago VARCHAR(20),
id_caja INT,
FOREIGN KEY (id_caja) REFERENCES cajas(id_caja)
);
 
 -- Creacion de la Tabla Detalle de Venta
 CREATE TABLE IF NOT EXISTS detalle_venta (
 id_detalle_venta INT PRIMARY KEY AUTO_INCREMENT,
 id_producto INT,
 cantidad INT,
 precio_producto DECIMAL(7,2),
 id_pago INT, 
 FOREIGN KEY (id_producto) REFERENCES productos(id_producto) ON UPDATE CASCADE,
 FOREIGN KEY (id_pago) REFERENCES pagos(id_pago));

 
 -- Creacion de la Tabla Ventas
CREATE TABLE IF NOT EXISTS ventas(
id_venta INT PRIMARY KEY AUTO_INCREMENT ,
id_cliente INT,
id_producto INT,
id_empleado INT,
id_pago INT,
id_detalle_venta INT,
fecha TIMESTAMP,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ,
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado) ,
FOREIGN KEY (id_pago) REFERENCES pagos(id_pago) ,
FOREIGN KEY (id_detalle_venta) REFERENCES detalle_venta(id_detalle_venta) 
 );
 
 
 -- Creacion de la Tabla Ventas_log
 CREATE TABLE IF NOT EXISTS ventas_log(
id_venta INT PRIMARY KEY ,
id_cliente INT,
id_producto INT,
id_empleado INT,
id_pago INT,
id_detalle_venta INT,
fecha TIMESTAMP,
fecha_eliminacion TIMESTAMP ,
usuario_eliminacion VARCHAR(50));

-- Creacion de la Tabla Clientes_log
CREATE TABLE IF NOT EXISTS clientes_log(
id_cliente INT PRIMARY KEY,
nombre VARCHAR(30) ,
apellido VARCHAR(30) ,
email VARCHAR(30),
telefono VARCHAR(30),
fecha_eliminacion TIMESTAMP,
usuario_eliminacion VARCHAR(50));
 

 
