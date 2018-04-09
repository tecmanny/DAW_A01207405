
DROP TABLE Clientes_Banca

CREATE TABLE Clientes_Banca (
NoCuenta varchar(5) not null ,
Nombre varchar(30),
Saldo numeric (10,2),
)

DROP TABLE Tipos_Movimiento

CREATE TABLE Tipos_Movimiento(
ClaveM varchar(2) not null,
Descripcion varchar(30),
)
DROP TABLE Movimientos

SET DATEFORMAT dmy
CREATE TABLE Movimientos(
NoCuenta varchar(5) not null,
ClaveM varchar(2) not null,
Fecha datetime not null,
Monto numeric(10,2),
) 

-- Añadimos los Constraints para llaves

ALTER TABLE Clientes_Banca add constraint llaveClientes_Bancarias PRIMARY KEY (NoCuenta)
--sp_helpconstraint Clientes_Banca
ALTER TABLE Tipos_Movimiento add constraint llaveTipos_Movimiento PRIMARY KEY (ClaveM)
--sp_helpconstraint Tipos_Movimiento
ALTER TABLE Movimientos add constraint llaveMovimientos_clave PRIMARY KEY (ClaveM, NoCuenta, Fecha)
--sp_helpconstraint Movimientos

ALTER TABLE Movimientos add constraint fkCB
foreign key (ClaveM) references Tipos_Movimiento(ClaveM);
--sp_helpconstraint Movimientos --Para verificar

ALTER TABLE Movimientos add constraint fkTM
foreign key (NoCuenta) references Clientes_Banca(NoCuenta);
--sp_helpconstraint Movimientos --Para verificar


BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1 

BEGIN TRANSACTION PRUEBA2
INSERT INTO Clientes_Banca VALUES('004','Ricardo Rios Maldonado',19000)
INSERT INTO Clientes_Banca VALUES('005','Pablo Ortiz Arana',15000)
INSERT INTO Clientes_Banca VALUES('006','Luis Manuel Alvarado',18000) 

ROLLBACK TRANSACTION PRUEBA2 


SELECT * FROM CLIENTES_BANCA 

BEGIN TRANSACTION PRUEBA3
INSERT INTO Tipos_Movimiento VALUES('A','Retiro Cajero Automatico');
INSERT INTO Tipos_Movimiento VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

SELECT * FROM Tipos_Movimiento


BEGIN TRANSACTION PRUEBA4
INSERT INTO Movimientos VALUES('001','A',GETDATE(),500);
UPDATE clientes_banca SET Saldo = Saldo -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4

SELECT * FROM CLIENTES_BANCA
SELECT * FROM Movimientos
SELECT * FROM Tipos_Movimiento



BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('007','Oscar Perez Alvarado',8000);

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END

SELECT * FROM CLIENTES_BANCA

DELETE
FROM Clientes_Banca
WHERE NoCuenta = 005

DELETE
FROM Clientes_Banca
WHERE NoCuenta = 006


DELETE
FROM Clientes_Banca
WHERE NoCuenta = 007


-----------

CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
		@NoCuenta varchar(5),
		@Monto numeric(10,2)
	as
		BEGIN TRANSACTION PRUEBA6
		INSERT INTO Movimientos
    VALUES(@NoCuenta,'A',GETDATE(),@Monto);
		UPDATE Clientes_Banca
    SET Saldo = Saldo - @Monto
		WHERE NoCuenta=@NoCuenta

		IF @@ERROR = 0
		COMMIT TRANSACTION PRUEBA6
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION PRUEBA6
		END
GO
----------------

CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
		@NoCuenta varchar(5),
		@Monto numeric(10,2)
	as
		BEGIN TRANSACTION PRUEBA7
		INSERT INTO Movimientos
    VALUES(@NoCuenta,'B',GETDATE(),@Monto);
		UPDATE Clientes_Banca
    SET Saldo = Saldo + @Monto
		WHERE NoCuenta=@NoCuenta

		IF @@ERROR = 0
		COMMIT TRANSACTION PRUEBA7
		ELSE
		BEGIN
		PRINT 'A transaction needs to be rolled back'
		ROLLBACK TRANSACTION PRUEBA7
		END
GO