--Consulta de referencia cruzada 

--Enunciado: Generar una consulta de referencia cruzada donde se analice por sucursal la cantidad de empleados que ocupan los 
--           diferentes cargos presentes en la misma. 


SELECT * FROM(
SELECT s.NOMBRE nombre_sucursal, t.CATEGORIA tipo_empleado, T.ID_TIPO id_tipo
FROM TIPO t 
RIGHT JOIN EMPLEADO e 
ON t.ID_TIPO = e.TIPO_ID_TIPO 
RIGHT JOIN PERSONA p 
ON e.CEDULA_PERSONA = p.CEDULA 
RIGHT JOIN SUCURSAL s 
ON e.SUCURSAL_ID_SUCURSAL = s.ID_SUCURSAL 
)
pivot( COUNT(id_tipo)
FOR tipo_empleado IN ('CEO' CEO, 'Presidente' PRESIDENTE, 'Vicepresidente' VICEPRESIDENTE,'Director de departamento' DIRECTOR_DE_DEPARTAMENTO,
                      'Jefe de oficina' JEFE_OFICINA, 'supervisor' SUPERVISOR, 'Analista de créditos' ANALISTA_CREDITOS, 'Telemercadeo'
                       TELEMERCADEO, 'Cajero' CAJERO))
ORDER BY 1;