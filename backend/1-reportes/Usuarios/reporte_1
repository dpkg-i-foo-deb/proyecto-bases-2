--Consulta jerárquica

--Enunciado: listar los empleados de una sucursal dado el número de cédula del jefe de la misma, en la consulta deben obtenerse los 
--           datos de dicho empleado e incluir el nivel en que se encuentra.

SELECT  p.CEDULA, p.PRIMER_NOMBRE , p.PRIMER_APELLIDO , LEVEL 
FROM EMPLEADO e
JOIN PERSONA p  ON p.CEDULA = e.CEDULA_PERSONA 
CONNECT BY PRIOR e.CEDULA_PERSONA = e.JEFE 
START WITH e.CEDULA_PERSONA = '18123564'
ORDER BY level, e.CEDULA_PERSONA;