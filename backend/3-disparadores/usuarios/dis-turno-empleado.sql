create or replace TRIGGER DIS_TURNO_EMPLEADO
    INSTEAD OF INSERT OR UPDATE ON USUARIOS.TURNO_EMPLEADO_VISTA
    FOR EACH ROW
    
    DECLARE
        
        CURSOR cur_cajas IS
            SELECT c.ID_CAJA, c.NOMBRE, c.SUCURSAL_ID_SUCURSAL
                FROM CAJA c
                    WHERE c.ID_CAJA = (SELECT t.ID_CAJA
                                            FROM USUARIOS.TURNO_EMPLEADO t
                                                WHERE t.CODIGO = :NEW.CODIGO );
                                                
        var_caja cur_cajas%ROWTYPE;

        CURSOR cur_turnos (arg_caja NUMBER) IS 
            SELECT t.CODIGO, t.HORA_INICIO, t.HORA_FIN, t.ID_CAJA, t.CEDULA_EMPLEADO
                FROM USUARIOS.TURNO_EMPLEADO t
                WHERE (t.HORA_INICIO < :NEW.HORA_INICIO AND t.HORA_FIN> :NEW.HORA_FIN AND t.ID_CAJA = arg_caja) OR 
                    (:NEW.HORA_INICIO BETWEEN t.HORA_INICIO AND t.HORA_FIN AND t.ID_CAJA = arg_caja) OR
                    (:NEW.HORA_FIN BETWEEN t.HORA_INICIO AND t.HORA_FIN AND t.ID_CAJA = arg_caja);
                    
        var_turno cur_turnos%ROWTYPE;

    BEGIN

        --Paso 1, asegurarse que el turno no esté en el pasado
        IF :NEW.HORA_INICIO < SYSDATE OR :NEW.HORA_FIN < SYSDATE THEN 
        
            RAISE_APPLICATION_ERROR(-20001,'El turno no puede estar en el pasado');
        
        END IF;
        
        --Paso 2, asegurarse que el turno no se solapa con otro
        
        OPEN cur_cajas;
        
        FETCH cur_cajas INTO var_caja;
        
        OPEN cur_turnos(var_caja.ID_CAJA);
        
        
        --Si alguna de las consultas fue exitosa, entonces el turno se solapa
        
        IF cur_turnos%FOUND THEN 
                
            CLOSE cur_cajas;
            CLOSE cur_turnos;
            
            RAISE_APPLICATION_ERROR(20001,'Los turnos no se pueden solapar');
            
        END IF;
        
        CLOSE cur_cajas;
        CLOSE cur_turnos;
        
        --Todo ha salido bien y podemos insertar el turno
        
        INSERT INTO USUARIOS.TURNO_EMPLEADO
            (CODIGO, HORA_INICIO, HORA_FIN, ID_CAJA, CEDULA_EMPLEADO)
            VALUES(:NEW.CODIGO, :NEW.HORA_INICIO, :NEW.HORA_FIN, var_caja.ID_CAJA, :NEW.CEDULA );

    END;