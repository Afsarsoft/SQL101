-- More Info
-- https://docs.microsoft.com/en-us/sql/t-sql/queries/is-null-transact-sql?view=sql-server-ver15

-- Using Northwind DB
USE Northwind

-- NULL values for Region
SELECT CustomerID, CompanyName, Region
FROM dbo.Customers;

SELECT CustomerID, CompanyName, Region
FROM dbo.Customers
WHERE Region IS NOT NULL

SELECT CustomerID, CompanyName, Region
FROM dbo.Customers
WHERE Region IS NULL

SELECT CustomerID, CompanyName, ISNULL(Region, 'Missing!') AS Region
FROM dbo.Customers
