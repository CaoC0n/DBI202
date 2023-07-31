--2
select employee_id, first_name, last_name
from employees
where employee_id < 105

--3
select l.location_id, l.street_address, d.department_name, l.city
from locations l, departments d
where (l.location_id = d.location_id) 
and (d.department_name = 'IT' or d.department_name = 'Marketing')
order by l.location_id

--4
select CONCAT(e.first_name, ', ', last_name) full_name,
		j.job_title, d.department_name, e.salary
from employees e, departments d, jobs j
where (e.department_id = d.department_id) and (e.job_id = j.job_id)
and (j.job_id = 16) and (e.salary > 7000)
order by e.salary

--5
select d.department_id, d.department_name, MAX(e.salary) [MAX(salary)]
from employees e, departments d
where (e.department_id = d.department_id)
group by d.department_id, d.department_name
order by [MAX(salary)] desc

--6
select top 5 first_name, last_name
from employees
where employee_id in (
    select distinct manager_id
    from employees
    where manager_id is not null
)
order by first_name

--7
select c.country_id, c.country_name, COUNT(e.employee_id) [number of employees]
from employees e, countries c, locations l, departments d
where (e.department_id = d.department_id) and (c.country_id = l.country_id)
and (l.country_id = c.country_id) and (l.location_id = d.location_id)
group by c.country_id, c.country_name
having COUNT(e.employee_id) > 2
order by [number of employees] desc

--8



--9
drop proc Get_ManagerID
create proc Get_ManagerID
@id int,
@managerID int output
as 
begin 
	select @managerID = manager_id
	from employees
	where employee_id = @id
end 

declare @X int;
declare @in int = 101;
exec Get_ManagerID @in, @X output
select @X as ManagerID

--10
delete from dependents 
where dependents.employee_id in 
(select d.employee_id from dependents d, employees e
where (d.employee_id = e.employee_id) and e.first_name = 'Karen')
