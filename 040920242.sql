-- Crear la base de datos
CREATE DATABASE HospitalDB;
GO

-- Seleccionar la base de datos
USE HospitalDB;
GO

-- Crear la tabla Tipos_Productos
CREATE TABLE Tipos_Productos (
    id_tipo_producto INT PRIMARY KEY IDENTITY(1,1),
    codigo_tipo_producto VARCHAR(50) NOT NULL,
    nombre_tipo_producto VARCHAR(100) NOT NULL
);
GO

-- Crear la tabla Productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY IDENTITY(1,1),
    codigo_producto VARCHAR(50) NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    id_tipo_producto INT,
    FOREIGN KEY (id_tipo_producto) REFERENCES Tipos_Productos(id_tipo_producto)
);
GO

-- Crear la tabla Proveedores
CREATE TABLE Proveedores (
    id_proveedor INT PRIMARY KEY IDENTITY(1,1),
    rut_proveedor VARCHAR(20) NOT NULL,
    razon_social VARCHAR(150) NOT NULL,
    direccion_proveedor VARCHAR(255) NOT NULL
);
GO

-- Crear la tabla Usuarios con el campo rut agregado
CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    nombre_usuario VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    celular VARCHAR(20) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    rut VARCHAR(20) NOT NULL  -- Campo rut agregado
);
GO

-- Crear la tabla Compras
CREATE TABLE Compras (
    id_compra INT PRIMARY KEY IDENTITY(1,1),
    fecha_compra DATE NOT NULL,
    valor_total DECIMAL(18, 2) NOT NULL,
    id_proveedor INT,
    id_usuario INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedores(id_proveedor),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
GO

-- Crear la tabla Detalle_Compras
CREATE TABLE Detalle_Compras (
    id_detalle INT PRIMARY KEY IDENTITY(1,1),
    id_compra INT,
    id_producto INT,
    cantidad_producto INT NOT NULL,
    valor_producto DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (id_compra) REFERENCES Compras(id_compra),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
GO

-- Crear la tabla Bodegas
CREATE TABLE Bodegas (
    id_bodega INT PRIMARY KEY IDENTITY(1,1),
    nombre_bodega VARCHAR(100) NOT NULL,
    descripcion_bodega VARCHAR(255) NOT NULL
);
GO

-- Crear la tabla Recepciones
CREATE TABLE Recepciones (
    id_recepcion INT PRIMARY KEY IDENTITY(1,1),
    fecha_recepcion DATE NOT NULL,
    total_recepcionado DECIMAL(18, 2) NOT NULL,
    id_bodega INT,
    FOREIGN KEY (id_bodega) REFERENCES Bodegas(id_bodega)
);
GO

-- Crear la tabla Detalle_Recepciones
CREATE TABLE Detalle_Recepciones (
    id_detalle_recepcion INT PRIMARY KEY IDENTITY(1,1),
    id_recepcion INT,
    id_producto INT,
    cantidad_producto INT NOT NULL,
    valor_producto DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (id_recepcion) REFERENCES Recepciones(id_recepcion),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
GO
