CREATE DATABASE LINK enlace_financiera	
	CONNECT TO FINANCIERA IDENTIFIED BY financiera
	USING 'financiera:1521/xe';
	
CREATE DATABASE LINK enlace_seguimiento
	CONNECT TO SEGUIMIENTO IDENTIFIED BY seguimiento
	USING 'seguimiento:1521/xe';

-- Sinónimos de la base de datos financiera

CREATE OR REPLACE SYNONYM transferencia FOR 
	transferencia@enlace_financiera;
	
CREATE OR REPLACE SYNONYM retiro FOR 
	retiro@enlace_financiera;
	
CREATE OR REPLACE SYNONYM tarjeta_credito FOR 
	tarjeta_de_credito@enlace_financiera;
	
CREATE OR REPLACE SYNONYM caja FOR 
	caja@enlace_financiera;
	
CREATE OR REPLACE SYNONYM consignacion FOR
	consignacion@enlace_financiera;
	
CREATE OR REPLACE SYNONYM credito FOR 
	credito@enlace_financiera;
	
CREATE OR REPLACE SYNONYM cuenta FOR
	cuenta@enlace_financiera;
	
CREATE OR REPLACE SYNONYM empresa FOR
	empresa@enlace_financiera;
	
CREATE OR REPLACE SYNONYM forma_de_pago FOR
	forma_pago@enlace_financiera;
	
CREATE OR REPLACE SYNONYM movimiento FOR
	movimiento@enlace_financiera;
	
CREATE OR REPLACE SYNONYM pago FOR
	pago@enlace_financiera;
	
CREATE OR REPLACE SYNONYM producto FOR 
	producto@enlace_financiera;
	
CREATE OR REPLACE SYNONYM retiro FOR
	retiro@enlace_financiera;
	
CREATE OR REPLACE SYNONYM seguro FOR
	seguro@enlace_financiera;


-- Sinónimos de la base de datos de seguimiento

CREATE OR REPLACE SYNONYM abono FOR 
	abono@enlace_seguimiento;
	
CREATE OR REPLACE SYNONYMM solicitud FOR
	solicitud@enlace_seguimiento;