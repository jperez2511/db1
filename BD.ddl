-- Generado por Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   en:        2019-09-27 21:35:58 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE user operador1 identified by account unlock 
;

CREATE TABLE operador1.agencias (
    agencia     VARCHAR2(10 BYTE) NOT NULL,
    direccion   VARCHAR2(60 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE operador1.agencias
    ADD CONSTRAINT agencias_pk PRIMARY KEY ( agencia )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE system LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE operador1.citas (
    fechatr    DATE NOT NULL,
    numcita    NUMBER(15) NOT NULL,
    horatr     VARCHAR2(6 BYTE) NOT NULL,
    nombre     VARCHAR2(50 BYTE) NOT NULL,
    apellido   VARCHAR2(50 BYTE) NOT NULL,
    tiposerv   VARCHAR2(10 BYTE) NOT NULL,
    valor      NUMBER(12, 2) NOT NULL,
    estado     VARCHAR2(1 BYTE) NOT NULL,
    agencia    VARCHAR2(3 BYTE) NOT NULL,
    cotizac    NUMBER(3) NOT NULL,
    vendedor   VARCHAR2(10 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE operador1.citas
    ADD CONSTRAINT citas_pk PRIMARY KEY ( numcita )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE system LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE operador1.estados (
    estado        VARCHAR2(10 BYTE) NOT NULL,
    descripserv   VARCHAR2(60 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE operador1.estados
    ADD CONSTRAINT estados_pk PRIMARY KEY ( estado )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE system LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE operador1.servicios (
    tiposerv      VARCHAR2(10 BYTE) NOT NULL,
    descripserv   VARCHAR2(60 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE operador1.servicios
    ADD CONSTRAINT servicios_pk PRIMARY KEY ( tiposerv )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE system LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE operador1.vendedores (
    vendedor    VARCHAR2(10 BYTE) NOT NULL,
    direccion   VARCHAR2(60 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE system LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE operador1.vendedores
    ADD CONSTRAINT vendedores_pk PRIMARY KEY ( vendedor )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE system LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

ALTER TABLE operador1.citas
    ADD CONSTRAINT citas_agencias_fk FOREIGN KEY ( agencia )
        REFERENCES operador1.agencias ( agencia )
    NOT DEFERRABLE;

ALTER TABLE operador1.citas
    ADD CONSTRAINT citas_estados_fk FOREIGN KEY ( estado )
        REFERENCES operador1.estados ( estado )
    NOT DEFERRABLE;

ALTER TABLE operador1.citas
    ADD CONSTRAINT citas_servicios_fk FOREIGN KEY ( tiposerv )
        REFERENCES operador1.servicios ( tiposerv )
    NOT DEFERRABLE;

ALTER TABLE operador1.citas
    ADD CONSTRAINT citas_vendedores_fk FOREIGN KEY ( vendedor )
        REFERENCES operador1.vendedores ( vendedor )
    NOT DEFERRABLE;



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
-- CREATE USER                              1
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
