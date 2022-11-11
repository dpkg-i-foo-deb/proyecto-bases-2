CREATE DATABASE LINK enlace_financiera	
	CONNECT TO FINANCIERA IDENTIFIED BY financiera
	USING 'financiera:1521/xe';
	
CREATE DATABASE LINK enlace_seguimiento
	CONNECT TO SEGUIMIENTO IDENTIFIED BY seguimiento
	USING 'seguimiento:1521/xe';