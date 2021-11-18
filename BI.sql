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
IF OBJECT_ID('StarTeam.BI_Obtener_Paquete_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Paquete_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Modelo_Camion_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Modelo_Camion_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Modelo_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Modelo_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Marca_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Marca_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Ciudad_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Ciudad_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Recorrido_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Recorrido_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Viaje_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Viaje_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Chofer_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Chofer_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Tarea_Tipo_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Tarea_Tipo_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Camion_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Camion_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Estado_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Estado_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Mecanico_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Mecanico_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Tarea_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Tarea_ID
GO

IF OBJECT_ID('StarTeam.BI_Obtener_Orden_Trabajo_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Orden_Trabajo_ID
GO 

IF OBJECT_ID('StarTeam.BI_Obtener_Taller_ID') IS NOT NULL
	DROP FUNCTION StarTeam.BI_Obtener_Taller_ID
GO


/*---------------------BORRAR PROCEDIMIENTOS-------------------------*/

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

/*-----------------------------------------BORRADO DE PROCEDURES--------------------------------------------*/


/*-----------------------------------------CREACION DE TABLAS-----------------------------------------------*/

CREATE TABLE StarTeam.BI_Rango_Edad (
RANGO_EDAD_ID int PRIMARY KEY IDENTITY (1,1),
RANGO_EDAD_MIN int,
RANGO_EDAD_MAX int,
RANGO_EDAD_DESCRIPCION nvarchar(15)
);

CREATE TABLE StarTeam.BI_Tiempo (

);

CREATE TABLE StarTeam.BI_Chofer (
  CHOFER_NRO_LEGAJO int PRIMARY KEY,
  CHOFER_NOMBRE nvarchar(255) NOT NULL,
  CHOFER_APELLIDO nvarchar(255) NOT NULL,
  CHOFER_DNI decimal(18,0) NOT NULL,
  CHOFER_DIRECCION nvarchar(255) NOT NULL,
  CHOFER_TELEFONO int NOT NULL,
  CHOFER_MAIL nvarchar(255) NOT NULL,
  CHOFER_FECHA_NAC datetime2(3) NOT NULL,
  CHOFER_COSTO_HORA int NOT NULL,
  CHOFER_RANGO_EDAD int FOREIGN KEY REFERENCES StarTeam.BI_Rango_Edad(RANGO_EDAD_ID) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Paquete (
  PAQUETE_ID int PRIMARY KEY IDENTITY(1,1),
  PAQUETE_PESO_MAX decimal(18,2) NOT NULL,
  PAQUETE_ALTO_MAX decimal(18,2) NOT NULL,
  PAQUETE_ANCHO_MAX decimal(18,2) NOT NULL,
  PAQUETE_LARGO_MAX decimal(18,2) NOT NULL,
  PAQUETE_PRECIO decimal(18,2) NOT NULL,
  PAQUETE_DESCRIPCION nvarchar(255) NOT NULL,
);
GO

CREATE TABLE StarTeam.BI_Modelo_Camion (
  MODELO_CAMION_ID int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Modelo (
  MODELO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  MODELO_CAMION_ID int FOREIGN KEY REFERENCES StarTeam.BI_Modelo_Camion(MODELO_CAMION_ID) NOT NULL,
  MODELO_VELOCIDAD_MAX int NOT NULL,
  MODELO_CAPACIDAD_TANQUE int NOT NULL,
  MODELO_CAPACIDAD_CARGA int NOT NULL
);
GO
  
CREATE TABLE StarTeam.BI_Marca (
  MARCA_ID int PRIMARY KEY IDENTITY(1,1),
  MARCA_DESCRIPCION nvarchar(255) NOT NULL
  );
GO

CREATE TABLE StarTeam.BI_Camion (
  CAMION_NUMERO int PRIMARY KEY IDENTITY (1,1),
  CAMION_MODELO int FOREIGN KEY REFERENCES StarTeam.BI_Modelo(MODELO_NUMERO) NOT NULL,
  CAMION_MARCA int FOREIGN KEY REFERENCES StarTeam.BI_Marca(MARCA_ID) NOT NULL,
  CAMION_PATENTE nvarchar(255) NOT NULL,
  CAMION_NRO_CHASIS nvarchar(255) NOT NULL,
  CAMION_NRO_MOTOR nvarchar(255) NOT NULL,
  CAMION_FECHA_ALTA datetime2(3) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Ciudad (
  CIUDAD_ID int PRIMARY KEY IDENTITY(1,1),
  CIUDAD_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Recorrido (
  RECORRIDO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  RECORRIDO_CIUDAD_ORIGEN int FOREIGN KEY REFERENCES StarTeam.BI_Ciudad(CIUDAD_ID) NOT NULL,
  RECORRIDO_CIUDAD_DESTINO int FOREIGN KEY REFERENCES StarTeam.BI_Ciudad(CIUDAD_ID) NOT NULL,
  RECORRIDO_KM int NOT NULL,
  RECORRIDO_PRECIO decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Viaje (
  VIAJE_NRO_VIAJE int PRIMARY KEY IDENTITY(1,1),
  VIAJE_CAMION_NUMERO int FOREIGN KEY REFERENCES StarTeam.BI_Camion(CAMION_NUMERO) NOT NULL,
  VIAJE_RECORRIDO_NUMERO int FOREIGN KEY REFERENCES StarTeam.BI_Recorrido(RECORRIDO_NUMERO) NOT NULL,
  VIAJE_CHOFER_LEGAJO int FOREIGN KEY REFERENCES StarTeam.BI_Chofer(CHOFER_NRO_LEGAJO) NOT NULL,
  VIAJE_FECHA_INICIO datetime2(7) NOT NULL,
  VIAJE_FECHA_FIN datetime2(3), --Se completa una vez terminado el viaje, puede estar null hasta entonces
  VIAJE_CONSUMO_COMBUSTIBLE decimal(18,2) --Se completa una vez terminado el viaje, puede estar null hasta entonces
);
GO

CREATE TABLE StarTeam.BI_Paquete_X_Viaje (
  PAQUETE_NRO_VIAJE int FOREIGN KEY REFERENCES StarTeam.BI_Viaje(VIAJE_NRO_VIAJE) NOT NULL,
  PAQUETE_ID int FOREIGN KEY REFERENCES StarTeam.BI_Paquete(PAQUETE_ID) NOT NULL,
  PAQUETE_CANTIDAD int,
  CONSTRAINT PK_Paquete_X_viaje PRIMARY KEY (PAQUETE_NRO_VIAJE, PAQUETE_ID, PAQUETE_CANTIDAD)
);
GO

CREATE TABLE StarTeam.BI_Taller (
  TALLER_NUMERO int PRIMARY KEY IDENTITY (1,1),
  TALLER_CIUDAD int FOREIGN KEY REFERENCES StarTeam.BI_Ciudad(CIUDAD_ID) NOT NULL,
  TALLER_NOMBRE nvarchar(255) NOT NULL,
  TALLER_MAIL nvarchar(255) NOT NULL,
  TALLER_TELEFONO decimal(18) NOT NULL,
  TALLER_DIRECCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Orden_Estado (
  ORDEN_ESTADO_ID int PRIMARY KEY IDENTITY(1,1),
  ORDEN_ESTADO_DESCRIPCION nvarchar(255) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Orden_Trabajo (
  ORDEN_TRABAJO_NUMERO int PRIMARY KEY IDENTITY(1,1),
  ORDEN_TRABAJO_CAMION int FOREIGN KEY REFERENCES StarTeam.BI_Camion(CAMION_NUMERO) NOT NULL,
  ORDEN_TRABAJO_TALLER_NRO int FOREIGN KEY REFERENCES StarTeam.BI_Taller(TALLER_NUMERO) NOT NULL,
  ORDEN_TRABAJO_ESTADO int FOREIGN KEY REFERENCES StarTeam.BI_Orden_Estado(ORDEN_ESTADO_ID) NOT NULL,
  ORDEN_TRABAJO_FECHA nvarchar(255) NOT NULL
);
GO


CREATE TABLE StarTeam.BI_Mecanico (
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


CREATE TABLE StarTeam.BI_Tarea_Tipo (
  TAREA_TIPO_ID int PRIMARY KEY IDENTITY(1,1),
  TAREA_TIPO_DESCRIPCION nvarchar(255) NOT NULL
);
GO


CREATE TABLE StarTeam.BI_Tarea (
  TAREA_CODIGO int PRIMARY KEY,
  TAREA_TIPO int FOREIGN KEY REFERENCES StarTeam.BI_Tarea_Tipo(TAREA_TIPO_ID) NOT NULL,
  TAREA_DESCRIPCION nvarchar(255) NOT NULL,
  TAREA_TIEMPO_ESTIMADO int NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Tarea_X_Orden_Trabajo (
  TAREA_ORDEN_TRABAJO int  FOREIGN KEY REFERENCES StarTeam.BI_Orden_Trabajo(ORDEN_TRABAJO_NUMERO) NOT NULL,
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.BI_Tarea(TAREA_CODIGO) NOT NULL,
  TAREA_MECANICO int FOREIGN KEY REFERENCES StarTeam.BI_Mecanico(MECANICO_NRO_LEGAJO) NOT NULL,
  TAREA_FECHA_INICIO_PLANIFICADO datetime2(3) NOT NULL,
  TAREA_FECHA_INICIO datetime2(3),
  TAREA_FECHA_FIN datetime2(3),
  TAREA_TIEMPO_EJECUTADO decimal(18,2),
  CONSTRAINT PK_Tarea_X_Orden_Trabajo PRIMARY KEY (TAREA_ORDEN_TRABAJO, TAREA_CODIGO, TAREA_MECANICO)
);
GO


CREATE TABLE StarTeam.BI_Material (
  MATERIAL_CODIGO nvarchar(100) PRIMARY KEY,
  MATERIAL_DESCRIPCION nvarchar(255) NOT NULL,
  MATERIAL_PRECIO decimal(18,2) NOT NULL
);
GO

CREATE TABLE StarTeam.BI_Material_X_Tarea (
  TAREA_CODIGO int FOREIGN KEY REFERENCES StarTeam.BI_Tarea(TAREA_CODIGO) NOT NULL,
  MATERIAL_CODIGO nvarchar(100) FOREIGN KEY REFERENCES StarTeam.BI_Material(MATERIAL_CODIGO) NOT NULL,
  MATERIAL_POR_TAREA_CANTIDAD int,
  CONSTRAINT PK_Material_Por_Tarea PRIMARY KEY (TAREA_CODIGO, MATERIAL_CODIGO)
);
GO


/*-----------------------------------------BORRADO DE FUNCIONES---------------------------------------------*/

/*-----------------------------------------CREACIÓN DE FUNCIONES--------------------------------------------*/

-- Deberíamos crear una funcion para obtener la edad y pasarle la edad a esta funcion , o recibir la echa de nacimiento y hacer todo dentro de esta?

CREATE FUNCTION StarTeam.Obtener_Rango_Edad(@FECHA_NACIMIENTO datetime2(3))
RETURNS int
AS
BEGIN
DECLARE @RANGO_EDAD_ID as int
DECLARE @EDAD as int

  SET @EDAD = 

  SELECT @RANGO_EDAD_ID = RANGO_EDAD_ID FROM StarTeam.BI_Rango_Edad
  WHERE MODELO_CAMION_DESCRIPCION = @MODELO_CAMION_DESCRIPCION

  RETURN @MODELO_CAMION_ID

END
GO

/*-----------------------------------------CREACION DE PROCEDURES--------------------------------------------*/

CREATE PROCEDURE StarTeam.BI_Migrar_Rango_Edad
AS
BEGIN
  INSERT INTO StarTeam.BI_Rango_Edad(RANGO_EDAD_MIN, RANGO_EDAD_MAX, RANGO_EDAD_DESCRIPCION) VALUES (18, 30, '18 - 30 años')
  INSERT INTO StarTeam.BI_Rango_Edad(RANGO_EDAD_MIN, RANGO_EDAD_MAX, RANGO_EDAD_DESCRIPCION) VALUES (31, 50, '31 - 50 años')
  INSERT INTO StarTeam.BI_Rango_Edad(RANGO_EDAD_MIN, RANGO_EDAD_MAX, RANGO_EDAD_DESCRIPCION) VALUES (51, null, '> 50 años')
END
GO


CREATE PROCEDURE StarTeam.BI_Migrar_Tiempo
AS
BEGIN
INSERT INTO 
FROM
END
GO


CREATE PROCEDURE STARTEAM.Migrar_Chofer
AS
BEGIN
--TODO:  FIjarse que capaz haya que actualizarle algun campo mas
  
END
GO


CREATE PROCEDURE STARTEAM.Migrar_Paquete
AS
BEGIN
   INSERT INTO StarTeam.BI_Paquete
   SELECT * FROM StarTeam.Paquete
END 
GO


CREATE PROCEDURE StarTeam.Migrar_Modelo_Camion
AS
BEGIN
  INSERT INTO StarTeam.BI_Modelo_Camion
  SELECT * FROM StarTeam.Modelo_Camion
END
GO


CREATE PROCEDURE StarTeam.Migrar_Modelo
AS
BEGIN
  INSERT INTO StarTeam.BI_Modelo
  SELECT * FROM StarTeam.Modelo
END
GO


CREATE PROCEDURE StarTeam.Migrar_Marca
AS
BEGIN
  INSERT INTO StarTeam.BI_Ciudad
  SELECT * FROM StarTeam.Marca
END
GO


CREATE PROCEDURE StarTeam.Migrar_Camion
AS
BEGIN
  INSERT INTO StarTeam.BI_Camion
  SELECT * FROM StarTearm.Camion
END
GO


CREATE PROCEDURE StarTeam.Migrar_Ciudad
AS
BEGIN
  INSERT INTO StarTeam.BI_Ciudad
  SELECT * FROM StarTeam.Ciudad
END
GO


CREATE PROCEDURE StarTeam.Migrar_Recorrido
AS
BEGIN
  INSERT INTO StarTeam.BI_Recorrido 
  SELECT * FROM StarTeam.Recorrido
END
GO


CREATE PROCEDURE StarTeam.Migrar_Viaje
AS
BEGIN
  --TODO: FIjarse que capaz haya que actualizarle algun campo mas
    INSERT INTO StarTeam.BI_Viaje
    SELECT * FROM StarTeam.Viaje
END
GO


CREATE PROCEDURE StarTeam.Migrar_Paquete_X_Viaje
AS
BEGIN
  INSERT INTO StarTeam.BI_Paquete_X_Viaje
  SELECT * FROM StarTeam.Paquete_X_Viaje
END
GO


CREATE PROCEDURE StarTeam.Migrar_Taller
AS
BEGIN
  INSERT INTO StarTeam.BI_Taller
  SELECT * FROM StarTeam.Taller
END
GO


CREATE PROCEDURE StarTeam.Migrar_Orden_Estado
AS
BEGIN
  INSERT INTO StarTeam.BI_Orden_Estado 
  SELECT * FROM StarTeam.Orden_Estado
END
GO


CREATE PROCEDURE StarTeam.Migrar_Orden_Trabajo
AS
BEGIN

    INSERT INTO StarTeam.BI_Orden_Trabajo
    SELECT * FROM StarTeam.Orden_Trabajo
END
GO


CREATE PROCEDURE StarTeam.Migrar_Mecanico
AS
BEGIN
    --TODO: HAY QUE ACTUALIZAR EL TEMA DE QUE AHORA TIENE UNA FK MAS
  INSERT INTO StarTeam.Mecanico ()
  SELECT DISTINCT 
  FROM StarTeam.Mecanico
  WHERE IS NOT NULL
END
GO


CREATE PROCEDURE StarTeam.Migrar_Tarea_Tipo
AS
BEGIN
  INSERT INTO StarTeam.BI_Tarea_Tipo
    SELECT * FROM StarTeam.Tarea_Tipo
END
GO


CREATE PROCEDURE StarTeam.Migrar_Tarea
AS
BEGIN
 INSERT INTO StarTeam.BI_Tarea 
 SELECT * FROM StarTeam.Tarea
END
GO


CREATE PROCEDURE StarTeam.Migrar_Tarea_X_Orden_Trabajo
AS
BEGIN
 
  INSERT INTO StarTeam.BI_Tarea_X_Orden_Trabajo
  SELECT * FROM StarTeam.Tarea_X_Orden_Trabajo

END
GO

CREATE PROCEDURE StarTeam.Migrar_Material
AS
BEGIN
  INSERT INTO StarTeam.BI_Material 
  SELECT * FROM StarTeam.Material 

END
GO


CREATE PROCEDURE StarTeam.Migrar_Material_X_Tarea
AS
BEGIN
  INSERT INTO StarTeam.BI_Material_X_Tarea
  SELECT * FROM StarTeam.Material_X_Tarea
END
GO




/*-----------------------------------------CREACION DE FUNCIONES--------------------------------------------*/



/*-----------------------------------------EJECUCION DE PROCEDURES------------------------------------------*/