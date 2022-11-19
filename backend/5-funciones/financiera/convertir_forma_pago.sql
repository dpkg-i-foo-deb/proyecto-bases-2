CREATE OR REPLACE FUNCTION convertir_forma_pago (
     v_forma_pago credito.forma_pago_forma_pago%type
)

RETURN NUMBER IS
    v_cantidad_periodos NUMBER;
    
BEGIN 
   SELECT 
   CASE
        WHEN fp.forma_pago ='Anual'
        THEN 1
        
        WHEN fp.forma_pago ='Semestral'
        THEN 2
        
        WHEN fp.forma_pago ='Cuatrimestral'
        THEN 3
        
        WHEN fp.forma_pago ='Trimestral'
        THEN 4
        
        WHEN fp.forma_pago ='Bimestral'
        THEN 6
        
        WHEN fp.forma_pago ='Mensual'
        THEN 12
        
        WHEN fp.forma_pago ='Bimensual'
        THEN 24
        
        WHEN fp.forma_pago ='Semanal'
        THEN 52
        
    END AS "PERIODOS"
    INTO v_cantidad_periodos
    FROM FORMA_PAGO fp
    WHERE fp.forma_pago = v_forma_pago;
    
    RETURN v_cantidad_periodos;

END convertir_forma_pago;