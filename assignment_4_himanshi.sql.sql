DROP DATABASE IF EXISTS assignment;
CREATE DATABASE assignment;
USE assignment;


CREATE TABLE IF NOT EXISTS streams (
code INT PRIMARY KEY,
stream_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS teacher;
CREATE TABLE IF NOT EXISTS teacher (
teacher_id INT PRIMARY KEY AUTO_INCREMENT,
teacher_name VARCHAR(50) NOT NULL,
stream_code INT NOT NULL,
hire_date DATE NOT NULL,
salary INT CHECK (salary >= 10000),
email VARCHAR(100) UNIQUE,
is_active BOOLEAN DEFAULT TRUE,
FOREIGN KEY (stream_code) REFERENCES streams(code)
);

DROP TABLE IF EXISTS top_student;
CREATE TABLE top_student (
student_name VARCHAR(50) NOT NULL,
stream_code INT NOT NULL,
marks INT,
FOREIGN KEY (stream_code) REFERENCES streams(code)
);

DROP TABLE IF EXISTS top_authority;
CREATE TABLE top_authority (
authority_name VARCHAR(50) NOT NULL,
position VARCHAR(50) NOT NULL,
experience_years INT CHECK (experience_years >= 0),
email VARCHAR(100) UNIQUE,
contact_no VARCHAR(15)
);

drop table if exists stream_details;
create table stream_details(
stream_code int primary key,
total_subjects int ,
total_max_marks int,
FOREIGN KEY (stream_code) references streams (code)
);


DROP TABLE IF EXISTS fee_details;
CREATE TABLE fee_details(
stream VARCHAR(50) PRIMARY KEY,
class INT NOT NULL,
max_fees INT NOT NULL
);

DROP TABLE IF EXISTS transport;
CREATE TABLE transport (
route_no INT PRIMARY KEY,
driver_name VARCHAR(50) NOT NULL,
vehicle_no VARCHAR(20) UNIQUE NOT NULL,
capacity INT DEFAULT 40
);

CREATE TABLE  IF NOT EXISTS lab_details (
lab_code INT PRIMARY KEY,
stream_code INT NOT NULL,
lab_name VARCHAR(50) NOT NULL,
lab_incharge VARCHAR(50),
capacity INT DEFAULT 30,
equipment_count INT,
FOREIGN KEY (stream_code) REFERENCES streams(code)
);

CREATE TABLE school_clubs (
club_name VARCHAR(50) NOT NULL,
club_incharge VARCHAR(50),
members_count INT DEFAULT 0,
max_members INT NOT NULL
);

DROP TABLE IF EXISTS top_student_awards;
CREATE TABLE top_student_awards (
student_name VARCHAR(50) NOT NULL,
award_name VARCHAR(50) NOT NULL,
award_type VARCHAR(30) NOT NULL ,
award_date DATE NOT NULL,
description VARCHAR(255)
);

INSERT INTO streams (code, stream_name)
VALUES 
(1, 'Science'),
(2, 'Commerce'),
(3, 'Humanities'),
(4, 'Fine Arts');

ALTER TABLE top_student
ADD COLUMN teacher_id INT,
ADD CONSTRAINT student_teacher
FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id);


INSERT INTO teacher (teacher_name, stream_code, hire_date, salary, email)
VALUES 
('Ravi Kumar', 1, '2018-06-15', 55000, 'ravi.kumar@school.in'),
('Priya Sharma', 2, '2019-07-10', 60000, 'priya.sharma@school.in'),
('Arjun Mehta', 3, '2020-01-20', 58000, 'arjun.mehta@school.in'),
('Sneha Iyer', 4, '2017-09-05', 62000, 'sneha.iyer@school.in');

INSERT INTO top_student (student_name, stream_code, marks, teacher_id)
VALUES 
('Aarav Patel', 1, 85, 1),
('Ananya Sharma', 2, 92, 2),
('Rohan Mehta', 3, 89, 3),
('Isha Iyer', 4, 95, 4);

