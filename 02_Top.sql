-- More Info
-- https://docs.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql?view=sql-server-ver15

-- Using Northwind DB
USE Northwind

-- TOP should always be pair with ORDER BY clause to provide meaningfull result each time
SELECT TOP 3
    UnitPrice,
    ProductName
FROM dbo.Products
ORDER BY UnitPrice DESC;

SELECT TOP 50 PERCENT
    UnitPrice,
    ProductName
FROM dbo.Products
ORDER BY UnitPrice;

SELECT TOP 5
    UnitPrice,
    ProductName
FROM dbo.Products
ORDER BY UnitPrice;

-- Incase of ties
SELECT TOP 5 WITH TIES
    UnitPrice,
    ProductName
FROM dbo.Products
ORDER BY UnitPrice;
