-- list the employee number, last name, first name, sex, and salary of each employee
SELECT s.emp_no, e.last_name, e.first_name, e.sex_hire, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

-- list the first name, last name, and hire date for the employees who were hired in 1986
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- list the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT DISTINCT ON (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments
ON dept_manager.emp_no = employees.emp_no;

-- list the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS dep
ON e.emp_no = dep.emp_no
INNER JOIN departments AS d
ON dep.dept_no = d.dept_no;

-- list first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT e.last_name, e.first_name
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%');

-- list each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
ON e.emp_no = d.dept_name
INNER JOIN departments AS d
WHERE LOWER(d.dept_name) = 'sales';

-- list each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
ON e.emp_no = d.dept_name
INNER JOIN departments AS d
WHERE LOWER(d.dept_name) = 'sales' OR (LOWER(d.dept_name) = 'development');

-- list the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;