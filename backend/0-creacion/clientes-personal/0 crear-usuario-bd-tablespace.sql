CREATE USER clientes_personal WITH
	-- Los usuarios no tienen tablespace aquí
	ENCRYPTED PASSWORD 'clientes_personal';
	
--Ahora creamos el tablespace para la base de datos

CREATE TABLESPACE clientes_personal	
	OWNER clientes_personal
	-- Datafile se reemplaza con location
	LOCATION '/var/lib/postgresql/';
	
--Finalmente, creamos la base de datos, esto no es Oracle
CREATE DATABASE clientes_personal WITH
	OWNER clientes_personal
	TABLESPACE clientes_personal
	