-- Using AdventureWorks2019 DB
USE AdventureWorks2019

-- Using the pivot operator, we can rotate the results so the data is 
-- displayed in a column format. 
-- Usefull for adding to a speadsheet or some UI.

SELECT ProductLine, AVG(ListPrice) AS AveragePrice
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine;

-- To rotate the rsults, so the ProductLine be on columns
SELECT 'Average List Price' AS [Product Line]
   , M, R, S, T
FROM (SELECT ProductLine, ListPrice
   FROM Production.Product) AS SourceData
PIVOT (AVG(ListPrice) FOR ProductLine IN (M, R, S, T)) AS PivotTable;


