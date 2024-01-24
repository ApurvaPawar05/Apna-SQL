-- CREATE DATABASE temp1;
-- CREATE DATABASE temp2;

-- DROP DATABASE temp1;
-- DROP DATABASE temp2;

-- --------------------------------------------------------------------

CREATE DATABASE clg;
USE clg;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL

);

INSERT INTO student VALUES (1, "Apurva", 21);
INSERT INTO student VALUES (2, "Arpita", 21);

SELECT * FROM student;

-- -----------------------------------------------------------------------

-- Theory Part

-- DataTypes.....

-- Types of SQL Commands
-- DDL - create, drop, alter, rename, truncate
-- DQL - select
-- DML - insert, update, delete
-- DCL - grant & revoke
-- TCL - commit, rollback

-- -----------------------------------------------------------------

-- DATABASE RELATED QUERIES

-- while creating db use the query to avoid errors....    CREATE DATABASE IF NOT EXISTS db_name;
-- while droping db use the query to avoid errors....     DROP DATABASE IF EXISTS db_name;


SHOW DATABASES;
SHOW TABLES;

-- ------------------------------------------------------------------------------------------------

-- TABLE RELATED QUERIES

CREATE TABLE stud1(
rollno INT PRIMARY KEY,
name VARCHAR(25)
);

SELECT * FROM stud1;

INSERT INTO stud1 
(rollno, name)

VALUES
(101, "Apurva"),
(102, "Arpita"),
(103, "Nilesh"),
(104, "Jogeshwari"),
(105, "Adesh"),
(106, "Mitali"),
(107, "Gayatri");

INSERT INTO stud1 VALUES (108, "Shubham");

-- -----------------------------------------------------------------------------

-- KEYS

-- PRIMARY KEY 		-- FOREIGN KEY

-- -----------------------------------------------------------------------------

-- CONSTRAINTS .....specify rules for data ina a table

-- NOT NULL, UNIQUE, PRIMARY KEY- by default unique and not null, FOREIGN KEY, DEFAULT, check table


-- ----------------------------------------------------------------------------

CREATE DATABASE collegee;
USE collegee;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student 
(rollno, name, marks, grade, city)
VALUES
(101, "Apurva", 95, "A", "Pune"),
(102, "Asmita", 82, "B", "Karad"),
(103, "Sakshi", 74, "C", "Mumbai"),
(104, "Aditya", 86, "B", "Satara"),
(105, "Karan", 91, "A", "Nagpur"),
(106, "Anuja", 96, "A", "Pune");


-- -------------------------------------------


CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

SELECT * FROM dept;

INSERT INTO dept
VALUES
(101, "CS"),
(102, "ENTC");

UPDATE dept
SET id = 105
WHERE name = "CS";

-- -------------------------------------

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

SELECT * FROM teacher;

DROP TABLE teacher;

INSERT INTO teacher 
VALUES
(1, "Shubham", 101),
(2, "Shivam", 102);

-- -----------------------------------------------------



-- SELECT in detail


SELECT name, marks 
FROM student;

SELECT * FROM student;

-- WHERE CLAUSE .....To define some conditions

SELECT * FROM student WHERE marks >70 AND city = "Mumbai";

-- Operators in WHERE:-

-- Arithmetic - +,-,*,/,%
-- Comparision - =,!=, >, >=, <, <= 
-- Logical - AND, OR, NOT, IN, BETWEEN, ALL, LIKE, ANY
-- Bitwise - &, |  

-- LIMIT Clause..... sets upper limit on no. of rows to be returned

SELECT * FROM student WHERE marks > 80 LIMIT 3;

-- ORDER BY Clause .....sorts in ASC/ DESC order

SELECT * FROM student ORDER BY city ASC;
SELECT * FROM student ORDER BY marks DESC LIMIT 3;

-- ----------------------------------------------------------------------------------------

-- Aggregate Functions  .....perform calc on set on values and returns a single values

-- COUNT(), MAX(), MIN(), SUM(), AVG()

SELECT COUNT(rollno) FROM student;
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT SUM(marks) FROM student;
SELECT AVG(marks) FROM student;

-- --------------------------------------------------------------------------------------

-- GROUP BY Clause .....groups rows that have same values into summary rows
-- collects the data from multiple records and groups result by one/more col.
-- used with some aggregate function

SELECT city, COUNT(name)
FROM student
GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city;


