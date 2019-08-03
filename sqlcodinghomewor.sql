-- Create Table for departments
DROP TABLE departments;
--Drop table if exist
CREATE TABLE "departments" (
	--dept_no, dept_name
	id SERIAL PRIMARY KEY,
	"dept_no" VARCHAR NOT NULL,
	"dept_name" VARCHAR NOT NULL
	
);



-- create Table for dept_emp
--Drop table if exist
DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	--emp_no, dept_no, from_date, to_date
	id SERIAL PRIMARY KEY,
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


--Create Table for dept_manager
--Drop table if exist
DROP TABLE dept_manager;

CREATE TABLE dept_manager (
	--dept_no, emp_no, from_date, to_date
	id SERIAL PRIMARY KEY,
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


--Create Table for employees
--Drop table if exist
DROP TABLE employees;

CREATE TABLE employees (
	--emp_no, birth_date, first_name, last_name, gender, hire_date,
	id SERIAL PRIMARY KEY,
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

--Create Table for salaries
--Drop table if exist
DROP TABLE salaries;

CREATE TABLE salaries (
	--emp_no, salary, from_date, to_date
	id SERIAL PRIMARY KEY,
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);


--No id primary key created 
CREATE TABLE titles (
	--emp_no, title, from_date, to_date
	emp_no INTEGER NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);




--Query 01
--List the following details of each employee: employee number, last name, first name, gender, and salary.


SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--Query 02
--List employees who were hired in 1986.
SELECT hire_date, hire_date id
FROM employees
ORDER BY id = 1986;

--Query 03
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept_manager.dept_no, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date, departments.dept_name, departments.dept_no, employees.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON employees.emp_no = dept_manager.emp_no;

--Query 4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees, departments


--Query 5
-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name FROM employees
WHERE first_name in ('Hercules')
order by last_name in ('B%')

--Query 6
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, departments.dept_name
FROM employees, departments
WHERE dept_name in ('Sales')

--Query 7
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name, departments.dept_name
FROM employees, departments
WHERE dept_name in ('Sales', 'Development')
		
--Query 8
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT * FROM employees ORDER BY last_name DESC		