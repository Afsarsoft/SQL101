-- Using Northwind DB
USE Northwind

SELECT FirstName,
    UPPER(FirstName) AS UpperCaseFirstName,
    LEN(FirstName) AS LengthOfFirstName,
    LastName,
    LOWER(LastName) AS LowerCaseLastName,
    LEFT(LastName, 3) AS First3LettersLastName,
    RIGHT(LastName, 3) AS Last3LettersLastName,
    TRIM(LastName) AS TrimmedLastName
FROM dbo.Employees;

SELECT FirstName,
    LastName,
    CONCAT(FirstName, ' ', LastName) As FullName1,
    -- Better approach   
    CONCAT_WS(' ', FirstName, LastName) As FullName2
FROM dbo.Employees;

SELECT CONCAT_WS(' ', FirstName, LastName) As FullName,
    HireDate,
    YEAR(HireDate) AS [Hier Year],
    MONTH(HireDate) AS [Hier Month],
    DAY(HireDate) AS [Hier Day]
FROM dbo.Employees;

SELECT YEAR(HireDate) AS [Hier Year],
    COUNT(*) AS Count
FROM dbo.Employees
GROUP BY YEAR(HireDate);

-- Current Date
SELECT GETDATE()
SELECT GETUTCDATE()

SELECT CONCAT_WS(' ', FirstName, LastName) As FullName,
    HireDate,
    DATEDIFF(day, HireDate, GETDATE()) AS [Days Since Hire]
FROM dbo.Employees;

SELECT CONCAT_WS(' ', FirstName, LastName) As FullName,
    HireDate,
    DATEDIFF(year, HireDate, GETDATE()) AS [Years Since Hire],
    -- 30 Year Anniversary
    DATEADD(year, 30, HireDate) AS [Anniversary Date]
FROM dbo.Employees;

SELECT CONCAT_WS(' ', FirstName, LastName) As FullName,
    HireDate,
    FORMAT(HireDate, 'dddd') AS [Hier Day],
    FORMAT(HireDate, 'dddd, MMMM dd, yyyy') AS HierDateF1,
    FORMAT(HireDate, 'd-MMM') AS HierDateF2
FROM dbo.Employees;

-- Getting random rows
-- Useful for audit
-- In SQL server, the random functions are rand(), newid(), where Rand is random access from 0 to 1, and newid is the unique identifier that generates random uniqueidentifier.
SELECT EmployeeID
FROM dbo.Employees;

SELECT EmployeeID
   , NEWID() AS [Random Number]
   , RAND() AS [Random Number2]
-- not useful in this context since will get same value for all rows
FROM dbo.Employees
ORDER BY [Random Number];

SELECT TOP 5
    EmployeeID
   , NEWID() AS [Random Number]
FROM dbo.Employees
ORDER BY [Random Number];

-- IIF 
-- Like IF THEN ELSE
SELECT ProductID,
    ProductName,
    UnitsInStock
FROM dbo.Products;

SELECT ProductID,
    ProductName,
    UnitsInStock,
    IIF(UnitsInStock > 10, 'No need to order', 'Need to order') AS Status
FROM dbo.Products;

SELECT IIF(UnitsInStock > 10, 'No need to order', 'Need to order') AS Status,
    COUNT(*) AS Count
FROM dbo.Products
GROUP BY IIF(UnitsInStock > 10, 'No need to order', 'Need to order');
