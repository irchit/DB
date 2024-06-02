use Practic
go

create or alter function validare_varchar (@text varchar(50))
returns bit
as
begin
	declare @flag bit
	set @flag = 1
	if @text is null or @text = ''
		set @flag = 0
	return @flag
	end
go

create or alter function validare_forma (@text varchar(50))
returns bit
as
begin
	declare @flag bit
	set @flag = 1
	if @text is null or @text = ''
		set @flag = 0
	if @text <> 'stea' and @text <> 'animal' and @text <> 'ou'
		set @flag = 0
	return @flag
	end
go

create or alter function validare_pozitiv_num(@num int)
returns bit
as
begin
	declare @flag bit
	set @flag = 1
	if @num is null or @num < 0
		set @flag = 0
	return @flag
	end
go

create or alter function validare_date (@data date)
returns bit
as
begin
    declare @flag bit
    set @flag = 1
    if @data is null or @data >= cast(getdate() as date)
        set @flag = 0
    return @flag
end
go

create or alter procedure add_copil_piniata
    @nume_c varchar(50), 
    @prenume varchar(50), 
    @data_nastere date,
    @localitate varchar(50),
    @nume_p varchar(50), 
    @descriere varchar(255), 
    @forma varchar(10),
    @tara varchar(50), 
    @data_utilizare date
as
begin
	insert into LogLab3 (information) values ('enter in add_copil_piniata');
    begin tran
	insert into LogLab3 (information) values ('start transaction in add_copil_piniata');
    begin try
        if dbo.validare_varchar(@nume_c) <> 1
        begin
            raiserror('Nume copil invalid', 16, 1);
        end
        if dbo.validare_varchar(@prenume) <> 1
        begin
            raiserror('Prenume copil invalid', 16, 1);
        end
        if dbo.validare_varchar(@localitate) <> 1
        begin
            raiserror('Localitate copil invalid', 16, 1);
        end
        if dbo.validare_varchar(@nume_p) <> 1
        begin
            raiserror('Nume piniata invalid', 16, 1);
        end
        if dbo.validare_varchar(@descriere) <> 1
        begin
            raiserror('Descriere piniata invalida', 16, 1);
        end
        if dbo.validare_forma(@forma) <> 1
        begin
            raiserror('Forma piniata invalida', 16, 1);
        end
        if dbo.validare_varchar(@tara) <> 1
        begin
            raiserror('Tara oringine piniata invalida', 16, 1);
        end
        if dbo.validare_date(@data_nastere) <> 1
        begin
            raiserror('Data nastere copil invalida', 16, 1);
        end
        if dbo.validare_date(@data_utilizare) <> 1
        begin
            raiserror('Data utilizare piniata invalida', 16, 1);
        end
        else
        begin
			insert into LogLab3 (information) values ('everything valid');

            declare @id_copil int, @id_piniata int;
            
            insert into Copii (nume, prenume, [data nasterii], localitate)
            values (@nume_c, @prenume, @data_nastere, @localitate);

			insert into LogLab3 (information) values ('insert copil in Copii in add_copil_piniata');
            
            set @id_copil = scope_identity();
            
            -- Insert into Piniate table
            insert into Piniate (nume, descriere, forma, [tara origine], [data utilizare])
            values (@nume_p, @descriere, @forma, @tara, @data_utilizare);
            
			insert into LogLab3 (information) values ('insert piniata in Piniate in add_copil_piniata');

            set @id_piniata = scope_identity();
            
            insert into CopilPiniata (id_copil, id_piniata, lovituri)
            values (@id_copil, @id_piniata, 1);
			insert into LogLab3 (information) values ('insert relationship between Copil and Piniata in add_copil_piniata');
            
            commit tran;
            print 'Transaction committed';
			insert into LogLab3 (information) values ('Transaction commited in add_copil_piniata');

        end
    end try
    begin catch
        rollback tran;
		insert into LogLab3 (information) values (error_message() + '; in add_copil_piniata');
        print ERROR_MESSAGE();
        print 'Transaction rollbacked';
		insert into LogLab3 (information) values ('Transaction rollback in add_copil_piniata');
    end catch
	insert into LogLab3 (information) values ('exit from add_copil_piniata');
end
go



-- Scenarii de succes
exec add_copil_piniata 'John1', 'Doe', '2010-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-03-03';

