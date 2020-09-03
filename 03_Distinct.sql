-- More Info 
-- https://docs.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql?view=sql-server-ver15 

-- Using Northwind
USE Northwind

-- Duplicates 
SELECT OrderDate, ShipVia
FROM dbo.Orders

-- Removing Duplicates 
SELECT DISTINCT OrderDate, ShipVia
FROM dbo.Orders
