CREATE OR REPLACE VIEW CAJA_VISTA AS (
	SELECT c.ID_CAJA , c.NOMBRE , c.SUCURSAL_ID_SUCURSAL 
		FROM CAJA c
);

CREATE OR REPLACE VIEW CONSIGNACION_VISTA AS (
	SELECT c.MOVIMIENTO_ID_MOVIMIENTO , c.FECHA , c.CUENTA_DESTINO 
		FROM CONSIGNACION c 
);

CREATE OR REPLACE VIEW CREDITO_VISTA AS (
	SELECT c.TASA_INTERES , c.PLAZO , c.PRODUCTO_ID_PRODUCTO , c.FORMA_PAGO_FORMA_PAGO , c.TIPO_ID_TIPO , c.MONTO_PRESTAMO , c.PERSONA_CEDULA 
		FROM CREDITO c 
);

CREATE OR REPLACE VIEW CUENTA_VISTA AS (
	SELECT c.SALDO , c.CLIENTE_PERSONA_CEDULA , c.TIPO_ID_TIPO , c.PRODUCTO_ID_PRODUCTO , c.EMPRESA_ID_EMPRESA  
		FROM CUENTA c 
);

CREATE OR REPLACE VIEW EMPRESA_VISTA AS (
	SELECT e.NOMBRE , e.ID_EMPRESA 
		FROM EMPRESA e 
);

CREATE OR REPLACE VIEW FORMA_PAGO_VISTA AS (
	SELECT fp.FORMA_PAGO 
		FROM FORMA_PAGO fp 
);

CREATE OR REPLACE VIEW MOVIMIENTO_VISTA AS (
	SELECT m.ID_MOVIMIENTO , m.CLIENTE_PERSONA_CEDULA , m.TURNO_EMPLEADO , m.MONTO 
		FROM MOVIMIENTO m 
);

CREATE OR REPLACE VIEW PAGO_VISTA AS (
	SELECT p.MOVIMIENTO_ID_MOVIMIENTO , p.EMPRESA_ID_EMPRESA , p.CUENTA_ORIGEN , p.CUENTA_DESTINO 
		FROM PAGO p 
);

CREATE OR REPLACE VIEW PRODUCTO_VISTA AS (
	SELECT p.ID_PRODUCTO 
		FROM PRODUCTO p
);


CREATE OR REPLACE VIEW RETIRO_VISTA AS (
	SELECT r.MOVIMIENTO_ID_MOVIMIENTO , r.CUENTA_RETIRO 
		FROM RETIRO r
);

CREATE OR REPLACE VIEW SEGURO_VISTA AS (
	SELECT s.PERIODO_DURACION , s.TIPO_SEGURO , s.PRODUCTO_ID_PRODUCTO , s.PERSONA_CEDULA 
		FROM SEGURO s
);

CREATE OR REPLACE VIEW TARJETA_CREDITO_VISTA AS (
	SELECT tdc.FECHA_DE_VENCIMIENTO, tdc.CODIGO_CVV , tdc.CLIENTE_PERSONA_CEDULA , tdc.CUPO , tdc.CUPO_UTILIZADO , tdc.PRODUCTO_ID_PRODUCTO , tdc.TIPO_ID_TIPO 
		FROM TARJETA_DE_CREDITO tdc 
);

CREATE OR REPLACE VIEW TRANSFERENCIA_VISTA AS (
	SELECT t.MOVIMIENTO_ID_MOVIMIENTO , t.CUENTA_ORIGEN , t.CUENTA_DESTINO 
		FROM TRANSFERENCIA t 
);