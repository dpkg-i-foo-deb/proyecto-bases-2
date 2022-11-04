CREATE TABLESPACE financiera 
   DATAFILE 'financiera.dbf' 
   SIZE 10m; 

 CREATE TEMPORARY TABLESPACE financiera_temp
   TEMPFILE 'financiera_temp.dbf'
   SIZE 10m;

 CREATE USER financiera
    IDENTIFIED BY financiera
    DEFAULT TABLESPACE financiera
    TEMPORARY TABLESPACE financiera_temp;

GRANT CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, 
  CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, 
  CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, 
  CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE 
  TO financiera;