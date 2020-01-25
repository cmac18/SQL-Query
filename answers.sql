--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT DISTINCT Employee.emp_no, last_name, first_name, gender, salary
FROM Employee
INNER JOIN Salaries ON Employee.emp_no = Salaries.emp_no;

--List employees who were hired in 1986.
SELECT *
FROM Employee
WHERE hire_date >= '1986/01/01' and hire_date < '1987/01/01'
ORDER BY last_name ASC;


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT DISTINCT Department_Manager.dept_no, Departments.dept_name, Employee.emp_no, Employee.last_name, Employee.first_name, Department_Manager.from_date, Department_Manager.to_date
FROM Department_Manager, Departments, Employee
WHERE Department_Manager.dept_no = Departments.dept_no AND Department_Manager.emp_no = Employee.emp_no
ORDER BY Department_Manager.dept_no ASC;


--List the department of each employee with the following information:
--employee number, last name, first name, and department name.
SELECT DISTINCT Department_Employee.emp_no, last_name, first_name, Departments.dept_name
FROM Department_Employee, Employee, Departments
WHERE Department_Employee.emp_no = Employee.emp_no AND Department_Employee.dept_no= Departments.dept_no
ORDER BY Departments.dept_name, last_name;


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM Employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;



--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT DISTINCT Department_Employee.emp_no, last_name, first_name, Departments.dept_name
FROM Department_Employee, Employee, Departments
WHERE Department_Employee.emp_no = Employee.emp_no AND Department_Employee.dept_no= Departments.dept_no AND Departments.dept_name = 'Sales'
ORDER BY last_name, first_name;


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT DISTINCT Department_Employee.emp_no, last_name, first_name, Departments.dept_name
FROM Department_Employee, Employee, Departments
WHERE Department_Employee.emp_no = Employee.emp_no AND Department_Employee.dept_no= Departments.dept_no AND (dept_name = 'Sales' OR dept_name ='Development') 
ORDER BY dept_name, last_name;


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT Employee.last_name, COUNT(Employee.last_name) AS "Last Name Count"
FROM Employee
GROUP BY Employee.last_name
ORDER BY "Last Name Count" DESC;
