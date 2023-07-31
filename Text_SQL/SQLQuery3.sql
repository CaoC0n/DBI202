use Northwind

/*
	join: ket noi du lieu cac bang dua tren cac truong co cung gia tri giua cac bang,
	thong thuong la PK va FK
*/

/*
	inner join: ket hop hai bang co moi quan he 1-1, 1-n voi nhau dua tren PK va FK.
	Cu 1 ban ghi chua PK bem 1 ket hop voi tat ca cac ban ghi chua FK ben nhieu de
	tao thanh cac ban ghi moi.
	Trong truong hop PK khong co FK tuong ung thi khong tao ban ghi
	select .......
	from tableA as a inner join tableB as b on a.PK = b.FK
	OR use default
	select .......
	from tableA as a join tableB as b on a.PK = b.FK

	note: thu tu cua tableA va tableB co the doi cho nhau
*/

-- Category with products
go

select a.CategoryID as 'PK', a.CategoryName, b.CategoryID as 'FK', b.ProductName, 
b.UnitPrice, b.UnitsInStock
from Categories as a inner join Products as b on a.CategoryID = b.CategoryID
order by a.CategoryID
go


-- multi join
select a.CategoryID as 'PK', a.CategoryName, b.CategoryID as 'FK', b.ProductName, 
b.UnitPrice, b.UnitsInStock, c.CompanyName, c.ContactName
from Categories as a inner join Products as b on a.CategoryID = b.CategoryID
	join Suppliers as c on b.SupplierID = c.SupplierID
	join [Order Details] as d on d.ProductID = b.ProductID
order by a.CategoryID
go

-- outer join
/*
	select...
	from tableA as a left|right|full outer join tableB as b on a.PK = b.FK

	outer join ket hop cac bang theo thu tu:
	left: ket hop bang ben trai voi ben phai
	right: phai voi trai:
	full: song phuong
	outer join = inner join + left/right co gia tri khoa ma ben kia khong co
	full outer join = left + right

*/
go
-----
select a.CategoryID as 'PK', a.CategoryName, b.CategoryID as 'FK', b.ProductName, 
b.UnitPrice, b.UnitsInStock
from Categories as a left outer join Products as b on a.CategoryID = b.CategoryID
order by a.CategoryID
go
-----
select a.CategoryID as 'PK', a.CategoryName, b.CategoryID as 'FK', b.ProductName, 
b.UnitPrice, b.UnitsInStock
from Categories as a right outer join Products as b on a.CategoryID = b.CategoryID
order by a.CategoryID
go

---- cross join: join giua hai bang khong dua tren quan he
--- VD: neu moi khach hang mua du danh sach san pham thi so lan ban ra la bao nhieu
select a.ContactName, b.ProductID, b.ProductName
from Customers as a, Products as b
order by a.ContactName
go

-- self join: ban chat la quan he 1-n trong cung 1 bang
-- boyce codd
select * from Employees
---
select Manager.EmployeeID as 'ManagerID', 
	   Manager.FirstName + ' ' + Manager.LastName as 'Manager Name',
	   Manager.Title,
	   Employee.EmployeeID as 'EmloyeeID',
	   Employee.FirstName + ' ' + Employee.LastName as 'Employee Name',
	   Employee.Title
from Employees as Manager inner join Employees as Employee 
on Manager.EmployeeID = Employee.ReportsTo
order by [Manager Name]