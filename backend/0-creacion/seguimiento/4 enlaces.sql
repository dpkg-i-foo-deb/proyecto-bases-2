CREATE DATABASE LINK enlace_financiera
	CONNECT TO FINANCIERA IDENTIFIED BY financiera
	USING 'financiera:1521/xe';
	
CREATE DATABASE LINK enlace_usuarios
	CONNECT TO USUARIOS IDENTIFIED BY usuarios
	USING 'usuarios:1521/xe';

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


-- Sinónimos de la base de datos de usuarios

CREATE OR REPLACE SYNONYM ciudad FOR 
	ciudad@enlace_usuarios;

CREATE OR REPLACE SYNONYM cliente FOR
	cliente@enlace_usuarios;

CREATE OR REPLACE SYNONYM departamento FOR 
	departamento@enlace_usuarios;

CREATE OR REPLACE SYNONYM empleado FOR
	empleado@enlace_usuarios;

CREATE OR REPLACE SYNONYM factura FOR
	factura@enlace_usuarios;

CREATE OR REPLACE SYNONYM pais FOR 
	pais@enlace_usuarios;

CREATE OR REPLACE SYNONYM persona FOR
	persona@enlace_usuarios;

CREATE OR REPLACE SYNONYM producto_ofertado FOR
	producto_ofertado@enlace_usuarios;

CREATE OR REPLACE SYNONYM registro_llamadas FOR
	registro_llamadas@enlace_usuarios;

CREATE OR REPLACE SYNONYM sucursal FOR
	sucursal@enlace_usuarios;

CREATE OR REPLACE SYNONYM telefono FOR
	sucursal@enlace_usuarios;

CREATE OR REPLACE SYNONYM tipo FOR
	tipo@enlace_usuarios;

CREATE OR REPLACE SYNONYM turno_empleado FOR
	turno_empleado@enlace_usuarios;