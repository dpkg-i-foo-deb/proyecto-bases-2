-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2022-11-08 18:21:26 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE caja (
    id_caja   INTEGER NOT NULL,
    ubicacion VARCHAR2(20)
);

ALTER TABLE caja ADD CONSTRAINT caja_pk PRIMARY KEY ( id_caja );

CREATE TABLE consignacion (
    movimiento_id_movimiento INTEGER NOT NULL,
    fecha                    DATE,
    cuenta_origen            VARCHAR2(24) NOT NULL,
    cuenta_destino           VARCHAR2(24) NOT NULL
);

ALTER TABLE consignacion ADD CONSTRAINT consignacion_pk PRIMARY KEY ( movimiento_id_movimiento );

CREATE TABLE credito (
    tasa_interes          FLOAT,
    plazo                 SMALLINT,
    producto_id_produtco  VARCHAR2(24) NOT NULL,
    forma_pago_forma_pago VARCHAR2(40) NOT NULL,
    tipo_id_tipo          VARCHAR2(20) NOT NULL,
    monto_prestamo        FLOAT NOT NULL,
    persona_cedula        VARCHAR2(22) NOT NULL
);

ALTER TABLE credito ADD CONSTRAINT credito_pk PRIMARY KEY ( producto_id_produtco );

CREATE TABLE cuenta (
    saldo                  NUMBER,
    cliente_persona_cedula VARCHAR2(20) NOT NULL,
    tipo_id_tipo           VARCHAR2(20) NOT NULL,
    producto_id_produtco   VARCHAR2(24) NOT NULL
);

ALTER TABLE cuenta ADD CONSTRAINT cuenta_pk PRIMARY KEY ( producto_id_produtco );

CREATE TABLE empresa (
    nombre     VARCHAR2(40),
    id_empresa INTEGER NOT NULL
);

ALTER TABLE empresa ADD CONSTRAINT empresa_pk PRIMARY KEY ( id_empresa );

CREATE TABLE forma_pago (
    forma_pago VARCHAR2(40) NOT NULL
);

ALTER TABLE forma_pago ADD CONSTRAINT forma_pago_pk PRIMARY KEY ( forma_pago );

CREATE TABLE movimiento (
    id_movimiento               INTEGER NOT NULL,
    cliente_persona_cedula      VARCHAR2(20) NOT NULL,
    turno_empleado              VARCHAR2(20) NOT NULL,
    monto                       NUMBER,
    turno_empleado_caja_id_caja INTEGER NOT NULL
);

ALTER TABLE movimiento ADD CONSTRAINT movimiento_pk PRIMARY KEY ( id_movimiento );

