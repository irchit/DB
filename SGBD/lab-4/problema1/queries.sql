use Practic
go

create or alter procedure insert_copil as
begin
	begin tran
	waitfor delay '00:00:02'
	insert into Copii 
	(nume, prenume, [data nasterii], localitate) 
	values 
	('Andrei', 'Saguna', '2010-10-03', 'Sibiu');
	commit tran
end;
go

create or alter procedure update_obiecte as
begin
    BEGIN TRANSACTION;

    UPDATE Obiecte
    SET pret = pret + 1
    WHERE comestibil = 'da';

	WAITFOR DELAY '00:00:15'

    COMMIT TRANSACTION;
end;
go

create or alter procedure update_obiecte_nowait as
begin
    BEGIN TRANSACTION;

    UPDATE Obiecte
    SET pret = pret + 1
    WHERE comestibil = 'da';

    COMMIT TRANSACTION;
end;
go

exec insert_copil;
exec update_obiecte;
exec update_obiecte_nowait;