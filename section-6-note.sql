/**
1. time data type 
DATE        only date
TIME        only time
TIMESTAMP   date and time
TIMESTAMPTZ date and time with time zone 

2. time functions 
TIMEZONE  NOW() TIMEOFDAY() CURRENT_TIME CURRENT_DATE
EXTRACT() AGE() TO_CHAR()
TO_CHAR support a lot of format, should read more on official documentation 
*/
show timezone ;       -- Asia/Bangkok
select now();         -- 2023-12-07 14:25:28.313391+07
select timeofday();   -- Thu Dec 07 14:25:53.580934 2023 +07
select current_time ; -- 14:26:17.793574+07:00
select current_date ; -- 2023-12-07

select extract(year from now()) ; -- 2023
select extract(month from now()) ; -- 12
select extract(day from now()) ; -- 7
select extract(hour from now()) ; -- 17
select extract(minute from now()) ; -- 42
select extract(second from now()) ; -- 1.25
select age(payment_date) from payment limit 1 ; -- 16 years 9 mons 19 days 01:34:13.003423
select to_char(now(), 'dd-mm-yyyy'); -- 07-12-2023

/** Mathematical Functions like + - * / ... 
*/
select round(rental_rate / replacement_cost, 2) * 100 as percent_cost from film limit 1;

/** String Funtions and Operations 
*/
select length('An');-- 2 
select first_name || ' ' || last_name from customer limit 1; -- Jared Ely
select lower(left(first_name, 1) || last_name) || '@gmail.com' as email from customer limit 1; --jely@gmail.com

/**Sub query
*/
-- get films have rental_rate > average rental rate 
select * from film where rental_rate > (select avg(rental_rate) from film);

-- film's titles that been return in some day 
select film_id, title from film where film_id in 
(select i.film_id 
from rental r join inventory i using (inventory_id) 
where return_date between '2005-05-29' and '2005-05-30'); 

select * from customer c where not exists 
(select * from payment p where p.customer_id = c.customer_id and amount > 10) ;


/** Self-join 
*/
-- find all the pairs of films which have same length 
select f.film_id as id1, other.film_id as id2, 
f.title as film_title, other.title as other_title, 
f.length as film_length, other.length as other_length 
from film f join film other 
on f.film_id <> other.film_id and f.length = other.length
where f.length = 117
;