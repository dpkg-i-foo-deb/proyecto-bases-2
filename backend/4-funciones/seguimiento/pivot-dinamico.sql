CREATE OR REPLACE FUNCTION pivot_dinamico

RETURN SYS_REFCURSOR AS

consulta CLOB;
var_columnas CLOB;
cur_consulta SYS_REFCURSOR;

BEGIN
    SELECT LISTAGG('''' || CATEGORIA || ''' AS "' || CATEGORIA || '"',',') WITHIN GROUP (ORDER BY CATEGORIA )
        INTO var_columnas
        FROM (SELECT DISTINCT CATEGORIA
                FROM TIPO 
                    WHERE DESCRIPCION='Empleado');
                    
    
    consulta := 'SELECT * FROM(
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
                        FOR tipo_empleado IN (' || var_columnas || ')
                        )
                    ORDER BY 1';
                    
    OPEN cur_consulta FOR consulta;
    
    RETURN cur_consulta;

END pivot_dinamico;