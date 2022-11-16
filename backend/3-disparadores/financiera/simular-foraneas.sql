CREATE OR REPLACE TRIGGER dis_tarjeta_credito_fk 
    INSTEAD OF INSERT OR UPDATE ON FINANCIERA.TARJETA_CREDITO_VISTA
    FOR EACH ROW
    
    DECLARE
    
        CURSOR cur_tipo IS 
            SELECT t.ID_TIPO
                FROM TIPO t
                    WHERE t.ID_TIPO = :NEW.TIPO_ID_TIPO;
                    
        CURSOR cur_cliente IS   
            SELECT c.CEDULA_PERSONA
                FROM 
                    CLIENTE c 
                        WHERE c.CEDULA_PERSONA = :NEW.CLIENTE_PERSONA_CEDULA;
                        
        var_tipo cur_tipo%ROWTYPE;
        
        var_cliente cur_cliente%ROWTYPE;
    
    BEGIN
    
        --Verfico que la cedula de la persona exista
        
        OPEN cur_cliente;
        
        FETCH cur_cliente INTO var_cliente;
        
        IF cur_cliente%NOTFOUND THEN
        
            CLOSE cur_cliente;
        
            RAISE_APPLICATION_ERROR(-20001,'El cliente no existe');
            
            
        END IF;
        
        --Verifico que el tipo exista
        
        OPEN cur_tipo;
        
        FETCH cur_tipo INTO var_tipo;
        
        IF cur_tipo%NOTFOUND THEN
            
            CLOSE cur_cliente;
            
            CLOSE cur_tipo;
            
            RAISE_APPLICATION_ERROR (-20001,'El tipo no existe');
        
        END IF;
        
        CLOSE cur_cliente;
            
        CLOSE cur_tipo;
        --Todo ha salido bien y podemos insertar
        INSERT INTO FINANCIERA.TARJETA_DE_CREDITO
            (FECHA_DE_VENCIMIENTO, CODIGO_CVV, CLIENTE_PERSONA_CEDULA, CUPO, CUPO_UTILIZADO, PRODUCTO_ID_PRODUCTO, TIPO_ID_TIPO)
            VALUES(:NEW.FECHA_DE_VENCIMIENTO, :NEW.CODIGO_CVV, :NEW.CLIENTE_PERSONA_CEDULA,:NEW.CUPO, :NEW.CUPO_UTILIZADO, :NEW.PRODUCTO_ID_PRODUCTO, :NEW.TIPO_ID_TIPO);

    
    END;


CREATE OR REPLACE TRIGGER dis_seguro_fk 
    INSTEAD OF INSERT OR UPDATE ON FINANCIERA.SEGURO_VISTA  
    FOR EACH ROW
    
    DECLARE
    
        CURSOR cur_tipo IS 
            SELECT t.ID_TIPO
                FROM TIPO t
                    WHERE t.ID_TIPO = :NEW.TIPO_SEGURO;
                    
        CURSOR cur_cliente IS   
            SELECT c.CEDULA_PERSONA
                FROM 
                    CLIENTE c 
                        WHERE c.CEDULA_PERSONA = :NEW.PERSONA_CEDULA;
                        
        var_tipo cur_tipo%ROWTYPE;
        
        var_cliente cur_cliente%ROWTYPE;
    
    BEGIN
    
        --Verfico que la cedula de la persona exista
        
        OPEN cur_cliente;
        
        FETCH cur_cliente INTO var_cliente;
        
        IF cur_cliente%NOTFOUND THEN
        
            CLOSE cur_cliente;
        
            RAISE_APPLICATION_ERROR(-20001,'El cliente no existe');
            
            
        END IF;
        
        --Verifico que el tipo exista
        
        OPEN cur_tipo;
        
        FETCH cur_tipo INTO var_tipo;
        
        IF cur_tipo%NOTFOUND THEN
            
            CLOSE cur_cliente;
            
            CLOSE cur_tipo;
            
            RAISE_APPLICATION_ERROR (-20001,'El tipo no existe');
        
        END IF;
        
        CLOSE cur_cliente;
            
        CLOSE cur_tipo;
        --Todo ha salido bien y podemos insertar
        INSERT INTO FINANCIERA.SEGURO
            (PERIODO_DURACION, TIPO_SEGURO, PRODUCTO_ID_PRODUCTO, PERSONA_CEDULA)
            VALUES(:NEW.PERIODO_DURACION,:NEW.TIPO_SEGURO,:NEW.PRODUCTO_ID_PRODUCTO, :NEW.PERSONA_CEDULA);

    
    END;


