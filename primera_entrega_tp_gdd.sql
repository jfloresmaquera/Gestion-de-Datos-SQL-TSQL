USE [GD2C2021]
GO

/*----------------------CREACION DE ESQUEMA--------------------------*/
CREATE SCHEMA StarTeam
GO

/*-------------------------BORRAR ESQUEMA----------------------------*/
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'StarTeam')
  DROP SCHEMA StarTeam
GO

/*-------------------------CREACION TABLAS---------------------------*/

CREATE TABLE StarTeam.Chofer (
  CHOFER_NRO_LEGAJO int PRIMARY KEY,
  CHOFER_NOMBRE nvarchar(255),
  CHOFER_APELLIDO nvarchar(255),
  CHOFER_DNI decimal(18,0),
  CHOFER_DIRECCION nvarchar(255),
  CHOFER_TELEFONO int,
  CHOFER_MAIL nvarchar(255),
  CHOFER_FECHA_NAC datetime2(3),
  CHOFER_COSTO_HORA int
  );

CREATE TABLE StarTeam.Paquete (
  PAQUETE_ID int PRIMARY KEY IDENTITY(1,1),
  PAQUETE_PESO_MAX decimal(18,2),
  PAQUETE_ALTO_MAX decimal(18,2),
  PAQUETE_ANCHO_MAX decimal(18,2),
  PAQUETE_LARGO_MAX decimal(18,2),
  PAQUETE_PRECIO decimal(18,2),
  PAQUETE_DESCRIPCION nvarchar(255),
  );

CREATE TABLE StarTeam.Paquete_X_Viaje (
  PAQUETE_NRO_VIAJE int FOREIGN KEY REFERENCES StarTeam.Viaje(VIAJE_NRO_VIAJE),
  PAQUETE_ID int FOREIGN KEY REFERENCES StarTeam.Paquete(PAQUETE_ID),
  PAQUETE_CANTIDAD int,
  CONSTRAINT PK_Paquete_X_viaje PRIMARY KEY (PAQUETE_NRO_VIAJE, PAQUETE_ID)
  );

CREATE TABLE StarTeam.Viaje (
  VIAJE_NRO_VIAJE int PRIMARY KEY IDENTITY(1,1),
  VIAJE_CAMION_NUMERO int FOREIGN KEY REFERENCES StarTeam.Camion(CAMION_NUMERO),
  VIAJE_RECORRIDO_NUMERO int FOREIGN KEY REFERENCES StarTeam.Recorrido(RECORRIDO_NUMERO),
  VIAJE_CHOFER_LEGAJO int FOREIGN KEY REFERENCES StarTeam.Chofer(CHOFER_NRO_LEGAJO),
  VIAJE_FECHA_INICIO datetime2(7),
  VIAJE_FECHA_FIN datetime2(3),
  VIAJE_CONSUMO_COMBUSTIBLE decimal(18,2)
  );

CREATE TABLE StarTeam.Recorrido (
  RECORRIDO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  RECORRIDO_CIUDAD_ORIGEN int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID),
  RECORRIDO_CIUDAD_DESTINO int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID),
  RECORRIDO_KM int,
  RECORRIDO_PRECIO decimal(18,2)
  );

CREATE TABLE StarTeam.Ciudad (
  CIUDAD_ID int PRIMARY KEY IDENTITY(1,1),
  CIUDAD_DESCRIPCION nvarchar(255)
  );

CREATE TABLE StarTeam.Modelo_Camion (
  MODELO_CAMION_ID int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_DESCRIPCION nvarchar(255)
  );

CREATE TABLE StarTeam.Modelo (
  MODELO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_ID int FOREIGN KEY REFERENCES StarTeam.Modelo_Camion(MODELO_CAMION_ID),
  MODELO_VELOCIDAD_MAX int,
  MODELO_CAPACIDAD_TANQUE int,
  MODELO_CAPACIDAD_CARGA int
  );

CREATE TABLE StarTeam.Camion (
  CAMION_NUMERO int PRIMARY KEY IDENTITY (1,1),
  CAMION_MODELO int FOREIGN KEY REFERENCES StarTeam.Modelo(MODELO_NUMERO),
  CAMION_MARCA int FOREIGN KEY REFERENCES StarTeam.Marca(MARCA_ID),
  CAMION_PATENTE nvarchar(255),
  CAMION_NRO_CHASIS nvarchar(255),
  CAMION_NRO_MOTOR nvarchar(255),
  CAMION_FECHA_ALTA datetime2(3)
  );

