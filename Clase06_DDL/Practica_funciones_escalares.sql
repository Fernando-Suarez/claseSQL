  -- Implementar funciones escalares
  
-- concatena tu nombre completo (respetando los espacios)
SELECT CONCAT("FERNANDO ", "SUAREZ") as nombre_completo;
-- convierte tu nombre completo a minúsculas, luego a mayúsculas
SELECT UCASE("fernando suarez") as nombre_mayuscula;
SELECT LCASE("FERNANDO SUAREZ") as nombre_minuscula;
-- Divide tu año de nacimiento por tu día y mes (ej: 1975 / 2103)
SELECT (1988 / 1005) AS divide_año;
-- Convierte en un entero absoluto el resultado anterior
SELECT ROUND(1.9781) AS numero_redondo;
-- Calcula los días que pasaron desde tu nacimiento hasta hoy
SELECT datediff(current_date(), "1988/05/10") AS dias_pasados;
-- Averiguar qué día de semana era cuando naciste
SELECT dayname("1988/05/10") as dia_nacimiento;
