---section-19
CREATE VIEW customer_order_details AS
SELECT companyname, Orders.customerid, employeeid, orderdate, requireddate, shippeddate
Shipvia, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry,
order_details.*
FROM customers
JOIN orders on customers.customerid=orders.customerid
JOIN order_details on order_details.orderid=orders.orderid;

SELECT *
FROM customer_order_details
WHERE customerid='TOMSP';

CREATE VIEW supplier_order_details AS
SELECT companyname, suppliers.supplierid, Products.productid, productname,
Order_details.unitprice, quantity, discount, orders.*
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;

SELECT *  FROM supplier_order_details WHERE supplierid=5;






CREATE OR REPLACE VIEW customer_order_details AS
SELECT companyname, Orders.customerid,employeeid,requireddate,shippeddate,
Shipvia,freight,shipname,shipcity,shipregion,shippostalcode,shipcountry,
order_details.*,contactname
FROM customers
JOIN orders on customers.customerid=orders.customerid
JOIN order_details on order_details.orderid=orders.orderid;

CREATE OR REPLACE VIEW supplier_order_details AS
SELECT companyname,suppliers.supplierid,
Products.productid,productname,
Order_details.unitprice,quantity,discount,
orders.*,phone
FROM suppliers
JOIN products ON suppliers.supplierid=products.supplierid
JOIN order_details ON order_details.productid=products.productid
JOIN orders ON order_details.orderid=orders.orderid;

ALTER VIEW customer_order_details RENAME TO customer_order_detailed;

ALTER VIEW supplier_order_details RENAME TO supplier_orders;


CREATE VIEW north_america_customers AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico');

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','USA','555-555-5555',null);

UPDATE north_america_customers SET fax='555-333-4141' WHERE customerid='CFDCM';

DELETE FROM north_america_customers WHERE customerid='CFDCM';

CREATE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8);

INSERT INTO protein_products
(productid,productname,supplierid,categoryid,discontinued)
VALUES (78,'Kobe Beef',12,8,0);

UPDATE protein_products SET unitprice=55 WHERE productid=78;

DELETE FROM protein_products WHERE productid=78;



DROP VIEW IF EXISTS customer_order_detailed;

DROP VIEW IF EXISTS supplier_orders;






INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);

SELECT FROM north_america_customers
WHERE customerid=’CFDCM’;

CREATE OR REPLACE VIEW north_america_customers  AS
SELECT *
FROM customers
WHERE country in ('USA','Canada','Mexico')
WITH LOCAL CHECK OPTION;

INSERT INTO north_america_customers
(customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax)
VALUES ('CFDCM','Catfish Dot Com','Will Bunker','President','Old Country Road','Lake Village','AR','71653','Germany','555-555-5555',null);

CREATE OR REPLACE VIEW protein_products AS
SELECT * FROM products
WHERE categoryid in (4,6,8)
WITH LOCAL CHECK OPTION;

INSERT INTO protein_products
(productid,productname,supplierid,categoryid,discontinued)
VALUES (78,'Tasty Tea',12,1,0);