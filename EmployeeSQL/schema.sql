drop table employees;
drop table dept_manager;
drop table departments;
drop table dept_emp;
drop table titles;
drop table salaries;

create table departments(
	dept_no varchar(10) Primary Key,
	dept_name varchar(30) not null
);

create table titles(
	title_id varchar(10) Primary Key,
	title varchar(30) not null
);

create table employees(
	emp_no int Primary Key,
	emp_title_id varchar(10) not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar (30) not null,
	sex varchar(5),
	hire_date date not null,
	foreign key(emp_title_id) references titles(title_id)
);

create table dept_manager(
	dept_no varchar(10) not null,
	emp_no int not null,
	foreign key(dept_no) references departments(dept_no),
	foreign key(emp_no) references employees(emp_no),
	Primary Key(dept_no, emp_no)
);

create table dept_emp(
	emp_no int not null,
	dept_no varchar(10) not null,
	foreign key(dept_no) references departments(dept_no),
	foreign key(emp_no) references employees(emp_no),
	primary key(emp_no, dept_no)
);

create table salaries(
	emp_no int not null,
	salary money not null,
	foreign key(emp_no) references employees(emp_no),
	primary key(emp_no)
);

select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;