-- Scenarii cu erori
-- Unul sau mai mulți parametri sunt null sau empty
exec add_copil_piniata null, 'Doe', '2000-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-05-12';
exec add_copil_piniata 'John2', '', '2000-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', '', 'Romania', '2024-05-18';
exec add_copil_piniata 'John3', 'Doe', '2000-01-01', '', 'Piniata1', 'Descriere piniata 1', 'animal', 'Romania', '2024-05-19';
-- Data de naștere sau data de utilizare este în viitor (dacă nu este permis)
exec add_copil_piniata 'John4', 'Doe', '2025-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'animal', 'Romania', '2025-05-19';
-- Unul sau mai mulți parametri nu respectă validările efectuate în procedură (de exemplu, forma piniței)
exec add_copil_piniata 'John5', 'Doe', '2030-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', '', 'Romania', '2024-05-19';


select * from Copii;
select * from Piniate;
select * from CopilPiniata;
select * from LogLab3; 
go

-- Problema 2

create or alter procedure add_copil
	@nume_c varchar(50), 
    @prenume varchar(50), 
    @data_nastere date,
    @localitate varchar(50)
as
begin
	insert into LogLab3 (information) values ('enter in from add_copil');
	declare @id int;
	begin tran
	insert into LogLab3 (information) values ('begin transaction in add_copil');
	begin try
		if dbo.validare_varchar(@nume_c) <> 1
        begin
            raiserror('Nume copil invalid', 16, 1);
        end
        if dbo.validare_varchar(@prenume) <> 1
        begin
            raiserror('Prenume copil invalid', 16, 1);
        end
        if dbo.validare_varchar(@localitate) <> 1
        begin
            raiserror('Localitate copil invalid', 16, 1);
        end
        if dbo.validare_date(@data_nastere) <> 1
        begin
            raiserror('Data nastere copil invalida', 16, 1);
        end
		else
		begin
			insert into LogLab3 (information) values ('everything valid in add_copil');
			insert into Copii(nume, prenume, localitate, [data nasterii])
			values
			(@nume_c, @prenume, @localitate, @data_nastere);
			set @id = scope_identity();
			print 'copil adaugat cu succes'
			insert into LogLab3 (information) values ('copil added in copii from in add_copil');
			commit tran
			print 'Transaction commited'
			insert into LogLab3 (information) values ('commit transaction in add_copil');
		end
	end try
	begin catch
		rollback tran
		insert into LogLab3 (information) values ('rollback transaction in add_copil');
		print ERROR_MESSAGE();
		insert into LogLab3 (information) values ('error: ' + ERROR_MESSAGE() +'; in add_copil'); 
		print 'Transaction rollbacked'
		return -1
	end catch
	return @id
	insert into LogLab3 (information) values ('exit from add_copil');
end
go

create or alter procedure add_piniata
	@nume_p varchar(50), 
    @descriere varchar(255), 
    @forma varchar(10),
    @tara varchar(50), 
    @data_utilizare date
as
begin
	insert into LogLab3 (information) values ('enter in add_piniata');
	declare @id int;
	begin tran
	insert into LogLab3 (information) values ('start transaction in add_piniata');
	begin try
		if dbo.validare_varchar(@nume_p) <> 1
        begin
            raiserror('Nume piniata invalid', 16, 1);
        end
        if dbo.validare_varchar(@descriere) <> 1
        begin
            raiserror('Descriere piniata invalida', 16, 1);
        end
        if dbo.validare_forma(@forma) <> 1
        begin
            raiserror('Forma piniata invalida', 16, 1);
        end
        if dbo.validare_varchar(@tara) <> 1
        begin
            raiserror('Tara oringine piniata invalida', 16, 1);
        end
        if dbo.validare_date(@data_utilizare) <> 1
        begin
            raiserror('Data utilizare piniata invalida', 16, 1);
        end
        else
		begin
			insert into LogLab3 (information) values ('everything valid in add_piniata');
			insert into Piniate (nume, descriere, [tara origine], forma, [data utilizare])
			values
			(@nume_p, @descriere, @tara, @forma, @data_utilizare);
			set @id = scope_identity();
			print 'piniata adaugata cu succes'
			insert into LogLab3 (information) values ('piniata added in Piniate in add_piniata');
			commit tran
			insert into LogLab3 (information) values ('commit transaction in  add_piniata');
			print 'Transaction commited'
		end
	end try
	begin catch
		rollback tran
		insert into LogLab3 (information) values ('rollback transaction in add_piniata');
		print ERROR_MESSAGE();
		insert into LogLab3 (information) values ('error: ' + ERROR_MESSAGE() + ' in add_piniata'); 
		print 'Transaction rollbacked'
		return -1
	end catch
	insert into LogLab3 (information) values ('exit from add_piniata');
	return @id
