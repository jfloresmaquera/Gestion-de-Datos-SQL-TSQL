USE [GD2C2021]
GO

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


/*-------------------------BORRAR ESQUEMA----------------------------*/
IF EXISTS (SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'StarTeam')
  DROP SCHEMA StarTeam
GO



/*----------------------CREACION DE ESQUEMA--------------------------*/
CREATE SCHEMA StarTeam
GO

/*-------------------------CREACION TABLAS---------------------------*/


CREATE TABLE StarTeam.Chofer (
  CHOFER_NRO_LEGAJO int PRIMARY KEY,
  CHOFER_NOMBRE nvarchar(255) NOT NULL,
  CHOFER_APELLIDO nvarchar(255) NOT NULL,
  CHOFER_DNI decimal(18,0) NOT NULL,
  CHOFER_DIRECCION nvarchar(255) NOT NULL,
  CHOFER_TELEFONO int NOT NULL,
  CHOFER_MAIL nvarchar(255) NOT NULL,
  CHOFER_FECHA_NAC datetime2(3) NOT NULL,
  CHOFER_COSTO_HORA int NOT NULL
  );

CREATE TABLE StarTeam.Paquete (
  PAQUETE_ID int PRIMARY KEY IDENTITY(1,1),
  PAQUETE_PESO_MAX decimal(18,2) NOT NULL,
  PAQUETE_ALTO_MAX decimal(18,2) NOT NULL,
  PAQUETE_ANCHO_MAX decimal(18,2) NOT NULL,
  PAQUETE_LARGO_MAX decimal(18,2) NOT NULL,
  PAQUETE_PRECIO decimal(18,2) NOT NULL,
  PAQUETE_DESCRIPCION nvarchar(255) NOT NULL,
  );

CREATE TABLE StarTeam.Modelo_Camion (
  MODELO_CAMION_ID int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_DESCRIPCION nvarchar(255) NOT NULL
);

CREATE TABLE StarTeam.Modelo (
  MODELO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_ID int FOREIGN KEY REFERENCES StarTeam.Modelo_Camion(MODELO_CAMION_ID) NOT NULL,
  MODELO_VELOCIDAD_MAX int NOT NULL,
  MODELO_CAPACIDAD_TANQUE int NOT NULL,
  MODELO_CAPACIDAD_CARGA int NOT NULL
  );
  
CREATE TABLE StarTeam.Marca (
  MARCA_ID int PRIMARY KEY IDENTITY(1,1),
  MARCA_DESCRIPCION nvarchar(255) NOT NULL
  );

CREATE TABLE StarTeam.Camion (
  CAMION_NUMERO int PRIMARY KEY IDENTITY (1,1),
  CAMION_MODELO int FOREIGN KEY REFERENCES StarTeam.Modelo(MODELO_NUMERO) NOT NULL,
  CAMION_MARCA int FOREIGN KEY REFERENCES StarTeam.Marca(MARCA_ID) NOT NULL,
  CAMION_PATENTE nvarchar(255) NOT NULL,
  CAMION_NRO_CHASIS nvarchar(255) NOT NULL,
  CAMION_NRO_MOTOR nvarchar(255) NOT NULL,
  CAMION_FECHA_ALTA datetime2(3) NOT NULL
);

CREATE TABLE StarTeam.Ciudad (
  CIUDAD_ID int PRIMARY KEY IDENTITY(1,1),
  CIUDAD_DESCRIPCION nvarchar(255) NOT NULL
  );

CREATE TABLE StarTeam.Recorrido (
  RECORRIDO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  RECORRIDO_CIUDAD_ORIGEN int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID) NOT NULL,
  RECORRIDO_CIUDAD_DESTINO int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID) NOT NULL,
  RECORRIDO_KM int NOT NULL,
  RECORRIDO_PRECIO decimal(18,2) NOT NULL
  );

