-- Querie #1
-- List the following details of each employee: 
-- employee number(employee), last name(employee), first name(employee), sex(employee)
-- and salary(salaries).
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

-- Querie #2
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Querie #3
-- List the manager of each department with the following information: department number
-- department name, the manager's employee number, last name, first name.

SELECT dept_managers.dept_no,
departments.dept_name,
dept_managers.emp_no,
employees.last_name,
employees.first_name
FROM dept_managers
INNER JOIN departments ON (dept_managers.dept_no = departments.dept_no)
INNER JOIN employees ON (dept_managers.emp_no = employees.emp_no)

-- Querie #4
-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_employees ON (dept_employees.emp_no = employees.emp_no)
INNER JOIN departments ON (dept_employees.dept_no = departments.dept_no)

-- Querie #5
-- List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- Querie #6
-- List all employees in the Sales department, including their employee number, last name
-- first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_employees ON (dept_employees.emp_no = employees.emp_no)
INNER JOIN departments ON (dept_employees.dept_no = departments.dept_no)
WHERE dept_name='Sales'

-- Querie #7
-- List all employees in the Sales and Development departments, including their employee number
-- last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees
INNER JOIN dept_employees ON (dept_employees.emp_no = employees.emp_no)
INNER JOIN departments ON (dept_employees.dept_no = departments.dept_no)
WHERE dept_name='Sales'OR dept_name='Development'

-- Querie #8
-- In descending order, list the frequency count of employee last names, i.e.
-- how many employees share each last name.
SELECT last_name,
COUNT (last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;