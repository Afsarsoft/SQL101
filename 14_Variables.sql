-- Using Northwind DB
USE Northwind

DECLARE @MyFirstVar INT;

SET @MyFirstVar = 5;

SELECT @MyFirstVar AS MyValue,
    @MyFirstVar * 5 AS Multi,
    @MyFirstVar + 10 AS Addition;

DECLARE @CategoryID INT = 1;

SELECT ProductID,
    ProductName,
    UnitPrice,
    CategoryID
FROM dbo.Products
WHERE CategoryID = @CategoryID;


-- 
DECLARE @Counter INT = 1;
WHILE @Counter <= 5 BEGIN
    SELECT @Counter AS CurrentValue
    SET @Counter = @Counter + 1
END
-- 

DECLARE @Count INT = 1;
DECLARE @Product INT = 10;
WHILE @Count <= 5 BEGIN
    SELECT ProductID,
        ProductName,
        UnitPrice,
        CategoryID
    FROM dbo.Products
    WHERE ProductID = @Product;
    SET @Count = @Count + 1
    SET @Product = @Product + 10
END