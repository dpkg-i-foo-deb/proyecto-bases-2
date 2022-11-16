CREATE OR REPLACE TRIGGER dis_crear_cuenta
    INSTEAD OF INSERT ON FINANCIERA.CUENTA_VISTA
    FOR EACH ROW 
    
    DECLARE
    
        CURSOR cur_ofertados IS
                                SELECT p.ID_PRODUCTO, p.ID_REGISTRO, p.ACEPTADO
                                    FROM PRODUCTO_OFERTADO p
                                        WHERE p.ID_PRODUCTO = :NEW.PRODUCTO_ID_PRODUCTO;
                                        
        var_ofertado cur_ofertados%ROWTYPE;
        
        CURSOR cur_solicitudes IS 
                                    SELECT s.ID_SOLICITUD, s.FECHA, s.CEDULA_PERSONA, s.CEDULA_EMPLEADO, s.ID_TIPO, s.ID_PRODUCTO, s.ACEPTADA
                                        FROM SOLICITUD s
                                            WHERE s.ID_PRODUCTO = :NEW.PRODUCTO_ID_PRODUCTO;
                                            
        var_solicitud cur_solicitudes%ROWTYPE;
    
    BEGIN
        --Primero, verifico que este producto no esté presente en una llamada
        OPEN cur_ofertados;
        
        FETCH cur_ofertados INTO var_ofertado;
        
        OPEN cur_solicitudes;
            
        FETCH cur_solicitudes INTO var_solicitud;
        
        -- En caso de que el producto haya sido ofertado y NO aceptado...
        
        IF (cur_ofertados%FOUND AND var_ofertado.ACEPTADO = 'N') OR cur_ofertados%NOTFOUND THEN
        
            --Busco en la base de datos de seguimiento, para ver si su solicitud fue aceptada
            --Si la solicitud no existe ...
            
            IF cur_solicitudes%NOTFOUND THEN
            
                CLOSE cur_solicitudes;
                
                RAISE_APPLICATION_ERROR(-20001,'El producto no fue aceptado en una llamada, y la solicitud no existe');
                
            END IF;
            
            --Si la solicitud existe pero fue rechazada
            
            IF var_solicitud.ACEPTADA = 'N' THEN
            
                CLOSE cur_solicitudes;
                
                RAISE_APPLICATION_ERROR(-20001,'El prodcuto fue rechazado al momento de realizar la solicitud');
            
            END IF;
        
        END IF;
        
        -- Si no se encuentra ni la llamada ni la solicitud...
        
        IF cur_solicitudes%NOTFOUND AND cur_solicitudes%NOTFOUND THEN
        
            RAISE_APPLICATION_ERROR(-20001,'No existe ni un registro de llamada ni un registro de solicitud con este producto');
        
        END IF;
        
        --Todo salió bien y creamos el credito
        
        INSERT INTO FINANCIERA.CUENTA
            (SALDO, CLIENTE_PERSONA_CEDULA, TIPO_ID_TIPO, PRODUCTO_ID_PRODUCTO, EMPRESA_ID_EMPRESA)
            VALUES(:NEW.SALDO, :NEW.CLIENTE_PERSONA_CEDULA, :NEW.TIPO_ID_TIPO, :NEW.PRODUCTO_ID_PRODUCTO, :NEW.EMPRESA_ID_EMPRESA);

        
        CLOSE cur_ofertados;
        
        CLOSE cur_solicitudes;
    
    END;