INSERT INTO top_authority (authority_name, position, experience_years, email, contact_no)
VALUES
('Rajesh Sharma', 'Manager', 15, 'rajesh.sharma@school.in', '9876543210'),
('Sunita Verma', 'Headmaster', 20, 'sunita.verma@school.in', '9876512340'),
('Anil Kapoor', 'Principal', 25, 'anil.kapoor@school.in', '9876523450');


INSERT INTO stream_details (stream_code,total_subjects,total_max_marks)
values (2,5,100),(1,5,100),(3,5,100),(4,5,80);

INSERT INTO fee_details (stream,class,max_fees)
VALUES 
('science',11,130000),
('commerce',11,128000),
('humanities',11,127500),
('fine arts',11,125000);

INSERT INTO transport (route_no, driver_name, vehicle_no, capacity)
VALUES
(1, 'Ramesh', 'DL01AB1234', 45),
(2, 'Mahesh', 'DL02CD5678', 40),
(3, 'Sunil', 'DL03EF9101', 42),
(4, 'Vijay', 'DL04GH1122', 38),
(5, 'Anil', 'DL05JK3344', 50);

INSERT INTO lab_details (lab_code, stream_code, lab_name, lab_incharge, capacity, equipment_count)
VALUES
(101, 1, 'Physics Lab', 'Dr. Rakesh Menon', 25, 40),
(102, 1, 'Chemistry Lab', 'Dr. Seema Sharma', 30, 35),
(103, 1, 'Biology Lab', 'Dr. Alok Verma', 20, 25);

INSERT INTO school_clubs (club_name, club_incharge, members_count, max_members)
VALUES
('Drama Club', 'Rohit Verma', 25, 30),
('Debate Club', 'Neha Singh', 20, 30),
('Music Club', 'Anjali Kapoor', 30, 30),
('Science Club', 'Arjun Mehta', 18, 30),
('Art Club', 'Sneha Iyer', 22, 30);

INSERT INTO top_student_awards (student_name, award_name, award_type, award_date, description)
VALUES
('Aarav Patel', 'Science Fair Winner', 'Academic', '2025-10-01', 'Outstanding project in Physics'),
('Aarav Patel', 'Basketball Team Captain', 'Sports', '2025-09-30', 'Led school basketball team to district finals'),

('Ananya Sharma', 'Debate Champion', 'Leadership', '2025-10-05', 'Led her team to victory in inter-school debate'),
('Ananya Sharma', 'Math Olympiad Winner', 'Academic', '2025-09-28', 'First prize in regional math competition'),

('Rohan Mehta', 'Painting Competition Winner', 'Arts', '2025-09-20', 'First prize in state-level painting competition'),
('Rohan Mehta', 'Drama Club Star', 'Cultural', '2025-10-02', 'Best actor in annual school drama'),

('Isha Iyer', 'Dance Competition', 'Cultural', '2025-10-10', 'Solo performance won first place'),
('Isha Iyer', 'Essay Writing Champion', 'Academic', '2025-09-25', 'Won inter-school essay competition');

SELECT stream_code, AVG(marks) AS avg_marks
FROM top_student
GROUP BY stream_code
HAVING AVG(marks) > 80
ORDER BY avg_marks DESC;

SELECT teacher_name, stream_code, salary, is_active
FROM teacher;

UPDATE teacher
SET salary = 65000
WHERE teacher_name = 'Ravi Kumar';

DELETE FROM top_student
WHERE student_name = 'Rohan Mehta';

INSERT INTO top_student (student_name, stream_code, marks, teacher_id)
VALUES ('Harsh Mehta', 3, 89, 3);

ALTER TABLE teacher ADD COLUMN experience_years INT DEFAULT 0;

ALTER TABLE teacher CHANGE COLUMN teacher_name full_name VARCHAR(50);

ALTER TABLE teacher MODIFY salary INT NULL;

TRUNCATE TABLE top_student_awards;
select*from top_student_awards;









