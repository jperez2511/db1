-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-10-06 22:00:14 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE caja (
    id_caja                      INTEGER NOT NULL,
    codigo_caja                  INTEGER NOT NULL,
    caja                         INTEGER NOT NULL,
    precio_nuevo                 INTEGER NOT NULL,
    cantidad_caja                INTEGER NOT NULL,
    cierre_caja_nombre_usuario   VARCHAR2(50) NOT NULL
);

ALTER TABLE caja ADD CONSTRAINT caja_pk PRIMARY KEY ( id_caja );

CREATE TABLE cierre_caja (
    nombre_usuario    VARCHAR2(50) NOT NULL,
    efectivo          INTEGER NOT NULL,
    tarjeta_credito   INTEGER,
    tarjeta_debito    INTEGER,
    credito_30        INTEGER,
    credito_15        INTEGER,
    fecha             DATE NOT NULL,
    total_vendido     INTEGER NOT NULL
);

ALTER TABLE cierre_caja ADD CONSTRAINT cierre_caja_pk PRIMARY KEY ( nombre_usuario );

CREATE TABLE cobros (
    cliente                      VARCHAR2(50) NOT NULL,
    contacto                     VARCHAR2(50),
    telefono                     INTEGER,
    email                        VARCHAR2(50) NOT NULL,
    monto                        INTEGER NOT NULL,
    fecha_factura                DATE NOT NULL,
    fecha_actual                 DATE NOT NULL,
    cierre_caja_nombre_usuario   VARCHAR2(50) NOT NULL
);

ALTER TABLE cobros ADD CONSTRAINT cobros_pk PRIMARY KEY ( cliente );

ALTER TABLE caja
    ADD CONSTRAINT caja_cierre_caja_fk FOREIGN KEY ( cierre_caja_nombre_usuario )
        REFERENCES cierre_caja ( nombre_usuario );

ALTER TABLE cobros
    ADD CONSTRAINT cobros_cierre_caja_fk FOREIGN KEY ( cierre_caja_nombre_usuario )
        REFERENCES cierre_caja ( nombre_usuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              5
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
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
-- ERRORS                                   0
-- WARNINGS                                 0
