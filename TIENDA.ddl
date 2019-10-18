-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-10-18 13:28:00 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE cambio_devolucion (
    iddevolucion       INTEGER NOT NULL,
    cantidadproducto   INTEGER NOT NULL,
    precioproducto     INTEGER NOT NULL,
    fechadevolucion    DATE NOT NULL,
    descripcion        CHAR(100 CHAR) NOT NULL
);

ALTER TABLE cambio_devolucion ADD CONSTRAINT cambio_devolucion_pk PRIMARY KEY ( iddevolucion );

CREATE TABLE empleado (
    idempleado        INTEGER NOT NULL,
    nombreempleado    CHAR(50 CHAR) NOT NULL,
    dirreccion        CHAR(50 CHAR) NOT NULL,
    telefono          INTEGER NOT NULL,
    tienda_idtienda   INTEGER NOT NULL,
    rango_idcargo     INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( idempleado );

CREATE TABLE factura (
    idfcatura         INTEGER NOT NULL,
    nit               INTEGER,
    foliofactura      CHAR(100 CHAR) NOT NULL,
    dirrecciotienda   CHAR(50 CHAR) NOT NULL,
    montofactura      INTEGER NOT NULL,
    fechafactura      DATE NOT NULL
);

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( idfcatura );

CREATE TABLE inventario (
    existencias               INTEGER NOT NULL,
    promociones_idpromocion   INTEGER NOT NULL,
    producto_idproducto       INTEGER NOT NULL,
    proveedor_idproveedor     INTEGER NOT NULL,
    tienda_idtienda           INTEGER NOT NULL
);

ALTER TABLE inventario
    ADD CONSTRAINT inventario_pk PRIMARY KEY ( tienda_idtienda,
                                               promociones_idpromocion,
                                               proveedor_idproveedor );

CREATE TABLE producto (
    idproducto       INTEGER NOT NULL,
    nombreproducto   CHAR(50 CHAR) NOT NULL,
    drescripcion     CHAR(100 CHAR) NOT NULL,
    precio           INTEGER NOT NULL,
    sku              INTEGER NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( idproducto );

CREATE TABLE promociones (
    idpromocion   INTEGER NOT NULL,
    fechainicio   DATE NOT NULL,
    fechafin      DATE NOT NULL
);

ALTER TABLE promociones ADD CONSTRAINT promociones_pk PRIMARY KEY ( idpromocion );

CREATE TABLE proveedor (
    idproveedor          INTEGER NOT NULL,
    nit                  INTEGER NOT NULL,
    direccionproveedor   CHAR(50 CHAR) NOT NULL,
    telefonoproveedor    INTEGER NOT NULL,
    girocomercial        CHAR(100 CHAR) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( idproveedor );

CREATE TABLE rango (
    idcargo     INTEGER NOT NULL,
    cargo       CHAR(50 CHAR) NOT NULL,
    desccargo   CHAR(100 CHAR) NOT NULL
);

ALTER TABLE rango ADD CONSTRAINT rango_pk PRIMARY KEY ( idcargo );

CREATE TABLE rventa (
    monto                 INTEGER NOT NULL,
    tipopago_idtipopago   INTEGER NOT NULL,
    rventa_id             NUMBER NOT NULL
);

ALTER TABLE rventa ADD CONSTRAINT rventa_pk PRIMARY KEY ( rventa_id );

CREATE TABLE ticked (
    idticked                         INTEGER NOT NULL,
    fechaventa                       DATE NOT NULL,
    montototal                       INTEGER NOT NULL,
    factura_idfcatura                INTEGER NOT NULL,
    cambio_devolucion_iddevolucion   INTEGER NOT NULL,
    rventa_rventa_id                 NUMBER NOT NULL
);

ALTER TABLE ticked ADD CONSTRAINT ticked_pk PRIMARY KEY ( idticked,
                                                          factura_idfcatura );

CREATE TABLE tienda (
    idtienda        INTEGER NOT NULL,
    nombre_tienda   CHAR(50 CHAR) NOT NULL,
    direccion       CHAR(50 CHAR) NOT NULL,
    telefono        INTEGER NOT NULL,
    gerente         CHAR(50 CHAR) NOT NULL
);

ALTER TABLE tienda ADD CONSTRAINT tienda_pk PRIMARY KEY ( idtienda );

CREATE TABLE tipopago (
    idtipopago     INTEGER NOT NULL,
    tipopago       CHAR(50 CHAR) NOT NULL,
    desctipopago   CHAR(100 CHAR)
);

ALTER TABLE tipopago ADD CONSTRAINT tipopago_pk PRIMARY KEY ( idtipopago );

CREATE TABLE ventas (
    idventa                              INTEGER NOT NULL,
    monto                                INTEGER NOT NULL,
    cantidadprocucto                     INTEGER NOT NULL,
    ticked_idticked                      INTEGER NOT NULL,
    inventario_tienda_idtienda           INTEGER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    inventario_promociones_idpromocion   INTEGER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    inventario_proveedor_idproveedor     INTEGER NOT NULL,
    ticked_idfcatura                     INTEGER NOT NULL
);

ALTER TABLE ventas
    ADD CONSTRAINT ventas_pk PRIMARY KEY ( idventa,
                                           inventario_tienda_idtienda,
                                           inventario_promociones_idpromocion,
                                           inventario_proveedor_idproveedor );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_rango_fk FOREIGN KEY ( rango_idcargo )
        REFERENCES rango ( idcargo );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_tienda_fk FOREIGN KEY ( tienda_idtienda )
        REFERENCES tienda ( idtienda );

ALTER TABLE inventario
    ADD CONSTRAINT inventario_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

ALTER TABLE inventario
    ADD CONSTRAINT inventario_promociones_fk FOREIGN KEY ( promociones_idpromocion )
        REFERENCES promociones ( idpromocion );

ALTER TABLE inventario
    ADD CONSTRAINT inventario_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE inventario
    ADD CONSTRAINT inventario_tienda_fk FOREIGN KEY ( tienda_idtienda )
        REFERENCES tienda ( idtienda );

ALTER TABLE rventa
    ADD CONSTRAINT rventa_tipopago_fk FOREIGN KEY ( tipopago_idtipopago )
        REFERENCES tipopago ( idtipopago );

ALTER TABLE ticked
    ADD CONSTRAINT ticked_cambio_devolucion_fk FOREIGN KEY ( cambio_devolucion_iddevolucion )
        REFERENCES cambio_devolucion ( iddevolucion );

ALTER TABLE ticked
    ADD CONSTRAINT ticked_factura_fk FOREIGN KEY ( factura_idfcatura )
        REFERENCES factura ( idfcatura );

ALTER TABLE ticked
    ADD CONSTRAINT ticked_rventa_fk FOREIGN KEY ( rventa_rventa_id )
        REFERENCES rventa ( rventa_id );

ALTER TABLE ventas
    ADD CONSTRAINT ventas_inventario_fk FOREIGN KEY ( inventario_tienda_idtienda,
                                                      inventario_promociones_idpromocion,
                                                      inventario_proveedor_idproveedor )
        REFERENCES inventario ( tienda_idtienda,
                                promociones_idpromocion,
                                proveedor_idproveedor );

ALTER TABLE ventas
    ADD CONSTRAINT ventas_ticked_fk FOREIGN KEY ( ticked_idticked,
                                                  ticked_idfcatura )
        REFERENCES ticked ( idticked,
                            factura_idfcatura );

CREATE SEQUENCE rventa_rventa_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rventa_rventa_id_trg BEFORE
    INSERT ON rventa
    FOR EACH ROW
    WHEN ( new.rventa_id IS NULL )
BEGIN
    :new.rventa_id := rventa_rventa_id_seq.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           1
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   2
-- WARNINGS                                 0