end
go

create or alter procedure add_copil_piniata_2
	@nume_c varchar(50), 
    @prenume varchar(50), 
    @data_nastere date,
    @localitate varchar(50),
    @nume_p varchar(50), 
    @descriere varchar(255), 
    @forma varchar(10),
    @tara varchar(50), 
    @data_utilizare date
as
begin
	insert into LogLab3 (information) values ('enter in add_copil_piniata_2');
    declare @copil_adaugat_id int;
	declare @piniata_adaugata_id int;

	exec @copil_adaugat_id = add_copil @nume_c, @prenume, @data_nastere, @localitate;
	exec @piniata_adaugata_id = add_piniata @nume_p, @descriere, @forma, @tara, @data_utilizare;
	
	if @copil_adaugat_id = -1
	begin
		insert into LogLab3 (information) values ('copil has error add_copil_piniata_2');
		print 'Copilul nu a fost adaugat, nu se va putea adauga in tabela CopilPiniata'
		return 1
	end
	if @piniata_adaugata_id = -1
	begin
		insert into LogLab3 (information) values ('piniata has error add_copil_piniata_2');
		print 'Piniata nu a fost adaugata, nu se va putea adauga in tabela CopilPiniata'
		return 1
	end

	insert into CopilPiniata values (@copil_adaugat_id, @piniata_adaugata_id, 1);
	insert into LogLab3 (information) values ('insert relationship between Copil and Piniata in add_copil_piniata_2');
	insert into LogLab3 (information) values ('exit from add_copil_piniata_2');
	return 0
end

-- Scenarii de succes
exec add_copil_piniata_2 'John21', 'Doe', '2010-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-03-03';

-- Scenarii cu erori copil
exec add_copil_piniata_2 null, 'Doe', '2010-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-03-03';
exec add_copil_piniata_2 'Miau', 'Doe', '2030-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-03-03';
exec add_copil_piniata_2 'Miau', 'Doe', '2003-01-01', '', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-03-03';
exec add_copil_piniata_2 null, 'Doe', '2003-01-01', '', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2024-03-03';

-- Scenarii cu erori piniata
exec add_copil_piniata_2 'John22', 'Doe', '2010-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'stea', 'Romania', '2027-03-03';
exec add_copil_piniata_2 'John23', 'Doe', '2010-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'cal', 'Romania', '2027-03-03';
exec add_copil_piniata_2 'John24', 'Doe', '2010-01-01', 'New York', 'Piniata1', 'Descriere piniata 1', 'animal', '', '2027-03-03';
exec add_copil_piniata_2 'John25', 'Doe', '2010-01-01', 'New York', 'Piniata1', null, 'animal', '', '2027-03-03';
exec add_copil_piniata_2 'John26', 'Doe', '2010-01-01', 'New York', 'Piniata1', null, 'animal', 'Germania', '2027-03-03';
exec add_copil_piniata_2 'John27', 'Doe', '2010-01-01', 'New York', '', 'ahjgd ajd', 'animal', 'Germania', '2027-03-03';
exec add_copil_piniata_2 'John28', 'Doe', '2010-01-01', 'New York', null, 'ahjgd ajd', 'animal', 'Germania', '2027-03-03';

-- Scenarii cu erori la ambele
exec add_copil_piniata_2 'John29', null, '2010-01-01', 'New York', null, 'ahjgd ajd', 'animal', 'Germania', '2027-03-03';
exec add_copil_piniata_2 'John29', null, '2050-01-01', 'New York', null, 'ahjgd ajd', 'animal', 'Germania', '2044-03-03';


select * from Copii;
select * from Piniate;
select * from CopilPiniata;
select * from LogLab3; 
go

dbcc log(Practic, 0);