  USE GD2C2021
GO

/*-----------------------------------------BORRADO DE TABLAS------------------------------------------------*/

IF OBJECT_ID('StarTeam.BI_Tarea_X_Orden_Trabajo', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Tarea_X_Orden_Trabajo
GO

IF OBJECT_ID('StarTeam.BI_Tiempo', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Tiempo
GO

IF OBJECT_ID('StarTeam.BI_Rango_Edad', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Rango_Edad
GO

IF OBJECT_ID('StarTeam.BI_Mecanico', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Mecanico
GO

IF OBJECT_ID('StarTeam.BI_Orden_Trabajo', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Orden_Trabajo
GO

IF OBJECT_ID('StarTeam.BI_Orden_Estado', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Orden_Estado
GO

IF OBJECT_ID('StarTeam.BI_Taller', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Taller
GO

IF OBJECT_ID('StarTeam.BI_Paquete_X_Viaje', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Paquete_X_Viaje
GO

IF OBJECT_ID('StarTeam.BI_Viaje', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Viaje
GO

IF OBJECT_ID('StarTeam.BI_Recorrido', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Recorrido
GO

IF OBJECT_ID('StarTeam.BI_Ciudad', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Ciudad
GO

IF OBJECT_ID('StarTeam.BI_Camion', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Camion
GO

IF OBJECT_ID('StarTeam.BI_Marca', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Marca
GO


IF OBJECT_ID('StarTeam.BI_Modelo', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Modelo
GO

IF OBJECT_ID('StarTeam.BI_Modelo_Camion', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Modelo_Camion
GO

IF OBJECT_ID('StarTeam.BI_Paquete', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Paquete
GO


IF OBJECT_ID('StarTeam.BI_Chofer', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Chofer
GO

IF OBJECT_ID('StarTeam.BI_Material_X_Tarea', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Material_X_Tarea
GO

IF OBJECT_ID('StarTeam.BI_Material', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Material
GO

IF OBJECT_ID('StarTeam.BI_Tarea', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Tarea
GO

IF OBJECT_ID('StarTeam.BI_Tarea_Tipo', 'U') IS NOT NULL
  DROP TABLE StarTeam.BI_Tarea_Tipo
GO



/*------------------------BORRAR FUNCIONES---------------------------*/

IF OBJECT_ID('StarTeam.BI_Obtener_Rango_Edad') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Rango_Edad
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Cuatrimestre') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Cuatrimestre
GO

/*-----------------------------------------BORRADO DE PROCEDURES--------------------------------------------*/

IF OBJECT_ID('StarTeam.BI_Migrar_Chofer') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Chofer

IF OBJECT_ID('StarTeam.BI_Migrar_Paquete') IS NOT NULL
	DROP PROCEDURE StarTeam.BI_Migrar_Paquete

IF OBJECT_ID('StarTeam.BI_Migrar_Modelo_Camion') IS NOT NULL
	DROP PROCEDURE StarTeam.BI_Migrar_Modelo_Camion

IF OBJECT_ID('StarTeam.BI_Migrar_Modelo') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Modelo

IF OBJECT_ID('StarTeam.BI_Migrar_Marca') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Marca

IF OBJECT_ID('StarTeam.BI_Migrar_Camion') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Camion

IF OBJECT_ID('StarTeam.BI_Migrar_Ciudad') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Ciudad

IF OBJECT_ID('StarTeam.BI_Migrar_Recorrido') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Recorrido

IF OBJECT_ID('StarTeam.BI_Migrar_Viaje') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Viaje

IF OBJECT_ID('StarTeam.BI_Migrar_Paquete_X_Viaje') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Paquete_X_Viaje

IF OBJECT_ID('StarTeam.BI_Migrar_Taller') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Taller

IF OBJECT_ID('StarTeam.BI_Migrar_Orden_Trabajo') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Orden_Trabajo

IF OBJECT_ID('StarTeam.BI_Migrar_Orden_Estado') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Orden_Estado

IF OBJECT_ID('StarTeam.BI_Migrar_Mecanico') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Mecanico

IF OBJECT_ID('StarTeam.BI_Migrar_Tarea_Tipo') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Tarea_Tipo

IF OBJECT_ID('StarTeam.BI_Migrar_Tarea') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Tarea

IF OBJECT_ID('StarTeam.BI_Migrar_Tarea_X_Orden_Trabajo') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Tarea_X_Orden_Trabajo

IF OBJECT_ID('StarTeam.BI_Migrar_Material') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Material

IF OBJECT_ID('StarTeam.BI_Migrar_Material_X_Tarea') IS NOT NULL
  DROP PROCEDURE StarTeam.BI_Migrar_Material_X_Tarea


/*-----------------------------------------CREACION DE TABLAS-----------------------------------------------*/

CREATE TABLE StarTeam.BI_Rango_Edad (
  BI_RANGO_EDAD_ID int PRIMARY KEY IDENTITY (1,1),
  BI_RANGO_EDAD_MIN int,
  BI_RANGO_EDAD_MAX int,
  BI_RANGO_EDAD_DESCRIPCION nvarchar(15)
);

CREATE TABLE StarTeam.BI_Tiempo (
  BI_TIEMPO_ID int PRIMARY KEY IDENTITY (1,1),
  BI_TIEMPO_ANIO decimal(18,0) NOT NULL,
  BI_TIEMPO_CUATRIMESTRE decimal(18,0) NOT NULL
);

CREATE TABLE StarTeam.BI_Chofer (
  BI_CHOFER_NRO_LEGAJO int PRIMARY KEY,
  BI_CHOFER_NOMBRE nvarchar(255) NOT NULL,
  BI_CHOFER_APELLIDO nvarchar(255) NOT NULL,
  BI_CHOFER_DNI decimal(18,0) NOT NULL,
  BI_CHOFER_DIRECCION nvarchar(255) NOT NULL,
  BI_CHOFER_TELEFONO int NOT NULL,
  BI_CHOFER_MAIL nvarchar(255) NOT NULL,
  BI_CHOFER_FECHA_NAC datetime2(3) NOT NULL,
  BI_CHOFER_RANGO_EDAD int FOREIGN KEY REFERENCES StarTeam.BI_Rango_Edad(BI_RANGO_EDAD_ID) NOT NULL,
  BI_CHOFER_COSTO_HORA int NOT NULL,
);
GO

CREATE TABLE StarTeam.BI_Paquete (
  BI_PAQUETE_ID int PRIMARY KEY IDENTITY(1,1),
  BI_PAQUETE_PESO_MAX decimal(18,2) NOT NULL,
  BI_PAQUETE_ALTO_MAX decimal(18,2) NOT NULL,
  BI_PAQUETE_ANCHO_MAX decimal(18,2) NOT NULL,
  BI_PAQUETE_LARGO_MAX decimal(18,2) NOT NULL,
  BI_PAQUETE_PRECIO decimal(18,2) NOT NULL,
  BI_PAQUETE_DESCRIPCION nvarchar(255) NOT NULL,
);
GO

CREATE TABLE StarTeam.BI_Modelo_Camion (
  BI_MODELO_CAMION_ID int PRIMARY KEY IDENTITY(1,1),
  BI_MODELO_CAMION_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Modelo (
 BI_MODELO_NUMERO int PRIMARY KEY IDENTITY(1,1),
 BI_MODELO_CAMION_ID int FOREIGN KEY REFERENCES StarTeam.BI_Modelo_Camion(BI_MODELO_CAMION_ID) NOT NULL,
 BI_MODELO_VELOCIDAD_MAX int NOT NULL,
 BI_MODELO_CAPACIDAD_TANQUE int NOT NULL,
 BI_MODELO_CAPACIDAD_CARGA int NOT NULL
);
GO
  
CREATE TABLE StarTeam.BI_Marca (
  BI_MARCA_ID int PRIMARY KEY IDENTITY(1,1),
  BI_MARCA_DESCRIPCION nvarchar(255) NOT NULL
  );
GO

CREATE TABLE StarTeam.BI_Camion (
  BI_CAMION_NUMERO int PRIMARY KEY IDENTITY (1,1),
  BI_CAMION_MODELO int FOREIGN KEY REFERENCES StarTeam.BI_Modelo(BI_MODELO_NUMERO) NOT NULL,
  BI_CAMION_MARCA int FOREIGN KEY REFERENCES StarTeam.BI_Marca(BI_MARCA_ID) NOT NULL,
  BI_CAMION_PATENTE nvarchar(255) NOT NULL,
  BI_CAMION_NRO_CHASIS nvarchar(255) NOT NULL,
  BI_CAMION_NRO_MOTOR nvarchar(255) NOT NULL,
  BI_CAMION_FECHA_ALTA datetime2(3) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Ciudad (
  BI_CIUDAD_ID int PRIMARY KEY IDENTITY(1,1),
  BI_CIUDAD_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Recorrido (
  BI_RECORRIDO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  BI_RECORRIDO_CIUDAD_ORIGEN int FOREIGN KEY REFERENCES StarTeam.BI_Ciudad(BI_CIUDAD_ID) NOT NULL,
  BI_RECORRIDO_CIUDAD_DESTINO int FOREIGN KEY REFERENCES StarTeam.BI_Ciudad(BI_CIUDAD_ID) NOT NULL,
  BI_RECORRIDO_KM int NOT NULL,
  BI_RECORRIDO_PRECIO decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Viaje (
  BI_VIAJE_NRO_VIAJE int PRIMARY KEY IDENTITY(1,1),
  BI_VIAJE_CAMION_NUMERO int FOREIGN KEY REFERENCES StarTeam.BI_Camion(BI_CAMION_NUMERO) NOT NULL,
  BI_VIAJE_RECORRIDO_NUMERO int FOREIGN KEY REFERENCES StarTeam.BI_Recorrido(BI_RECORRIDO_NUMERO) NOT NULL,
  BI_VIAJE_CHOFER_LEGAJO int FOREIGN KEY REFERENCES StarTeam.BI_Chofer(BI_CHOFER_NRO_LEGAJO) NOT NULL,
  BI_VIAJE_FECHA_INICIO datetime2(7) NOT NULL,
  BI_VIAJE_FECHA_FIN datetime2(3), --Se completa una vez terminado el viaje, puede estar null hasta entonces
  BI_VIAJE_CONSUMO_COMBUSTIBLE decimal(18,2) --Se completa una vez terminado el viaje, puede estar null hasta entonces
);
GO

CREATE TABLE StarTeam.BI_Paquete_X_Viaje (
  BI_PAQUETE_NRO_VIAJE int FOREIGN KEY REFERENCES StarTeam.BI_Viaje(VIAJE_NRO_VIAJE) NOT NULL,
  BI_PAQUETE_ID int FOREIGN KEY REFERENCES StarTeam.BI_Paquete(PAQUETE_ID) NOT NULL,
  BI_PAQUETE_CANTIDAD int,
  CONSTRAINT PK_BI_Paquete_X_viaje PRIMARY KEY (BI_PAQUETE_NRO_VIAJE, BI_PAQUETE_ID, BI_PAQUETE_CANTIDAD)
);
GO

CREATE TABLE StarTeam.BI_Taller (
  BI_TALLER_NUMERO int PRIMARY KEY IDENTITY (1,1),
  BI_TALLER_CIUDAD int FOREIGN KEY REFERENCES StarTeam.BI_Ciudad(BI_CIUDAD_ID) NOT NULL,
  BI_TALLER_NOMBRE nvarchar(255) NOT NULL,
  BI_TALLER_MAIL nvarchar(255) NOT NULL,
  BI_TALLER_TELEFONO decimal(18) NOT NULL,
  BI_TALLER_DIRECCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Orden_Estado (
  BI_ORDEN_ESTADO_ID int PRIMARY KEY IDENTITY(1,1),
  BI_ORDEN_ESTADO_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Orden_Trabajo (
  BI_ORDEN_TRABAJO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  BI_ORDEN_TRABAJO_CAMION int FOREIGN KEY REFERENCES StarTeam.BI_Camion(BI_CAMION_NUMERO) NOT NULL,
  BI_ORDEN_TRABAJO_TALLER_NRO int FOREIGN KEY REFERENCES StarTeam.BI_Taller(BI_TALLER_NUMERO) NOT NULL,
  BI_ORDEN_TRABAJO_ESTADO int FOREIGN KEY REFERENCES StarTeam.BI_Orden_Estado(BI_ORDEN_ESTADO_ID) NOT NULL,
  BI_ORDEN_TRABAJO_FECHA nvarchar(255) NOT NULL
);
GO


CREATE TABLE StarTeam.BI_Mecanico (
  BI_MECANICO_NRO_LEGAJO int PRIMARY KEY,
  BI_MECANICO_NOMBRE nvarchar(255) NOT NULL,
  BI_MECANICO_APELLIDO nvarchar(255) NOT NULL,
  BI_MECANICO_DNI decimal(18) NOT NULL,
  BI_MECANICO_DIRECCION nvarchar(255) NOT NULL,
  BI_MECANICO_MAIL nvarchar(255) NOT NULL,
  BI_MECANICO_TELEFONO int NOT NULL,
  BI_MECANICO_FECHA_NAC datetime2(3) NOT NULL,
  BI_MECANICO_RANGO_EDAD int FOREIGN KEY REFERENCES StarTeam.BI_Rango_Edad(BI_RANGO_EDAD_ID) NOT NULL,
  BI_MECANICO_COSTO_HORA int NOT NULL
);
GO


CREATE TABLE StarTeam.BI_Tarea_Tipo (
  BI_TAREA_TIPO_ID int PRIMARY KEY IDENTITY(1,1),
  BI_TAREA_TIPO_DESCRIPCION nvarchar(255) NOT NULL
);
GO


CREATE TABLE StarTeam.BI_Tarea (
  BI_TAREA_CODIGO int PRIMARY KEY,
  BI_TAREA_TIPO int FOREIGN KEY REFERENCES StarTeam.BI_Tarea_Tipo(BI_TAREA_TIPO_ID) NOT NULL,
  BI_TAREA_DESCRIPCION nvarchar(255) NOT NULL,
  BI_TAREA_TIEMPO_ESTIMADO int NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Tarea_X_Orden_Trabajo (
  BI_TAREA_ORDEN_TRABAJO int  FOREIGN KEY REFERENCES StarTeam.BI_Orden_Trabajo(ORDEN_TRABAJO_NUMERO) NOT NULL,
  BI_TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.BI_Tarea(BI_TAREA_CODIGO) NOT NULL,
  BI_TAREA_MECANICO int FOREIGN KEY REFERENCES StarTeam.BI_Mecanico(MECANICO_NRO_LEGAJO) NOT NULL,
  BI_TAREA_FECHA_INICIO_PLANIFICADO datetime2(3) NOT NULL,
  BI_TAREA_FECHA_INICIO datetime2(3),
  BI_TAREA_FECHA_FIN datetime2(3),
  BI_TAREA_TIEMPO_EJECUTADO decimal(18,2),
  CONSTRAINT PK_BI_Tarea_X_Orden_Trabajo PRIMARY KEY (BI_TAREA_ORDEN_TRABAJO, BI_TAREA_CODIGO, BI_TAREA_MECANICO)
);
GO


CREATE TABLE StarTeam.BI_Material (
  BI_MATERIAL_CODIGO nvarchar(100) PRIMARY KEY,
  BI_MATERIAL_DESCRIPCION nvarchar(255) NOT NULL,
  BI_MATERIAL_PRECIO decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Material_X_Tarea (
  BI_TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.BI_Tarea(BI_TAREA_CODIGO) NOT NULL,
  BI_MATERIAL_CODIGO nvarchar(100) FOREIGN KEY REFERENCES StarTeam.BI_Material(BI_MATERIAL_CODIGO) NOT NULL,
  BI_MATERIAL_POR_TAREA_CANTIDAD int,
  CONSTRAINT PK_BI_Material_Por_Tarea PRIMARY KEY (BI_TAREA_CODIGO, BI_MATERIAL_CODIGO)
);
GO




/*-----------------------------------------CREACIÓN DE FUNCIONES--------------------------------------------*/


CREATE FUNCTION StarTeam.BI_Obtener_Rango_Edad(@FECHA_NACIMIENTO datetime2(3))
RETURNS int
AS
BEGIN
DECLARE @RANGO_EDAD_ID as int
DECLARE @EDAD as int
DECLARE @FECHA_ACTUAL as datetime2(3)

  SET @EDAD = DATEDIFF(year, @FECHA_NACIMIENTO, GETDATE()) 

  SELECT @RANGO_EDAD_ID = RANGO_EDAD_ID FROM StarTeam.BI_Rango_Edad
  WHERE @EDAD BETWEEN BI_RANGO_EDAD_MIN AND BI_RANGO_EDAD_MAX

  RETURN @RANGO_EDAD_ID

END
GO

CREATE FUNCTION StarTeam.BI_Obtener_Cuatrimestre (@FECHA DATETIME2(3))
RETURNS DECIMAL(18,0)
BEGIN

	DECLARE @CUATRIMESTRE DECIMAL(18,0)

	IF (MONTH(@FECHA) BETWEEN 1 AND 3)
		SET @CUATRIMESTRE = 1
	ELSE IF (MONTH(@FECHA) BETWEEN 4 AND 6)
		SET @CUATRIMESTRE = 2
	ELSE IF (MONTH(@FECHA) BETWEEN 7 AND 10)
		SET @CUATRIMESTRE = 3
	ELSE
		SET @CUATRIMESTRE = 4

	RETURN @CUATRIMESTRE
END
GO

/*-----------------------------------------CREACION DE PROCEDURES--------------------------------------------*/

CREATE PROCEDURE StarTeam.BI_Migrar_Rango_Edad
AS
BEGIN
  INSERT INTO StarTeam.BI_Rango_Edad(BI_RANGO_EDAD_MIN, BI_RANGO_EDAD_MAX, BI_RANGO_EDAD_DESCRIPCION) VALUES (18, 30, '18 - 30 años')
  INSERT INTO StarTeam.BI_Rango_Edad(BI_RANGO_EDAD_MIN, BI_RANGO_EDAD_MAX, BI_RANGO_EDAD_DESCRIPCION) VALUES (31, 50, '31 - 50 años')
  INSERT INTO StarTeam.BI_Rango_Edad(BI_RANGO_EDAD_MIN, BI_RANGO_EDAD_MAX, BI_RANGO_EDAD_DESCRIPCION) VALUES (51, null, '> 50 años')
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Tiempo
AS
BEGIN
INSERT INTO 
FROM
END
GO



CREATE PROCEDURE STARTEAM.BI_Migrar_Chofer
AS
BEGIN
  INSERT INTO StarTeam.BI_Chofer (BI_CHOFER_NRO_LEGAJO, 
                               BI_CHOFER_NOMBRE, 
                               BI_CHOFER_APELLIDO, 
                               BI_CHOFER_DNI, 
                               BI_CHOFER_DIRECCION, 
                               BI_CHOFER_TELEFONO,
                               BI_CHOFER_MAIL, 
                               BI_CHOFER_FECHA_NAC, 
                               BI_CHOFER_COSTO_HORA, 
                               BI_CHOFER_RANGO_EDAD) 
  SELECT          CHOFER_NRO_LEGAJO,
                  CHOFER_NOMBRE,
                  CHOFER_APELLIDO, 
                  CHOFER_DNI, 
                  CHOFER_DIRECCION,  
                  CHOFER_TELEFONO, 
                  CHOFER_MAIL, 
                  CHOFER_FECHA_NAC, 
                  CHOFER_COSTO_HORA,
                  StarTeam.BI_Obtener_Rango_Edad(CHOFER_FECHA_NAC)
  FROM StarTeam.Chofer
END
GO


CREATE PROCEDURE STARTEAM.BI_Migrar_Paquete
AS
BEGIN
  INSERT INTO StarTeam.BI_Paquete
  SELECT * FROM StarTeam.Paquete
END 
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Modelo_Camion
AS
BEGIN
  INSERT INTO StarTeam.BI_Modelo_Camion
  SELECT * FROM StarTeam.Modelo_Camion
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Modelo
AS
BEGIN
  INSERT INTO StarTeam.BI_Modelo
  SELECT * FROM StarTeam.Modelo
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Marca
AS
BEGIN
  INSERT INTO StarTeam.BI_Ciudad
  SELECT * FROM StarTeam.Marca
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Camion
AS
BEGIN
  INSERT INTO StarTeam.BI_Camion
  SELECT * FROM StarTearm.Camion
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Ciudad
AS
BEGIN
  INSERT INTO StarTeam.BI_Ciudad
  SELECT * FROM StarTeam.Ciudad
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Recorrido
AS
BEGIN
  INSERT INTO StarTeam.BI_Recorrido 
  SELECT * FROM StarTeam.Recorrido
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Viaje
AS
BEGIN
  --TODO: FIjarse que capaz haya que actualizarle algun campo mas
    INSERT INTO StarTeam.BI_Viaje
    SELECT * FROM StarTeam.Viaje
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Paquete_X_Viaje
AS
BEGIN
  INSERT INTO StarTeam.BI_Paquete_X_Viaje
  SELECT * FROM StarTeam.Paquete_X_Viaje
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Taller
AS
BEGIN
  INSERT INTO StarTeam.BI_Taller
  SELECT * FROM StarTeam.Taller
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Orden_Estado
AS
BEGIN
  INSERT INTO StarTeam.BI_Orden_Estado 
  SELECT * FROM StarTeam.Orden_Estado
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Orden_Trabajo
AS
BEGIN

    INSERT INTO StarTeam.BI_Orden_Trabajo
    SELECT * FROM StarTeam.Orden_Trabajo
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Mecanico
AS
BEGIN
 INSERT INTO StarTeam.BI_Mecanico (BI_MECANICO_NRO_LEGAJO, 
                                 BI_MECANICO_NOMBRE, 
                                 BI_MECANICO_APELLIDO, 
                                 BI_MECANICO_DNI, 
                                 BI_MECANICO_DIRECCION, 
                                 BI_MECANICO_MAIL, 
                                 BI_MECANICO_TELEFONO, 
                                 BI_MECANICO_FECHA_NAC, 
                                 BI_MECANICO_RANGO_EDAD,
                                 BI_MECANICO_COSTO_HORA)
  SELECT DISTINCT MECANICO_NRO_LEGAJO, 
                  MECANICO_NOMBRE, 
                  MECANICO_APELLIDO, 
                  MECANICO_DNI, 
                  MECANICO_DIRECCION, 
                  MECANICO_MAIL, 
                  MECANICO_TELEFONO, 
                  MECANICO_FECHA_NAC,
                  StarTeam.BI_Obtener_Rango_Edad(MECANICO_FECHA_NAC),
                  MECANICO_COSTO_HORA 
  FROM StarTeam.Mecanico
END
GO



CREATE PROCEDURE StarTeam.BI_Migrar_Tarea_Tipo
AS
BEGIN
  INSERT INTO StarTeam.BI_Tarea_Tipo
    SELECT * FROM StarTeam.Tarea_Tipo
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Tarea
AS
BEGIN
 INSERT INTO StarTeam.BI_Tarea 
 SELECT * FROM StarTeam.Tarea
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Tarea_X_Orden_Trabajo
AS
BEGIN
 
  INSERT INTO StarTeam.BI_Tarea_X_Orden_Trabajo
  SELECT * FROM StarTeam.Tarea_X_Orden_Trabajo

END
GO

CREATE PROCEDURE StarTeam.BI_Migrar_Material
AS
BEGIN
  INSERT INTO StarTeam.BI_Material 
  SELECT * FROM StarTeam.Material 

END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Material_X_Tarea
AS
BEGIN
  INSERT INTO StarTeam.BI_Material_X_Tarea
  SELECT * FROM StarTeam.Material_X_Tarea
END
GO


/*-----------------------------------------EJECUCION DE PROCEDURES------------------------------------------*/
