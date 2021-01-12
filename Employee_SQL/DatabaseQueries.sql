select * from employee limit 5;
select count(*) from employee;

--#1
select e.emp_no, CONCAT(e.last_name,', ',e.first_name) as emp_name, e.sex, s.salary 
from Employee e, employee_salary s
where e.emp_no = s.emp_no;

--#2
select e.emp_no, CONCAT(e.last_name,', ',e.first_name) as emp_name, e.hire_date
from employee e
where e.hire_date like '%1986';

--#3
select 
de.dept_no, d.dept_name,
e.emp_no, CONCAT(e.last_name,', ',e.first_name) as emp_name,t.title
from Employee e
join employee_title t
	on e.emp_title = t.title_id
join department_employee de
	on e.emp_no = de.emp_no
join department d 
	on de.dept_no = d.dept_no;
	
--#4
select 
e.emp_no, CONCAT(e.last_name,', ',e.first_name) as emp_name, d.dept_name
from Employee e
join department_employee de
	on e.emp_no = de.emp_no
join department d
	on de.dept_no = d.dept_no
	order by dept_name, emp_name asc;
	
--#5
select first_name, last_name, sex from Employee 
where
first_name = 'Hercules' and last_name like 'B%';

--#6
select 
count(*)
from Employee e
join department_employee de
	on e.emp_no = de.emp_no
join (select * from Department where dept_name = 'Sales') d 
	on de.dept_no = d.dept_no;
	
select
e.emp_no, CONCAT(e.last_name,', ',e.first_name) as emp_name,d.dept_name
from Employee e
join department_employee de
	on e.emp_no = de.emp_no
join (select * from Department where dept_name = 'Sales') d 
	on de.dept_no = d.dept_no;


--#7
select 
e.emp_no, CONCAT(e.last_name,', ',e.first_name) as emp_name,d.dept_name
from Employee e
join department_employee de
	on e.emp_no = de.emp_no
join (select * from Department where dept_name in ('Sales','Development')) d 
	on de.dept_no = d.dept_no order by dept_name asc, emp_name asc;

--#8
select count(*) as name_count, last_name from employee
group by last_name order by name_count;



