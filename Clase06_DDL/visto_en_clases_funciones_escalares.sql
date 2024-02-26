			-- FUNCIONES ESCALARES

-- FUNCIONES INTEGRADAS
-- Se clasifican bajo las siguientes categorías:
	-- Funciones de cadenas:
-- CONCAT - Fusiona cadenas de caracteres en un único bloque de datos.
SELECT concat(first_name, last_name)
AS complete_name
FROM system_user;

-- UCASE() / LCASE() - Convierte a mayúsculas o minúsculas (respectivamente) una cadena de texto.
SELECT UCASE(description) FROM class;
SELECT LCASE(description) FROM class;

-- REVERSE() - Revierte el orden de los caracteres de una cadena de texto.
SELECT REVERSE(description) FROM class;

-- buscar mas funciones string en : https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

-- Funciones numéricas.
SELECT (21 / 7) AS resultado;
-- log(), log2(), log10(): cálculo de logaritmos, base 2 y base 10.
-- round(): redondeo estándar de un número.
select round(15.4) as redondeo;
-- floor(): redondeo de un número hacia abajo.
select floor(15.75) as redonde_numero_hacia_abajo;
-- ceiling(): redondeo de un número hacia arriba.
select ceiling(15.75) as redondeo_hacia_arriba;
-- truncate(): elimina los decimales de un número.
select truncate(15.789456, 4) as numero_truncado;
-- mas funciones numericas : https://dev.mysql.com/doc/refman/8.0/en/mathematical-functions.html

-- Funciones de fecha.
-- Podemos manipular cualquier tipo de cálculo con fechas:
-- Obtener los días ocurridos entre determinadas fechas.
-- El número del día de un año.
-- Extraer el mes, el año, o día de la fecha actual.
-- Saber qué día de la semana fue una determinada fecha.

-- algunas funciones de fecha
-- curdate(): devuelve la fecha actual.
select curdate() as fecha_actual;
-- curtime(): devuelve la hora actual.
select curtime() as hora_actual;
-- now(): combina los dos anteriores en un resultado.
select now() as fecha_hora_actual;
-- datediff(): obtiene la diferencia de tiempo entre dos fechas.
select datediff(curdate(),"1988/05/10") as dias_transcurridos;
-- dayname(): Retorna el nombre del día de semana de una fecha determinada.
select dayname("1988/05/10") as dias_pasadosM

-- mas funciones de fecha : https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html

-- Funciones agregadas : count(), avg(),max(),min()


