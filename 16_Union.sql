-- Using AdventureWorks2019 DB
USE AdventureWorks2019

-- When we have simillar data in two different tables, we can use UNION to add rows from one
-- select statement to the rows returned by a second.

-- Consider the following examples:
SELECT ProductCategoryID
     , Name
FROM Production.ProductCategory;

SELECT ProductSubcategoryID 
     , Name
FROM Production.ProductSubcategory;

-- We can use UNION to see both results in a single result set
-- In UNION the number of columns and the data types in both queries must be same 
     SELECT ProductCategoryID 
          , NULL AS ProductSubCategoryID
          , Name
     FROM Production.ProductCategory
UNION
     SELECT ProductCategoryID
          , ProductSubcategoryID
          , Name
     FROM Production.ProductSubcategory;


