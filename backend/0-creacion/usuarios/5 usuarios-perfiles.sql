CREATE PROFILE PERFIL_CLIENTE
	LIMIT 
		IDLE_TIME 20;
		
CREATE USER USUARIO_CLIENTE 
	IDENTIFIED BY usuario_cliente
	PROFILE PERFIL_CLIENTE
	DEFAULT TABLESPACE USUARIOS
	TEMPORARY TABLESPACE USUARIOS_TEMP;

CREATE PROFILE PERFIL_JEFE_OFICINA
	LIMIT 
		FAILED_LOGIN_ATTEMPTS 1
		PASSWORD_LOCK_TIME 3
		PASSWORD_LIFE_TIME 7
		PASSWORD_GRACE_TIME 1;
		
CREATE USER USUARIO_JEFE_OFICINA
	IDENTIFIED BY usuario_jefe_oficina
	PROFILE PERFIL_JEFE_OFICINA
	DEFAULT TABLESPACE USUARIOS
	TEMPORARY TABLESPACE USUARIOS_TEMP;