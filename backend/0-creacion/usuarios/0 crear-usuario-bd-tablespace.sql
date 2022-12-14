
CREATE TABLESPACE usuarios 
   DATAFILE 'usuarios.dbf' 
   SIZE 10m; 

 CREATE TEMPORARY TABLESPACE usuarios_temp
   TEMPFILE 'usuarios_temp.dbf'
   SIZE 10m;

 CREATE USER usuarios
    IDENTIFIED BY usuarios
    DEFAULT TABLESPACE usuarios
    TEMPORARY TABLESPACE usuarios_temp;

GRANT CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, 
  CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
  CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, 
  CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE 
  TO usuarios;