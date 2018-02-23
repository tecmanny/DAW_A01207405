IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')

DROP TABLE Materiales

CREATE TABLE Materiales(
Clave numeric(5) not null,
Descripcion varchar(50),
Costo numeric (8,2),
)

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')

DROP TABLE Proveedores

CREATE TABLE Proveedores(
RFC char(13) not null,
RazonSocial varchar(50)
)

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')

DROP TABLE Proyectos

CREATE TABLE Proyectos(
Numero numeric(5) not null,
Denominacion varchar(50)
)


IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')

DROP TABLE Entregan


CREATE TABLE Entregan(
Clave numeric(5) not null,
RFC char(13) not null,
Numero numeric(5) not null,
Fecha DateTime not null,
Cantidad numeric(8,2)
)

BULK INSERT a1207405.a1207405.[Materiales]
   FROM 'e:\wwwroot\a1207405\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1207405.a1207405.[Proyectos]
   FROM 'e:\wwwroot\a1207405\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

BULK INSERT a1207405.a1207405.[Proveedores]
   FROM 'e:\wwwroot\a1207405\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT a1207405.a1207405.[Entregan]
   FROM 'e:\wwwroot\a1207405\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

INSERT INTO Materiales values(1000,'xxx',1000)

Delete from Materiales where Clave = 1000 and Costo = 1000

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)

INSERT INTO Materiales values(1000,'xxx',1000)


sp_helpconstraint Materiales


ALTER TABLE entregan add constraint llaveEntregan
PRIMARY KEY (Clave, RFC,Numero, Fecha)

ALTER TABLE proyectos add constraint llaveProyectos
PRIMARY KEY (Numero)

ALTER TABLE proveedores add constraint llaveProveedores
PRIMARY KEY (RFC)

SELECT * from Materiales
SELECT * from Entregan
SELECT * from Proveedores
SELECT * from Proyectos

INSERT INTO Entregan values (0,'xxx',0,'1-jan-02',0);

Delete from Entregan where Clave = 0

ALTER TABLE	entregan add constraint cfentreganclave
foreign key (Clave) references Materiales(Clave);

ALTER TABLE entregan add constraint cfentreganclave
foreign key (RFC) references Materiales(RFC);

ALTER TABLE entregan add constraint cfentreganclave
foreign key (Numero) references Materiales(Numero);


INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0); 

ALTER TABLE entregan add constraint cantidad check (cantidad > 0) 



sp_helpconstraint materiales
sp_helpconstraint Entregan
sp_helpconstraint Proveedores
sp_helpconstraint Proyectos
 