				-- Crear usuario y permisos sobre una DB
-- Utilizaremos la base de datos GAMERS para crear un nuevo usuario y le estableceremos determinados permisos.
-- ✔ Crea un usuario llamado coderhouse y asígnale lo mismo como contraseña.
-- ✔ Establece permisos de solo lectura de datos sobre la tabla GAME.
-- ✔ Establece permisos de lectura e inserción sobre la tabla CLASS.
-- ✔ Abre una nueva ventana de conexión e inicia sesión con este usuario.
-- ✔ Modifica un registro cualquiera de la tabla GAME y aplica los cambios.
-- ✔ Agrega un registro en la tabla CLASS.
-- ✔ Elimina este último registro agregado.

USE mysql;
SELECT * FROM USER;

-- ✔ Crea un usuario llamado coderhouse y asígnale lo mismo como contraseña.
CREATE USER "coderhouse"@"localhost" IDENTIFIED BY "coderhouse";

-- ✔ Establece permisos de solo lectura de datos sobre la tabla GAME.
GRANT SELECT ON gammers.game TO "coderhouse"@"localhost";

-- ✔ Establece permisos de lectura e inserción sobre la tabla CLASS.
GRANT SELECT,INSERT ON gammers.class TO "coderhouse"@"localhost";

-- ✔ Abre una nueva ventana de conexión e inicia sesión con este usuario.

-- ✔ Modifica un registro cualquiera de la tabla GAME y aplica los cambios.

-- ✔ Agrega un registro en la tabla CLASS.

-- ✔ Elimina este último registro agregado.


