-- Create a new database called "School" 
create database school ;
/** this database should have two tables: teachers and students.
The students table should have columns for student_id, first_name, last_name, homeroom_number, phone, email, 
and graduation year.
The teachers table should have columns for teacher_id, first_name, last_name, homeroom_number, department, email, 
and phone.
The constraints are mostly up to you, but your table constraints do have to consider the following:
1. We must have a phone number to contact students in case of an emergency.
2. We must have ids as the primary key of the tables
3. Phone numbers and emails must be unique to the individual.
Once you've made the tables, insert a student named Mark Watney (student_id=1) who has a phone number of 777-555-1234 
and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.
Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. 
His contact info is: jsalk@school.org and a phone number of 777-555-4321.
Keep in mind that these insert tasks may affect your constraints!
*/
create table if not exists student(
	student_id serial primary key, 
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	homeroom_number smallint,
	phone varchar(50) unique not null,
	email varchar(50) unique,
	gradution_year smallint
);

create table if not exists teacher(
	teacher_id serial primary key, 
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	homeroom_number smallint,
	phone varchar(50) unique,
	email varchar(50) unique,
	department varchar(50)
);

insert into student(first_name, last_name, phone, gradution_year, homeroom_number)
values ('Mark', 'Watney', '777-555-1234', 2035, 5) returning student_id;
insert into teacher(first_name, last_name, homeroom_number, department, email, phone)
values ('Jonas', 'Salk', 5, 'Biology', 'salk@school.org', '777-555-4321')  returning teacher_id;
select * from student;
select * from teacher;