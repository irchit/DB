USE [Dogs]

-- Extrage toti cainii care sunt maidanezi
SELECT * FROM [Caini] WHERE [rasa_id] = (SELECT [id] FROM [Rasa] WHERE [denumire] = 'Maidanez')

-- Numarul de caini din fiecare rasa din baza de date
SELECT 
    (SELECT [denumire] FROM [Rasa] WHERE [id] = (SELECT DISTINCT [rasa_id] FROM [Caine])) as [breed], 
    COUNT(*) as [dog count]
FROM [Caine] 
GROUP BY [Caine].[rasa_id]