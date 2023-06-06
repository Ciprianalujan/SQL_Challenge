-- create employees table
CREATE TABLE employees (
		emp_no INT PRIMARY KEY NOT NULL, 
		emp_title_id VARCHAR(10) NOT NULL,
		birth_date DATE NOT NULL,
		first_name VARCHAR(15) NOT NULL,
		last_name VARCHAR(30) NOT NULL,
		sex_hire VARCHAR(5) NOT NULL,
		hire_date DATE NOT NULL	
);

-- create departments table
CREATE TABLE departments (
		dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
		dept_name VARCHAR(30) NOT NULL
);


-- create titles table
CREATE TABLE titles (
		title_id VARCHAR(10) NOT NULL,
		title VARCHAR(30) NOT NULL
);

-- create dept_emp table
CREATE TABLE dept_emp (
		emp_no INT NOT NULL,
		dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- create salaries table
CREATE TABLE salaries (
		emp_no INT NOT NULL,
		salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- create dept_manager table
CREATE TABLE dept_manager (
		dept_no VARCHAR(10) NOT NULL,
		emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);