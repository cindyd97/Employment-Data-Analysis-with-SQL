-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries on employees.emp_no = salaries.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1996
;

-- 3. List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT 
    d.dept_no,
    d.dept_name,
    e.emp_no,
    e.last_name,
    e.first_name
FROM 
    departments d
JOIN 
    dept_manager dm ON d.dept_no = dm.dept_no
JOIN 
    employees e ON dm.emp_no = e.emp_no
;

-- 4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT 
    de.dept_no,
	de.emp_no,
    e.last_name,
    e.first_name,
	d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and
--whose last name begins with the letter B.
SELECT 
	e.first_name, 
	e.last_name, 
	e.sex
FROM 
	employees e
WHERE 
	e.first_name = 'Hercules'
AND
	e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name,
--and first name.
SELECT 
    de.emp_no,
    e.last_name,
    e.first_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
	d.dept_no = 'd007';

-- 7. List each employee in the Sales and Development departments, including their employee
--number, last name, first name, and department name.
SELECT 
    de.emp_no,
    e.last_name,
    e.first_name,
	d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE 
	d.dept_no IN ('d007','d005');

-- 8. List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name).
SELECT 
    last_name,
    COUNT(*) AS frequency_count
FROM 
    employees
GROUP BY 
    last_name
ORDER BY 
    frequency_count DESC;
	