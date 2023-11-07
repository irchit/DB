USE [DBDogs]

/*
min 5 where - 5 ok
min 3 group by - 4 ok
min 2 distinct - 2 ok
min 2 having - 2 ok
min 7 ? from min 2 tables - 7 ok 
min 2 ? from m-n tables - 4 ok

exactly 10 ? - 10 ok
*/

-- 1. Extrage toti cainii care sunt maidanezi
SELECT 
    Caine.id as ID,
	Caine.nume as Name
FROM [dbo].[Caine] 
WHERE [rasa_id] = (SELECT [id] FROM [dbo].[Rasa] WHERE [denumire] = 'Maidanez');

-- 2. Numarul de caini din fiecare rasa din baza de date
SELECT 
    dbo.Rasa.denumire AS Breed, 
    COUNT(dbo.Caine.id) AS NumberOfDogs
FROM dbo.Rasa
INNER JOIN dbo.Caine ON dbo.Rasa.id = dbo.Caine.rasa_id
GROUP BY dbo.Rasa.denumire;


-- 3. Numar caini dintr-o canisa
SELECT 
    Canisa.denumire AS Kennel, 
    COUNT(Caine.id) AS NumberOfDogs
FROM Canisa
INNER JOIN CaineDetinator ON Canisa.proprietar_id = CaineDetinator.id_detinator
INNER JOIN Caine ON CaineDetinator.id_caine = Caine.id
GROUP BY Canisa.denumire
HAVING COUNT(Caine.id) >= 1;

-- 4. Cainii in ordine alfabetica care au maxim 2 ani
SELECT 
    C.id as ID,
	C.nume as Name
FROM Caine C
WHERE
	DATEDIFF(YEAR, C.data_nastere, GETDATE()) < 2 OR
	(DATEDIFF(YEAR, C.data_nastere, GETDATE()) = 2 
	AND DATEDIFF(MONTH, C.data_nastere, GETDATE()) <= 0
	AND DATEDIFF(DAY, C.data_nastere, GETDATE()) <= 0)
ORDER BY C.nume;

-- 5. Cainii din Romania
SELECT 
	C.nume AS DogName, 
	P.nume AS OwnerName, 
	P.prenume AS OwnerSurname
FROM Caine C
JOIN CaineDetinator CD ON C.id = CD.id_caine
JOIN Persoana P ON CD.id_detinator = P.id
WHERE P.locatie_id IN (SELECT id FROM Locatie WHERE tara = 'Romania')
ORDER BY OwnerName, OwnerSurname;

-- 6. Numar de tari din baza de date
SELECT DISTINCT Locatie.tara as Country 
FROM Locatie;

-- 7. Pret mediu a unui Airedale Terrier pe tari
SELECT
    L.tara AS Country,
    AVG(C.pret) AS [Average Airedale Terrier Price]
FROM Caine C
JOIN CaineDetinator CD ON C.id = CD.id_caine
JOIN Persoana P ON CD.id_detinator = P.id
JOIN Locatie L ON P.locatie_id = L.id
WHERE 
	C.rasa_id = (
		SELECT 
			id 
		FROM Rasa 
		WHERE denumire = 'Airedale Terrier'
	)
GROUP BY L.tara
ORDER BY [Average Airedale Terrier Price];

-- 8. Numar de Caini cu minim 65% culoare neagra
SELECT
	CONVERT(VARCHAR, CC.procent_culoare*100) + '%' as [Color %],
	COUNT(C.id) as [Number of Black Dogs that are minimum 65% black]
FROM Caine C
JOIN CuloareCaine CC ON C.id = CC.id_caine
JOIN Culoare Col ON Col.id = CC.id_culoare
WHERE
	CC.id_culoare = (
		SELECT Col.id 
		FROM Culoare Col 
		WHERE 
			Col.culoare = 'negru'
	)
GROUP BY CC.procent_culoare
HAVING CC.procent_culoare >= 0.65
ORDER BY CC.procent_culoare DESC;

-- 9. Lista de Rase si culori in procent distincte (pentru a obtine filtre)
SELECT DISTINCT 
	R.denumire as Breed,
	Col.culoare as Color,
	CONVERT(VARCHAR, CC.procent_culoare*100) + '%' as [Color %]
FROM Caine C
JOIN Rasa R ON C.rasa_id = R.id
JOIN CuloareCaine CC ON CC.id_caine = C.id
JOIN Culoare Col ON Col.id = CC.id_culoare
ORDER BY COLOR DESC, [Color %] DESC, Breed DESC;

-- 10. Toate Marcile De Hrana cu un scor strict mai mare ca 6 pentru Talie medie care sa fie de vita sau pui
SELECT
	H.denumire as Name,
	H.carne as [Meat Type],
	H.calitate as [Grade out of 10],
	H.varsta as Age
FROM Hrana H
WHERE
	H.talie_id = (
		SELECT T.id 
		FROM Talie T 
		WHERE T.tip = 'medie'
	) AND
	H.calitate > 6 AND
	(H.carne = 'vită' OR H.carne = 'pui')
ORDER BY H.carne ASC, H.calitate DESC;

