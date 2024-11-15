CREATE DATABASE Ventas;

USE Ventas;

CREATE TABLE CATEGORIA(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL
);

CREATE TABLE PRODUCTO(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    ventas INT NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id)
);

CREATE TABLE PAIS(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL
);

CREATE TABLE CLIENTE(
    dni INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    direccion VARCHAR (100) NOT NULL,
    codigo_postal INT NOT NULL,
    telefono INT NOT NULL,
    tarjeta_credito VARCHAR(16),
    edad INT,
    ingresos INT,
    genero CHAR(1) NOT NULL,
    id_pais INT,
    FOREIGN KEY (id_pais) REFERENCES PAIS(id)
);

CREATE TABLE VENDEDOR(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL
);

CREATE TABLE ORDEN(
    id INT AUTO_INCREMENT PRIMARY KEY,
    linea INT NOT NULL,
    cantidad INT NOT NULL,   
    fecha DATE NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    id_producto INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id),
    FOREIGN KEY (id_vendedor) REFERENCES VENDEDOR(id),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(dni)
);

CREATE TABLE HISTORIAL(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,
    id_orden INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES PRODUCTO(id),
    FOREIGN KEY (id_orden) REFERENCES ORDEN(id),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(dni)
);

INSERT INTO CATEGORIA (nombre)
VALUES 
('A'),
('B'),
('C'),
('D'),
('F');

INSERT INTO PRODUCTO (nombre, precio, stock, ventas, id_categoria)
VALUES ('Collar Triangular', 50.00, 2, 1, 1),
('Lentes de Sol Oscuros', 150.00, 5, 0, 2),
('Anillo Spider-man', 40.00, 10, 1, 3);

INSERT INTO PAIS (nombre)
VALUES ('Guatemala'),
('Argentina'),
('Colombia');

INSERT INTO CLIENTE (nombre, apellido, direccion, codigo_postal, telefono, tarjeta_credito, edad, ingresos, genero, id_pais)
VALUES 
('William', 'Miranda', 'Calle Rodolfo Robles 0-24', 9001, 56275340, 1254687953156478, 22, 3000, 'M', 1),
('Belén', 'Santos', 'Avenida Las Americas 0-35', 9007, 78643294, 5789643815796325, 21, 0, 'F', 2),
('Lionel', 'Messi', 'Miami Florida, 0-56', 10115, 555555555, 3333222211110000, 31, 100000, 'M', 3);

INSERT INTO VENDEDOR (nombre)
VALUES 
('Neymar Junior'),
('Cristiano Ronaldo'),
('Kylian Mbappé');

INSERT INTO ORDEN (linea, cantidad, fecha, precio, id_producto, id_vendedor, id_cliente)
VALUES 
(1, 2, '2024-06-25', 100.00, 1, 1, 1),
(2, 5, '2024-06-26', 750.00, 2, 2, 2),
(3, 10, '2024-06-27', 400.00, 3, 3, 3);

INSERT INTO HISTORIAL (id_producto, id_orden, id_cliente)
VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);





--CONSULTA 1: Muestre la información necesaria de la orden que tenga compra mas alta.
SELECT 
    o.id AS orden_id,
    o.linea,
    o.cantidad,
    o.fecha,
    o.precio,
    p.nombre AS nombre_Producto,
    CONCAT( c.nombre,' ',c.apellido) AS nombre_Cliente
FROM 
    ORDEN o
INNER JOIN 
    PRODUCTO p ON o.id_producto = p.id
INNER JOIN 
    CLIENTE c ON o.id_cliente = c.dni
ORDER BY 
    o.precio DESC
LIMIT 1;

--CONSULTA 2: Muestre el mes en que se realizo la mayor compra.
SELECT 
    DATE_FORMAT(o.fecha, '%m') AS mes,
    MAX(o.precio) as monto
FROM 
    ORDEN o
GROUP BY 
    mes
ORDER BY 
    MAX(o.precio) DESC
LIMIT 1;

--CONSULTA 3: Muestre el mes de todos las ordenes junto con las 3 categorias  de productos con nombre igual a “A”, “B” y “C”
SELECT 
    DATE_FORMAT(o.fecha, '%m') AS mes,
    c.nombre AS categoria_nombre,
    p.nombre AS nombre_Producto
FROM 
    ORDEN o
INNER JOIN 
    PRODUCTO p ON o.id_producto = p.id
INNER JOIN 
    CATEGORIA c ON p.id_categoria = c.id
WHERE 
    c.nombre = 'A' OR  c.nombre ='B' OR c.nombre = 'C'
ORDER BY 
    mes;




