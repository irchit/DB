USE [DBDogs]

/*
min 5 where - 4
min 3 group by - 3 ok
min 2 distinct - 1
min 2 having - 1
min 7 ? from min 2 tables - 4
min 2 ? from m-n tables - 3

exactly 10 ? - 7
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
