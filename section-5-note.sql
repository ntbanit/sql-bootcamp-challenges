/** AS for alias : executed at the very end of query 
*/
select count(*) as number_transactions from payment ;
select customer_id, sum(amount) as total_spent 
from payment 
group by customer_id having sum(amount) > 100; -- can NOT use alias here

/** INNER JOIN : match in both tables 
*/
select payment_id, c.customer_id, first_name, last_name, amount, payment_date
from payment p join customer c using (customer_id) ;

/** 
FULL OUTER JOIN : grap everything from 2 tables 
LEFT OUTER JOIN : grap everything from left table ;
RIGHT OUTER JOIN : grap everything from right table ;
*/
-- check if there is a row invalid the below rule : 
-- 1. only save customer who have as least 1 payment 
-- 2. each payment must attach to a customer_id 
select payment_id, c.customer_id, first_name, last_name, amount, payment_date
from payment p full outer join customer c using (customer_id) 
where c.customer_id is null or payment_id is null ; -- no data => ok 

select f.film_id, title, inventory_id, store_id 
from film f left join inventory i using (film_id) 
where i.film_id is null ; 

/** UNION : combine the result in same structure 
*/