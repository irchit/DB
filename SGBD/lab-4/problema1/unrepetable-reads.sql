use Practic
go

CREATE OR ALTER PROCEDURE non_repeatable_reads
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
    BEGIN TRANSACTION;

    SELECT id, nume, pret FROM Obiecte WHERE comestibil = 'da';

    WAITFOR DELAY '00:00:10';

    SELECT id, nume, pret FROM Obiecte WHERE comestibil = 'da';

    COMMIT TRANSACTION;
END;
GO

CREATE OR ALTER PROCEDURE non_repeatable_reads_corrected
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
    BEGIN TRANSACTION;


    SELECT id, nume, pret FROM Obiecte WHERE comestibil = 'da';

    WAITFOR DELAY '00:00:10';

    SELECT id, nume, pret FROM Obiecte WHERE comestibil = 'da';

    COMMIT TRANSACTION;
END;
GO

exec non_repeatable_reads;
go

exec non_repeatable_reads_corrected;
go