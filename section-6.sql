-- video 50 no.1 : during which months did payments occur 
select distinct (to_char(payment_date, 'MONTH')) as paid_month
from payment ;

-- video 50 no.2 : how many payment occured on a Monday 
/**
select extract(dow from date '2023-12-07'); 
-- thursday return 4 -> monday return 1
*/ 
select count(*)
from payment where
1 = extract(dow from payment_date) ;

