USE DBDogs
GO

-- 1 --

ALTER PROCEDURE SetPriceInt
AS
	ALTER TABLE Caine
		ALTER COLUMN pret INT
GO

ALTER PROCEDURE SetPriceBackFloat
AS
	ALTER TABLE Caine
		ALTER COLUMN pret FLOAT
GO
-- 2 --

ALTER PROCEDURE SetDefaultPrice
AS
	ALTER TABLE Caine
		ADD CONSTRAINT PretDefaultConstraint DEFAULT(100) FOR pret
GO

ALTER PROCEDURE RemoveDefaultPrice
AS
	ALTER TABLE Caine
		DROP CONSTRAINT PretDefaultConstraint
GO

-- 3 --

ALTER PROCEDURE CreatePedigree
AS
	CREATE TABLE Pedigree 
	(
		id_dog INT PRIMARY KEY,
		class VARCHAR(3)
	)
GO

ALTER PROCEDURE DropPedigree
AS
	DROP TABLE Pedigree
GO

-- 4 --

ALTER PROCEDURE AddDogNickName
AS
	ALTER TABLE Caine
		ADD nickname VARCHAR(50)
GO

ALTER PROCEDURE RemoveDogNickName
AS
	ALTER TABLE Caine
		DROP COLUMN nickname
GO

-- 5 --

CREATE PROCEDURE ForeignKeyToPedigree
AS
	ALTER TABLE Pedigree
		ADD CONSTRAINT id_dog_reference FOREIGN KEY (id_dog) REFERENCES [Caine] (id)
GO

CREATE PROCEDURE RemoveForeignKeyToPedigree
AS
	ALTER TABLE Pedigree
		DROP CONSTRAINT id_dog_reference
GO

-- VERSION CONTROL --

CREATE TABLE VersionHistory
(
    VERSION INT
)

INSERT INTO VersionHistory
VALUES (0);

CREATE TABLE ProcedureTable
(
    UndoProcedure VARCHAR(100),
    RedoProcedure VARCHAR(100),
    Version       INT PRIMARY KEY
);

INSERT INTO ProcedureTable(UndoProcedure, RedoProcedure, Version)
VALUES 
	('SetPriceBackFloat','SetPriceInt', 1),
	('RemoveDefaultPrice','SetDefaultPrice', 2),
	('DropPedigree','CreatePedigree', 3),
	('RemoveDogNickName','AddDogNickName', 4),
	('RemoveForeignKeyToPedigree','ForeignKeyToPedigree', 5);

GO

ALTER PROCEDURE GoToVersion 
	@Version INT = 0
AS
	BEGIN
		IF @Version > 5 OR @Version < 0
		BEGIN
			PRINT 'Invalid version'
			RETURN
		END

		DECLARE @var INT;
		DECLARE @func nVARCHAR(100);
		DECLARE @procedure NVARCHAR(100);
		SET @var = (SELECT TOP 1 VH.VERSION FROM VersionHistory VH)
		IF (@var > @Version)
		BEGIN
			WHILE
			(@var > @Version)
			BEGIN
				SELECT @func = PT.UndoProcedure FROM ProcedureTable PT WHERE PT.Version = @var
				SELECT @procedure = 'exec ' + @func
				PRINT @procedure
				EXEC sp_executesql @func
				UPDATE VersionHistory
					SET VERSION = VERSION - 1
				SET @var = @var - 1
			END
			RETURN
		END		
		WHILE (@var < @Version)
		BEGIN
			SET @var = @var + 1
			SELECT @func = PT.RedoProcedure FROM ProcedureTable PT WHERE PT.Version = @var
			SELECT @procedure = 'exec ' + @func
			PRINT @procedure
			EXEC sp_executesql @func
			UPDATE VersionHistory
				SET VERSION = VERSION + 1
		END
	END;

EXEC GoToVersion @Version = 0;