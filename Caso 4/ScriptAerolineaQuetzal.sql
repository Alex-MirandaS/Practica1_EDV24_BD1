CREATE DATABASE AerolineaQuetzal;
USE AerolineaQuetzal;

CREATE TABLE Avion (
    matricula VARCHAR(50) PRIMARY KEY,
    modelo VARCHAR(50),
    num_Asiento_P_Clase INT,
    num_Asiento_EC_Clase INT,
    num_Asiento_EJ_Clase INT,
    galones_G INT,
    distancia_M INT,
    altura_M INT
);

CREATE TABLE Paises (
    id_Pais INT AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE Lugares (
    id_Lugar INT AUTO_INCREMENT PRIMARY KEY,
    id_Pais INT,
    cuidad VARCHAR(50),
    FOREIGN KEY (id_Pais) REFERENCES Paises(id_Pais)
);

CREATE TABLE T_Vuelo (
    id_T_Vuelo INT AUTO_INCREMENT PRIMARY KEY,
    tipo_Vuelo VARCHAR(10) NOT NULL
);

CREATE TABLE Vuelo (
    num_Vuelo INT AUTO_INCREMENT PRIMARY KEY,
    id_Avion VARCHAR(50),
    id_L_Origen INT,
    id_L_Destino INT,
    id_T_Vuelo INT,
    fecha_Despegue DATE,
    hora_Despegue TIME,
    fecha_Aterrizaje DATE,
    hora_Aterrizaje TIME,
    num_Pasajeros INT,
    FOREIGN KEY (id_Avion) REFERENCES Avion(matricula),
    FOREIGN KEY (id_L_Origen) REFERENCES Lugares(id_Lugar),
    FOREIGN KEY (id_L_Destino) REFERENCES Lugares(id_Lugar),
    FOREIGN KEY (id_T_Vuelo) REFERENCES T_Vuelo(id_T_Vuelo)
);

CREATE TABLE Mantenimiento (
    id_Mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_Avion VARCHAR(50),
    fecha_U_Mant DATE,
    fecha_P_Mant DATE,
    FOREIGN KEY (id_Avion) REFERENCES Avion(matricula)
);

CREATE TABLE T_Mantenimiento (
    id_T_Mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(10) NOT NULL
);

CREATE TABLE R_Mantenimiento (
    id_R_Mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_Avion VARCHAR(50),
    id_T_Mantenimiento INT,
    fecha DATE,
    hora TIME,
    observaciones TEXT,
    FOREIGN KEY (id_Avion) REFERENCES Avion(matricula),
    FOREIGN KEY (id_T_Mantenimiento) REFERENCES T_Mantenimiento(id_T_Mantenimiento)
);

CREATE TABLE Puestos (
    id_Puesto INT AUTO_INCREMENT PRIMARY KEY,
    puesto VARCHAR(50) NOT NULL
);

CREATE TABLE Jornadas (
    id_Jornada INT AUTO_INCREMENT PRIMARY KEY,
    jornada VARCHAR(20) NOT NULL
);

CREATE TABLE Horarios (
    id_Horario INT AUTO_INCREMENT PRIMARY KEY,
    id_Jornada INT,
    tiempo INT,
    hora_Entrada TIME,
    hora_Salida TIME,
    FOREIGN KEY (id_Jornada) REFERENCES Jornadas(id_Jornada)
);

CREATE TABLE Empleados (
    cui VARCHAR(13) PRIMARY KEY,
    id_Puesto INT,
    id_Horario INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_Nacimiento DATE,
    fecha_Contratacion DATE,
    direccion VARCHAR(100),
    edad INT,
    email VARCHAR(150),
    telefono VARCHAR(8),
    FOREIGN KEY (id_Puesto) REFERENCES Puestos(id_Puesto),
    FOREIGN KEY (id_Horario) REFERENCES Horarios(id_Horario)
);

CREATE TABLE Idiomas (
    id_Idioma INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado VARCHAR(13),
    idioma VARCHAR(10),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(cui)
);

CREATE TABLE Razones_R (
    id_Razon_R INT AUTO_INCREMENT PRIMARY KEY,
    razon VARCHAR(50)
);

CREATE TABLE Retiros (
    id_Despido INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado VARCHAR(13),
    id_Razon_R INT,
    fecha_Retiro DATE,
    detalles TEXT,
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(cui),
    FOREIGN KEY (id_Razon_R) REFERENCES Razones_R(id_Razon_R)
);

CREATE TABLE Motivos_I (
    id_Motivo_I INT AUTO_INCREMENT PRIMARY KEY,
    motivo VARCHAR(50)
);

CREATE TABLE Inasistencias (
    id_Inasistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado VARCHAR(13),
    id_Motivo_I INT,
    fecha DATE,
    detalles TEXT,
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(cui),
    FOREIGN KEY (id_Motivo_I) REFERENCES Motivos_I(id_Motivo_I)
);

CREATE TABLE Ing_Egr (
    id_Ing_Egr INT AUTO_INCREMENT PRIMARY KEY,
    id_Empleado VARCHAR(13),
    hora_Ingreso TIME,
    hora_Egreso TIME,
    fecha DATE,
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(cui)
);

CREATE TABLE Codigo_P (
    id_Codigo_P INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(4)
);

CREATE TABLE Cliente (
    cui VARCHAR(13) PRIMARY KEY,
    num_Pasaporte VARCHAR(15),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_Nacimiento DATE,
    id_Codigo_P INT,
    direccion VARCHAR(100),
    edad INT,
    email VARCHAR(150),
    telefono VARCHAR(8),
    FOREIGN KEY (id_Codigo_P) REFERENCES Codigo_P(id_Codigo_P)
);

CREATE TABLE F_Pago (
    id_F_Pago INT AUTO_INCREMENT PRIMARY KEY,
    forma_Pago VARCHAR(10) NOT NULL
);

CREATE TABLE Clases (
    id_Clase INT AUTO_INCREMENT PRIMARY KEY,
    clase VARCHAR(10) NOT NULL
);

CREATE TABLE Boletos (
    id_Boleto INT AUTO_INCREMENT PRIMARY KEY,
    id_Cliente VARCHAR(13),
    id_Vuelo INT,
    id_F_Pago INT,
    id_Clase INT,
    monto DECIMAL(10, 2),
    fecha_Viaje DATE,
    fecha_Regreso DATE,
    peso_Equipaje INT,
    FOREIGN KEY (id_Cliente) REFERENCES Cliente(cui),
    FOREIGN KEY (id_Vuelo) REFERENCES Vuelo(num_Vuelo),
    FOREIGN KEY (id_F_Pago) REFERENCES F_Pago(id_F_Pago),
    FOREIGN KEY (id_Clase) REFERENCES Clases(id_Clase)
);

CREATE TABLE Pagos (
    id_Pagos INT AUTO_INCREMENT PRIMARY KEY,
    id_Boleto INT,
    num_Tarjeta VARCHAR(16),
    FOREIGN KEY (id_Boleto) REFERENCES Boletos(id_Boleto)
);

CREATE TABLE Restricciones (
    id_Restriccion INT AUTO_INCREMENT PRIMARY KEY,
    restriccion VARCHAR(100)
);

CREATE TABLE R_Restricciones (
    id_R_Restriccion INT AUTO_INCREMENT PRIMARY KEY,
    id_Restriccion INT,
    id_Clase INT,
    FOREIGN KEY (id_Restriccion) REFERENCES Restricciones(id_Restriccion),
    FOREIGN KEY (id_Clase) REFERENCES Clases(id_Clase)
);

CREATE TABLE R_Tripulacion_Vuelo (
    id_R_Tripulacion INT AUTO_INCREMENT PRIMARY KEY,
    id_Vuelo INT,
    id_Empleado VARCHAR(100),
    FOREIGN KEY (id_Vuelo) REFERENCES Vuelo(num_Vuelo),
    FOREIGN KEY (id_Empleado) REFERENCES Empleados(cui)
);