CREATE TABLE StarTeam.Viaje (
  VIAJE_NRO_VIAJE int PRIMARY KEY IDENTITY(1,1),
  VIAJE_CAMION_NUMERO int FOREIGN KEY REFERENCES StarTeam.Camion(CAMION_NUMERO) NOT NULL,
  VIAJE_RECORRIDO_NUMERO int FOREIGN KEY REFERENCES StarTeam.Recorrido(RECORRIDO_NUMERO) NOT NULL,
  VIAJE_CHOFER_LEGAJO int FOREIGN KEY REFERENCES StarTeam.Chofer(CHOFER_NRO_LEGAJO) NOT NULL,
  VIAJE_FECHA_INICIO datetime2(7) NOT NULL,
  VIAJE_FECHA_FIN datetime2(3),
  VIAJE_CONSUMO_COMBUSTIBLE decimal(18,2)
  );

CREATE TABLE StarTeam.Paquete_X_Viaje (
  PAQUETE_NRO_VIAJE int FOREIGN KEY REFERENCES StarTeam.Viaje(VIAJE_NRO_VIAJE) NOT NULL,
  PAQUETE_ID int FOREIGN KEY REFERENCES StarTeam.Paquete(PAQUETE_ID) NOT NULL,
  PAQUETE_CANTIDAD int,
  CONSTRAINT PK_Paquete_X_viaje PRIMARY KEY (PAQUETE_NRO_VIAJE, PAQUETE_ID)
  );

CREATE TABLE StarTeam.Taller (
  TALLER_NUMERO int PRIMARY KEY IDENTITY (1,1),
  TALLER_CIUDAD int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID) NOT NULL,
  TALLER_NOMBRE nvarchar(255) NOT NULL,
  TALLER_MAIL nvarchar(255) NOT NULL,
  TALLER_TELEFONO decimal(18) NOT NULL,
  TALLER_DIRECCION nvarchar(255) NOT NULL
  );

CREATE TABLE StarTeam.Orden_Trabajo (
  ORDEN_TRABAJO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  ORDEN_TRABAJO_CAMION int FOREIGN KEY REFERENCES StarTeam.Camion(CAMION_NUMERO) NOT NULL,
  ORDEN_TRABAJO_TALLER_NRO int FOREIGN KEY REFERENCES StarTeam.Taller(TALLER_NUMERO) NOT NULL,
  ORDEN_TRABAJO_ESTADO int FOREIGN KEY REFERENCES StarTeam.Orden_Estado(ORDEN_ESTADO_ID) NOT NULL,
  ORDEN_TRABAJO_FECHA nvarchar(255) NOT NULL
);

CREATE TABLE StarTeam.Orden_Estado (
  ORDEN_ESTADO_ID int PRIMARY KEY IDENTITY(1,1),
  ORDEN_ESTADO_DESCRIPCION nvarchar(255) NOT NULL
  );

CREATE TABLE StarTeam.Mecanico (
  MECANICO_NRO_LEGAJO int PRIMARY KEY,
  MECANICO_NOMBRE nvarchar(255) NOT NULL,
  MECANICO_APELLIDO nvarchar(255) NOT NULL,
  MECANICO_DNI decimal(18) NOT NULL,
  MECANICO_DIRECCION nvarchar(255) NOT NULL,
  MECANICO_MAIL nvarchar(255) NOT NULL,
  MECANICO_TELEFONO int NOT NULL,
  MECANICO_FECHA_NAC datetime2(3) NOT NULL,
  MECANICO_COSTO_HORA int NOT NULL

  );


CREATE TABLE StarTeam.Tarea_Tipo (
  TAREA_TIPO_ID int PRIMARY KEY,
  TAREA_TIPO_DESCRIPCION nvarchar(255) NOT NULL
  );


