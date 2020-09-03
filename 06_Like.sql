-- More Info
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/like-transact-sql?view=sql-server-ver15

-- Using Northwind DB
USE Northwind

-- Focus on CompanyName 
SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CompanyName LIKE 'A%';

SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CompanyName LIKE '%A';

SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CompanyName LIKE '%A%';

SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CompanyName LIKE '[ABC]%';

SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CompanyName LIKE '[ABC]%';

-- Focus on CustomerID 
SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CustomerID LIKE 'A____';

SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CustomerID LIKE 'A[LMNOPQRS]___';
-- Same as above
SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers
WHERE CustomerID LIKE 'A[L-S]___';

