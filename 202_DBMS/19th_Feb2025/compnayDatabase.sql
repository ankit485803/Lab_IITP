
-- 19th Feb 2025 (Wednesday) Lab on DB and table creation in MySQL

CREATE DATABASE companydatabase;

-- using this DB create two tables === employess and departments 
USE companydatabase;
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    salary INT,
    dept_id INT NOT NULL,
    hireDate DATE NOT NULL
);
SELECT * FROM employees;
SHOW TABLES;

INSERT INTO employees (employee_id, firstName, lastName, salary, dept_id, hireDate)
VALUES
(101, 'Alice', 'Johson', 75000, 1, '2018-06-12'),
(102, 'Bob', 'Smith', 85000, 2, '2015-06-25'),
(103, 'Charlie', 'Brown', 60000, 1, '2020-03-14'),
(104, 'David', 'Wilson', 95000, 3, '2012-01-10'),
(105, 'Eve', 'Adams', 50000, 2, '2021-07-30');

-- updating names with our TechClub AIMLDL domain 
UPDATE employees
SET firstName = 'Purnasha', lastName = 'Priya'
WHERE employee_id = 101;

UPDATE employees
SET firstName = 'Ankit', lastName = 'Kumar'
WHERE employee_id = 102;

UPDATE employees
SET firstName = 'Anshank', lastName = 'Gupta'
WHERE employee_id = 103;

UPDATE employees
SET firstName = 'Harsh', lastName = 'Kumar'
WHERE employee_id = 104;

UPDATE employees
SET firstName = 'Ananya', lastName = 'Kar'
WHERE employee_id = 105;

SELECT * FROM employees;
SHOW TABLES;







USE companydatabase;
CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
    deptName VARCHAR(50) NOT NULL
);
SELECT * FROM departments;
SHOW TABLES;

INSERT INTO departments (dept_id, deptName)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

-- Q2. display firstName, lastName, salary and departmentName
SELECT e.firstName, e.lastName, e.salary, d.deptName
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- Q3. add the column that show average salary in dept
SELECT e.firstName, e.lastName, e.salary, d.deptName,
       avg_dept.avg_salary_in_dept
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN (
    SELECT dept_id, AVG(salary) AS avg_salary_in_dept
    FROM employees
    GROUP BY dept_id
) AS avg_dept ON e.dept_id = avg_dept.dept_id;

-- Q4. add the column that show the highest salary across all departments
SELECT MAX(salary) AS max_salary_across_depts
FROM employees;

-- Q5. add a column that show the total no of employees in their dept
SELECT e.firstName, e.lastName, e.salary, d.deptName,
       (SELECT COUNT(*) FROM employees WHERE dept_id = e.dept_id) AS total_employees_in_dept
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;


-- Q6. add the column that display the name of most senior employee (earliest_hire_date) in their dept
SELECT e.firstName, d.deptName, e.hiredate,
       (SELECT CONCAT(firstName, ' ', lastName) 
        FROM employees 
        WHERE dept_id = e.dept_id 
        ORDER BY hireDate 
        LIMIT 1) AS most_senior_employee
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;



