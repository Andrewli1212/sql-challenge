select * from salaries;
select * from employees;

--List the employee number, last name, first name, sex, and salary of each employee.
select last_name, first_name, sex, salary
from employees e 
join salaries s 
on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;
--where hire_date like '%1986%'

select * from dept_manager;
select * from departments;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.emp_no, last_name, first_name, dm.dept_no, dept_name
from dept_manager dm
join employees e
on e.emp_no = dm.emp_no
join departments d
on d.dept_no = dm.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select d.dept_no, e.emp_no, last_name, first_name, dept_name
from dept_emp de
join employees e
on de.emp_no = e.emp_no
join departments d
on d.dept_no = de.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
select e.emp_no, last_name, first_name, dept_name
from employees e, departments d, dept_emp de
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and dept_name = 'Sales';

select * from departments;
select * from employees;
select * from dept_emp;
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, last_name, first_name, dept_name
from employees e, departments d, dept_emp de
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and dept_name in ('Sales', 'Development');

-- join method
select e.emp_no, last_name, first_name, dept_name
from dept_emp de
join departments d
on d.dept_no = de.dept_no
join employees e
on e.emp_no = de.emp_no
and dept_name in ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as Frequency
from employees
group by last_name
order by Frequency desc;