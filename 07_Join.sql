-- Using Northwind DB
USE Northwind

-- Good read
-- https://www.sqlshack.com/sql-multiple-joins-for-beginners-with-examples/
-- https://stackoverflow.com/questions/3308122/how-do-i-decide-when-to-use-right-joins-left-joins-or-inner-joins-or-how-to-dete/

-- INNER JOIN (default join)
-- Rows shared beween tables
SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers;

SELECT OrderID, CustomerID, OrderDate
FROM dbo.Orders
WHERE CustomerID = 'ALFKI';

-- All Customers with Orders
SELECT O.OrderID,
   O.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   INNER JOIN
   dbo.Orders AS O
   ON O.CustomerID = C.CustomerID;
-- (830 rows affected)

-- LEFT OUTER JOIN
-- All rows from table left regradless of matching rows   
-- For not matching rows, we get NULL columns from left table
-- https://tutorialdeep.com/sql/sql-left-outer-join/ 
-- https://www.w3schools.com/sql/sql_join_left.asp

-- All Customers with or without Orders (OK to have no orders) 
SELECT O.OrderID,
   O.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   LEFT OUTER JOIN
   dbo.Orders AS O
   ON C.CustomerID = O.CustomerID;
--    (832 rows affected)

-- Customers who have no orders
SELECT O.OrderID,
   O.CustomerID,
   C.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   LEFT OUTER JOIN
   dbo.Orders AS O
   ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;
--    (2 rows affected)

-- https://blog.sqlauthority.com/2008/04/22/sql-server-better-performance-left-join-or-not-in/
-- Doing above using NOT IN
SELECT CustomerID,
   CompanyName,
   ContactName
FROM dbo.Customers
WHERE CustomerID 
NOT IN (SELECT CustomerID
FROM dbo.Orders);
--    (2 rows affected)

SELECT COUNT(DISTINCT CustomerID)
FROM Customers
-- 91

SELECT COUNT(DISTINCT CustomerID)
FROM dbo.Orders
-- 89

SELECT O.OrderID,
   O.CustomerID,
   C.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   LEFT OUTER JOIN
   dbo.Orders AS O
   ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL
   OR C.CustomerID IS NULL;
--    (2 rows affected)

-- RIGHT OUTER JOIN
-- All rows from table right regradless of matching rows
-- For not matching rows, we get NULL columns from right table  
-- There is not much using the RIGHT Join. We can always do the LEFT join 
-- https://stackoverflow.com/questions/436345/when-or-why-would-you-use-a-right-outer-join-instead-of-left

-- FULL OUTER JOIN
-- All rows from both tables regradless of matching rows
-- Any row that has no matching from other table will show NULL values for these columns  
SELECT O.OrderID,
   O.CustomerID,
   C.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   FULL OUTER JOIN
   dbo.Orders AS O
   ON C.CustomerID = O.CustomerID

SELECT O.OrderID,
   O.CustomerID,
   C.CustomerID,
   C.CompanyName,
   C.ContactName,
   O.OrderDate
FROM dbo.Customers AS C
   FULL OUTER JOIN
   dbo.Orders AS O
   ON C.CustomerID = O.CustomerID
WHERE O.CustomerID IS NULL;

-- CROSS JOIN
-- Combining every row from one tabel to every row from other table
-- Usefull to plan a game in an organization
-- For example, folks want to play soccer games 
SELECT A.FirstName,
   B.FirstName
FROM dbo.Employees AS A
CROSS JOIN dbo.Employees AS B
WHERE A.FirstName <> B.FirstName;

-- Self join, ideal for Employee Manager situation
SELECT A.EmployeeID, A.FirstName + ' ' + A.LastName AS Employee, B.FirstName + ' ' + B.LastName AS Manager
FROM dbo.Employees AS A
   INNER JOIN dbo.Employees AS B
   ON A.ReportsTo = B.EmployeeID
ORDER BY Manager

SELECT EmployeeID, FirstName, LastName, ReportsTo
FROM dbo.Employees
