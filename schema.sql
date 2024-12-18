-- To be safe, erase tables in case there were their from a previous attempt or similar project
DROP TABLE salaries;
DROP TABLE employees;
DROP TABLE dept_manager;
DROP TABLE dept_emp;
DROP TABLE titles;
DROP TABLE departments;

-- Create all tables

CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(5) NOT NULL,
	hire_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES dept_emp(emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL PRIMARY KEY,
    dept_no VARCHAR(5) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE titles ( 
	title_id VARCHAR(5) NOT NULL PRIMARY KEY, 
	title VARCHAR(25) NOT NULL 
); 

CREATE TABLE departments (
    dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(25) NOT NULL
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(5) NOT NULL PRIMARY KEY,
	emp_no INT NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- View all tables after data import
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;