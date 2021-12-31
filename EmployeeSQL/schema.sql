DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Titles;
DROP TABLE Departments;
DROP TABLE Department_Employee;
DROP TABLE Department_Manager;

CREATE TABLE Titles (
    title_id VARCHAR PRIMARY KEY,
    title VARCHAR NOT NULL
);
SELECT * FROM Titles;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL
);
SELECT * FROM employees;


CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);
SELECT * FROM Salaries;

CREATE TABLE Departments (
    dept_no VARCHAR   PRIMARY KEY,
    dept_name VARCHAR   NOT NULL
);

SELECT * FROM Departments;

CREATE TABLE Department_Employee (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL
);

SELECT * FROM Department_Employee;

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL
);

SELECT * FROM Department_Manager;


