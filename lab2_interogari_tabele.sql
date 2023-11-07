USE [Dogs]

/*
min 5 where - 3
min 3 group by - 1
min 2 distinct - 1
min 2 having - 2
min 7 ? from min 2 tables - 2
min 2 ? from m-n tables - 0

exactly 10 ? - 2
*/

-- Extrage toti cainii care sunt maidanezi
SELECT * FROM [Caini] WHERE [rasa_id] = (SELECT [id] FROM [Rasa] WHERE [denumire] = 'Maidanez')

-- Numarul de caini din fiecare rasa din baza de date
SELECT 
    (SELECT [denumire] FROM [Rasa] WHERE [id] = (SELECT DISTINCT [rasa_id] FROM [Caine])) as [breed], 
    COUNT(*) as [dog count]
FROM [Caine] 
GROUP BY [Caine].[rasa_id]