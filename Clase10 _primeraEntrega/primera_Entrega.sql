-- Creacion de la base de datos
CREATE DATABASE IF NOT EXISTS comercio;

-- Uso de la Base de Datos
USE comercio;

-- Creacion de la Tabla Clientes
CREATE TABLE IF NOT EXISTS clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) ,
apellido VARCHAR(30) ,
email VARCHAR(30),
telefono INT);

-- Creacion de la Tabla Categorias
CREATE TABLE IF NOT EXISTS categorias(
id_categoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30));

-- Creacion de la Tabla Proveedores
CREATE TABLE IF NOT EXISTS proveedores(
id_proveedores INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30),
email VARCHAR(40),
telefono INT);

-- Creacion de la Tabla Productos
CREATE TABLE IF NOT EXISTS productos(
id_producto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(40),
descripcion VARCHAR(100),
precio DECIMAL(7,2),
id_proveedores INT,
id_categoria INT,
FOREIGN KEY (id_proveedores) REFERENCES proveedores(id_proveedores),
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria));

-- Creacion de la Tabla Empleados
CREATE TABLE IF NOT EXISTS empleados(
id_empleado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30),
apellido VARCHAR(30),
cargo VARCHAR(30));

-- Creacion de la Tabla Stock
CREATE TABLE IF NOT EXISTS stock(
id_stock INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
cantidad INT,
id_proveedores INT,
id_producto INT,
FOREIGN KEY (id_proveedores) REFERENCES proveedores(id_proveedores),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto));

-- Creacion de la Tabla Sucursal
CREATE TABLE IF NOT EXISTS sucursal (
id_sucursal INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(30) NOT NULL,
domicilio VARCHAR(30));

-- Creacion de la Tabla Caja
CREATE TABLE IF NOT EXISTS cajas (
id_caja INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_sucursal INT,
FOREIGN KEY (id_sucursal) REFERENCES sucursal(id_sucursal));

-- Creacion de la Tabla Ventas
CREATE TABLE IF NOT EXISTS ventas(
id_venta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
total_gastado DECIMAL(10,2),
fecha DATE,
id_cliente INT,
id_producto INT,
id_empleado INT,
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
 );
 
 -- Creacion de la Tabla Pago
CREATE TABLE IF NOT EXISTS pagos (
id_pago INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
total_gastado DECIMAL(10,2),
metodo_pago VARCHAR(20),
id_venta INT,
FOREIGN KEY (id_venta) REFERENCES ventas(id_venta));
 