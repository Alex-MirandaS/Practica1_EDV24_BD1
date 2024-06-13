
CREATE DATABASE distProductos;

USE distProductos;



-- +++++INVENTARIO+++++
--INVENTARIO
    --SKU_Producto (13 INT) FK
    --CATEGORÍA???
    --Fecha_Entrada
    --Línea???
    --Asign_Espacio FK
    --Stock

--C_PRODUCTO
    --ID_C_Producto
    --categoria

--PRODUCTO:
    --SKU (13 INT) PK
    --Nombre
    --Descripcion
    --Precio
    --Categoria FK

--INGRESOS
    --ID_INGRESO
    --SKU_Producto FK
    --cantidad
    --Fecha_Ingreso

--ESTANTERÍAS
    --ID_Est PK
    --filas
    --columnas
--Asig_Espacios
    --ID_Asig_Esp PK
    --ID_Est FK
    --fila
    --columna

--T_PEDIDOS
    --ID_T_Pedidos PK
    --tipo

--PEDIDOS
    --ID_pedido PK
    --fecha_entrega
    --total
    --muelle

--DET_PEDIDOS
    --ID_detalle PK
    --ID_pedido FK
    --ID_producto FK
    --cantidad

--DEPARTAMENTOS
    --ID_DEPARTAMENTO PK
    --DEPARTAMENTO

--T_TIENDAS
    --ID_T_Tiendas PK
    --tipo
    
--TIENDAS
    --ID_TIENDA PK
    --ID_departamento FK
    --direccion
    --ID_T_TIENDA FK
    --descriptores?????????

--ROLES
    --ID_Rol PK
    --rol

--AREA_T
    --ID_Area_T PK
    --area_T

--JORNADA
    --ID_Jornada PK
    --jornada

--EMPLEADOS
    --ID_Empleado (7 INT) PK
    --ID_Rol FK
    --ID_Area_T FK
    --sueldo
    --edad
    --ID_Jornada
    --rendimiento???
    --direccion
    --telefono
    --num_IGSS
    --correo

--FALTAS
    --ID_FALTA PK
    --ID_T_FALTA
    --Incidencias

--T_FALTA
    --ID_T_FALTA PK
    --Falta
    --Descripcion

-- ++PLANIFICACIÓN DE RUTAS++

--Vehiculo
    --PLACA PK
    --MODELO
    --ANIO

--ITINERARIOS
    --ID_Itinerario PK
    --ID_Encargado FK
    --ID_Vehículo FK
    --Hora_Ingreso
    --Hora_Egreso

--PROVEEDORES
    --ID_Proveedor PK
    --nombre
    --dirección
    --telefono
    --correo
    --nombre_Empresa

--INVENTARIO_EQUIPO
    --ID_I_EQUIPO PK
    --ID_EQUIPO FK
    --Fecha_U_Mantenimiento
    --ID_Encargado FK
    --Cantidad

--EQUIPOS
    --ID_EQUIPO
    --equipo
    --descripcion

--CAPACITACIONES
    --ID_CAPACITACION PK
    --Tema
    --Fecha
    --Tiempo
    --Encargado
    --Certificado
    --Lugar

--R_CAPACITACIONES
    --ID_R_CAPACITACION PK
    --ID_CAPACITACION FK
    --ID_EMPLEADO



--REGISTRO DE RUTAS PARA ARMADO Y ENSAMBLAJE DE PRODUCTOS, JPERSONAL Y DETALLES???

--EFICIENCIA EN LA DISTRIBUCION

--SUPERVISION EN TIEMPO REAL