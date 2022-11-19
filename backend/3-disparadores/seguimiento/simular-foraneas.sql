CREATE OR REPLACE TRIGGER dis_solicitud_fk
    INSTEAD OF INSERT OR UPDATE ON SEGUIMIENTO.SOLICITUD_VISTA
    FOR EACH ROW
    DECLARE
    
        CURSOR cur_clientes IS 
            SELECT c.CEDULA_PERSONA
                FROM CLIENTE c
                    WHERE c.CEDULA_PERSONA = :NEW.CEDULA_PERSONA;
        
        var_cliente cur_clientes%ROWTYPE;
        
        CURSOR cur_empleados IS
            SELECT e.CEDULA_PERSONA
                FROM EMPLEADO e 
                    WHERE e.CEDULA_PERSONA = :NEW.CEDULA_PERSONA;
        
        var_empleado cur_empleados%ROWTYPE;
        
        CURSOR cur_tipos IS
            SELECT t.ID_TIPO
                FROM TIPO t
                    WHERE t.ID_TIPO = :NEW.ID_TIPO;
        
        var_tipo cur_tipos%ROWTYPE;
        
        CURSOR cur_productos IS
            SELECT p.ID_PRODUCTO
                FROM PRODUCTO p
                    WHERE p.ID_PRODUCTO = :NEW.ID_PRODUCTO;
                    
        var_producto cur_productos%ROWTYPE;
        
    BEGIN
    
        --Abro todos los cursores
        
        OPEN cur_clientes;
        OPEN cur_empleados;
        OPEN cur_productos;
        OPEN cur_tipos;
        
        FETCH cur_empleados INTO var_empleado;
        FETCH cur_productos INTO var_producto;
        FETCH cur_tipos INTO var_tipo;
        FETCH cur_clientes INTO var_cliente;
        
        --Verifico si el cliente existe

        
        IF cur_clientes%NOTFOUND THEN
            
            CLOSE cur_clientes;
            CLOSE cur_empleados;
            CLOSE cur_productos;
            CLOSE cur_tipos;
            
            RAISE_APPLICATION_ERROR(-20001,'El cliente no existe');
            
        END IF;
        
        --Verifico si el empleado existe
        
                
        IF cur_empleados%NOTFOUND THEN
            
            CLOSE cur_clientes;
            CLOSE cur_empleados;
            CLOSE cur_productos;
             CLOSE cur_tipos;
            
            RAISE_APPLICATION_ERROR(-20001,'El empleado no existe');
            
        END IF;
        
        --Verifico si el producto existe
        
        IF cur_productos%NOTFOUND THEN
            
            CLOSE cur_clientes;
            CLOSE cur_empleados;
            CLOSE cur_productos;
            CLOSE cur_tipos;
            
            RAISE_APPLICATION_ERROR(-20001,'El producto no existe');
            
        END IF;
        
        -- Verifico si el tipo existe
        IF cur_tipos%NOTFOUND THEN
            
            CLOSE cur_clientes;
            CLOSE cur_empleados;
            CLOSE cur_productos;
            CLOSE cur_tipos;
            
            RAISE_APPLICATION_ERROR(-20001,'El tipo no existe');
            
        END IF;
        
        --Todo ha salido bien y podemos insertar
    
        INSERT INTO SEGUIMIENTO.SOLICITUD
            (ID_SOLICITUD, FECHA, CEDULA_PERSONA, CEDULA_EMPLEADO, ID_TIPO, ID_PRODUCTO, ACEPTADA)
            VALUES(:NEW.ID_SOLICITUD, sysdate, :NEW.CEDULA_PERSONA, :NEW.CEDULA_EMPLEADO, :NEW.ID_TIPO, :NEW.ID_PRODUCTO,:NEW.ACEPTADA);

    
    END;


CREATE OR REPLACE TRIGGER dis_abono_fk
    INSTEAD OF INSERT OR UPDATE ON SEGUIMIENTO.ABONO_VISTA
    FOR EACH ROW
    DECLARE
        
        CURSOR cur_productos IS
            SELECT p.ID_PRODUCTO
                FROM PRODUCTO p
                    WHERE p.ID_PRODUCTO = :NEW.ID_PRODUCTO;
                    
        var_producto cur_productos%ROWTYPE;
        
        CURSOR cur_movimientos IS
            SELECT m.ID_MOVIMIENTO
                FROM MOVIMIENTO m
                    WHERE m.ID_MOVIMIENTO = :NEW.ID_MOVIMIENTO;
                    
        var_movimiento cur_movimientos%ROWTYPE;
        
    BEGIN
    
        --Abro todos los cursores
        OPEN cur_productos;
        OPEN cur_movimientos;
        
        FETCH cur_productos INTO var_producto;
        FETCH cur_movimientos INTO var_movimiento;
        
        --Verifico si el producto existe
        
        IF cur_productos%NOTFOUND THEN
            
            CLOSE cur_productos;
            CLOSE cur_movimientos;
            RAISE_APPLICATION_ERROR(-20001,'El producto no existe');
            
        END IF;
        
        --Verifico si el movimiento existe
        
        IF cur_movimientos%NOTFOUND THEN 
        
            CLOSE cur_productos;
            CLOSE cur_movimientos;
            RAISE_APPLICATION_ERROR(-20001,'El movimiento no existe'); 
            
        END IF;
        
        --Todo ha salido bien y podemos insertar
    
        INSERT INTO SEGUIMIENTO.ABONO
            (ID_MOVIMIENTO, ID_PRODUCTO)
            VALUES(:NEW.ID_MOVIMIENTO, :NEW.ID_PRODUCTO);

    
    END;