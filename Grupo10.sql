--Coordinacion de entrega de productos
--orden de venta  documento que indica que si
--contro de envio de producto


CREATE TABLE Control_Envios(
        Id_NumeroEnvio        INT(100) NOT NULL,
        Codigo_Cliente        INT(100) NOT NULL,       --cliente que lo recibio
        Id_Paquete            INT(100) NOT NULL,
        No_Factura            INT(100) NOT NULL,
	      Estatus_Paquete       VARCHAR(100),
	      Telefono_Cliente      VARCHAR(20),
        Telefono_Cliente1     VARCHAR(20),
        Forma_Pago_Efectivo   VARCHAR(01),
        Forma_Pago_Tarjeta    VARCHAR(01),
        Forma_Pago_Deposito   VARCHAR(01),
        Forma_Pago_OtroPago   VARCHAR(01),
        Estatus_Pago          VARCHAR(50),
        Fecha_Entrega         DATE,
        Id_Vehiculo           INT(10),
        Id_Status_Paquete     INT(10),
        primary key(Id_NumeroEnvio, Codigo_Cliente)
);

CREATE TABLE Registro_Actividad(
        Id_Paquete            INT NOT NULL PRIMARY KEY,
	      IdEstatusPaquete      VARCHAR(100),
	      IdEmpleado            INT(10),
	      IdEstadoProducto      INT(10),
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE Estatus_Paquete(
        Id_Status_Paquete            INT(100) NOT NULL PRIMARY KEY,
	      Descripcion                  VARCHAR(100)
);

CREATE TABLE Estado_Producto(
        Id_Stato_Producto            INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	      Descripcion                  VARCHAR(100),
);

CREATE TABLE Direccion_Entrega(
        Id_Cliente                INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        Id_Pais                   INT(10),
        Id_Departamento           INT(10),
        Id_Municipio              INT(10),
        Zona                      INT(10),
        calle                     INT(25),
        Aldea                     VARCHAR(100),
        Colonia                   VARCHAR(100),
        Residencial               VARCHAR(100),
        lote                      VARCHAR(20),
        avenida                   VARCHAR(50),
        numero_casa               INT(10)
);

CREATE TABLE Paises(
        Id_Pais                     INT(10) NOT NULL PRIMARY KEY,
	      Descripcion                 VARCHAR(100) NOT NULL
);

CREATE TABLE Municipios(
        Id_Municipio                INT(10) NOT NULL PRIMARY KEY,
	      Descripcion                 VARCHAR(100) NOT NULL
);

CREATE TABLE Departamento(
        Id_Departamento             INT(10) NOT NULL PRIMARY KEY,
	      Descripcion                 VARCHAR(100) NOT NULL
);


CREATE TABLE Vehiculos(
        Id_Vehiculos            INT NOT NULL PRIMARY KEY,
	      modelo                  VARCHAR(100),
        anio                    INT(04),
        PesoMaximo              INT(20),
        MedidaPeso              VARCHAR(20),
        Id_empleado             INT(10)
);


SELECT * FROM orders
JOIN customers USING(customer_id)




CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100)
);


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DOUBLE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO `customers` (`customer_id`, `customer_name`) VALUES
(1, 'Adam'),
(2, 'Andy'),
(3, 'Joe'),
(4, 'Sandy');

INSERT INTO `orders` (`order_id`, `customer_id`, `amount`) VALUES
(1, 1, 19.99),
(2, 1, 35.15),
(3, 3, 17.56),
(4, 4, 12.34);

SELECT * FROM CUSTOMERS JOIN ORDERS;

----PUEDE SUSTITUIRSR POR UNA COMA EL JOIN.
SELECT * FROM CUSTOMERS, ORDERS;
--UNE DOS CLASE DE BUSQUEDAS
SELECT * FROM CUSTOMERS NATURAL JOIN ORDERS;


SELECT * FROM CUSTOMERS JOIN ORDERS WHERE CUSTOMERS.CUSTOMERS_ID = ORDER.CUSTOMERS_ID;

SELECT * FROM CUSTOMERS JOIN ORDERS WHERE CUSTOMERS.CUSTOMERS_ID = ORDER.CUSTOMERS_ID AND ORDERS.AMOUNT > 15;
