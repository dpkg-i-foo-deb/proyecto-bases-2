create or replace TRIGGER DIS_PAGO_EMPRESA
    INSTEAD OF INSERT OR UPDATE ON FINANCIERA.PAGO_VISTA
    FOR EACH ROW
    
    DECLARE
    
        CURSOR cur_cuentas (arg_empresa NUMBER) IS 
            SELECT c.SALDO, c.CLIENTE_PERSONA_CEDULA, c.TIPO_ID_TIPO, c.PRODUCTO_ID_PRODUCTO, c.EMPRESA_ID_EMPRESA
                FROM FINANCIERA.CUENTA c
                    WHERE c.EMPRESA_ID_EMPRESA = arg_empresa;
                    
        var_cuenta cur_cuentas%ROWTYPE;
        
    BEGIN
    
        --En caso de que la empresa no sea nula...
        
        IF :NEW.EMPRESA_ID_EMPRESA IS NOT NULL THEN
        
            --Recupero la cuenta original de esta empresa
            OPEN cur_cuentas(:NEW.EMPRESA_ID_EMPRESA);
            
            FETCH cur_cuentas INTO var_cuenta;
            
            --Verifico que la cuenta del pago sí sea de la empresa
            
            IF NOT var_cuenta.PRODUCTO_ID_PRODUCTO = :NEW.CUENTA_DESTINO OR cur_cuentas%NOTFOUND THEN
                RAISE_APPLICATION_ERROR(-20001,'La cuenta destino no pertenece a la empresa');
            END IF;
            
            CLOSE cur_cuentas;
        
        END IF;
        
        --Todo ha salido bien y podemos insertar en la tabla
        
        INSERT INTO FINANCIERA.PAGO
            (MOVIMIENTO_ID_MOVIMIENTO, EMPRESA_ID_EMPRESA, CUENTA_ORIGEN, CUENTA_DESTINO, FACTURA_ID_FACTURA)
            VALUES(:NEW.MOVIMIENTO_ID_MOVIMIENTO,:NEW.EMPRESA_ID_EMPRESA, :NEW.CUENTA_ORIGEN, :NEW.CUENTA_DESTINO,:NEW.FACTURA_ID_FACTURA);
    
    END;