-- Using AdventureWorks2019 DB
USE AdventureWorks2019

SELECT City, StateProvinceID
FROM Person.Address
GROUP BY City, StateProvinceID
ORDER BY City;

SELECT City, StateProvinceID, COUNT(*) AS [Count Of Address]
FROM Person.Address
GROUP BY City, StateProvinceID
ORDER BY City;

SELECT City, StateProvinceID, COUNT(*) AS [Count Of Address]
FROM Person.Address
GROUP BY City, StateProvinceID
ORDER BY [Count Of Address] DESC;