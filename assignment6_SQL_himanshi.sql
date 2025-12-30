DROP DATABASE IF EXISTS office;
CREATE DATABASE office;
USE office;

DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) UNIQUE
);

INSERT INTO Departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Marketing');

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
age INT,
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees VALUES
(101, 'John', 30, 50000, 2),
(102, 'Alice', 35, 60000, 3),
(103, 'Bob', 28, 45000, 1),
(104, 'Carol', 40, 70000, 2),
(105, 'David', 32, 55000, 4);

SELECT emp_name, salary
FROM Employees
ORDER BY salary DESC;

INSERT INTO Employees
VALUES (106, 'Emma', 29, 48000, 5);

UPDATE Employees
SET salary = salary + 3000
WHERE dept_id = (
SELECT dept_id
FROM Departments
WHERE dept_name = 'IT'
);

DELETE FROM Employees
WHERE emp_name = 'Bob';

INSERT INTO Departments VALUES (1, 'Legal');

SELECT emp_name, salary
FROM Employees
WHERE salary > (
SELECT AVG(salary)
FROM Employees
);

SELECT e.emp_name, d.dept_name
FROM Employees e
JOIN Departments d
ON e.dept_id = d.dept_id;

