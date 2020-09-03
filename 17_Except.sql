-- Like UNION, EXCEPT operator will merge two query result sets together.
-- However, EXCEPT only returns distinct rows from the first query that 
-- arent present in the second 

-- All people that don't have credit cards 
SELECT *
FROM Person.Person

SELECT *
FROM Sales.PersonCreditCard;

-- Returns all IDs for everyone that are not employee 
     SELECT BusinessEntityID
     FROM Person.Person
     WHERE PersonType <> 'EM'

EXCEPT
     -- Returns only IDs for people that have credit cards   
     SELECT BusinessEntityID
     FROM Sales.PersonCreditCard;

-- Using join
SELECT P.BusinessEntityID
FROM Person.Person AS P
     LEFT OUTER JOIN Sales.PersonCreditCard AS S
     ON P.BusinessEntityID = S.BusinessEntityID
WHERE P.PersonType <> 'EM' AND S.CreditCardID IS NULL;