CREATE OR REPLACE TRIGGER dis_cuenta_fk 
    INSTEAD OF INSERT OR UPDATE ON FINANCIERA.CUENTA_VISTA
    FOR EACH ROW
    
    DECLARE
    
        CURSOR cur_tipo IS 
            SELECT t.ID_TIPO
                FROM TIPO t
                    WHERE t.ID_TIPO = :NEW.TIPO_ID_TIPO;
                    
        CURSOR cur_cliente IS   
            SELECT c.CEDULA_PERSONA
                FROM 
                    CLIENTE c 
                        WHERE c.CEDULA_PERSONA = :NEW.CLIENTE_PERSONA_CEDULA;
                        
        var_tipo cur_tipo%ROWTYPE;
        
        var_cliente cur_cliente%ROWTYPE;
    
    BEGIN
    
        --Verfico que la cedula de la persona exista
        
        OPEN cur_cliente;
        
        FETCH cur_cliente INTO var_cliente;
        
        IF cur_cliente%NOTFOUND THEN
        
            CLOSE cur_cliente;
        
            RAISE_APPLICATION_ERROR(-20001,'El cliente no existe');
            
            
        END IF;
        
        --Verifico que el tipo exista
        
        OPEN cur_tipo;
        
        FETCH cur_tipo INTO var_tipo;
        
        IF cur_tipo%NOTFOUND THEN
            
            CLOSE cur_cliente;
            
            CLOSE cur_tipo;
            
            RAISE_APPLICATION_ERROR (-20001,'El tipo no existe');
        
        END IF;
        
        CLOSE cur_cliente;
            
        CLOSE cur_tipo;
        --Todo ha salido bien y podemos insertar
        INSERT INTO FINANCIERA.CUENTA
            (SALDO, CLIENTE_PERSONA_CEDULA, TIPO_ID_TIPO, PRODUCTO_ID_PRODUCTO, EMPRESA_ID_EMPRESA)
            VALUES(:NEW.SALDO, :NEW.CLIENTE_PERSONA_CEDULA, :NEW.TIPO_ID_TIPO, :NEW.PRODUCTO_ID_PRODUCTO, :NEW.EMPRESA_ID_EMPRESA);


    
    END;


CREATE OR REPLACE TRIGGER dis_credito_fk 
    INSTEAD OF INSERT OR UPDATE ON FINANCIERA.CREDITO_VISTA
    FOR EACH ROW
    
    DECLARE
    
        CURSOR cur_tipo IS 
            SELECT t.ID_TIPO
                FROM TIPO t
                    WHERE t.ID_TIPO = :NEW.TIPO_ID_TIPO;
                    
        CURSOR cur_cliente IS   
            SELECT c.CEDULA_PERSONA
                FROM 
                    CLIENTE c 
                        WHERE c.CEDULA_PERSONA = :NEW.PERSONA_CEDULA;
                        
        var_tipo cur_tipo%ROWTYPE;
        
        var_cliente cur_cliente%ROWTYPE;
    
    BEGIN
    
        --Verfico que la cedula de la persona exista
        
        OPEN cur_cliente;
        
        FETCH cur_cliente INTO var_cliente;
        
        IF cur_cliente%NOTFOUND THEN
        
            CLOSE cur_cliente;
        
            RAISE_APPLICATION_ERROR(-20001,'El cliente no existe');
            
            
        END IF;
        
        --Verifico que el tipo exista
        
        OPEN cur_tipo;
        
        FETCH cur_tipo INTO var_tipo;
        
        IF cur_tipo%NOTFOUND THEN
            
            CLOSE cur_cliente;
            
            CLOSE cur_tipo;
            
            RAISE_APPLICATION_ERROR (-20001,'El tipo no existe');
        
        END IF;
        
        CLOSE cur_cliente;
            
        CLOSE cur_tipo;
        --Todo ha salido bien y podemos insertar

        INSERT INTO FINANCIERA.CREDITO
            (TASA_INTERES, PLAZO, PRODUCTO_ID_PRODUCTO, FORMA_PAGO_FORMA_PAGO, TIPO_ID_TIPO, MONTO_PRESTAMO, PERSONA_CEDULA)
            VALUES(:NEW.TASA_INTERES, :NEW.PLAZO, :NEW.PRODUCTO_ID_PRODUCTO, :NEW.FORMA_PAGO_FORMA_PAGO,:NEW.TIPO_ID_TIPO, :NEW.MONTO_PRESTAMO, :NEW.PERSONA_CEDULA);

    END;


CREATE OR REPLACE TRIGGER dis_movimiento_fk 
    INSTEAD OF INSERT OR UPDATE ON FINANCIERA.MOVIMIENTO_VISTA
    FOR EACH ROW
    
    DECLARE
                    
        CURSOR cur_cliente IS   
            SELECT c.CEDULA_PERSONA
                FROM 
                    CLIENTE c 
                        WHERE c.CEDULA_PERSONA = :NEW.CLIENTE_PERSONA_CEDULA;
                        
        CURSOR cur_turno IS
            SELECT t.CODIGO
                FROM TURNO_EMPLEADO t
                    WHERE t.CODIGO = :NEW.TURNO_EMPLEADO;
        
        var_cliente cur_cliente%ROWTYPE;
        
        var_turno cur_turno%ROWTYPE;
    
    BEGIN
    
        --Verifico si el cliente existe
        OPEN cur_cliente;
        
        FETCH cur_cliente INTO var_cliente;
        
        IF cur_cliente%NOTFOUND THEN
        
            CLOSE cur_cliente;
            
            RAISE_APPLICATION_ERROR(-20001,'El cliente no existe');
        
        END IF;
        
        --Verifico si el turno existe
        
        OPEN cur_turno;
        
        FETCH cur_turno INTO var_turno;
        
        IF cur_turno%NOTFOUND THEN
        
            CLOSE cur_turno;
            CLOSE cur_cliente;
            
            RAISE_APPLICATION_ERROR(-20001,'El turno del empleado no existe');
        
        END IF;
        
        --Todo ha salido bien y podemos insertar
        INSERT INTO FINANCIERA.MOVIMIENTO
            (ID_MOVIMIENTO, CLIENTE_PERSONA_CEDULA, TURNO_EMPLEADO, MONTO)
            VALUES(:NEW.ID_MOVIMIENTO,:NEW.CLIENTE_PERSONA_CEDULA, :NEW.TURNO_EMPLEADO, :NEW.MONTO);


    END;