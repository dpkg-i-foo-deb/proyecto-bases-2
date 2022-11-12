CREATE PROFILE PERFIL_CAJERO
	LIMIT
		IDLE_TIME 5
		PASSWORD_LIFE_TIME 3
		PASSWORD_GRACE_TIME 1;
		
CREATE USER USUARIO_CAJERO
	IDENTIFIED BY usuario_cajero
	PROFILE PERFIL_CAJERO
	DEFAULT TABLESPACE FINANCIERA
	TEMPORARY TABLESPACE FINANCIERA_TEMP;