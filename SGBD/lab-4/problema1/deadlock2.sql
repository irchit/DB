use Practic
go

create or alter procedure deadlock2 as
begin
	set transaction isolation level serializable
	begin tran
	update Obiecte set pret=pret+1 where id=1
	waitfor delay '00:00:15'
	update Copii set prenume='Charles' where id=1
	commit transaction
end;
go

create or alter procedure no_deadlock1 as
begin
	set transaction isolation level serializable
	begin tran
	update Obiecte set pret=pret+1 where id=1
	update Copii set prenume='Charles' where id=1
	commit transaction
end;
go

exec deadlock2
go

exec no_deadlock1
go


update Copii set prenume='Doc' where id=1
update Obiecte set pret=7.99 where id=1