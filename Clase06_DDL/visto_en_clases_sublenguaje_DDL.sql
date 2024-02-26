    -- Sub lenguaje DDL
    
    -- En la primera clase aprendimos que SQL está conformado por cuatro sublenguajes aplicables en diferentes ámbitos de uso en la DB: DDL, DML, DCL, TCL
    -- El Lenguaje de Definición de Datos se ocupa de modificar la estructura de objetos de una DB.
    -- Las sentencias disponibles a través de DDL, son: CREATE, ALTER, DROP, TRUNCATE. 
    -- Con ellas creamos, modificamos, alteramos y eliminamos objetos.


-- CREATE
-- La sentencia CREATE cumple la función de crear nuevos objetos en la base de datos.

CREATE TABLE pay (
id_pay 			INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
amount 			REAL NOT NULL,
currency 		VARCHAR(20) NOT NULL,
date_pay 		DATE NOT NULL,
pay_type 		VARCHAR(50),
id_system_user INT NOT NULL,
id_game 		INT NOT NULL);

CREATE TABLE friend (
age INT NOT NULL,
email VARCHAR(30),
first_name VARCHAR(30),
last_name VARCHAR(30)
);

-- ALTER 
-- Con ella podemos agregar/quitar campos, modificar el tipo de datos de un campo y agregar o quitar índices.
-- ADD: es la acción que realizaremos sobre la tabla. En este caso, agregar un nuevo campo.

ALTER TABLE friends
ADD id_friend INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- Si deseamos modificar los valores para un campo existente, debemos reemplazar la instrucción ADD por MODIFY.

ALTER TABLE friend
MODIFY email VARCHAR(50) NOT NULL;

-- Otras operaciones con ALTER
-- RENAME COLUMN TO: podemos cambiar el nombre de una columna previamente definida.
ALTER  TABLE friends Rename column id_friend to id ;

-- RENAME TO: podemos cambiar el nombre inicial de una tabla por uno nuevo.
ALTER TABLE friend rename to friends;

-- DROP COLUMN: podemos eliminar una columna o campo.
ALTER TABLE friends DROP COLUMN age;


-- CLONAR TABLA
CREATE TABLE back_up_friends LIKE friends;


-- DROP
-- La sentencia DROP, del inglés “borrar”, nos permite eliminar una tabla.
use gammers;
drop table friends;


-- TRUNCATE
-- diferencia entre TRUNCATE y DELETE, es que TRUNCATE “limpia” absolutamente todos los datos de la tabla indicada mientras que DELETE acepta el parámetro WHERE, 
-- el cual puede especificar la eliminación de determinados registros y no de todos ellos.
-- La eficiencia de TRUNCATE pasa porque eliminar todos los datos a la vez, casi como si copiara la estructura de la tabla, eliminara la misma, y la volviera a crear.
-- DELETE, por su parte, se ocupa de eliminar uno a uno los registros de la tabla. Por ello es que DELETE tiene mayor lentitud que TRUNCATE

INSERT INTO friends (age)value(18);

use gammers;
TRUNCATE TABLE friends;


-- Al igual que lo visto con la sentencia DROP, las relaciones entre tablas son un factor dominante al momento del uso de TRUNCATE TABLE.
-- No podremos borrar datos que estén vinculados a otros datos de otra tabla


