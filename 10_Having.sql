-- Using AdventureWorks2019 DB
USE AdventureWorks2019

SELECT Color, COUNT(*) AS [Number Of Products]
FROM Production.Product
WHERE Color is NOT NULL
GROUP BY Color;

-- Only colors with more than 25 products
SELECT Color, COUNT(*) AS [Number Of Products]
FROM Production.Product
WHERE Color is NOT NULL
GROUP BY Color
HAVING COUNT(*) > 25;
-- HAVING NumberOfProducts > 25;
-- The above will not work, because alias is not ready for query engine yet. So need repeat the aggrgate 

