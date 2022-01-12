SELECT companyname,orderdate,shipcountry
FROM orders
JOIN customers ON customers.customerid=orders.customerid;

SELECT firstname,lastname,orderdate
FROM orders
JOIN employees ON employees.employeeid=orders.employeeid;

SELECT companyname,unitprice,unitsinstock
FROM products
JOIN suppliers ON products.supplierid=suppliers.supplierid;

SELECT companyname,orderdate,unitprice,quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid;

SELECT companyname, productname, orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid;

SELECT companyname, productname, categoryname,
	     Orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid;

SELECT companyname, productname, categoryname,
	    orderdate, order_details.unitprice, quantity
FROM orders
JOIN order_details ON orders.orderid=order_details.orderid
JOIN customers ON customers.customerid=orders.customerid
JOIN products ON products.productid=order_details.productid
JOIN categories ON categories.categoryid=products.categoryid
WHERE 	categoryname='Seafood' AND
		order_details.unitprice*quantity >= 500;
		
SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid=orders.customerid;

SELECT companyname, orderid
FROM customers
LEFT JOIN orders ON customers.customerid=orders.customerid
WHERE orderid IS NULL;

SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid;

SELECT productname, orderid
FROM products
LEFT JOIN order_details ON products.productid=order_details.productid
WHERE orderid IS NULL;		

SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid;

SELECT companyname, orderid
FROM orders
RIGHT JOIN customers ON customers.customerid=orders.customerid
WHERE orderid IS NULL;

SELECT companyname, customercustomerdemo.customerid
FROM customercustomerdemo
RIGHT JOIN customers ON customers.customerid=customercustomerdemo.customerid;

SELECT companyname, orderid
FROM orders
FULL JOIN customers ON customers.customerid=orders.customerid;

SELECT productname, categoryname
FROM categories
FULL JOIN products ON products.categoryid=categories.categoryid;

SELECT A.companyname AS CustomerName1, B.companyname AS CustomerName2, A.city
FROM customers A, customers B
WHERE A.customerid > B.customerid
AND A.city = B.city
ORDER BY A.city;

SELECT  A.companyname AS SupplierName1,
		    B.companyname AS SupplierName2,  A.country
FROM suppliers A, suppliers B
WHERE A.supplierid > B.supplierid
AND A.country = B.country
ORDER BY A.country;

SELECT *
FROM orders
JOIN order_details USING (orderid);


SELECT *
FROM orders
JOIN order_details USING (orderid)
JOIN products USING (productid);

SELECT *
FROM orders
NATURAL JOIN order_details;

SELECT *
FROM customers
NATURAL JOIN orders
NATURAL JOIN order_details;


--notice the difference between these two joins
SELECT COUNT(*)
FROM products
NATURAL JOIN order_details;  

SELECT COUNT(*)
FROM products
JOIN order_details USING (productid);
