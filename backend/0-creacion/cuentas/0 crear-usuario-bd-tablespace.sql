CREATE USER cuentas WITH
	-- Los usuarios no tienen tablespace aquí
	ENCRYPTED PASSWORD 'cuentas';
	
--Ahora creamos el tablespace para la base de datos

CREATE TABLESPACE cuentas
	OWNER cuentas
	-- Datafile se reemplaza con location
	LOCATION '/var/lib/postgresql/';
	
--Finalmente, creamos la base de datos, esto no es Oracle
CREATE DATABASE cuentas WITH
	OWNER cuentas
	TABLESPACE cuentas
	