CREATE TABLE StarTeam.Marca (
  MARCA_ID int PRIMARY KEY IDENTITY(1,1),
  MARCA_DESCRIPCION nvarchar(255)
  );

CREATE TABLE StarTeam.Taller (
  TALLER_NUMERO int PRIMARY KEY IDENTITY (1,1),
  TALLER_CIUDAD nvarchar(255),
  TALLER_NOMBRE nvarchar(255),
  TALLER_MAIL nvarchar(255),
  TALLER_TELEFONO decimal(18),
  TALLER_DIRECCION nvarchar(255)
  );

CREATE TABLE StarTeam.Orden_Trabajo (
  ORDEN_TRABAJO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  ORDEN_TRABAJO_CAMION int FOREIGN KEY REFERENCES StarTeam.Camion(CAMION_NUMERO),
  ORDEN_TRABAJO_TALLER_NRO int FOREIGN KEY REFERENCES StarTeam.Taller(TALLER_NUMERO),
  ORDEN_TRABAJO_FECHA nvarchar(255),
  ORDEN_ESTADO_ID int
  );

CREATE TABLE StarTeam.Orden_Estado (
  ORDEN_ESTADO_ID int PRIMARY KEY IDENTITY(1,1),
  ORDEN_ESTADO_DESCRIPCION nvarchar(255)
  );

CREATE TABLE StarTeam.Tarea_X_Orden_Trabajo (
  TAREA_ORDEN_TRABAJO int  FOREIGN KEY REFERENCES StarTeam.Orden_Estado(ORDEN_ESTADO_ID),
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.Tarea(TAREA_CODIGO),
  MECANICO_NRO_LEGAJO Int,
  TAREA_FECHA_INICIO_PLANIFICADO datetime2(3),
  TAREA_FECHA_INICIO datetime2(3),
  TAREA_FECHA_FIN datetime2(3),
  TAREA_TIEMPO_EJECUTADO decimal(18,2),
  CONSTRAINT PK_Tarea_X_Orden_Trabajo PRIMARY KEY (TAREA_ORDEN_TRABAJO, TAREA_CODIGO)
  );

CREATE TABLE StarTeam.Mecanico (
  MECANICO_NRO_LEGAJO int PRIMARY KEY ,
  MECANICO_NOMBRE nvarchar(255),
  MECANICO_APELLIDO nvarchar(255),
  MECANICO_DNI decimal(18),
  MECANICO_DIRECCION nvarchar(255),
  MECANICO_MAIL nvarchar(255),
  MECANICO_TELEFONO int,
  MECANICO_FECHA_NAC datetime2(3),
  MECANICO_COSTO_HORA int
  );

CREATE TABLE StarTeam.Tarea (
  TAREA_CODIGO int PRIMARY KEY,
  TAREA_TIPO nvarchar(255) FOREIGN KEY REFERENCES StarTeam.Tarea_Tipo(TAREA_TIPO_ID),
  TAREA_DESCRIPCION nvarchar(255),
  TAREA_TIEMPO_ESTIMADO int
  );

CREATE TABLE StarTeam.Tarea_Tipo (
  TAREA_TIPO_ID int PRIMARY KEY,
  TAREA_TIPO_DESCRIPCION nvarchar(255)
  );

CREATE TABLE StarTeam.Material_Por_Tarea (
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.Tarea(TAREA_CODIGO),
  MATERIAL_CODIGO int FOREIGN KEY REFERENCES StarTeam.Material(MATERIAL_CODIGO),
  MATERIAL_POR_TAREA_CANTIDAD int,
  CONSTRAINT PK_Material_Por_Tarea PRIMARY KEY (TAREA_CODIGO, MATERIAL_CODIGO)
  );

CREATE TABLE StarTeam.Material (
  MATERIAL_CODIGO int PRIMARY KEY,
  MATERIAL_NOMBRE nvarchar(20),
  MATERIAL_PRECIO int
  );



