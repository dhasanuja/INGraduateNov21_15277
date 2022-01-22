---section 25
BEGIN TRANSACTION;
	UPDATE products
	SET reorderlevel = reorderlevel - 5;

	SELECT COUNT(*)
	FROM products
	WHERE unitsinstock + unitsonorder < reorderlevel;

END TRANSACTION;

---create a single transaction to increase the requiredate in order by one day for december 2017 and
--decrese it by one day for november 2017
BEGIN TRANSACTION;
	UPDATE orders
	SET requireddate = requireddate + INTERVAL '1 DAY'
	WHERE orderdate BETWEEN '1997-12-01' AND '1997-12-31';

	UPDATE orders
	SET requireddate = requireddate - INTERVAL '1 DAY'
	WHERE orderdate BETWEEN '1997-11-01' AND '1997-11-30';

END TRANSACTION;
-------------------------------------------------------------------------------
--start to update orders and rollback
START TRANSACTION;

UPDATE orders
SET orderdate = orderdate + INTERVAL '1 YEAR';

ROLLBACK;
----savepoint
--start transaction ,insert a new employee, create a savepoint, update hiredate and rollback to savepoint
START TRANSACTION;

INSERT INTO employees (employeeid,lastname,firstname,title,birthdate,hiredate)
VALUES (501,'Sue','Jones','Operations Assistant','1999-05-23','2017-06-13');

SAVEPOINT inserted_employee;
UPDATE employees
SET birthdate='2025-07-11';

ROLLBACK TO inserted_employee;

UPDATE employees
SET birthdate='1998-05-23'
WHERE employeeid=501;

COMMIT;


SELECT *
FROM employees
WHERE employeeid=501;












