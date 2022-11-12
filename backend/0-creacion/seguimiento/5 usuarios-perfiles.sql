CREATE PROFILE PERFIL_ANALISTA_CREDITOS
	LIMIT
		FAILED_LOGIN_ATTEMPTS 3
		PASSWORD_LOCK_TIME 2;
		
CREATE USER USUARIO_ANALISTA_CREDITOS
	IDENTIFIED BY usuario_analista_creditos
	PROFILE PERFIL_ANALISTA_CREDITOS
	DEFAULT TABLESPACE SEGUIMIENTO
	TEMPORARY TABLESPACE SEGUIMIENTO_TEMP;
	