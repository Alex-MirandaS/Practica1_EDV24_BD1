CREATE DATABASE VentaAutos;
USE VentaAutos;

CREATE TABLE Departamentos (
    id_Departamento INT AUTO_INCREMENT PRIMARY KEY,
    departamento VARCHAR(100) NOT NULL
);

CREATE TABLE Municipios (
    id_Municipio INT AUTO_INCREMENT PRIMARY KEY,
    id_Departamento INT NOT NULL,
    municipio VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_Departamento) REFERENCES Departamentos(id_Departamento)
);

CREATE TABLE Transmisiones (
    id_Transmision INT AUTO_INCREMENT PRIMARY KEY,
    transmision VARCHAR(10) NOT NULL
);

CREATE TABLE Condiciones (
    id_Condicion INT AUTO_INCREMENT PRIMARY KEY,
    condicion VARCHAR(10) NOT NULL
);

CREATE TABLE Vehiculos (
    placa VARCHAR(7) PRIMARY KEY,
    color VARCHAR(50) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    kilometraje INT NOT NULL,
    anio YEAR NOT NULL,
    id_Transmision INT NOT NULL,
    num_Puertas INT,
    id_Condicion INT NOT NULL,
    FOREIGN KEY (id_Transmision) REFERENCES Transmisiones(id_Transmision),
    FOREIGN KEY (id_Condicion) REFERENCES Condiciones(id_Condicion)
);

CREATE TABLE Proveedores (
    id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT NOT NULL,
    email VARCHAR(150) NOT NULL,
    empresa VARCHAR(50) NOT NULL
);

CREATE TABLE R_Prov_Autos (
    id_R_Prov_Auto INT AUTO_INCREMENT PRIMARY KEY,
    id_Proveedor INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedores(id_Proveedor),
    FOREIGN KEY (placa) REFERENCES Vehiculos(placa)
);

CREATE TABLE Sucursales (
    id_Sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT NOT NULL,
    web VARCHAR(100) NOT NULL,
    id_Municipio INT NOT NULL,
    FOREIGN KEY (id_Municipio) REFERENCES Municipios(id_Municipio)
);

CREATE TABLE Inventarios (
    id_Inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_Sucursal INT NOT NULL,
    id_Vehiculo VARCHAR(10) NOT NULL,
    vendido BOOLEAN NOT NULL,
    FOREIGN KEY (id_Sucursal) REFERENCES Sucursales(id_Sucursal),
    FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculos(placa)
);

CREATE TABLE T_Pagos (
    id_T_Pago INT AUTO_INCREMENT PRIMARY KEY,
    tipo_Pago VARCHAR(12) NOT NULL
);

CREATE TABLE Transacciones (
    id_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_Vehiculo VARCHAR(10) NOT NULL,
    id_Sucursal INT NOT NULL,
    id_T_Pago INT NOT NULL,
    es_Venta BOOLEAN NOT NULL,
    monton DECIMAL(6, 2) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculos(placa),
    FOREIGN KEY (id_Sucursal) REFERENCES Sucursales(id_Sucursal),
    FOREIGN KEY (id_T_Pago) REFERENCES T_Pagos(id_T_Pago)
);

CREATE TABLE Clientes (
    dpi VARCHAR(13) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    celular INT NOT NULL,
    email VARCHAR(150) NOT NULL,
    nit VARCHAR(9) NOT NULL 
);

CREATE TABLE Tarjetas_C (
    num_Tarjeta VARCHAR(16) PRIMARY KEY,
    dpi VARCHAR(13) NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    fecha_Exp DATE NOT NULL,
    FOREIGN KEY (dpi) REFERENCES Clientes(dpi)
);

CREATE TABLE Empleados (
    dpi VARCHAR(13) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nit VARCHAR(9),
    telefono VARCHAR(8),
    sueldo DECIMAL(4, 2)
);

CREATE TABLE Det_Ventas (
    id_Det_Ventas INT AUTO_INCREMENT PRIMARY KEY,
    id_Transaccion INT NOT NULL,
    id_Empleado VARCHAR(13) NOT NULL,
    hora TIME NOT NULL,
    FOREIGN KEY (id_Transaccion) REFERENCES Transacciones(id_Transaccion),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(dpi)
);

CREATE TABLE Det_Trans_Cred (
    id_Det_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_Transaccion INT NOT NULL,
    banco VARCHAR(50),
    num_Tarjeta VARCHAR(16),
    FOREIGN KEY (id_Transaccion) REFERENCES Transacciones(id_Transaccion),
    FOREIGN KEY (num_Tarjeta) REFERENCES Tarjetas_C(num_Tarjeta)
);

CREATE TABLE Descuentos (
    id_Descuento INT AUTO_INCREMENT PRIMARY KEY,
    id_Transaccion INT NOT NULL,
    porcentaje INT NOT NULL,
    razon VARCHAR(200),
    FOREIGN KEY (id_Transaccion) REFERENCES Transacciones(id_Transaccion)
);

CREATE TABLE Bitacora_Emp (
    id_Bitacora_Emp INT AUTO_INCREMENT PRIMARY KEY,
    id_Sucursal INT NOT NULL,
    id_Empleado VARCHAR(20) NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_Sucursal) REFERENCES Sucursales(id_Sucursal),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(dpi)
);
