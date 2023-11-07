USE [Dogs]

INSERT INTO [Talie] ([tip])
VALUES
('mare'),
('medie'),
('mică'),
('necunoscut');

INSERT INTO [Rasa] ([denumire], [talie_id], [tara_origine], [descriere_rasa])
VALUES
('Airedale Terrier', 1, 'Anglia', 'Airedale Terrier este cea mai mare dintre rasele de terrieri.'),
('Yorkshire Terrier', 3, 'Anglia', 'Yorkshire Terrier este un câine mic, dar plin de personalitate.'),
('Maltipoo', 3, 'Statele Unite', 'Maltipoo este un câine hibrid, rezultat din încrucișarea dintre un Maltez și un Poodle.'),
('Poodle', 2, 'Germania/Franța', 'Poodle este un câine elegant, inteligent și versatil.'),
('Bison Maltez', 3, 'Italia', 'Bison Maltez este un câine mic, dar robust, cu un aspect de jucărie.'),
('Maidanez', 4, 'necunoscută', 'Maidanez este un termen folosit pentru a desemna câinii fără rasă.');

-- Inserare date în tabela Blana
INSERT INTO [Blana] ([tip], [lungime])
VALUES
('sarmos', 'lung'),
('sarmos', 'scurt'),
('fin', 'lung'),
('fin', 'scurt'),
('cret', 'lung'),
('cret', 'scurt');

-- Inserare date în tabela Caine
INSERT INTO [Caine] ([nume], [tata_id], [mama_id], [pret], [rasa_id], [data_nastere], [blana_id])
VALUES
-- Bunicii
('Rex', -1, -1, 900, 1, '2020-01-01', 2),
('Lola', -1, -1, 850, 1, '2020-01-15', 2),
('Sam', -1, -1, 950, 1, '2020-02-01', 2),
('Lily', -1, -1, 800, 1, '2020-02-15', 2),
-- Părinții
('Max', 1, 2, 1000, 1, '2021-01-01', 2),
('Bella', 3, 4, 950, 1, '2021-01-15', 2),
-- Copiii
('Leo', 5, 6, 900, 1, '2022-01-01', 2),
('Luna', 5, 6, 850, 1, '2022-01-01', 2),
('Lucky', 5, 6, 950, 1, '2022-01-01', 2),
-- Bonzo
('Bonzo', -1, -1, 0, 6, '2020-01-01', 3),
-- Copilul lui Bonzo și Bella
('Rexy', 10, 6, 50, 6, '2022-01-01', 1);

-- Inserare date în tabela Locatie
INSERT INTO [Locatie] ([tara], [cod_postal], [regiune], [oras], [strada], [numar], [alte_detalii])
VALUES
('Romania', '010011', 'Bucuresti', 'Bucuresti', 'Calea Victoriei', 49, 'etaj 3, apartament 12'),
('Romania', '400001', 'Cluj', 'Cluj-Napoca', 'Bulevardul Eroilor', 21, 'bl. A3, sc. B, ap. 15'),
('Romania', '300001', 'Timis', 'Timisoara', 'Strada Alba Iulia', 4, 'bl. 7, sc. 2, ap. 34'),
('Germania', '10117', 'Berlin', 'Berlin', 'Unter den Linden', 77, NULL);

-- Inserare date în tabela Persoana
INSERT INTO [Persoana] (nume, prenume, locatie_id, telefon)
VALUES
('Popescu', 'Ion', 1, '+40721234567'),
('Ionescu', 'Ana', 2, '+40739876543'),
('Schmidt', 'Hans', 4, '+49123456789'),
('Popa', 'Maria', 3, '+40745678901');

