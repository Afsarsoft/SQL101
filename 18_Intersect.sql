-- We can use INTERSECT operator to find rows that are identical between two queries 
SELECT *
FROM Production.ProductProductPhoto;

SELECT *
FROM Production.ProductReview;

-- 
-- Display all of the product IDs that are attached to a photo
     SELECT ProductID
         , 

     FROM Production.ProductProductPhoto

INTERSECT

     -- All of the product IDs that are referenced in a review 
     SELECT ProductID
     FROM Production.ProductReview;

-- Result would be at least one photo and and one review each

-- Using JOIN
SELECT DISTINCT A.ProductID
FROM Production.ProductProductPhoto AS A
     INNER JOIN Production.ProductReview AS B
     ON A.ProductID = B.ProductID;
