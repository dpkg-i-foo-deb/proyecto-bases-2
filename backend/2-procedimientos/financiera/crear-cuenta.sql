CREATE OR REPLACE PROCEDURE crear_cuenta
    (arg_saldo IN NUMBER,
    arg_cedula IN VARCHAR2,
    arg_tipo IN NUMBER,
    arg_producto IN VARCHAR2,
    arg_empresa IN NUMBER)
    AS
    
        BEGIN
             INSERT INTO CUENTA
                    (SALDO, CLIENTE_PERSONA_CEDULA, TIPO_ID_TIPO, PRODUCTO_ID_PRODUCTO, EMPRESA_ID_EMPRESA)
                    VALUES(arg_saldo, arg_cedula, arg_tipo, arg_producto, arg_empresa);
        END crear_cuenta;