CREATE OR REPLACE FUNCTION calcular_pago_capital (


    v_monto_prestamo CREDITO.MONTO_PRESTAMO%type,
    v_numero_cuotas CREDITO.PLAZO%type
    
)

RETURN NUMBER IS
    v_capital NUMBER;
    
BEGIN 
   v_capital := v_monto_prestamo / v_numero_cuotas;
   
   RETURN V_capital;

END calcular_pago_capital;