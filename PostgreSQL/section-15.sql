---section15
create table subscribers(
firstname varchar(200),
lastname varchar(200),
email varchar(250),
	signupdate timestamp,
	feequency integer,
	subscriber boolean
);

create table returns(
returnid serial,
	customerid char(5),
	datereturned timestamp,
	productid int,
	quantity smallint,
	orderid integer
	
)
alter table subscribers
rename firstname to first_name;
alter table subscribers
rename to email_subscribers;

alter table returns 
rename to bad_orders;

alter table returns
rename datereturned to return_date;

select customerid from customers;

alter table email_subscribers
add column last_visit_date timestamp;

alter table email_subscribers
drop column last_visit_date;
alter table bad_orders
add column reason text;

alter table bad_orders
alter column quantity 


drop table email_subscribers;

drop table bad_orders;

