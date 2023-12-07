-- Aggregate functions = multi inputs and 1 outputs 
-- COUNT, MIN, MAX, AVG, COUNT 
select max(replacement_cost), min(replacement_cost) from film ;
-- note : AVG return floating pint, should use with ROUND() 
select avg(replacement_cost) from film ;
select round(avg(replacement_cost), 3) from film ;