/*---------------------------BORRAR TABLAS---------------------------*/
IF OBJECT_ID('StarTeam.Chofer', 'U') IS NOT NULL
  DROP TABLE StarTeam.Chofer
GO

IF OBJECT_ID('StarTeam.Paquete', 'U') IS NOT NULL
  DROP TABLE StarTeam.Paquete
GO

IF OBJECT_ID('StarTeam.Paquete_X_Viaje', 'U') IS NOT NULL
  DROP TABLE StarTeam.Paquete_X_Viaje
GO

IF OBJECT_ID('StarTeam.Viaje', 'U') IS NOT NULL
  DROP TABLE StarTeam.Viaje
GO

IF OBJECT_ID('StarTeam.Recorrido', 'U') IS NOT NULL
  DROP TABLE StarTeam.Recorrido
GO

IF OBJECT_ID('StarTeam.Ciudad', 'U') IS NOT NULL
  DROP TABLE StarTeam.Ciudad
GO

IF OBJECT_ID('StarTeam.Modelo_Camion', 'U') IS NOT NULL
  DROP TABLE StarTeam.Modelo_Camion
GO

IF OBJECT_ID('StarTeam.Modelo', 'U') IS NOT NULL
  DROP TABLE StarTeam.Modelo
GO

IF OBJECT_ID('StarTeam.Camion', 'U') IS NOT NULL
  DROP TABLE StarTeam.Camion
GO

IF OBJECT_ID('StarTeam.Marca', 'U') IS NOT NULL
  DROP TABLE StarTeam.Marca
GO

IF OBJECT_ID('StarTeam.Taller', 'U') IS NOT NULL
  DROP TABLE StarTeam.Taller
GO

IF OBJECT_ID('StarTeam.Orden_Trabajo', 'U') IS NOT NULL
  DROP TABLE StarTeam.Orden_Trabajo
GO

IF OBJECT_ID('StarTeam.Orden_Estado', 'U') IS NOT NULL
  DROP TABLE StarTeam.Orden_Estado
GO

IF OBJECT_ID('StarTeam.Tarea_X_Orden_Trabajo', 'U') IS NOT NULL
  DROP TABLE StarTeam.Tarea_X_Orden_Trabajo
GO

IF OBJECT_ID('StarTeam.Mecanico', 'U') IS NOT NULL
  DROP TABLE StarTeam.Mecanico
GO

IF OBJECT_ID('StarTeam.Tarea', 'U') IS NOT NULL
  DROP TABLE StarTeam.Tarea
GO

IF OBJECT_ID('StarTeam.Tarea_Tipo', 'U') IS NOT NULL
  DROP TABLE StarTeam.Tarea_Tipo
GO

IF OBJECT_ID('StarTeam.Material_Por_Tarea', 'U') IS NOT NULL
  DROP TABLE StarTeam.Chofer
GO

IF OBJECT_ID('StarTeam.Material', 'U') IS NOT NULL
  DROP TABLE StarTeam.Material
GO

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create table personas
(
  id int primary key,
  nombre char(50) not null,
  dni char(8) not null,
  direccionn char(100) null
)

create table provincia
(
  id int primary key,
  nombre char(50)
)

CREATE TABLE Persona (
                       ID int NOT NULL,
                       DNI int NOT NULL,
                       Nombre varchar(255) NOT NULL,
                       CONSTRAINT PK_Persona PRIMARY KEY (ID, DNI)
);

ALTER TABLE Persona
  DROP CONSTRAINT PK_Persona;

DROP TABLE personas

CREATE TABLE Persons (
                       ID int NOT NULL,
                       LastName varchar(255) NOT NULL,
                       FirstName varchar(255),
                       Age int,
                       PRIMARY KEY (ID)
);

CREATE TABLE Orders (
                      OrderID int NOT NULL PRIMARY KEY,
                      OrderNumber int NOT NULL,
                      PersonID int FOREIGN KEY REFERENCES Persons(ID)
);

CREATE TABLE Orders (
                      OrderID int NOT NULL PRIMARY KEY,
                      OrderNumber int NOT NULL,
                      PersonID int FOREIGN KEY REFERENCES Persons(ID)
);

alter table personas add constraint fk_pcia
  FOREIGN KEY (id_pcia) REFERENCES provincia(id);

