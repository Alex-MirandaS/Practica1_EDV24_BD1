
CREATE DATABASE Ventas;

USE DATABASE Ventas;

CREATE TABLE CLIENTES(
    clienteID INT AUTO_INCREMENT PRIMARY KEY,
    clienteNombre VARCHAR (100) NOT NULL,
    clienteDireccion VARCHAR (150)
);

CREATE TABLE PRODUCTOS(
    productoID INT PRIMARY KEY,
    productoNombre VARCHAR (100) NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE VENTAS(
    ventaID AUTO_INCREMENT INT PRIMARY KEY,
    fecha DATE NOT NULL,
    clienteID INT NOT NULL,
    productoID INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (clienteID) REFERENCES CLIENTE(clienteID),
    FOREIGN KEY (productoID) REFERENCES PRODUCTO(productoID)
);

INSERT INTO CLIENTES (clienteNombre, clienteDireccion)
VALUES ('William Miranda', 'Calle Rodolfo Robles 0-24');

INSERT INTO PRODUCTOS (productoID, productoNombre, precioUnitario)
VALUES (101, 'Tortrix', 1.00);

INSERT INTO VENTAS (fecha, clienteID, productoID, cantidad, total)
VALUES (CURRENT_DATE(), 1, 1, 1, 1.00);

--SCRIPT CASO 2

CREATE DATABASE Proyectos;

USE DATABASE Proyectos;

CREATE TABLE EMPLEADOS(
    empID INT AUTO_INCREMENT PRIMARY KEY,
    empNombre VARCHAR (100) NOT NULL,
    empDireccion VARCHAR (150)
);

CREATE TABLE JEFES_PROYECTOS(
    jefeProyID INT AUTO_INCREMENT PRIMARY KEY,
    jefeProyNombre VARCHAR (100) NOT NULL
);

CREATE TABLE PROYECTOS(
    proyectoID INT  PRIMARY KEY,
    proyectoNombre VARCHAR (100) NOT NULL,
    jefeProyID INT NOT NULL,
    FOREIGN KEY (jefeProyID) REFERENCES JEFES_PROYECTOS(jefeProyID)
);

CREATE TABLE HORAS_TRABAJADAS(
    horTraID INT AUTO_INCREMENT PRIMARY KEY,
    empID INT NOT NULL,
    proyectoID INT NOT NULL,
    horasTrabajadas INT NOT NULL,
    FOREIGN KEY (empID) REFERENCES EMPLEADOS(empID),
    FOREIGN KEY (proyectoID) REFERENCES PROYECTOS(proyectoID)
);

INSERT INTO EMPLEADOS (empNombre, empDireccion)
VALUES ('William Miranda', 'Calle Rodolfo Robles 0-24');

INSERT INTO JEFES_PROYECTOS (jefeProyNombre)
VALUES ('Diego Estrada');

INSERT INTO PROYECTOS (proyectoID, proyectoNombre, jefeProyID)
VALUES (201, 'Interplaza Xela', 1);

INSERT INTO HORAS_TRABAJADAS (empID, proyectoID, horasTrabajadas)
VALUES (1, 201, 35);

--SCRIPT CASO 3

CREATE DATABASE Pedidos;

USE DATABASE Pedidos;

CREATE TABLE CLIENTES(
    clienteID INT PRIMARY KEY,
    clienteNombre VARCHAR (100) NOT NULL,
    clienteDireccion VARCHAR (150)
);

CREATE TABLE PRODUCTOS(
    productoID INT PRIMARY KEY,
    productoNombre VARCHAR (100) NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE VENDEDORES(
    vendedorID INT PRIMARY KEY,
    vendedorNombre VARCHAR (100) NOT NULL,
    vendedorComision INT NOT NULL
);

CREATE TABLE PEDIDOS(
    pedidoID INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    clienteID INT NOT NULL,
    productoID INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    vendedorID INT NOT NULL, 
    FOREIGN KEY (clienteID) REFERENCES CLIENTES(clienteID),
    FOREIGN KEY (productoID) REFERENCES PRODUCTOS(productoID),
    FOREIGN KEY (vendedorID) REFERENCES VENDEDORES(vendedorID)
);

INSERT INTO CLIENTES (clienteID, clienteNombre, clienteDireccion)
VALUES (101, 'William Miranda', 'Calle Rodolfo Robles 0-24');

INSERT INTO PRODUCTOS (productoID, productoNombre, precioUnitario)
VALUES (201, 'Microfono', 400.00);

INSERT INTO VENDEDORES (vendedorID, vendedorNombre, vendedorComision)
VALUES (301, 'Mateo Palacios', 5);

INSERT INTO PEDIDOS (fecha, clienteID, productoID, cantidad, total, vendedorID)
VALUES (CURRENT_DATE(), 101, 201, 1, 400.00, 301);