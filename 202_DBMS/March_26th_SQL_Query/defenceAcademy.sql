

-- 26th March 2025 (Wednesday) Lab on practice Query

CREATE DATABASE defenceAcademy;

-- apko 4 tables create karna hai std, faculty, enrolled, class tables and then query to practice karna hai

USE defenceAcademy;
CREATE TABLE student (
	RollNo INT PRIMARY KEY,
	StudentName VARCHAR(100) NOT NULL,
    major VARCHAR(50),
    level VARCHAR(30),
    age INT NOT NULL
);

INSERT INTO student (RollNo, StudentName, major, level, age) 
VALUES
(01, "Jyotika Jayani", "CompSci", "JR-Junior", 20),
(02, "Hrisik Rana", "Aerospace Engg", "SR-Senior", 19),
(03, "Bristy Mahato", "Freelancing", "FR-Fresher", 21),
(04, "Ankit Kumar", "Maths", "SR", 19);

SELECT * FROM student;
SHOW TABLES;

CREATE TABLE faculty (
	F_id INT PRIMARY KEY,
    F_Name VARCHAR(110) NOT NULL,
    Dept_Id INT NOT NULL
);

INSERT INTO faculty (F_id, F_Name, Dept_Id)
VALUES
(11, "Hina Pandey Mam", 01),
(12, "Asfa Siddiqui", 02),
(13, "Poonam Seth Tiwari", 03);

SELECT * FROM faculty;
SHOW TABLES;

CREATE TABLE enrolled (
	E_Id INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL
);

INSERT INTO enrolled (E_Id, CourseName)
VALUES
(1, "CS101"),
(2, "Hist1"),
(3, "Math1"),
(4, "Math1"),
(5, "CS102"),
(6, "Hist2"),
(7, "CS101");

CREATE TABLE class (
	name VARCHAR(50) NOT NULL,
    meet_at TIME,
    room VARCHAR(20),
    F_id INT
);

INSERT INTO class (name, meet_at, room, F_id) 
VALUES
("CS101", "10:00:00", "R128", 1),
("Math1", "11:00:00", "R130", 2),
("Hist1", "12:00:00", "R128", 3), 
("CS102", "13:00:00", "R130", 1);

SELECT * FROM class;
SHOW TABLES;



-- Now solve these ques from given database and tables
-- Q1.	Find the names of all Juniors (Level = JR) who are enrolled in a class taught by I. Teach
SELECT s.StudentName
FROM student s
JOIN enrolled e ON s.RollNo = e.E_Id 
JOIN class c ON e.CourseName = c.name
JOIN faculty f ON c.F_id = f.F_id
WHERE s.level = 'JR-Junior' AND f.F_Name = 'I. Teach.';


-- Q2. Find the age of the oldest student who is either a History major or is enrolled in a course taught by I. Teach.
SELECT MAX(s.age) AS oldest_age
FROM student s
LEFT JOIN class c ON s.RollNo = c.F_id  
LEFT JOIN faculty f ON c.F_id = f.F_id
WHERE s.major = 'History' OR f.F_Name = 'I. Teach.';


-- Q3. Find the names of all classes that either meet in room R128 or have five or more students    enrolled.

-- Q4. Find the names of all students who are enrolled in two classes that meet at the same time.
SELECT s.StudentName
FROM student s
JOIN enrolled e1 ON s.RollNo = e1.E_Id
JOIN class c1 ON e1.CourseName = c1.name
JOIN enrolled e2 ON s.RollNo = e2.E_Id
JOIN class c2 ON e2.CourseName = c2.name
WHERE c1.meet_at = c2.meet_at
AND e1.E_Id != e2.E_Id;


-- Q5. Find the names of faculty members for whom the combined enrollment of the courses that they teach is less than five.
SELECT f.F_Name
FROM faculty f
JOIN class c ON f.F_id = c.F_id
LEFT JOIN enrolled e ON c.name = e.CourseName
GROUP BY f.F_id
HAVING COUNT(e.E_Id) < 5;

-- Q6. Print the Level and the average age of students for that Level, for each Level.
SELECT s.level, AVG(s.age) AS average_age
FROM student s
GROUP BY s.level;





-- Q7. Print the Level and the average age of students for that Level, for all Levels except JR.
SELECT s.level, AVG(s.age) AS average_age
FROM student s
WHERE s.level != 'JR-Junior'
GROUP BY s.level;


-- Q8. Find the names of students who are enrolled in the maximum number of classes.
SELECT s.StudentName
FROM student s
JOIN enrolled e ON s.RollNo = e.E_Id
GROUP BY s.RollNo
HAVING COUNT(e.E_Id) = (
    SELECT MAX(class_count)
    FROM (
        SELECT COUNT(e1.E_Id) AS class_count
        FROM enrolled e1
        GROUP BY e1.E_Id
    ) AS max_enrollment
);



-- Q9. Find the names of students who are not enrolled in any class.
SELECT s.StudentName
FROM student s
LEFT JOIN enrolled e ON s.RollNo = e.E_Id
WHERE e.E_Id IS NULL;






























