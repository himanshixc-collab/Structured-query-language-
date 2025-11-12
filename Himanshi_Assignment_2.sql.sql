
create  database if not exists college;
use college;
drop table if exists Company;
create table Company(
emp_id int Primary Key Auto_Increment,
emp_name varchar(50) not null,
department varchar(20),
salary int  default 20000  check (salary >= 20000));

insert into Company(emp_id ,emp_name,department,salary)values (001,'alan' , 'marketing' , 90000);
insert into Company(emp_id ,emp_name,department,salary)values (002,'alvin' , 'marketing' , 90000), (003,'priya' , 'IT',30000) , (004, 'priyanka' , 'sales' , default), (005, 'happy' , 'HR' ,90000), (006 ,'lekha' , 'HR' , 90000);

select*from Company where salary>50000;
select*from Company where department='HR' or salary<30000 ;
select distinct department from Company;
select*from Company order by salary desc limit 2;
select*from Company where salary between 25000 and 60000;
SELECT emp_name, salary FROM Company WHERE salary = (SELECT max(salary) FROM Company);
SELECT department, COUNT(*) AS employee_count FROM Company GROUP BY department;


drop table if exists Course;
create table Course(
course_id int  Primary Key Auto_Increment,
course_name varchar(50) Unique,
duration int not null,
fees int default 100000 check (fees <= 100000));

insert into Course (course_name, duration, fees) values ('AI', 6, 50000),('animation', 18 , 60000),('photography', 6 , 50000),('data science', 12, 20000), ('hotel management', 6, default );


select*from Course where duration > 6;
select*from Course where fees <50000 or duration>12 ;
select distinct duration from Course;
select*from Course order by fees desc limit 1;
select*from Course where duration between 6 and 12 order by fees ;
select*from Course order by fees asc limit 1;
SELECT duration, COUNT(*) AS course_count FROM Course GROUP BY duration;


drop table if exists hospital;
create table hospital (
patient_id int primary Key Auto_Increment,
patient_name varchar(50) not null,
disease varchar(30),
bill_amount int default 200000 check (bill_amount<= 200000));

insert into hospital (patient_name, disease, bill_amount) values ('anisha', 'flu',25000), ('alan', 'covid', 50000), ('yash', 'dengue', default ), ('tina', 'flu',30000);

select*from hospital where bill_amount>50000;
select*from hospital where disease='flu' or bill_amount= 10000;
select distinct disease from hospital;
select*from hospital order by bill_amount desc limit 2;
select*from hospital where bill_amount between 2000 and 80000 order by bill_amount asc;
select*from hospital order by bill_amount asc limit 1;
select disease, count(*)as patient_count from hospital group by disease;

 
drop table if exists orders;
create table orders(
order_id int Primary Key Auto_Increment,
customer_name varchar(50)not null,
product varchar(40),
amount int default 50000 check (amount <= 50000));

insert into orders (customer_name, product, amount) values ('aditya','laptop', default), ('tina','CPU',10000),('yash','kayboard', 4500);

select*from orders where amount>10000;
select*from orders where product='laptop' or amount < 5000;
select distinct product from orders ;
select*from orders order by amount desc limit 2;
select*from orders where amount between 80000 and 30000 order by amount asc;
select product, count(*) as order_count from orders group by product;


drop table if exists library2 ;
create table library2(
book_id int Primary Key Auto_Increment,
title varchar(40) unique not null,
author varchar(50),
price int default 1500 check(price <= 1500));

insert into library2(title, author, price) values ('the guide', 'R.K. Narayan' ,1000), ('the mahabharata', 'R.K. Narayan' ,1500), ('steal like an artist', ' Austin Kleon', 950),('do epic shit', 'Ankur Warikoo', default);

select distinct author from library2;
select*from library2 order by price desc limit 2;
select*from library2 where price between 400 and 1000 order by price asc ;
select*from library2 order by price asc;
select author, count(*) as book_count from library2 group by author;

drop table if exists teacher;
create table teacher(
teacher_id int Primary Key Auto_Increment,
teacher_name varchar(40) not null,
subject varchar(30),
salary int default 20000 check (salary <= 80000));

insert into teacher (teacher_name, subject, salary) values ('fanta' , 'english', 80000),('coke', 'maths' , 50000), ('limca', 'hindi', default);

select*from teacher where salary>50000;
select*from teacher where subject='maths' or salary<3000;
select distinct subject from teacher;
select*from teacher order by salary desc limit 1;
select*from teacher where salary between 20000 and 70000 order by salary asc;
select*from teacher order by salary asc; 
select subject, count(*) as teacher_count from teacher group by subject;

drop table if exists cinema;
create table cinema(
movie_id int Primary Key Auto_Increment,
movie_name varchar(40) unique not null,
language varchar(20),
rating int default 3 check (rating <= 10));

insert into cinema (movie_name, language, rating) values ('fanta', 'hindi', 9), ('coke','english', default),('thumbs up','hindi',2);

select*from cinema where rating>7;
select*from cinema where language='hndi' or rating <5;
select distinct language from cinema;
select*from cinema order by rating desc limit 2;
select*from cinema where rating between 5 and 9  order by rating asc ;
select*from cinema order by rating desc limit 1;
select language, count(*) as cinema_count from cinema group by language;

drop table if exists bank_account;
create table bank_account(
acc_id int Primary Key Auto_Increment,
holder_name varchar(50) not null,
branch varchar(30),
balance int default 2500 check( balance >= 1000));

insert into bank_account (holder_name, branch, balance) values ('adit', 'delhi', 50000),('haldiram','chennai', 90000), ('momo','delhi', default);

select*from bank_account where balance > 20000;
select*from bank_account where branch='delhi' or balance <5000;
select distinct branch from bank_account;
select*from bank_account order by balance asc limit 2;
select*from bank_account where balance between 10000 and 30000 order by balance asc;
select*from bank_account order by balance asc limit 1;
select branch, count(*) as account_number from bank_account group by branch;

drop table if exists shop;
create table shop(
item_id int Primary Key Auto_Increment,
item_name varchar(50) unique not null,
supplier varchar(40),
price int default 4000 check (price <= 20000));

insert into shop (item_name, supplier, price) value ('fanta','abc ltd', 1500),('billa','momos', default),('pani puri', ' abc ltd', 20000);

select*from shop where price>15000;
select*from shop where supplier='abc ltd' or price < 5000;
select distinct supplier from shop;
select*from shop order by price desc limit 1;
select*from shop where price between 7000 and 16000 order by price asc;
select*from shop order by price asc limit 1;
select supplier, count(*) as item_count from shop group by supplier;

drop table if exists flights ;
create table flights(
flight_id int Primary Key Auto_Increment,
airline varchar(60) not null,
source varchar(30),
destination varchar(30),
fare int default 4500 check (fare <= 20000));

insert into flights (airline, source , destination, fare) values('violet','delhi','goa', 15000),('violet','delhi','mumbai', default),('teal','mumbai','kerala',20000);

select*from flights where fare>10000;
select*from flights where source='delhi' or fare<5000;
select distinct airline from flights;
select*from flights order by fare desc limit 2;
select*from flights where fare between 8000 and 15000 order by fare asc;
select*from flights order by fare desc limit 1;
select source , count(*) as flight_count from flights group by source;


