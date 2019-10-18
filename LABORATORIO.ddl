-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-10-16 23:25:43 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE cargo (
    id_cargo               INTEGER NOT NULL,
    nombre_cargo           VARCHAR2(50 CHAR),
    id_empleado            INTEGER NOT NULL,
    empleado_id_empleado   INTEGER NOT NULL
);

CREATE UNIQUE INDEX cargo__idx ON
    cargo (
        empleado_id_empleado
    ASC );

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( id_cargo );

CREATE TABLE departamento (
    id_departamento              INTEGER NOT NULL,
    nombre                       VARCHAR2(50 CHAR),
    id_encargado                 VARCHAR2(50 CHAR),
    id_laboratorio               INTEGER NOT NULL,
    laboratorio_id_laboratorio   INTEGER NOT NULL
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( id_departamento );

CREATE TABLE empleado (
    id_empleado                    INTEGER NOT NULL,
    nombre                         VARCHAR2(50 CHAR),
    apellido                       VARCHAR2(50 CHAR),
    direccion                      VARCHAR2(50 CHAR),
    telefono                       INTEGER,
    correo                         VARCHAR2(50 CHAR),
    fecha_nacimiento               VARCHAR2(50 CHAR),
    departamento_id_departamento   INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( id_empleado );

CREATE TABLE laboratorio (
    id_laboratorio   INTEGER NOT NULL,
    nombre           VARCHAR2(50 CHAR),
    direccion        VARCHAR2(50 CHAR)
);

ALTER TABLE laboratorio ADD CONSTRAINT laboratorio_pk PRIMARY KEY ( id_laboratorio );

CREATE TABLE materia_prima (
    id_materia_prima     INTEGER NOT NULL,
    nombre               VARCHAR2(50 CHAR),
    cantidad             VARCHAR2(50 CHAR),
    pintura_id_pintura   INTEGER NOT NULL
);

ALTER TABLE materia_prima ADD CONSTRAINT materia_prima_pk PRIMARY KEY ( id_materia_prima );

CREATE TABLE pintura (
    id_pintura       INTEGER NOT NULL,
    nombre_pintura   VARCHAR2(50 CHAR),
    codigo_color     VARCHAR2(50 CHAR),
    patron_color     VARCHAR2(50 CHAR),
    calidad          VARCHAR2(50 CHAR),
    tipo_pintura     VARCHAR2(50 CHAR)
);

ALTER TABLE pintura ADD CONSTRAINT pintura_pk PRIMARY KEY ( id_pintura );

CREATE TABLE proceso (
    id_proceso                     INTEGER NOT NULL,
    nombre_proceso                 VARCHAR2(50 CHAR),
    departamento_id_departamento   INTEGER NOT NULL
);

CREATE UNIQUE INDEX proceso__idx ON
    proceso (
        departamento_id_departamento
    ASC );

ALTER TABLE proceso ADD CONSTRAINT proceso_pk PRIMARY KEY ( id_proceso );

CREATE TABLE proveedores (
    id_proveedor   INTEGER NOT NULL,
    nombre         VARCHAR2(50 CHAR) NOT NULL,
    direccion      VARCHAR2(50 CHAR),
    telefono       INTEGER,
    nit            VARCHAR2(50 CHAR)
);

ALTER TABLE proveedores ADD CONSTRAINT proveedores_pk PRIMARY KEY ( id_proveedor );

CREATE TABLE relation_18 (
    materia_prima_id_materia_prima   INTEGER NOT NULL,
    proveedores_id_proveedor         INTEGER NOT NULL
);

ALTER TABLE relation_18 ADD CONSTRAINT relation_18_pk PRIMARY KEY ( materia_prima_id_materia_prima,
                                                                    proveedores_id_proveedor );

CREATE TABLE relation_20 (
    laboratorio_id_laboratorio   INTEGER NOT NULL,
    proveedores_id_proveedor     INTEGER NOT NULL
);

ALTER TABLE relation_20 ADD CONSTRAINT relation_20_pk PRIMARY KEY ( laboratorio_id_laboratorio,
                                                                    proveedores_id_proveedor );

ALTER TABLE cargo
    ADD CONSTRAINT cargo_empleado_fk FOREIGN KEY ( empleado_id_empleado )
        REFERENCES empleado ( id_empleado );

ALTER TABLE departamento
    ADD CONSTRAINT departamento_laboratorio_fk FOREIGN KEY ( laboratorio_id_laboratorio )
        REFERENCES laboratorio ( id_laboratorio );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE materia_prima
    ADD CONSTRAINT materia_prima_pintura_fk FOREIGN KEY ( pintura_id_pintura )
        REFERENCES pintura ( id_pintura );

ALTER TABLE proceso
    ADD CONSTRAINT proceso_departamento_fk FOREIGN KEY ( departamento_id_departamento )
        REFERENCES departamento ( id_departamento );

ALTER TABLE relation_18
    ADD CONSTRAINT relation_18_materia_prima_fk FOREIGN KEY ( materia_prima_id_materia_prima )
        REFERENCES materia_prima ( id_materia_prima );

ALTER TABLE relation_18
    ADD CONSTRAINT relation_18_proveedores_fk FOREIGN KEY ( proveedores_id_proveedor )
        REFERENCES proveedores ( id_proveedor );

ALTER TABLE relation_20
    ADD CONSTRAINT relation_20_laboratorio_fk FOREIGN KEY ( laboratorio_id_laboratorio )
        REFERENCES laboratorio ( id_laboratorio );

ALTER TABLE relation_20
    ADD CONSTRAINT relation_20_proveedores_fk FOREIGN KEY ( proveedores_id_proveedor )
        REFERENCES proveedores ( id_proveedor );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             2
-- ALTER TABLE                             19
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
-- ERRORS                                   2
-- WARNINGS                                 0
