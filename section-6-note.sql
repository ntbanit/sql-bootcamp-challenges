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
select round(rental_rate / replacement_cost, 2) * 100 as percent_cost from film ;