/** DATA TYPES : 
boolean / character / numeric / temporal 
UUID / array / JSON / hstore key-value
special types : network address / geometric data 

-> searching for best practices 
example: phone number should be varchar , cause 
1. dont need maths + - * /
2. leading zero cause problem ( 7 and 07 is NOT the same)
*/

/** PRIMARY AND FOREIGN KEYS
SERIAL -> auto incre : sequence integers 
*/

/** CONSTRAINTS
NULL - NOT NULL
UNIQUE
PRIMARY KEY - FOREIGN KEY
CHECK
EXCLUSION
REFERENCES
*/

/** CREATE : can use INHERITS to set the parent table 
*/
create table if not exists account (
	user_id serial primary key,
	username varchar(50) unique not null,
	password varchar(50) not null,
	email varchar(255) unique not null,
	create_date timestamp not null,
	last_login timestamp
);
create table if not exists job(
	job_id serial primary key,
	job_name varchar(255) unique not null
);
create table if not exists account_job(
	user_id integer references account(user_id),
	job_id integer references job(job_id),
	hire_date timestamp
);

/** INSERT 
* can insert from another table by SELECT and use RETURNING 
*/
select * from account;
insert into account(username, password, email, create_date) values 
('An Nguyen', 'password', 'annguyen@gmail.com', current_timestamp);

insert into job(job_name) values ('Teacher'), ('Developer'); 
select * from job;

insert into account_job(user_id, job_id, hire_date) values 
(2, 1, current_timestamp);

/** UPDATE 
1. can update from another table base on join 
2. can return affected rows 
*/
update account set last_login = create_date ;

update account_job aj
set hire_date = last_login
from account a 
where a.user_id = aj.user_id
and aj.user_id = 2
returning aj.user_id, aj.job_id, email, hire_date, last_login;

/** DELETE 
can use another table by USING and use RETURNING 
*/
insert into job(job_name) values ('Cowboy');
delete from job where job_name = 'Cowboy' returning job_id;

/** ALTER : change table structure
ADD DROP COLUMN
SET DEFAULT CHECK .. 
*/
create table if not exists information(
	info_id serial primary key,
	title VARCHAR(50) unique NOT NULL,
	description VARCHAR(255) NOT NULL
);
alter table information rename to infor_about; 
select * from infor_about;

alter table infor_about alter column description drop not null ;
insert into infor_about (title) values ('Developer') ;

/** DROP : column, tables .. 
CASCADE -> resolve dependency 
*/
alter table infor_about drop column if exists people; 

/** CHECK CONSTRAINTS 
*/
alter table account add column age smallint check(age >= 18);
insert into account(username, password, email, create_date, age) values 
('Me Ca Chua', 'password', 'mechua@gmail.com', current_timestamp, 30)
returning user_id ;
update account set username = replace(lower(username), ' ', '_')
where user_id in (4,5) returning user_id, username ;





