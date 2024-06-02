use Practic
go

create or alter procedure deadlock1 as
begin
	set transaction isolation level serializable
	begin tran
	update Copii set prenume='Charlie' where id=1
	waitfor delay '00:00:15'
	update Obiecte set pret=pret-1 where id=1
	commit transaction
end;
go

create or alter procedure no_deadlock1 as
begin
	set transaction isolation level serializable
	begin tran
	update Copii set prenume='Charlie' where id=1
	update Obiecte set pret=pret-1 where id=1
	commit transaction
end;
go

exec deadlock1
go

exec no_deadlock1
go