-- Prac Ques
-- 1. Avg marks of each city in ASC order-

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY AVG(marks) DESC;

-- 2. total payment acc. to each payment method

SELECT mode, COUNT(customers)
FROM payment
GROUP BY mode;

-- 3. On basis of grade, give the count of students-

SELECT grade, COUNT(name)
FROM student
GROUP BY grade;

-- HAVING Clause .....similar like WHERE , used to apply any condition after grouping

-- Q. give the count of students from each city that have marks > 90

SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING max(marks) > 90 ;

-- GENERAL ORDER OF COMMANDS

-- SELECT col(s)
-- FROM tab_name
-- WHERE cond
-- GROUP BY col(s)
-- HAVING cond
-- ORDER BY col(s) ASC;

SELECT city 
FROM student
WHERE grade = "A"
GROUP BY city
HAVING max(marks) > 90
ORDER BY city DESC;


-- -------------------------------------------------------------------------------------------

-- TABLE related queries

-- UPDATE : Syntax -> UPDATE tab_name SET col1 = val1, col2 = val2 WHERE cond;

SET SQL_SAFE_UPDATES = 0;

UPDATE student 
SET grade = "O"
WHERE grade = "A";

SELECT * FROM student;

UPDATE student 
SET marks = 79
WHERE rollno = 105;

UPDATE student
SET marks = marks + 1;

-- DELETE 

-- Syntax: DELETE FROM tab_name	WHERE cond;

UPDATE student
SET marks = 12
WHERE rollno = 106;

DELETE FROM student
WHERE marks < 33;

-- -----------------------------------------------------------------------

-- FOREIGN KEYS

-- Cascading in FK's    .....del from everywhere/ change is reflected everywhere

-- On DEL cascade 
-- On Update cascade

-- ----------------------------------------------------------------------------


-- ALTER .....to change the schema

-- ADD Column:

-- ALTER TABLE tab_name
-- ADD COLUMN col_name DATATYPE constraint;

-- DROP Column:

-- ALTER TABLE tab_name
-- DROP COLUMN col_name;

-- RENAME table:

-- ALTER TABLE tab_name
-- RENAME TO new_tab_name;

-- Modify Column: ... to mofify datatype/ constraint

-- ALTER TABLE tab_name
-- MODIFY col_name new_datatype new_constraint;

-- Change Column: .....rename

-- ALTER TABLE tab_name
-- CHANGE old_name new_name new_datatype new_constraint;

SELECT * FROM stu;

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE student
CHANGE age stud_age INT;

ALTER TABLE student
DROP COLUMN stud_age;

ALTER TABLE student
RENAME TO stu;

-- ---------------------------------------------------------------------------

-- TRUNCATE .....to delete table's data

-- TRUNCATE TABLE tab_name;

-- ----------------------------------------------------------------------------

-- Prac Ques:

-- name to full_name:

ALTER TABLE stu
CHANGE name full_name VARCHAR(50);

DELETE FROM stu
WHERE marks < 80;

ALTER TABLE stu
DROP COLUMN grade;

-- ---------------------------------------------------------------


-- SUB-QUERIES...nested queries i.e query within query


-- Syntax:
-- SELECT col(s)
-- FROM tab_name
-- WHERE col_name operator
-- (subquery);

SELECT * FROM stu;

SELECT AVG(marks)
FROM stu;

SELECT full_name, marks
FROM stu
WHERE marks > (SELECT AVG(marks) FROM stu);

-- -----------------------------------------------------------------


SELECT rollno
FROM stu
WHERE rollno%2 = 0;

SELECT full_name, rollno
FROM stu
WHERE rollno IN (SELECT rollno FROM stu WHERE rollno%2 = 0);


-- -------------------------------------------------------------

SELECT * FROM stu;


UPDATE stu
SET city = "Satara"
WHERE rollno = 102;

-- max marks of students from satara

SELECT MAX(marks)
FROM stu
WHERE city = "Satara";

SELECT MAX(marks)
FROM (SELECT * FROM stu WHERE city = "Satara") AS temp;

-- --------------------------------------------------

-- Views: virtual table based on result set 

CREATE VIEW view1 AS
SELECT rollno, full_name, marks
FROM stu;

SELECT * FROM view1
WHERE marks> 90;

DROP VIEW view1;

-- ---------------------------------------------


























