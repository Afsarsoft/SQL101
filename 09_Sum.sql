-- Using AdventureWorks2019 DB
USE AdventureWorks2019

SELECT SalesOrderID
   , SUM(LineTotal) AS [Order Total]
   , SUM(OrderQty) AS [Number Of Items]
   , COUNT(DISTINCT ProductID) AS [Unique Items]
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY [Order Total] DESC;

SELECT ProductID
   , SUM(OrderQty) AS [Total Qty Sold]
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY [Total Qty Sold] DESC;

SELECT S.ProductID
   , P.Name
   , SUM(S.OrderQty) AS [Total Qty Sold]
FROM Sales.SalesOrderDetail AS S
   INNER JOIN Production.Product AS P
   ON S.ProductID = P.ProductID
GROUP BY S.ProductID, P.Name
ORDER BY [Total Qty Sold] DESC;
