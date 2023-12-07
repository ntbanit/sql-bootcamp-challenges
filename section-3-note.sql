/** Aggregate functions = multi inputs and 1 outputs 
COUNT, MIN, MAX, AVG, COUNT */
select max(replacement_cost), min(replacement_cost) from film ;
-- note : AVG return floating pint, should use with ROUND() 
select avg(replacement_cost), sum(replacement_cost), count(1) from film ;
select round(avg(replacement_cost), 3) from film ;

/** GROUP BY : use after WHERE 
1. column in SELECT statement must either be GROUP or have an aggregate function
2. WHERE should not refer to aggregate results cause it happen after WHERE. HAVING will do it 
3. aggregate results can be used in ORDER BY 
*/
select customer_id, sum(amount) as paid_money from payment 
group by customer_id order by sum(amount) desc ;

select customer_id, staff_id, sum(amount) as paid_money from payment 
group by customer_id, staff_id order by customer_id, staff_id ;

/** HAVING : handle aggregate results */
select customer_id, sum(amount) from payment 
where customer_id not between 100 and 400 
group by customer_id having sum(amount) > 100 ;

