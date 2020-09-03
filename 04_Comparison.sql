-- More Info
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/comparison-operators-transact-sql?view=sql-server-ver15

-- Using Northwind DB
USE Northwind

-- Comparison Operators 
SELECT ProductId, ProductName, SupplierID, UnitPrice
FROM dbo.Products
WHERE UnitPrice = 10;

SELECT ProductId, ProductName, SupplierID, UnitPrice
FROM dbo.Products
WHERE UnitPrice > 10;

SELECT ProductId, ProductName, SupplierID, UnitPrice
FROM dbo.Products
WHERE UnitPrice >= 10;

SELECT ProductId, ProductName, SupplierID, UnitPrice
FROM dbo.Products
WHERE UnitPrice >= 10 AND SupplierID = 7;
