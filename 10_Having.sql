-- Using Northwind DB
USE Northwind

SELECT UnitsOnOrder, COUNT(*) AS Count
FROM dbo.Products
WHERE UnitsOnOrder <> 0
GROUP BY UnitsOnOrder;

SELECT UnitsOnOrder, COUNT(*) AS Count
FROM dbo.Products
WHERE UnitsOnOrder <> 0
GROUP BY UnitsOnOrder
HAVING COUNT(*) > 2;

SELECT UnitsOnOrder, COUNT(*) AS Count
FROM dbo.Products
WHERE UnitsOnOrder <> 0
GROUP BY UnitsOnOrder
HAVING COUNT(*) > 2;
-- HAVING Count > 2;
-- The above will not work, because alias is not ready for query engine yet. So need repeat the aggrgate 
