CREATE DATABASE ProduccionComputadoras;
USE ProduccionComputadoras;

CREATE TABLE T_Bodega (
    id_T_Bodega INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL
);

CREATE TABLE T_Partes (
    id_T_Parte INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL
);

CREATE TABLE Empleados (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    telefono VARCHAR(8),
    email VARCHAR(150)
);

CREATE TABLE Bodegas (
    num_Bodega INT AUTO_INCREMENT PRIMARY KEY,
    id_Encargado INT NOT NULL,
    id_T_Bodega INT NOT NULL,
    direccion VARCHAR(100),
    FOREIGN KEY (id_T_Bodega) REFERENCES T_Bodega(id_T_Bodega),
    FOREIGN KEY (id_Encargado) REFERENCES Empleados(codigo)
);

CREATE TABLE Partes (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    id_T_Parte INT NOT NULL,
    nombre VARCHAR(100),
    color VARCHAR(20),
    garantia INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_T_Parte) REFERENCES T_Partes(id_T_Parte)
);

CREATE TABLE Paises (
    id_Pais INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE Proveedores (
    id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(8),
    compania VARCHAR(50),
    id_Pais INT NOT NULL,
    FOREIGN KEY (id_Pais) REFERENCES Paises(id_Pais)
);

CREATE TABLE Comp_Partes (
    id_Comp_Partes INT AUTO_INCREMENT PRIMARY KEY,
    id_Parte INT NOT NULL,
    id_Proveedor INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_Parte) REFERENCES Partes(codigo),
    FOREIGN KEY (id_Proveedor) REFERENCES Proveedores(id_Proveedor)
);

CREATE TABLE Inventario_Part (
    id_Inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_Parte INT NOT NULL,
    id_Bodega INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_Parte) REFERENCES Partes(codigo),
    FOREIGN KEY (id_Bodega) REFERENCES Bodegas(num_Bodega)
);

CREATE TABLE Puestos (
    id_Puesto INT AUTO_INCREMENT PRIMARY KEY,
    puesto VARCHAR(50) NOT NULL
);

CREATE TABLE Productos (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado INT NOT NULL,
    id_Puesto INT NOT NULL,
    nombre VARCHAR(100),
    marca VARCHAR(50),
    fecha DATE,
    hora TIME,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(codigo),
    FOREIGN KEY (id_Puesto) REFERENCES Puestos(id_Puesto)
);

CREATE TABLE Inventario_Prod (
    id_Inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_Producto INT NOT NULL,
    id_Bodega INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_Producto) REFERENCES Productos(codigo),
    FOREIGN KEY (id_Bodega) REFERENCES Bodegas(num_Bodega)
);

CREATE TABLE Armado_P (
    id_Amado_P INT AUTO_INCREMENT PRIMARY KEY,
    id_Producto INT NOT NULL,
    costo_Fab DECIMAL(10, 2),
    costo_Ver_Est DECIMAL(10, 2),
    costo_Partes DECIMAL(10, 2),
    FOREIGN KEY (id_Producto) REFERENCES Productos(codigo)
);

CREATE TABLE Estados (
    id_Estado INT AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(10) NOT NULL
);

CREATE TABLE Etapas (
    id_Etapa INT AUTO_INCREMENT PRIMARY KEY,
    id_Estado INT NOT NULL,
    costo DECIMAL(10, 2),
    FOREIGN KEY (id_Estado) REFERENCES Estados(id_Estado)
);

CREATE TABLE Partes_Armado_P (
    id_Partes_Armado_P INT AUTO_INCREMENT PRIMARY KEY,
    id_Amado_P INT NOT NULL,
    id_Parte INT NOT NULL,
    id_Etapa INT NOT NULL,
    FOREIGN KEY (id_Amado_P) REFERENCES Armado_P(id_Amado_P),
    FOREIGN KEY (id_Parte) REFERENCES Partes(codigo),
    FOREIGN KEY (id_Etapa) REFERENCES Etapas(id_Etapa)
);

CREATE TABLE Planta (
    id_Planta INT AUTO_INCREMENT PRIMARY KEY,
    planta VARCHAR(50) NOT NULL
);

CREATE TABLE T_L_Ensamblaje (
    id_T_L_Ensamblaje INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL
);

CREATE TABLE L_Ensamblaje (
    id_L_Ensamblaje INT AUTO_INCREMENT PRIMARY KEY,
    id_Planta INT NOT NULL,
    id_T_L_Ensamblaje INT NOT NULL,
    id_Producto INT NOT NULL,
    id_Encargado INT NOT NULL,
    FOREIGN KEY (id_Planta) REFERENCES Planta(id_Planta),
    FOREIGN KEY (id_T_L_Ensamblaje) REFERENCES T_L_Ensamblaje(id_T_L_Ensamblaje),
    FOREIGN KEY (id_Producto) REFERENCES Productos(codigo),
    FOREIGN KEY (id_Encargado) REFERENCES Empleados(codigo)
);

CREATE TABLE R_P_T_L_Ensamblaje (
    id_R_P_T_L_Ensamblaje INT AUTO_INCREMENT PRIMARY KEY,
    id_L_Ensamblaje INT NOT NULL,
    id_Puesto INT NOT NULL,
    FOREIGN KEY (id_L_Ensamblaje) REFERENCES L_Ensamblaje(id_L_Ensamblaje),
    FOREIGN KEY (id_Puesto) REFERENCES Puestos(id_Puesto)
);

CREATE TABLE T_Jornadas (
    id_T_Jornada INT AUTO_INCREMENT PRIMARY KEY,
    jornada VARCHAR(10) NOT NULL
);

CREATE TABLE Horarios (
    id_Horario INT AUTO_INCREMENT PRIMARY KEY,
    id_T_Jornada INT NOT NULL,
    tiempo INT NOT NULL,
    hora_Entrada TIME NOT NULL,
    hora_Salida TIME NOT NULL,
    FOREIGN KEY (id_T_Jornada) REFERENCES T_Jornadas(id_T_Jornada)
);

CREATE TABLE Horarios_L_Ensamblaje (
    id_H_L_Ensamblaje INT NOT NULL PRIMARY KEY,
    id_Empleado INT NOT NULL,
    id_Horario INT NOT NULL,
    pago DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(codigo),
    FOREIGN KEY (id_Horario) REFERENCES Horarios(id_Horario)
);

CREATE TABLE Reclamos (
    id_Reclamo INT AUTO_INCREMENT PRIMARY KEY,
    id_Comp_Partes INT NOT NULL,
    detalles TEXT,
    FOREIGN KEY (id_Comp_Partes) REFERENCES Comp_Partes(id_Comp_Partes)
);

CREATE TABLE Clientes (
    id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100),
    id_Pais INT NOT NULL,
    FOREIGN KEY (id_Pais) REFERENCES Paises(id_Pais)
);

CREATE TABLE Pedidos (
    id_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_Producto INT NOT NULL,
    id_Cliente INT NOT NULL,
    adelanto DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_Producto) REFERENCES Productos(codigo),
    FOREIGN KEY (id_Cliente) REFERENCES Clientes(id_Cliente)
);

CREATE TABLE Soporte_Tecnico (
    id_S_Tecnico INT AUTO_INCREMENT PRIMARY KEY,
    id_Cliente INT NOT NULL,
    id_Producto INT NOT NULL,
    hora TIME NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_Cliente) REFERENCES Clientes(id_Cliente),
    FOREIGN KEY (id_Producto) REFERENCES Productos(codigo)
);
