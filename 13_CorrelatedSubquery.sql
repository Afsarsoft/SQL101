-- Using AdventureWorks2019 DB
USE AdventureWorks2019

-- Consider the following two queries:
SELECT BusinessEntityID, FirstName, LastName
FROM Person.Person;

SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee;

-- If we want to see all the info togther, we can use INNER JOIN as follow:
SELECT P.BusinessEntityID
   , P.FirstName
   , P.LastName
   , E.JobTitle
FROM Person.Person AS P
   INNER JOIN
   HumanResources.Employee AS E
   ON P.BusinessEntityID = E.BusinessEntityID;

-- Using correlates sub query, sometimes can give us a better result
-- This gives us a LEFT OUTER JOIN, we get NULLs for JobTitle 
SELECT BusinessEntityID
   , FirstName
   , LastName
   , (SELECT JobTitle
   FROM HumanResources.Employee
   WHERE BusinessEntityID = P.BusinessEntityID) AS JobTitle
FROM Person.Person AS P;

-- To get the correct results, we need to remove the NULLs;
SELECT BusinessEntityID
   , FirstName
   , LastName
   , (SELECT JobTitle
   FROM HumanResources.Employee
   WHERE BusinessEntityID = P.BusinessEntityID) AS JobTitle
FROM Person.Person AS P
WHERE (SELECT JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID = P.BusinessEntityID) IS NOT NULL;

-- OR

SELECT BusinessEntityID
   , FirstName
   , LastName
   , (SELECT JobTitle
   FROM HumanResources.Employee
   WHERE BusinessEntityID = P.BusinessEntityID) AS JobTitle
FROM Person.Person AS P
WHERE EXISTS (SELECT JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID = P.BusinessEntityID);

-- Too much work, need to work on this to find a good case for correlated Subquery 


