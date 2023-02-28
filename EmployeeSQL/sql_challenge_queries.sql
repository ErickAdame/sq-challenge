--Create all Six Tables and Import
CREATE TABLE Departments (
	dept_no VARCHAR(255) PRIMARY KEY,
	dept_name VARCHAR(22)
);


CREATE TABLE Salaries (
	emp_no INT PRIMARY KEY,
	salary INT
);

CREATE TABLE Titles (
	title_id VARCHAR(255) PRIMARY KEY,
	title VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(255),
	birth_date VARCHAR(255),
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

CREATE TABLE Dept_Manager(
	dept_no VARCHAR(255),
	emp_no INT PRIMARY KEY
);

CREATE TABLE Dept_Employee(
	emp_no INT,
	dept_no VARCHAR(255),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

--------Continuing to Analysis

---
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;

---
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

---
SELECT  Dept_Manager.dept_no, Departments.dept_name, Dept_Manager.emp_no, employees.first_name as "Manager_First_Name", employees.last_name as "Manager_Last_Name"
FROM Dept_Manager
INNER JOIN Departments ON
Dept_Manager.dept_no=Departments.dept_no
INNER JOIN employees
ON employees.emp_no=dept_manager.emp_no;

---

SELECT dept_employee.dept_no, departments.dept_name, employees.emp_no, employees.first_name, employees.last_name
FROM dept_employee
INNER JOIN Departments ON
dept_employee.dept_no=departments.dept_no
INNER JOIN employees
on employees.emp_no=dept_employee.emp_no;

---

SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%'

---

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON
employees.emp_no=dept_employee.emp_no
INNER JOIN departments ON
departments.dept_no=dept_employee.dept_no
WHERE dept_name='Sales';

---

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_employee ON
employees.emp_no=dept_employee.emp_no
INNER JOIN departments ON
departments.dept_no=dept_employee.dept_no
WHERE dept_name='Sales'
or dept_name='Development';

---
SELECT last_name, COUNT(last_name) as "Name Count"
FROM employees
GROUP BY last_name
order by "Name Count" DESC;

