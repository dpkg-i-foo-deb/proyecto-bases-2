CREATE PUBLIC DATABASE LINK enlace_financiera	
	CONNECT TO FINANCIERA IDENTIFIED BY financiera
	USING 'financiera:1521/xe';
	
CREATE PUBLIC DATABASE LINK enlace_seguimiento
	CONNECT TO SEGUIMIENTO IDENTIFIED BY seguimiento
	USING 'seguimiento:1521/xe';

-- Sinónimos de la base de datos financiera

CREATE OR REPLACE PUBLIC SYNONYM transferencia FOR 
	transferencia@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM retiro FOR 
	retiro@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM tarjeta_credito FOR 
	tarjeta_de_credito@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM caja FOR 
	caja@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM consignacion FOR
	consignacion@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM credito FOR 
	credito@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM cuenta FOR
	cuenta@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM empresa FOR
	empresa@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM forma_de_pago FOR
	forma_pago@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM movimiento FOR
	movimiento@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM pago FOR
	pago@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM producto FOR 
	producto@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM retiro FOR
	retiro@enlace_financiera;
	
CREATE OR REPLACE PUBLIC SYNONYM seguro FOR
	seguro@enlace_financiera;


-- Sinónimos de la base de datos de seguimiento

CREATE OR REPLACE PUBLIC SYNONYM abono FOR 
	abono@enlace_seguimiento;
	
CREATE OR REPLACE PUBLIC SYNONYM solicitud FOR
	solicitud@enlace_seguimiento;