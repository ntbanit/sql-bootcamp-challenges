-- video 13: 
select first_name, last_name, email from customer ;


-- video 15:
select distinct rating from film ;


-- video 19 no.1 : what is the email for the customer with the name Nancy Thomas ?
select email from customer where first_name = 'Nancy' and last_name = 'Thomas';
-- video 19 no.2 : give the description for the movie “Outlaw Hanky”?
select description from film where title = 'Outlaw Hanky' ;
-- video 19 no.3 : get the phone number for the customer who lives at '259 Ipoh Drive'?
select phone from address where address = '259 Ipoh Drive';


-- video 22 no.1 : first 10 customer_id who created a payment 
select customer_id from payment order by payment_date asc limit 10;
-- video 22 no.2 : titles of 5 shortest (in length of runtime) movies
select title, length from film order by length asc, title asc limit 5;
-- video 22 no.3 : If the previous customer can watch any movie that is 50 minutes or less in run time, how many options does she have?
select count(1) from film where length <= 50 ;


-- video 26 no.1: how many payment transactions were greater than $5.00 ? 
select count(1) from payment where amount > 5;
-- video 26 no.2: how many actors have first name that start with the letter P ? 
select count(1) from actor where first_name ilike 'P%' ;
-- video 26 no.3: how many unique districts are our customer from ?
select count(distinct district) from address;
-- video 26 no.4: retrieve the list of names for those distinct districts from the previous question 
select distinct district from address order by district asc;
-- video 26 no.5: how many films have a rating of R and a replacement cost between $5 and $15 ?
select count(*) from film where rating = 'R' and replacement_cost between 5 and 15 ;
-- video 26 no.5:  how many films have the word Truman somewhere in the title ?
select count(*) from film where title like '%Truman%';