CREATE TABLE StarTeam.Tarea (
  TAREA_CODIGO int PRIMARY KEY,
  TAREA_TIPO nvarchar(255) FOREIGN KEY REFERENCES StarTeam.Tarea_Tipo(TAREA_TIPO_ID) NOT NULL,
  TAREA_DESCRIPCION nvarchar(255) NOT NULL,
  TAREA_TIEMPO_ESTIMADO int NOT NULL
  );

CREATE TABLE StarTeam.Tarea_X_Orden_Trabajo (
  TAREA_ORDEN_TRABAJO int  FOREIGN KEY REFERENCES StarTeam.Orden_Estado(ORDEN_ESTADO_ID) NOT NULL,
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.Tarea(TAREA_CODIGO) NOT NULL,
  MECANICO_NRO_LEGAJO int FOREIGN KEY REFERENCES StarTeam.Mecanico(MECANICO_NRO_LEGAJO) NOT NULL,
  TAREA_FECHA_INICIO_PLANIFICADO datetime2(3) NOT NULL,
  TAREA_FECHA_INICIO datetime2(3),
  TAREA_FECHA_FIN datetime2(3),
  TAREA_TIEMPO_EJECUTADO decimal(18,2),
  CONSTRAINT PK_Tarea_X_Orden_Trabajo PRIMARY KEY (TAREA_ORDEN_TRABAJO, TAREA_CODIGO)
  );


CREATE TABLE StarTeam.Material (
  MATERIAL_CODIGO int PRIMARY KEY,
  MATERIAL_NOMBRE nvarchar(20) NOT NULL,
  MATERIAL_PRECIO int NOT NULL
  );

CREATE TABLE StarTeam.Material_Por_Tarea (
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.Tarea(TAREA_CODIGO) NOT NULL,
  MATERIAL_CODIGO int FOREIGN KEY REFERENCES StarTeam.Material(MATERIAL_CODIGO) NOT NULL,
  MATERIAL_POR_TAREA_CANTIDAD int NOT NULL,
  CONSTRAINT PK_Material_Por_Tarea PRIMARY KEY (TAREA_CODIGO, MATERIAL_CODIGO)
  );



/*---------------------CREACION DE FUNCIONES-------------------------*/


CREATE FUNCTION StarTeam.Obtener_Camion_ID (@MODELO_CAMION_DESCRIPCION NVARCHAR(255))
RETURNS int
AS
BEGIN
	DECLARE @MODELO_CAMION_ID as int

  SELECT @MODELO_CAMION_ID = MODELO_CAMION_ID FROM StarTeam.Modelo_Camion
  WHERE MODELO_CAMION_DESCRIPCION = @MODELO_CAMION_DESCRIPCION

  RETURN @MODELO_CAMION_ID

END
GO


/*-------------------CREACION DE PROCEDIMIENTOS----------------------*/

/*
Con estos vamos a efectivamente llenar de datos cada tabla 
*/

CREATE PROCEDURE StarTeam.Migrar_Modelo_Camion
AS
BEGIN
  INSERT INTO StarTeam.Modelo_Camion (MODELO_CAMION_DESCRIPCION)
          SELECT DISTINCT MODELO_CAMION
          FROM gd_esquema.Maestra
          WHERE MODELO_CAMION IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Modelo
AS
BEGIN
  INSERT INTO StarTeam.Modelo (MODELO_CAMION_ID, MODELO_VELOCIDAD_MAX, MODELO_CAPACIDAD_TANQUE, MODELO_CAPACIDAD_CARGA)
          SELECT DISTINCT StarTeam.Obtener_Camion_ID(MODELO_CAMION), MODELO_VELOCIDAD_MAX, MODELO_CAPACIDAD_TANQUE, MODELO_CAPACIDAD_CARGA
          FROM gd_esquema.Maestra
          WHERE MODELO_CAMION IS NOT NULL
	        ORDER BY MODELO_CAMION_ID ASC
END
GO

/*------------------EJECUCION DE PROCEDIMIENTOS----------------------*/

EXEC StarTeam.Migrar_Modelo_Camion
EXEC StarTeam.Migrar_Modelo