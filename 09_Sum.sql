-- Using Northwind DB
USE Northwind

SELECT OrderID,
    SUM(UnitPrice) AS [Order Total],
    SUM(Quantity) AS [Number Of Items],
    COUNT(DISTINCT ProductID) AS [Unique Items]
FROM dbo.[Order Details]
GROUP BY OrderID
ORDER BY [Order Total] DESC;

SELECT ProductID,
    SUM(Quantity) AS [Total Quantity Sold]
FROM dbo.[Order Details]
GROUP BY ProductID
ORDER BY [Total Quantity Sold] DESC;

SELECT O.ProductID,
    P.ProductName,
    SUM(Quantity) AS [Total Quantity Sold]
FROM dbo.[Order Details] AS O
    INNER JOIN dbo.Products AS P
    ON O.ProductID = P.ProductID
GROUP BY O.ProductID, P.ProductName
ORDER BY [Total Quantity Sold] DESC;


