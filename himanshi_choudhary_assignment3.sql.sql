create database if not exists employee;
use employee;

drop table if exists employees;
create table employees (
emp_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
department VARCHAR(30),
experience INT,
 salary INT,
joining_date DATE);

 INSERT INTO employees (name, department, experience, salary, joining_date) VALUES ('Amit',
 'IT', 6, 60000, '2018-07-10'), ('Priya', 'HR', 3, 40000, '2021-05-14'), ('Ravi', 'Sales', 8, 75000,
 '2016-11-23'), ('Sneha', 'IT', 2, 35000, '2023-02-18'), ('Karan', 'Finance', 10, 90000, '2014-04-05'),
 ('Tina', 'Sales', 5, 55000, '2019-09-12');
 
 SELECT * FROM employees
WHERE department = 'IT';

ALTER TABLE employees ADD COLUMN bonus decimal(10,2);

UPDATE employees
SET bonus = salary * 0.10;

UPDATE employees
SET bonus = bonus * 1.20
WHERE salary > 70000;

SELECT name, department, salary,
  CASE
WHEN salary >= 80000 THEN 'High'
WHEN salary BETWEEN 50000 AND 79999 THEN 'Medium'
ELSE 'Low'
END AS Level
FROM employees;

SELECT department, AVG(bonus) AS avg_bonus
FROM employees
GROUP BY department;

SELECT department, AVG(bonus) AS avg_bonus
FROM employees
GROUP BY department
HAVING AVG(bonus) > 4000;

SELECT department,
       SUM(salary + bonus) AS total_compensation
FROM employees
GROUP BY department;

UPDATE employees
SET salary = salary * 1.10
WHERE department = 'Finance';

SELECT
  MAX(salary) AS max_salary,
  MIN(salary) AS min_salary
FROM employees;

SELECT * FROM employees
ORDER BY bonus DESC;

SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;




 
 
 
 create table teachers(
 teacher_id int primary key auto_increment,
 name varchar (50),
 subject varchar(30),
 experience int,
 salary int,
 city varchar(30) );
 
 INSERT
 INTO teachers (name, subject, experience, salary, city) VALUES ('Arun', 'Maths', 10, 75000,
 'Delhi'), ('Rita', 'Science', 4, 50000, 'Mumbai'), ('Vivek', 'English', 6, 55000, 'Delhi'), ('Nisha', 'Maths',
 3, 45000, 'Chennai'), ('Ravi', 'Science', 12, 90000, 'Delhi');
 
 select*from teachers 
 where subject = 'Maths';
 
 alter table teachers add column bonus int;
 
 update teachers
 set bonus = salary*1.10;
 
 update teachers
 set bonus = bonus * 1.20
 where salary>60000;
 
 select name, subject, salary,
 case
 when salary >= 80000 then 'high'
 when salary between 50000 and 79999 then 'medium'
 else 'low'
 end as level
 from teachers;
  
  select subject, avg(bonus) as avg_bonus
  from teachers
  group by subject;
  
  select subject, avg(bonus) as avg_bonus
  from teachers
  group by subject
  having avg(bonus) >5000;
  
  select subject,
  sum(salary+bonus) as total_compenstion
  from teachers
  group by subject;
  
  update teachers
  set salary=salary*1.10
  where subject='Maths';
  
  select
  max(salary) as max_salary,
  min(salary) as min_salary
  from teachers;
  
  select*from teachers
  order by bonus desc;
  
  select subject, count(*) as teacher_count
  from teachers
  group by subject
  having count(*)>1;