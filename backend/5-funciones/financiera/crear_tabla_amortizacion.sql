CREATE OR REPLACE FUNCTION crear_tabla_amortizacion (
    --Parametros
    v_codigo_credito CREDITO.PRODUCTO_ID_PRODUCTO%type,
    v_codigo_empleado IN VARCHAR2
)

RETURN t_tabla_amortizacion AS
        v_tabla_amortizacion t_tabla_amortizacion;
     
     CURSOR  cur_empleados IS
     SELECT e.CEDULA_PERSONA FROM EMPLEADO e
     WHERE e.cedula_persona = v_codigo_empleado;
     
     --Variables
     v_empleado         cur_empleados%ROWTYPE;
     v_capital          NUMBER;
     v_monto_prestamo   NUMBER;
     v_plazo            NUMBER;
     v_numero_cuotas    NUMBER;
     v_periodos         NUMBER;
     v_forma_pago       VARCHAR2(30);
     v_interes          NUMBER;
     v_tasa_interes     NUMBER;
     v_saldo            NUMBER;
     v_cuota            NUMBER;
     v_cedula_persona   NUMBER;
     
     
    
BEGIN 

    OPEN cur_empleados;
    FETCH cur_empleados INTO v_empleado;
    
    IF cur_empleados%NOTFOUND THEN 
    raise_application_error(-20001, 'La cédula del empleado no fue encontrada');
    END IF;

    --llamo el contructor 
    v_tabla_amortizacion := t_tabla_amortizacion();
    

    SELECT c.MONTO_PRESTAMO into v_monto_prestamo FROM CREDITO c WHERE c.PRODUCTO_ID_PRODUCTO = v_codigo_credito ; 
    SELECT c.FORMA_PAGO_FORMA_PAGO into v_forma_pago FROM CREDITO c WHERE c.PRODUCTO_ID_PRODUCTO = v_codigo_credito ; 
    SELECT c.PLAZO into v_plazo FROM CREDITO c WHERE c.PRODUCTO_ID_PRODUCTO = v_codigo_credito ; 
    SELECT c.TASA_INTERES into v_tasa_interes FROM CREDITO c WHERE c.PRODUCTO_ID_PRODUCTO = v_codigo_credito ; 
    SELECT c.PERSONA_CEDULA into v_cedula_persona FROM CREDITO c WHERE c.PRODUCTO_ID_PRODUCTO = v_codigo_credito ; 
    
    
    v_periodos := convertir_forma_pago(v_forma_pago);
    v_numero_cuotas := v_plazo*v_periodos;
    
    
    v_capital := calcular_pago_capital(v_monto_prestamo,v_numero_cuotas);
    
    v_interes:= (v_monto_prestamo * (v_tasa_interes/100));
    
    v_saldo:= v_monto_prestamo;
    
    v_cuota := v_capital + v_interes;
    
    --Inserto en la tabla solicitud
    crear_solicitud@enlace_seguimiento(dbms_random.value(9,99), SYSDATE ,v_cedula_persona , v_codigo_empleado, '41', v_codigo_credito, 'Y');
   
    --Añado un registro a la tabla que retorno 
     dbms_output.put_line('0'||'    '||'    '||ROUND(v_cuota,2)||'    '||ROUND(v_capital,2)||'    '||ROUND(v_interes,2)||'    '||ROUND(v_saldo,2));
     v_tabla_amortizacion.extend;
     v_tabla_amortizacion(v_tabla_amortizacion.count) := t_registro_amortizacion(0,ROUND(v_cuota,2), round(v_capital,2), ROUND(v_interes,2), ROUND(v_saldo,2));
     
    --Recalculando el saldo
    FOR contador IN 1 .. v_numero_cuotas LOOP
     dbms_output.put_line(contador||'    '||'    '||ROUND(v_cuota,2)||'    '||ROUND(v_capital,2)||'    '||ROUND(v_interes,2)||'    '||ROUND(v_saldo,2));
     v_saldo :=  v_saldo - v_capital;
     v_tabla_amortizacion.extend;
     v_tabla_amortizacion(v_tabla_amortizacion.count) := t_registro_amortizacion(contador,ROUND(v_cuota,2), round(v_capital,2), ROUND(v_interes,2), ROUND(v_saldo,2));
    END LOOP;
   
    
    return v_tabla_amortizacion;
END;

--Forma de llamar a la función para verificar el resultado 

--SELECT *FROM table(crear_tabla_amortizacion(305, '1005094652'));
--OJO ejecutar con oracle