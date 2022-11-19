CREATE OR REPLACE PROCEDURE crear_solicitud(
    arg_id_solicitud        IN NUMBER, 
    arg_fecha               IN DATE, 
    arg_cedula_persona      IN VARCHAR2, 
    arg_cedula_empleado     IN VARCHAR2, 
    arg_id_tipo             IN VARCHAR2, 
    arg_id_producto         IN VARCHAR2,
    arg_aceptada            IN CHAR
    )AS 
    
    BEGIN 
    
    INSERT INTO SOLICITUD(ID_SOLICITUD, FECHA, CEDULA_PERSONA, CEDULA_EMPLEADO, ID_TIPO, ID_PRODUCTO, ACEPTADA)VALUES(arg_id_solicitud, arg_fecha ,arg_cedula_persona ,arg_cedula_empleado, arg_id_tipo, arg_id_producto, arg_aceptada);
    
    END crear_solicitud;