---section 28 Triggers
alter table employees
add column last_updated timestamp;

select * from employees;

create or replace function employees_timestamp() returns trigger as $$
begin 
new.last_updated:=now();
return new;
end;
$$ language plpgsql;

----create trigger trigger_name condition on table_name
--for each row execute function function_name();
--condition
--BEFORE OR AFTER
--INSERT.UPDATE, DELETE

--1 we want to always update last_update to current time,
-- so will need to be before insert an update
drop trigger if exists employees_timestamp on employees;

create trigger employees_timestamp 
before insert or update on employees
for each row execute function employees_timestamp();

select last_updated,*
from employees;


select last_updated,*
from employees
where employeeid=1;

update employees
set address='33 west spring road'
where employeeid=1;
--add a last_updated to products table and create a function
--and trigger that updates the fields every time there is a change

alter table products
add column last_updated timestamp;

create or replace function products_timestamp()
returns trigger as $$
begin
new.last_updated:=now();
return new;
end;
$$ language plpgsql;

drop trigger if exists products_timestamp on products;

create trigger products_timestamp before insert or update on products
for each row execute function products_timestamp();

select last_updated,*
from products
where productid=2;

update products
set unitprice=19.00
where productid=2;


---create an audit table for order_details and insert changed
--information into this audit table when  insert delete or update happens

CREATE TABLE order_details_audit (
	operation char(1) NOT NULL,
	userid	text NOT NULL,
	stamp	timestamp NOT NULL,
    orderid smallint NOT NULL,
    productid smallint NOT NULL,
    unitprice real NOT NULL,
    quantity smallint NOT NULL,
    discount real
)

select * from order_details;

CREATE OR REPLACE FUNCTION audit_order_details() RETURNS trigger AS $$
BEGIN
	IF (TG_OP == 'DELETE') THEN
		INSERT INTO order_details_audit
		SELECT 'D',user,now(),o.* FROM old_table o;
	ELSIF (TG_OP == 'UPDATE') THEN
		INSERT INTO order_details_audit
		SELECT 'U',user,now(),n.* FROM new_table n;
	ELSIF (TG_OP == 'INSERT') THEN
		INSERT INTO order_details_audit
		SELECT 'U',user,now(),n.* FROM new_table n;
	END IF;
	RETURN NULL;  -- we are using in after trigger so don't need to return update

END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS audit_order_details_insert ON order_details;

CREATE TRIGGER audit_order_details_insert AFTER INSERT ON order_details
REFERENCING NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_order_details();

DROP TRIGGER IF EXISTS audit_order_details_update ON order_details;

CREATE TRIGGER audit_order_details_update AFTER UPDATE ON order_details
REFERENCING NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_order_details();

DROP TRIGGER IF EXISTS audit_order_details_delete ON order_details;

CREATE TRIGGER audit_order_details_delete AFTER DELETE ON order_details
REFERENCING OLD TABLE AS old_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_order_details();

INSERT INTO order_details
VALUES (10248, 3, 10, 5, 0);

SELECT * FROM order_details_audit;

update order_details
SET discount=0.20
WHERE orderid=10248 AND productid=3;


SELECT * FROM order_details_audit;

DELETE FROM order_details
WHERE orderid=10248 AND productid=3;

SELECT * FROM order_details_audit;

--create an audit trail for order using the same three step
--of creating table functin and triggers
CREATE TABLE orders_audit (
	operation char(1) NOT NULL,
	userid text NOT NULL,
	stamp timestamp NOT NULL,
	orderid smallint NOT NULL,
    customerid bpchar,
    employeeid smallint,
    orderdate date,
    requireddate date,
    shippeddate date,
    shipvia smallint DEFAULT 1,
    freight real,
    shipname character varying(40),
    shipaddress character varying(60),
    shipcity character varying(15),
    shipregion character varying(15),
    shippostalcode character varying(10),
    shipcountry character varying(15)
)

CREATE OR REPLACE FUNCTION audit_orders() RETURNS trigger AS $$
BEGIN
	IF (TG_OP = 'INSERT') THEN
		INSERT INTO orders_audit
		SELECT 'I',user,now(),n.* FROM new_table n;
	ELSIF (TG_OP = 'UPDATE') THEN
		INSERT INTO orders_audit
		SELECT 'U',user,now(),n.* FROM new_table n;
	ELSIF (TG_OP = 'DELETE') THEN
		INSERT INTO orders_audit
		SELECT 'D',user,now(),O.* FROM old_table o;
	END IF;
	RETURN NULL;
END;
$$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS audit_orders_insert ON orders;

CREATE TRIGGER audit_orders_insert AFTER INSERT ON orders
REFERENCING NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_orders();

DROP TRIGGER IF EXISTS audit_orders_update ON orders;

CREATE TRIGGER audit_orders_update AFTER UPDATE ON orders
REFERENCING NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_orders();

DROP TRIGGER IF EXISTS audit_orders_delete ON orders;

CREATE TRIGGER audit_orders_delete AFTER DELETE ON orders
REFERENCING OLD TABLE AS old_table
FOR EACH STATEMENT EXECUTE FUNCTION audit_orders();