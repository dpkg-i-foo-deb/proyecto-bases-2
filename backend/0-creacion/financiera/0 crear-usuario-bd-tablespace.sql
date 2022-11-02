CREATE USER financiera WITH
	-- Los usuarios no tienen tablespace aquí
	ENCRYPTED PASSWORD 'financiera';
	
--Ahora creamos el tablespace para la base de datos

CREATE TABLESPACE financiera
	OWNER financiera
	-- Datafile se reemplaza con location
	LOCATION '/var/lib/postgresql/';
	
--Finalmente, creamos la base de datos, esto no es Oracle
CREATE DATABASE financiera WITH
	OWNER financiera
	TABLESPACE financiera
	