-- Inserare date în tabela CaineDetinator
INSERT INTO [CaineDetinator] ([id_caine], [id_detinator], [an_achizitie])
VALUES
-- Ion cu Bonzo și Luna
(10, 1, DATEADD(month, 2, '2020-01-01')), -- Bonzo
(7, 1, DATEADD(month, 2, '2022-01-01')), -- Luna
-- Hans cu Rex, Lola, Sam și Lily
(1, 3, DATEADD(month, 2, '2020-01-01')), -- Rex
(2, 3, DATEADD(month, 2, '2020-01-15')), -- Lola
(3, 3, DATEADD(month, 2, '2020-02-01')), -- Sam
(4, 3, DATEADD(month, 2, '2020-02-15')), -- Lily
-- Maria cu Max, Leo și Luna
(5, 4, DATEADD(month, 2, '2021-01-01')), -- Max
(6, 4, DATEADD(month, 2, '2022-01-01')), -- Leo
(7, 4, DATEADD(month, 2, '2022-01-01')), -- Luna
-- Ana cu Rexy, Lucky și Bella
(11, 2, DATEADD(month, 2, '2022-01-01')), -- Rexy
(9, 2, DATEADD(month, 2, '2022-01-01')), -- Lucky
(6, 2, DATEADD(month, 2, '2021-01-15')); -- Bella

-- Inserare date în tabela Locatie
INSERT INTO [Locatie] (tara, cod_postal, regiune, oras, strada, numar, alte_detalii)
VALUES
('Germania', '14193', 'Berlin', 'Berlin', 'Am Waldsee', 12, 'null');

-- Inserare date în tabela Canisa
INSERT INTO [Canisa] (denumire, proprietar_id, locatie_id, telefon)
VALUES
('Am Waldsee Hunde', 3, 5, '+49123456789');

-- Inserare date în tabela Locatie
INSERT INTO [Locatie] (tara, cod_postal, regiune, oras, strada, numar, alte_detalii)
VALUES
('Romania', '500001', 'Brasov', 'Brasov', 'Strada De Mijloc', 24, 'null');

-- Inserare date în tabela Canisa
INSERT INTO [Canisa] (denumire, proprietar_id, locatie_id, telefon)
VALUES
('Terrieri Zâmbind', 4, 6, '+40745678901');

-- Inserare date în tabela Culoare
INSERT INTO [Culoare] ([culoare])
VALUES
('alb'),
('negru'),
('maro'),
('gri');

-- Inserare date în tabela CuloareCaine
INSERT INTO [CuloareCaine] ([id_caine], [id_culoare], [procent_culoare])
VALUES
-- Terrierii
(1, 2, 0.65), -- Rex, negru 65%
(1, 3, 0.3), -- Rex, maro 30%
(1, 1, 0.05), -- Rex, alb 5%
(2, 2, 0.7), -- Lola, negru 70%
(2, 3, 0.25), -- Lola, maro 25%
(2, 1, 0.05), -- Lola, alb 5%
(3, 2, 0.6), -- Sam, negru 60%
(3, 3, 0.35), -- Sam, maro 35%
(3, 1, 0.05), -- Sam, alb 5%
(4, 2, 0.65), -- Lily, negru 65%
(4, 3, 0.3), -- Lily, maro 30%
(4, 1, 0.05), -- Lily, alb 5%
(5, 2, 0.7), -- Max, negru 70%
(5, 3, 0.25), -- Max, maro 25%
(5, 1, 0.05), -- Max, alb 5%
(6, 2, 0.6), -- Bella, negru 60%
(6, 3, 0.35), -- Bella, maro 35%
(6, 1, 0.05), -- Bella, alb 5%
(7, 2, 0.65), -- Leo, negru 65%
(7, 3, 0.3), -- Leo, maro 30%
(7, 1, 0.05), -- Leo, alb 5%
(8, 2, 0.7), -- Luna, negru 70%
(8, 3, 0.25), -- Luna, maro 25%
(8, 1, 0.05), -- Luna, alb 5%
(9, 2, 0.6), -- Lucky, negru 60%
(9, 3, 0.395), -- Lucky, maro 39.5%
(9, 1, 0.005), -- Lucky, alb 0.5%
-- Bonzo
(10, 1, 0.45), -- Bonzo, alb 45%
(10, 4, 0.55), -- Bonzo, gri 55%
-- Rexy
(11, 4, 0.02), -- Rexy, gri 2%
(11, 1, 0.20), -- Rexy, alb 20%
(11, 2, 0.625), -- Rexy, negru 62.5%
(11, 3, 0.155); -- Rexy, maro 15.5%

