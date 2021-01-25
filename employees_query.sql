DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Titles;
DROP TABLE Departments;
DROP TABLE Department_Employee;
DROP TABLE Department_Manager;

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date VARCHAR   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date VARCHAR   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);
SELECT * FROM Employees;

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries;

CREATE TABLE Titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
	PRIMARY KEY(title)
);

SELECT * FROM Titles;

CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM Departments;

CREATE TABLE Department_Employee (
    emp_no INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
    dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Department_Employee;

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no),
    emp_no INT   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Department_Manager;