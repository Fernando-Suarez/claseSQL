use mysql;

select * from user;

-- CREAR EL USUARIO						ASIGNAR LA CONTRASEÑA
CREATE USER "gabybertella"@"localhost" IDENTIFIED BY "123456";
CREATE USER "fernandosuarez"@"localhost" IDENTIFIED BY "1234";

-- DARLE PRIVILEGIOS AL USUARIO 

GRANT SELECT, CREATE, INSERT ON *.* TO "gabybertella"@"localhost";
-- GRANT   	ALL PRIVILEGES  ON   *.*  TO USER;
-- 			INSTERT
-- 			CREATE
-- 			UPDATE
-- 			DELETE
-- 			DROP
-- 			GRANT OPTION

GRANT SELECT ON *.* TO "fernandosuarez"@"localhost";

-- Revocarle permisos a un usuario
-- REVOKE  	SELECT			ON   BASEDEDATOS   TO    USUARIO;
-- 			INSTERT
-- 			CREATE
-- 			UPDATE
-- 			DELETE
-- 			DROP
-- 			GRANT OPTION
REVOKE CREATE ON *.* FROM "gabybertella"@"localhost";

-- Cambiar nombre de usuario
RENAME USER "gabybertella"@"localhost" TO "tutorgabybertella"@"localhost";

-- Cambiar contraseña a un usario
ALTER USER "gabybertella"@"localhost" IDENTIFIED BY "12345";

-- Eliminar usuario

DROP USER "fernando"@"suarez";

-- Ver los permisos otorgados
SHOW GRANTS FOR "tutorgabybertella"@"localhost";

-- Otorgar permisos sobre una columna
GRANT SELECT (id_level) ON gammers.class TO "fernandosuarez"@"localhost";
