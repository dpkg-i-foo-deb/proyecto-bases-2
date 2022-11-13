-- Generado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   en:        2022-11-02 16:41:49 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ciudad (
    id_ciudad       INTEGER NOT NULL,
    nombre          VARCHAR2(40) NOT NULL,
    id_departamento INTEGER NOT NULL
);

ALTER TABLE ciudad ADD CONSTRAINT ciudad_pk PRIMARY KEY ( id_ciudad );

CREATE TABLE cliente (
    cedula_persona VARCHAR2(20) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( cedula_persona );

CREATE TABLE departamento (
    id_departamento INTEGER NOT NULL,
    nombre          VARCHAR2(40) NOT NULL,
    pais_id         INTEGER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE empleado (
    cedula_persona VARCHAR2(20) NOT NULL,
    jefe           VARCHAR2(20),
    tipo_id_tipo   INTEGER NOT NULL,
    sucursal_id_sucursal INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( cedula_persona );

CREATE TABLE factura (
    id_factura        INTEGER NOT NULL,
    monto             NUMBER NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    descripcion       VARCHAR2(40) NOT NULL,
    id_producto       VARCHAR2(24) NOT NULL,
    cedula_cliente    VARCHAR2(20) NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id_factura );

CREATE TABLE pais (
    id_pais INTEGER NOT NULL,
    nombre  VARCHAR2(40) NOT NULL
);

ALTER TABLE pais ADD CONSTRAINT pais_pk PRIMARY KEY ( id_pais );

CREATE TABLE persona (
    cedula             VARCHAR2(20) NOT NULL,
    primer_nombre      VARCHAR2(20) NOT NULL,
    segundo_nombre     VARCHAR2(20) ,
    primer_apellido    VARCHAR2(20) NOT NULL,
    segundo_apellido   VARCHAR2(20) NOT NULL,
    correo_electronico VARCHAR2(100) NOT NULL,
    id_ciudad          INTEGER NOT NULL,
    direccion          VARCHAR2(100) NOT NULL
);

ALTER TABLE persona ADD CONSTRAINT persona_pk PRIMARY KEY ( cedula );

ALTER TABLE persona ADD CONSTRAINT correo_un UNIQUE ( correo_electronico );

CREATE TABLE producto_ofertado (
    id_producto VARCHAR2(24) NOT NULL,
    id_registro INTEGER NOT NULL,
    aceptado    CHAR(1) NOT NULL
);

ALTER TABLE producto_ofertado ADD CONSTRAINT producto_ofertado_pk PRIMARY KEY ( id_producto,
                                                                                id_registro );

CREATE TABLE registro_llamadas (
    hora_inicio        DATE NOT NULL,
    hora_fin           DATE NOT NULL,
    id_registro     INTEGER NOT NULL,
    calificacion    SMALLINT NOT NULL,
    cedula_empleado VARCHAR2(20) NOT NULL,
    cedula_cliente  VARCHAR2(20) NOT NULL
);

ALTER TABLE registro_llamadas ADD CONSTRAINT registro_llamadas_pk PRIMARY KEY ( id_registro );

CREATE TABLE sucursal (
    id_sucursal INTEGER NOT NULL,
    nombre      VARCHAR2(40) NOT NULL,
    id_ciudad   INTEGER NOT NULL
);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_pk PRIMARY KEY ( id_sucursal );

CREATE TABLE telefono (
    telefono       VARCHAR2(15) NOT NULL,
    id_tipo        INTEGER NOT NULL,
    cedula_cliente VARCHAR2(20) NOT NULL
);

ALTER TABLE telefono ADD CONSTRAINT telefono_pk PRIMARY KEY ( telefono );

CREATE TABLE tipo (
    id_tipo     INTEGER NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    categoria   VARCHAR2(100) NOT NULL
);

ALTER TABLE tipo ADD CONSTRAINT tipo_pk PRIMARY KEY ( id_tipo );

CREATE TABLE turno_empleado (
    codigo          INTEGER,
    hora_inicio     DATE NOT NULL,
    hora_fin        DATE NOT NULL,
    id_caja         INTEGER NOT NULL,
    cedula_empleado VARCHAR2(20) NOT NULL
);

ALTER TABLE turno_empleado ADD CONSTRAINT turno_empleado_pk PRIMARY KEY ( codigo );
ALTER TABLE turno_empleado ADD CONSTRAINT turno_empleado_U  UNIQUE ( hora_inicio,
                                                                     hora_fin,        
                                                                     id_caja,
                                                                     cedula_empleado);

ALTER TABLE persona
    ADD CONSTRAINT ciudad_fk FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE sucursal
    ADD CONSTRAINT ciudad_fkv1 FOREIGN KEY ( id_ciudad )
        REFERENCES ciudad ( id_ciudad );

ALTER TABLE telefono
    ADD CONSTRAINT cliente_fk FOREIGN KEY ( cedula_cliente )
        REFERENCES cliente ( cedula_persona );

ALTER TABLE registro_llamadas
    ADD CONSTRAINT cliente_fkv1 FOREIGN KEY ( cedula_cliente )
        REFERENCES cliente ( cedula_persona );

ALTER TABLE factura
    ADD CONSTRAINT cliente_fkv2 FOREIGN KEY ( cedula_cliente )
        REFERENCES cliente ( cedula_persona );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_fk FOREIGN KEY ( pais_id )
        REFERENCES pais ( id_pais );

ALTER TABLE ciudad
    ADD CONSTRAINT departamento_fkv1 FOREIGN KEY ( id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE turno_empleado
    ADD CONSTRAINT empleado_fk FOREIGN KEY ( cedula_empleado )
        REFERENCES empleado ( cedula_persona );

ALTER TABLE registro_llamadas
    ADD CONSTRAINT empleado_fkv1 FOREIGN KEY ( cedula_empleado )
        REFERENCES empleado ( cedula_persona );

ALTER TABLE empleado
    ADD CONSTRAINT jefe_fk FOREIGN KEY ( jefe )
        REFERENCES empleado ( cedula_persona );

ALTER TABLE empleado
    ADD CONSTRAINT persona_fk FOREIGN KEY ( cedula_persona )
        REFERENCES persona ( cedula );

ALTER TABLE cliente
    ADD CONSTRAINT persona_fkv1 FOREIGN KEY ( cedula_persona )
        REFERENCES persona ( cedula );

ALTER TABLE producto_ofertado
    ADD CONSTRAINT registro_fk FOREIGN KEY ( id_registro )
        REFERENCES registro_llamadas ( id_registro );

ALTER TABLE empleado
    ADD CONSTRAINT tipo_fk FOREIGN KEY ( tipo_id_tipo )
        REFERENCES tipo ( id_tipo );

ALTER TABLE telefono
    ADD CONSTRAINT tipo_fkv1 FOREIGN KEY ( id_tipo )
        REFERENCES tipo ( id_tipo );

--Corecciones 
ALTER TABLE USUARIOS.EMPLEADO ADD CONSTRAINT FK_SUCURSAL FOREIGN KEY (SUCURSAL_ID_SUCURSAL) REFERENCES USUARIOS.SUCURSAL(ID_SUCURSAL);



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
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
