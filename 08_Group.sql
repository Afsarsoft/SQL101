-- Using Northwind DB
USE Northwind

SELECT City, CompanyName
FROM dbo.Customers
GROUP BY City, CompanyName
ORDER BY City;

