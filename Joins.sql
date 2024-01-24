

-- JOINS ...used to combine two or more tables based on related col btw them

-- Inner Join: rec that have matching val in both tables

-- Syntax: SELECT col(s)
-- FROM tabA
-- INNER JOIN tabB
-- ON tabA.col_name = tabB.col_name;


CREATE DATABASE Wadia;
USE Wadia;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(id, name)
VALUES
(101, "Shubham"),
(102, "Om"),
(103, "Disha");


SELECT * FROM student;

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course 
(id, course)
VALUES
(102, "English"),
(105, "Maths"),
(103, "Science"),
(107, "CS");

SELECT * FROM course;

SELECT * 
FROM student
INNER JOIN course
ON student.id = course.id;

-- ----------------------------------------- 	

-- Left Join: returns all the records from left table and the matched records from the right table

-- Syntax:
-- SELECT col(s)
-- FROM tabA
-- LEFT JOIN tabB
-- ON tabA.col_name = tabB.col_name;

SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id;

-- --------------------------------------------------

-- Right Join: returns all the records from right table and matched rec from left table

-- Syntax:
-- SELECT * 
-- FROM tabA
-- RIGHT JOIN tabB
-- ON tabA.col_name = tabB.col_name;

SELECT * 
FROM student
RIGHT JOIN course
ON student.id = course.id;

-- -----------------------------------------

-- Full Join: returns all records when there is a match in either left or right table

-- Syntax:
-- LEFT UNION RIGHT  ....for MySQL
-- not used in MySQL

SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id
UNION
SELECT * 
FROM student
RIGHT JOIN course
ON student.id = course.id;

-- -------------------------------------------

-- Left Exclusive Join - tabB.col_name IS NULL

SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL;

-- -----------------------------------------

-- Right Exclusive Join - tabA.col_name IS NULL

SELECT * 
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;

-- ----------------------------------------

-- FULL EXCLUSIVE JOIN:

SELECT * 
FROM student
LEFT JOIN course
ON student.id = course.id
WHERE course.id IS NULL
UNION
SELECT * 
FROM student
RIGHT JOIN course
ON student.id = course.id
WHERE student.id IS NULL;


-- -------------------------------------------------------

-- SELF JOIN: reg. join but it is joined with itself

-- Syntax:
-- SELECT col(s)
-- FROM tab AS a
-- JOIN tab AS b
-- ON a.col_name = b. col_name;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "Apurva", 103),
(102, "Jogesh", 104),
(103, "Nilesh", NULL),
(104, "Mitali", 103);

SELECT * FROM employee;

SELECT a.name as manager_name, b.name 
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;


-- ---------------------------------------------------------------------------

-- UNION: combines result set of 2 or more select statements and gives unique records

-- conditions: every select should have same no. of cols, cols must have same data types, cols in every select must have same order

-- Syntax:
-- SELECT col(s) FROM tabA
-- UNION
-- SELECT col(s) FROM tabB

-- UNION ALL - allows duplicate val


SELECT name FROM employee
UNION ALL 
SELECT name FROM employee;

-- --------------------------------------------------------- 	




