--2
select * from Locations
where CountryID = 'US' or CountryID = 'CA'

--3
select EmployeeID, FirstName, LastName, Salary,
		Commission_pct, HireDate
from Employees
where (Salary between 4000 and 10000) and (Commission_pct > 0) 
and (FirstName like '%E%' or FirstName like '%e%')
order by HireDate desc

--4
select e.EmployeeID, e.FirstName, e.LastName, e.HireDate,
		j.JobID, j.JobTitle, d.DepartmentID, d.DepartmentName
from Employees e, Departments d, Jobs j
where (e.DepartmentID = d.DepartmentID) and (e.JobID = j.JobID)
and (YEAR(e.HireDate) = 2005) and (j.JobTitle = 'Stock Clerk')

--5
select j.JobID, j.JobTitle, COUNT(e.EmployeeID) NumberOfEmployees 
from Employees e, Jobs j
where (e.JobID = j.JobID)
group by j.JobID, j.JobTitle
order by NumberOfEmployees desc

--6
select * from Countries
where CountryID not in 
(
	select distinct l.CountryID 
	from Locations l, Departments d 
	where l.LocationID = d.LocationID
);

--7
select b.EmployeeID, b.FirstName, b.LastName, b.DepartmentID,
		c.DepartmentName, COUNT(a.EmployeeID) NumberOfSubordinates
from  Employees a
right join Employees b on b.EmployeeID = a.ManagerID
join Departments c on c.DepartmentID = b.DepartmentID
where b.EmployeeID in 
(
	select EmployeeID 
	from 
	(	
		(
		select e.EmployeeID from Employees e, Departments d 
		where e.DepartmentID = d.DepartmentID and d.DepartmentName = 'IT'
		)
	Union(
		select e.EmployeeID
		from Employees e , Employees e1, Departments d
		where (e.DepartmentID = d.DepartmentID) and (e.EmployeeID = e1.ManagerID)
	  )
    ) as subquery
)
group by b.EmployeeID, b.FirstName, b.LastName, b.DepartmentID, c.DepartmentName
order by NumberOfSubordinates desc


--8
drop proc proc2
create proc proc2
@fromDate Date,
@toDate Date,
@numberOfEmployees int output
as 
begin 
	set @numberOfEmployees = 
	(
		select COUNT(*)
		from Employees 
		where HireDate between @fromDate and @toDate
	)
end 

declare @x int
exec proc2 '2002-01-01', '2002-12-31', @x output
select @x as NumberOfEmployees 

--9
drop trigger Tr2
create trigger Tr2
on Departments for update
as
begin
	select de.DepartmentID, de.DepartmentName, de.ManagerID as OldManagerID, 
			i.ManagerID as NewManagerID 
	from inserted i, deleted de
	group by de.DepartmentID, de.DepartmentName, de.ManagerID, 
			  i.ManagerID
	order by de.DepartmentID DESC
end

update Departments
set ManagerID = 200
where DepartmentID in (110,80)

--10
delete from Locations
where LocationID in
(
	select LocationID from Locations 
	where LocationID not in (select LocationID from Departments)
)

select * from Locations
