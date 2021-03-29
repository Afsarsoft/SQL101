-- Using Northwind DB
USE Northwind

SELECT 'Hello World!'

SELECT 1;

SELECT 'Sam', 1;

SELECT ProductId, ProductName
FROM dbo.Products;

-- Getting everything, getting all rows and all columns without filter 
-- Avoid using it, be always specific 
SELECT *
FROM dbo.Products;

-- Having a filter
SELECT *
FROM dbo.Products
WHERE SupplierId = 1;

-- Having more filters 
SELECT *
FROM dbo.Products
WHERE SupplierId = 1 AND CategoryID = 2;

SELECT *
FROM dbo.Products
WHERE SupplierId IN (1, 2);

-- default sort order 
SELECT ProductId, ProductName
FROM dbo.Products
ORDER BY ProductName ASC;

SELECT ProductId, ProductName
FROM dbo.Products
ORDER BY ProductName DESC;

-- Aliasing the columns 
SELECT ProductId AS 'Product ID', ProductName AS 'Product Name'
FROM dbo.Products;

-- Adding extra column to provide more info
SELECT ProductId AS 'Product ID', ProductName AS 'Product Name', 'Healthy' AS Type
FROM dbo.Products;

SELECT ProductId AS 'Product ID', ProductName AS 'Product Name', UnitPrice
FROM dbo.Products
WHERE UnitPrice > 20;

-- %15  discount
SELECT ProductId AS 'Product ID', ProductName AS 'Product Name', UnitPrice, UnitPrice * .85 AS SalesPrice
FROM dbo.Products
WHERE UnitPrice > 20;
