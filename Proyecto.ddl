-- Generado por Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   en:        2019-10-14 20:35:59 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE catalogodepartamento (
    iddepartamento   INTEGER NOT NULL,
    departamento     VARCHAR(50) NOT NULL
);

ALTER TABLE catalogodepartamento ADD CONSTRAINT catalogodepartamento_pk PRIMARY KEY ( iddepartamento );

CREATE TABLE catalogoestadopedido (
    idestado       INTEGER NOT NULL,
    nombreestado   VARCHAR(25) NOT NULL
);

ALTER TABLE catalogoestadopedido ADD CONSTRAINT catalogoestadopedido_pk PRIMARY KEY ( idestado );

CREATE TABLE catalogomunicipio (
    idmunicipio                           INTEGER NOT NULL,
    nombremunicipio                       VARCHAR(50) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    catalogodepartamento_iddepartamento   INTEGER NOT NULL
);

ALTER TABLE catalogomunicipio ADD CONSTRAINT catalogomunicipio_pk PRIMARY KEY ( idmunicipio );

CREATE TABLE catalogozona (
    idzona       INTEGER NOT NULL,
    nombrezona   VARCHAR2(25) NOT NULL
);

ALTER TABLE catalogozona ADD CONSTRAINT catalogozona_pk PRIMARY KEY ( idzona );

