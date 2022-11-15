--Consulta case 

-- Enunciado: Mostrar por empleado sus turnos de trabajo en una sucursal, teniendo en cuenta que si este se encuentra entre las 
--            8:00 am - 11:30 pm o 8:00 am - 1:00 pm se considera turno mañana y si se encuentra entre las 2:00 pm - 4:30 pm o
--            2:30 pm - 5:00 pm se considera turno tarde 

SELECT p.CEDULA, p.PRIMER_NOMBRE, p.PRIMER_APELLIDO, TO_CHAR(te.HORA_INICIO,'HH:MI:SS') INICIO, TO_CHAR(te.HORA_FIN,'HH:MI:SS') FIN, 
       te.ID_CAJA,s.NOMBRE SUCURSAL,
CASE 
  WHEN (SELECT TO_CHAR(te2.HORA_INICIO,'HH:MI:SS')
            FROM USUARIOS.TURNO_EMPLEADO te2
                WHERE te2.CODIGO = te.CODIGO) = '08:00:00' 
                
        AND (SELECT TO_CHAR(te2.HORA_FIN,'HH:MI:SS')
      			FROM USUARIOS.TURNO_EMPLEADO te2
              		 WHERE te2.CODIGO = te.CODIGO) = '11:30:00'
    THEN 'TURNO_MAÑANA'
    
  WHEN (SELECT TO_CHAR(te2.HORA_INICIO,'HH:MI:SS')
            FROM USUARIOS.TURNO_EMPLEADO te2
                WHERE te2.CODIGO = te.CODIGO) = '08:00:00' 
                
        AND (SELECT TO_CHAR(te2.HORA_FIN,'HH:MI:SS')
      			FROM USUARIOS.TURNO_EMPLEADO te2
              		 WHERE te2.CODIGO = te.CODIGO) = '01:00:00'
    THEN 'TURNO_MAÑANA'
    
  ELSE 'TURNO_TARDE'
  
END AS "TURNO"
FROM EMPLEADO e 
  JOIN PERSONA p 
  ON e.CEDULA_PERSONA = p.CEDULA 
  JOIN SUCURSAL s 
  ON s.ID_SUCURSAL = e.SUCURSAL_ID_SUCURSAL 
  JOIN TURNO_EMPLEADO te 
  ON te.CEDULA_EMPLEADO = p.CEDULA 
GROUP BY P.CEDULA, p.PRIMER_NOMBRE , p.PRIMER_APELLIDO,te.HORA_INICIO, te.HORA_FIN,te.ID_CAJA, te.codigo, s.NOMBRE 