-- More Info 
-- https://docs.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql?view=sql-server-ver15 

-- Using Northwind
USE Northwind

-- What we are interested 
SELECT OrderDate, ShipVia
FROM dbo.Orders

-- DISTINCT Help us to identify the duplicates 
SELECT DISTINCT OrderDate, ShipVia
FROM dbo.Orders

-- Number of duplicates 
SELECT OrderDate, COUNT(1) TotalOrderDate
FROM dbo.Orders WITH (NOLOCK)
Group BY OrderDate
Having Count(1) > 1
-- OR
SELECT OrderDate, COUNT(*) TotalOrderDate
FROM dbo.Orders WITH (NOLOCK)
Group BY OrderDate
Having Count(*) > 1


