-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-10-10 01:18:03 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE areatrabajo (
    codarea   INTEGER NOT NULL,
    nomarea   VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE areatrabajo ADD CONSTRAINT areatrabajo_pk PRIMARY KEY ( codarea );

CREATE TABLE empleado (
    codempleado           INTEGER NOT NULL,
    nomempleado           VARCHAR2(30 BYTE) NOT NULL,
    sexempleado           CHAR(1 CHAR) NOT NULL,
    fechanac              DATE NOT NULL,
    fechaingreso          DATE NOT NULL,
    salarioempleado       FLOAT NOT NULL,
    cargoempleado         VARCHAR2(15 BYTE) NOT NULL,
    areatrabajo_codarea   INTEGER NOT NULL
);

ALTER TABLE empleado ADD CONSTRAINT empleado_pk PRIMARY KEY ( codempleado );

CREATE TABLE rol (
    idrol         INTEGER NOT NULL,
    descripcion   VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE rol ADD CONSTRAINT rol_pk PRIMARY KEY ( idrol );

CREATE TABLE usuario (
    idusuario              INTEGER NOT NULL,
    nomusuario             VARCHAR2(45) NOT NULL,
    contraseña             VARCHAR2(45 BYTE) NOT NULL,
    correoelectr           VARCHAR2(45 BYTE) NOT NULL,
    empleado_codempleado   INTEGER NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( idusuario );

CREATE TABLE usuario_rol (
    idusiario           INTEGER NOT NULL,
    idrol               INTEGER NOT NULL,
    usuario_idusuario   INTEGER NOT NULL,
    rol_idrol           INTEGER NOT NULL
);

ALTER TABLE usuario_rol ADD CONSTRAINT usuario_rol_pk PRIMARY KEY ( idusiario,
                                                                    idrol );

ALTER TABLE empleado
    ADD CONSTRAINT empleado_areatrabajo_fk FOREIGN KEY ( areatrabajo_codarea )
        REFERENCES areatrabajo ( codarea );

ALTER TABLE usuario
    ADD CONSTRAINT usuario_empleado_fk FOREIGN KEY ( empleado_codempleado )
        REFERENCES empleado ( codempleado );

ALTER TABLE usuario_rol
    ADD CONSTRAINT usuario_rol_rol_fk FOREIGN KEY ( rol_idrol )
        REFERENCES rol ( idrol );

ALTER TABLE usuario_rol
    ADD CONSTRAINT usuario_rol_usuario_fk FOREIGN KEY ( usuario_idusuario )
        REFERENCES usuario ( idusuario );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                              9
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
