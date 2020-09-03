-- In Sub Queries, select queries run inside other queries 
-- Sub Queries run first and return values being used in the outer query (main query)

-- Using AdventureWorks2019 DB
USE AdventureWorks2019

-- The top moneymakers
SELECT BusinessEntityID
   , SalesYTD
FROM Sales.SalesPerson
ORDER BY SalesYTD DESC;

-- We need to find out how far each sales person is away from top position

-- Highest Sales Figure
SELECT TOP 1
   SalesYTD
FROM Sales.SalesPerson
ORDER BY SalesYTD DESC;
-- Or 
-- A little faster since no need to sort 
SELECT MAX(SalesYTD)
FROM Sales.SalesPerson

-- Here is the final query, how far each sales person is away from top position
SELECT BusinessEntityID
   , SalesYTD
   , (SELECT MAX(SalesYTD)
   FROM Sales.SalesPerson) AS HighestSalesYTD
   , (SELECT MAX(SalesYTD)
   FROM Sales.SalesPerson) - SalesYTD AS SalesGap
FROM Sales.SalesPerson
ORDER BY SalesYTD DESC;

-- Total value of each sales order more than 20000
-- Here we are hard coding the value
SELECT SalesOrderID, SUM(LineTotal) AS OrderTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 20000;

-- We want to see only the orders that are above average 
-- First need to create the average query 
-- The following gives us the totals, we need the average of these results 
SELECT SUM(LineTotal) AS myValues
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

-- Now average value of the above query as a single number 
SELECT AVG(ResultTable.myValues) AS AverageValue
FROM
   (SELECT SUM(LineTotal) AS myValues
   FROM Sales.SalesOrderDetail
   GROUP BY SalesOrderID) AS ResultTable;

-- Now we take the above and use it in HAVING clause of original query 
-- Sub queries can also be used in the WHERE or HAVING clauses 
-- Here is, only the orders that are above average 
SELECT SalesOrderID, SUM(LineTotal) AS OrderTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > (
   SELECT AVG(ResultTable.myValues) AS AverageValue
FROM
   (SELECT SUM(LineTotal) AS myValues
   FROM Sales.SalesOrderDetail
   GROUP BY SalesOrderID) AS ResultTable);

-- For above, we had to use two nested subqueries 
-- One to group ans sum the values and another to find the average value
-- In summary, always work from inside out one step at a time and reviewing the results at each stage.











