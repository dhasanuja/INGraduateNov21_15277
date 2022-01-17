---setion 13
drop table if exists performance_test;
create table performance_test(
id serial,
location text
);

insert into performance_test(location)
select 'katmandu','Nepal' from generate_series(1,500000000);

select * from pg_stat_activity where state='ative';

select pg_cancel_backend(PID);
