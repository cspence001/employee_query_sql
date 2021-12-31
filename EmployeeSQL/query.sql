---List the following details of each employee: 
---employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex,
	salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

---List first name, last name, and hire date for 
---employees who were hired in 1986.
---2/Activities/06-Ins_Subqueries
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

---List the manager of each department with the following information:
---department number, department name, the manager's employee number, 
---last name, first name.
SELECT departments.dept_no, 
departments.dept_name, 
department_manager.emp_no,
employees.first_name, employees.last_name
FROM ((department_manager
INNER JOIN departments ON
departments.dept_no=department_manager.dept_no)
INNER JOIN employees ON
department_manager.emp_no=employees.emp_no);

---List the department of each employee with the following information:
---employee number, last name, first name, and department name.
SELECT department_employee.emp_no, 
employees.last_name, 
employees.first_name,
departments.dept_name
FROM ((employees
JOIN department_employee ON
department_employee.emp_no=employees.emp_no)
JOIN departments ON
departments.dept_no=department_employee.dept_no);

---List first name, last name, and sex for employees whose 
---first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


---List all employees in the Sales department, including their 
---employee number, last name, first name, and department name.
SELECT department_employee.emp_no, 
employees.last_name, 
employees.first_name,
departments.dept_name
FROM ((employees
JOIN department_employee ON
department_employee.emp_no=employees.emp_no)
JOIN departments ON
departments.dept_no=department_employee.dept_no)
WHERE departments.dept_name = 'Sales';

---List all employees in the Sales and Development departments, including 
---their employee number, last name, first name, and department name.
SELECT department_employee.emp_no, 
employees.last_name, 
employees.first_name,
departments.dept_name
FROM ((employees
JOIN department_employee ON
department_employee.emp_no=employees.emp_no)
JOIN departments ON
departments.dept_no=department_employee.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

---In descending order, list the frequency count of employee last names, 
---i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_title_id) AS "Total Names"
FROM employees
GROUP BY last_name
ORDER BY "Total Names" DESC;

---Get Count of employees in each department, in descending order, alphabetical by department if depart employee counts equal. 
SELECT COUNT(*) AS "emp_count", departments.dept_name
FROM employees 
JOIN department_employee ON
department_employee.emp_no=employees.emp_no
JOIN departments ON
departments.dept_no=department_employee.dept_no
GROUP BY departments.dept_name
ORDER BY "emp_count" DESC, departments.dept_name ASC;
