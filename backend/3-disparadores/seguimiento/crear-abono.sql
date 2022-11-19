CREATE OR REPLACE TRIGGER dis_abono
    FOR INSERT ON SEGUIMIENTO.ABONO_VISTA
    COMPOUND TRIGGER 
    
        CURSOR cur_tarjetas IS 
            SELECT t.FECHA_DE_VENCIMIENTO, t.CODIGO_CVV, t.CLIENTE_PERSONA_CEDULA, t.CUPO, t.CUPO_UTILIZADO, t.PRODUCTO_ID_PRODUCTO, t.TIPO_ID_TIPO
                FROM TARJETA_CREDITO t
                    WHERE t.PRODUCTO_ID_PRODUCTO=:NEW.ID_PRODUCTO;
                    
        var_tarjeta cur_tarjetas%ROWTYPE;
     
         
         CURSOR cur_movimientos IS
            SELECT m.ID_MOVIMIENTO, m.CLIENTE_PERSONA_CEDULA, m.TURNO_EMPLEADO, m.MONTO
                FROM MOVIMIENTO m
                    WHERE m.ID_MOVIMIENTO = :NEW.ID_MOVIMIENTO;
                    
        var_movimiento cur_movimientos%ROWTYPE;
        
        var_monto NUMBER;
            
    
     BEFORE EACH ROW IS
     
     BEGIN
     
        --Verifico si la tarjeta a insertar existe o no
       
       OPEN cur_tarjetas;
       
       FETCH cur_tarjetas INTO var_tarjeta;
       
       OPEN cur_movimientos;
       
       FETCH cur_movimiento INTO var_movimiento;
       
       IF cur_tarjetas%NOTFOUND OR cur_movimiento%NOTFOUND THEN
       
        CLOSE cur_tarjetas;
        CLOSE cur_movimientos;
        RAISE_APPLICATION_ERROR(-20001,'El movimiento o tarjeta no existen');
       
       END IF;
       
       -- En caso de que exista, verifico que tenga saldo a pagar y que el pago
       -- a realizar no sea mayor a este monto
       
       IF var_tarjeta.CUPO_UTILIZADO = 0 OR var_tarjeta.CUPO_UTILIZADO < var_movimiento.MONTO THEN
       
       CLOSE cur_tarjetas;
       CLOSE cur_movimientos;
       RAISE_APPLICATION_ERROR(-20001,'La tarjeta no posee saldo a pagar o excede el valor pendiente');
       
       END IF;
       
       CLOSE cur_tarjetas;
       CLOSE cur_movimientos;
       
       --Todo ha salido bien y podemos insertar
       
       INSERT INTO SEGUIMIENTO.ABONO
        (ID_MOVIMIENTO, ID_PRODUCTO)
        VALUES(:NEW.ID_MOVIMIENTO,:NEW.ID_PRODUCTO);

       
     END BEFORE EACH ROW;
   
     --Executed aftereach row change- :NEW, :OLD are available
     AFTER EACH ROW IS
     BEGIN
       -- El abono ya existe, puedo descontar al saldo pendiente de la tarjeta
       OPEN cur_movimientos;
       
       FETCH cur_movimientos INTO var_movimiento;
       
       OPEN cur_tarjetas;
       
       FETCH cur_tarjetas INTO var_tarjeta;
       
       var_monto := var_movimiento.MONTO;
       
       --No verifico nada porque la sentencia BEFORE EACH ROW ya lo hizo
       UPDATE TARJETA_CREDITO
            SET CUPO=var_tarjeta.CUPO+var_movimiento.MONTO, CUPO_UTILIZADO=var_tarjeta.CUPO_UTILIZADO-var_movimiento.MONTO
            WHERE PRODUCTO_ID_PRODUCTO=:NEW.ID_PRODUCTO;

       
     END AFTER EACH ROW;
   
     --Executed after DML statement
     AFTER STATEMENT IS
     BEGIN
       DBMS_OUTPUT.PUT_LINE('Cuota pagada exitosamente');
     END AFTER STATEMENT;
    
END dis_abono;