CREATE OR REPLACE PROCEDURE crear_seguro
    (
    arg_periodo IN NUMBER,
    arg_tipo IN NUMBER,
    arg_producto IN VARCHAR2,
    arg_cedula IN VARCHAR2
    )
    AS
    BEGIN

        INSERT INTO SEGURO
            (PERIODO_DURACION, TIPO_SEGURO, PRODUCTO_ID_PRODUCTO, PERSONA_CEDULA)
            VALUES(arg_periodo, arg_tipo, arg_producto, arg_cedula);
    
    END crear_seguro;