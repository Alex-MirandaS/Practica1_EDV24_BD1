
CREATE DATABASE distProductos;

USE distProductos;

CREATE TABLE Estanterias(
    id_Estanteria INT NOT NULL AUTO_INCREMENT, 
    filas INT NOT NULL,
    columnas INT NOT NULL,
    PRIMARY KEY (id_Estanteria)
);

CREATE TABLE Asig_Espacios(
    id_Asign_Espacio INT NOT NULL AUTO_INCREMENT, 
    id_Estanteria INT NOT NULL,
    fila INT NOT NULL,
    columna INT NOT NULL,
    PRIMARY KEY (id_Asign_Espacio),
    FOREIGN KEY (id_Estanteria) REFERENCES Estanterias (id_Estanteria)
);

CREATE TABLE C_Productos(
    id_C_Producto INT NOT NULL AUTO_INCREMENT, 
    categoria VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_C_Producto)
);

CREATE TABLE Productos(
    sku_Producto INT NOT NULL AUTO_INCREMENT, 
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio INTEGER NOT NULL,
    categoria INT, 
    PRIMARY KEY (sku_Producto),
    FOREIGN KEY (categoria) REFERENCES C_Productos (id_C_Producto)
);

CREATE TABLE Inventario(
    id_Inventario INT NOT NULL AUTO_INCREMENT,
    sku_Producto INT NOT NULL, 
    fecha_Entrega DATE NOT NULL,
    id_Asign_Espacio INT,
    stock INT NOT NULL,
    PRIMARY KEY (id_Inventario),
    FOREIGN KEY (sku_Producto) REFERENCES Productos (sku_Producto)
);

CREATE TABLE Ingresos(
    id_Ingreso INT NOT NULL AUTO_INCREMENT,
    sku_Producto INT NOT NULL, 
    fecha_Ingreso DATE NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_Ingreso),
    FOREIGN KEY (sku_Producto) REFERENCES Productos (sku_Producto)
);

CREATE TABLE T_Pedidos(
    id_T_Pedido INT NOT NULL AUTO_INCREMENT,
    tipo_Pedido VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_T_Pedido)
);

CREATE TABLE Pedidos(
    id_Pedido INT NOT NULL AUTO_INCREMENT,
    total INTEGER NOT NULL,
    fecha_Entrega DATE NOT NULL,
    muelle INT NOT NULL,
    id_T_Pedido INT NOT NULL,
    PRIMARY KEY (id_Pedido),
    FOREIGN KEY (id_T_Pedido) REFERENCES T_Pedidos (id_T_Pedido)
);

CREATE TABLE Det_Pedidos(
    id_Det_Pedido INT NOT NULL AUTO_INCREMENT,
    id_Pedido INT NOT NULL,
    sku_Producto INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_Det_Pedido),
    FOREIGN KEY (id_Pedido) REFERENCES Pedidos (id_Pedido),
    FOREIGN KEY (sku_Producto) REFERENCES Productos (sku_Producto)
);

CREATE TABLE Departamentos(
    id_Departamento INT NOT NULL AUTO_INCREMENT,
    departamento VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_Departamento)
);

CREATE TABLE T_Tiendas(
    id_T_Tienda INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_T_Tienda)
);

CREATE TABLE Tiendas(
    id_Tienda INT NOT NULL AUTO_INCREMENT,
    id_T_Tienda INT NOT NULL,
    id_Departamento INT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_Tienda),
    FOREIGN KEY (id_T_Tienda) REFERENCES T_Tiendas (id_T_Tienda),
    FOREIGN KEY (id_Departamento) REFERENCES Departamentos (id_Departamento)
);

CREATE TABLE Roles(
    id_Rol INT NOT NULL AUTO_INCREMENT,
    rol VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_Rol)
);

CREATE TABLE Area_T(
    id_Area_T INT NOT NULL AUTO_INCREMENT,
    area_T VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_Area_T)
);

