-- Using Northwind DB
USE Northwind

-- Consider the following two queries:
SELECT CustomerID, CompanyName, ContactName
FROM dbo.Customers;

SELECT OrderID, CustomerID
FROM dbo.Orders;

-- If we want to see all the info togther, we can use INNER JOIN as follow:
SELECT C.CustomerID,
    C.CompanyName,
    C.ContactName,
    O.OrderID
FROM dbo.Customers AS C
    INNER JOIN
    dbo.Orders AS O
    ON C.CustomerID = O.CustomerID;

-- Using correlates sub query, sometimes can give us a better result
-- This gives us a LEFT OUTER JOIN, we get NULLs for OrderID 
SELECT C.CustomerID,
    C.CompanyName,
    C.ContactName,
    (SELECT MAX(O.OrderID)
    FROM dbo.Orders AS O
    WHERE C.CustomerID = O.CustomerID) AS OrderID
FROM dbo.Customers AS C
ORDER BY OrderID;
