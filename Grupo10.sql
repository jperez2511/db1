--Coordinacion de entrega de productos
--orden de venta  documento que indica que si
--contro de envio de producto
CREATE DATABASE Envios_Producto_Tracking;
USE Envios_Producto_Tracking;
-------------------------------------------------------------------------
---------------------Creacion de tablas----------------------------------
-------------------------------------------------------------------------
CREATE TABLE Control_Paquetes_E(
        Id_FechaIngreso       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Id_CodigoCliente      NUMBER(10) NOT NULL,
        Id_Paquete            NUMBER(10),
        Factura               VARCHAR2(20) NOT NULL,
	      Id_EstatusPaquete     NUMBER(10) NOT NULL,
        Id_FormaPago          NUMBER(10) NOT NULL,
        Id_EstatusPago        NUMBER(10) NOT NULL,
        Id_Estado_Producto    NUMBER(10),
        Fecha_Entrega         DATE,
        Id_NoPlaca            NUMBER(10),
        primary key(Id_FechaIngreso, Id_CodigoCliente)
);

--En enviado, En camino, llego al lugar, entregado, devuelto
CREATE TABLE Estatus_Paquete_E(
        Id_EstatusPaquete     NUMBER(10) NOT NULL,
	      Descripcion           VARCHAR2(100),
        primary key(Id_EstatusPaquete)
);


--Forma de Forma_Pago_OtroPago        deposito, tarjeta, deposito-Tarjeta
CREATE TABLE FormaPago_E(
        Id_FormaPago                NUMBER(10) NOT NULL,
	    Descripcion                 VARCHAR2(100),
        primary key(Id_FormaPago)
);

--Forma de Forma_Pago_OtroPago        Pendiente, pagado, credito
CREATE TABLE EstatusPago_E(
        Id_EstatusPago          NUMBER(10) NOT NULL,
	      Descripcion             VARCHAR2(100),
        primary key(Id_EstatusPago)
);

---nuevo, dañado, abierto
CREATE TABLE Estado_Producto_E(
        Id_Estado_Producto                 NUMBER(10) NOT NULL,
	      Descripcion                        VARCHAR2(100),
        primary key(Id_Estado_Producto)
);

CREATE TABLE Direccion_Entrega_E(
        Id_Cliente                NUMBER(10) NOT NULL,
        Id_Pais                   NUMBER(10),
        Id_Departamento           NUMBER(10),
        Id_Municipio              NUMBER(10),
        Zona                      NUMBER(10),
        nomenclatura              VARCHAR2(200),
        primary key(Id_Cliente)
);

CREATE TABLE Paises_E(
        Id_Pais                     NUMBER(10) NOT NULL,
	      Descripcion                 VARCHAR2(100) NOT NULL,
        primary key(Id_Pais)
);

CREATE TABLE Municipios_E(
        Id_Municipio                NUMBER(10) NOT NULL,
	      Descripcion                 VARCHAR2(100) NOT NULL,
        primary key(Id_Municipio)
);

CREATE TABLE Departamento_E(
        Id_Departamento             NUMBER(10) NOT NULL,
	      Descripcion                 VARCHAR2(100) NOT NULL,
        primary key(Id_Departamento)
);

--se puede hacer una consulta para ver que vehiculos estan disponibles en ese momento
CREATE TABLE Vehiculos_E(
        Id_NoPlaca              NUMBER(10) NOT NULL,
        anio                    NUMBER(04),
        PesoMaximo              NUMBER(20),
        Id_empleado             NUMBER(10),
        marca                   VARCHAR2(100),
        MedidaPeso              VARCHAR(20),
        Id_EstadoVehiculo       NUMBER(10),
        primary key(Id_NoPlaca)
);
--   Dañado, Entregando, Libre
CREATE TABLE EstadoVehiculo_E(
        Id_EstadoVehiculo           NUMBER(10) NOT NULL,
	      Descripcion                 VARCHAR2(100) NOT NULL,
        primary key(Id_EstadoVehiculo)
);
CREATE TABLE RegistroActividad_E(
        Id_Paquete                NUMBER(10) NOT NULL,
	      Id_CodigoCliente          VARCHAR2(100) NOT NULL,
        Id_EstatusPaquete         NUMBER(10) NOT NULL,
        Id_Empleado               NUMBER(10) NOT NULL,
        Id_EstadoProducto         NUMBER(10) NOT NULL
        primary key(Id_Paquete)
);
-------------------------------------------------------------------------
----Ingreso de informacion a las tablas----------------------------------
-------------------------------------------------------------------------
--FOREIGN KEY Control_Envios(Id_Paquete) REFERENCES Registro_Actividad(Id_Paquete);
ALTER TABLE Control_Paquetes__E
ADD FOREIGN KEY (Id_EstatusPaquete) REFERENCES Estatus_Paquete_E(Id_EstatusPaquete);

