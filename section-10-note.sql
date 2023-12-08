/** CASE WHEN ELSE END => branching 
*/
select customer_id,
case 
	when customer_id <= 100 then 'Premium'
	when customer_id between 100 and 200 then 'Plus'
	else 'Normal'
end as customer_type
from customer ;

select customer_id,
case customer_id
	when 1 then 'Winner'
	when 2 then 'Runner up'
	else 'Normal'
end as customer_type
from customer ;
-- count multi type in one query
select 
	sum(case rental_rate when 0.99 then 1 else 0 end) as type1,
	sum(case rental_rate when 2.99 then 1 else 0 end) as type2,
	sum(case rental_rate when 4.99 then 1 else 0 end) as type3
from film;

/** 
COALESCE -> return first non null value 
CAST     -> convert to another type (NOT all type can convert) 
NULLIF   -> 2 inputs return NULL if both equal, otherwise return first argument passed 
*/
select cast('5' as integer) ;
select '5'::integer ;
select * from rental ;
select nullif(10, 10) ; -- null
select nullif(10, 2) ; -- 2


create table if not exists depts(
	first_name varchar(50),
	department varchar(50)
);
insert into depts values ('Vinton', 'A'), ('Lauren', 'A'), ('Claire', 'B');
select * from depts ;
-- find ration between A and B (can use SUM and CASE WHEN 1 0 like before )
select 
	(sum(case department when 'A' then 1 else 0 end) /
	sum(case department when 'B' then 1 else 0  end) ) as ratio 
from depts ;
delete from depts where department = 'B'; -- now run above will ERROR:  division by zero 
select 
	(sum(case department when 'A' then 1 else 0 end) /
	nullif(sum(case department when 'B' then 1 else 0  end), 0) ) as ratio 
from depts ; -- return null -> a NUMBER divide NULL = null 


/** VIEW -> virtual table 
*/
create or replace view customer_info as 
select first_name, last_name, address, district
from customer c join address a using (address_id) ;
select * from customer_infor ;
drop view customer_info;
alter view customer_info rename to customer_infor;

/** IMPORT and EXPORT from a CSV file */