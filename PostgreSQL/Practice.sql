---section 3 -part 7
SELECT * FROM categories;
SELECT * FROM orders;
--select everyting from employee table
SELECT * FROM employees;

-------part-8
SELECT companyname,city,country From suppliers;

---select name and description of all our product categories
SELECT categoryname,description FROM categories;

---part-9
SELECT country FROM customers;
SELECT DISTINCT country FROM customers;
SELECT DISTINCT country,city FROM customers;
----what are unique region our suppliers are in
SELECT DISTINCT region FROM suppliers;
---part-10
SELECT COUNT(*) FROM products;
---how many order we had
SELECT COUNT(*) FROM orders;
--how many cities are our suppliers in
SELECT COUNT(DISTINCT city) FROM suppliers;
--how many distinct products have been orderd
SELECT COUNT(DISTINCT productid) FROM order_details;
----part-11
SELECT customerid,shippeddate-orderdate FROM orders;
--select the amount spent on order details (price time quantiy)
SELECT orderid,unitprice*quantity FROM order_details;
---part-14
SELECT companyname FROM suppliers WHERE city='Berlin';
---find all customer name and contact that we have in mexico
SELECT companyname, contactname FROM customers WHERE country='Mexico';

--part-15
--employe with id 3
SELECT COUNT(*) FROM orders WHERE employeeid=3;
--that had more than 20 item orderd
SELECT COUNT(*) FROM order_details WHERE quantity>20
---how many orders had a freight cost equal to or greter than 250
SELECT COUNT(*) FROM orders WHERE freight>=250;

--part-16
--orderd on or after january 01,1998
SELECT COUNT(*) FROM orders WHERE orderdate>='01-01-1998';
--how many orders shipped before july 5 1997
SELECT COUNT(*) FROM orders WHERE shippeddate<'05-07-1997';

--part-17
--shipped to germany and the freigh cost more than 100
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND freight>100;
SELECT DISTINCT(customerid) FROM orders WHERE shipcountry='Brazil' AND shipvia=2;

--part-18
--how many customer in USA and canada
SELECT COUNT(*) FROM customers WHERE country='USA' OR country='Canada';
SELECT COUNT(*) FROM suppliers WHERE country='Germany' OR country='Spain';
SELECT COUNT(*) FROM orders WHERE shipcountry='USA' OR shipcountry='Brazil' OR shipcountry='Argentina';

--part 19
SELECT COUNT(*) FROM customers WHERE NOT country='France';
SELECT COUNT(*) FROM suppliers WHERE NOT country='USA';

--part 20
SELECT COUNT(*) FROM orders WHERE shipcountry='Germany' AND (freight<50 OR freight>175);
SELECT COUNT(*) FROM orders WHERE (shipcountry='Canada' OR shipcountry='Spain') AND shippeddate>'01-05-1997';

--part21
SELECT COUNT(*) FROM order_details WHERE unitprice BETWEEN 10 AND 20;
SELECT COUNT(*) FROM orders WHERE shippeddate BETWEEN '01-06-1996' AND '30-09-1996';

select shippeddate from orders WHERE shippeddate between '1996-06-01' and '1996-07-16';
--part-22
SELECT COUNT(*) FROM suppliers WHERE country IN ('Germany','france','Italy');
SELECT COUNT(*) FROM products WHERE categoryid IN (1,4,6,7);

SELECT
    country,
    COUNT(*)
FROM
    customer
GROUP BY
    country

select count(customer)
from customer group by country

SELECT reportsto, COUNT(employeeid)
 FROM public.employees
 where reportsto is not null
   GROUP BY reportsto
   HAVING COUNT(employeeid)>3;