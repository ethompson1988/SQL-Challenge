CREATE TABLE departments(
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);
	
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title VARCHAR NOT NULL,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
	
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
	
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
	
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s
ON e.emp_no=s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de
ON e.emp_no=de.emp_no
JOIN departments d
ON de.dept_no=d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name ILIKE 'b%'