-- Inserare date în tabela Hrana
INSERT INTO [Hrana] ([denumire], [carne], [calitate], [varsta], [talie_id])
VALUES
-- Calitate 10
('Royal Canin', 'porc', 10, 'puppy', 1), -- talie mare
('Royal Canin', 'porc', 10, 'puppy', 2), -- talie medie
('Royal Canin', 'porc', 10, 'puppy', 3), -- talie mică
('Royal Canin', 'porc', 10, 'adult', 1), -- talie mare
('Royal Canin', 'porc', 10, 'adult', 2), -- talie medie
('Royal Canin', 'porc', 10, 'adult', 3), -- talie mică
('Royal Canin', 'porc', 10, 'senior', 1), -- talie mare
('Royal Canin', 'porc', 10, 'senior', 2), -- talie medie
('Royal Canin', 'porc', 10, 'senior', 3), -- talie mică
('Royal Canin', 'vită', 10, 'puppy', 1), -- talie mare
('Royal Canin', 'vită', 10, 'puppy', 2), -- talie medie
('Royal Canin', 'vită', 10, 'puppy', 3), -- talie mică
('Royal Canin', 'vită', 10, 'adult', 1), -- talie mare
('Royal Canin', 'vită', 10, 'adult', 2), -- talie medie
('Royal Canin', 'vită', 10, 'adult', 3), -- talie mică
('Royal Canin', 'vită', 10, 'senior', 1), -- talie mare
('Royal Canin', 'vită', 10, 'senior', 2), -- talie medie
('Royal Canin', 'vită', 10, 'senior', 3), -- talie mică
('Royal Canin', 'curcan', 10, 'puppy', 1), -- talie mare
('Royal Canin', 'curcan', 10, 'puppy', 2), -- talie medie
('Royal Canin', 'curcan', 10, 'puppy', 3), -- talie mică
('Royal Canin', 'curcan', 10, 'adult', 1), -- talie mare
('Royal Canin', 'curcan', 10, 'adult', 2), -- talie medie
('Royal Canin', 'curcan', 10, 'adult', 3), -- talie mică
('Royal Canin', 'curcan', 10, 'senior', 1), -- talie mare
('Royal Canin', 'curcan', 10, 'senior', 2), -- talie medie
('Royal Canin', 'curcan', 10, 'senior', 3), -- talie mică
('Royal Canin', 'pui', 10, 'puppy', 1), -- talie mare
('Royal Canin', 'pui', 10, 'puppy', 2), -- talie medie
('Royal Canin', 'pui', 10, 'puppy', 3), -- talie mică
('Royal Canin', 'pui', 10, 'adult', 1), -- talie mare
('Royal Canin', 'pui', 10, 'adult', 2), -- talie medie
('Royal Canin', 'pui', 10, 'adult', 3), -- talie mică
('Royal Canin', 'pui', 10, 'senior', 1), -- talie mare
('Royal Canin', 'pui', 10, 'senior', 2), -- talie medie
('Royal Canin', 'pui', 10, 'senior', 3), -- talie mică
-- Calitate 7.5
('Purina Pro Plan', 'porc', 7.5, 'puppy', 1), -- talie mare
('Purina Pro Plan', 'porc', 7.5, 'puppy', 2), -- talie medie
('Purina Pro Plan', 'porc', 7.5, 'puppy', 3), -- talie mică
('Purina Pro Plan', 'porc', 7.5, 'adult', 1), -- talie mare
('Purina Pro Plan', 'porc', 7.5, 'adult', 2), -- talie medie
('Purina Pro Plan', 'porc', 7.5, 'adult', 3), -- talie mică
('Purina Pro Plan', 'porc', 7.5, 'senior', 1), -- talie mare
('Purina Pro Plan', 'porc', 7.5, 'senior', 2), -- talie medie
('Purina Pro Plan', 'porc', 7.5, 'senior', 3), -- talie mică
('Purina Pro Plan', 'vită', 7.5, 'puppy', 1), -- talie mare
('Purina Pro Plan', 'vită', 7.5, 'puppy', 2), -- talie medie
('Purina Pro Plan', 'vită', 7.5, 'puppy', 3), -- talie mică
('Purina Pro Plan', 'vită', 7.5, 'adult', 1), -- talie mare
('Purina Pro Plan', 'vită', 7.5, 'adult', 2), -- talie medie
('Purina Pro Plan', 'vită', 7.5, 'adult', 3), -- talie mică
('Purina Pro Plan', 'vită', 7.5, 'senior', 1), -- talie mare
('Purina Pro Plan', 'vită', 7.5, 'senior', 2), -- talie medie
('Purina Pro Plan', 'vită', 7.5, 'senior', 3), -- talie mică
('Purina Pro Plan', 'curcan', 7.5, 'puppy', 1), -- talie mare
('Purina Pro Plan', 'curcan', 7.5, 'puppy', 2), -- talie medie
('Purina Pro Plan', 'curcan', 7.5, 'puppy', 3), -- talie mică
('Purina Pro Plan', 'curcan', 7.5, 'adult', 1), -- talie mare
('Purina Pro Plan', 'curcan', 7.5, 'adult', 2), -- talie medie
('Purina Pro Plan', 'curcan', 7.5, 'adult', 3), -- talie mică
('Purina Pro Plan', 'curcan', 7.5, 'senior', 1), -- talie mare
('Purina Pro Plan', 'curcan', 7.5, 'senior', 2), -- talie medie
('Purina Pro Plan', 'curcan', 7.5, 'senior', 3), -- talie mică
('Purina Pro Plan', 'pui', 7.5, 'puppy', 1), -- talie mare
('Purina Pro Plan', 'pui', 7.5, 'puppy', 2), -- talie medie
('Purina Pro Plan', 'pui', 7.5, 'puppy', 3), -- talie mică
('Purina Pro Plan', 'pui', 7.5, 'adult', 1), -- talie mare
('Purina Pro Plan', 'pui', 7.5, 'adult', 2), -- talie medie
('Purina Pro Plan', 'pui', 7.5, 'adult', 3), -- talie mică
('Purina Pro Plan', 'pui', 7.5, 'senior', 1), -- talie mare
('Purina Pro Plan', 'pui', 7.5, 'senior', 2), -- talie medie
('Purina Pro Plan', 'pui', 7.5, 'senior', 3), -- talie mică
-- Calitate 5
('Pedigree', 'porc', 5, 'puppy', 1), -- talie mare
('Pedigree', 'porc', 5, 'puppy', 2), -- talie medie
('Pedigree', 'porc', 5, 'puppy', 3), -- talie mică
('Pedigree', 'porc', 5, 'adult', 1), -- talie mare
('Pedigree', 'porc', 5, 'adult', 2), -- talie medie
('Pedigree', 'porc', 5, 'adult', 3), -- talie mică
('Pedigree', 'porc', 5, 'senior', 1), -- talie mare
('Pedigree', 'porc', 5, 'senior', 2), -- talie medie
('Pedigree', 'porc', 5, 'senior', 3), -- talie mică
('Pedigree', 'vită', 5, 'puppy', 1), -- talie mare
('Pedigree', 'vită', 5, 'puppy', 2), -- talie medie
('Pedigree', 'vită', 5, 'puppy', 3), -- talie mică
('Pedigree', 'vită', 5, 'adult', 1), -- talie mare
('Pedigree', 'vită', 5, 'adult', 2), -- talie medie
('Pedigree', 'vită', 5, 'adult', 3), -- talie mică
('Pedigree', 'vită', 5, 'senior', 1), -- talie mare
('Pedigree', 'vită', 5, 'senior', 2), -- talie medie
('Pedigree', 'vită', 5, 'senior', 3), -- talie mică
('Pedigree', 'curcan', 5, 'puppy', 1), -- talie mare
('Pedigree', 'curcan', 5, 'puppy', 2), -- talie medie
('Pedigree', 'curcan', 5, 'puppy', 3), -- talie mică
('Pedigree', 'curcan', 5, 'adult', 1), -- talie mare
('Pedigree', 'curcan', 5, 'adult', 2), -- talie medie
('Pedigree', 'curcan', 5, 'adult', 3), -- talie mică
('Pedigree', 'curcan', 5, 'senior', 1), -- talie mare
('Pedigree', 'curcan', 5, 'senior', 2), -- talie medie
('Pedigree', 'curcan', 5, 'senior', 3), -- talie mică
('Pedigree', 'pui', 5, 'puppy', 1), -- talie mare
('Pedigree', 'pui', 5, 'puppy', 2), -- talie medie
('Pedigree', 'pui', 5, 'puppy', 3), -- talie mică
('Pedigree', 'pui', 5, 'adult', 1), -- talie mare
('Pedigree', 'pui', 5, 'adult', 2), -- talie medie
('Pedigree', 'pui', 5, 'adult', 3), -- talie mică
('Pedigree', 'pui', 5, 'senior', 1), -- talie mare
('Pedigree', 'pui', 5, 'senior', 2), -- talie medie
('Pedigree', 'pui', 5, 'senior', 3), -- talie mică
-- Calitate 2.5
('Chappi', 'porc', 2.5, 'puppy', 1), -- talie mare
('Chappi', 'porc', 2.5, 'puppy', 2), -- talie medie
('Chappi', 'porc', 2.5, 'puppy', 3), -- talie mică
('Chappi', 'porc', 2.5, 'adult', 1), -- talie mare
('Chappi', 'porc', 2.5, 'adult', 2), -- talie medie
('Chappi', 'porc', 2.5, 'adult', 3), -- talie mică
('Chappi', 'porc', 2.5, 'senior', 1), -- talie mare
('Chappi', 'porc', 2.5, 'senior', 2), -- talie medie
('Chappi', 'porc', 2.5, 'senior', 3), -- talie mică
('Chappi', 'vită', 2.5, 'puppy', 1), -- talie mare
('Chappi', 'vită', 2.5, 'puppy', 2), -- talie medie
('Chappi', 'vită', 2.5, 'puppy', 3), -- talie mică
('Chappi', 'vită', 2.5, 'adult', 1), -- talie mare
('Chappi', 'vită', 2.5, 'adult', 2), -- talie medie
('Chappi', 'vită', 2.5, 'adult', 3), -- talie mică
('Chappi', 'vită', 2.5, 'senior', 1), -- talie mare
('Chappi', 'vită', 2.5, 'senior', 2), -- talie medie
('Chappi', 'vită', 2.5, 'senior', 3), -- talie mică
('Chappi', 'curcan', 2.5, 'puppy', 1), -- talie mare
('Chappi', 'curcan', 2.5, 'puppy', 2), -- talie medie
('Chappi', 'curcan', 2.5, 'puppy', 3), -- talie mică
('Chappi', 'curcan', 2.5, 'adult', 1), -- talie mare
('Chappi', 'curcan', 2.5, 'adult', 2), -- talie medie
('Chappi', 'curcan', 2.5, 'adult', 3), -- talie mică
('Chappi', 'curcan', 2.5, 'senior', 1), -- talie mare
('Chappi', 'curcan', 2.5, 'senior', 2), -- talie medie
('Chappi', 'curcan', 2.5, 'senior', 3), -- talie mică
('Chappi', 'pui', 2.5, 'puppy', 1), -- talie mare
('Chappi', 'pui', 2.5, 'puppy', 2), -- talie medie
('Chappi', 'pui', 2.5, 'puppy', 3), -- talie mică
('Chappi', 'pui', 2.5, 'adult', 1), -- talie mare
('Chappi', 'pui', 2.5, 'adult', 2), -- talie medie
('Chappi', 'pui', 2.5, 'adult', 3), -- talie mică
('Chappi', 'pui', 2.5, 'senior', 1), -- talie mare
('Chappi', 'pui', 2.5, 'senior', 2), -- talie medie
('Chappi', 'pui', 2.5, 'senior', 3); -- talie mică

-- Insert a new location for Paris, France
INSERT INTO [Locatie] (tara, regiune, oras, strada, numar, alte_detalii)
VALUES
('France', 'Ile-de-France', 'Paris', 'Rue de la Paix', 5, 'Apartment 3');


-- Insert Francais as a new person from Paris, France, who owns Bella
INSERT INTO [Persoana] (nume, prenume, locatie_id, telefon)
VALUES (
  'Francais', 
  'Francais', 
  (SELECT [id] FROM [Locatie] WHERE tara = 'France' AND oras = 'Paris' AND strada = 'Rue de la Paix' AND numar = 5), 
  '+33123456789'
);

-- Insert the ownership record for Francais and Bella
INSERT INTO [CaineDetinator] ([id_caine], [id_detinator], [an_achizitie])
VALUES (
  (SELECT [id] FROM [Caine] WHERE [nume] = 'Bella'),
  (SELECT [id] FROM [Persoana] WHERE nume = 'Francais' AND prenume = 'Francais'),
  '2022-07-08'
);