CREATE TABLE compras (
    id_compra             NUMBER NOT NULL,
    no_factura            NUMBER,
    id_prov_c             NUMBER,
    fecha                 DATE,
    recargos              NUMBER,
    descuentos            NUMBER,
    total                 NUMBER,
    proveedores_id_prov   NUMBER NOT NULL
);

ALTER TABLE compras ADD CONSTRAINT compras_pk PRIMARY KEY ( id_compra );

CREATE TABLE cuentas_por_pagar (
    id_cuenta             NUMBER NOT NULL,
    id_prov_cuenta        NUMBER,
    id_compra             NUMBER,
    id_pago_realizado     NUMBER,
    id_status_pago        NUMBER,
    compras_id_compra     NUMBER NOT NULL,
    proveedores_id_prov   NUMBER NOT NULL,
    pago_id_pago          NUMBER NOT NULL,
    status_id_status      NUMBER NOT NULL
);

ALTER TABLE cuentas_por_pagar ADD CONSTRAINT cuentas_por_pagar_pk PRIMARY KEY ( id_cuenta );

CREATE TABLE cuentas_proveedores (
    id_cuenta_prov        NUMBER NOT NULL,
    id_prov_c             NUMBER,
    cuenta                VARCHAR2(50),
    proveedores_id_prov   NUMBER NOT NULL
);

ALTER TABLE cuentas_proveedores ADD CONSTRAINT cuentas_proveedores_pk PRIMARY KEY ( id_cuenta_prov );

CREATE TABLE detalle_compras (
    id_compra_det       NUMBER NOT NULL,
    cod_prod            NUMBER,
    cantidad            NUMBER,
    precio_unidad       NUMBER,
    total               NUMBER,
    compras_id_compra   NUMBER NOT NULL
);

ALTER TABLE detalle_compras ADD CONSTRAINT detalle_compras_pk PRIMARY KEY ( id_compra_det );

CREATE TABLE detalle_pago (
    id_det_pago                         NUMBER NOT NULL,
    id_pago                             NUMBER,
    id_compra_p                         NUMBER,
    id_medio_pago                       NUMBER,
    id_cuenta_prov                      NUMBER,
    tipo_doc_pago                       NUMBER,
    no_documento_pago                   NUMBER,
    monto_pago                          NUMBER,
    pago_id_pago                        NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    tipo_documentos_id_tipo_documento   NUMBER NOT NULL
);

ALTER TABLE detalle_pago ADD CONSTRAINT detalle_pago_pk PRIMARY KEY ( id_det_pago );

CREATE TABLE direcciones_proveedores (
    id_prov_d             NUMBER NOT NULL,
    id_direccion          NUMBER,
    proveedores_id_prov   NUMBER NOT NULL
);

ALTER TABLE direcciones_proveedores ADD CONSTRAINT direcciones_proveedores_pk PRIMARY KEY ( id_prov_d );

CREATE TABLE pago (
    id_pago               NUMBER NOT NULL,
    fecha_pago            DATE,
    id_prov_pag           NUMBER,
    proveedores_id_prov   NUMBER NOT NULL
);

ALTER TABLE pago ADD CONSTRAINT pago_pk PRIMARY KEY ( id_pago );

CREATE TABLE proveedores (
    id_prov               NUMBER NOT NULL,
    razon_social          VARCHAR2(100),
    nit                   VARCHAR2(20),
    representante_legal   VARCHAR2(100),
    status_proveedor      NUMBER,
    status_id_status      NUMBER NOT NULL
);

ALTER TABLE proveedores ADD CONSTRAINT proveedores_pk PRIMARY KEY ( id_prov );

CREATE TABLE status (
    id_status       NUMBER NOT NULL,
    nombre_status   NUMBER,
    detalles        VARCHAR2(50)
);

ALTER TABLE status ADD CONSTRAINT status_pk PRIMARY KEY ( id_status );

CREATE TABLE telefono_proveedores (
    id_telefono_proveedores   NUMBER  
--  ERROR: Datatype UNKNOWN is not allowed 
     NOT NULL,
    id_prov_t                 NUMBER 
--  ERROR: Datatype UNKNOWN is not allowed 
   ,
    proveedores_id_prov       NUMBER NOT NULL
);

ALTER TABLE telefono_proveedores ADD CONSTRAINT telefono_proveedores_pk PRIMARY KEY ( id_telefono_proveedores );

CREATE TABLE tipo_documentos (
    id_tipo_documento   NUMBER NOT NULL,
    documento           VARCHAR2(50),
    detalle             VARCHAR2(50)
);

ALTER TABLE tipo_documentos ADD CONSTRAINT tipo_documentos_pk PRIMARY KEY ( id_tipo_documento );

ALTER TABLE compras
    ADD CONSTRAINT compras_proveedores_fk FOREIGN KEY ( proveedores_id_prov )
        REFERENCES proveedores ( id_prov );

ALTER TABLE cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_compras_fk FOREIGN KEY ( compras_id_compra )
        REFERENCES compras ( id_compra );

ALTER TABLE cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_proveedores_fk FOREIGN KEY ( proveedores_id_prov )
        REFERENCES proveedores ( id_prov );

ALTER TABLE cuentas_por_pagar
    ADD CONSTRAINT cuentas_por_pagar_status_fk FOREIGN KEY ( status_id_status )
        REFERENCES status ( id_status );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE cuentas_proveedores
    ADD CONSTRAINT cuentas_proveedores_proveedores_fk FOREIGN KEY ( proveedores_id_prov )
        REFERENCES proveedores ( id_prov );

ALTER TABLE detalle_compras
    ADD CONSTRAINT detalle_compras_compras_fk FOREIGN KEY ( compras_id_compra )
        REFERENCES compras ( id_compra );

ALTER TABLE detalle_pago
    ADD CONSTRAINT detalle_pago_pago_fk FOREIGN KEY ( pago_id_pago )
        REFERENCES pago ( id_pago );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE detalle_pago
    ADD CONSTRAINT detalle_pago_tipo_documentos_fk FOREIGN KEY ( tipo_documentos_id_tipo_documento )
        REFERENCES tipo_documentos ( id_tipo_documento );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE direcciones_proveedores
    ADD CONSTRAINT direcciones_proveedores_proveedores_fk FOREIGN KEY ( proveedores_id_prov )
        REFERENCES proveedores ( id_prov );

ALTER TABLE pago
    ADD CONSTRAINT pago_proveedores_fk FOREIGN KEY ( proveedores_id_prov )
        REFERENCES proveedores ( id_prov );

ALTER TABLE proveedores
    ADD CONSTRAINT proveedores_status_fk FOREIGN KEY ( status_id_status )
        REFERENCES status ( id_status );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE telefono_proveedores
    ADD CONSTRAINT telefono_proveedores_proveedores_fk FOREIGN KEY ( proveedores_id_prov )
        REFERENCES proveedores ( id_prov );