-- section 26
--create frids table and add a childredn array
DROP TABLE IF EXISTS friends;

CREATE TABLE friends (
    name full_name,
    address address,
    specialdates dates_to_remember,
    children varchar(50) ARRAY
);

select * from friends;

------create table salary_employees with 3 field name,pay_by_quarter,which is an integer with one dimension and 4 value and schedule should br text field with 2 dimension of no particular size


DROP TABLE IF EXISTS salary_employees;

CREATE TABlE salary_employees (
    name text,
    pay_by_quarter integer[4],
	schedule text[][]
);
select * from salary_employees;
-----------------------------------------------------
--insert into friends
INSERT INTO friends (name, address, specialdates, children)
VALUES (ROW('Boyd','M','Gregory'),
		ROW('7777','','Boise','Idaho','USA','99999'),
		ROW('1969-02-01',49,'2001-07-15'),
	   '{"Austin","Ana Grace"}');
	   
select * from friends;	   
 INSERT INTO friends (name, address, specialdates, children)
 VALUES (ROW('Scott','X','Levy'),
 		ROW('357 Page Road','','Austin','TX','USA','88888'),
 		ROW('1972-03-01',46,'2002-01-30'),
 		   ARRAY['Ben','Jill']);
---add row into salary_employee .bill who made 200000 each quarer and had 2 diffrent schedule record of "meeting", "lunch","sales call"
INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 ARRAY[20000, 20000, 20000, 20000],
		 ARRAY[['meeting', 'training'],['lunch', 'sales call']])


select * from salary_employees;

INSERT INTO salary_employees (name,pay_by_quarter,schedule)
VALUES ('Bill',
		 		'{20000, 20000, 20000, 20000}',
				'{{"meeting", "training"},{"lunch", "sales call"}}')
--------------------------------------------------------------------------------
--accesing array
SELECT children[2]
FROM friends;

---grab the 2 and 3 element of pay_by_quaretr using range from salary_employee table
SELECT pay_by_quarter[2:3]
FROM salary_employees;
-----function dimension array
SELECT array_dims(schedule)
FROM salary_employees;
---
SELECT array_length(schedule,1),array_length(schedule,2)
FROM salary_employees;
---------------------------------------------------------------
--update array
UPDATE friends
SET children=ARRAY['Maddie','Timmy','Cheryl']
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

UPDATE friends
SET children[2]='Ricky'
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

UPDATE friends
SET children[2:3]=ARRAY['Suzy','Billy']
WHERE (name).first_name = 'Boyd';

SELECT children
FROM friends
WHERE (name).first_name = 'Boyd'
LIMIT 1;

----replace bill pay_by_quaretr with value 22000 25000 27000 22000
UPDATE salary_employees
SET pay_by_quarter=ARRAY[22000,25000,27000,22000]
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';
-----update bills4th pay_by_quarter to 26000
UPDATE salary_employees
SET pay_by_quarter[4]=26000
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';
----updat bills 2nd and 3rd quarter to 24000 250000
UPDATE salary_employees
SET pay_by_quarter[2:3]=ARRAY[24000,25000]
WHERE name='Bill';

SELECT pay_by_quarter
FROM salary_employees
WHERE name='Bill';
------------------------------------------------------------------------------
--serching array
--does any of my friends have a child named billy
SELECT *
FROM friends
WHERE children[0] = 'Billy' OR children[1] = 'Billy'
OR children[2]='Billy' OR children[3]='Billy';

SELECT *
FROM friends
WHERE 'Billy' = ANY (children);
---any 
SELECT *
FROM friends
WHERE 'Austin' = ANY (children);

--serch salary_employee for anyone with 'sales call' in the scedule
SELECT *
FROM salary_employees
WHERE 'sales call' = ANY (schedule);

-----------------------------------------------------------
--Array operator
-- equal--true
SELECT ARRAY[1, 2, 3, 4] = ARRAY[1, 2, 3, 4];

-- not equal, the elements are not in same order --false
SELECT ARRAY[1, 2, 4, 3] = ARRAY[1, 2, 3, 4];

-- true
SELECT ARRAY[1, 2, 4, 3] > ARRAY[1, 2, 3, 4];

-- false
SELECT ARRAY[1, 2, 3, 4] > ARRAY[1, 2, 3, 4];

-- false 3 smaller than 4, doesn't look at 5 greater than 4
SELECT ARRAY[1, 2, 3, 5] > ARRAY[1, 2, 4, 4];

-- true
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5];

-- false
SELECT ARRAY[1, 2, 3, 5] @> ARRAY[2, 5, 7];

-- true
SELECT ARRAY[1, 2] <@ ARRAY[2, 5, 7, 1];

-- true
SELECT ARRAY[1, 2, 13, 17] && ARRAY[2, 5, 7, 1];

--false
SELECT ARRAY[ 13, 17] && ARRAY[2, 5, 7, 1];
---find anyone with child named billy
SELECT *
FROM friends
WHERE children && ARRAY['Billy'::varchar(50)];
----use ovelap operator to find anyone with 'sales call' in sceduled in salary_employee
SELECT *
FROM salary_employees
WHERE schedule && ARRAY['sales call'];
