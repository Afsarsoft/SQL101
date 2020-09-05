-- In Sub Queries, select queries run inside other queries 
-- Inner query run first and return values being used in the outer query (main query)
-- https://www.geeksforgeeks.org/sql-join-vs-subquery/

-- Using Northwind DB
USE Northwind

-- Expensive products
SELECT ProductID,
    ProductName,
    UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC;

-- We need to find out how far each product is away from the most expensive product

-- Highest Expensive product
SELECT TOP 1
    UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC;
-- Or, a little faster since no need to sort 
SELECT MAX(UnitPrice)
FROM dbo.Products

-- Here is the final query, how far each product is away from the most expensive product
SELECT ProductID,
    ProductName,
    UnitPrice,

    (SELECT MAX(UnitPrice)
    FROM dbo.Products) AS HighestProduct,

    (SELECT MAX(UnitPrice)
    FROM dbo.Products) - UnitPrice AS PriceGap

FROM dbo.Products
ORDER BY UnitPrice DESC;

-- Total value of each order more than 350
-- Here we are hard coding the value
SELECT OrderID, SUM(UnitPrice) AS OrderTotal
FROM dbo.[Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice) > 350;

-- We want to see only the orders that are above average 
-- First need to create the average query 
-- The following gives us the totals, we need the average of these results 
SELECT SUM(UnitPrice) AS myValues
FROM dbo.[Order Details]
GROUP BY OrderID

-- Now average value of the above query as a single number 
SELECT AVG(ResultTable.myValues) AS AverageValue
FROM
    (SELECT SUM(UnitPrice) AS myValues
    FROM dbo.[Order Details]
    GROUP BY OrderID) AS ResultTable;


-- Now we take the above and use it in HAVING clause of original query 
-- Sub queries can also be used in the WHERE or HAVING clauses 
-- Here is, only the orders that are above average 
SELECT OrderID, SUM(UnitPrice) AS OrderTotal
FROM dbo.[Order Details]
GROUP BY OrderID
HAVING SUM(UnitPrice) > ( 
    SELECT AVG(ResultTable.myValues) AS AverageValue
FROM
    (SELECT SUM(UnitPrice) AS myValues
    FROM dbo.[Order Details]
    GROUP BY OrderID) AS ResultTable);

-- For above, we had to use two nested subqueries 
-- One to group ans sum the values and another to find the average value
-- In summary, always work from inside out one step at a time and reviewing the results at each stage.