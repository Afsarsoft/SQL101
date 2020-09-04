-- Using Northwind DB
USE Northwind

-- INNER JOIN (default join)
-- Rows shared beween tables
SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers;

SELECT OrderID, CustomerID, OrderDate
FROM dbo.Orders
WHERE CustomerID = 'ALFKI';

SELECT O.OrderID,
   O.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Orders AS O
   INNER JOIN
   dbo.Customers AS C
   ON O.CustomerID = O.CustomerID;
-- (75530 rows affected)

-- LEFT OUTER JOIN
-- All rows from table left regradless of matching rows   
-- For not matching rows, we get NULL columns from left table 
-- https://tutorialdeep.com/sql/sql-left-outer-join/ 
-- https://stackoverflow.com/questions/3308122/how-do-i-decide-when-to-use-right-joins-left-joins-or-inner-joins-or-how-to-dete/
SELECT O.OrderID,
   O.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   LEFT OUTER JOIN
   dbo.Orders AS O
   ON O.CustomerID = O.CustomerID;
-- (75530 rows affected)

-- RIGHT OUTER JOIN
-- All rows from table right regradless of matching rows
-- For not matching rows, we get NULL columns from right table  
-- There is not much using the RIGHT Join. We can always do the LEFT join 
-- https://stackoverflow.com/questions/436345/when-or-why-would-you-use-a-right-outer-join-instead-of-left

-- FULL OUTER JOIN
-- All rows from both tables regradless of matching rows
-- Any row that has no matching from other table will show NULL values for these columns  

-- CROSS JOIN
-- Combining every row from one tabel to every row from other table
SELECT Name AS [Depatment Name]
FROM HumanResources.Department;

SELECT Name AS [Address Name]
FROM Person.AddressType;

SELECT D.Name AS [Department Name]
   , A.Name AS [Address Name]
FROM HumanResources.Department AS D 
CROSS JOIN
Person.AddressType AS A;

-- Usefull to plan a game in an organization
-- For example, folks want to play soccer games 
SELECT A.Name AS [Department Name]
   , B.Name AS [Department Name]
FROM HumanResources.Department AS A 
CROSS JOIN
HumanResources.Department AS B
WHERE A.Name <> B.Name;






