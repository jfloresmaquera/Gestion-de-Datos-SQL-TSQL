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

IF OBJECT_ID('StarTeam.Material_X_Tarea', 'U') IS NOT NULL
  DROP TABLE StarTeam.Chofer
GO

IF OBJECT_ID('StarTeam.Material', 'U') IS NOT NULL
  DROP TABLE StarTeam.Material
GO

/*------------------------BORRAR FUNCIONES---------------------------*/
IF OBJECT_ID('StarTeam.Obtener_Camion_ID') IS NOT NULL
	DROP FUNCTION StarTeam.Obtener_Camion_ID
GO

IF OBJECT_ID('StarTeam.Obtener_Modelo_ID') IS NOT NULL
	DROP FUNCTION StarTeam.Obtener_Modelo_ID
GO

IF OBJECT_ID('StarTeam.Obtener_Marca_ID') IS NOT NULL
	DROP FUNCTION StarTeam.Obtener_Marca_ID
GO
/*---------------------BORRAR PROCEDIMIENTOS-------------------------*/

IF OBJECT_ID('StarTeam.Migrar_Chofer') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Chofer

IF OBJECT_ID('StarTeam.Migrar_Paquete') IS NOT NULL
	DROP PROCEDURE STARTEAM.Migrar_Paquete

IF OBJECT_ID('StarTeam.Migrar_Modelo_Camion') IS NOT NULL
	DROP PROCEDURE StarTeam.Migrar_Modelo_Camion

IF OBJECT_ID('StarTeam.Migrar_Modelo') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Modelo

IF OBJECT_ID('StarTeam.Migrar_Marca') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Marca

IF OBJECT_ID('StarTeam.Migrar_Camion') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Camion

IF OBJECT_ID('StarTeam.Migrar_Ciudad') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Ciudad

IF OBJECT_ID('StarTeam.Migrar_Recorrido') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Recorrido

IF OBJECT_ID('StarTeam.Migrar_Viaje') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Viaje

IF OBJECT_ID('StarTeam.Migrar_Paquete_X_Viaje') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Paquete_X_Viaje

IF OBJECT_ID('StarTeam.Migrar_Taller') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Taller

IF OBJECT_ID('StarTeam.Migrar_Orden_Trabajo') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Orden_Trabajo

IF OBJECT_ID('StarTeam.Migrar_Orden_Estado') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Orden_Estado

IF OBJECT_ID('StarTeam.Migrar_Mecanico') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Mecanico

IF OBJECT_ID('StarTeam.Migrar_Tarea_Tipo') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Tarea_Tipo

IF OBJECT_ID('StarTeam.Migrar_Tarea') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Tarea

IF OBJECT_ID('StarTeam.Migrar_Tarea_X_Orden_Trabajo') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Tarea_X_Orden_Trabajo

IF OBJECT_ID('StarTeam.Migrar_Material') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Material

IF OBJECT_ID('StarTeam.Migrar_Material_X_Tarea') IS NOT NULL
  DROP PROCEDURE StarTeam.Migrar_Material_Por_Tarea


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
GO

CREATE TABLE StarTeam.Paquete (
  PAQUETE_ID int PRIMARY KEY IDENTITY(1,1),
  PAQUETE_PESO_MAX decimal(18,2) NOT NULL,
  PAQUETE_ALTO_MAX decimal(18,2) NOT NULL,
  PAQUETE_ANCHO_MAX decimal(18,2) NOT NULL,
  PAQUETE_LARGO_MAX decimal(18,2) NOT NULL,
  PAQUETE_PRECIO decimal(18,2) NOT NULL,
  PAQUETE_DESCRIPCION nvarchar(255) NOT NULL,
);
GO

