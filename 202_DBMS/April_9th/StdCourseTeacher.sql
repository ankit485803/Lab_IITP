

/*

9th April 2025 (Wednesday) StdCourseTeacher  -- Lab on Having, Exits, All  clauses

*/

CREATE DATABASE University;
USE University;


CREATE TABLE Department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget FLOAT
);
INSERT INTO Department (dept_name, building, budget) VALUES
('Computer Science', 'Taylor', 100000),
('Maths', 'Euler', 90000),
('Physics', 'Newton', 85000);
SELECT * FROM Department;
SHOW TABLES;



CREATE TABLE Instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary FLOAT,
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);
INSERT INTO Instructor (ID, name, dept_name, salary) 
VALUES 
(101, "Dr. Smith", "Computer Science", 90000.0),
(102, "Dr Jhonson", "Maths", 85000.00),
(103, "Dr Lee", "Physics", 87000.50);
SELECT * FROM Instructor;
SHOW TABLES;






CREATE TABLE Student (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);
ALTER TABLE Student
ADD COLUMN tot_cred INT;

INSERT INTO Student (ID, name, dept_name, tot_cred) 
VALUES
(1, "Ankit Kumar", "Computer Science", 120),
(2, "Samarth Mishra", "Maths", 90),
(3, "Aditya Pandey", "Physics", 100);
SELECT * FROM Student;
SHOW TABLES;



CREATE TABLE Course (
    course_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES Department(dept_name)
);
INSERT INTO Course (course_id, title, dept_name, credits) VALUES
("CS101", "Intro to CS", "Computer Science", 4),
("Math103", "Calculus I", "Maths", 3),
("Phy105", "Physics I", "Physics", 4);
SELECT * FROM Course;
SHOW TABLES;




-- -- Takes table (Students taking courses)
CREATE TABLE Takes (
    ID INT,
    course_id VARCHAR(10),
    PRIMARY KEY (ID, course_id),
    FOREIGN KEY (ID) REFERENCES Student(ID),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);
ALTER TABLE Takes
ADD COLUMN semester VARCHAR(10),
ADD COLUMN year INT,
ADD COLUMN grade VARCHAR(2);

INSERT INTO Takes (ID, course_id, semester, year, grade) VALUES
(1, "CS101", "Fall", 2024, "A"),
(2, "Math103", "Spring", 2025, "B"),
(3, "Phy105", "Fall", 2023, "A");
SELECT * FROM Takes;
SHOW TABLES;



-- Teaches table (Instructors teaching courses)
CREATE TABLE Teaches (
    ID INT,
    course_id VARCHAR(10),
    PRIMARY KEY (ID, course_id),
    FOREIGN KEY (ID) REFERENCES Instructor(ID),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

SHOW TABLES;



/*
Qno 1:  Write a query to fnd all departments where the average credits of 
courses offered is more than 3. Display the department name and the
 average credits.
 
*/
SELECT dept_name, AVG(credits) AS avg_credits
FROM Course
GROUP BY dept_name
-- HAVING avg_credits > 3;
HAVING AVG(credits) > 2;


/*
Qno 2:  EXISTS Clause:
 Find all students who have taken all courses offered by the 
'Computer Science' department.

*/
SELECT S.ID, S.name
FROM Student S
WHERE NOT EXISTS (
	SELECT C.course_id
    FROM Course C 
    WHERE C.dept_name = "Computer Science"
    
    AND NOT EXISTS (
		SELECT T.course_id
        FROM Takes T 
        WHERE T.ID = S.ID  AND  T.course_id = C.course_id
    )
);



/*
Qno 3: ALL Clause:
 Find the names of instructors who have a higher salary than all 
instructors in the 'Physics' department

*/

SELECT name
FROM Instructor
WHERE salary > ALL (
    SELECT salary
    FROM Instructor
    WHERE dept_name = 'Physics'
);


/*
Qno 4: Combination (HAVING and EXISTS):
 List all courses that have been taken by all students in the 
'Computer Science' department. Display the course ID and title.

*/
SELECT C.course_id, C.title
FROM Course C
WHERE NOT EXISTS (
    SELECT S.ID
    FROM Student S
    WHERE S.dept_name = 'Computer Science'
    AND NOT EXISTS (
        SELECT T.course_id
        FROM Takes T
        WHERE T.course_id = C.course_id AND T.ID = S.ID
    )
);



/*
Qno 5: Nested Subquery with EXISTS:
 Find all students who have taken at least one course with every 
instructor in their department

*/
SELECT S.ID, S.name
FROM Student S
WHERE NOT EXISTS (
    SELECT I.ID
    FROM Instructor I
    WHERE I.dept_name = S.dept_name
    AND NOT EXISTS (
        SELECT T.course_id
        FROM Takes T
        JOIN Teaches TE ON T.course_id = TE.course_id
        WHERE T.ID = S.ID AND TE.ID = I.ID
    )
);





-- Happy Coding MySQL




