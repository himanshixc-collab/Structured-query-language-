DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
student_id INT PRIMARY KEY,
student_name VARCHAR(50),
class VARCHAR(10),
age INT
);

INSERT INTO Students VALUES
(1, 'Amit', '10A', 15),
(2, 'Neha', '9B', 14),
(3, 'Rahul', '10A', 16);

TRUNCATE TABLE Students;

DROP TABLE Students;
