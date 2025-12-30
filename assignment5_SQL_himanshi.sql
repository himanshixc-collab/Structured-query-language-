DROP DATABASE IF EXISTS assignment;
CREATE DATABASE assignment;
USE  assignment;

DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
salary INT,
age INT,
dept_id INT
);


INSERT INTO departments (dept_id,dept_name) VALUES
(1,'HR'),
(2,'IT'),
(3,'Sales'),
(4,'Finance'),
(5,'Marketing');

INSERT INTO employees (emp_id, emp_name,salary,age,dept_id) VALUES 
(101,'John',50000,30,2),
(102,'Alice',60000,35,3),
(103,'Alan',45000,28,1),
(104,'Sia',70000,40,2),
(105,'David',55000,32,4),
(106,'Tia',48000,26,99);

SELECT emp_name , salary 
FROM employees
WHERE salary > (
SELECT AVG(salary)
FROM employees
);

SELECT emp_name
FROM employees
WHERE dept_id= (
SELECT dept_id
FROM employees
WHERE emp_name = 'John'
);

SELECT emp_name
FROM employees
WHERE dept_id NOT IN(
SELECT dept_id
FROM departments
);

SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary<(
SELECT MAX(salary)
FROM employees
);

SELECT emp_name, age
FROM Employees
WHERE age > ANY (
SELECT age
FROM Employees
WHERE dept_id = (
SELECT dept_id
FROM Departments
WHERE dept_name = 'Sales')
);
