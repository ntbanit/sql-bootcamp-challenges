-- video 45 no.1 : what are the emails of the customers who live in California ? 
select c.customer_id, c.email, a.address_id, a.address, a.address2
from customer c join address a using (address_id) 
where a.district = 'California';

-- video 45 no.2 : a list of all the movies Nick Wahlberg has been in 
select f.film_id, f.title, a.actor_id, a.first_name, a.last_name
from film f join film_actor fa using (film_id)
join actor a using (actor_id) 
where a.first_name = 'Nick' and a.last_name = 'Wahlberg' ; 

