-- Using AdventureWorks2019 DB
USE AdventureWorks2019 -- 
DECLARE @MyFirstVar INT;
SET @MyFirstVar = 5;
SELECT @MyFirstVar AS MyValue,
     @MyFirstVar * 5 AS Multi,
     @MyFirstVar + 10 AS Addition;
-- 
DECLARE @Color VARCHAR(20) = 'Blue';
SELECT ProductID,
     Name,
     ProductNumber,
     Color,
     ListPrice
FROM Production.Product
WHERE Color = @Color;
-- 
DECLARE @Counter INT = 1;
WHILE @Counter <= 5 BEGIN
SELECT @Counter AS CurrentValue
SET @Counter = @Counter + 1
END -- 
DECLARE @Count INT = 1;
DECLARE @Product INT = 710;
WHILE @Count <= 5 BEGIN
SELECT ProductID,
     Name,
     ProductNumber,
     Color,
     ListPrice
FROM Production.Product
WHERE ProductID = @Product;
SET @Count = @Count + 1
SET @Product = @Product + 10
END