CREATE TABLE StarTeam.Modelo_Camion (
  MODELO_CAMION_ID int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.Modelo (
  MODELO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_ID int FOREIGN KEY REFERENCES StarTeam.Modelo_Camion(MODELO_CAMION_ID) NOT NULL,
  MODELO_VELOCIDAD_MAX int NOT NULL,
  MODELO_CAPACIDAD_TANQUE int NOT NULL,
  MODELO_CAPACIDAD_CARGA int NOT NULL
);
GO
  
CREATE TABLE StarTeam.Marca (
  MARCA_ID int PRIMARY KEY IDENTITY(1,1),
  MARCA_DESCRIPCION nvarchar(255) NOT NULL
  );
GO

CREATE TABLE StarTeam.Camion (
  CAMION_NUMERO int PRIMARY KEY IDENTITY (1,1),
  CAMION_MODELO int FOREIGN KEY REFERENCES StarTeam.Modelo(MODELO_NUMERO) NOT NULL,
  CAMION_MARCA int FOREIGN KEY REFERENCES StarTeam.Marca(MARCA_ID) NOT NULL,
  CAMION_PATENTE nvarchar(255) NOT NULL,
  CAMION_NRO_CHASIS nvarchar(255) NOT NULL,
  CAMION_NRO_MOTOR nvarchar(255) NOT NULL,
  CAMION_FECHA_ALTA datetime2(3) NOT NULL
);
GO

CREATE TABLE StarTeam.Ciudad (
  CIUDAD_ID int PRIMARY KEY IDENTITY(1,1),
  CIUDAD_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.Recorrido (
  RECORRIDO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  RECORRIDO_CIUDAD_ORIGEN int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID) NOT NULL,
  RECORRIDO_CIUDAD_DESTINO int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID) NOT NULL,
  RECORRIDO_KM int NOT NULL,
  RECORRIDO_PRECIO decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.Viaje (
  VIAJE_NRO_VIAJE int PRIMARY KEY IDENTITY(1,1),
  VIAJE_CAMION_NUMERO int FOREIGN KEY REFERENCES StarTeam.Camion(CAMION_NUMERO),  -- aca le sacamos el NOT NULL porque al principio no tenemos registros
  VIAJE_RECORRIDO_NUMERO int FOREIGN KEY REFERENCES StarTeam.Recorrido(RECORRIDO_NUMERO), -- aca le sacamos el NOT NULL porque al principio no tenemos registros
  VIAJE_CHOFER_LEGAJO int FOREIGN KEY REFERENCES StarTeam.Chofer(CHOFER_NRO_LEGAJO), -- aca le sacamos el NOT NULL porque al principio no tenemos registros
  VIAJE_FECHA_INICIO datetime2(7) NOT NULL,
  VIAJE_FECHA_FIN datetime2(3) NOT NULL,
  VIAJE_CONSUMO_COMBUSTIBLE decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.Paquete_X_Viaje (
  PAQUETE_NRO_VIAJE int FOREIGN KEY REFERENCES StarTeam.Viaje(VIAJE_NRO_VIAJE) NOT NULL,
  PAQUETE_ID int FOREIGN KEY REFERENCES StarTeam.Paquete(PAQUETE_ID) NOT NULL,
  PAQUETE_CANTIDAD int,
  CONSTRAINT PK_Paquete_X_viaje PRIMARY KEY (PAQUETE_NRO_VIAJE, PAQUETE_ID)
);
GO

CREATE TABLE StarTeam.Taller (
  TALLER_NUMERO int PRIMARY KEY IDENTITY (1,1),
  TALLER_CIUDAD int FOREIGN KEY REFERENCES StarTeam.Ciudad(CIUDAD_ID) NOT NULL,
  TALLER_NOMBRE nvarchar(255) NOT NULL,
  TALLER_MAIL nvarchar(255) NOT NULL,
  TALLER_TELEFONO decimal(18) NOT NULL,
  TALLER_DIRECCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.Orden_Estado (
  ORDEN_ESTADO_ID int PRIMARY KEY IDENTITY(1,1),
  ORDEN_ESTADO_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.Orden_Trabajo (
  ORDEN_TRABAJO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  ORDEN_TRABAJO_CAMION int FOREIGN KEY REFERENCES StarTeam.Camion(CAMION_NUMERO) NOT NULL,
  ORDEN_TRABAJO_TALLER_NRO int FOREIGN KEY REFERENCES StarTeam.Taller(TALLER_NUMERO) NOT NULL,
  ORDEN_TRABAJO_ESTADO int FOREIGN KEY REFERENCES StarTeam.Orden_Estado(ORDEN_ESTADO_ID) NOT NULL,
  ORDEN_TRABAJO_FECHA nvarchar(255) NOT NULL
);
GO


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
GO


CREATE TABLE StarTeam.Tarea_Tipo (
  TAREA_TIPO_ID int PRIMARY KEY IDENTITY(1,1),
  TAREA_TIPO_DESCRIPCION nvarchar(255) NOT NULL
);
GO


CREATE TABLE StarTeam.Tarea (
  TAREA_CODIGO int PRIMARY KEY,
  TAREA_TIPO int FOREIGN KEY REFERENCES StarTeam.Tarea_Tipo(TAREA_TIPO_ID) NOT NULL,
  TAREA_DESCRIPCION nvarchar(255) NOT NULL,
  TAREA_TIEMPO_ESTIMADO int NOT NULL
);
GO

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
GO


CREATE TABLE StarTeam.Material (
  MATERIAL_CODIGO nvarchar(100) PRIMARY KEY,
  MATERIAL_DESCRIPCION nvarchar(255) NOT NULL,
  MATERIAL_PRECIO decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.Material_X_Tarea (
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.Tarea(TAREA_CODIGO) NOT NULL,
  MATERIAL_CODIGO nvarchar(100) FOREIGN KEY REFERENCES StarTeam.Material(MATERIAL_CODIGO) NOT NULL,
  MATERIAL_POR_TAREA_CANTIDAD int,
  CONSTRAINT PK_Material_Por_Tarea PRIMARY KEY (TAREA_CODIGO, MATERIAL_CODIGO)
);
GO


/*---------------------CREACION DE FUNCIONES-------------------------*/


CREATE FUNCTION StarTeam.Obtener_Modelo_Camion_ID (@MODELO_CAMION_DESCRIPCION NVARCHAR(255))
RETURNS int
AS
BEGIN
	DECLARE @MODELO_CAMION_ID as int

  SELECT @MODELO_CAMION_ID = MODELO_CAMION_ID FROM StarTeam.Modelo_Camion
  WHERE MODELO_CAMION_DESCRIPCION = @MODELO_CAMION_DESCRIPCION

  RETURN @MODELO_CAMION_ID

END
GO


CREATE FUNCTION StarTeam.Obtener_Modelo_ID (@MODELO_CAMION_DESCRIPCION NVARCHAR(255), @MODELO_VELOCIDAD_MAX int, @MODELO_CAPACIDAD_TANQUE int, @MODELO_CAPACIDAD_CARGA int)
RETURNS int
AS
BEGIN
	DECLARE @MODELO_CAMION_ID as int
  DECLARE @MODELO_ID as int

  SELECT @MODELO_CAMION_ID = StarTeam.Obtener_Camion_ID(@MODELO_CAMION_DESCRIPCION)

  SELECT @MODELO_ID = MODELO_NUMERO FROM StarTeam.Modelo
  WHERE  @MODELO_CAMION_ID = MODELO_CAMION_ID
  AND    @MODELO_VELOCIDAD_MAX = MODELO_VELOCIDAD_MAX
  AND    @MODELO_CAPACIDAD_TANQUE = MODELO_CAPACIDAD_TANQUE
  AND    @MODELO_CAPACIDAD_CARGA = MODELO_CAPACIDAD_CARGA

  RETURN @MODELO_ID
END
GO


CREATE FUNCTION StarTeam.Obtener_Marca_ID (@MARCA_DESCRIPCION NVARCHAR(255))
RETURNS int
AS
BEGIN
	DECLARE @MARCA_ID as int

  SELECT @MARCA_ID = MARCA_ID FROM StarTeam.Marca
  WHERE MARCA_DESCRIPCION = @MARCA_DESCRIPCION

  RETURN @MARCA_ID

END
GO

CREATE FUNCTION StarTeam.Obtener_Ciudad_ID (@CIUDAD_DESCRIPCION NVARCHAR(255))
RETURNS int
AS
BEGIN
	DECLARE @CIUDAD_ID as int

  SELECT @CIUDAD_ID = CIUDAD_ID FROM StarTeam.Ciudad
  WHERE CIUDAD_DESCRIPCION = @CIUDAD_DESCRIPCION

  RETURN @CIUDAD_ID

END
GO

CREATE FUNCTION StarTeam.Obtener_Recorrido_ID (@RECORRIDO_CIUDAD_ORIGEN int, @RECORRIDO_CIUDAD_ORIGEN int, @RECORRIDO_KM int, @RECORRIDO_PRECIO decimal(18,2))
RETURNS int
AS
BEGIN
	DECLARE @Recorrido_ID as int

  SELECT @Recorrido_ID = Recorrido_Numero FROM StarTeam.Recorrido
  WHERE Recorrido_DESCRIPCION = @Recorrido_DESCRIPCION

  RETURN @Recorrido_ID

END
GO


CREATE FUNCTION StarTeam.Obtener_Viaje_Recorrido_Numero (@CIUDAD_DESCRIPCION NVARCHAR(255), @RECORRIDO_KM int, @RECORRIDO_PRECIO decimal(18,2))
RETURNS int
AS
BEGIN
	DECLARE @RECORRIDO_CIUDAD_ORIGEN as int
  DECLARE @RECORRIDO_ORIGEN_ID as int
  DECLARE @RECORRIDO_DESTINO_ID as int

  SELECT @RECORRIDO_CIUDAD_ORIGEN = StarTeam.Obtener_Ciudad_ID(@CIUDAD_DESCRIPCION)

  SELECT @RECORRIDO_ORIGEN_ID = RECORRIDO_NUMERO FROM StarTeam.Recorrido
  WHERE  @CIUDAD_ORIGEN_ID = CIUDAD_ORIGEN_ID
  AND    @MODELO_VELOCIDAD_MAX = MODELO_VELOCIDAD_MAX
  AND    @MODELO_CAPACIDAD_TANQUE = MODELO_CAPACIDAD_TANQUE
  AND    @MODELO_CAPACIDAD_CARGA = MODELO_CAPACIDAD_CARGA

  RETURN @MODELO_ID
END
GO


CREATE FUNCTION StarTeam.Obtener_Tarea_Tipo_ID (@TAREA_TIPO_DESCRIPCION nvarchar(255))
RETURNS int
AS
BEGIN
	DECLARE @TAREA_TIPO_ID as int

  SELECT @TAREA_TIPO_ID = TAREA_TIPO_ID FROM StarTeam.Tarea_Tipo
  WHERE TAREA_TIPO_DESCRIPCION = @TAREA_TIPO_DESCRIPCION

  RETURN @TAREA_TIPO_ID

END
GO

CREATE FUNCTION StarTeam.Obtener_Camion_ID (@CAMION_PATENTE nvarchar(255))
RETURNS int
AS
BEGIN
	DECLARE @CAMION_ID as int

  SELECT @CAMION_ID = CAMION_NUMERO FROM StarTeam.Camion
  WHERE @CAMION_PATENTE = CAMION_PATENTE

  RETURN @CAMION_ID

END
GO


CREATE FUNCTION StarTeam.Obtener_Estado_ID(@ORDEN_ESTADO_DESCRIPCION nvarchar(255)) 
RETURN int 
AS
BEGIN 
  DECLARE @ORDEN_ESTADO_ID
  SELECT @ORDEN_ESTADO_ID = ORDEN_ESTADO_ID FROM StarTeam.ORDEN_ESTADO
  WHERE  @ORDEN_ESTADO_DESCRIPCION = ORDEN_ESTADO_DESCRIPCION
  RETURN @ORDEN_ESTADO_ID

END
GO 

CREATE FUNCTION StarTeam.Obtener_Taller_ID(@TALLER_CIUDAD NVARCHAR(255), @TALLER_NOMBRE NVARCHAR(255), @TALLER_MAIL NVARCHAR(255), @TALLER_TELEFONO DECIMAL(18,0), @TALLER_DIRECCION NVARCHAR(255))
RETURN int
AS
BEGIN 
  SELECT @ID_CIUDAD = StarTeam.Obtener_Ciudad_ID(@TALLER_CIUDAD)
  DECLARE @ORDEN_TRABAJO_TALLER_NRO as int

  SELECT @ORDEN_TRABAJO_TALLER_NRO = TALLER_NUMERO FROM StarTeam.Taller
  WHERE  @ID_CIUDAD = TALLER_CIUDAD
  AND    @TALLER_NOMBRE = TALLER_NOMBRE
  AND    @TALLER_MAIL = TALLER_MAIL
  AND    @TALLER_TELEFONO = TALLER_TELEFONO
  AND    @TALLER_DIRECCION = TALLER_DIRECCION
  RETURN @ORDEN_TRABAJO_TALLER_NRO
END 
GO 





/*-------------------CREACION DE PROCEDIMIENTOS----------------------*/

CREATE PROCEDURE STARTEAM.Migrar_Chofer
AS
BEGIN
INSERT INTO STARTEAM.CHOFER (CHOFER_NRO_LEGAJO, CHOFER_NOMBRE, CHOFER_APELLIDO, CHOFER_DNI, CHOFER_DIRECCION, CHOFER_TELEFONO,
  CHOFER_MAIL, CHOFER_FECHA_NAC, CHOFER_COSTO_HORA) SELECT DISTINCT
  CHOFER_NRO_LEGAJO
  CHOFER_NOMBRE,
  CHOFER_APELLIDO, 
  CHOFER_DNI, 
  CHOFER_DIRECCION,  
  CHOFER_TELEFONO, 
  CHOFER_MAIL, 
  CHOFER_FECHA_NAC, 
  CHOFER_COSTO_HORA FROM GD_ESQUEMA.MAESTRA
  WHERE CHOFER_NRO_LEGAJO IS NOT NULL 
END
GO


CREATE PROCEDURE STARTEAM.Migrar_Paquete
AS
BEGIN 
INSERT INTO STARTEAM.Paquete (PAQUETE_PESO_MAX, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX, PAQUETE_PRECIO, PAQUETE_DESCRIPCION)
SELECT DISTINCT 
PAQUETE_PESO_MAX,
PAQUETE_ALTO_MAX,
PAQUETE_ANCHO_MAX,
PAQUETE_LARGO_MAX,
PAQUETE_PRECIO, 
PAQUETE_DESCRIPCION
FROM GD_ESQUEMA.MAESTRA
WHERE PAQUETE_DESCRIPCION IS NOT NULL
END 
GO


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
          SELECT DISTINCT StarTeam.Obtener_Modelo_Camion_ID(MODELO_CAMION), MODELO_VELOCIDAD_MAX, MODELO_CAPACIDAD_TANQUE, MODELO_CAPACIDAD_CARGA
          FROM gd_esquema.Maestra
          WHERE MODELO_CAMION IS NOT NULL
	        ORDER BY MODELO_CAMION_ID ASC
END
GO


CREATE PROCEDURE StarTeam.Migrar_Marca
AS
BEGIN
  INSERT INTO StarTeam.Marca (MARCA_DESCRIPCION)
  SELECT DISTINCT MARCA_CAMION_MARCA FROM gd_esquema.Maestra
  WHERE MARCA_CAMION_MARCA IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Camion
AS
BEGIN
  INSERT INTO StarTeam.Camion (CAMION_MODELO, CAMION_MARCA, CAMION_PATENTE, CAMION_NRO_CHASIS, CAMION_NRO_MOTOR, CAMION_FECHA_ALTA)
  SELECT DISTINCT StarTeam.Obtener_Modelo_ID(MODELO_CAMION, MODELO_VELOCIDAD_MAX, MODELO_CAPACIDAD_TANQUE, MODELO_CAPACIDAD_CARGA), StarTeam.Obtener_Marca_ID(MARCA_CAMION_MARCA), CAMION_PATENTE, CAMION_NRO_CHASIS, CAMION_NRO_MOTOR, CAMION_FECHA_ALTA
  FROM gd_esquema.Maestra
  WHERE CAMION_PATENTE IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Ciudad
AS
BEGIN
  INSERT INTO StarTeam.Ciudad (CIUDAD_DESCRIPCION)
  (SELECT DISTINCT RECORRIDO_CIUDAD_ORIGEN FROM gd_esquema.Maestra WHERE RECORRIDO_CIUDAD_ORIGEN IS NOT NULL
  UNION SELECT DISTINCT RECORRIDO_CIUDAD_DESTINO FROM gd_esquema.Maestra WHERE RECORRIDO_CIUDAD_DESTINO IS NOT NULL
  UNION SELECT DISTINCT TALLER_CIUDAD FROM gd_esquema.Maestra WHERE TALLER_CIUDAD IS NOT NULL)
END
GO


CREATE PROCEDURE StarTeam.Migrar_Recorrido
AS
BEGIN
  INSERT INTO StarTeam.Recorrido (RECORRIDO_CIUDAD_ORIGEN, RECORRIDO_CIUDAD_DESTINO, RECORRIDO_KM, RECORRIDO_PRECIO)
  SELECT DISTINCT StarTeam.Obtener_Ciudad_ID(RECORRIDO_CIUDAD_ORIGEN), StarTeam.Obtener_Ciudad_ID(RECORRIDO_CIUDAD_DESTINO), RECORRIDO_KM, RECORRIDO_PRECIO
  FROM gd_esquema.Maestra
  WHERE  RECORRIDO_KM is not null 
END
GO


CREATE PROCEDURE StarTeam.Migrar_Viaje
AS
BEGIN
  INSERT INTO StarTeam.Viaje (VIAJE_CAMION_NUMERO, 
                              VIAJE_RECORRIDO_NUMERO, 
                              VIAJE_CHOFER_LEGAJO, 
                              VIAJE_FECHA_INICIO, 
                              VIAJE_FECHA_FIN, 
                              VIAJE_CONSUMO_COMBUSTIBLE)
          SELECT DISTINCT StarTeam.Obtener_Viaje_Camion_Numero(CAMION_NUMERO), 
                          StarTeam.Obtener_Viaje_Recorrido_Numero(RECORRIDO_NUMERO), 
                          StarTeam.Obtener_Viaje_Chofer_Legajo(CHOFER_NRO_LEGAJO),
                          VIAJE_FECHA_INICIO, 
                          VIAJE_FECHA_FIN, 
                          VIAJE_CONSUMO_COMBUSTIBLE
          FROM gd_esquema.Maestra
END
GO


CREATE PROCEDURE StarTeam.Migrar_Paquete_X_Viaje
AS
BEGIN
  -- TODO
END
GO


CREATE PROCEDURE StarTeam.Migrar_Taller
AS
BEGIN
  INSERT INTO StarTeam.Taller (TALLER_CIUDAD,
                               TALLER_NOMBRE,
                               TALLER_MAIL,
                               TALLER_TELEFONO,
                               TALLER_DIRECCION)
  SELECT DISTINCT StarTeam.Obtener_Ciudad_ID(TALLER_CIUDAD),
                  TALLER_NOMBRE,
                  TALLER_MAIL,
                  TALLER_TELEFONO,
                  TALLER_DIRECCION
  FROM gd_esquema.Maestra WHERE TALLER_CIUDAD IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Orden_Estado
AS
BEGIN
  INSERT INTO StarTeam.Orden_Estado (ORDEN_ESTADO_DESCRIPCION)
  SELECT DISTINCT ORDEN_ESTADO FROM gd_esquema.Maestra
  WHERE ORDEN_ESTADO IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Orden_Trabajo
AS
BEGIN
  INSERT INTO StarTeam.Orden_Trabajo (ORDEN_TRABAJO_CAMION,
                                      ORDEN_TRABAJO_TALLER_NRO,
                                      ORDEN_TRABAJO_ESTADO,
                                      ORDEN_TRABAJO_FECHA)
  SELECT DISTINCT StarTeam.Obtener_Camion_ID(CAMION_NUMERO),
                  StarTeam.Obtener_Taller_ID(TALLER_CIUDAD, TALLER_NOMBRE, TALLER_MAIL, TALLER_TELEFONO, TALLER_DIRECCION),
                  StarTeam.Obtener_Estado_ID(ORDEN_TRABAJO_ESTADO),
                  ORDEN_TRABAJO_FECHA
  FROM gd_esquema.Maestra 
  WHERE CAMION_NUMERO IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Mecanico
AS
BEGIN
  INSERT INTO StarTeam.Mecanico (MECANICO_NRO_LEGAJO, 
                                 MECANICO_NOMBRE, 
                                 MECANICO_APELLIDO, 
                                 MECANICO_DNI, 
                                 MECANICO_DIRECCION, 
                                 MECANICO_MAIL, 
                                 MECANICO_TELEFONO, 
                                 MECANICO_FECHA_NAC, 
                                 MECANICO_COSTO_HORA)
  SELECT DISTINCT MECANICO_NRO_LEGAJO, 
                  MECANICO_NOMBRE, 
                  MECANICO_APELLIDO, 
                  MECANICO_DNI, 
                  MECANICO_DIRECCION, 
                  MECANICO_MAIL, 
                  MECANICO_TELEFONO, 
                  MECANICO_FECHA_NAC, 
                  MECANICO_COSTO_HORA 
  FROM gd_esquema.Maestra
  WHERE MECANICO_NRO_LEGAJO IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Tarea_Tipo
AS
BEGIN
  INSERT INTO StarTeam.Tarea_Tipo(TAREA_TIPO_DESCRIPCION)
  SELECT DISTINCT TIPO_TAREA FROM gd_esquema.Maestra
  WHERE TIPO_TAREA IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Tarea
AS
BEGIN
 INSERT INTO StarTeam.Tarea (TAREA_CODIGO,
                             TAREA_TIPO,
                             TAREA_DESCRIPCION,
                             TAREA_TIEMPO_ESTIMADO)
 SELECT DISTINCT TAREA_CODIGO,
                 StarTeam.Obtener_Tarea_Tipo_ID(TIPO_TAREA),
                 TAREA_DESCRIPCION,
                 TAREA_TIEMPO_ESTIMADO
FROM gd_esquema.Maestra WHERE TIPO_TAREA IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Tarea_X_Orden_Trabajo
AS
BEGIN
  -- TODO
END
GO


CREATE PROCEDURE StarTeam.Migrar_Material
AS
BEGIN
  INSERT INTO StarTeam.Material (MATERIAL_CODIGO, MATERIAL_DESCRIPCION, MATERIAL_PRECIO) 
  SELECT DISTINCT MATERIAL_COD, MATERIAL_DESCRIPCION, MATERIAL_PRECIO FROM gd_esquema.Maestra WHERE MATERIAL_COD IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Material_X_Tarea
AS
BEGIN
  INSERT INTO StarTeam.Material_X_Tarea(TAREA_CODIGO, MATERIAL_CODIGO)
  SELECT DISTINCT TAREA_CODIGO, MATERIAL_COD FROM gd_esquema.Maestra WHERE TAREA_CODIGO IS NOT NULL
END
GO

CREATE TABLE StarTeam.Material_X_Tarea (
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.Tarea(TAREA_CODIGO) NOT NULL,
  MATERIAL_CODIGO int FOREIGN KEY REFERENCES StarTeam.Material(MATERIAL_CODIGO) NOT NULL,
  MATERIAL_POR_TAREA_CANTIDAD int NOT NULL,
  CONSTRAINT PK_Material_Por_Tarea PRIMARY KEY (TAREA_CODIGO, MATERIAL_CODIGO)
);
GO


/*------------------EJECUCION DE PROCEDIMIENTOS----------------------*/

EXEC StarTeam.Migrar_Chofer
EXEC StarTeam.Migrar_Paquete
EXEC StarTeam.Migrar_Modelo_Camion
EXEC StarTeam.Migrar_Modelo
EXEC StarTeam.Migrar_Marca
EXEC StarTeam.Migrar_Camion
EXEC StarTeam.Migrar_Ciudad
EXEC StarTeam.Migrar_Recorrido
EXEC StarTeam.Migrar_Viaje
EXEC StarTeam.Migrar_Paquete_X_Viaje
EXEC StarTeam.Migrar_Taller
EXEC StarTeam.Migrar_Orden_Estado
EXEC StarTeam.Migrar_Orden_Trabajo
EXEC StarTeam.Migrar_Mecanico
EXEC StarTeam.Migrar_Tarea_Tipo
EXEC StarTeam.Migrar_Tarea
EXEC StarTeam.Migrar_Tarea_X_Orden_Trabajo
EXEC StarTeam.Migrar_Material
EXEC StarTeam.Migrar_Material_Por_Tarea

/*

PK -> RELLENAR LA TABLA CON LO QUE ESTA EN LA TABLA MAESTRA -> PROCEDURE
FK -> RELLENAR Y VINCULAR CON LO QUE ESTA EN LA TABLA MAESTRA Y LAS TABLAS QUE YO CREE (BUSCAR QUE LOS ID EN CUESTION SEAN IGUALES) 
-> FUNCTION AND PROCEDURE

x - 1. Chofer - PK
x - 2. Paquete - PK
x - 3. Modelo Camio - PK 
x - 4. Modelo - PK/FK
x - 5. Marca - PK
x - 6. Camnion - FK
x - 7. Ciudad - PK -> // PUTO EL QUE LEE
x - 8. Recorrido - FK
9. Viaje -FK 
10. Paquete por viaje - FK
x - 11. Taller - FK
12. Orden trabajo - FK
x - 13. Orden Estado - PK
x - 14. Mecanico PK
x - 15. Tarea Tipo - PK
x - 16. Tarea FK
17. Tarea por roden de trabajo - FK
x - 18. Material PK
x - 19. Material por tarea FK
*/
