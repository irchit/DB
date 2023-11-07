USE [DBDogs]

CREATE TABLE [Caine] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [nume] varchar(50),
  [tata_id] int,
  [mama_id] int,
  [pret] float,
  [rasa_id] int,
  [data_nastere] date,
  [blana_id] int
)

CREATE TABLE [Persoana] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [nume] varchar(50),
  [prenume] varchar(50),
  [locatie_id] int,
  [telefon] varchar(13)
)

CREATE TABLE [Rasa] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [denumire] varchar(50),
  [talie_id] int,
  [tara_origine] varchar(30),
  [descriere_rasa] varchar(250)
)

CREATE TABLE [Talie] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [tip] varchar(30)
)

CREATE TABLE [Canisa] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [denumire] varchar(50),
  [proprietar_id] int,
  [locatie_id] int,
  [telefon] varchar(13)
)

CREATE TABLE [Locatie] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [tara] varchar(50),
  [cod_postal] varchar(10),
  [regiune] varchar(50),
  [oras] varchar(50),
  [strada] varchar(50),
  [numar] int,
  [alte_detalii] varchar(50)
)

CREATE TABLE [Culoare] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [culoare] varchar(25)
)

CREATE TABLE [CaineDetinator] (
  [id_caine] int,
  [id_detinator] int,
  [an_achizitie] date,
  PRIMARY KEY ([id_caine], [id_detinator])
)

CREATE TABLE [CuloareCaine] (
  [id_caine] int,
  [id_culoare] int,
  [procent_culoare] float,
  PRIMARY KEY ([id_caine], [id_culoare])
)

CREATE TABLE [Blana] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [tip] varchar(50),
  [lungime] varchar(15)
)

CREATE TABLE [Hrana] (
  [id] int PRIMARY KEY IDENTITY(1,1),
  [denumire] varchar(30),
  [carne] varchar(30),
  [calitate] int,
  [varsta] varchar(30),
  [talie_id] int
)

CREATE TABLE [HranaCaine] (
  [id_caine] int,
  [id_hrana] int,
  PRIMARY KEY ([id_caine], [id_hrana])
)

ALTER TABLE [Caine] ADD FOREIGN KEY ([rasa_id]) REFERENCES [Rasa] ([id])

ALTER TABLE [Caine] ADD FOREIGN KEY ([blana_id]) REFERENCES [Blana] ([id])

ALTER TABLE [Persoana] ADD FOREIGN KEY ([locatie_id]) REFERENCES [Locatie] ([id])

ALTER TABLE [Rasa] ADD FOREIGN KEY ([talie_id]) REFERENCES [Talie] ([id])

ALTER TABLE [Canisa] ADD FOREIGN KEY ([proprietar_id]) REFERENCES [Persoana] ([id])

ALTER TABLE [Canisa] ADD FOREIGN KEY ([locatie_id]) REFERENCES [Locatie] ([id])

ALTER TABLE [CaineDetinator] ADD FOREIGN KEY ([id_caine]) REFERENCES [Caine] ([id])

ALTER TABLE [CaineDetinator] ADD FOREIGN KEY ([id_detinator]) REFERENCES [Persoana] ([id])

ALTER TABLE [CuloareCaine] ADD FOREIGN KEY ([id_caine]) REFERENCES [Caine] ([id])

ALTER TABLE [CuloareCaine] ADD FOREIGN KEY ([id_culoare]) REFERENCES [Culoare] ([id])

ALTER TABLE [Hrana] ADD FOREIGN KEY ([talie_id]) REFERENCES [Talie] ([id])

ALTER TABLE [HranaCaine] ADD FOREIGN KEY ([id_caine]) REFERENCES [Caine] ([id])

ALTER TABLE [HranaCaine] ADD FOREIGN KEY ([id_hrana]) REFERENCES [Hrana] ([id])

GO
