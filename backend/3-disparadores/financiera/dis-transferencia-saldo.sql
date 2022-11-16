CREATE OR REPLACE TRIGGER transferencia_saldo
    INSTEAD OF INSERT ON FINANCIERA.TRANSFERENCIA_VISTA
    FOR EACH ROW 
    
    DECLARE
    
        CURSOR cur_cuentas IS 
            SELECT c.PRODUCTO_ID_PRODUCTO, c.SALDO, c.CLIENTE_PERSONA_CEDULA, c.TIPO_ID_TIPO, c.EMPRESA_ID_EMPRESA
                FROM FINANCIERA.CUENTA c
                    WHERE c.PRODUCTO_ID_PRODUCTO = :NEW.CUENTA_ORIGEN;
                    
        var_cuenta cur_cuentas%ROWTYPE;
        
        CURSOR cur_movimientos IS 
            SELECT m.ID_MOVIMIENTO, m.CLIENTE_PERSONA_CEDULA, m.TURNO_EMPLEADO, m.MONTO
                FROM FINANCIERA.MOVIMIENTO m
                    WHERE m.ID_MOVIMIENTO = :NEW.MOVIMIENTO_ID_MOVIMIENTO;
                    
        var_movimiento cur_movimientos%ROWTYPE;
    
    BEGIN
    
        OPEN cur_cuentas;
        
        FETCH cur_cuentas INTO var_cuenta;
        
        OPEN cur_movimientos;
        
        FETCH cur_movimientos into var_movimiento;
        
        --Verifico que la cuenta tenga suficiente saldo para el movimiento
        
        IF var_cuenta.SALDO < var_movimiento.MONTO THEN
        
            --Si el saldo no es suficiente, arrojo la excepción
            
            CLOSE cur_cuentas;
        
            CLOSE cur_movimientos;
        
            RAISE_APPLICATION_ERROR(-20001,'Saldo insuficiente');
        
        END IF;
        
        --Todo ha salido bien y podemos insertar los valores 
        
        INSERT INTO FINANCIERA.TRANSFERENCIA
            (MOVIMIENTO_ID_MOVIMIENTO, CUENTA_ORIGEN, CUENTA_DESTINO)
            VALUES(:NEW.MOVIMIENTO_ID_MOVIMIENTO, :NEW.CUENTA_ORIGEN, :NEW.CUENTA_DESTINO);
            
        -- Ahora le restamos a la cuenta el monto de la transacción
        
        UPDATE FINANCIERA.CUENTA
            SET SALDO=SALDO - var_movimiento.MONTO
            WHERE PRODUCTO_ID_PRODUCTO=:NEW.CUENTA_ORIGEN;

        
        CLOSE cur_cuentas;
        
        CLOSE cur_movimientos;
    
    END;