CREATE TABLE categoria (
    idcategoria            INTEGER NOT NULL,
    nombrecategoria        VARCHAR2(100) NOT NULL,
    descripcioncategoria   VARCHAR2(200)
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( idcategoria );

CREATE TABLE direccionproveedor (
    iddireccionproveedor                  INTEGER NOT NULL,
    direccionproveedor                    VARCHAR(100) NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    catalogodepartamento_iddepartamento   INTEGER NOT NULL,
    catalogozona_idzona                   INTEGER NOT NULL,
    catalogomunicipio_idmunicipio         INTEGER NOT NULL,
    proveedor_idproveedor                 INTEGER NOT NULL
);

ALTER TABLE direccionproveedor ADD CONSTRAINT direccionproveedor_pk PRIMARY KEY ( iddireccionproveedor );

CREATE TABLE lineapedido (
    idlinea                    INTEGER NOT NULL,
    unidades                   INTEGER NOT NULL,
    pedidoproveedor_idpedido   INTEGER NOT NULL,
    producto_idproducto        INTEGER NOT NULL
);

ALTER TABLE lineapedido ADD CONSTRAINT lineapedido_pk PRIMARY KEY ( idlinea );

CREATE TABLE marca (
    idmarca            INTEGER NOT NULL,
    nombremarca        VARCHAR2(100) NOT NULL,
    descripcionmarca   VARCHAR2(200)
);

ALTER TABLE marca ADD CONSTRAINT marca_pk PRIMARY KEY ( idmarca );

CREATE TABLE marca_producto (
    producto_idproducto   INTEGER NOT NULL,
    marca_idmarca         INTEGER NOT NULL
);

ALTER TABLE marca_producto ADD CONSTRAINT marca_producto_pk PRIMARY KEY ( producto_idproducto,
                                                                          marca_idmarca );

CREATE TABLE pedidoproveedor (
    idpedido                        INTEGER NOT NULL,
    fechapedido                     DATE NOT NULL,
    catalogoestadopedido_idestado   INTEGER NOT NULL,
    proveedor_idproveedor           INTEGER NOT NULL
);

ALTER TABLE pedidoproveedor ADD CONSTRAINT pedidoproveedor_pk PRIMARY KEY ( idpedido );

CREATE TABLE producto (
    idproducto              INTEGER NOT NULL,
    nombreproduco           VARCHAR(100) NOT NULL,
    descripcionproducto     VARCHAR(200),
    categoria_idcategoria   INTEGER NOT NULL,
    precio                  NUMBER(2) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( idproducto );

CREATE TABLE proveedor (
    idproveedor       INTEGER NOT NULL,
    nombreproveedor   VARCHAR(100) NOT NULL,
    nit               VARCHAR(50) NOT NULL,
    email             VARCHAR(100)
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( idproveedor );

CREATE TABLE proveedor_producto (
    proveedor_idproveedor   INTEGER NOT NULL,
    producto_idproducto     INTEGER NOT NULL
);

ALTER TABLE proveedor_producto ADD CONSTRAINT proveedor_producto_pk PRIMARY KEY ( proveedor_idproveedor,
                                                                                  producto_idproducto );

CREATE TABLE telefonoproveedor (
    idtelefonoproveedor     INTEGER NOT NULL,
    telefono                VARCHAR(50) NOT NULL,
    proveedor_idproveedor   INTEGER NOT NULL
);

ALTER TABLE telefonoproveedor ADD CONSTRAINT telefonoproveedor_pk PRIMARY KEY ( idtelefonoproveedor );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE catalogomunicipio
    ADD CONSTRAINT catalogomunicipio_catalogodepartamento_fk FOREIGN KEY ( catalogodepartamento_iddepartamento )
        REFERENCES catalogodepartamento ( iddepartamento );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_catalogodepartamento_fk FOREIGN KEY ( catalogodepartamento_iddepartamento )
        REFERENCES catalogodepartamento ( iddepartamento );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_catalogomunicipio_fk FOREIGN KEY ( catalogomunicipio_idmunicipio )
        REFERENCES catalogomunicipio ( idmunicipio );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_catalogozona_fk FOREIGN KEY ( catalogozona_idzona )
        REFERENCES catalogozona ( idzona );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE lineapedido
    ADD CONSTRAINT lineapedido_pedidoproveedor_fk FOREIGN KEY ( pedidoproveedor_idpedido )
        REFERENCES pedidoproveedor ( idpedido );

ALTER TABLE lineapedido
    ADD CONSTRAINT lineapedido_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

ALTER TABLE marca_producto
    ADD CONSTRAINT marca_producto_marca_fk FOREIGN KEY ( marca_idmarca )
        REFERENCES marca ( idmarca );

ALTER TABLE marca_producto
    ADD CONSTRAINT marca_producto_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE pedidoproveedor
    ADD CONSTRAINT pedidoproveedor_catalogoestadopedido_fk FOREIGN KEY ( catalogoestadopedido_idestado )
        REFERENCES catalogoestadopedido ( idestado );

ALTER TABLE pedidoproveedor
    ADD CONSTRAINT pedidoproveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_idcategoria )
        REFERENCES categoria ( idcategoria );

ALTER TABLE proveedor_producto
    ADD CONSTRAINT proveedor_producto_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE proveedor_producto
    ADD CONSTRAINT proveedor_producto_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE telefonoproveedor
    ADD CONSTRAINT telefonoproveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE catalogomunicipio
    ADD CONSTRAINT catalogomunicipio_catalogodepartamento_fk FOREIGN KEY ( catalogodepartamento_iddepartamento )
        REFERENCES catalogodepartamento ( iddepartamento );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_catalogodepartamento_fk FOREIGN KEY ( catalogodepartamento_iddepartamento )
        REFERENCES catalogodepartamento ( iddepartamento );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_catalogomunicipio_fk FOREIGN KEY ( catalogomunicipio_idmunicipio )
        REFERENCES catalogomunicipio ( idmunicipio );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_catalogozona_fk FOREIGN KEY ( catalogozona_idzona )
        REFERENCES catalogozona ( idzona );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direccionproveedor
    ADD CONSTRAINT direccionproveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE lineapedido
    ADD CONSTRAINT lineapedido_pedidoproveedor_fk FOREIGN KEY ( pedidoproveedor_idpedido )
        REFERENCES pedidoproveedor ( idpedido );

ALTER TABLE lineapedido
    ADD CONSTRAINT lineapedido_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

ALTER TABLE marca_producto
    ADD CONSTRAINT marca_producto_marca_fk FOREIGN KEY ( marca_idmarca )
        REFERENCES marca ( idmarca );

ALTER TABLE marca_producto
    ADD CONSTRAINT marca_producto_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE pedidoproveedor
    ADD CONSTRAINT pedidoproveedor_catalogoestadopedido_fk FOREIGN KEY ( catalogoestadopedido_idestado )
        REFERENCES catalogoestadopedido ( idestado );

ALTER TABLE pedidoproveedor
    ADD CONSTRAINT pedidoproveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE producto
    ADD CONSTRAINT producto_categoria_fk FOREIGN KEY ( categoria_idcategoria )
        REFERENCES categoria ( idcategoria );

ALTER TABLE proveedor_producto
    ADD CONSTRAINT proveedor_producto_producto_fk FOREIGN KEY ( producto_idproducto )
        REFERENCES producto ( idproducto );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE proveedor_producto
    ADD CONSTRAINT proveedor_producto_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );

ALTER TABLE telefonoproveedor
    ADD CONSTRAINT telefonoproveedor_proveedor_fk FOREIGN KEY ( proveedor_idproveedor )
        REFERENCES proveedor ( idproveedor );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             44
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
-- ERRORS                                  16
-- WARNINGS                                 0
