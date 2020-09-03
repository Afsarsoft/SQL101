-- Using AdventureWorks2019 DB
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/functions?view=sql-server-ver15

USE AdventureWorks2019

SELECT FirstName
   , UPPER(FirstName) AS UpperCaseFirstName
   , LEN(FirstName) AS LengthOfFirstName
   , LastName
   , LOWER(LastName) AS LowerCaseLastName
   , LEFT(LastName, 3) AS First3LettersLastName
   , RIGHT(LastName, 3) AS Last3LettersLastName
   , TRIM(LastName) AS TrimmedLastName
FROM Person.Person;

SELECT FirstName
   , LastName
   , CONCAT(FirstName, ' ', MiddleName, ' ', LastName) As FullName1
   -- Bettre approach   
   , CONCAT_WS(' ', FirstName, MiddleName, LastName) As FullName2
FROM Person.Person;

SELECT BusinessEntityID
   , SalesYTD
   , ROUND(SalesYTD, 2) AS Round2
   , ROUND(SalesYTD, -2) AS RoundHunders
   , CEILING(SalesYTD) AS RoundCeiling
   , FLOOR(SalesYTD) AS RoundFloor
FROM Sales.SalesPerson;

SELECT BusinessEntityID
   , HireDate
   , YEAR(HireDate) AS [Hier Year]
   , MONTH(HireDate) AS [Hier Month]
   , DAY(HireDate) AS [Hier Day]
FROM HumanResources.Employee;

SELECT YEAR(HireDate) AS [Hier Year]
   , COUNT(*) AS [New Hires]
FROM HumanResources.Employee
GROUP BY YEAR(HireDate);

-- Current Date
SELECT GETDATE()
SELECT GETUTCDATE()

SELECT BusinessEntityID
   , HireDate
   , DATEDIFF(day, HireDate, GETDATE()) AS [Days Since Hire]
FROM HumanResources.Employee;

SELECT BusinessEntityID
   , HireDate
   , DATEDIFF(year, HireDate, GETDATE()) AS [Years Since Hire]
   -- 10 Year Anniversary
   , DATEADD(year, 10, HireDate) AS [Anniversary Date]
FROM HumanResources.Employee;

SELECT BusinessEntityID
   , HireDate
   , FORMAT(HireDate, 'dddd') AS [Hier Day]
   , FORMAT(HireDate, 'dddd, MMMM dd, yyyy') AS HierDateF1
   , FORMAT(HireDate, 'd-MMM') AS HierDateF2
FROM HumanResources.Employee;

-- Getting random rows
-- Useful for audit 
SELECT WorkOrderID
FROM Production.WorkOrder;

SELECT WorkOrderID
   , NEWID() AS [Random Number]
FROM Production.WorkOrder
ORDER BY [Random Number];

SELECT TOP 10
   WorkOrderID
   , NEWID() AS [Random Number]
FROM Production.WorkOrder
ORDER BY [Random Number];

-- IIF 
-- Like IF THEN ELSE
SELECT BusinessEntityID
   , SalesYTD
FROM Sales.SalesPerson;

SELECT BusinessEntityID
   , SalesYTD
   , IIF(SalesYTD > 2000000, 'Met Sales Goal', 'Has not met goal') AS Status
FROM Sales.SalesPerson;

SELECT IIF(SalesYTD > 2000000, 'Met Sales Goal', 'Has not met goal') AS Status
   , COUNT(*) AS [Total Count]
FROM Sales.SalesPerson
GROUP BY IIF(SalesYTD > 2000000, 'Met Sales Goal', 'Has not met goal');












