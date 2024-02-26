			--  Actualización y Eliminación de datos
            
-- Crear la tabla de Empleados
-- Restriccion Parcial
CREATE TABLE Empleados (

    EmpleadoID INT PRIMARY KEY,

    Nombre VARCHAR(50) NOT NULL,

    Edad INT CHECK (Edad >= 18 AND Edad <= 65),

    Departamento VARCHAR(50) NOT NULL,

    UNIQUE (EmpleadoID)

);

select * from empleados;

 
INSERT INTO Empleados (EmpleadoID, Nombre, Edad, Departamento)

VALUES (1, 'Juan Pérez', 30, 'Ventas');

 
INSERT INTO Empleados (EmpleadoID, Nombre, Edad, Departamento)

VALUES (2, 'María García', 18, 'Contabilidad');


-- -------------------------------------------------------------------------------

-- Tabla de Marcas

CREATE TABLE Marcas (

    MarcaID INT PRIMARY KEY,

    NombreMarca VARCHAR(50) NOT NULL UNIQUE

);

 

-- Tabla de Modelos

CREATE TABLE Modelos (

    ModeloID INT PRIMARY KEY,

    NombreModelo VARCHAR(50) NOT NULL UNIQUE,

    MarcaID INT,

    FOREIGN KEY (MarcaID) REFERENCES Marcas(MarcaID) ON DELETE CASCADE,

    CHECK (MarcaID IS NOT NULL) -- Asegura que el Modelo tenga una Marca asociada

);

 

-- Tabla de Autos

CREATE TABLE Autos (

    AutoID INT PRIMARY KEY,

    NombreAuto VARCHAR(50) NOT NULL,

    ModeloID INT,

    FOREIGN KEY (ModeloID) REFERENCES Modelos(ModeloID) ON DELETE SET NULL

);

-- Inserción de datos en la tabla de Marcas

INSERT INTO Marcas (MarcaID, NombreMarca) VALUES

(1, 'Toyota'),

(2, 'Ford'),

(3, 'Honda'),

(4, 'Chevrolet'),

(5, 'Volkswagen'),

(6, 'Nissan'),

(7, 'BMW'),

(8, 'Mercedes-Benz'),

(9, 'Audi'),

(10, 'Hyundai');

 

-- Inserción de datos en la tabla de Modelos

INSERT INTO Modelos (ModeloID, NombreModelo, MarcaID) VALUES 

(101, 'Corolla', 1),

(102, 'Camry', 1),

(103, 'F-150', 2),

(104, 'Civic', 3),

(105, 'Accord', 3),

(106, 'Malibu', 4),

(107, 'Cruze', 4),

(108, 'Jetta', 5),

(109, 'Altima', 6),

(110, 'Sentra', 6);


 -- Inserción de datos en la tabla de Autos

INSERT INTO Autos (AutoID, NombreAuto, ModeloID) VALUES

(1001, 'Toyota Corolla Azul', 101),

(1002, 'Ford F-150 Rojo', 103),

(1003, 'Honda Accord Plateado', 105),

(1004, 'Chevrolet Cruze Negro', 107),

(1005, 'Volkswagen Jetta Blanco', 108),

(1006, 'Nissan Altima Gris', 109),

(1007, 'BMW 3 Series Verde', NULL), -- Modelo no especificado

(1008, 'Mercedes-Benz C-Class Amarillo', NULL),

(1009, 'Audi A4 Azul', NULL),

(1010, 'Hyundai Sonata Rojo', 110);


-- Acciones con Restriccion de Integridad -----

-- Eliminar una Marca y observar el efecto en cascada

DELETE FROM Marcas WHERE MarcaID = 3;

 

-- Eliminar un Modelo y observar el efecto en SET NULL

DELETE FROM Modelos WHERE ModeloID = 105;



-- ---------------------------------------------------------------------------------------------

CREATE TABLE PAIS (
 pais_id INT PRIMARY KEY, 
nombre_pais VARCHAR(58) );

 

CREATE TABLE PERSONAS ( 
persona_id INT PRIMARY KEY, 
nombre_completo VARCHAR(60), 
pais_id INT);

 

select * from personas;

select * from pais;


ALTER TABLE PERSONAS ADD CONSTRAINT FK_PERSONAS_PAIS

FOREIGN KEY (pais_id) REFERENCES PAIS(pais_id) ON DELETE CASCADE;

INSERT INTO PAIS (pais_id, nombre_pais)
VALUES (1, 'España'),
(2, 'Italia'),
(3, 'Argentina'),
(4, 'Albania'),
(5, 'Brasil');

 

INSERT INTO PERSONAS (persona_id, nombre_completo, pais_id)
VALUES (1, 'Fernando Orar', 3),
(2, 'Julián Conte', 3),
(3, 'Nicolás Mariano', 1),
(4, 'Laura Grisel', 2),
(5, "Constantino Pascual", 4);


DELETE FROM PAIS WHERE pais_id = 3;


ALTER TABLE PERSONAS ADD CONSTRAINT FK_PERSONAS_PAIS
FOREIGN KEY (pais_id) REFERENCES PAIS(pais_id) ON DELETE RESTRICT;

ALTER TABLE PERSONAS
ADD CONSTRAINT FK_PERSONAS_PAIS
FOREIGN KEY (pais_id) REFERENCES PAIS(pais_id) ON DELETE NO ACTION;

ALTER TABLE PERSONAS
DROP FOREIGN KEY FK_PERSONAS_PAIS;