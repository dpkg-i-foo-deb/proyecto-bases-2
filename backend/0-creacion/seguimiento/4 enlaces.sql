CREATE PUBLIC DATABASE LINK enlace_financiera
	CONNECT TO FINANCIERA IDENTIFIED BY financiera
	USING 'financiera:1521/xe';
	
CREATE PUBLIC DATABASE LINK enlace_usuarios
	CONNECT TO USUARIOS IDENTIFIED BY usuarios
	USING 'usuarios:1521/xe';

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


-- Sinónimos de la base de datos de usuarios

CREATE OR REPLACE PUBLIC SYNONYM ciudad FOR 
	ciudad@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM cliente FOR
	cliente@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM departamento FOR 
	departamento@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM empleado FOR
	empleado@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM factura FOR
	factura@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM pais FOR 
	pais@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM persona FOR
	persona@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM producto_ofertado FOR
	producto_ofertado@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM registro_llamadas FOR
	registro_llamadas@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM sucursal FOR
	sucursal@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM telefono FOR
	sucursal@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM tipo FOR
	tipo@enlace_usuarios;

CREATE OR REPLACE PUBLIC SYNONYM turno_empleado FOR
	turno_empleado@enlace_usuarios;