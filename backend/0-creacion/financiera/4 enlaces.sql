CREATE PUBLIC DATABASE LINK enlace_usuarios
	CONNECT TO USUARIOS IDENTIFIED BY usuarios
	USING 'usuarios:1521/xe';

CREATE PUBLIC DATABASE LINK enlace_seguimiento
	CONNECT TO SEGUIMIENTO IDENTIFIED BY seguimiento
	USING 'seguimiento:1521/xe';

-- Sinónimos de la base de datos de seguimiento

CREATE OR REPLACE PUBLIC SYNONYM abono FOR 
	abono@enlace_seguimiento;
	
CREATE OR REPLACE PUBLIC SYNONYM solicitud FOR
	solicitud@enlace_seguimiento;


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