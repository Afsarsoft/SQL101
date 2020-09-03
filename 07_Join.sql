-- Using AdventureWorks2019 DB
USE AdventureWorks2019

-- INNER JOIN (default join)
-- Rows shared beween tables
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person;

SELECT BusinessEntityID, PhoneNumber
FROM Person.PersonPhone
WHERE BusinessEntityID = 293;

SELECT A.BusinessEntityID
      , A.FirstName
   , A.LastName
   , B.PhoneNumber
FROM Person.Person AS A
   INNER JOIN
   Person.PersonPhone AS B
   ON A.BusinessEntityID = B.BusinessEntityID;

-- LEFT OUTER JOIN
-- All rows from table left regradless of matching rows   
-- For not matching rows, we get NULL columns from left table  
SELECT P.BusinessEntityID
   , P.PersonType
   , P.FirstName
   , P.LastName
   , E.JobTitle
FROM Person.Person AS P
   LEFT OUTER JOIN
   HumanResources.Employee AS E
   ON P.BusinessEntityID = E.BusinessEntityID;

-- RIGHT OUTER JOIN
-- All rows from table right regradless of matching rows
-- For not matching rows, we get NULL columns from right table  

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