CREATE TABLE Jornada(
    id_Jornada INT NOT NULL AUTO_INCREMENT,
    jornada VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_Jornada)
);

CREATE TABLE Rendimiento(
    id_Rendimiento INT NOT NULL AUTO_INCREMENT,
    rendimiento VARCHAR(50) NOT NULL,
    nivel INT NOT NULL,
    PRIMARY KEY (id_Rendimiento)
);

CREATE TABLE Empleados(
    id_Empleado INT (7) NOT NULL,
    id_Rol INT NOT NULL,
    id_Area_T INT NOT NULL,
    id_Jornada INT NOT NULL,
    id_Rendimiento INT NOT NULL,
    sueldo INTEGER NOT NULL,
    edad INT NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT NOT NULL,
    num_IGSS INT NOT NULL,
    email VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_Empleado),
    FOREIGN KEY (id_Rol) REFERENCES Roles (id_Rol),
    FOREIGN KEY (id_Area_T) REFERENCES Area_T (id_Area_T),
    FOREIGN KEY (id_Jornada) REFERENCES Jornada (id_Jornada),
    FOREIGN KEY (id_Rendimiento) REFERENCES Rendimiento (id_Rendimiento)
);

CREATE TABLE T_Faltas(
    id_T_Falta INT NOT NULL AUTO_INCREMENT,
    falta VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_T_Falta)
);

CREATE TABLE Faltas(
    id_Falta INT NOT NULL AUTO_INCREMENT,
    id_T_Falta INT NOT NULL,
    incidencias VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_Falta),
    FOREIGN KEY (id_T_Falta) REFERENCES T_Faltas (id_T_Falta)
);


CREATE TABLE Vehiculo(
    placa VARCHAR(7) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    PRIMARY KEY (placa)
);

CREATE TABLE Itinerarios(
    id_Itenarario INT NOT NULL AUTO_INCREMENT,
    id_Encargado INT NOT NULL,
    id_Vehiculo VARCHAR(7) NOT NULL,
    hora_Ingreso TIME NOT NULL,
    hora_Egreso TIME NOT NULL,
    PRIMARY KEY (id_Itenarario),
    FOREIGN KEY (id_Encargado) REFERENCES Empleados (id_Empleado),
    FOREIGN KEY (id_Vehiculo) REFERENCES Vehiculo (placa)
);

CREATE TABLE Proveedores(
    id_Proveedor INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono INT NOT NULL,
    nombre_Empresa VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_Proveedor)
);

CREATE TABLE Equipos(
    id_Equipo INT NOT NULL AUTO_INCREMENT,
    equipo VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_Equipo)
);

CREATE TABLE Inventario_Equipo(
    id_I_Equipo INT NOT NULL AUTO_INCREMENT,
    id_Equipo INT NOT NULL,
    id_Encargado INT NOT NULL,
    fecha_U_Mantenimiento DATE NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_I_Equipo),
    FOREIGN KEY (id_Equipo) REFERENCES Equipos (id_Equipo),
    FOREIGN KEY (id_Encargado) REFERENCES Empleados (id_Empleado)
);

CREATE TABLE Capacitaciones(
    id_Capacitacion INT NOT NULL AUTO_INCREMENT,
    tema VARCHAR(50) NOT NULL,
    fecha DATE NOT NULL,
    duracion INT NOT NULL,
    encargado VARCHAR(50) NOT NULL,
    esCertificado BOOLEAN NOT NULL,
    Lugar VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_Capacitacion)
);

CREATE TABLE R_Capacitaciones(
    id_R_Capacitacion INT NOT NULL AUTO_INCREMENT,
    id_Capacitacion INT NOT NULL,
    id_Empleado INT NOT NULL,
    PRIMARY KEY (id_R_Capacitacion), 
    FOREIGN KEY (id_Capacitacion) REFERENCES Capacitaciones (id_Capacitacion),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados (id_Empleado)
);


