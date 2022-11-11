CREATE TABLESPACE PARAMETRICAS
	DATAFILE 'parametricas.dbf'
	SIZE 10m
	AUTOEXTEND ON
		MAXSIZE 421m;
		
CREATE TABLESPACE EMPLEADOS_CLIENTES
	DATAFILE 'empleados_clientes.dbf'
	SIZE 10m
	AUTOEXTEND ON
		MAXSIZE 6899m;
		
CREATE TABLESPACE VENTAS
	DATAFILE 'ventas.dbf'
	SIZE 10m
	AUTOEXTEND ON
		-- No tenemos un disco de 2TB
		-- MAXSIZE 1903418m;
		MAXSIZE 100m;
        

ALTER TABLE USUARIOS.PAIS MOVE TABLESPACE PARAMETRICAS;
ALTER TABLE USUARIOS.DEPARTAMENTO MOVE TABLESPACE PARAMETRICAS;
ALTER TABLE USUARIOS.CIUDAD MOVE TABLESPACE PARAMETRICAS;
ALTER TABLE USUARIOS.SUCURSAL MOVE TABLESPACE PARAMETRICAS;
ALTER TABLE USUARIOS.TIPO MOVE TABLESPACE PARAMETRICAS;

ALTER INDEX USUARIOS.PAIS_PK REBUILD;
ALTER INDEX USUARIOS.DEPARTAMENTO_PK REBUILD;
ALTER INDEX USUARIOS.CIUDAD_PK REBUILD;
ALTER INDEX USUARIOS.SUCURSAL_PK REBUILD;
ALTER INDEX USUARIOS.TIPO_PK REBUILD;



ALTER TABLE USUARIOS.EMPLEADO MOVE TABLESPACE EMPLEADOS_CLIENTES;
ALTER TABLE USUARIOS.TELEFONO MOVE TABLESPACE EMPLEADOS_CLIENTES;
ALTER TABLE USUARIOS.PERSONA MOVE TABLESPACE EMPLEADOS_CLIENTES;
ALTER TABLE USUARIOS.CLIENTE MOVE TABLESPACE EMPLEADOS_CLIENTES;

ALTER INDEX USUARIOS.EMPLEADO_PK REBUILD;
ALTER INDEX USUARIOS.TELEFONO_PK REBUILD;
ALTER INDEX USUARIOS.PERSONA_PK REBUILD;
ALTER INDEX USUARIOS.CLIENTE_PK REBUILD;



ALTER TABLE USUARIOS.TURNO_EMPLEADO MOVE TABLESPACE VENTAS;
ALTER TABLE USUARIOS.REGISTRO_LLAMADAS MOVE TABLESPACE VENTAS;
ALTER TABLE USUARIOS.PRODUCTO_OFERTADO MOVE TABLESPACE VENTAS;
ALTER TABLE USUARIOS.FACTURA MOVE TABLESPACE VENTAS;

ALTER INDEX USUARIOS.TURNO_EMPLEADO_PK REBUILD;
ALTER INDEX USUARIOS.REGISTRO_LLAMADAS_PK REBUILD;
ALTER INDEX USUARIOS.PRODUCTO_OFERTADO_PK REBUILD;
ALTER INDEX USUARIOS.FACTURA_PK REBUILD;