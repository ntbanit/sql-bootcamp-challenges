-- video 74: We want to know and compare the various amounts of films we have per movie rating.
select 
	sum(case rating when 'NC-17' then 1 else 0 end) as nc17,
	sum(case rating when 'G' then 1 else 0 end) as g,
	sum(case rating when 'PG' then 1 else 0 end) as pg,
	sum(case rating when 'PG-13' then 1 else 0 end) as pg13,
	sum(case rating when 'R' then 1 else 0 end) as r
from film ;

select distinct rating from film ;