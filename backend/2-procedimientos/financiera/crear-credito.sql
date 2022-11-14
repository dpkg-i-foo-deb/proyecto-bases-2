CREATE OR REPLACE PROCEDURE crear_credito
    (
    arg_tasa IN NUMBER,
    arg_plazo in NUMBER,
    arg_producto IN VARCHAR2,
    arg_forma_pago IN VARCHAR2,
    arg_tipo IN NUMBER,
    arg_monto IN NUMBER,
    arg_cedula IN VARCHAR2
    )
    AS
    BEGIN
    
        INSERT INTO CREDITO
            (TASA_INTERES, PLAZO, PRODUCTO_ID_PRODUCTO, FORMA_PAGO_FORMA_PAGO, TIPO_ID_TIPO, MONTO_PRESTAMO, PERSONA_CEDULA)
            VALUES(arg_tasa, arg_plazo, arg_producto, arg_forma_pago, arg_tipo, arg_monto, arg_cedula);
    
    END crear_credito;