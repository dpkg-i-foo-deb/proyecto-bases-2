create or replace TRIGGER DIS_PRODUCTO_ACEPTADO
    INSTEAD OF INSERT OR UPDATE ON USUARIOS.PRODUCTO_OFERTADO_VISTA
    FOR EACH ROW
    
    DECLARE
        
        CURSOR cur_productos IS 
            SELECT p.ID_PRODUCTO, p.TIPO_ID_TIPO
                FROM PRODUCTO p
                    WHERE p.ID_PRODUCTO = :NEW.ID_PRODUCTO;

        var_producto cur_productos%ROWTYPE;

        var_tipo_producto VARCHAR2(100);

        var_persona_cedula VARCHAR2(20);

    BEGIN

        OPEN cur_productos;

        FETCH cur_productos INTO var_producto;

        --Si el producto no existe...

        IF cur_productos%NOTFOUND THEN

            RAISE_APPLICATION_ERROR(-20001, 'El producto no existe');

        END IF;

        --Si el producto existe y fue aceptado

        IF :NEW.ACEPTADO = 'Y' THEN

           --Recupero el tipo del producto

           SELECT t.DESCRIPCION
                INTO var_tipo_producto
                FROM TIPO t
                    WHERE t.ID_TIPO = var_producto.TIPO_ID_TIPO;

            --Recupero la cedula de la persona

          SELECT c.CEDULA_PERSONA
            INTO var_persona_cedula
            FROM USUARIOS.REGISTRO_LLAMADAS r
                JOIN USUARIOS.CLIENTE c ON c.CEDULA_PERSONA = r.CEDULA_CLIENTE
                WHERE r.ID_REGISTRO = :NEW.ID_REGISTRO;

           --Si es una cuenta

            IF var_tipo_producto = 'Cuenta' THEN
                crear_cuenta@enlace_financiera(0, var_persona_cedula, var_tipo_producto, :NEW.ID_PRODUCTO, NULL);
             END IF;

             --Si es una tarjeta de crédito

             IF var_tipo_producto = 'Tarjeta de crédito' THEN  
                crear_tarjeta_credito@enlace_financiera(ADD_MONTHS(sysdate, 12) , DBMS_RANDOM.VALUE(1,1000), var_persona_cedula, 0, 0,:NEW.ID_PRODUCTO,var_tipo_producto);
             END IF;

            --Si es un crédito

            IF var_tipo_producto = 'Crédito' THEN                     
                crear_credito@enlace_financiera(0, 0, :NEW.ID_PRODUCTO, 'Mensual', var_tipo_producto, 0,var_persona_cedula);
            END IF;

            --Si es un seguro

            IF var_tipo_producto = 'Seguro' THEN
                crear_seguro@enlace_financiera(12, var_tipo_producto, :NEW.ID_PRODUCTO,var_persona_cedula);
            END IF;


        END IF;

        --De otra forma, el producto no fue aceptado, sólo se genera el registro
        INSERT INTO USUARIOS.PRODUCTO_OFERTADO
            (ID_PRODUCTO, ID_REGISTRO, ACEPTADO)
            VALUES(:NEW.ID_PRODUCTO, :NEW.ID_REGISTRO, :NEW.ACEPTADO);

        CLOSE cur_productos;

    END;