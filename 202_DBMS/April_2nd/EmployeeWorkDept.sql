

/*

2nd April 2025 (Wednesday) Lab on DB to create table Employee, Work, Dept




*/



CREATE DATABASE IF NOT EXISTS EmployeeWorkDept;


USE EmployeeWorkDept;
CREATE TABLE employee (
    e_id INT PRIMARY KEY,
    e_name VARCHAR(100),
    age INT,
    salary INT
);
INSERT INTO employee (e_id, e_name, age, salary)
VALUES 
(101, "Alice", 30, 90000),
(102, "Bob", 35, 120000),
(103, "Jyoti", 28, 70000),
(104, "Bristy", 40, 150000),
(105, "Hrisik", 32, 95000);

SELECT * FROM employee;
SHOW TABLES;


-- PCT: means part time

CREATE TABLE works (
    e_id INT,
    dept_id INT,
    pct_Time INT
);
INSERT INTO works (e_id, dept_id, pct_Time) 
VALUES
(101, 1, 50),
(101, 2, 50),
(102, 1, 100),
(103, 3, 100),
(104, 2, 100),
(105, 4, 100),
(105, 1, 50);


CREATE TABLE dept (
    D_id INT,
    budget INT,
    manage_id INT
);
INSERT INTO dept (D_id, budget, manage_id) 
VALUES
(1, 2000000, 104),
(2, 1500000, 102),
(3, 800000, 103),
(4, 3000000, 105);

SELECT * FROM dept;
SHOW TABLES;


/* Now ankit starts practice because aapne Chegebee SWE intern ka OA round nahi creack kiye 

Q1.  Print the names and ages of each employee who works in both the Hardware department 
and the Software department.

*/

SELECT e.e_name, e.age
FROM employee e
JOIN works w1 ON e.e_id = w1.e_id AND w1.dept_id = 1  -- Hardware department
JOIN works w2 ON e.e_id = w2.e_id AND w2.dept_id = 2  -- Software department
;




/*

Q2. For each department with more than 20 full-time-equivalent employees (i.e., where the 
part-time and full-time employees add up to at least that many full-time employees), print the 
did together with the number of employees that work in that department

*/

SELECT w.dept_id, SUM(w.pct_Time) / 100 AS num_of_employees
FROM works w
GROUP BY w.dept_id
HAVING SUM(w.pct_Time) / 100 >= 20;


-- Q3. Print the name of each employee whose salary exceeds the budget of all of the departments that he or she works in.
SELECT e.e_name
FROM employee e
JOIN works w ON e.e_id = w.e_id
JOIN dept d ON w.dept_id = d.D_id
GROUP BY e.e_id, e.e_name
HAVING MIN(e.salary) > MAX(d.budget);


-- Q4. Find the managerids of managers who manage only departments with budgets greater than $1,000,000.
SELECT DISTINCT d.manage_id
FROM dept d
WHERE d.budget > 1000000
GROUP BY d.manage_id
HAVING COUNT(*) = COUNT(CASE WHEN d.budget > 1000000 THEN 1 END);


-- Q5. Find the enames of managers who manage the departments with the largest budget.
SELECT e.e_name
FROM employee e
JOIN dept d ON e.e_id = d.manage_id
WHERE d.budget = (SELECT MAX(budget) FROM dept);


-- Q 6. If a manager manages more than one department, he or she controls the sum of all the budgets for those departments. 
-- Find the managerids of managers who control more than $5,000,000.

SELECT d.manage_id
FROM dept d
GROUP BY d.manage_id
HAVING SUM(d.budget) > 5000000;


-- Q 7. Find the managerids of managers who control the largest amount.

SELECT d.manage_id
FROM dept d
GROUP BY d.manage_id
HAVING SUM(d.budget) = (SELECT MAX(total_budget) 
                         FROM (SELECT SUM(budget) AS total_budget 
                               FROM dept 
                               GROUP BY manage_id) AS subquery);



-- done



