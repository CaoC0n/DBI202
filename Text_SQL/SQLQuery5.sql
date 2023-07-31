use Northwind

/*
subquery: câu lệnh sql có thể "lồng nhau": subquery --> câu lệnh bên trong chạy trước,
trả về kết quả cho câu lệnh bên ngoài
subquery có thể thực hiện trên tất cả các câu lệnh insert, update, delete, select
*/
select * from Categories
select * from Suppliers
select * from Products

insert into Products(ProductName, SupplierID, CategoryID, QuantityPerUnit, 
UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
values('new product',  (select SupplierID from Suppliers where CompanyName = 'Exotic Liquids'),
(select CategoryID from Categories where CategoryName = 'Beverages'), 'abc', 1, 1, 1, 1, 1)
go

--- xóa tất cả các catogory không có trên Product
delete from Categories 
where CategoryID not in (select distinct CategoryID from Products)
go

--- danh sách các Product đã bán được 
select * from Products
where ProductID in (select distinct ProductID from [Order Details])
go

-- danh sách manager
select * from Employees
where EmployeeID in (select distinct ReportsTo from Employees)
go

-- danh sách nhân viên
select * from Employees
where EmployeeID not in (select distinct ReportsTo from Employees)
go

-- danh sách các mặt hàng có price lớn nhất
select top 1 * from Products
order by UnitPrice desc
--
select * from Products
where UnitPrice = (select MAX(UnitPrice) from Products)
--
select c.CategoryID, c.CategoryName, --b.SupplierID, b.CompanyName
	COUNT(a.UnitsInStock) as NumberOfProductByCategory,
	SUM(a.UnitsInStock) as OfProductByCategory
from Products as a join Suppliers as b on a.SupplierID = b.SupplierID
				   join Categories as c on a.CategoryID = c.CategoryID
group by c.CategoryID, c.CategoryName -- b.SupplierID, b.CompanyName
order by COUNT(a.UnitsInStock) desc
go

-- danh sách các category có số lượng mặt hàng lớn nhất
select c.CategoryID, c.CategoryName, 
	COUNT(a.UnitsInStock) as NumberOfProductByCategory,
	SUM(a.UnitsInStock) as OfProductByCategory
from Products as a join Suppliers as b on a.SupplierID = b.SupplierID
				   join Categories as c on a.CategoryID = c.CategoryID
group by c.CategoryID, c.CategoryName 
having count(a.UnitsInStock) >= all(
		select COUNT(a.UnitsInStock)
		from Products as a join Categories as c on a.CategoryID = c.CategoryID
		group by c.CategoryID, c.CategoryName
)
order by COUNT(a.UnitsInStock) desc
