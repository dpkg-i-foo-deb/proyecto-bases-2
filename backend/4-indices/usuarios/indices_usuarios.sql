-- Indices Tabla Empleado
CREATE INDEX tipo
ON empleado( tipo_id_tipo )
TABLESPACE indices

CREATE INDEX jefe
ON empleado( jefe )
TABLESPACE indices

CREATE INDEX sucursal
ON empleado( sucursal_id_sucursal )
TABLESPACE indices

-- Indices Tabla Factura
CREATE INDEX monto
ON factura( monto )
TABLESPACE indices

CREATE INDEX fecha_vencimiento
ON factura( fecha_vencimiento )
TABLESPACE indices

CREATE INDEX producto
ON factura( id_producto )
TABLESPACE indices

CREATE INDEX cliente
ON factura( cedula_cliente )
TABLESPACE indices


