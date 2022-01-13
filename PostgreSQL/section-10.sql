SELECT companyname
FROM customers
UNION
SELECT companyname
FROM suppliers;

SELECT city
FROM customers
UNION ALL
SELECT city
FROM suppliers;

SELECT country
FROM customers
UNION
SELECT country
FROM suppliers
ORDER BY country ASC;

SELECT country
FROM customers
UNION ALL
SELECT country
FROM suppliers
ORDER BY country ASC;

SELECT country FROM customers
INTERSECT
SELECT country FROM suppliers;

SELECT COUNT(*) FROM
(SELECT country FROM customers
INTERSECT ALL
SELECT country FROM suppliers) AS same_country;

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers


SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;

SELECT country FROM customers
EXCEPT
SELECT country FROM suppliers;

SELECT COUNT(*) FROM
(SELECT country FROM customers
EXCEPT ALL
SELECT country FROM suppliers) AS same_country;

SELECT city FROM suppliers
EXCEPT
SELECT city FROM customers;

SELECT city
FROM customers
INTERSECT
SELECT city
FROM suppliers
ORDER BY city DESC;

SELECT COUNT(*) FROM
(SELECT city FROM customers
INTERSECT
SELECT city FROM suppliers ) AS same_city;