ALTER TABLE Control_Paquetes_E
ADD FOREIGN KEY (Id_FormaPago) REFERENCES FormaPago_E(Id_FormaPago);

ALTER TABLE Control_Paquetes_E
ADD FOREIGN KEY (Id_EstatusPago) REFERENCES EstatusPago_E(Id_EstatusPago);

ALTER TABLE Control_Paquetes_E
ADD FOREIGN KEY (Id_NoPlaca) REFERENCES Vehiculos_E(Id_NoPlaca);

ALTER TABLE Control_Paquetes_E
ADD FOREIGN KEY (Id_Estado_Producto) REFERENCES Estado_Producto_E(Id_Estado_Producto);

ALTER TABLE Control_Paquetes_E
ADD FOREIGN KEY (Id_NoPlaca) REFERENCES Vehiculos_E(Id_NoPlaca);

ALTER TABLE Direccion_Entrega_E
ADD FOREIGN KEY (Id_Pais) REFERENCES Paises_E(Id_Pais);

ALTER TABLE Direccion_Entrega_E
ADD FOREIGN KEY (Id_Departamento) REFERENCES Departamento_E(Id_Departamento);

ALTER TABLE Direccion_Entrega_E
ADD FOREIGN KEY (Id_Municipio) REFERENCES Municipiosv(Id_Municipio);

ALTER TABLE RegistroActividad_E
ADD FOREIGN KEY (Id_Municipio) REFERENCES EstadoProducto_E(Id_EstadoProducto);

--Departamento
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Alta Verapaz',1);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Baja Verapaz',2);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Chimaltenango',3);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Chiquimula',4);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('El Progreso',5);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Escula',6);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Guatemala',7);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Huehuetenango',8);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Izabal',9);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Jalapa',10);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Jutiapa',11);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Petén',12);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Quetzaltenango',13);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Quiché',14);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Retalhuleu',15);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Sacatepéquez',16);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('San Marcos',17);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Santa Rosa',18);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Sololá',19);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Suchitepéquez',20);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Totonicapán',21);
INSERT INTO Departamento_E (Descripcion, Id_Departamento) VALUES('Zacapa',22);

INSERT INTO Estatus_Paquete_E(Id_EstatusPaquete, Descripcion) VALUES(1, 'ENVIADO');
INSERT INTO Estatus_Paquete_E(Id_EstatusPaquete, Descripcion) VALUES(2, 'EN CAMINO');
INSERT INTO Estatus_Paquete_E(Id_EstatusPaquete, Descripcion) VALUES(3, 'EN EL LUGAR');
INSERT INTO Estatus_Paquete_E(Id_EstatusPaquete, Descripcion) VALUES(4, 'ENTREGADO');
INSERT INTO Estatus_Paquete_E(Id_EstatusPaquete, Descripcion) VALUES(5, 'DEVUELTO');
INSERT INTO Estatus_Paquete_E(Id_EstatusPaquete, Descripcion) VALUES(6, 'PENDIENTE');

INSERT INTO FormaPago_E(Id_FormaPago, Descripcion) VALUES(1, 'DEPOSITO');
INSERT INTO FormaPago_E(Id_FormaPago, Descripcion) VALUES(2, 'TARJETA');
INSERT INTO FormaPago_E(Id_FormaPago, Descripcion) VALUES(3, 'DEPOSITO Y TARJETA');

INSERT INTO EstatusPago_E(Id_EstatusPago, Descripcion) VALUES(1, 'PENDIENTE');
INSERT INTO EstatusPago_E(Id_EstatusPago, Descripcion) VALUES(2, 'PAGADO');
INSERT INTO EstatusPago_E(Id_EstatusPago, Descripcion) VALUES(3, 'CREDITO');

INSERT INTO Estado_Producto_E(Id_Estado_Producto, Descripcion) VALUES(1, 'NUEVO');
INSERT INTO Estado_Producto_E(Id_Estado_Producto, Descripcion) VALUES(2, 'DAÑADO');
INSERT INTO Estado_Producto_E(Id_Estado_Producto, Descripcion) VALUES(3, 'ABIERTO');

INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(1,'Cobán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(2,'Santa Cruz Verapaz');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(3,'San Cristobal Verapaz');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(4,'Tactíc');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(5,'Tamahú');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(6,'San Miguel Tucurú');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(7,'Panzos');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(8,'Senahú');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(9,'San Pedro Carchá');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(10,'SanJuan Chamelco');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(11,'Lanquín');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(12,'Santa María Cahabón');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(13,'Chisec');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(14,'Chahal');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(15,'Fray Bartolomé de las Casas');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(16,'Santa Catarina La Ta');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(17,'Salamá');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(18,'San Miguel Chicaj');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(19,'Rabinal');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(20,'Cubulco');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(21,'Granados');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(22,'Santa Cruz El Chol');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(23,'San Jerónimo');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(24,'Purulhá');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(25,'Chimaltenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(26,'San José Poaquil');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(27,'San Martín Jilotepeque');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(28,'San Juan Comalapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(29,'Santa Apolonia');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(30,'Tecpán Guatemala');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(31,'Patzun');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(32,'San Miguel Pochuta');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(33,'Patzicia');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(34,'Santa Cruz Balanyá');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(35,'Acatenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(36,'San Pedro Yepocapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(37,'San Andrés Itzapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(38,'Parramos');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(39,'Zaragoza');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(40,'El Tejar');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(41,'Chiquimula');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(42,'San José La Arada');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(43,'San Juan Hermita');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(44,'Jocotán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(45,'Camotán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(46,'Olopa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(47,'Esquipulas');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(48,'Concepción Las Minas');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(49,'Quezaltepeque');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(50,'San Jaco');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(51,'Ipala');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(52,'Flores');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(53,'San José');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(54,'San Benito');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(55,'San Andrés');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(56,'La Libertad');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(57,'San Francisco');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(58,'Santa Ana');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(59,'Dolores');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(60,'San Luis');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(61,'Sayaxche');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(62,'Melchor de Mencos');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(63,'Poptún');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(64,'Guastatoya');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(65,'Morazán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(66,'San Agustín Acasaguastlan');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(67,'San Cristóbal Acasaguastlan');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(68,'El Jícaro');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(69,'Sansare');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(70,'Sanarate');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(71,'San Antonio La Paz');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(72,'Santa Cruz del Quiche');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(73,'Chiche');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(74,'Chinique');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(75,'Zacualpa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(76,'Chajul');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(77,'Santo Tomás Chichicstenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(78,'Patzité');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(79,'San Antonio Ilotenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(80,'San Pedro Jocopilas');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(81,'Cunén');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(82,'San Juan Cotzal');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(83,'Joyabaj');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(84,'Santa María Nebaj');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(85,'San Andrés Sajcabajá');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(86,'San Miguel Uspatán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(87,'Sacapulas');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(88,'San Bartolomé Jocotenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(89,'Canilla');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(90,'Chicaman');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(91,'Playa Grnade - Ixcán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(92,'Pachalúm');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(93,'Escula');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(94,'Santa Lucía Cotzumalguapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(95,'La Democracia');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(96,'Siquinalá');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(97,'Masagua');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(98,'Pueblo Nuevo Tiquisate');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(99,'La Gomera');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(100,'Guanagazapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(101,'Puerto de San José');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(102,'Iztapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(103,'Palín');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(104,'San Vicente Pacaya');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(105,'Nueva Concepción');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(106,'Guatemala');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(107,'Santa Catarina Pinula');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(108,'San José Pinula');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(109,'San José del Golfo');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(110,'Palencia');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(111,'Chinautla');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(112,'San Pedro Ayampuc');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(113,'Mixco');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(114,'San Pedro Sacatepequez');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(115,'San Juan Sacatepequez');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(116,'San Raymundo');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(117,'Chuarrancho');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(118,'Fraijanes');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(119,'Amatitlán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(120,'Villa Nueva');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(121,'Villa Canales');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(122,'San Miguel Petapa');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(123,'Huehuetenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(124,'Chiantla');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(125,'Malacatancito');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(126,'Cuilco');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(127,'Nentón');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(128,'San Pedro Necta');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(129,'Jacaltenango');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(130,'San Pedro Soloma');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(131,'San Ildelfonso Ixtahuac´n');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(132,'Santa Bárbara');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(133,'La Libertad');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(134,'La Democracia');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(135,'San Miguel Acatán');
INSERT INTO Municipios_E(Id_Municipio, Descripcion) VALUES(136,'San Rafael La Independencia');

INSERT INTO EstadoVehiculo_E(Id_EstadoVehiculo, Descripcion) VALUES(0, 'NINGUNO');
INSERT INTO EstadoVehiculo_E(Id_EstadoVehiculo, Descripcion) VALUES(1, 'BUEN ESTADO');
INSERT INTO EstadoVehiculo_E(Id_EstadoVehiculo, Descripcion) VALUES(2, 'MANTENIMIENTO');

INSERT INTO Paises_E(Id_Pais, Descripcion) VALUE(320, 'GUATEMALA');
INSERT INTO Paises_E(Id_Pais, Descripcion) VALUE(840, 'ESTADOS UNIDOS');

INSERT INTO Vehiculos_E(Id_NoPlaca, anio, PesoMaximo, Id_empleado, marca, MedidaPeso, Id_EstadoVehiculo) VALUES(756, 2019, 700, 2019001001, 'MAZDA', 'LIBRAS', 1);
INSERT INTO Vehiculos_E(Id_NoPlaca, anio, PesoMaximo, Id_empleado, marca, MedidaPeso, Id_EstadoVehiculo) VALUES(755, 2019, 700, 2019001002, 'MAZDA', 'LIBRAS', 1);
INSERT INTO Vehiculos_E(Id_NoPlaca, anio, PesoMaximo, Id_empleado, marca, MedidaPeso, Id_EstadoVehiculo) VALUES(754, 2019, 700, 2019001003, 'MAZDA', 'LIBRAS', 1);

INSERT INTO RegistroActividad_E(Id_Paquete, Id_CodigoCliente, Id_EstatusPaquete, Id_Empleado, Id_EstadoProducto) VALUES(1002000010, 80, 1, 2019002001, 1);
INSERT INTO RegistroActividad_E(Id_Paquete, Id_CodigoCliente, Id_EstatusPaquete, Id_Empleado, Id_EstadoProducto) VALUES(1002000011, 81, 2, 2019002001, 1);
INSERT INTO RegistroActividad_E(Id_Paquete, Id_CodigoCliente, Id_EstatusPaquete, Id_Empleado, Id_EstadoProducto) VALUES(1002000012, 80, 1, 2019002001, 1);
INSERT INTO RegistroActividad_E(Id_Paquete, Id_CodigoCliente, Id_EstatusPaquete, Id_Empleado, Id_EstadoProducto) VALUES(1002000013, 90, 2, 2019002001, 1);
INSERT INTO RegistroActividad_E(Id_Paquete, Id_CodigoCliente, Id_EstatusPaquete, Id_Empleado, Id_EstadoProducto) VALUES(1002000014, 81, 6, 2019002001, 1);

INSERT INTO Control_Paquetes_E(Id_CodigoCliente, Id_Paquete, Factura, Id_EstatusPaquete, Id_FormaPago, Id_EstatusPago, Id_Estado_Producto, Id_NoPlaca) VALUES(80, 1002000010, 'A1001001', 1, 2, 1, 1, 756);
INSERT INTO Control_Paquetes_E(Id_CodigoCliente, Id_Paquete, Factura, Id_EstatusPaquete, Id_FormaPago, Id_EstatusPago, Id_Estado_Producto, Id_NoPlaca) VALUES(81, 1002000011, 'A1001002', 1, 2, 1, 1, 756);


------------------------  aqui voy------------------------------------------------

INSERT O Control_Paquetes (Id_Cliente, Id_Pais, Id_Departamento, Id_Municipio,Zona, calle, Aldea, Colonia, Residencial, lote, avenida, numero_casa) VALUES
(1, 320, 11,12, 318,27,'Sapote','Santa Ana','','','americas', 25),
(2, 320, 11, 12, 280,27,'Sapote','Santa Ana','','','americas', 25);

SELECT * FROM Direccion_Entrega
JOIN Paises USING(Id_Pais) JOIN Municipios USING(Id_Municipio) JOIN Departamento USING(Id_Departamento);



Create or replace Function prueba ()
Return prueba
  AS
  Return  (SELECT Id_EstatusPaquete, Id_EstatusPago, Id_CodigoCliente From Control_Paquetes)
End
/


--CREATE TABLE orders (
--    order_id  AUTO_INCREMENT PRIMARY KEY,
--    customer_id ,
--    amount DOUBLE,
--    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
--);



--SELECT * FROM CUSTOMERS JOIN ORDERS;

----PUEDE SUSTITUIRSR POR UNA COMA EL JOIN.
--SELECT * FROM CUSTOMERS, ORDERS;
--UNE DOS CLASE DE BUSQUEDAS
--SELECT * FROM CUSTOMERS NATURAL JOIN ORDERS;


--SELECT * FROM CUSTOMERS JOIN ORDERS WHERE CUSTOMERS.CUSTOMERS_ID = ORDER.CUSTOMERS_ID;

--SELECT * FROM CUSTOMERS JOIN ORDERS WHERE CUSTOMERS.CUSTOMERS_ID = ORDER.CUSTOMERS_ID AND ORDERS.AMOUNT > 15;