CREATE TABLE pago (
    movimiento_id_movimiento INTEGER NOT NULL,
    empresa_id_empresa       INTEGER NOT NULL,
    cuenta_origen            VARCHAR2(24) NOT NULL,
    cuenta_destino           VARCHAR2(24) NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( movimiento_id_movimiento );

CREATE TABLE producto (
    id_produtco VARCHAR2(24) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( id_produtco );

CREATE TABLE retiro (
    movimiento_id_movimiento INTEGER NOT NULL,
    cuenta_retiro            VARCHAR2(24) NOT NULL
);

ALTER TABLE retiro ADD CONSTRAINT retiro_pk PRIMARY KEY ( movimiento_id_movimiento );

CREATE TABLE seguro (
    periodo_duracion     INTEGER,
    tipo_seguro          VARCHAR2(20) NOT NULL,
    tipo_periodo         VARCHAR2(20) NOT NULL,
    producto_id_produtco VARCHAR2(24) NOT NULL,
    persona_cedula       VARCHAR2(22) NOT NULL
);

ALTER TABLE seguro ADD CONSTRAINT seguro_pk PRIMARY KEY ( producto_id_produtco );

CREATE TABLE tarjeta_de_credito (
    fecha_de_vencimiento   DATE,
    codigo_cvv             SMALLINT,
    cliente_persona_cedula VARCHAR2(20) NOT NULL,
    cupo                   FLOAT,
    cupo_utilizado         FLOAT,
    producto_id_produtco   VARCHAR2(24) NOT NULL
);

ALTER TABLE tarjeta_de_credito ADD CONSTRAINT tarjeta_de_credito_pk PRIMARY KEY ( producto_id_produtco );

CREATE TABLE transferencia (
    movimiento_id_movimiento INTEGER NOT NULL,
    cuenta_origen            VARCHAR2(24) NOT NULL,
    cuenta_destino           VARCHAR2(24) NOT NULL
);

ALTER TABLE transferencia ADD CONSTRAINT transferencia_pk PRIMARY KEY ( movimiento_id_movimiento );

ALTER TABLE consignacion
    ADD CONSTRAINT consignacion_cuenta_fk FOREIGN KEY ( cuenta_origen )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE consignacion
    ADD CONSTRAINT consignacion_cuenta_fkv2 FOREIGN KEY ( cuenta_destino )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE consignacion
    ADD CONSTRAINT consignacion_movimiento_fk FOREIGN KEY ( movimiento_id_movimiento )
        REFERENCES movimiento ( id_movimiento );

ALTER TABLE credito
    ADD CONSTRAINT credito_forma_pago_fk FOREIGN KEY ( forma_pago_forma_pago )
        REFERENCES forma_pago ( forma_pago );

ALTER TABLE credito
    ADD CONSTRAINT credito_producto_fk FOREIGN KEY ( producto_id_produtco )
        REFERENCES producto ( id_produtco );

ALTER TABLE transferencia
    ADD CONSTRAINT cuenta_origen_fk FOREIGN KEY ( cuenta_origen )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE cuenta
    ADD CONSTRAINT cuenta_producto_fk FOREIGN KEY ( producto_id_produtco )
        REFERENCES producto ( id_produtco );

ALTER TABLE pago
    ADD CONSTRAINT pago_cuenta_fk FOREIGN KEY ( cuenta_origen )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE pago
    ADD CONSTRAINT pago_cuenta_fkv2 FOREIGN KEY ( cuenta_destino )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE pago
    ADD CONSTRAINT pago_empresa_fk FOREIGN KEY ( empresa_id_empresa )
        REFERENCES empresa ( id_empresa );

ALTER TABLE pago
    ADD CONSTRAINT pago_movimiento_fk FOREIGN KEY ( movimiento_id_movimiento )
        REFERENCES movimiento ( id_movimiento );

ALTER TABLE retiro
    ADD CONSTRAINT retiro_cuenta_fk FOREIGN KEY ( cuenta_retiro )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE retiro
    ADD CONSTRAINT retiro_movimiento_fk FOREIGN KEY ( movimiento_id_movimiento )
        REFERENCES movimiento ( id_movimiento );

ALTER TABLE seguro
    ADD CONSTRAINT seguro_producto_fk FOREIGN KEY ( producto_id_produtco )
        REFERENCES producto ( id_produtco );

ALTER TABLE tarjeta_de_credito
    ADD CONSTRAINT tarjeta_de_credito_producto_fk FOREIGN KEY ( producto_id_produtco )
        REFERENCES producto ( id_produtco );

ALTER TABLE transferencia
    ADD CONSTRAINT transferencia_cuenta_fk FOREIGN KEY ( cuenta_destino )
        REFERENCES cuenta ( producto_id_produtco );

ALTER TABLE transferencia
    ADD CONSTRAINT transferencia_movimiento_fk FOREIGN KEY ( movimiento_id_movimiento )
        REFERENCES movimiento ( id_movimiento );

--Corecciones 
ALTER TABLE FINANCIERA.CAJA RENAME COLUMN UBICACION TO NOMBRE;
ALTER TABLE FINANCIERA.CAJA ADD SUCURSAL_ID_SUCURSAL NUMBER(38,0) NOT NULL;
ALTER TABLE FINANCIERA.CAJA MODIFY NOMBRE VARCHAR2(20) NOT NULL;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
