CREATE DATABASE Aseguradora;
USE Aseguradora;

CREATE TABLE Puestos (
    id_Puesto INT AUTO_INCREMENT PRIMARY KEY,
    puesto VARCHAR(10) NOT NULL
);

CREATE TABLE Areas (
    id_Area INT AUTO_INCREMENT PRIMARY KEY,
    area VARCHAR(10) NOT NULL
);

CREATE TABLE Departamentos (
    id_Departamento INT AUTO_INCREMENT PRIMARY KEY,
    id_Area INT,
    departamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_Area) REFERENCES Areas(id_Area)
);

CREATE TABLE Empleados (
    dpi VARCHAR(13) PRIMARY KEY,
    id_Puesto INT,
    id_Departamento INT,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    fecha_Nacimiento DATE,
    fecha_Inicio_Labor DATE,
    edad INT,
    telefono VARCHAR(8),
    direccion VARCHAR(100),
    salario DECIMAL(10, 2),
    FOREIGN KEY (id_Puesto) REFERENCES Puestos(id_Puesto),
    FOREIGN KEY (id_Departamento) REFERENCES Departamentos(id_Departamento)
);

CREATE TABLE Funciones (
    id_Funcion INT AUTO_INCREMENT PRIMARY KEY,
    id_Departamento INT,
    funcion VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_Departamento) REFERENCES Departamentos(id_Departamento)
);

CREATE TABLE Seguros (
    id_Seguro INT AUTO_INCREMENT PRIMARY KEY,
    seguro VARCHAR(50) NOT NULL
);

CREATE TABLE Clientes (
    cui VARCHAR(13) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_Nacimiento DATE,
    telefono VARCHAR(8),
    direccion VARCHAR(100),
    edad INT,
    email VARCHAR(150)
);

CREATE TABLE Polizas (
    codigo_Poliza INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado VARCHAR(13),
    id_Cliente VARCHAR(13),
    id_Seguro INT,
    fecha_Inicio DATE,
    fecha_Final DATE,
    monto DECIMAL(10, 2),
    frecuencia_Pago VARCHAR(100),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(dpi),
    FOREIGN KEY (id_Cliente) REFERENCES Clientes(cui),
    FOREIGN KEY (id_Seguro) REFERENCES Seguros(id_Seguro)
);

CREATE TABLE Historial_Llamadas (
    id_Llamada INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado VARCHAR(13),
    id_Seguro INT,
    nombre_Llamante VARCHAR(50),
    numero_Telefonico VARCHAR(8),
    fecha_Llamada DATE,
    hora_Llamada TIME,
    duracion_Llamada TIME,
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(dpi),
    FOREIGN KEY (id_Seguro) REFERENCES Seguros(id_Seguro)
);

CREATE TABLE Pagos (
    id_Pago INT AUTO_INCREMENT PRIMARY KEY,
    id_Poliza INT,
    id_Empleado VARCHAR(13),
    id_Cliente VARCHAR(13),
    tarifa DECIMAL(10, 2),
    mora DECIMAL(10, 2),
    monto DECIMAL(10, 2),
    forma_Pago VARCHAR(10),
    fecha_Pago DATE,
    FOREIGN KEY (id_Poliza) REFERENCES Polizas(codigo_Poliza),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(dpi),
    FOREIGN KEY (id_Cliente) REFERENCES Clientes(cui)
);

CREATE TABLE Papeleria (
    id_Papeleria INT AUTO_INCREMENT PRIMARY KEY,
    id_Seguro INT,
    documento VARCHAR(100),
    FOREIGN KEY (id_Seguro) REFERENCES Seguros(id_Seguro)
);
