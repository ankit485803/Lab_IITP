
-- 12th Feb 2025 (Monday) Create unversity database


CREATE DATABASE unversitydb;
USE unversitydb;

-- now using this db apko five tables create karna hai: student, dept, faculty, courses, Enrollment
USE unversitydb;
CREATE TABLE students(
	student_id INT PRIMARY KEY,
    firstName VARCHAR (50) NOT NULL,
    lastName VARCHAR (50) NOT NULL,
    DOB DATE,
    email VARCHAR(100) UNIQUE NOT NULL,
    phoneNo VARCHAR(15) UNIQUE,
    departmentID INT,
    deptName VARCHAR(50)
);
SELECT * FROM students;
SHOW TABLES;
INSERT INTO students (student_id, firstName, lastName, DOB, email, phoneNo, departmentID, deptName)
VALUES
(1, 'Sanchita', 'Mandal', '2004-06-22', 'sanchita22@gmail.com', '+91 9339051844', 101, 'Master in Geoinformatics'),
(2, 'Hrisik', 'Rana', '2003-01-02', 'hrisik2003@cu.ac.in', '+91 9477611872', 102, 'BTech in Aerospace'),
(3, 'Jyotika', 'Jayani', '2003-02-06', 'jyotika2006@kiit.ac.in', '+91 8071695248', 103, 'BTech in Computer Science and Engineering'),
(4, 'Bristy', 'Mahato', '2004-06-22', 'bristy14@purnma.ac.in', '+91 9339558336', 104, 'BTech in CSE'),
(5, 'Ankit', 'Kumar', '2006-01-04', 'ankit127@iitp.ac.in', '+91 7970577531', 105, 'Bachelor in Computer Science and Data Analytics');
SELECT * FROM students;



USE unversitydb;
CREATE TABLE departments (
	deptID INT PRIMARY KEY,
    deptName VARCHAR(100) UNIQUE NOT NULL
);
INSERT INTO departments (deptID, deptName)
VALUES
(11, "Computer Science and Engineering (CSE)"),
(12, "Electronics and Communication Engg (ECE)" ),
(13, "Mechanical Engineering (ME)"),
(14, "Civil Enggg"),
(15, "Enviromental Engg");
SELECT * FROM departments;


USE unversitydb;
CREATE TABLE faculty (
    facultyID INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE,
    deptName VARCHAR(100) NOT NULL
);
INSERT INTO faculty (facultyID, firstName, lastName, email, phone, deptName)
VALUES
(101, 'Dr Joydeep', 'Chandra', 'joydeep@iitp.ac.in', '031123456789', 'Computer Science and Engg'),
(102, 'Sripana', 'Saha', 'sripana@iitp.ac.in', '6333333333336', 'Comp Sci and Engg'),
(103, 'Daya Sagar', 'Gupta', 'daya@iitp.ac.in', '99999999999', 'Dept of Mathematics');
SELECT * FROM faculty;


USE unversitydb;
CREATE TABLE courses (
	courseID INT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    deptID INT,
    facultyName VARCHAR(100) NOT NULL
);
ALTER TABLE courses
ADD COLUMN deptName VARCHAR(100);
ALTER TABLE courses
DROP COLUMN deptID;

INSERT INTO courses (courseID, courseName, credits, deptName, facultyName)
VALUES
(202, 'DBMS', 10,  'CSDA', 'Ranjeet Ranjan Jha'),
(204, 'Comp Org and Architecture', 20, 'CSDA', 'Daya Sagar Gupta'),
(2026, 'Adv ML', 10, 'CSDA', 'Kuldeep Singh Patel'),
(208, 'WebAppDesign', 15, 'CSDA', 'Dr. Muneendra Ojha');
SELECT * FROM courses;



