CREATE OR REPLACE TRIGGER dis_producto_ofertado_fk
    INSTEAD OF INSERT OR UPDATE ON USUARIOS.PRODUCTO_OFERTADO_VISTA
    FOR EACH ROW
    DECLARE
    
        CURSOR cur_productos IS
            SELECT p.ID_PRODUCTO
                FROM PRODUCTO p
                    WHERE p.ID_PRODUCTO=:NEW.ID_PRODUCTO;
                    
        var_producto cur_productos%ROWTYPE;
    
    BEGIN

        --Verifico que la llave foránea exista en la otra base de datos
    
        OPEN cur_productos;
        
        FETCH cur_productos INTO var_producto;
        
        IF cur_productos%NOTFOUND THEN
        
            RAISE_APPLICATION_ERROR (-20001,'Llave primaria del producto no encontrada');
        
        END IF;
        
        --Todo ha salido bien y podemos insertar
    
        INSERT INTO USUARIOS.PRODUCTO_OFERTADO
            (ID_PRODUCTO, ID_REGISTRO, ACEPTADO)
            VALUES(:NEW.ID_PRODUCTO, :NEW.ID_REGISTRO, :NEW.ACEPTADO);

        CLOSE cur_productos;

    END;


CREATE OR REPLACE TRIGGER dis_factura_fk
    INSTEAD OF INSERT OR UPDATE ON USUARIOS.FACTURA_VISTA
    FOR EACH ROW
    DECLARE
    
        CURSOR cur_productos IS
            SELECT p.ID_PRODUCTO
                FROM PRODUCTO p
                    WHERE p.ID_PRODUCTO=:NEW.ID_PRODUCTO;
                    
        var_producto cur_productos%ROWTYPE;
    
    BEGIN

        --Verifico que la llave foránea exista en la otra base de datos
    
        OPEN cur_productos;
        
        FETCH cur_productos INTO var_producto;
        
        IF cur_productos%NOTFOUND THEN
        
            RAISE_APPLICATION_ERROR (-20001,'Llave primaria del producto no encontrada');
        
        END IF;
        
        --Todo ha salido bien y podemos insertar
    
        INSERT INTO USUARIOS.FACTURA
            (ID_FACTURA, MONTO, FECHA_VENCIMIENTO, DESCRIPCION, ID_PRODUCTO, CEDULA_CLIENTE)
            VALUES(:NEW.ID_FACTURA, :NEW.MONTO,:NEW.FECHA_VENCIMIENTO, :NEW.DESCRIPCION, :NEW.ID_PRODUCTO, :NEW.CEDULA_CLIENTE);

        CLOSE cur_productos;

    END;


CREATE OR REPLACE TRIGGER dis_turno_empleado_fk
    INSTEAD OF INSERT OR UPDATE ON USUARIOS.TURNO_EMPLEADO_VISTA
    FOR EACH ROW
    DECLARE
    
        CURSOR cur_cajas IS
            SELECT c.ID_CAJA
                FROM CAJA c
                    WHERE c.ID_CAJA= :NEW.ID_CAJA;
                    
        var_caja cur_cajas%ROWTYPE;
    
    BEGIN

        -- Verifico si la caja existe en la otra base de datos
        OPEN cur_cajas;
        
        FETCH cur_cajas INTO var_caja;
        
        --Si la caja no existe, entonces error
        
        IF cur_cajas%NOTFOUND THEN
            
            RAISE_APPLICATION_ERROR(-20001, 'La caja no existe');
        
        END IF;
        
        --Todo ha salido bien y podemos insertar
        
        INSERT INTO USUARIOS.TURNO_EMPLEADO
            (CODIGO, HORA_INICIO, HORA_FIN, ID_CAJA, CEDULA_EMPLEADO)
                VALUES(:NEW.CODIGO,:NEW.HORA_INICIO,:NEW.HORA_FIN,:NEW.ID_CAJA, :NEW.CEDULA_EMPLEADO);

        CLOSE cur_cajas;

    END;