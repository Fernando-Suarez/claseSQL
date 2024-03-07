-- 			Ejemplo pasado por el profe

SET AUTOCOMMIT = 0;
SET FOREIGN_KEY_CHECKS = 0;

-- Crear la Database
CREATE DATABASE IF NOT EXISTS clientes;

-- Usar la Database
USE clientes;

-- Tabla para almacenar información de los clientes
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50)
);

-- Tabla para almacenar información de las tarjetas de credito
CREATE TABLE tarjeta_credito (
    id_tar_cred INT PRIMARY KEY,
    id_cliente INT,
    saldo DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT saldo_no_negativo CHECK (saldo >= 0)
);

-- Tabla para almacenar información de las tarjetas de débito
CREATE TABLE tarjeta_debito (
    id_tar_deb INT PRIMARY KEY,
    id_cliente INT,
    saldo DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT saldo_noo_negativo CHECK (saldo >= 0)
);

-- Tabla para almacenar transacciones entre cuentas
CREATE TABLE transacciones (
    id_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    cuenta_envio INT,
    cuenta_destino INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cuenta_envio) REFERENCES tarjeta_debito(id_tar_deb) ON DELETE CASCADE,
    FOREIGN KEY (cuenta_destino) REFERENCES tarjeta_debito(id_tar_deb) ON DELETE CASCADE
);

-- Insertar registros en la tabla cliente
INSERT INTO cliente (id_cliente, nombre, apellido) VALUES
(1, 'Juan', 'Perez'),
(2, 'Maria', 'Gonzalez'),
(3, 'Pedro', 'Rodriguez'),
(4, 'Ana', 'Martinez'),
(5, 'Carlos', 'Lopez'),
(6, 'Laura', 'Sanchez'),
(7, 'Javier', 'Diaz'),
(8, 'Sofia', 'Hernandez'),
(9, 'Diego', 'Moreno'),
(10, 'Elena', 'Jimenez');

-- Insertar registros en la tabla tarjeta_credito
INSERT INTO tarjeta_credito (id_tar_cred, id_cliente, saldo) VALUES
(101, 1, 1500.00),
(102, 2, 2000.00),
(103, 3, 1800.00),
(104, 4, 2200.00),
(105, 5, 2500.00),
(106, 6, 1900.00),
(107, 7, 1700.00),
(108, 8, 2300.00),
(109, 9, 2100.00),
(110, 10, 2400.00);

-- Insertar registros en la tabla tarjeta_debito
INSERT INTO tarjeta_debito (id_tar_deb, id_cliente, saldo) VALUES
(201, 1, 300.00),
(202, 2, 500.00),
(203, 3, 800.00),
(204, 4, 600.00),
(205, 5, 900.00),
(206, 6, 700.00),
(207, 7, 400.00),
(208, 8, 1000.00),
(209, 9, 1200.00),
(210, 10, 1500.00);