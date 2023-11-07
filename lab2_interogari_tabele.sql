USE [DBDogs]

/*
min 5 where - 2
min 3 group by - 2
min 2 distinct - 0
min 2 having - 1
min 7 ? from min 2 tables - 3
min 2 ? from m-n tables - 1

exactly 10 ? - 2
*/

-- Extrage toti cainii care sunt maidanezi
SELECT 
    * 
    FROM [dbo].[Caine] 
    WHERE [rasa_id] = (SELECT [id] FROM [dbo].[Rasa] WHERE [denumire] = 'Maidanez');

-- Numarul de caini din fiecare rasa din baza de date
SELECT 
    dbo.Rasa.denumire AS Breed, 
    COUNT(dbo.Caine.id) AS NumberOfDogs
FROM dbo.Rasa
INNER JOIN dbo.Caine ON dbo.Rasa.id = dbo.Caine.rasa_id
GROUP BY dbo.Rasa.denumire;


-- Numar caini dintr-o canisa
SELECT 
    Canisa.denumire AS Kennel, 
    COUNT(Caine.id) AS NumberOfDogs
FROM Canisa
INNER JOIN CaineDetinator ON Canisa.proprietar_id = CaineDetinator.id_detinator
INNER JOIN Caine ON CaineDetinator.id_caine = Caine.id
GROUP BY Canisa.denumire
HAVING COUNT(Caine.id) >= 1;

