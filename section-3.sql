-- video 31 no.1 : How many payments did each staff member handle and who get the bonus ?
select count(*) as cnt, staff_id 
from payment 
group by staff_id 
order by count(*) desc ; 

-- video 31 no.2 : what is the average replacement cost per MPAA rating ?
select rating, round(avg(replacement_cost), 2) as avg_cost
from film 
group by rating 
order by rating asc ;

-- video 31 no.3 : what are the customer ids of the top 5 customers by total spend ? 
select customer_id, sum(amount) as paid_money
from payment 
group by customer_id 
order by sum(amount) desc 
limit 5 ;

-- video 33 no.1 : what are the customer ids of the customers who have had 40 or more transaction payments ? 
select customer_id, count(*) as transaction_count 
from payment 
group by customer_id having count(*) >= 40 ;

-- video 33 no.2 : what are the customer ids of the customers who have spent more than $100 in payment transactions with our staff_id member 2 ?
select customer_id, sum(amount) as paid_money 
from payment where staff_id = 2 
group by customer_id having sum(amount) > 100 ;

